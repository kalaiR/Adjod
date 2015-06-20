jQuery(function ($) {
    var $upperimg = $('.upperimg img');
    $('.thumbs img').click(function () {
        $upperimg.attr('src', this.src);
    });
});