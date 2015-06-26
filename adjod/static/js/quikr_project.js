( function( $ ) {
		$( document ).ready(function() {
		      $('input[type=text], textarea').focus(function() {
		      if( this.value == this.defaultValue ) {
		       this.value = "";
		      }
		      }).blur(function() {
		       if( !this.value.length ) {
		      this.value = this.defaultValue;
		      }
		    });  

          // setTimer();

    // $('.hp_ad ul li:first').show();
    $('.banner_ad ul li:first').addClass('banneractive');
    toggleSlide = function() {
    var active = $(".banner_ad ul li.banneractive");
    var next   = active.next();
    if (next.length === 0) {
        next = $('.banner_ad ul li:first');
    }
    
    active.removeClass('banneractive');
    next.addClass('banneractive');
}
setInterval(toggleSlide, 4000);

		});
} )( jQuery );  




// function setTimer() {
//     //Call the gallery function to run the slideshow, 7000 = change to next image after 7 seconds
    
//     setInterval('changeImage()', 7000);
// }

// function changeImage() {  
//     // alert("changeImage");
//     $.getJSON("/getImages/",
//     function(json) {  
//             // alert(json);
//             $('#bannerimage').attr('src',json);


//             // for (j = json.length - 1; j >= 0; j--) {
//             //     // alert("changeImage function");
//             //     imagID = "addImg" + (j + 1); 
//             //     // alert(imagID);   
//             //     alert(json[j]);
//             //     document.getElementById(imagID).src = json[j];            
//             //     // $('#imagID').html(json[j]);
//             // }        
//         }
//     );
// }


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
	var remaining = 500 - $('#your_description').val().length;
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
// var your_city     =   ["Chennai","Mumbai","Delhi","Kolkata","ahmedabad","Nagpur","Aarani","Abohar","Achalpur","Adilabad","Adityapur"];
// var your_locality =   ["Chennai","Mumbai","Delhi","Kolkata","ahmedabad","Nagpur","Aarani","Abohar","Achalpur","Adilabad","Adityapur"];
// var your_brand    =   ["Honda","Hyundai","Mahindra","Maruti Suzuki","Tata"," Toyota","Aston Martin","Audi","Bentley","BMW","Chevrolet"];
// var your_model    =   ["Accord","Amaze","Brio","City ZX","Tata","Jazz","Mobilio","civic","New City","Elantra","i10"];
// var year          =   ["2015","2014","2013","2012","2011","2010","2009","2008","2007","2006","2005"];
// var color         =   ["Beige","Black","Golden","Green","Orange","Purple","Red","Silver","White","Yellow","Other"];
// var fuel_type     =   ["CNG","Diesel","Electric","Hybrid","LPG","Petrol"];
// var no_of_owners  =   ["One","Two","Three"];

var your_city     =   '';
var your_locality =   '';
var your_brand    =   '';
var your_model    =   '';
var year          =   '';
var color         =   '';
var fuel_type     =   '';
var no_of_owners  =   '';

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
var response_cache2 = {};
var response_cache3 = {};
var response_cache4 = {};
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


function fill_localities(city_id) {
  if (response_cache2[city_id]) {
    $("#id_locality").html(response_cache2[city_id]);
  } else {
    $.getJSON("/localities_for_city/", {city_id: city_id},
      function(ret, textStatus) {
        var options = '';
        for (var i in ret) {
          options += '<option value="' + ret[i].id + '">'
            + ret[i].name + '</option>';
        }
        response_cache2[city_id] = options;
        $("#id_locality").html(options);
      });
  }
  response_cache2 = {}
}

function fill_subcategories(category_id) {
  if (response_cache3[category_id]) {

    $("#id_subcategory").html(response_cache3[category_id]);
  } else {
    
    $.getJSON("/subcategory_for_category/", {category_id: category_id},
      function(ret, textStatus) {
        var options = '';
        for (var i in ret) {
          options += '<option value="' + ret[i].id + '">'
            + ret[i].name + '</option>';
        }
        response_cache3[category_id] = options;
        
        $("#id_subcategory").html(options);
      });
  }
  response_cache3 = {}
}

function fill_brands(sub_category_id) {
  if (response_cache4[sub_category_id]) {

    $("#id_brand").html(response_cache4[sub_category_id]);
  } else {
    alert(sub_category_id);
    $.getJSON("/brand_for_subcategory/", {sub_category_id: sub_category_id},
      function(ret, textStatus) {
        var options = '';
        for (var i in ret) {
          options += '<option value="' + ret[i].id + '">'
            + ret[i].name + '</option>';
        }
        response_cache4[sub_category_id] = options;
        
        $("#id_brand").html(options);
      });
  }
  response_cache4 = {}
}




//********** End Ajax Function **********

