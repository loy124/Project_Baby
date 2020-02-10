<%@page import="java.util.List"%>
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
<body>
	<%
		List<BabyMemberDto> list = (List<BabyMemberDto>) request.getAttribute("memberList");
	%>
	<%@ include file="./include/header.jsp"%>
	<!-- <table class="table table-striped .table-bordered .table-hover">
  
</table> -->

	<div class="containerWrap main">
		<div class="container_inner">
			<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
			<div class="cont1 content clearfix" style="background-color: #ccc;">
				<table class="table table-bordered table-hover">
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>가입상태</th>
					</tr>
					<%
						if (list == null || list.size() == 0) {
					%>
					<tr>
						<td colspan="4">가입한 회원이 없습니다</td>
					</tr>
					<%
						} else {
							for (int i = 0; i < list.size(); i++) {
								BabyMemberDto dto = list.get(i);
					%>
					<tr>
						<th><%=i + 1%></th>
						<td><a href="adminDetail?type=moveDetail?id=<%=dto.getId()%>"><%=dto.getId()%></a></td>
						<td><%=dto.getName()%></td>
						<td><%=dto.getAuth()%></td>
					</tr>
					<%
						}
						}
					%>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="./include/footer.jsp"%>
</body>
</html>