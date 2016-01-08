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
  database : 'adjod',
});

connection.connect(function(err){
  if(err){
    console.log('Error connecting to Db');
    return;
  }
  console.log('Connection established');
});

// var sender_message=[], receiver_message=[];

var chat_message = [];

// connection.end(function(err) {
//   // The connection is terminated gracefully
//   // Ensures all previously enqueued queries are still
//   // before sending a COM_QUIT packet to the MySQL server.
// });


// Avatar config
//var avatar_url = "http://cdn.libravatar.org/avatar/";
var avatar_url = "http://www.gravatar.com/avatar/";
var avatar_404 = ['mm', 'identicon', 'monsterid', 'wavatar', 'retro'];

// function Uid() { this.id = ++Uid.lastid; }

// Uid.lastid = 0;

//Handle users
io.sockets.on('connection', function (socket) {
	console.log("function start socket"+socket);
	console.log("connection");

	// Event received by new user
	socket.on('join', function (recv, fn) {
		console.log("join function");
		console.log("recv"+JSON.stringify(recv));
		// if (!recv.user) {
			// socket.emit('custom_error', { message: 'User not found or invalid' });
			// return;
		// }

		//mysql code
		console.log(recv.name);
		
		var message = 'SELECT * FROM chat_chatmessage where sender="' +  recv.name + '" OR receiver="' +  recv.name + '"';
		console.log(message);
		connection.query(message, function(err,rows){
		  if(err) 
		  	console.log('Error received from Db'+err);
		  else{
		  	 console.log('Data received from Db:\n');
		  	// console.log(rows);
		  	chat_message=rows;
		  }	 
		});
		console.log(chat_message);
		// var receiver_querystring = 'SELECT * FROM chat_chatmessage where receiver="' +  recv.name + '"';
		// // console.log(receiver_querystring);
		// connection.query(receiver_querystring, function(err,rows){
		//   if(err) 
		//   	console.log('Error received from Db'+err);
		//   else{
		//   	 // console.log('Data received from Db:\n');
		//   	// console.log(rows);
		//   	receiver_message=rows;
		//   }	 
		// });

		// console.log("sender_message"+sender_message);
		// console.log("receiver_message"+receiver_message);

		// The user is already logged
		// if (users[recv.user]) {
		// 	socket.emit('custom_error', { message: 'The user '+ recv.user +' is already logged' });
		// 	return;
		// }


		// If there is users online, send the list of them
		if (Object.keys(users).length > 0)
			// socket.emit('chat', JSON.stringify( { 'action': 'usrlist', 'user': users,'sender_message':sender_message,'receiver_message':receiver_message } ));
			{
				console.log("users"+JSON.stringify(users));
				socket.emit('chat', JSON.stringify( { 'action': 'usrlist', 'user': users,'chat_message':chat_message} ));
			}
			

		// Set new uid
		// uid = new Uid();
		socket.user = recv.user;
		my_avatar = get_avatar_url(socket.user);
		socket.product =recv.data;

		// Add the new data user
		users[socket.user] = {'uid': recv.uid, 'user': socket.user, 'name': recv.name, 'status': 'online', 'avatar': my_avatar, 'product': socket.product,'chat_message':chat_message}
		socks[socket.user] = {'socket': socket}
		// console.log("users[socket.user]" + users[socket.user])
		// console.log("socks[socket.user]" + socks[socket.user])

		// Send to me my own data to get my avatar for example, usefull in future for db things
		// socket.emit('chat', JSON.stringify( { 'action': 'update_settings', 'data': users[socket.user] } ));

		

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
		console.log("user typing function");
		// console.log("user typing received"+ JSON.stringify(recv));
	
		var id = socks[recv.user].socket.id;
		console.log(" user typing id result" + id)
		io.sockets.socket(id).emit('chat', JSON.stringify( {'action': 'user_typing', 'data': users[socket.user]} ));
	});

	// Event received when user send message to another
	socket.on('message', function (recv, fn) {
		console.log("message function")
		// console.log("recv"+JSON.stringify(recv));
		// console.log("user"+users[socket.user]);
		var d = new Date();
		// console.log("date"+d);
		var id = socks[recv.user].socket.id;
		var msg = {'msg': recv.msg, 'user': users[socket.user], 'product_id': recv.product_id, 'product_title': recv.product_title};
		// console.log("msg"+JSON.stringify(msg));
		if (typeof fn !== 'undefined')
			fn(JSON.stringify( {'ack': 'true', 'date': d} ));
		io.sockets.socket(id).emit('chat', JSON.stringify( {'action': 'message', 'data': msg, 'date': d} ));
	});

	// Event received when user has disconnected
	socket.on('forceDisconnect', function () {
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
