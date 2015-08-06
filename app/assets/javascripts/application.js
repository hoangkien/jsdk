// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require ckeditor/init
//= require_tree .

 var $j = jQuery.noConflict();
$j(document).ready(function() {
  $j(".addtocart").click(function () {
               var proID = $(this).attr("rel");
                var proX = $("#img_" + proID).offset().left;
                var proY = $("#img_" + proID).offset().top;
                var basketX = $(".cart").offset().left;
                var basketY = $(".cart").offset().top;
                var gotoX = basketX - proX;
                var gotoY = basketY - proY;
                var newImageWidth = 0;
                var newImageHeight = 0;
                 $("#img_" + proID + " img")
                    .clone()
                    .prependTo("#img_" + proID)
                    .css({ 'position': 'absolute' })
                    .css({ 'z-index': '111111111111111' })
                    .animate({ opacity: 0.9 }, 100)
                    .animate({ opacity: 0.1, marginLeft: gotoX, marginTop: gotoY, width: newImageWidth, height: newImageHeight }, 1000, function () {
                    $(".cart").addClass("active");
                    $(".cart").removeClass("hover");
                    $('form#myForm').slideDown('slow');
                    });
  });
});
$j(window).scroll(function() {
   if($j(window).scrollTop()!=0) {
       $j('.goTop').fadeIn();

   } else {
       $j('.goTop').fadeOut();
   }
});
$j('.goTop').click(function() {
  $('html, body').animate({scrollTop:0},500);
});
    /*$(window).load(function() {
      $('#slider').nivoSlider({
        pauseTime : 5000
      });
    });*/
(function($) {

var isClosed = true;
$('a.cart').click(function(){
  if(isClosed)
  {
    $(this).addClass("active");
    $(this).removeClass("hover");
    $('form#myForm').slideDown('slow');
    isClosed = false;
  }
  else
  {
    $(this).removeClass("active");
    $('form#myForm').slideUp('slow');
    isClosed = true;
  }
});


$(".pane .delete").click(function(){
$(this).parents(".pane").animate({ opacity: 'hide' }, "slow");
});
})(jQuery);
