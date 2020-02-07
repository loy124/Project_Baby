/* 로그인팝업창 띄우기 */
$('#loginBtn').click(function() {
  $('.lp_login').show();
})
$('.lp_login .btn_close_lp').click(function() {
  $('.lp_login').hide();
});

$(document).ready(function() {

  /*gnb*/
  $('.gnb > li').mouseenter(function() {
    $('.sub_menu', this).show();
    $('> a', this).css({
      'color': '#82a3d4'
    })
  }).mouseleave(function() {
    $('.sub_menu', this).hide();
    $('> a', this).css({
      'color': '#000'
    })
  })

});

$(function() {
  var img_len = $(".sld_wrap li").length;
  var img_random = Math.floor(Math.random() * (img_len));
  $(".sld_wrap li:eq(" + img_random + ")").show();
});


/*lnb 높이 right컨텐츠 높아질때마다 가변으로 변환*/
$(function() {
  var rightCont = $('.sub-right__content').height()
  $('.sub-lnb__box ').css({
    'height': rightCont
  })
});

//@COMMENT : 이용약관 / 개인정보 취급방침 레이어팝업
$('.btn_policy').click(function() {
  $('.lp_bg3, .policy').fadeIn();
})
$('.policy .btn_close_lp').click(function() {
  $('.policy, .lp_bg3').hide();
})

$('.btn_personal').click(function() {
  $('.lp_bg4, .personal').fadeIn();
})
$('.personal .btn_close_lp').click(function() {
  $('.personal, .lp_bg4').hide();
})
