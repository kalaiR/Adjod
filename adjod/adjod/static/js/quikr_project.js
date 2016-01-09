//********** Functions **********
function sign_in_center_align(){
      var height=$('.sign_in_div').height();
      var width=$('.sign_in_div').width();
      $('.sign_in_div').css({'margin-top': -height / 2 + "px", 'margin-left': -width / 2 + "px"});
}

function sign_up_center_align(){
      var height=$('.sign_up_div').height();
      var width=$('.sign_up_div').width();
      $('.sign_up_div').css({'margin-top': -height / 2 + "px", 'margin-left': -width / 2 + "px"});
}

function category_popup_center_align(){

      var height=$('.choose_category_div,.choose_category_div_mobile').height();
      var width=$('.choose_category_div,.choose_category_div_mobile').width();
      $('.choose_category_div,.choose_category_div_mobile').css({'margin-top': -height / 2 + "px", 'margin-left': -width / 2 + "px"});
}

function forgot_center_align(){
      var height=$('.forgot_div').height();
      var width=$('.forgot_div').width();
      $('.forgot_div').css({'margin-top': -height / 2 + "px", 'margin-left': -width / 2 + "px"});
}

function reset_div_center_align(){
      var height=$('.reset_div').height();
      var width=$('.reset_div').width();
      $('.reset_div').css({'margin-top': -height / 2 + "px", 'margin-left': -width / 2 + "px"});
}
function subscribe_center_align(){
      var height=$('.subscription_popup').height();
      var width=$('.subscription_popup').width();
      $('.subscription_popup').css({'margin-top': -height / 2 + "px", 'margin-left': -width / 2 + "px"});
}

function checkStrength(password){
      //initial strength
      var strength = 0
      //if the password length is less than 6, return message.
      if (password.length < 6) {
          $('#result').removeClass()
          $('#result').addClass('short')
          return 'Too short'
      }
      //length is ok, lets continue.
      //if length is 8 characters or more, increase strength value
      if (password.length > 7) strength += 1
      //if password contains both lower and uppercase characters, increase strength value
      if (password.match(/([a-z].*[A-Z])|([A-Z].*[a-z])/))  strength += 1
      //if it has numbers and characters, increase strength value
      if (password.match(/([a-zA-Z])/) && password.match(/([0-9])/))  strength += 1
      //if it has one special character, increase strength value
      if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/))  strength += 1
      //if it has two special characters, increase strength value
      if (password.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,",%,&,@,#,$,^,*,?,_,~])/)) strength += 1
      
      //now we have calculated strength value, we can return messages
      //if value is less than 2
      if (strength < 2 ) {
          $('#result').removeClass()
          $('#result').addClass('weak')
          return 'Weak'
      } else if (strength == 2 ) {
          $('#result').removeClass()
          $('#result').addClass('good')
          return 'Good'
      } else {
          $('#result').removeClass()
          $('#result').addClass('strong')
          return 'Strong'
      }
}

