/*
 * Advance Search - Brands autoload 
 */
// $(window).load(function (){	
// 	    var url = window.location.href;
        
//         if(url.indexOf('/search')>=0)
//         {
//             if($("#typeandbrandtxt").val().length>15)
//             {
//                 valKey = jQuery.trim($("#typeandbrandtxt").val()).substring(0, 15).trim(this) + "...";
//             }
//             else
//             {
//                 valKey = $("#typeandbrandtxt").val();  
//             }            
//             $( "#typeandbrandtxt" ).val(valKey);               
//         }
// }); 
/*
 * Autocomplete_keyword
 */

$('.search_btn').click(function() {
        validateSearch();
});

$(function() {

    $("#typeandbrandtxt").autocomplete({
        source : "/autocomplete_brandlist",
        select : function(event, ui) {
            $("#typeandbrand").val(ui.item.value);
        },

        close : function(event, ui) {
            valKey = $("#typeandbrandtxt").val();
            $("#typeandbrand").val(valKey);
            if ($("#typeandbrandtxt").val().length > 15) {
                valKey = jQuery.trim(valKey).substring(0, 15).trim(this) + "...";
            } else {
                valKey = $("#typeandbrandtxt").val();
            }
            $("#typeandbrandtxt").val(valKey);                               
        }
    });    
    
});  	

function attach_pagination_events(){
    // pagination_filter_align();
            $('[data-ajaxlink=true]').click(function(ele){
            $("html, body").animate({ scrollTop: 0 }, "slow");
                        $('[name=page]').val($(ele.currentTarget).attr('data-ajaxpage'));
            // var url = window.location.href;
            // alert(url);

            // // var pageURL = $(location).attr("href");
            // url1=url.split('/')[3]
            // alert(url1);
            // url2=url.split('/')[4]
            // alert(url2);
            // alert(url1+'/'+url2);
            perform_search();
            return false;
            });
            
}
$(document).ready(function() {
            attach_pagination_events();

            var url = window.location.href;
            // var pageURL = $(location).attr("href");
            url1=url.split('/')[3]            
            url2=url.split('/')[4]            
            
            // Toggle for Categories and SubCategories in Advance Menu 
            $('.list_folder').on('click',function(e){
                e.stopImmediatePropagation();               
                $(this).find('.hide_list:first').slideToggle();
            });

            // BrandType checkbox Options in Advance Search
            $('input.brandtype').on('change', function() {
                    $('input.brandtype').not(this).prop('checked', false); 
                    $('#brandtype').val($(this).val());                    
                    perform_search();  
            });

            // BrandType checkbox Options in Advance Search
            $('input.pricerange').on('change', function() {
                    $('input.pricerange').not(this).prop('checked', false); 
                    var splitprice = [];
                    var splitprice = $(this).val().split("#");                    
                    $('#price_start').val(splitprice[0]); 
                    $('#price_end').val(splitprice[1]);
                    perform_search();                                          
            });
});

function perform_search(){
                        // $.cookie('keywords', $('input[name=keywords]').val(),{ path: "/" });
                        // $.cookie('location', $('input[name=locations]').val(),{ path: "/" });
                        // left_dyanmic_height();  
                        // $(".infield").inFieldLabels();
                        // $(".infield_p").inFieldLabels();
                        // show_searching(true);
                        // $('[name=rating_start]').val('')
                        // $('[name=rating_end]').val('')                                              
                        // q = q.replace(/filtersearch/g,'q'); 
                        var q = $('#form_search_filter').serialize();
                        q=decodeURIComponent(q);
                        var pageurl = window.location.href;
                        // alert(pageurl);
                        var url=pageurl.split('/')[3] + '/' + pageurl.split('/')[4]
                        // alert(url);
                        // q = q.replace(/filtersearch/g,'q'); 
                        // var qsort = $("#sortdata").val();
                        // q = q +'&sortdata='+$.trim(qsort);
                        // var qlang = $("#currentlanguage").val();
                        if ($('[name=newsearch]').val() == "new")
                        {
                                    alert('top');
                                    $.get('v2/search/?'+ q, function(data){                                                           
                                    show_searching(false);
                                    $('#search_result').html(data);                                    
                                    leadfound= $('.founded_no').text().trim();
                                    if (leadfound == '')
                                        $('[name=search_founded_no]').val ('0 ' + gettext("Leads found"));
                                    else
                                         $('[name=search_founded_no]').val($('.founded_no').text().trim());
                            
                            		$.get('/search/?'+ q, function(data){
                                    // show_searching(false);
                                    $('#search_result').html(data);
                                    attach_pagination_events();
                                    // if($('[name=keywords]').val() == '')
                                    //     $('#keyword_highlight').hide();                                    
                                    // if($('[name=locations]').val() == '')
                                    //     $('#location_highlight').hide();
                            		});
		                            // $.get(url+'/?'+ q, function(data){
		
		                            //     // alert("enter url")
		                            //     // alert(data);
		                            //     $('#search_result').html(data);
		                            //     attach_pagination_events();
		
		                            //  });         
                                              
                        }else{
                                $.get('/search/?'+ q, function(data){                                                                                             
                                $('#search_result').html(data);
                                attach_pagination_events();
                                // show_searching(false);             
                                // leadfound= $('.founded_no').text().trim();
                                // if (leadfound == '')
                                //     $('[name=search_founded_no]').val ('0 ' + gettext("Leads found"));
                                //  else
                                //      $('[name=search_founded_no]').val($('.founded_no').text().trim());
                                // attach_pagination_events();
                               
                                // if($('[name=keywords]').val() == '')
                                //     $('#keyword_highlight').hide();
                                
                                // if($('[name=locations]').val() == '')
                                //     $('#location_highlight').hide();
                                // left_dyanmic_height();
                                        
                            });
                        }
}


function show_searching(show) {

    if(show){

        $('.loding_icon').show();
        $('.founded_no').hide();

    }else{

        $('.loding_icon').hide();
        $('.founded_no').show();

    }

}


// function left_dyanmic_height() {

//             var profile_sidebar = $('.right_content_holder, .v2_dashboard_wrapper, .right_content_wrapper, .dashboard_content_wrapper, .filter_result_wrapper').height();

//             profile_sidebar_height = profile_sidebar + 180;
//             profile_sidebar_height_2 = profile_sidebar;
            
//             $('.profile_sidebar').height(profile_sidebar_height);
            
//             var shouldShow = $.cookie('show_desc') == 'yep';
// 				if( shouldShow ) {
// 					if(profile_sidebar_height_2 > 700){
// 						$('.filter_wrapper').height(profile_sidebar_height_2 + 120);
// 					}
// 					else{
// 						$('.filter_wrapper').height(profile_sidebar_height_2 + 830);
// 					} 
					 
// 				}
// 				else {
// 					$('.filter_wrapper').height(profile_sidebar_height_2 + 120); 
// 				}
            
           

// }

function validateSearch() {
   left_dyanmic_height();
   // code by Karthikesh on 30/10/2013, for search ajax issue
   var is_search_page = window.location.href.indexOf('/search')
   if(is_search_page > 1)
   {
    
   		$('[name=q]').val($('#q').val());
		perform_search();
   }
   else
   {
    
       	if($('#q').val() == ''){

	         $('#q').val('');
    	}	
    	$("#f_search").submit();
   }
    //return true;
}

