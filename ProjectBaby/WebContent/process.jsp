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
String type = request.getParameter("type");
String sIsS = request.getParameter("isS");
boolean isS = Boolean.parseBoolean(sIsS);
%>

<%
if(type.equals("register")){
	%>
	<script>
	alert("회원가입이 완료되었습니다")
	location.href = "login?type=moveLogin";
	</script>
	
	<%
} else {
%>
<script>
	alert("회원가입이 되지 않았습니다");
	location.href = "login?type=moveLogin";
	</script>
<%
}
%>

</body>
</html>