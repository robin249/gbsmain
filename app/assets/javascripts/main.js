(function ($) {
    "use strict";

    
    /*--
    Service Active
    -----------------------------------*/
    $('.producta-active .owl-nav div')
        .click(function() {
        $('.producta-active .owl-nav div').removeClass('active');
        $(this).addClass('active');
    });
    
    /* magnificPopup video popup */
    $('.video-popup').magnificPopup({
        type: 'iframe'
    });
    
    /* counterUp */
    $('.count').counterUp({
        delay: 10,
        time: 1000
    });
    
    
    // MOUSE MOVING BACKGTOUND 1
    $('#register-1').mouseParallax({
        moveFactor: 2
    });
    
    $('#register-2').mouseParallax({
        moveFactor: 2
    });
    
    $('#register-3').mouseParallax({
        moveFactor: 1
    });

    /* jQuery MeanMenu */
    $('#mobile-menu-active').meanmenu({
        meanScreenWidth: "991",
        meanMenuContainer: ".menu-cart-wrap .mobile-menu",
    });
    $('.commrnt-toggle a').on('click', function(e) {
        e.preventDefault();
        $('.blog-comment-content-wrap').slideToggle(1000);
    });
    
    
    /*--------------------------
        ScrollUp
    ---------------------------- */
    $.scrollUp({
        scrollText: '<i class="fa fa-angle-up"></i>',
        easingType: 'linear',
        scrollSpeed: 900,
        animation: 'fade'
    });

    $(".more").click(function(e) {

        if( $(this).hasClass("open") ) {
            $(this).removeClass("open").addClass("closed");
        } else {
            // if other menus are open remove open class and add closed
            $(this).siblings().removeClass("open").addClass("closed"); 
            $(this).removeClass("closed").addClass("open");
        }

});

    $(window).scroll(function () {
            if ($(this).scrollTop() > 100) {
                $('header').addClass("sticky");
            } else {
                $('header').removeClass("sticky");
            }
        });
    
})(jQuery);	