function isValidEmailAddress(emailAddress) {
    var pattern = new RegExp(/^[+a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i);
    return pattern.test(emailAddress);
};

function updateCountdownTitle() {
    var remaining = 70 - $('.ad_title').val().length;
    $('#ad_title_count').text(remaining);
}
function updateCountdownDesc() {
    var remaining = 500 - $('#your_description').val().length;
    $('#desc_count').text(remaining);
}

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
            if(ret.length == 0){
              // alert("empty brand");
              $(".brand_list").html("no brand for this sub category");
              $('.popup_fade').hide();
              $('.close_btn').hide();
              $('.choose_category_div').hide();
              $('.choose_category_div_mobile').hide();
              document.body.style.overflow = 'auto';
              $('#category_name').val(category_id);
              $('#subcategory_name').val(sub_category_id);
              $('#category').val(category + " » " + sub_category);
              $('.choose_button').text('change');
             }
             else{
              var options = '';
              for (var i in ret) {
                options += '<li><input type="hidden" name="brand" value="' + ret[i].id + '">'
                  + ret[i].name + '</li>';
              }
              response_cache1[sub_category_id] = options;
              $(".brand_list").html(options);
             }
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
            $('#select_post_locality').text("Select Locality");
            options +='<option>Select Locality</option>';
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
            options +='<option>Select Subcategory</option>';
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
        // alert(sub_category_id);
        $.getJSON("/brand_for_subcategory/", {sub_category_id: sub_category_id},
          function(ret, textStatus) {
            if(ret.length == 0){
              $('.select_post_brand').hide();
              $('.select_container_brand').css({"opacity":0.5});
              $('.brand_folder').hide();
             }
             else{
              $('.select_post_brand').show();
               $('.select_container_brand').css({"opacity":1});
              $('.brand_folder').show();
             }
            var options = '';
             if (window.location.href.indexOf("search") >= 0) {
              // alert("search");
              for (var i in ret) {
                options += '<li><input type="checkbox" class="css-checkbox sme brandtype"  name ="brandtype" value ="' + ret[i].id + '"><label for="checkbox1" name="checkbox1_lbl" class="css-label sme depressed">'+ ret[i].name + '</label></li>';
              }
              $(".hiddenclass").html(options);
             }
            else{
            options +='<option>Select Brand</option>';
            for (var i in ret) {
              options += '<option value="' + ret[i].id + '">'
                + ret[i].name + '</option>';
            }
            response_cache4[sub_category_id] = options;
            $("#id_brand").html(options);
          }
          });
      }
      response_cache4 = {}
}
//********** End Ajax Function **********

//********** End Functions **********

