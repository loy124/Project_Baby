<%@page import="main.BabyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="./include/header.jsp"%>
<style>
.abs {
	color: #ff9999
}

.cont1 {
	padding: 35px;
}

/* .wrap_first{
    width: 30%;
   margin: 20px;
  padding-bottom: 200px;

    border:1px solid black;
}	
 */
.top_user_point {
	/*    margin: 50px;
 */
	/* border: 1px solid black; */
	
}

#MyPoint {
	margin-left: 150px;
	position: absolute;
	left: 25%;
	top: 20%;
}


#MyAccount{
	margin-left: 150px;
	position: absolute;
	left: 25%;
	top: 26%;
}
/* .withdrawBtn{
  position: absolute;
  background-color: #f0f0f0;
   margin-left:150px;
  left: 50%;
  top: 25%;
}

.depositBtn{
  position: absolute;
  background-color: #f0f0f0;
   margin-left:150px;
  left: 40%;
  top: 25%;
} */
.pointBtn {
	position: absolute;
	/* background-color: #f0f0f0; */
	margin-left: 150px;
	left: 30%;
	top: 32%;
}

.kakao_submit {
	position: absolute;
	/* background-color: #f0f0f0; */
	margin-left: 300px;
	left: 35%;
	top: 15%;
}
</style>

<%
BabyMemberDto dto = (BabyMemberDto)request.getSession().getAttribute("login");

%>


<!-- content 영역 -->
<div class="containerWrap main">
	<div class="container_inner">
		<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
		<div class="cont1 content clearfix" style="background-color: #BEFFEF;">


			<div class="wrap_first">
				<p>
					<b class="abs" style="font-size: 20pt;">MyPage</b>
				</p>



				<div class="top_user_point">

					<br> <br>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<table>
						<tr>

							<span><img src='./image/user.png' width='110x' height='110px'></span>

							<span id="MyPoint">MyPoint : &nbsp;&nbsp; <%=dto.getPoint() %> </span>

                            <span id="MyAccount">My Account : &nbsp;&nbsp; <%=dto.getBankAccount() %> </span>

							<div class="pointBtn">


								<!-- <input type="submit" value="결제하기"> <input	type="reset" value="취소하기"> -->

								<a href="payment.jsp"><input type="button"
									class="depositBtn" value="충전" style="width: 60px;"></a>&nbsp;&nbsp;
								<input type="button" class="withdrawBtn" style="width: 60px;"
									value="출금">
									
									
									
							</div>
						</tr>
					</table>

				</div>


				<div class="kakao_submit">

					<p>
						<b class="abs" style="font-size: 13pt;">▶ 포인트 충전</b>
					</p>
					<br>

					<form action="kakao.jsp">
						<p>
							<span>id:</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<input name="id" style="width: 210px;" placeholder="purple.stu.ing@gmail.com">
							<!-- 값 가져오기 -->
						</p>
						<br>

						<span>point:</span> <input name="totalPrice" style="width: 210px;"
							placeholder="충전 할 포인트를 입력해주세요"> <br> <br> 
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" value="결제하기">
							 <input type="reset" value="취소하기">
					</form>

				</div>




				<br>

				<table align="left" ; style="background-color: #f0f0f0" ; size="30"
					; height="5">
					<col width="200">
					<tr>
						<td style="text-align: center">
							<p>UserName</p>
						</td>
					</tr>
					<tr>
						<td>
							<p style="font-size: 5pt; text-align: center; font-weight: bold;">
								bitcamp1104@gmail.com</p>
						</td>
					</tr>
				</table>
				<br> <br>

				<table align="left"; style="background-color: #f0f0f0; size: '30'; font-size: 10pt; height: '10';">
					<col width="200">
					<tr>
						<td style="text-align: center;">
							<p style="margin: 3px; padding-top: 10px;">
								<a href="mypage_main.jsp">예약 내역 확인</a>
							</p>
						</td>
					</tr>

					<tr>
						<td style="text-align: center;">
							<p style="margin: 3px;">
								<a href="mypage_reservation.jsp">지난 이력 확인</a> <!-- <a href="bbsWrite?type=write"> -->
							</p>
						</td>
					</tr>

					<tr>
						<td style="text-align: center;">
							<p style="margin: 3px; color: #ff9999;">
								&nbsp;&nbsp;<img src='./image/arrow.png' width='10px'
									height='10px' /> &nbsp; <a href="mypage_point.jsp">내 포인트
									관리</a>
							</p>
						</td>
					</tr>

					<tr>
						<td style="text-align: center">
							<p style="margin: 3px; padding-bottom: 10px;">
								<a href="mypage_profile.jsp">내 계정 관리</a>
							</p>
						</td>
					</tr>

				</table>

			</div>



			<!-- 
	<a href="bbsWrite?type=write">예약 내역 확인</a>
	<a href="bbsWrite?type=write">지난 이력 확인</a>
	<a href="bbsWrite?type=write">내 포인트 관리</a>
	<a href="bbsWrite?type=write">내 계정 관리</a> 
	 -->









		</div>
		<!-- 	<div class="cont2 content clearfix" style="background-color: #eee;"></div>
		<div class="cont3 content clearfix" style="background-color: #ccc;"></div> -->
	</div>
</div>
<!--// container -->


<%@ include file="./include/footer.jsp"%>