<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Baby</title>

<!-- style -->
<link rel="stylesheet" type="text/css" href="css/reset.css" />
<link rel="stylesheet" type="text/css" href="css/layout.css" />

<!-- webfont -->
<link href='http://fonts.googleapis.com/earlyaccess/nanumgothic.css'
	rel='stylesheet' type='text/css' />
<link
	href='http://fonts.googleapis.com/earlyaccess/nanumbrushscript.css'
	rel='stylesheet' type='text/css' />

<!-- ie cheker -->
<script type="text/javascript" src="js/ie-checker.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<script type="text/javascript">
$(document).ready(function(){
	/*gnb*/
	$('.gnb > li').mouseenter(function(){
		$('.sub_menu',this).show();
		$('> a',this).css({'color':'#0885c4'})
	}).mouseleave(function(){
		$('.sub_menu',this).hide();
		$('> a',this).css({'color':'#fff'})
	});
}
</script>

<body>
	<header class="headerWrap">
		<div class="header clearfix tr">
			<div class="header_topSec clearfix">
				<ul class="clearfix">
					<li><a href="#n">로그인</a></li>
					<li><a href="#n">회원가입</a></li>
				</ul>
			</div>
			<div class="inner_header clearfix">
				<h1>
					<a href="#" class="logo">
						<img src="images/">
					</a>
				</h1>
				<ul class="gnb clearfix">
					<li>
						<a href="" style="color: rgb(255, 255, 255);">Mypage</a>
						<ul class="sub_menu" style="display: none;">
							<li><a href="">예약 내역 확인</a></li>
							<li><a href="">내 포인트 관리</a></li>
							<li><a href="">지난 이력 확인</a></li>
							<li><a href="">내 계정 관리</a></li>
						</ul>
					</li>
					<li>
						<a href="" style="color: rgb(255, 255, 255);">Service</a>
						<ul class="sub_menu" style="display: none;">
							<li>
								<a href="">거래소 다운로드</a>
							</li>
							<li><a href="">인증센터</a></li>
							<li><a href="">전자지갑주소</a></li>
							<li><a href="">회원정보</a></li>
							<li><a href="">자산현황</a></li>
							<li><a href="">내 거래내역</a></li>
							<li><a href="">접속정보</a></li>
							<li><a href="">API관리</a></li>
						</ul>
					</li>
					<li>
						<a href="1_sub_03_customer_01_faq.html" style="color: rgb(255, 255, 255);">고객센터</a>
						<ul class="sub_menu" style="display: none;">
							<li><a href="">FAQ</a></li>
							<li><a href="">공지사항</a></li>
							<li><a href="">1:1문의</a></li>
							<li><a href="">수수료 및 입출금한도</a></li>
							<li><a href="">Market Cap</a></li>
							<li><a href="">인증자료제출</a></li>
							<li><a href="">암호화폐 정보</a></li>
						</ul>
					</li>
					<li>
						<a href="" style="color: rgb(255, 255, 255);">커뮤니티</a>
					</li>
				</ul>
			</div>
		</div>
	</header>
