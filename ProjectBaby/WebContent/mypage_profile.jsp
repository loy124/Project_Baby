<%@page import="main.BabyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="./include/header.jsp"%>
<style>
.abs {
	color: #ff9999
}

.mypage .boxs {
	display: flex;
	flex-direction: row;
	float: left;

	/*     margin-right: 10px; */
}

.mypage .box1 {
	flex-direction: column;
	height: 620px;
	width: 300px;
	text-align: center;
	/*   align-self:center; */
	background-color: rgba(205, 255, 254, 0.8);
}

.mypage .box2 {
	flex-direction: column;
	height: 620px;
	width: 500px;
	background-color: rgba(190, 255, 239, 0.8);
	padding-left: 50px;
}

.mypage .box3 {
	flex-direction: column;
	height: 620px;
	width: 300px;
	background-color: rgba(190, 255, 239, 0.8);
	padding-top: 60px;
	text-align: center;
	padding-right: 70px;
}

.menu>a:hover {
	text-decoration: underline;
	color: #ff9999;
}
</style>

<%
	BabyMemberDto dto = (BabyMemberDto) request.getSession().getAttribute("login");
	System.out.println("오오" + dto.getWantDate()[1]);
%>
<%
	String day[] = {"월", "화", "수", "목", "금", "토", "일"};

	if (dto.getWantDate() != null) {
		for (int i = 0; i < dto.getWantDate().length; i++) {
			System.out.println(dto.getWantDate()[i] + "aa");
			for (int j = 0; j < day.length; j++) {
				if (dto.getWantDate()[i].equals(day[j])) {
%>
<script>
            $(document).ready(function() {
               $("input[value=<%=dto.getWantDate()[i]%>]").prop("checked", true);
               });
</script>
<%
	}
			}
		}
	}
%>

<!-- content 영역 -->

