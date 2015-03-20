( function( $ ) {
$( document ).ready(function() {
$('#cssmenu > ul > li > a').click(function() {
    $('#cssmenu li').removeClass('active');
    $(this).closest('li').addClass('active');	
    var checkElement = $(this).next();
    if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
        $(this).closest('li').removeClass('active');
        checkElement.slideUp('normal');
    }
    if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
        $('#cssmenu ul ul:visible').slideUp('normal');
        checkElement.slideDown('normal');
    }
    if($(this).closest('li').find('ul').children().length == 0) {
        return true;
    } else {
        return false;	
    }		
  });
});
} )( jQuery );




( function( $ ) {
$( document ).ready(function() {
$('.css_menu > ul > li > a').click(function() {
    $('.css_menu li').removeClass('active');
    $(this).closest('li').addClass('active');	
    var checkElement = $(this).next();
    if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
        $(this).closest('li').removeClass('active');
        checkElement.slideUp('normal');
    }
    if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
        $('.css_menu ul ul:visible').slideUp('normal');
        checkElement.slideDown('normal');
    }
    if($(this).closest('li').find('ul').children().length == 0) {
        return true;
    } else {
        return false;	
    }		
});
});
} )( jQuery );



//********** Functions **********
function isValidEmailAddress(emailAddress) {
    var pattern = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
    return pattern.test(emailAddress);
};

function isValidMobileNo(){
    if($('#mobile_no').val().length > 9) {
        $('#mobile_no').val($('#mobile_no').val().slice(0, 9));
        return false;
    }
}
//********** End Functions **********



( function( $ ) {
$( document ).ready(function() {

    $('#highlightchk1').click(function(){
        if($("#highlightchk1").is(':checked')) {
            $('#premium_ad_hidden_part1').show();
            // $('#premium_ad_hidden_part2').hide();
            // $('#premium_ad_hidden_part3').hide();
        }
        else 
            $('#premium_ad_hidden_part1').hide();
    })

    $('#highlightchk2').click(function(){
        if($("#highlightchk2").is(':checked')) {
            $('#premium_ad_hidden_part2').show();
            // $('#premium_ad_hidden_part1').hide();
            // $('#premium_ad_hidden_part3').hide();
        }
        else
            $('#premium_ad_hidden_part2').hide();
    })

    $('#highlightchk3').click(function(){
        if($("#highlightchk3").is(':checked')) {
            $('#premium_ad_hidden_part3').show();
            // $('#premium_ad_hidden_part1').hide();
            // $('#premium_ad_hidden_part2').hide();
            // $('#premium_ad_hidden_part1').prop('checked', false);
            // $('#premium_ad_hidden_part2').prop('checked', false);
        }
        else
            $('#premium_ad_hidden_part3').hide();
    })

});
} )( jQuery );



//********** Autocomplete and Datepicker **********
var your_city     =   ["Chennai","Mumbai","Delhi","Kolkata","ahmedabad","Nagpur","Aarani","Abohar","Achalpur","Adilabad","Adityapur"];
var your_locality =   ["Chennai","Mumbai","Delhi","Kolkata","ahmedabad","Nagpur","Aarani","Abohar","Achalpur","Adilabad","Adityapur"];
var your_brand    =   ["Honda","Hyundai","Mahindra","Maruti Suzuki","Tata"," Toyota","Aston Martin","Audi","Bentley","BMW","Chevrolet"];
var your_model    =   ["Accord","Amaze","Brio","City ZX","Tata","Jazz","Mobilio","civic","New City","Elantra","i10"];
var year          =   ["2015","2014","2013","2012","2011","2010","2009","2008","2007","2006","2005"];
var color         =   ["Beige","Black","Golden","Green","Orange","Purple","Red","Silver","White","Yellow","Other"];
var fuel_type     =   ["CNG","Diesel","Electric","Hybrid","LPG","Petrol"];
var no_of_owners  =   ["One","Two","Three"];

