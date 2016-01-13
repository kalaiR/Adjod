$( document ).ready(function() {
	
	// Social auth share button actions for mobile
    $('.share_dropdownmenu li i').hide();
    $('.share_dropdown').click(function(){
        $(".share_dropdownmenu li i").toggle();
    });

    $('.option_value').hide();
    $('.mobile_caret').click(function(){
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

function urgent_mobile_center_align(){
      var height=$('.urgentad_popup_mobile').height();
      var width=$('.urgentad_popup_mobile').width();
      $('.urgentad_popup_mobile').css({'margin-top': -height / 2 + "px", 'margin-left': -width / 2 + "px"});
}
function premium_mobile_center_align(){
      var height=$('.premium_popup_mobile').height();
      var width=$('.premium_popup_mobile').width();
      $('.premium_popup_mobile').css({'margin-top': -height / 2 + "px", 'margin-left': -width / 2 + "px"});
}
function premium_urgent_mobile_center_align(){
      var height=$('.premium_urgent_mobile').height();
      var width=$('.premium_urgent_mobile').width();
      $('.premium_urgent_mobile').css({'margin-top': -height / 2 + "px", 'margin-left': -width / 2 + "px"});
}

function subcategory_mobile_center_align(){
      var height=$('.subcategory_mobile').height();
      var width=$('.subcategory_mobile').width();
      $('.subcategory_mobile').css({'margin-top': -height / 2 + "px", 'margin-left': -width / 2 + "px"});
}

function brand_mobile_center_align(){
      var height=$('.brand_mobile').height();
      var width=$('.brand_mobile').width();
      $('.brand_mobile').css({'margin-top': -height / 2 + "px", 'margin-left': -width / 2 + "px"});
}

    urgent_mobile_center_align();
    premium_mobile_center_align();
    premium_urgent_mobile_center_align();
    subcategory_mobile_center_align();
    brand_mobile_center_align();

    $('.cancel_btn').click(function(){
        $('.popup_fade').hide();
        $('.urgentad_popup_mobile,.premium_popup_mobile,.premium_urgent_mobile').hide();
        document.body.style.overflow = 'auto';
    });

    $('.urgent_ad_mbl').click(function(){
        urgent_mobile_center_align();
        $('.popup_fade').show();
        $('.urgentad_popup_mobile, .popup_close').show();
        document.body.style.overflow = 'hidden';
    });
    
    $('.premium_ad_mbl').click(function(){
        premium_mobile_center_align();
        $('.popup_fade').show();
        $('.premium_popup_mobile, .popup_close1').show();
        document.body.style.overflow = 'hidden';
    });
    
    $('.premium_urgent_mbl').click(function(){
        premium_urgent_mobile_center_align();
        $('.popup_fade').show();
        $('.premium_urgent_mobile, .popup_close2').show();
        document.body.style.overflow = 'hidden';
    });

    
    $(".category_list").click(function () {
        var effect = 'slide';
        var options = { direction: 'right' };
        var duration = 500;
        $('.subcategory_mobile').toggle(effect, options, duration);
    });

    $(".subcategory_list").click(function () {
        var effect = 'slide';
        var options = { direction: 'right' };
        var duration = 500;
        $('.brand_mobile').toggle(effect, options, duration);
    });

    $(".brand_previous ,.mbl_left").click(function () {
        $('.subcategory_list').show();
        $('.brand_mobile').hide();
    });

    $(".subcategory_previous ,.mbl_left").click(function () {
        $('.category_list_div').show();
        $('.subcategory_list_div').hide();
    });
    

});