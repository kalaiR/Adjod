var response_cache = {};

function fill_localities(city_id) {
  if (response_cache[city_id]) {
    $("#id_locality").html(response_cache[city_id]);
  } else {
    $.getJSON("/localities_for_city/", {city_id: city_id},
      function(ret, textStatus) {
        var options = '<option value="" selected="selected">---------</option>';
        for (var i in ret) {
          options += '<option value="' + ret[i].id + '">'
            + ret[i].name + '</option>';
        }
        response_cache[city_id] = options;
        $("#id_locality").html(options);
      });
  }
}

function fill_models(brand_id) {
  if (response_cache[brand_id]) {
    $("#id_model").html(response_cache[brand_id]);
  } else {
    $.getJSON("/models_for_brand/", {brand_id: brand_id},
      function(ret, textStatus) {
        var options = '<option value="" selected="selected">---------</option>';
        for (var i in ret) {
          options += '<option value="' + ret[i].id + '">'
            + ret[i].name + '</option>';
        }
        response_cache[brand_id] = options;
        $("#id_model").html(options);
      });
  }
}



 $(document).ready( function ()
 {
  /* we are assigning change event handler for select box */
	/* it will run when selectbox options are changed */
	$('.adtype').change(function()
	{
		/* setting currently changed option value to option variable */
		var option = $(this).val();
		/* setting input box value to selected option value */
		if(option == "sell")
				    {
				    	
				        $('#seller').show();
				        $('#buyer').hide();
				     
				    }
				    else
				    {

				        $('#buyer').show();
				        $('#seller').hide();
				       
				    }

	});

	$("#id_city").change(function() { fill_localities($(this).val()); });
	$("#id_brand").change(function() { fill_models($(this).val()); });
});


	
	// $("#register-form").validate({
    
 //        // Specify the validation rules
 //        rules: {
            
 //            you_email: {
 //                required: true,
 //                email: true
 //            },
 //            you_phone: {
 //                number:true,
 //                maxlength:10,
 //                minlength:10
                
 //            },
            
 //        },
        
 //        // Specify the validation error messages
 //        messages: {
           
 //            you_mail: {
 //                       required: "Please enter your email address",
 //                       email: "Please enter valid email address", 
                                                
 //                  },
 //            you_phone: {
                       
 //                       number: "Please enter a valid phone number",                 
 //                  },
           
 //        },
        
 //        submitHandler: function(form) {
 //            form.submit();
 //        }
 //    });
// function send_pin() {
//     $.ajax({
//                 url: "{% url 'ajax_send_pin' %}",
//                 type: "POST",
//                 data: { mobile-number:  $("#mobile-number").val() },
//             })
//             .done(function(data) {
//                 alert("PIN sent via SMS!");
//             })
//             .fail(function(jqXHR, textStatus, errorThrown) {
//                 alert(errorThrown + ' : ' + jqXHR.responseText);
//             });
// }	
// });

