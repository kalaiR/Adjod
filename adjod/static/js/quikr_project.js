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
    if($('#your_mobile_no').val().length > 9) {
        $('#your_mobile_no').val($('#your_mobile_no').val().slice(0, 9));
        return false;
    }
}
function updateCountdownTitle() {
    var remaining = 70 - $('.ad_title').val().length;
    $('#ad_title_count').text(remaining);
}
function updateCountdownDesc() {
	var remaining = 4000 - $('#your_description').val().length;
	$('#desc_count').text(remaining);
    		
}

//********** End Functions **********



( function( $ ) {
$( document ).ready(function() {
	
	// updateCountdown();
    // $('.ad_title').onkeypress(updateCountdown);
    // $('.ad_title').keyup(updateCountdown);
	
	//================= Fancy Box popup for choose category ======================
	$('.fancybox').fancybox({
		helpers : {
			overlay : {
				css : {
					'background' : 'rgba(127,127,127,0.85)'
				}
			}
		}
	});
	
	
	
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

//********** Start Ajax Function **********

var response_cache = {};
var response_cache1 = {};

function find_subcategory(category_id) {
  
  
  if (response_cache[category_id]) {

    $(".subcategory_list").html(response_cache[category_id]);
  } else {
   
    $.getJSON("/subcategory_for_category/", {category_id: category_id},
      function(ret, textStatus) {
        
        var options = '';
        for (var i in ret) {
          
          options += '<li><input type="hidden" name="subcategory" value="' + ret[i].id + '">'
            + ret[i].name + '</li>';
          
        }

        response_cache[category_id] = options;
        $(".subcategory_list").html(options);
      });
  }
}

function find_brand(sub_category_id) {
  
  
  if (response_cache1[sub_category_id]) {

    $(".brand_list").html(response_cache1[sub_category_id]);
  } else {
   
    $.getJSON("/brand_for_subcategory/", {sub_category_id: sub_category_id},
      function(ret, textStatus) {
        
        var options = '';
        for (var i in ret) {
          
          options += '<li><input type="hidden" name="brand" value="' + ret[i].id + '">'
            + ret[i].name + '</li>';
        }

        response_cache1[sub_category_id] = options;
        $(".brand_list").html(options);
      });
  }
}

//********** End Ajax Function **********

var response_cache = {};
function fill_localities(city_id) {
  if (response_cache[city_id]) {
    $("#id_locality").html(response_cache[city_id]);
  } else {
    $.getJSON("/localities_for_city/", {city_id: city_id},
      function(ret, textStatus) {
        var options = '';
        for (var i in ret) {
          options += '<option value="' + ret[i].id + '">'
            + ret[i].name + '</option>';
        }
        response_cache[city_id] = options;
        $("#id_locality").html(options);
      });
  }
  response_cache = {}
}

// ********** Validation Add Post **********
( function( $ ) {
$( document ).ready(function() {


    $('input[type=file]').simpleFilePreview({
    'buttonContent': '<i class="fa fa-plus-circle fa_small"></i>',
    'shiftLeft': '',
        'shiftRight': '',
        'removeContent': 'Remove'
     });

    //=====AD_TYPE label change====

    $('.ad_type_choice').change(function()
    {
    /* setting currently changed option value to option variable */
    var option = $(this).val();
    /* setting input box value to selected option value */
    if(option == "sell"){
         $('.seller_info_div').show();
         $('.buyer_info_div').hide();
    }
    else{

        $('.buyer_info_div').show();
        $('.seller_info_div').hide();
    }

  });

		var category = "Cars & Bikes";
    var category_id = '';
		var sub_category = "Cars";
		var brand = "Audi";
    var sub_category_id= "";
		// $('input[type=radio]').change(function() { 
			// var radio_name = this.name;
			// $('input[name='+radio_name+']').removeAttr('checked');
			// $(this).attr('checked','checked');
		// });
		
		//============= SIGN UP VALIDATION ===========
		$('#create').click(function(){
			//Email
     	 	if ($('#email_id').val() == '') {
          		$('#email_required').removeClass('hide_error_message');
          		$('#valid_signup_email_required').addClass('hide_error_message');
      		} else {
          		if (!$('#email_required').hasClass('hide_error_message'))
              		$('#email_required').addClass('hide_error_message');
              	
          		if( !isValidEmailAddress( $('#email_id').val() ) ) { 
              		$('#valid_signup_email_required').removeClass('hide_error_message');
          		} else {
              		if (!$('#valid_signup_email_required').hasClass('hide_error_message'))
                  		$('#valid_signup_email_required').addClass('hide_error_message');
          		}
      		};
      		//PASSWORD
      		if ($('#password').val() == '') {
          		$('#signup_password_required').removeClass('hide_error_message');
      		} else{
          		if (!$('#signup_password_required').hasClass('hide_error_message'))
              		$('#signup_password_required').addClass('hide_error_message');
     	 	};
		});
		
		//============= SIGN IN VALIDATION ===========
		$('#signin').click(function(){
			//EMAIL
			if ($('#emailid_signup').val() == '') {
          		$('#emailid_required').removeClass('hide_error_message');
      		} else{
          		if (!$('#emailid_required').hasClass('hide_error_message'))
              		$('#emailid_required').addClass('hide_error_message');
     	 	};
     	 	//PASSWORD
     	 	if ($('#password_signup').val() == '') {
          		$('#password_required').removeClass('hide_error_message');
      		} else{
          		if (!$('#password_required').hasClass('hide_error_message'))
              		$('#password_required').addClass('hide_error_message');
     	 	};
		});
	   
	   //============= POST AD VALIDATION ===========
	   $('#post').click(function(){
        var temp = 0;
	   		
	   		//Type of ad
	   		if ($('input[name=condition]').is(":checked")){
          		if (!$('#condition_required').hasClass('hide_error_message'))
              		$('#condition_required').addClass('hide_error_message');
      		} else{
          		$('#condition_required').removeClass('hide_error_message');
              temp = 1;
      		};
      		
      		//Category
      		if ($('#category').val() == '') {
          		$('#category_required').removeClass('hide_error_message');
              temp = 1;
      		} else{
          		if (!$('#category_required').hasClass('hide_error_message'))
              		$('#category_required').addClass('hide_error_message');
     	 	};
	   		
	   		//Ad title
      		if ($('#ad_title').val() == '') {
      			$('#ad_title_required').removeClass('hide_error_message');
            temp = 1;
      		} else{
          		if (!$('#ad_title_required').hasClass('hide_error_message'))
              		$('#ad_title_required').addClass('hide_error_message');
   	  		};

          //Price
          if ($('#your_price').val() == '') {
            $('#price_required').removeClass('hide_error_message');
            $('#price_required').css('display','inline');
            temp = 1;
          } else{
              if (!$('#price_required').hasClass('hide_error_message'))
                  $('#price_required').addClass('hide_error_message');
                  $('#year_required').css('display','none');
          };
          
          //Year
          if ($('#your_year').val() == '') {
            $('#year_required').removeClass('hide_error_message');
            $('#year_required').css('display','inline');
            temp = 1;
          } else{
              if (!$('#year_required').hasClass('hide_error_message'))
                  $('#year_required').addClass('hide_error_message');
                  $('#year_required').css('display','none');
          };
   	  		
   	  		//Description
   	  		if ($('#your_description').val() == '') {
          		$('#desc_required').removeClass('hide_error_message');
              temp = 1;
      		} else{
          		if (!$('#desc_required').hasClass('hide_error_message'))
              		$('#desc_required').addClass('hide_error_message');
   	  		};
   	  		
   	  		//You are
	   		if ($('input[name=you_are_radio]').is(":checked")){
          		if (!$('#you_are_required').hasClass('hide_error_message'))
              		$('#you_are_required').addClass('hide_error_message');
      		} else{
          		$('#you_are_required').removeClass('hide_error_message');
              temp = 1;
      		};
      		
      		//email
      		if($('#your_email').val() != ''){
      			 if( !isValidEmailAddress( $('#your_email').val() ) ) { 
              		$('#valid_email_required').removeClass('hide_error_message');
                  temp = 1;
          		 } else {
              		if (!$('#valid_email_required').hasClass('hide_error_message'))
                  		$('#valid_email_required').addClass('hide_error_message');
          		}
      		}
          if(temp == 0)
            $('#post_ad').submit();
   		});

  //============= EX POST AD VALIDATION ===========
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
          $('#valid_email_required').addClass('hide_error_message');
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
  //============= END EX POST AD VALIDATION ===========
  	
  	//============= CHOOSE PAYMENT METHOD DROPDOWN ===========
 	$( ".select_payment" ).change(function () {
 		var selected_option = $( ".select_payment option:selected" ).val();
 		$('#payment_method').html(selected_option);
	});
	
	//============= CHOOSE CITY DROPDOWN ===========
	$( ".select_city" ).change(function () {
 		var selected_option = $( ".select_city option:selected" ).val();
 		$('#select_city').html(selected_option);

	});

  //============= CHOOSE LANGUAGE DROPDOWN ===========
  $( ".custom_select_value_act" ).change(function () {
    
    var selected_option = $( ".custom_select_value_act option:selected" ).val();
    
    $('#custom_select_value_act').html(selected_option);
    
    
  });

  //============= CHOOSE POST CITY DROPDOWN ===========
  $( ".select_post_city" ).change(function () {
    
    var selected_option = $( ".select_post_city option:selected" ).text();
    $('#select_post_city').html(selected_option);
    
    fill_localities($(this).val());
  });
  
  //============= CHOOSE POST LOCALITY DROPDOWN ===========
  $( ".select_post_locality" ).change(function () {
    var selected_option = $( ".select_post_locality option:selected" ).text();
    $('#select_post_locality').html(selected_option);
  });
  	
  	//============= CHOOSE CATEGORY POPUP ===========
  	//CATEGORY
  	$('.category_list > li').click(function () {
      
  		$( ".category_list > li" ).each(function( index ) {
			$( this ).removeClass('orange_text');
		});
  		$(this).addClass('orange_text');
  		category = $(this).text();
      category_id=$('input[type="hidden"]', this).val();
      
      find_subcategory(category_id);
      $('.brand_list').hide();
  	});

   
	
	//SUB CATEGORY

	$(".subcategory_list").on("click", ">li", function(){

  		$( ".subcategory_list > li" ).each(function( index ) {
			$( this ).removeClass('orange_text');
		});
		
  		//$(this).addClass('orange_text');
  		sub_category = $(this).text();
      
      sub_category_id = $('input[type="hidden"]', this).val();

      $('#brand').html(sub_category);
      find_brand(sub_category_id);
  		$('.brand_list').show();
  		$('#brand').show();
  	});
  
  	
  	//BRAND
  	$('.brand_list').on("click", ">li", function(){
      
  		$( ".brand_list > li" ).each(function( index ) {
			$( this ).removeClass('orange_text');
		});
  		$(this).addClass('orange_text');
  		brand = $(this).text();
      brand_id = $('input[type="hidden"]', this).val();
  		$('.fancybox-close').click();
      alert(category_id);
      alert(sub_category_id);
      alert(brand_id);
      $('#category_name').val(category_id);
      $('#subcategory_name').val(sub_category_id);
      $('#brand_name').val(brand_id);
  		$('#category').val(category + " » " + sub_category + " » " + brand);
  		$('.choose_button').text('change');
  	});
  //============= END CHOOSE CATEGORY POPUP ===========

 

});

} )( jQuery );