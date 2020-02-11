<%@page import="main.BabyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Oh My Baby</title>

<!-- favicon 16, 24, 32, 64, 152 -->
<link rel="shortcut icon" href="./images/front/favicon.ico">
<link rel="apple-touch-icon" href="./images/front/icon_57.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="./images/front/icon_72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="./images/front/icon_114.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="./images/front/icon_144.png">

<link href="css/front/reset.css" rel="stylesheet">
<link href="css/front/common.css" rel="stylesheet">
<link href="css/front/layout.css" rel="stylesheet">
<link href="css/front/style.css" rel="stylesheet">

<script src="js/front/jquery-3.1.0.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script src="js/front/jquery.bxslider.js"></script>
<script src="js/front/common.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<%
	BabyMemberDto babyMemberDto = (BabyMemberDto) session.getAttribute("login");
	if (babyMemberDto != null) {
		System.out.println("로그인후 dto" + babyMemberDto.toString());
	}
%>

<body>
	<header class="headerWrap">
		<div class="header clearfix tr">
			<div class="header_topSec clearfix">
				<%
					if (babyMemberDto != null) {
				%>
				<%
					if (babyMemberDto.getAuth() == 1) {
				%>
				<ul class="clearfix">
					<li><%=babyMemberDto.getName()%>님 환영합니다</li>
					<li><a href="admin?type=moveAdmin" id="loginBtn">관리자페이지</a></li>
					<li><a href="login?type=logout" id="loginBtn">로그아웃</a></li>
				</ul>
				<%
					} else {
				%>
				<ul class="clearfix">
					<li><%=babyMemberDto.getName()%>님 환영합니다</li>
					<li><a href="#" id="loginBtn">마이페이지</a></li>
					<li><a href="login?type=logout" id="loginBtn">로그아웃</a></li>
				</ul>
				<%
					}
				%>

				<%
					} else {
				%>
				<ul class="clearfix">
					<li><a href="login?type=moveLogin" id="loginBtn">로그인</a></li>
					<li><a href="register?type=moveRegister">회원가입</a></li>
				</ul>
				<%
					}
				%>

			</div>
			<div class="inner_header clearfix">
				<h1>
					<a href="main.jsp" class="logo"> <img
						src="images/front/logo.png"> <!-- <span>내 아이를 부탁해</span> -->
					</a>
				</h1>
				<%
					if (babyMemberDto != null) {
						if (babyMemberDto.getAuth() == 1) {
				%>
				<ul class="gnb clearfix">
					<li><a href="">회원정보관리</a>
						<ul class="sub_menu">
							<!-- <li><a href="">회원정보 관리</a></li>
							<li><a href=""></a></li> -->
						</ul></li>
					<li><a href="">Service</a>
						<ul class="sub_menu">
							<li><a href="">돌봄 신청</a></li>
							<li><a href="">구인구직</a></li>
						</ul></li>

					<li><a href="">고객센터</a>
						<ul class="sub_menu">
							<li><a href="">오시는길</a></li>
							<li><a href="">Q&A</a></li>
						</ul></li>

					<li><a href="">커뮤니티</a>
						<ul class="sub_menu">
							<li><a href="">후기게시판</a></li>
							<li><a href="">자유게시판</a></li>
						</ul></li>

				</ul>
				<%
					} else {
				%>
				<ul class="gnb clearfix">
					<li><a href="">Mypage</a>
						<ul class="sub_menu">
							<li><a href="">예약내역 확인</a></li>
							<li><a href="">내 포인트 관리</a></li>
							<li><a href="">지난 이력확인</a></li>
							<li><a href="">내 계정 관리</a></li>
						</ul></li>
					<li><a href="">Service</a>
						<ul class="sub_menu">
							<li><a href="">돌봄 신청</a></li>
							<li><a href="">구인구직</a></li>
						</ul></li>

					<li><a href="">고객센터</a>
						<ul class="sub_menu">
							<li><a href="">오시는길</a></li>
							<li><a href="">Q&A</a></li>
						</ul></li>

					<li><a href="">커뮤니티</a>
						<ul class="sub_menu">
							<li><a href="">후기게시판</a></li>
							<li><a href="">자유게시판</a></li>
						</ul></li>

				</ul>
				<%
					}
					}
				%>

			</div>
		</div>
	</header>
	<!--// header -->