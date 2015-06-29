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
			} else {
				username = data.split(':')[0];
				message = data.split(':')[1];
				
				update_chat_message(username, check_vchat_req(message, username))
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
		$.get('/get_product/',{users_list:users_list}, function(data) {		
			 data=data + ',';
			 array_result=data.split(',');
			 alert(array_result);
					
			// alert(array_result[0]);
			// for (i=0;i<array_result.length;i++)
			// {
			// 	alert(array_result[i]);
			// }

			// array=['hello',"2"];
			// if (jQuery.inArray('hello', array)!== -1){
			// alert('2');
			// }

		   	// if ($.inArray("samsung mobile 500 series", array_result)!= -1){
		   	// 	alert('samsung mobile 500 series');
		   	// }
		    
			//    var text='';
			// $('.product_list1 .spans').each(function() {
			// 		text=($(this).text()).trim();		
			// 		alert(text);		
			// 		var found = $.inArray(text, array_result);
			// 		alert(found);				   				
			
			var text='';
			$('.product_list1 .spans').each(function(){
				var text=($(this).text()).trim();
				if ($.inArray(text, array_result)!= -1){
					alert(text);
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