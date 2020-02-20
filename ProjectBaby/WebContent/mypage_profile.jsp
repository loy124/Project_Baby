<%@page import="main.BabyMemberDao"%>
<%@page import="main.BabyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
	padding-right:70px;
	
}
.menu>a:hover {
text-decoration:underline;
color: #ff9999;

}  
.mypage .content {
margin-bottom:100px;
}  

#finalUpdateBtn{

}
</style>

<%
	BabyMemberDto dto = (BabyMemberDto) request.getSession().getAttribute("login");
    BabyMemberDao dao = BabyMemberDao.getInstance();
    
    

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

					<%	if (dto.getRealFileName() == null || dto.getRealFileName() == "null") {
					%>
				<span>	<img src='./image/mainImage.png'
						style="border-radius: 100%;" width='110x' height='110px'> </span>
					<%
						} else {
					%>

				<span>	<img src='http://192.168.2.10:8090/ProjectBaby/upload/<%=dto.getRealFileName()%>'
						style="border-radius: 100%;" width='110px' height='110px'> </span>
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



		<form class="update_form" id="update_form" action="ProfileUpdateServlet" method="get">
		
<!-- 	=================================    box2 시작   =================================   -->
		
			<div class="boxs box2">

				<p style="padding-top: 50px;">
					<b class="title" style="font-size: 15pt; color: #82a3d4;">개인정보 수정</b>
				</p><br>
				<table class="box1_table">
					<col style="width: 120px;">
					<col style="width: 320px;">
					<tr  style=" height: 35px;">
						<td>id :</td>
						<td><input type="text" name="id"
							style="width: 200px; height: 30px;" value="<%=dto.getId()%>" readonly="readonly"></td>
					</tr>
					<tr style=" height: 35px;">
						<td>Password :</td>
						<td><input type="password" name="password" id="password"
							placeholder="패스워드를 입력해주세요" style="width: 200px; height: 30px">
						</td>
					</tr>
					
					<tr style=" height: 35px;">
							<td>이름 : </td>
							<td><input type="text" name="name"
								style="width: 200px; height: 30px;" value="<%=dto.getName() %>">
							</td>
						</tr>
				    <tr style=" height: 35px;">
							<td>핸드폰번호 : </td>
							<td><input type="text"
								name="phoneNumber" style="width: 200px; height: 30px;" value="<%=dto.getPhoneNumber() %>">
							</td>
					</tr>
					<tr>
					<td colspan="2">
							<div class="form-address">
					<br>	
						<p>주소</p> 
							
								<input type="text" name="zipCode" id="sample4_postcode"
									placeholder="우편번호" style="width: 300px; height: 30px;">
								<input type="button" onclick="sample4_execDaumPostcode()"
									value="우편번호 찾기">
							

								<input type="text" name="roadAddress" id="sample4_roadAddress"
									placeholder="도로명주소" size="20"
									style="width: 300px; height: 30px;"  value="<%=dto.getAddress() %>">
							
							
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
					</table>
					
		<!-- 	 ============================= hidden/visable 부분   =============================		 -->
					
					
	<%
		if (dto.getAuth() == 3 || dto.getAuth() == 9) {        //일반회원의 경우
	%>
			<div class="changeView" Style="visibility: hidden;">		
	<%
		} else if (dto.getAuth() == 4 || dto.getAuth() == 5 || dto.getAuth() == 6 || dto.getAuth() == 8) { //시터의 경우
    %>
				
			<div class="changeView" >		
    <%
		}else{
	%>
			<div class="changeView" >	
	<%
		}
	%>
					<table class="box1_table">
					<col style="width: 120px;">
					<col style="width: 320px;">
					
					
				 <tr style=" height: 35px;">
			<!-- 	<div class="hidden_visable" style="visibility: hidden;" > -->
							<td>원하는 시급 : </td>
							<td>
							 <input type="number" name="wantPay" step = 100
								min="8600"  style="width: 134px; height: 30px;" value="<%=dto.getWantPay()%>">원
						    </td> 
						</tr>
						<tr style=" height: 35px;">
							<td>경력 : </td>
							<td>
							 <select id="career" name="career" >	 
								<option value="신입">신입</option>
								<option value="1~3년">1~3년</option>
								<option value="4~5년">4~5년</option>
								<option value="5년초과">5년초과</option>
							</select>
						    </td>
						</tr>
					<!-- 	</div> -->

						
<%-- 						<!-- 경력 커리어 셀렉 출력 함수 -->
						<script type="text/javascript">
						$(document).ready(function () {					
							$("#career").val('<%=dto.getCareer() %>');
											
						});
						
						</script>
						 --%>
												
						
						
						<tr style=" height: 35px;">
							<td colspan="2">
							
							<span>원하는 요일 : </span> 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span><input name="wantDate" id="wantDate" type="checkbox"  value="월">월</span>
							<span><input name="wantDate" id="wantDate" type="checkbox"  value="화">화</span>
							<span><input name="wantDate" id="wantDate" type="checkbox" value="수">수</span>
							<span><input name="wantDate" id="wantDate" type="checkbox" value="목">목</span>
							<span> <input name="wantDate" id="wantDate" type="checkbox" value="금">금
							</span> <span><input name="wantDate" id="wantDate" type="checkbox" value="토">토</span>
							<span><input name="wantDate" id="wantDate" type="checkbox" value="일">일</span>
							</td>
			
						</tr>
						
						
						<!-- 원하는  요일 체크박스 출력 함수 -->
						 <%
						String day[] = {"월", "화", "수", "목", "금", "토", "일"};
						
						if(dto.getWantDate() != null){
						   for(int i = 0; i < dto.getWantDate().length; i++){
						      System.out.println(dto.getWantDate()[i] + i+"번째 요일");
						      for(int j = 0; j< day.length; j++){
						         if(dto.getWantDate()[i].equals(day[j])){
						            %>
						            <script>
						            $(document).ready(function () {
						               
						               $("input[value=<%=dto.getWantDate()[i]%>]").prop("checked", true);
						            });
						            </script>
						            <%
						         }
						      }
						   }
						}
						%> 
						
						
						
						
						<tr style=" height: 35px;">
							<td>원하는 지역 : </td>
							<td>
							 <select name="wantLocal" id="wantLocal">
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
						
<%-- 						
						<script type="text/javascript">
							$(document).ready(function () {
								<!-- 지역 select문 옵션 출력 함수 -->
								$("#wantLocal").val('<%=dto.getWantLocal() %>');
								
							});
						</script> --%>
						
												
						
						
						
						
					<tr style=" height: 35px;">
							<td>원하는 시간대 : </td>
							<td>
                            <select name="wantTime" id="wantTime">
								<option value="6시~10시">6시~10시</option>
								<option value="10시~12시">10시~12시</option>
								<option value="12시~16시">12시~16시</option>
								<option value="16시~20시">16시~20시</option>
								<option value="20시~24시">20시~24시</option>
							</select>
						    </td>
						</tr>
				</table>
			<!-- 경력 커리어 셀렉 출력 함수 -->
			<!-- 지역 select문 옵션 출력 함수 -->		
			<!-- 시간대 select문 옵션 출력 함수 -->
					<script type="text/javascript">
						$(document).ready(function () {
							
							$("#career").val('<%=dto.getCareer() %>');
							
							$("#wantLocal").val('<%=dto.getWantLocal() %>');		
							
							$("#wantTime").val('<%=dto.getWantTime() %>');
						});
					</script>





               </div>
			</div>

<!-- 	=================================    box2 끝   =================================   -->

			<div class="boxs box3">


				<div class="image_file" align="center">
					
					<%	if (dto.getRealFileName() == null || dto.getRealFileName() == "null") {
					%>
				<span>	<img src='./image/mainImage.png'
						style="border-radius: 100%;" width='110x' height='110px'> </span>
					<%
						} else {
					%>

				<span>	<img src='http://192.168.2.10:8090/ProjectBaby/upload/<%=dto.getRealFileName()%>'
						style="border-radius: 100%;" width='110px' height='110px'> </span>
					<%
						}
					%>
						 
					
				</div> <!-- <div class="image_file" align="center"> -->

				<br>
				<div class="form-want-introduce">
					<p style="text-align: left; padding-left:20px;">내 계좌번호</p>
					<input type="text" name="account"
						style="width: 200px; height: 30px;"
						value="<%=dto.getBankAccount()%>"> <br>
					<br>
					<p style="text-align: left; padding-left:20px;">소개글</p>



     
	             	<%	if (dto.getIntroduce() == null || dto.getIntroduce() == "null") {
					%>
					
						<textarea rows="10" cols="25" name="introduce" placeholder="작성된 소개글이 없습니다."></textarea>
					
					<%
						} else {
					%>

						<textarea rows="10" cols="25" name="introduce"><%=dto.getIntroduce()%></textarea>

					<%
						}
					%>



					<br>
					<br>

					<div class="finalBtn" style="padding-left: 100px;">
						<input type="submit" value="수정하기" style="width: 100px;" id="finalUpdateBtn" onclick="finalUpdateBtnClick()">

					</div>


				</div> <!-- <div class="form-want-introduce"> -->


			</div> <!-- <div class="boxs box3"> -->
		</form>
		<!-- ============================================================================================================================= -->



	</div>
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
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


function finalUpdateBtnClick(){
	
	var pwd= $("#password").val();
	var userpwd = '<%=dao.getPassword(dto.getId()) %>'; 
	
	/* 자바스크립트에서 자바값 호출시  ''를 써줍시다. */
	
	 if(pwd == ""){
		 alert("패스워드를 입력해주세요");
	 } else if(pwd != userpwd){
		 alert("패스워드가 일치하지 않습니다")
	 }else if(pwd == userpwd){
		 alert("정상적으로 프로필이 수정되었습니다.")
	 } 
	 
	 
}








</script>



<!--// container -->


<%@ include file="./include/footer.jsp" %>