<%@page import="main.BabyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="./include/header.jsp"%>

<%
	String myPoint = babyMemberDto.getPoint();
	int payPoint = (Integer) request.getAttribute("payPoint");
	String userId = (String) request.getAttribute("userId");
	BabyMemberDto reserveDto = (BabyMemberDto) request.getAttribute("babyMemberDto");
	System.out.println("ㅇㅇㅇㅇ" + reserveDto.toString());

	/* String payPoint = request.getParameter(""); */
%>

<div>
	<div>포인트로 결제를 완료 하셔야 예약이 완료 됩니다(포인트차감, 마이페이지 이동하기)</div>
	<div>
		<!-- 포인트가 부족합니다 -->
		<div>
			<span style="width: 120px; display: inline-block;">해당 날짜 :</span> <span><%=reserveDto.getStartWorkDate()%></span>
			
		</div>
		<div>
			<span style="width: 120px; display: inline-block;">보유한 포인트 :</span> <span><%=myPoint%></span>
		</div>
		<div>
			<span style="width: 120px; display: inline-block;">결제해야할 포인트 :</span> <span><%=payPoint%></span>
		</div>
		<%
			if (Integer.parseInt(myPoint) > payPoint) {
		%>
		<div style="display: flex;">
			<form action="reserve">
			<input type="hidden" name="type" value="payPoint">
				<input type="hidden" name="wantDate" value="<%=reserveDto.getStartWorkDate()%>">
				<input type="hidden" name="payPoint" value="<%=payPoint%>">
				<input type="hidden" name="id" value="<%=reserveDto.getId()%>">
				<input type="hidden" name="workingHour" value="<%=reserveDto.getWorkingHour()%>">
				<input type="hidden" name="wantDate" value="<%=reserveDto.getWantDate()%>">
				<button type="submit" class="btn btn-warning" role="button"><%=payPoint%>포인트를
					차감해서 결제합니다
				</button>
			</form>
			<!--  포인트가 없을 경우에 포인트가 부족합니다 마이페이지 카카오페이 결제화면으로 이동합니다 -->
			<a style="margin-left: 40px;" href="employee.jsp"
				class="btn btn-info" role="button">결제및 예약을 취소합니다.</a>
		</div>
		<%
			} else {
		%>
		<a href="mypage_point.jsp" class="btn btn-warning" role="button">포인트가
			부족합니다 마이페이지 화면으로 이동하기</a>
		<!--  포인트가 없을 경우에 포인트가 부족합니다 마이페이지 카카오페이 결제화면으로 이동합니다 -->
		<a href="employee.jsp" class="btn btn-info" role="button">결제및 예약을
			취소합니다.</a>
		<%
			}
		%>
	</div>
</div>
<%@ include file="./include/footer.jsp"%>