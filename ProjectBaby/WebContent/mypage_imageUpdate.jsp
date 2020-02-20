<%@page import="main.BabyMemberDao"%>
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
	height: 550px;
	width: 300px;
	text-align: center;
	/*   align-self:center; */
	background-color: rgba(205, 255, 254, 0.8);
}

.mypage .box2 {
	flex-direction: column;
	height: 550px;
	width: 800px;
	background-color: rgba(190, 255, 239, 0.8);
	padding-left: 50px;
	padding-right: 80px;
	padding-bottom: 60px;
}

.mypage .row1 {
	height: 120px;
	/* background-color:black; */
}

.mypage .row2 {
	padding-top: 30px;
	height: 275px;
	/*  background-color:blue;  */
}

.mypage .items {
	display: flex;
	flex-direction: row;
	float: left;
	padding-top: 20px;
}

.mypage .item1 {
	width: 200px;
	height: 275px;
}

.mypage .item2 {
	width: 470px;
	height: 250px;
	/*  background-color:orange;  */
	padding-left: 10px;
	padding-top: 45px;
}

.mypage .borderTable {
	border: 3px solid #7f8c8d;
}

.mypage .keyTr {
	height: 40px;
}

.mypage .keyTd {
	font-size: 12px;
	text-align: center;
}

.mypage .row3 {
	height: 155px;

}

/* vertical-align: middle; */
.menu>a:hover {
	text-decoration: underline;
	color: #ff9999;
}

.mypage .content {
margin-bottom:100px;
}  
</style>

<%
	BabyMemberDao dao = BabyMemberDao.getInstance();
	BabyMemberDto dto = (BabyMemberDto) request.getSession().getAttribute("login");

	BabyMemberDto sitterDto = dao.getDetail(dto.getSitterId());

	System.out.println(dto.getRealFileName());

%>


<!-- content 영역 -->

<div class="container_inner mypage">
	<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
	<div class="cont1 content clearfix mypage" style="height: 550px">

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
					<span><img src='./image/mainImage.png'
						style="border-radius: 100%;" width='110x' height='110px'> </span>
					<%
						} else {
					%>

					<span><img
						src='http://192.168.2.10:8090/ProjectBaby/upload/<%=dto.getRealFileName()%>'
						style="border-radius: 100%;" width='110x' height='110px'> </span>
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
							&nbsp;&nbsp;<img src='./image/arrow.png' width='10px' height='10px' /> &nbsp;
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
								<a href="mypage_profile.jsp">내 계정 관리</a>
							</p>
						</td>
					</tr>

				</table>
			</div>
		</div>



		<div class="boxs box2">
			<div class="row1 rows">
				<!--  내 예약 내역/프로필   -->
				<p style="padding-top: 50px;">
					<b class="title" style="font-size: 15pt; color: #82a3d4;">프로필
						사진 업데이트</b>
				</p>

			</div>
			<form action="userProfileImageServlet" method="post"
				enctype="multipart/form-data">
				<div class="row2 rows">
					<div class="items">
						<div class="item1" style="text-align: center;">
							<p style="padding-top: 30px;">
							
							
												
					<%	if (dto.getRealFileName() == null || dto.getRealFileName() == "null") {
					%>
					<img src='./image/mainImage.png'
						style="border-radius: 100%;" width='150px' height='150px'> 
					<%
						} else {
					%>

					<img src='http://192.168.2.10:8090/ProjectBaby/upload/<%=dto.getRealFileName()%>'
						style="border-radius: 100%;" width='150px' height='150px'> 
					<%
						}
					%>
							
							</p>
							<%--      ==========================================   일반 회원 일때     =============================================     --%>
							<p style="padding-bottom: 17px;">
								<b style="font-size: 15pt;"><%=dto.getName()%></b>
							</p>
						</div>


						<div class="item2">
							<table class="item2_table">
								<!-- style="border: 2px  solid  #CDFFFE ;" -->
								<col width="120px">
								<col width="350px">
								<tr class="keyTr borderTable">
									<td class="keyTd borderTable" style="text-align: center;"><b
										style="font-size: 18px;"> id </b></td>
									<td class="keyTd borderTable"><b style="font-size: 16px;"><%=dto.getId()%></b>
									</td>
								</tr>
								<tr class="keyTr borderTable">
									<td class="keyTd borderTable" rowspan='2'
										style="text-align: center;"><b
										style="font-size: 16px; align: center"> 사진업로드 </b></td>
									<td class="keyTd borderTable" ><input type="file"
										name="imageFile"> <input type="hidden" name="loginId"
										value="<%=dto.getId()%>"></td>
								</tr>
								<tr class="keyTr borderTable">
									<td class="keyTd borderTable"><b style="font-size: 16px;">※
											이미지 파일만을 선택해 업데이트하세요</b></td>
								</tr>

							</table>

					<p style="text-align: right; padding-top:30px;">
						<input type="submit" value="등록"
							style="width: 120px; font-size: 20px; height: 40px;">
					</p>

						</div>

					</div>
				</div>
				<div class="row3 rows">
<!-- 					<p style="text-align: right;">
						<input type="submit" value="등록"
							style="width: 120px; font-size: 20px; height: 40px;">
					</p>
 -->
				</div>
			</form>
		</div>


	</div>
</div>

<!--// container -->


<%@ include file="./include/footer.jsp"%>