(function( $ ) {
  var chat_stat = 0,
  chat_reconnect = 0,
  user_email,
  user_name,
  socket;
  var conf_domain,
  conf_server_type,
  conf_server,
  conf_port,
  conf_auto_login,
  conf_debug;
  var chat_record =new Object();
  var user_email=$.cookie('chat_email');
  var user_name=$.cookie('chat_user');   
  var xhr_mchat = $.get( "/main_chat/", function( main_chat ) {
    $( "body" ).append( main_chat );
  });
  $.when(xhr_mchat).done(function(r1) {
    main_set_conf();
    //Main chat title bar
    main_chat_status( i18n.disconnected, "offline" );
    function main_chat_status ( text , status ) {
      //TODO:
      //if was discconected, do reconnect
      if ( chat_reconnect == 1 ) {
        socket_reconnect();
      }
    }
    function main_chat_init () {
      //Just in case, close dialogs open
      $( ".ui-dialog-content" ).dialog( "close" );
      //Set accordion property in init
      // $( "#users" ).accordion( "refresh" );
      chat_stat = 1;
    }
    //Get all setting in config.js
    function main_set_conf () {
      try {
        if( !conf ) {
          alert( "error, conf not exist" );
          return true;
        }
        conf_domain = conf["domain"];
        conf_server_type = conf["server_type"];
        conf_server = conf["server"];
        conf_port = conf["port"];
        conf_auto_login = conf["auto_login"];
        conf_debug = conf["debug"];
      } catch( error ) {
        alert( error );
        return true;
      }
    }
    function socket_connect() {
      socket = io.connect( 'http://'+ conf_server , {
        port: conf_port,
        'connect timeout': 5000
      });
      // console.log(socket.toSource());
    }
    function socket_handle() {
      socket.on('connect_failed', function ( data ) {
        main_chat_disconnect();
      });
      socket.on('reconnect_failed', function ( data ) {
        main_chat_disconnect();
      });
      socket.on('error', function ( data ) {
        main_chat_disconnect();
      });
      socket.on('custom_error', function ( data ) {
        // alert(data.message);
        main_chat_shutdown();
      });
      socket.on('disconnect', function ( data ) {
        main_chat_disconnect();
      });
      socket.on('connect_timeout', function ( data ) {
        main_chat_disconnect();
      });
      socket.on('reconnecting', function ( data ) {
        //TODO: do something
        // Main chat title, add the loading bar and text
        //main_chat_title( 2 );
      });
      socket.on('connecting', function ( data ) {
        // Main chat title, add the loading bar and text
        // main_chat_title( 2 );
      });
      socket.on('connect', function ( data ) {
        console.log('connect');
      });
    }
    function socket_disconnect () {
      socket.disconnect();
      chat_reconnect = 1;
    }
    function socket_reconnect() {
      socket.socket.reconnect();
      chat_join();
      chat_reconnect = 0;
    }
    if(chat_stat==0)
    {
    if( user_email && user_name){
      // alert("enter if");
      main_chat_init();
      socket_connect();
      socket_handle();
    }
    }
    else{
      main_chat_init();
      socket_connect();
      socket_handle();
    }
    function signin() {
      // alert("sign_in");
      document.forms["sign_in"].submit();
      }

      jQuery('#signin').click(function(){     
      for (i=0;i<sign_in_required.length;i++) {
      var input = jQuery('#'+sign_in_required[i]);
      if (input.val() == "")  {   
        input.addClass("error_input_field");
        input.siblings('.labelError').show();         
      } else {    
        input.removeClass("error_input_field");
        input.siblings('.labelError').hide();        
      }
    }
    //Validate the e-mail.
    if($('#email_id').val() != ''){
    if (!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($('#email_id').val())) {
      $('#email_id').addClass("error_input_field");
      $('#email_id').siblings('.signup_labelError').text("Please enter valid email address");
      $('.signup_labelError').show();
      //email.val(emailerror);
    }
    else
    {
      $('#email_id').removeClass("error_input_field");
      $('#email_id').siblings('.signup_labelError').hide();
    }
    }
     if ($(":input").hasClass("error_input_field")){
    return false;
    }
    else{
      // alert("else");
      signin();
      return true;
      // $('form[name="sign_in"]').submit();      
    }
    });
  }).fail(function() {
    console.log('fail');
  }).always(function() {
  });
}( jQuery ));