$( document ).ready(function() {

    $.fn.center = function () {
      var height = $(this).height();
      var width = $(this).width();
      $(this).css({'margin-top': -height / 2 + "px", 'margin-left': -width / 2 + "px"});
      return this;
   }
      
    sign_in_center_align();
    sign_up_center_align();
    reset_div_center_align();
    subscribe_center_align();

    // subscription popup
   
    $(".link_tooltip").click(function(){
        subscribe_center_align();
        $('.popup_fade').show();
        $('.subscription_popup ,.close_btn').show();
        document.body.style.overflow = 'hidden';
    });

    // Showing Image as large when click thumbnail
    var $upperimg = $('.upperimg img');
    $('.thumbs img').click(function () {
        $upperimg.attr('src', this.src);
    });

    //Apply center alignment for images
    $('.product_image img').load(function(){
        $(this).center();
    });
    $('.product-image img').load(function(){
        $(this).center();
    });
    $('.thumbs img').load(function(){
        $(this).center();
    });

    // Social auth share button actions for desktop
    $(".fbtwtbutton").hide();
    $(".share_button").click(function(){
        $(".fbtwtbutton").toggle();
    });

    //Actions for User Management page
    $(".profile_text").hide();
    $(".My_ads").click(function(){
      $(".update_ads").show();
      $(".profile_text").hide();
    });     
    $(".My_profile").click(function(){
      $(".profile_text").show();
      $(".update_ads").hide();
    });
    $(".menu_active").click(function(){
      $('.menu_active').removeClass('active');
      $(this).addClass('active');
    });

   //user profile check and uncheck functionality   by ramya  
    $('.check_all_act').on('click', function(){
      $('.check').prop('checked', true);
    });

    $('.uncheck_all_act').on('click', function(){
      $('.check').prop('checked', false);
    });

    function getSelectedVals(){
     var tmp =[];
     $("input[name='title_box']").each(function() {
     if ($(this).attr('checked'))
     {
        checked = ($(this).val());
        tmp.push(checked);
     }
     });
     var filters = tmp.join(',');
     alert(filters)
     return filters;
    }

    $('.delete_act').on('click', function() {
      if ($(".check").prop('checked')==false){
         $('.delete_act').prop('disabled', true);
         alert('you must select atleast one ad to complete your action');
      }
      else{
        selected = getSelectedVals();
        alert(selected);
        var myurl = "/delete_ad/"                 
        $.ajax({ 
                  type: "POST",
                  url: myurl,
                  data: "selected="+selected,
                  success: function(response) {
                    window.location.reload(true);
                  },
                        
        });           
        return false;
      }
    });


  // $(document).on('change','.poster', function(){
  //     files = this.files;
  //     size = files[0].size;
  //     var oFReader = new FileReader();
  //     oFReader.readAsDataURL(this.files[0]);
  //     oFReader.onload = function (oFREvent) {
  //       var image = new Image();
  //       image.src = oFREvent.target.result;
  //       $('#clean_img').remove();
  //       image.onload = function () {         
  //       if (this.width < 500 ) {
  //         alert("Image width should be above 500 px");
  //         return false;
  //       }         
  //       else if (this.height < 500 ) {
  //         alert("Image height should above be 500 px");
  //         return false;
  //       }
  //       else if (this.size >1024*1000 ) {
       
  //         alert("please upload less than 1MB");
  //         return false;
  //       }
  //       else{
  //         return true;
  //       }
    
  //     };

  //     };
  // }); 
    //select  locality in user profile
    $( ".profile_locality" ).change(function () {
            var selected_option = $( ".profile_locality option:selected" ).text();
            $('#profile_locality').html(selected_option);
      });

    //select gender
    $( ".profile_gender" ).change(function () {
          var selected_option = $( ".profile_gender option:selected" ).text();
          $('#profile_gender').html(selected_option);
    });


  //userprofile ajax form submit
    $('#update_user').submit(function() {                 
      $.ajax({ 
          data: $(this).serialize(), 
          type: $(this).attr('method'), 
          url: $(this).attr('action'), 
          success: function(response) { 
          alert('success');

          },
          error: function(response){
            alert('error');
          }
        
      });    
        return false;
  });

        
   //For SignIn and SignUp Popup
    $('.popup_sign_up, .footer_signup').click(function(){
        sign_up_center_align();
        $('.popup_fade').show();
        $('.sign_up_div, .close_btn').show();
        $('.sign_in_div').hide();
        document.body.style.overflow = 'hidden';
    });
    $('.popup_sign_in, .footer_login').click(function(){
        sign_in_center_align();
        $('.popup_fade').show();
        $('.sign_in_div, .close_btn').show();
        $('.sign_up_div').hide();
        document.body.style.overflow = 'hidden';
    });
    $('.choose_button').click(function(){
        category_popup_center_align();
        $('.popup_fade').show();
        $('.choose_category_div, .choose_category_div_mobile, .close_btn').show();
        document.body.style.overflow = 'hidden';
    });
    $('.cancel_btn').click(function(){
        $('.popup_fade').hide();
        $('.sign_up_div,.sign_in_div,.forgot_div,.reset_div, .close_btn, .choose_category_div,.choose_category_div_mobile,.subscription_popup').hide();
        document.body.style.overflow = 'auto';
    });
    // Forgot Password Popup
    $('.forgot_act').click(function(){
        forgot_center_align();
        $('.popup_fade').show();
        $('.sign_in_div').hide();
        $('.forgot_div, .close_btn').show();
        document.body.style.overflow = 'hidden';
    });

     $('.free_button').click(function(){
         $('.forgot_div').hide();
        $('.sign_up_div, .close_btn').show();
        document.body.style.overflow = 'hidden';
    });
    // Find password strength in sign up popup
    $('#password').keyup(function(){
        $('#result').html(checkStrength($('#password').val()));
    });

    // Find No. Of characters left in textarea when type
    $('input[type=text], textarea').focus(function() {
        if( this.value == this.defaultValue ) {
         this.value = "";
        }
        }).blur(function() {
         if( !this.value.length ) {
        this.value = this.defaultValue;
        }
    });

    // Code for banner rotation based on interval
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

    // ************* start country wise mobile number validation in post ad page
    // get the country data from the plugin
    var countryData = $.fn.intlTelInput.getCountryData(),
      telInput = $("#your_mobile_no"),
      addressDropdown = $("#country");

    // init plugin
    telInput.intlTelInput({
       preferredCountries: [ "sg", "gb" ],
      utilsScript: "../../static/lib/libphonenumber/build/utils.js"
    });

      telInput.change(function() {
      var countryCode = telInput.intlTelInput("getSelectedCountryData").iso2;
      addressDropdown.val(countryCode);
    });

    // trigger a fake "change" event now, to trigger an initial sync
      telInput.change();

    // listen to the address dropdown for changes
      addressDropdown.change(function() {
      var countryCode = $(this).val();
      telInput.intlTelInput("selectCountry", countryCode);
    });
   // ************* end country wise mobile number validation

   // ************* start country wise mobile number validation in free alert page
    // get the country data from the plugin
    var countryData = $.fn.intlTelInput.getCountryData(),
      telInput = $("#mobilenumber"),
      addressDropdown = $("#country");

    // init plugin
      telInput.intlTelInput({
      preferredCountries: [ "sg", "gb" ],
      utilsScript: "../../static/lib/libphonenumber/build/utils.js"
    });

      telInput.change(function() {
      var countryCode = telInput.intlTelInput("getSelectedCountryData").iso2;
      addressDropdown.val(countryCode);
    });

    // trigger a fake "change" event now, to trigger an initial sync
      telInput.change();

    // listen to the address dropdown for changes
      addressDropdown.change(function() {
      var countryCode = $(this).val();
      telInput.intlTelInput("selectCountry", countryCode);
    });
    // ************* end country wise mobile number validation

    // ************* start country wise mobile number validation in sign up form
      //home
      // get the country data from the plugin
      var countryData = $.fn.intlTelInput.getCountryData(),
        telInput = $("#mobile_number_sign_up_home"),
        addressDropdown = $("#country");

      // init plugin
        telInput.intlTelInput({
        preferredCountries: [ "sg", "gb" ],
        utilsScript: "../../static/lib/libphonenumber/build/utils.js"
      });

        telInput.change(function() {
        var countryCode = telInput.intlTelInput("getSelectedCountryData").iso2;
        addressDropdown.val(countryCode);
      });

      // trigger a fake "change" event now, to trigger an initial sync
        telInput.change();

      // listen to the address dropdown for changes
        addressDropdown.change(function() {
        var countryCode = $(this).val();
        telInput.intlTelInput("selectCountry", countryCode);
      });

      //search
      // get the country data from the plugin
      var countryData = $.fn.intlTelInput.getCountryData(),
        telInput = $("#mobile_number_sign_up_search"),
        addressDropdown = $("#country");

      // init plugin
        telInput.intlTelInput({
        utilsScript: "../../static/lib/libphonenumber/build/utils.js"
      });

        telInput.change(function() {
        var countryCode = telInput.intlTelInput("getSelectedCountryData").iso2;
        addressDropdown.val(countryCode);
      });

      // trigger a fake "change" event now, to trigger an initial sync
        telInput.change();

      // listen to the address dropdown for changes
        addressDropdown.change(function() {
        var countryCode = $(this).val();
        telInput.intlTelInput("selectCountry", countryCode);
      });

      //postad
      // get the country data from the plugin
      var countryData = $.fn.intlTelInput.getCountryData(),
        telInput = $("#mobile_number_sign_up_postad"),
        addressDropdown = $("#country");

      // init plugin
        telInput.intlTelInput({
        utilsScript: "../../static/lib/libphonenumber/build/utils.js"
      });

        telInput.change(function() {
        var countryCode = telInput.intlTelInput("getSelectedCountryData").iso2;
        addressDropdown.val(countryCode);
      });

      // trigger a fake "change" event now, to trigger an initial sync
        telInput.change();

      // listen to the address dropdown for changes
        addressDropdown.change(function() {
        var countryCode = $(this).val();
        telInput.intlTelInput("selectCountry", countryCode);
      });
     // ************* end country wise mobile number validation *************

     // Image file upload
     $('input[type=file]').simpleFilePreview({
          'buttonContent': '<i class="fa fa-plus-circle fa_small"></i>',
          'shiftLeft': '',
          'shiftRight': '',
          'removeContent': 'Remove'
     });

     // Ad Type radio button change
     $('.ad_type_choice').change(function(){
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

    //*************** start Free alert form validation ***********
    $("#alert_button").click(function(){
        //email
        if ($('#email').val() == "")
             $('#email').parent().next('.email_labelError').show();
        else{
            if (!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($('#email').val()))
            {
            $('#email').parent().next('.email_labelError').text("Please enter valid email address");
            $('.email_labelError').show();
            }
            else
            {
             $('#email').parent().next('.email_labelError').hide();
            }
        }
        //category
        if ($('#select_post_category').text() == "Select Category")
          $('.select_post_category').parent().next('.labelError').show();
        else
          $('.select_post_category').parent().next('.labelError').hide();
        //subcategory
        if ($('#select_post_subcategory').text() == "Select SubCategory")
          $('.select_post_subcategory').parent().next('.labelError').show();
        else
          $('.select_post_subcategory').parent().next('.labelError').hide();
        //brand
        if ($('#select_post_brand').text() == "Select Brand")
          $('.select_post_brand').parent().next('.labelError').show();
        else
          $('.select_post_brand').parent().next('.labelError').hide();
         //city
        if ($('#select_post_locality').text() == "Select Locality")
          $('.select_post_locality').parent().next('.labelError').show();
        else
          $('.select_post_locality').parent().next('.labelError').hide();
          if ($('.labelError,.email_labelError').is(":visible"))
            return false;
          else{
            return true;
            $('form[name="alert_button"]').submit();
          }
    });
    //*************** End Free alert form validation ***********

    //*************** start Sign Up form validation ***********
    // Place ID's of all required fields here.
    sign_up_required=["email_id", "password","user_id"];
    jQuery('#create').click(function(){
    if ($('.confirm').prop('checked') == true){
            for (i=0;i<sign_up_required.length;i++) {
            var input = jQuery('#'+sign_up_required[i]);
            if (input.val() == "")  {
            input.addClass("error_input_field");
            input.siblings('.signup_labelError').show();
            } else {
              input.removeClass("error_input_field");
              input.siblings('.signup_labelError').hide();
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
            return true;
            $('form[name="sign_in"]').submit();
          }
    }
    else
          return false;
    });
    //*************** End Sign Up form validation ***********

    //*************** Start Post Ad form validation ***********
    required = ["category", "ad_title", "your_price", "your_description", "your_email"];
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
        if (($('#select_post_city').text() == "Select city *") || ($('#select_post_city').text() == "Select City")) {
          $('.select_container_city').addClass("error_input_field");
          $('.select_container_city').find('.labelError').show();
        }
        else{
          $('.select_container_city').removeClass("error_input_field");
          $('.select_container_city').find('.labelError').hide();
        }
        // Dropdown locality
        if (($('#select_post_locality').text() == "Select locality *") || ($('#select_post_locality').text() == "Select Locality")) {
          $('.select_container_locality').addClass("error_input_field");  
          $('.select_container_locality').find('.labelError').show();
        }
        else{
          $('.select_container_locality').removeClass("error_input_field");
          $('.select_container_locality').find('.labelError').hide();
        }
        //Validate the e-mail.
        if($('#your_email').val() != ''){
        if (!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test($('#your_email').val())) {
          $('#your_email').addClass("error_input_field");
          $('#your_email').siblings('.labelError').text("Please enter valid email address");
          $('.labelError').show();
        }
        else
        {
          $('#your_email').removeClass("error_input_field");
          $('#your_email').siblings('.labelError').hide();
        }
        }
        if($('#terms_of_use').attr('checked')){
          $('#terms_required').hide();          
        }
        else{
          $('#terms_required').show(); 
        }
        if ($(":input").hasClass("error_input_field") || $(".select_container_city").hasClass("error_input_field") || $(".select_container_locality").hasClass("error_input_field") || $("#buy,#sell").hasClass("error_input_field") || $("#individual,#dealer").hasClass("error_input_field")){
        return false;
        }
        else{
          return true;
          $('form[name="post_ad"]').submit();
        }
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


    //============= CHOOSE PAYMENT METHOD DROPDOWN ===========
    $( ".select_payment" ).change(function () {
          var selected_option = $( ".select_payment option:selected" ).val();
          $('#payment_method').html(selected_option);
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

    //============= CHOOSE POST BRAND DROPDOWN ===========
    $( ".select_post_brand" ).change(function () {
          var selected_option = $( ".select_post_brand option:selected" ).text();
          $('#select_post_brand').html(selected_option);
    });

    // Find Subcategory for Category in Listing Page
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

    // Find Brand for SubCategory in Listing Page
    $(".subcategory_list").on("click", ">li", function(){
          $( ".subcategory_list > li" ).each(function( index ) {
              $( this ).removeClass('orange_text');
          });
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
          $('.popup_fade').hide();
          $('.close_btn').hide();
          $('.choose_category_div').hide();
          document.body.style.overflow = 'auto';
          $('#category_name').val(category_id);
          $('#subcategory_name').val(sub_category_id);
          $('#brand_name').val(brand_id);
          $('#category').val(category + " » " + sub_category + " » " + brand);
          $('.choose_button').text('change');
    });

    // Show Banner Ads In home Page
    // $(".left_sidead").click(function(){
    //     $(".left_sidead").hide();
    //     $(".leftslide").show();
    //     $(".leftslide1").show();
    // });

    // $(".closeimg").click(function(){
    //     $(".leftslide").hide();
    //     $(".left_sidead").show();
    //     $(".leftslide1").hide();
    // });
    


    $('.signup_tooltip').hide();
    $(".signup_confirm_button").on('hover', function(){
    if ($(".confirm").prop('checked')==false){ 
        $('.signup_tooltip').show();
    }
    else{
         $('.signup_tooltip').hide();
       }
    });
    
     // Tooltip for Post ad
    // $('.postad_tooltip').hide();
    // $(".post_form_send").on('hover', function(){
    // if ($("#terms_of_use").prop('checked')==false){ 
    //     $('.postad_tooltip').show();
    // }
    // else{
    //      $('.postad_tooltip').hide();
    //    }
    // });

    $(".user_dropdown").hide();
    $(".caret_user").click(function(){
        $('.user_dropdown').toggle();
    });

    $('.subscribe_content code').click(function(){
      transaction_type = $('form[name="paypal_account_subscription"]').find("input[name='item_name']").val();
      $.cookie("transaction_type", transaction_type);
      $('form[name="paypal_account_subscription"]').submit();
    });

    $('input.checkbox_premium').on('click', function(){
        $('input.checkbox_premium').not(this).prop('checked', false); 
        $('.premium_plan').val($(this).val());
    });

    //allow characters for price
    $('.your_price').keypress(function(e) {
      alert("your_price");
         var theEvent = e || window.event;
          var key = theEvent.keyCode || theEvent.which;
          key = String.fromCharCode(key);
          if (key.length == 0) return;
          var regex = /^[0-9.\b]+$/;
          // var regex = ^\d+(?:[\.\,]\d+)?$;
          if (!regex.test(key)) {
              theEvent.returnValue = false;
              if (theEvent.preventDefault) theEvent.preventDefault();
          }
    });

});


