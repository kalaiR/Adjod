function attach_pagination_events(){
    // pagination_filter_align();
            $('[data-ajaxlink=true]').click(function(ele){
            $("html, body").animate({ scrollTop: 0 }, "slow");
                        $('[name=page]').val($(ele.currentTarget).attr('data-ajaxpage'));
                        perform_search();
                        return false;
            });
            
}
$(document).ready(function() {
            
            
            attach_pagination_events();

            var url = window.location.href;
            alert(url);

            // var pageURL = $(location).attr("href");
            url1=url.split('/')[3]
            alert(url1);
            url2=url.split('/')[4]
            alert(url2);
            // alert(url.split('/')[3].'+'.pageURL.split('/')[4]);

            // var pageURL=window.location.hash.split('/')[2];
            // alert(page);

            // var pageURL=window.location.hash.split('/')[2];
            // alert(page);
            
            
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
                        var q = $('#form_search_filter').serialize();
                        q=decodeURIComponent(q);

                        var pageURL = $(location).attr("href");
                        alert(pageURL);
                        // q = q.replace(/filtersearch/g,'q');
                       
                        // var qsort = $("#sortdata").val();
                        // q = q +'&sortdata='+$.trim(qsort);
                        // var qlang = $("#currentlanguage").val();
                        if ($('[name=newsearch]').val() == "new")
                        
                        {
                            
                            $.get('/search/?'+ q, function(data){
                               
                                
                                    // show_searching(false);
                                    $('#search_result').html(data);
                                    attach_pagination_events();
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
                            });

                            
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


// function show_searching(show) {

//     if(show){

//         $('.loding_icon').show();
//         $('.founded_no').hide();

//     }else{

//         $('.loding_icon').hide();
//         $('.founded_no').show();

//     }

// }


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


$('.search_btn').live('click', function() {
		validateSearch();
	});