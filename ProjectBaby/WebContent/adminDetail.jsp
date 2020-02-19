<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
input {
	width: 50%;
}
</style>

</head>
<body>
	<%
		BabyMemberDto dto = (BabyMemberDto) request.getAttribute("dto");

		if (dto != null) {
			System.out.println("dto = " + dto.toString());
		}
	%>

	<%@ include file="./include/header.jsp"%>

	<!-- auth !=1 (관리자가 아닌 사람이 올 경우) 바로 메인으로 보내버리기 -->
	<%
		if (babyMemberDto.getAuth() != 1) {
	%>
	<script type="text/javascript">
		location.href = "login?type=moveMain"
	</script>
	<%
		}
	%>

	<div class="containerWrap main">
		<div class="container_inner">
			<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
			<div class="cont1 content clearfix" style="background-color: #ccc;">
				<table class="table table-bordered table-hover"
					style="background-color: #f2f2f2">
					<tr>
						<%
							if (dto.getAuth() == 1) {
						%>
						<td colspan="2" align="center">회원 정보 : 관리자</td>
						<%
							} else if (dto.getAuth() == 3) {
						%>
						<td colspan="2" align="center">회원 정보 : 일반 사용자</td>
						<%
							} else if (dto.getAuth() == 4) {
						%>
						<td colspan="2" align="center">회원 정보 : 시터(승인됨)</td>
						<%
							} else if (dto.getAuth() == 5) {
						%>
						<td colspan="2" align="center">회원 정보 : 시터(미승인)</td>
						<%
							} else if (dto.getAuth() == 6) {
						%>
						<td colspan="2" align="center">회원 정보 : 시터(거부됨)</td>
						<%
							} else if (dto.getAuth() == 7) {
						%>
						<td colspan="2" align="center">회원 정보 : 시터(회원 탈퇴된 아이디)</td>
						<%
							} else if (dto.getAuth() == 8) {
						%>
						<td colspan="2" align="center">회원 정보 : 시터(고용중)</td>
						<%
							}
						%>
					</tr>
					<tr>
						<th>아이디(이메일)</th>
						<td><input class="form-control" readonly="readonly" name="id"
							value="<%=dto.getId()%>"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input class="form-control" readonly="readonly"
							name="name" value="<%=dto.getName()%>"></td>
					</tr>
					<tr>
						<th>나이</th>
						<td><input class="form-control" readonly="readonly"
							name="age" value="<%=dto.getAge()%>"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td><input class="form-control" readonly="readonly"
							name="gender" value="<%=dto.getGender()%>"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input class="form-control" readonly="readonly"
							name="address" value="<%=dto.getAddress()%>"></td>
					</tr>

					<tr>
						<th>휴대폰 번호</th>
						<td><input class="form-control" readonly="readonly"
							name="phone-number" value="<%=dto.getPhoneNumber()%>"></td>
					</tr>

					<tr>
						<th>계좌번호</th>
						<td><input class="form-control" readonly="readonly"
							name="account" value="<%=dto.getBankAccount()%>"></td>
					</tr>
					<tr>
						<th>계좌에 담긴 돈</th>
						<td><input class="form-control" readonly="readonly"
							name="accountNumber" value="<%=dto.getBankAccountMoney()%>"></td>
					</tr>
					<tr>
						<th>가입상태</th>
						<td><input class="form-control" readonly="readonly"
							name="registerDate" value="<%=dto.getAuth()%>"></td>
					</tr>
					<tr>
						<th>포인트</th>
						<td><input class="form-control" readonly="readonly"
							name="point" value="<%=dto.getPoint()%>"></td>
					</tr>
					<tr>
						<th>시터에게 요청한 날</th>
						<td><input class="form-control" readonly="readonly"
							name="customerRequestDate"
							value="<%=dto.getCustomerRequestDate()%>"></td>
					</tr>
					<tr>
						<th>가입날짜</th>
						<td><input class="form-control" readonly="readonly"
							name="registerDate" value="<%=dto.getRegisterDate()%>"></td>
					</tr>
					<tr>
						<th>탈퇴날짜</th>
						<td><input class="form-control" readonly="readonly"
							name="unRegisterDate" value="<%=dto.getUnRegisterDate()%>"></td>
					</tr>
					<%
						if (dto.getAuth() == 5 || dto.getAuth() == 6 || dto.getAuth() == 4) {
					%>
					<tr>
						<th>자격증</th>
						<td><input class="form-control" readonly="readonly"
							name="license" value="<%=dto.getLicense()%>"></td>
					</tr>
					<tr>
						<th>원하는 시급</th>
						<td><input class="form-control" readonly="readonly"
							name="wantpay" value="<%=dto.getWantPay()%>"></td>
					</tr>
					<tr>
						<th>경력</th>
						<td><input class="form-control" readonly="readonly"
							name="career" value="<%=dto.getCareer()%>"></td>
					</tr>

					<!-- <tr>
						<th>고용일</th>
						<td><input class="form-control" readonly="readonly"   name="" value="" ></td>
					</tr>
					<tr>
						<th>고용해제일</th>
						<td><input class="form-control" readonly="readonly"   name="" value="" ></td>
					</tr> -->
					<%-- <tr>
						<th>프로필사진</th>
						<td><input class="form-control" readonly="readonly"
							name="profilePhoto" value="<%=dto.getProfilePhoto()%>"></td>
					</tr> --%>
					<tr>
						<th>자기소개</th>
						<td><input class="form-control" readonly="readonly"
							name="introduce" value="<%=dto.getIntroduce()%>"></td>
					</tr>
					<tr>
						<th>일을 시작한 날</th>
						<td><input class="form-control" readonly="readonly"
							name="startWorkDate" value="<%=dto.getStartWorkDate()%>"></td>
					</tr>
					<tr>
						<th>일이 종료된 날</th>
						<td><input class="form-control" readonly="readonly"
							name="endWorkDate" value="<%=dto.getEndWorkDate()%>"></td>
					</tr>
					<tr>
						<%
							String str = "";
								if (dto.getWantDate() != null) {
									for (int i = 0; i < dto.getWantDate().length; i++) {
										if (i == 0) {
											str = dto.getWantDate()[0];
										} else {
											str = str + "," + dto.getWantDate()[i];
										}
									}
								}
						%>
						<th>원하는 날</th>
						<td><input class="form-control" readonly="readonly"
							name="wantDate" value="<%=str%>"></td>
					</tr>
					<tr>
						<th>원하는 지역</th>
						<td><input class="form-control" readonly="readonly"
							name="wantLocal" value="<%=dto.getWantLocal()%>"></td>
					</tr>
					<tr>
						<th>원하는 시간</th>
						<td><input class="form-control" readonly="readonly"
							name="wantTime" value="<%=dto.getWantTime()%>"></td>
					</tr>
					<%
						}
					%>
				</table>
				<div>
					<button id="adminUpdate" class="btn btn-info btn-block">수정</button>
					<button id="adminDelete" class="btn btn-danger btn-block">탈퇴처리(AUTH변경)</button>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="./include/footer.jsp"%>

	<script>
	$("#adminUpdate").click(function() {
		location.href= "adminUpdate?type=moveUpdate&id=<%=dto.getId()%>";});
	
	$("#adminDelete").click(function() {
		location.href= "adminDelete?type=deleteAf&id=<%=dto.getId()%>";});
	</script>
</body>
</html>