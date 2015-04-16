 // $(document).ready( function ()
 // {
 
 //  /* we are assigning change event handler for select box */
 //  /* it will run when selectbox options are changed */
 //  $('.adtype').change(function()
 //  {
 //    /* setting currently changed option value to option variable */
 //    var option = $(this).val();
 //    /* setting input box value to selected option value */
 //    if(option == "sell")
 //            {
              
 //                $('#seller').show();
 //                $('#buyer').hide();
             
 //            }
 //            else
 //            {

 //                $('#buyer').show();
 //                $('#seller').hide();
               
 //            }

 //  });

$("#id_city").change(function() { alert($(this).val());fill_localities($(this).val()); });
// $("#id_brand").change(function() { fill_models($(this).val()); });
 

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

// var response_cache1 = {};
// var response_cache2 = {};
// var response_cache3 = {};
// $(".category").click(function() {

//         $(this).find('li').each(function(){
//             // cache jquery var
//             var category_id =$('input[type="hidden"]', this).val();
            
            
//             find_subcategory(category_id);
//              $('#display_category').text(category_id);

//         });
//  });
// });

// function fill_models(brand_id) {
//   if (response_cache1[brand_id]) {
//     $("#id_model").html(response_cache1[brand_id]);
//   } else {
//     $.getJSON("/models_for_brand/", {brand_id: brand_id},
//       function(ret, textStatus) {
//         var options = '<option value="" selected="selected">---------</option>';
//         for (var i in ret) {
//           options += '<option value="' + ret[i].id + '">'
//             + ret[i].name + '</option>';
//         }
//         response_cache1[brand_id] = options;
//         $("#id_model").html(options);
//       });
//   }
// }

// function find_subcategory(category_id) {
//   if (response_cache2[category_id]) {

//     $(".subcategory").html(response_cache2[category_id]);
//   } else {
    
//     $.getJSON("/subcategory_for_category/", {category_id: category_id},
//       function(ret, textStatus) {

//         var options = '';
//         for (var i in ret) {
          
//           options += '<li><a><input type="hidden" class="id_subcategory" value="' + ret[i].id + '">'
//             + ret[i].name + '</a></li>';
//          }

//   response_cache2[category_id] = options;
//   $(".subcategory").html(options);
//   });
//   }
// }


