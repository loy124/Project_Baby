<%@page import="main.BabyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="./include/header.jsp"%>
<style>
.mypage .abs {
	color: #ff9999
}

.mypage .cont1 {
	padding: 35px;
}

.mypage .title {
	position: absolute;
	left: 545px;
	top: 320px;
}
/* .profile_update{
  left: 50%;
  top: 10%; 

}
 */
/* .profile_update {
	margin-left: 180px;
	position: absolute;
	right: 620px;
	bottom: -60px;
} */

.mypage .image_file {
	position: absolute;
	right: -260px;
	bottom: 380px;
}

.mypage .form-want-introduce {
	/* position: absolute; */
	/*  background-color: #f0f0f0; */
	/* 	margin-left: 150px; */
	position: absolute;
	right: -300px;
	bottom: 60px
}

.mypage .update_table1 td {
	height: 35px;
}

.mypage .menu>a:hover {
	text-decoration: underline;
	color: #82a3d4;
}

.mypage .finalBtn {
	position: absolute;
	right: 0px;
	bottom: -50px
}
/* ==point============================================================= */
.mypage .top_user_point {
	position: absolute;
	left: 545px;
	top: 320px;
	
}




.pointBtn {
/* 	position: absolute;
	/* background-color: #f0f0f0; */
 	margin-left: 150px;
/* 	left:400%;
	top: 32%;  */
}

</style>

<%
	BabyMemberDto dto = (BabyMemberDto) request.getSession().getAttribute("login");
%>


<!-- content 영역 -->

<div class="container_inner mypage">
	<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
	<div class="cont1 content clearfix"
		style="background-color: rgba(190,255,239,0.8); height: 620px"><!--  #BEFFEF -->

       <div class="box1 boxs"></div> <!-- //mypage와 메뉴까지 컬럼  style="width:px" -->
       <div class="box2 boxs"></div> <!-- //내 계정 관리 붵 원하는 시간대 까지 컬럼 -->
       <div class="box3 boxs"></div> <!-- //수정하기 까지-->
<!--        .boxs{
       float:left;
       } -->

		<p>
			<b class="abs" style="font-size: 25pt;">MyPage</b>
		</p>

		<p>
			<b class="title" style="font-size: 15pt; color: #82a3d4;">내 포인트
				관리</b>
		</p>






		<br> <br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		
					<span><img src='./image/user.PNG' width='110x'
						height='110px'></span>
		<div class="top_user_point">

			<br> <br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<table>
				<tr>

                    <td style="height:40px;font-size:16px;">
						<span id="MyPoint"><b>MyPoint : </b>&nbsp;&nbsp; <%=dto.getPoint()%>
						</span>      
					</td>
                </tr>
         
                <tr>
                    <td style="height:40px;font-size:16px;">
					<span id="MyAccount"><b>My Account : </b> &nbsp;&nbsp; <%=dto.getBankAccount()%>
					</span>
					</td>			
				</tr>
				<tr>
				    <td style="height:40px;">

					<div class="pointBtn">


						<!-- <input type="submit" value="결제하기"> <input	type="reset" value="취소하기"> -->

						<a href="payment.jsp"><input type="button" class="depositBtn"
							value="충전" style="width: 60px;"></a>&nbsp;&nbsp; <input
							type="button" class="withdrawBtn" style="width: 60px;" value="출금">



					</div>
				    </td>
				</tr>
			</table>

		</div>







        <br>
		<br>
<div class="main_select">
		<table style="background-color: #f0f0f0; height: 30px;">
			<col width="200">
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
						<%=dto.getId() %></p>
				</td>
			</tr>
		</table>
		<br>
		<div>
			<table
				style="background-color: #f0f0f0; size: '30'; font-size: '14px'; height: '13px';">
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
		<!-- ============================================================================================================================= -->




	</div>
</div>

<!--// container -->


<%@ include file="./include/footer.jsp"%>