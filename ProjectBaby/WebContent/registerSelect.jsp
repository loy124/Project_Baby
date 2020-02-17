<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<style>
.containerWrap {
	display: flex;
	align-items: center;
	
}


.sort {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100%;
}

.sort>* {
	margin-bottom: 20px;
}

.btn-member {
	background-color: #FFCBC9;
	height: 80px;
	width: 400px;
}

.btn-sitter {
	background-color: #FFA2A6;
	height: 80px;
	width: 400px;
}

.btn{
margin-top:20px;
}
</style>
<body>
	<%@ include file="./include/header.jsp"%>

	<div class="containerWrap main">
		<div class="container_inner">
			<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
			<div class="sort cont2 content clearfix"
				style="background-color:#ffffff;">
				<button class="btn btn-lg btn-member"
					onclick="location.href='register?type=moveRegisterMember'">일반
					회원 가입</button>
				<button class="btn btn-lg btn-sitter"
					onclick="location.href='register?type=moveRegisterSitter'">시터
					회원 가입</button>
			</div>

		</div>
	</div>

	<%@ include file="./include/footer.jsp"%>
</body>

</html>