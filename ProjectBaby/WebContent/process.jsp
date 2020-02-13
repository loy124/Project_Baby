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
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		System.out.println(type);
		String sIsS = request.getParameter("isS");
		boolean isS = Boolean.parseBoolean(sIsS);
		System.out.println("isS = " + isS);
	%>

	<%
		if (type.equals("register")) {
			if (isS == true) {
	%>
	<script>
		alert("회원가입이 완료되었습니다")
		location.href = "login?type=moveLogin";
	</script>
	<%
		} else {
	%>
	<script>
		alert("회원가입이 되지 않았습니다.")
		location.href = "login?type=moveLogin";
	</script>
	<%
		}
		}
	%>

	<%
		if (type.equals("login")) {
			String name = request.getParameter("name");
			//System.out.print("자네이름은 뭔가" + name);
			if (name != null && name != "") {
	%>
	<script>
		alert("<%=name%>님 환영합니다");
		location.href = "login?type=moveMain";
	</script>
	<%
		} else {
	%>
	<script>
		alert("로그인이 되지 않았습니다.")
		location.href = "login?type=moveLogin";
	</script>
	<%
		}
		}
	%>

	<!--  -->
	<%
		if (type.equals("adminUpdate")) {
			if (isS == true) {
	%>
	<script>
		alert("(관리자에서)회원정보 수정이 완료되었습니다")
		location.href = "admin?type=moveAdmin";
	</script>
	<%
		} else {
	%>
	<script>
		alert("(관리자에서)회원정보 수정이 되지 않았습니다.")
		location.href = "admin?type=moveAdmin";
	</script>
	<%
		}
		}
	%>

	<!--  -->
	<%
		if (type.equals("deleteMember")) {
			if (isS == true) {
	%>
	<script>
		alert("(관리자에서)회원이 탈퇴처리되었습니다(AUTH = 7)")
		location.href = "admin?type=moveAdmin";
	</script>
	<%
		} else {
	%>
	<script>
		alert("회원이 탈퇴처리되지 않았습니다");
		location.href = "admin?type=moveAdmin";
	</script>
	<%
		}
		}
	%>
	
	
	<%
		if (type.equals("kakao")) {
			if (isS == true) {
	%>
	<script>
		alert("결제가 완료되었습니다")
		location.href = "kakao?type=moveMypagePoint";
	</script>
	<%
		} else {
	%>
	<script>
		alert("결제가 완료되지 않았습니다")
		location.href = "kakao?type=moveMypagePoint";
	</script>
	<%
		}
		}
	%>


</body>
</html>