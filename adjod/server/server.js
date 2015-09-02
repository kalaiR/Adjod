var port = process.env.PORT || 3000;
server   = require('http').createServer(),
io       = require('socket.io').listen(server),
crypto   = require('crypto'),
users = {}, socks = {};

var mysql = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'root',
  port     : '3306',
});

connection.connect(function(err) {
  // connected! (unless `err` is set)
  console.log('db connected');
});


// Avatar config
//var avatar_url = "http://cdn.libravatar.org/avatar/";
var avatar_url = "http://www.gravatar.com/avatar/";
var avatar_404 = ['mm', 'identicon', 'monsterid', 'wavatar', 'retro'];

function Uid() { this.id = ++Uid.lastid; }

Uid.lastid = 0;

//Handle users
io.sockets.on('connection', function (socket) {

	// Event received by new user
	socket.on('join', function (recv, fn) {
		console.log("join function")
		console.log("recv"+JSON.stringify(recv));
		// if (!recv.user) {
			// socket.emit('custom_error', { message: 'User not found or invalid' });
			// return;
		// }

		// The user is already logged
		if (users[recv.user]) {
			socket.emit('custom_error', { message: 'The user '+ recv.user +' is already logged' });
			return;
		}

		// If there is users online, send the list of them
		if (Object.keys(users).length > 0)
			socket.emit('chat', JSON.stringify( { 'action': 'usrlist', 'user': users } ));

		// Set new uid
		uid = new Uid();
		socket.user = recv.user;
		my_avatar = get_avatar_url(socket.user);

		// Add the new data user
		users[socket.user] = {'uid': Uid.lastid, 'user': socket.user, 'name': recv.name, 'status': 'online', 'avatar': my_avatar}
		socks[socket.user] = {'socket': socket}

		// Send to me my own data to get my avatar for example, usefull in future for db things
		//socket.emit('chat', JSON.stringify( { 'action': 'update_settings', 'data': users[socket.user] } ));

		// Send new user is connected to everyone
		socket.broadcast.emit('chat', JSON.stringify( {'action': 'newuser', 'user': users[socket.user]} ));

		if (typeof fn !== 'undefined')
			fn(JSON.stringify( {'login': 'successful', 'my_settings': users[socket.user]} ));
	});

	// Event received when user want change his status
	socket.on('user_status', function (recv) {
		if (users[socket.user]) {
			users[socket.user].status = recv.status;
			socket.broadcast.emit('chat', JSON.stringify( {'action': 'user_status', 'user': users[socket.user]} ));
		}
	});

	// Event received when user is typing
	socket.on('user_typing', function (recv) {
		var id = socks[recv.user].socket.id;
		io.sockets.socket(id).emit('chat', JSON.stringify( {'action': 'user_typing', 'data': users[socket.user]} ));
	});

	// Event received when user send message to another
	socket.on('message', function (recv, fn) {
		console.log("message function")
		console.log("recv"+JSON.stringify(recv));
		var d = new Date();
		var id = socks[recv.user].socket.id;
		var msg = {'msg': recv.msg, 'user': users[socket.user]};
		console.log("msg"+JSON.stringify(msg));
		if (typeof fn !== 'undefined')
			fn(JSON.stringify( {'ack': 'true', 'date': d} ));
		io.sockets.socket(id).emit('chat', JSON.stringify( {'action': 'message', 'data': msg, 'date': d} ));
	});

	// Event received when user has disconnected
	socket.on('disconnect', function () {
		if (users[socket.user]) {
			socket.broadcast.emit('chat', JSON.stringify( {'action': 'disconnect', 'user': users[socket.user]} ));
			delete users[socket.user];
			delete socks[socket.user];
		}
	});
});

//Listen to the server port
server.listen(port, function () {
  var addr = server.address();
  console.log('server js file');
  console.log('jqchat listening on ' + addr.address + addr.port);
});

// Generate url for avatar purpose
function get_avatar_url(user) {
	var mymd5 = crypto.createHash('md5').update(user);
	var rand = random(0, avatar_404.length);
	var end = '?d=' + avatar_404[rand];
	return avatar_url + mymd5.digest("hex") + "/" + end
}

function random(low, high) {
    return Math.floor(Math.random() * (high - low) + low);
}
