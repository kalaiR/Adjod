
 $(document).ready(function (){
 
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
  });

