<%@page import="main.BabyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="./include/header.jsp"%>

<%
String myPoint = babyMemberDto.getPoint();

/* String payPoint = request.getParameter(""); */

%>

<div>

<div>포인트로 결제를 완료 하셔야 예약이 완료 됩니다(포인트차감, 마이페이지 이동하기)</div>
<div>

<!-- 포인트가 부족합니다 -->
<a href="#" class="btn btn-warning" role="button">??를 포인트로 결제합니다</a>
<!--  포인트가 없을 경우에 포인트가 부족합니다 마이페이지 카카오페이 결제화면으로 이동합니다 -->
<a href="#" class="btn btn-info" role="button">결제및 예약을 취소합니다.</a>
</div>
</div>
<%@ include file="./include/footer.jsp"%>