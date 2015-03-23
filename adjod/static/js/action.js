


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


 
 $(".category").click(function() {

        $(this).find('li').each(function(){
            // cache jquery var
            var category_id =$('input[type="hidden"]', this).val();
            
            
            find_subcategory(category_id);
             $('#display_category').text(category_id);

            
            
        });
        
    
  });

 // $(".subcategory").click(function() {

           
 //            // cache jquery var
 //            var subcategory_id =$(this).find('li > a > ').val();
            
            
 //            alert(subcategory_id);

            
            
       
        
    
 //  });
 // $(".subcategory").click(function() {
  
  
 //            // cache jquery var
 //            var subcategory_id =$('li > a .id_subcategory', this).val();
 //            alert(subcategory_id);
            
            
 //            // find_subcategory(category_id);
            
            
       

 //    //      alert(this.id); // id of clicked li by directly accessing DOMElement property
 //    // alert($(this).attr('id')); // jQuery's .attr() method, same but more verbose
 //    // alert($(this).html()); // gets innerHTML of clicked li
 //    // alert($(this).text()); // gets text contents of clicked li


 //        // var subcategory_id = $(this).attr('#id_subcategory');
       

 //        // alert($(this).html());
 //        // alert("enter")
 //        // $(this).find('li').each(function(){
 //        //     // cache jquery var
 //        //     var subcategory_id =$('input[type="hidden"]', this).val();
            
            
            

 //        //     find_model(subcategory_id);
            
            
 //        // });
        
    
 //  });


  // $("#id_category").on('click', function ()  { alert('find_subcategory function'); find_subcategory($('input#input_category').val()); });
});

var response_cache = {};
var response_cache1 = {};
var response_cache2 = {};
var response_cache3 = {};

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
  if (response_cache1[brand_id]) {
    $("#id_model").html(response_cache1[brand_id]);
  } else {
    $.getJSON("/models_for_brand/", {brand_id: brand_id},
      function(ret, textStatus) {
        var options = '<option value="" selected="selected">---------</option>';
        for (var i in ret) {
          options += '<option value="' + ret[i].id + '">'
            + ret[i].name + '</option>';
        }
        response_cache1[brand_id] = options;
        $("#id_model").html(options);
      });
  }
}

function find_subcategory(category_id) {
  
  if (response_cache2[category_id]) {

    $(".subcategory").html(response_cache2[category_id]);
  } else {
    
    $.getJSON("/subcategory_for_category/", {category_id: category_id},
      function(ret, textStatus) {

        var options = '';
        for (var i in ret) {
          
          options += '<li><a><input type="hidden" class="id_subcategory" value="' + ret[i].id + '">'
            + ret[i].name + '</a></li>';
          

            
        }

        response_cache2[category_id] = options;
        $(".subcategory").html(options);

        
      });
  }
}

// function find_model(subcategory_id) {
  
//   if (response_cache3[subcategory_id]) {

//     $(".brand").html(response_cache3[subcategory_id]);
//   } else {
    
//     $.getJSON("/brand_for_subcategory/", {subcategory_id: subcategory_id},
//       function(ret, textStatus) {

//         var options = '';
//         for (var i in ret) {
          
//           options += '<li><a><input type="hidden" value="' + ret[i].id + '">'
//             + ret[i].name + '</a></li>';

            
//         }

//         response_cache2[category_id] = options;

//         $(".subcategory").html(options);


        
//       });
//   }
// }

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

