<%@page import="main.BabyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="./include/header.jsp"%>
<style>
/*
.abs {
	color: #ff9999
}

.cont1 {
	padding: 35px;
}

.title {
	position: absolute;
	left: 545px;
	top: 320px;
}
.profile_update{
  left: 50%;
  top: 10%; 

}
 */
 /* 
.profile_update {
	margin-left: 180px;
	position: absolute;
	right: 620px;
	bottom: -60px;
}

.image_file {
	position: absolute;
	right: -260px;
	bottom: 380px;
}

.form-want-introduce {
	position: absolute;
	right: -300px;
	bottom: 60px
} */
/* 
.update_table1 td {
	height: 35px;
}

.menu>a:hover {
	text-decoration: underline;
	color: #82a3d4;
}

.finalBtn {
	position: absolute;
	right: 0px;
	bottom: -50px
}
 */

.mypage .boxs {
    display: flex;
   
    flex-direction: column;
    width: 100%;
/*     margin-right: 10px; */
  
}
.mypage .box1{
     width: 30%;
     text-align:center;
     background-color: #CDFFFE;
}
.mypage .box2{
    width: 40%;
}
.mypage .box3{
    width: 30%;
    background-color:black;
}
	
}

</style>

<%
	BabyMemberDto dto = (BabyMemberDto) request.getSession().getAttribute("login");
%>


<!-- content 영역 -->

<div class="container_inner mypage">
	<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
	<div class="cont1 content clearfix"
		style="background-color: rgba(190, 255, 239, 0.8); height: 620px">

		<div class="boxs box1">
			<p>
				<b class="abs" style="font-size: 25pt;">MyPage</b>
			</p>



			<br> <br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<table>
				<tr>

					<span><img src='./image/user.PNG' width='110x'
						height='110px'> </span>

				</tr>
			</table>

			<br>

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
							<%=dto.getId()%></p>
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
		
		
		<div class="boxs box2">
		
			<p>
				<b class="title" style="font-size: 15pt; color: #82a3d4;">예약 내역 확인</b>
			</p>
		</div>
		<div class="boxs box3">
		
		</div>

		<!-- ============================================================================================================================= -->



	</div>
</div>

<!--// container -->


<%@ include file="./include/footer.jsp"%>