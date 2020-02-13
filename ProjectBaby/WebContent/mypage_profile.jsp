<%@page import="main.BabyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="./include/header.jsp"%>
<style>

.mypage .boxs{
	display: flex;
}
.mypage .abs {
	color: #ff9999
}

.mypage .cont1 {
	padding: 35px;
}
.mypage .title{
  position: absolute;


	left: 545px;
    top:320px;
}
/* .profile_update{
  left: 50%;
  top: 10%; 

}
 */
.mypage .profile_update {

	margin-left: 180px;
	position: absolute;
	right: 620px;
	top:350px;
}

.mypage .image_file{
	position: absolute;
	right: -260px;
	bottom:380px;
	
	
}  

.mypage .form-want-introduce {
	/* position: absolute; */
	/*  background-color: #f0f0f0; */
	/* 	margin-left: 150px; */
	position: absolute;
	right: -300px;
	bottom:60px
}

.mypage .update_table1 td {
   height: 35px;
  } 
.mypage .menu>a:hover {
text-decoration:underline;
color: #82a3d4;
}  
  
.mypage .finalBtn{
	position: absolute;
	right: 0px;
	bottom:-50px
}
  
  
</style>

<%
	BabyMemberDto dto = (BabyMemberDto) request.getSession().getAttribute("login");
%>


<!-- content 영역 -->

	<div class="container_inner mypage">
		<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
		<div class="cont1 content clearfix"
			style="background-color:rgba(190,255,239,0.8); height: 620px">
			 
			 
	  <div class="box1 boxs"> <!-- //mypage와 메뉴까지 컬럼  style="width:px" -->
							        		<p>
												<b class="abs" style="font-size: 25pt;">MyPage</b>
											</p>
															<br> <br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<table>
									<tr>
				
										<span><img src='./image/user.PNG' width='110x' height='110px'> </span>
				
									</tr>
								</table>
								
								
											<br>
				
							<table  style="background-color: #f0f0f0; height:30px;" >
								<col width="200">
								<tr>
									<td style="text-align: center; font-size: 15pt;">
										<p style=" padding-top: 5px;"><%=dto.getName() %>님 </p>
									</td>
								</tr>
								<tr>
									<td>
										<p style="font-size: 9pt; text-align: center; font-weight: bold; padding-bottom:10px;">
											<%=dto.getId() %></p>
									</td>
								</tr>
							</table>
							<br> 
				<div >
							<table style="background-color: #f0f0f0; size: '30'; font-size: '14px'; height: '13px';">
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
											<a href="mypage_reservation.jsp">지난 이력 확인</a>
											<!-- <a href="bbsWrite?type=write"> -->
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
										<p style="margin: 3px; color: #ff9999; padding-bottom: 17px;" class="menu">
											&nbsp;&nbsp;<img src='./image/arrow.png' width='10px'
												height='10px' /> &nbsp; <a href="mypage_profile.jsp">내 계정
												관리</a>
										</p>
									</td>
								</tr>
				
							</table>
				</div>						
	  </div>
	  
	  <!-- 
	  <div class="box2 boxs"> <!-- //내 계정 관리 붵 원하는 시간대 까지 컬럼 -->
				    	    <p>
								<b class="title" style="font-size: 15pt; color: #82a3d4;">내 계정 관리</b>
							</p>
	  </div>
	  
	  
	  
				    <div class="box3 boxs"></div> <!-- //수정하기 까지-->








	


	







			<!-- ============================================================================================================================= -->



			<div align="left" class="profile_update">

				<form id="profile_update_Servlet" action="profileUpdateServlet"
					method="get">

                       	<!-- <input type="hidden" name="type" value="registerSitterAf"> -->

                   	  <!-- <table  style="border:1px solid black; ">  -->
                   	  <table class="update_table1">
						<col style="width:120px; height:30px;"/> <col style="width:300px; height:30px;"/>
						<tr>
							<td>id : </td>
							<td><input type="text" name="id" style="width: 200px; height: 30px;" value="<%=dto.getId()%>"></td>
					    </tr>
						<tr>
							<td>Password : </td>
							<td><input type="text"
								name="password" placeholder="패스워드를 입력해주세요"
								style="width: 200px; height: 30px">
							</td>
						</tr>
						
						<tr>
							<td>이름 : </td>
							<td><input type="text" name="name"
								style="width: 200px; height: 30px;" value="<%=dto.getName() %>">
							</td>
						</tr>
						<tr>
							<td>핸드폰번호 : </td>
							<td><input type="text"
								name="phoneNumber" style="width: 200px; height: 30px;" value="<%=dto.getPhoneNumber() %>">
							</td>
						</tr>

		</table>
		
		

						<%--주소--%>
						<div class="form-address">
						<br>
						<div>주소</div> 
							<div>
								<input type="text" name="zipCode" id="sample4_postcode"
									placeholder="우편번호" style="width: 300px; height: 30px;" value="<%=dto.getAddress() %>">
								<input type="button" onclick="sample4_execDaumPostcode()"
									value="우편번호 찾기">
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
						</div>
