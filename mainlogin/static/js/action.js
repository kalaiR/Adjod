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