// ********** Validation Add Post **********
( function( $ ) {
$( document ).ready(function() {

    //Image file upload
    $('input[type=file]').simpleFilePreview({
    'buttonContent': '<i class="fa fa-plus-circle fa_small"></i>',
    'shiftLeft': '',
        'shiftRight': '',
        'removeContent': 'Remove'
     });

    //Video File upload

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

		// var category = "Cars & Bikes";
  //   var category_id = '';
		// var sub_category = "Cars";
		// var brand = "Audi";
  //   var sub_category_id= "";
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

    jQuery(document).ready(function(){
    // Place ID's of all required fields here.
    // required = ["category", "ad_title", "your_price", "your_description", "your_email", "select_container_city", "select_container_locality"];
    required = ["category", "ad_title", "your_price", "your_description", "your_email"];
    // emailerror = "Invalid Email";
    // phoneerror = "Invalid Phone"
  
    jQuery("#post").click(function(){ 
    for (i=0;i<required.length;i++) {
      var input = jQuery('#'+required[i]);
      if (input.val() == "")  {
        input.addClass("error_input_field");
        input.siblings('.labelError').show();    
        
      } else {
        input.removeClass("error_input_field");
        input.siblings('.labelError').hide();        
      }
    }

    // Buy and Sell Radio
    if($('#buy').attr('checked') || $('#sell').attr('checked')){
      $('#buy,#sell').removeClass("error_input_field");
      $('#buy,#sell').siblings('.labelError').hide();
    }
    else {
      $('#buy,#sell').addClass("error_input_field");
      
      $('#buy,#sell').siblings('.labelError').show();
  
    }

    // Dealer and Individual Radio
    if($('#individual').attr('checked') || $('#dealer').attr('checked')){
      $('#individual,#dealer').removeClass("error_input_field");
      $('#individual,#dealer').siblings('.labelError').hide();
    }
    else {
      $('#individual,#dealer').addClass("error_input_field");
      
      $('#individual,#dealer').siblings('.labelError').show();
  
    }

    // Dropdown city
    if ($('#select_post_city').text() == "Your city *") {
      $('.select_container_city').addClass("error_input_field");
      $('.select_container_city').find('.labelError').show();
    }
    else{
      $('.select_container_city').removeClass("error_input_field");
      $('.select_container_city').find('.labelError').hide();
    }

    // Dropdown locality
    if ($('#select_post_locality').text() == "Your locality *") {
      $('.select_container_locality').addClass("error_input_field");  
      $('.select_container_locality').find('.labelError').show();
    }
    else{
      $('.select_container_locality').removeClass("error_input_field");
      $('.select_container_locality').find('.labelError').hide(); 
    }


    // //Validate the e-mail.
    // if (!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($('#your_email').val())) {
    //   alert("test email");
    //   $('#your_email').addClass("error_input_field");
    //   $('#your_email').siblings('.labelError1').show();
    //   //email.val(emailerror);
    // }
    // else
    // {
    //   $('#your_email').removeClass("error_input_field");
    //   $('#your_email').siblings('.labelError1').hide();
    // }

    //Validate the e-mail.
    if($('#your_email').val() != ''){
    if (!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($('#your_email').val())) {
      $('#your_email').addClass("error_input_field");
      $('#your_email').siblings('.labelError').text("Please enter valid email address");
      $('.labelError').show();
      //email.val(emailerror);
    }
    else
    {
      $('#your_email').removeClass("error_input_field");
      $('#your_email').siblings('.labelError').hide();
    }
    }

    if ($(":input").hasClass("error_input_field") || $(".select_container_city").hasClass("error_input_field") || $(".select_container_locality").hasClass("error_input_field") || $("#buy,#sell").hasClass("error_input_field") || $("#individual,#dealer").hasClass("error_input_field")){
    return false;
    }
    else{
      return true;
      $('form[name="post_ad"]').submit();
    }
    });
  });

  //============= FOR SET PREMIUM PLAN AMOUNT ===========

    $('input[name=premium_plan]').click(function(){
      var premium_id=this.id;    
      if (premium_id == "premium_plan1")   
        $('input[name=amount]').val("9.99"); 
      else if (premium_id == "premium_plan2")   
        $('input[name=amount]').val("14.99");  
      else if (premium_id == "premium_plan3")   
        $('input[name=amount]').val("19.99"); 
      $('form[name="payment_form"]').submit();    
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
      var selected_option = $( ".custom_select_value_act option:selected" ).text();
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

  //============= CHOOSE CATEGORY DROPDOWN ===========
  $( ".select_post_category" ).change(function () {
    
    var selected_option = $( ".select_post_category option:selected" ).text();
    $('#select_post_category').html(selected_option);
    
    fill_subcategories($(this).val());
    
  });

   //============= CHOOSE SUBCATEGORY DROPDOWN ===========
  $( ".select_post_subcategory" ).change(function () {
    
    var selected_option = $( ".select_post_subcategory option:selected" ).text();
    $('#select_post_subcategory').html(selected_option);
    fill_brands($(this).val());
    
  });
  $( ".select_post_brand" ).change(function () {
    
    var selected_option = $( ".select_post_brand option:selected" ).text();
    $('#select_post_brand').html(selected_option);
    
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
      // alert(category_id);
      // alert(sub_category_id);
      // alert(brand_id);
      $('#category_name').val(category_id);
      $('#subcategory_name').val(sub_category_id);
      $('#brand_name').val(brand_id);
  		$('#category').val(category + " » " + sub_category + " » " + brand);
  		$('.choose_button').text('change');
  	});


  //============= END CHOOSE CATEGORY POPUP ===========
  $('#button_click').click(function () {
      
      var string =gettext('hello');
      alert(string);
    });

  $(".left_sidead").click(function(){
    $(".left_sidead").hide();
    $(".leftslide").show();
    $(".leftslide1").show();
  });
  
  $(".closeimg").click(function(){
    $(".leftslide").hide();
    $(".left_sidead").show();
    $(".leftslide1").hide();
  });


    var $upperimg = $('.upperimg img');
    $('.thumbs img').click(function () {
        $upperimg.attr('src', this.src);
    });
    
    $('.product_image img').load(function(){
      var height = $(this).height();
      var width = $(this).width();
      $(this).css({'margin-top': -height / 2 + "px", 'margin-left': -width / 2 + "px"});      
    });

    $('.product_images1 img').load(function(){
      var height = $(this).height();
      var width = $(this).width();
      $(this).css({'margin-top': -height / 2 + "px", 'margin-left': -width / 2 + "px"});      
    });

});

} )( jQuery );