<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
System.out.println(id);
%>
<%@ include file="./include/header.jsp"%>
<div class="containerWrap main">
	<div class="container_inner">
		<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
		<div class="cont1 content clearfix" style="background-color: #ccc;">
		
		</div>
		
	</div>
</div>
<%@ include file="./include/footer.jsp"%>
</body>
</html>