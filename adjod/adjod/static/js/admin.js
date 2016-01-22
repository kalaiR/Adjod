$(document).ready(function(){
if (window.location.pathname == '/admin/banner/postbanner/add/'){
    $('.field-banner').hide();
    $('.field-source').hide();
}
$('#id_bannerplan').change(function(){
    var selected_option = $( "#id_bannerplan option:selected" ).text();
    if (selected_option.toLowerCase().indexOf("other") >=0){
        $('.field-banner').hide();
        $('.field-source').show();
    }
    else{
        $('.field-source').hide();
        $('.field-banner').show();
    }
});
var regex = '[0-9]+$/';
if(new RegExp("[0-9]").test(window.location.pathname)) {
    if($('#id_source').val() == '')
        $('.field-source').hide();
    if($('.field-banner ').find('.file-upload').length ==0)
        $('.field-banner').hide();  
}            
});
