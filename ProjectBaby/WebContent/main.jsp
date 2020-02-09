<%@page import="main.BabyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="./include/header.jsp" %>

<!-- content 영역 -->
<%
/* BabyMemberDto babyMemberDto = (BabyMemberDto)session.getAttribute("login");
if(babyMemberDto != null){
	System.out.println("로그인후 dto" + babyMemberDto.toString());
} */
%>
<div class="containerWrap main">
	<div class="container_inner">
		<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
		<div class="cont1 content clearfix" style="background-color: #ccc;"></div>
		<div class="cont2 content clearfix" style="background-color: #eee;"></div>
		<div class="cont3 content clearfix" style="background-color: #ccc;"></div>
	</div>
</div>
<!--// container -->


<%@ include file="./include/footer.jsp" %>