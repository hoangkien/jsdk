var $j = jQuery.noConflict();
$j(window).load(function() {
    $j('#slider_2389970').nivoSlider({
        effect: 'fold,fade,sliceDown',
        width: 598,
        height:394,
        animSpeed: 500,
        pauseTime: 5000,
        startSlide: 0, //Set starting Slide (0 index)
        directionNav: true, //Next & Prev
        directionNavHide: true
    });
});
//Croll top
$j(window).load(function () {
  $j(window).scroll(function () {
      if ($j(window).scrollTop() != 0) {
          $j('#topback').fadeIn();

      } else {

          $j('#topback').fadeOut();

      }

  });

  $j('#topback').click(function () {
      $j('html, body').animate({ scrollTop: 0 }, 500);

  });

});


$j('#subscribe_form .subscribe_email').html('We will only send good news');

$j(function () {
  $j("[id$='txtEmail']").val("Nhập email của bạn");
  $j("[id$='txtEmail']").focus(function () {
      if ($j(this).val() == "Nhập email của bạn") { $j(this).val(""); }
  }).focusout(function () {
      if ($j(this).val() == "") { $j("[id$='txtEmail']").val("Nhập email của bạn"); }
  });
});


$j(function () {
  $j("[id$='txtSearch']").val("Nhập từ khóa cần tìm");
  $j("[id$='txtSearch']").focus(function () {
      if ($j(this).val() == "Nhập từ khóa cần tìm") { $j(this).val(""); }
  }).focusout(function () {
      if ($j(this).val() == "") { $j("[id$='txtSearch']").val("Nhập từ khóa cần tìm"); }
  });
});


function Popupcart(id){
    var quantity = $("#cphMain_ctl00_ctl03_ctl00_qty_").val();
    $j.ajax({
      url: "/addcart",
      type: "post",
      dataType: 'script',
      data: {id:id,quantity:quantity},
      success: function(data){
        // console.log(data);
      },
      error: function(){
        console.log("failed");
      }
    })
}
