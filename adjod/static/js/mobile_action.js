$( document ).ready(function() {
	
	// Social auth share button actions for mobile
    $('.share_dropdownmenu li i').hide();
    $('.share_dropdown').click(function(){
        $(".share_dropdownmenu li i").toggle();
    });

    $('.option_value').hide();
    $('.footer_lang').click(function(){
      	$(".option_value").slideUp();
    });

    $('.alert_btn').click(function(){
	    $('.popup_fade').show();
	    $('.free_content, .close_btn').show();
	    document.body.style.overflow = 'hidden';
    });

    $('.closemobile_btn').click(function(){
      	$('.popup_fade, .free_content').hide();    
    });
});