<br>
						 <table class="update_table1">
						 <!-- <table  style="border:1px solid black; ">  -->
						<col style="width:120px; height:50px;"/> <col style="width:300px; height:50px;"/>
						
						<tr>
							<td>원하는 시급 : </td>
							<td>
							 <input type="number" name="wantPay"
								min="8590"  style="width: 200px; height: 30px;" value="<%=dto.getWantPay()%>">원
						    </td>
						</tr>
						<tr>
							<td>경력 : </td>
							<td>
							 <select name="career" selected="<%=dto.getCareer() %>">
								<option value="신입">신입</option>
								<option value="1~3년">1~3년</option>
								<option value="4~5년">4~5년</option>
								<option value="5년이상">5년이상</option>
							</select>
						    </td>
						</tr>
						<tr>
							<td colspan="2">
							
							<span>원하는 요일 : </span> 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span><input type="checkbox" value="월">월</span>
							<span><input type="checkbox" name="wantDate" value="화">화</span>
							<span><input name="wantDate" type="checkbox" value="수">수</span>
							<span><input name="wantDate" type="checkbox" value="목">목</span>
							<span> <input name="wantDate" type="checkbox" value="금">금
							</span> <span><input name="wantDate" type="checkbox" value="토">토</span>
							<span><input name="wantDate" type="checkbox" value="일">일</span>
							</td>
			
						</tr>
						<tr>
							<td>원하는 지역 : </td>
							<td>
							 <select name="wantLocal">
								<option value="서울">서울</option>
								<option value="경기도">경기도</option>
								<option value="강원도">강원도</option>
								<option value="충청남도">충청남도</option>
								<option value="충청북도">충청북도</option>
								<option value="전라북도">전라북도</option>
								<option value="전라남도">전라남도</option>
								<option value="경상북도">경상북도</option>
								<option value="경상남도">경상남도</option>
							</select>
						    </td>
						</tr>
						<tr>
							<td>원하는 시간대 : </td>
							<td>
                            <select name="wantTime">
								<option>6시 ~ 10시</option>
								<option>10시 ~ 12시</option>
								<option>12시 ~ 16시</option>
								<option>16시 ~ 20시</option>
								<option>20시 ~ 24시</option>
							</select>
						    </td>
						</tr>

				</table>
				
				    <div class="image_file" align="center">
              				<img src='./image/user.PNG' width='110x' height='110px'> 
                    </div>
				

					<div class="form-want-introduce">
					    <div style="text-align: left" >내 계좌</div>
					    <input type="text" name="account" style="width: 200px; height: 30px;" value="<%=dto.getBankAccount() %>">
					    <br><br>
						<div style="text-align: left" >자기소개</div>
						<textarea rows="10" cols="25" name="introduce" ><%=dto.getIntroduce() %></textarea>
							
							<div class="finalBtn">
							 <input type="submit" value="수정하기">
							 <input type="reset" value="취소하기">
							 </div>


					</div>



				</form>

			</div>
			
		</div>

	</div>
	<!--// container -->


	<%@ include file="./include/footer.jsp"%>