<div class="container_inner mypage">
	<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
	<div class="cont1 content clearfix mypage" style="height: 620px">

		<div class="boxs box1">
			<p style="padding-top: 30px;">
				<b class="abs" style="font-size: 25pt;">MyPage</b>
			</p>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<table>
				<tr>
					<%
						if (dto.getRealFileName() == null || dto.getRealFileName() == "null") {
					%>
					<span> <img src='./image/user.png'
						style="border-radius: 100%;" width='110x' height='110px'>
					</span>
					<%
						} else {
					%>

					<span> <img
						src='http://localhost:8090/ProjectBaby/upload/<%=dto.getRealFileName()%>'
						style="border-radius: 100%;" width='110px' height='110px'>
					</span>
					<%
						}
					%>

				</tr>
			</table>

			<br>

			<table style="background-color: #f0f0f0; height: 30px;">
				<col width="130px">
				<tr>
					<td style="text-align: center; font-size: 15pt;">
						<p style="padding-top: 5px;"><%=dto.getName()%>님
						</p>
					</td>
				</tr>
				<tr>
					<td>
						<p
							style="font-size: 9pt; text-align: center; font-weight: bold; padding-bottom: 10px;">
							<%=dto.getId()%></p>
					</td>
				</tr>
			</table>
			<br>
			<div>
				<table
					style="background-color: #f0f0f0; size: '30'; font-size: '14px'; height: '13px'; margin-left: 50px;">
					<col width="200px">
					<tr>
						<td style="text-align: center;">
							<p style="margin: 3px; padding-top: 17px;" class="menu">
								<a href="mypage_main.jsp">예약 내역 확인</a>
							</p>
						</td>
					</tr>

					<tr>
						<td style="text-align: center;">
							<p style="margin: 3px;" class="menu">
								<a href="mypage_imageUpdate.jsp">프로필 사진 업데이트</a>
							</p>
						</td>
					</tr>
					<tr>
						<td style="text-align: center;">
							<p style="margin: 3px;" class="menu">
								<a href="mypage_point.jsp">내 포인트 관리</a>
								<!-- <a href="bbsWrite?type=write"> -->
							</p>
						</td>
					</tr>

					<tr>
						<td style="text-align: center">
							<p style="margin: 3px; color: #ff9999; padding-bottom: 17px;"
								class="menu">
								&nbsp;&nbsp;<img src='./image/arrow.png' width='10px'
									height='10px' /> &nbsp; <a href="mypage_profile.jsp">내 계정
									관리</a>
							</p>
						</td>
					</tr>

				</table>
			</div>
		</div>

		<form class="update_form" id="update_form" action="userProfileServlet">
			<div class="boxs box2">

				<p style="padding-top: 50px;">
					<b class="title" style="font-size: 15pt; color: #82a3d4;">개인정보
						수정</b>
				</p>
				<br>
				<table class="box1_table">
					<col style="width: 120px;">
					<col style="width: 320px;">
					<tr style="height: 35px;">
						<td>id :</td>
						<td><input type="text" name="id"
							style="width: 200px; height: 30px;" value="<%=dto.getId()%>"></td>
					</tr>
					<tr style="height: 35px;">
						<td>Password :</td>
						<td><input type="text" name="password"
							placeholder="패스워드를 입력해주세요" style="width: 200px; height: 30px">
						</td>
					</tr>

					<tr style="height: 35px;">
						<td>이름 :</td>
						<td><input type="text" name="name"
							style="width: 200px; height: 30px;" value="<%=dto.getName()%>">
						</td>
					</tr>
					<tr style="height: 35px;">
						<td>핸드폰번호 :</td>
						<td><input type="text" name="phoneNumber"
							style="width: 200px; height: 30px;"
							value="<%=dto.getPhoneNumber()%>"></td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="form-address">
								<br>
								<div>주소</div>
								<div>
									<input type="text" name="zipCode" id="sample4_postcode"
										placeholder="우편번호" style="width: 300px; height: 30px;"
										value="<%=dto.getAddress()%>"> <input type="button"
										onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
								</div>
								<div></div>
								<div>
									<input type="text" name="roadAddress" id="sample4_roadAddress"
										placeholder="도로명주소" size="20"
										style="width: 300px; height: 30px;">
									<%-- <input type="text"
							name="numberAddress" id="sample4_jibunAddress"
							placeholder="지번주소" size="30"> --%>
								</div>
								<span id="guide" style="color: #999; display: none"></span>
								<div>
									<input type="text" name="detailAddress"
										id="sample4_detailAddress" placeholder="상세주소"
										style="width: 300px; height: 30px;">
								</div>
								<br>
							</div>
						</td>
					</tr>
					<tr style="height: 35px;">

						<td>원하는 시급 :</td>
						<td><input type="number" name="wantPay" min="8590"
							style="width: 200px; height: 30px;" value="<%=dto.getWantPay()%>">원
						</td>
					</tr>
					<tr style="height: 35px;">
						<td>경력 :</td>
						<td><select name="career" selected="<%=dto.getCareer()%>">
								<option value="신입">신입</option>
								<option value="1~3년">1~3년</option>
								<option value="4~5년">4~5년</option>
								<option value="5년이상">5년이상</option>
						</select></td>
					</tr>
					<tr style="height: 35px;">
						<td colspan="2"><span>원하는 요일 : </span>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span><input type="checkbox" name="wantDate" value="월">월</span>
							<span><input type="checkbox" name="wantDate" value="화">화</span>
							<span><input type="checkbox" name="wantDate" value="수">수</span>
							<span><input type="checkbox" name="wantDate" value="목">목</span>
							<span> <input type="checkbox" name="wantDate" value="금">금
						</span> <span><input type="checkbox" name="wantDate" value="토">토</span>
							<span><input type="checkbox" name="wantDate" value="일">일</span>
						</td>

					</tr>
					<tr style="height: 35px;">
						<td>원하는 지역 :</td>
						<td><select name="wantLocal">
								<option value="서울">서울</option>
								<option value="경기도">경기도</option>
								<option value="강원도">강원도</option>
								<option value="충청남도">충청남도</option>
								<option value="충청북도">충청북도</option>
								<option value="전라북도">전라북도</option>
								<option value="전라남도">전라남도</option>
								<option value="경상북도">경상북도</option>
								<option value="경상남도">경상남도</option>
						</select></td>
					</tr>
					<tr style="height: 35px;">
						<td>원하는 시간대 :</td>
						<td><select name="wantTime">
								<option>6시 ~ 10시</option>
								<option>10시 ~ 12시</option>
								<option>12시 ~ 16시</option>
								<option>16시 ~ 20시</option>
								<option>20시 ~ 24시</option>
						</select></td>
					</tr>
				</table>
			</div>



			<div class="boxs box3">


				<div class="image_file" align="center">

					<%
						if (dto.getRealFileName() == null || dto.getRealFileName() == "null") {
					%>
					<span> <img src='./image/user.png'
						style="border-radius: 100%;" width='110x' height='110px'>
					</span>
					<%
						} else {
					%>

					<span> <img
						src='http://localhost:8090/ProjectBaby/upload/<%=dto.getRealFileName()%>'
						style="border-radius: 100%;" width='110px' height='110px'>
					</span>
					<%
						}
					%>
				</div>
				<br>
				<div class="form-want-introduce">
					<p style="text-align: left; padding-left: 20px;">내 계좌번호</p>
					<input type="text" name="account"
						style="width: 200px; height: 30px;"
						value="<%=dto.getBankAccount()%>"> <br> <br>
					<p style="text-align: left; padding-left: 20px;">자기소개</p>
					<textarea rows="10" cols="25" name="introduce"><%=dto.getIntroduce()%></textarea>
					<br> <br>
					<div class="finalBtn" style="padding-left: 100px;">
						<input type="submit" value="수정하기" style="width: 100px;">
					</div>
				</div>
			</div>
		</form>
		<!-- ============================================================================================================================= -->



	</div>
</div>

<!--// container -->


<%@ include file="./include/footer.jsp"%>