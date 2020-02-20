<%@page import="main.BabyMemberDao"%>
<%@page import="sitterboard.SitterBoardDao"%>
<%@page import="sitterboard.SitterBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="main.BabyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>



<head>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://maps.googleapis.com/maps/api/js"></script>

<script>
   function initialize() {

      var LatLng = new google.maps.LatLng(37.506736, 126.783362);

      var mapProp = {

         center : LatLng, // 위치

         zoom : 5, // 어느정도까지 세세하게 볼 것인지.

         mapTypeId : google.maps.MapTypeId.ROADMAP

      };

      var map = new google.maps.Map(document.getElementById("googleMap"),
            mapProp);

      var marker = new google.maps.Marker({

         position : LatLng,

         map : map,

      });

   }

   google.maps.event.addDomListener(window, 'load', initialize);
</script>
<style type="text/css">
.load{
font-family: 'Lato', 'Nanum Gothic';
    font-size: 22px;
    font-weight: 800;
    line-height: 1.4;
    letter-spacing: 0.03em;
    margin-top: 0;
    margin-bottom: 18px;

}

.location_wrap{
   width: 100%;
   
}
.location_wrap div{
 align-content: center;
 width: 22%;
 margin-right: 3px;
}
.one{
    
    float: left;
    
}
.two{
       float: left;
    /*  box-sizing: border-box; */
}
.three{
       float: left;
   /*   box-sizing: border-box; */
}
.four{
       float: left;
    /*  box-sizing: border-box; */
}

</style>


</head>



<!-- content 영역 -->

<%@ include file="./include/header.jsp"%>




<div class="containerWrap sitterBoard">
   <div class="container_inner">
      <!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
      <div class="cont1 content clearfix">
      <h3 class="load" style="border-bottom: 1.5px solid #000; padding-bottom: 10px; margin-bottom: 42px;">찾아 오시는 길</h3>
      
         <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.2058134453155!2d127.02209175080905!3d37.50306367971067!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca15aee9ab0cb%3A0x31793fc63e0cf9d3!2z67mE7Yq47Lqg7ZSE!5e0!3m2!1sko!2skr!4v1582002070839!5m2!1sko!2skr" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
      </div>
      
      <div class="cont2 content clearfix" style="">
      <div class="location_wrap">
      
      <div class="one"><h3 data-edit="true" data-selector="h3" class="">CONTACT<br>Oh My Baby korea co.</h3></div> 
      <div class="two"><h4 data-edit="true" data-selector="h4">LOCATION</h4>
      <p class="text" data-edit="true" data-selector="p.text">5f, 10-1, &nbsp;hwayang-dong, Gwangjin-gu,
      <br>Seoul, Korea<br><br>서울특별시 광진구 화양동 10-1 <br>한아름쇼핑센터 5층&nbsp;</p>
      </div>
      <div class="three"><h4 data-edit="true" data-selector="h4">CALL</h4>
      <p class="text" data-edit="true" data-selector="p.text">TEL. 02-561-4331<br>HP. 010-8872-2838<br>E-mail. sitter21@naver.com</p>
      </div>
      <div class="four"><h4 data-edit="true" data-selector="h4">FOLLOW</h4>
      <p class="text" data-edit="true" data-selector="p.text">Instgram<br>Behance<br>Facebook<br>Twitter</p>
      </div>
      
      </div>
      
      </div>
   </div>

</div>

<!--       <div class="cont3 content clearfix" style="background-color: #ccc;"></div> -->

<!--// container -->


<%@ include file="./include/footer.jsp"%>