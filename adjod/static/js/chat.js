	var offset_val = 0;
	$(document).ready(function() {
		// alert("test");
		$.ajaxSetup({
			cache : false,
			timeout : 1000 * 60
		//set a global ajax timeout of a minute
		});

		doPoll(); // do the first poll

	});

	// For every 5 seconds get poll the message for the users. If no messages available, server will return the online users list
	function doPoll() {
		// alert("doPoll");
		$.get('/get/', function(data) {
			// alert(data);
			if (data.indexOf('ACTIVE:') != -1) {
				users_list = data.split('ACTIVE:')[1];
				build_chat_links(users_list);
			} 
			else {
				username = data.split(':')[0];
				message = data.split(':')[1];
				
				// update_chat_message(username, check_vchat_req(message, username));
				update_chat_message(username, message);
			}
			setTimeout(doPoll, 5000);
		});
	}
	
	function update_chat_message(username, message) {
		openChatBox(username, message, true);
	}

	// For the list of Online Users
	function build_chat_links(users_list) {
		var array_result =[];
		var array_result1=[];
		$.get('/get_product/',{users_list:users_list}, function(data) {				
			array_result=data.split(',');			
			for (i=0;i<array_result.length;i++)
			{		
				array_result1.push(array_result[i]);				
			}
			var text='';
			$('.product_list1 .spans').each(function(){
				var text=$(this).text().trim();
				if ($.inArray(text, array_result1)!= -1){
					// alert(text);
					$(this).parents('.product_name1').parents('.details').children('.additional_details').children().children().children('.checkcircle').show();					
				}
			});
			// var users = users_list.split(',');
			// var html_str = "";

			// for ( var i = 0; i < users.length; i++) {
			// 	html_str += "<a href=\"javascript:openChatBox('" + users[i]
			// 			+ "', '', false)\">" + users[i] + " </a> <br>";
			// }
			// $("#online_users").html(html_str);
		});
	}

	// Update the Chat Message to DB
	function server_update(message, to_user) {
		$.post("/post/", {
			message : message,
			to_user : to_user
		}, function(responseText) {
			// alert($("#content").html(responseText));
		}, "html");
	}

	// Open the chat box when someone pings (or) Users want to ping others
	function openChatBox(username, message, auto) {

		var div_name = "chat_" + username;
		var div_id = "#chat_" + username;

		var offset = $(div_id).chatbox("option", "offset");
		if (typeof $("#chat_" + username).html() == 'undefined') {
			$('body').append(
					"<div id = " + div_name + "></div>");
			$(div_id).chatbox(
					{
						id : div_name,
						user : username,
						title : '<a  target="_blank" href="/vchat_req?to=' + username + '"> chat with ' + username + '</a>',
						offset : offset_val,
						boxClosed : function(id) {
							offset_val -= 250;
						},
						messageSent : function(id, user, msg) {
							$("#log").append(id + " said: " + msg + "<br/>");
							server_update(msg, id.replace('chat_', ''));
							$(div_id).chatbox("option", "boxManager").addMsg('me', msg);
						}
					});
			offset_val += 250;
			$(div_id).chatbox("option", "boxManager").addMsg('', '');
			// alert("enter if");
			// alert("auto" + auto + "  in if");
		} else {
			// alert("enter else with not equal to auto");
			// alert("auto" + auto + "  in else");
			if (!auto) {
				$(div_id).chatbox("option", "boxManager").toggleBox();
			}
		}

		if (auto) {
			// alert("enter if with auto");
			// alert("auto" + auto + "  in last if");
			$(div_id).chatbox("option", "boxManager").addMsg(username, message);
		}
		// else{
		// 	alert("enter else");
		// 	alert("auto" + auto + "  in last else");
		// }
	}