<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
	<%
		BabyMemberDto dto = (BabyMemberDto) request.getAttribute("dto");

		if (dto != null) {
			System.out.println("dto = " + dto.toString());
		}
	%>
	<%@ include file="./include/header.jsp"%>
	<div class="containerWrap main">
		<div class="container_inner">
			<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
			<div class="cont1 content clearfix" style="background-color: #ccc;">
				<form action="adminUpdate">
					<input type="hidden" name="type" value="updateAf">
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
								}
							else if (dto.getAuth() == 8) {
							%>
							<td colspan="2" align="center">회원 정보 : 시터(고용중)</td>
							<%
								}
							%>

						</tr>
						<tr>
							<th>아이디(이메일)</th>
							<td><input class="form-control" readonly="readonly"
								name="id" value="<%=dto.getId()%>"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input class="form-control" readonly="readonly"
								value="<%=dto.getName()%>"></td>
						</tr>
						<tr>
							<th>나이</th>
							<td><input class="form-control" readonly="readonly"
								value="<%=dto.getAge()%>"></td>
						</tr>
						<tr>
							<th>성별</th>
							<td><input class="form-control" readonly="readonly"
								value="<%=dto.getGender()%>"></td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<%-- <input class="form-control"
							name="address" value="<%=dto.getAddress()%>"> --%>
								<div class="form-address">
									<div>주소</div>
									<div>
										<input type="text" name="zipCode" id="sample4_postcode"
											placeholder="우편번호"> <input type="button"
											onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
									</div>
									<div></div>
									<div>
										<input type="text" name="roadAddress" id="sample4_roadAddress"
											placeholder="도로명주소" size="30">
										<%-- <input type="text"
							name="numberAddress" id="sample4_jibunAddress"
							placeholder="지번주소" size="30"> --%>
									</div>
									<span id="guide" style="color: #999; display: none"></span>
									<div>
										<input type="text" name="detailAddress"
											id="sample4_detailAddress" placeholder="상세주소">
									</div>
								</div>

							</td>
						</tr>
						<tr>
							<th>휴대폰 번호</th>
							<td><input class="form-control" name="phoneNumber"
								value="<%=dto.getPhoneNumber()%>"></td>
						</tr>
						<tr>
							<th>계좌번호</th>
							<td><input class="form-control" name="account"
								value="<%=dto.getBankAccount()%>"></td>
						</tr>
						<tr>
							<th>계좌에 담긴 돈</th>
							<td><input class="form-control" readonly="readonly"
								name="accountMoney" value="<%=dto.getBankAccountMoney()%>"></td>
						</tr>
						<tr>
							<th>가입상태</th>
							<td><input class="form-control" name="auth"
								value="<%=dto.getAuth()%>"></td>
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
							<td><input class="form-control" name="license"
								value="<%=dto.getLicense()%>"></td>
						</tr>
						<tr>
							<th>원하는 시급</th>
							<td><input class="form-control" name="wantPay"
								value="<%=dto.getWantPay()%>"></td>
						</tr>
						<tr>
							<th>경력</th>
							<td><input class="form-control" name="career"
								value="<%=dto.getCareer()%>"></td>
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
						<td><input class="form-control" 
							name="profilePhoto" value="<%=dto.getProfilePhoto()%>"></td>
					</tr> --%>
						<tr>
							<th>자기소개</th>
							<td><input class="form-control" name="introduce"
								value="<%=dto.getIntroduce()%>"></td>
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
									if(dto.getWantDate() != null){
										for (int i = 0; i < dto.getWantDate().length; i++) {
											if (i == 0) {
												str = dto.getWantDate()[0];
											} else {
												str = str + "," + dto.getWantDate()[i];
											}
										}
									}
							%>
							<th>원하는 요일</th>
							<td><input class="form-control" name="wantDate"
								value="<%=str%>"></td>
						</tr>
						<tr>
							<th>원하는 지역</th>
							<td><input class="form-control" name="wantLocal"
								value="<%=dto.getWantLocal()%>"></td>
						</tr>
						<tr>
							<th>원하는 시간</th>
							<td><input class="form-control" name="wantTime"
								value="<%=dto.getWantTime()%>"></td>
						</tr>
						<%
							}
						%>
					</table>
					<input class="btn btn-info btn-block" type="submit" value="수정하기">
				</form>
			</div>

		</div>
	</div>
	<%@ include file="./include/footer.jsp"%>
	<script>
		//주소 받아오기

		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							//document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							/* if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							} */

							var guideTextBox = document.getElementById("guide");
							document.getElementById("sample4_detailAddress")
									.focus();
						}

					}).open();
		}
	</script>
</body>
</html>