( function( $ ) {
  $( document ).ready(function() {

    $("#autocomplete_city").autocomplete({
        source: your_city
    });

    $("#autocomplete_locality").autocomplete({
        source: your_city
    });

    $('#autocomplete_brand').autocomplete({
        source: your_brand
    });

    $('#autocomplete_model').autocomplete({
        source: your_model
    });

    $('#autocomplete_year').autocomplete({
        source: year
    });

    $('#autocomplete_color').autocomplete({
        source: color
    });

    $('#autocomplete_fuel_type').autocomplete({
        source: fuel_type
    });

    $('#autocomplete_owners').autocomplete({
        source: no_of_owners
    });

    $( "#datepicker" ).datepicker({
        showOn: "button",
        buttonImage: "img/Calendar-128.png",
        buttonImageOnly: true,
        minDate: 0,
        maxDate: "+1Y",
        dateFormat: "dd/mm/yy",
    });

});
} )( jQuery );
//********** End Autocomplete and Datepicker **********



// ********** Validation Add Post **********
( function( $ ) {
$( document ).ready(function() {

  $('#post_button').click(function(){

      //Ad type
      if ($('input[name=Ad_Type]').is(":checked")){
          if (!$('#ad_type_required').hasClass('hide_error_message'))
              $('#ad_type_required').addClass('hide_error_message');
      } else{
          $('#ad_type_required').removeClass('hide_error_message');
      };

      //ad title
      if ($('#ad_title').val() == '') {
          $('#ad_title_required').removeClass('hide_error_message');
      } else{
          if (!$('#ad_title_required').hasClass('hide_error_message'))
              $('#ad_title_required').addClass('hide_error_message');
      };

      //condition
      if ($('input[name=condition]').is(":checked")){
          if (!$('#condition_required').hasClass('hide_error_message'))
              $('#condition_required').addClass('hide_error_message');
      } else{
          $('#condition_required').removeClass('hide_error_message');
      };

      //Brand Name
      if ($('#autocomplete_brand').val() == '') {
          $('#brand_name_required').removeClass('hide_error_message');
      } else{
          if (!$('#brand_name_required').hasClass('hide_error_message'))
              $('#brand_name_required').addClass('hide_error_message');
      };

      //Model Name
      if ($('#autocomplete_model').val() == '') {
          $('#model_name_required').removeClass('hide_error_message');
      } else{
          if (!$('#model_name_required').hasClass('hide_error_message'))
              $('#model_name_required').addClass('hide_error_message');
      };

      //Year
      if ($('#autocomplete_year').val() == '') {
          $('#year_required').removeClass('hide_error_message');
      } else{
          if (!$('#year_required').hasClass('hide_error_message'))
              $('#year_required').addClass('hide_error_message');
      };

      //Kms Driven
      if ($('#kms_driven').val() == '') {
          $('#kms_driven_required').removeClass('hide_error_message');
      } else{
          if (!$('#kms_driven_required').hasClass('hide_error_message'))
              $('#kms_driven_required').addClass('hide_error_message');
      };

      //City
      if ($('#autocomplete_city').val() == '') {
          $('#city_required').removeClass('hide_error_message');
      } else{
          if (!$('#city_required').hasClass('hide_error_message'))
              $('#city_required').addClass('hide_error_message');
      };

      //Locality
      if ($('#autocomplete_locality').val() == '') {
          $('#locality_required').removeClass('hide_error_message');
      } else{
          if (!$('#locality_required').hasClass('hide_error_message'))
              $('#locality_required').addClass('hide_error_message');
      };

      //Description
      if ($('#description').val() == '') {
          $('#description_required').removeClass('hide_error_message');
      } else{
          if (!$('#description_required').hasClass('hide_error_message'))
              $('#description_required').addClass('hide_error_message');
      };

      //You Are
      if ($('input[name=you_are]').is(":checked")){
          if (!$('#you_are_required').hasClass('hide_error_message'))
              $('#you_are_required').addClass('hide_error_message');
      } else{
          $('#you_are_required').removeClass('hide_error_message');
      };

      //Email
      if ($('#email').val() == '') {
          $('#email_required').removeClass('hide_error_message');
      } else {
          if (!$('#email_required').hasClass('hide_error_message'))
              $('#email_required').addClass('hide_error_message');
          if( !isValidEmailAddress( $('#email').val() ) ) { 
              $('#valid_email_required').removeClass('hide_error_message');
          } else {
              if (!$('#valid_email_required').hasClass('hide_error_message'))
                  $('#valid_email_required').addClass('hide_error_message');
          }
      };

  });
  // ********** End Validation Add Post **********

});
} )( jQuery );