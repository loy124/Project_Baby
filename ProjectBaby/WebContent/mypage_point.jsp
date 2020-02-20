<%@page import="main.BabyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="./include/header.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	background-color: rgba(205,255,254,0.8);
}

.mypage .box2 {
	flex-direction: column;
    height: 550px;
	width: 370px;
	background-color: rgba(190, 255, 239, 0.8);
	font-size: 20px;
	 padding-left: 50px;
}

.mypage .box3 {
	flex-direction: column;
    height: 550px;
	width: 430px;
	background-color: rgba(190, 255, 239, 0.8);
	/* background-color: black; */
		font-size: 20px;
			 padding-top: 122px;
	/* 	 padding-right: 50px; */
}
.kakao_submit{
 visibility: hidden;
}
.menu>a:hover {
text-decoration:underline;
color: #ff9999;

}  
  
.mypage .content {
margin-bottom:100px;
}  
</style>

<%
	BabyMemberDto dto = (BabyMemberDto) request.getSession().getAttribute("login");

%>


<!-- content 영역 -->

<div class="container_inner mypage">
	<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
	<div class="cont1 content clearfix mypage"
		style=" height: 550px">

		<div class="boxs box1">
			<p style="padding-top: 30px;">
				<b class="abs" style="font-size: 25pt;">MyPage</b>
			</p>



			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<table>
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
								&nbsp;&nbsp;<img src='./image/arrow.png' width='10px' height='10px' /> &nbsp;
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

			<p  style="padding-top: 50px;" >
				<b class="title" style="font-size: 15pt; color: #82a3d4;">포인트 충전</b>
			</p>
			<br>
			    <table>
			          <tr style="height: 60px;">
			          <td>
							<span id="MyPoint"><b>MyPoint : </b> &nbsp;&nbsp; <%=dto.getPoint() %> </span>
                      </td>
                       </tr>
                       <tr style="height: 60px;">
                       <td>
                            <span id="MyAccount"><b>My Account : </b> &nbsp;&nbsp; <%=dto.getBankAccount() %> </span>
                       </td>
                       </tr>
                       <tr style="height: 45px;">
                       <td>
							<div class="pointBtn" style="padding-left:50px"><br>


								<!-- <input type="submit" value="결제하기"> <input	type="reset" value="취소하기"> -->

								<input type="button" onclick="view()"
									class="depositBtn" value="충전" style="width: 80px;">&nbsp;&nbsp;
								<input type="button" class="withdrawBtn" style="width: 80px;"
									value="출금">
								</div>	
					   </td>
					    </tr>
									
				</table>					
										
	
			
		</div>
		<div class="boxs box3">
			<div class="kakao_submit" >

					<form action="kakao.jsp">
					<table>
					    <tr style="height:60px;">
						       <td>
							<span><b>id: </b></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
							<input name="id" style="width: 265px;" placeholder="purple.stu.ing@gmail.com"  readonly="readonly" value="<%=babyMemberDto.getId()%>" >
							<!-- 값 가져오기 -->
						       </td>
						</tr>
						<tr style="height:60px;">       
						     <td>
                              
						<span><b>point: </b></span> <input name="totalPrice" style="width: 265px;"
							placeholder="충전 할 포인트를 입력해주세요"> <br> <br> 
						     </td>
						</tr>
					
					  <tr style="height: 45px;">
                       <td>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" value="결제하기"> &nbsp;
							 <input type="reset" value="취소하기">
						</td>
						</tr>
						</table>	
					</form>

				</div>
				<script type="text/javascript">
			

				function view() {

				   /*  $("#hh").hide();                            // 숨기기. 영역도 같이 사라짐.

				    $("#hh").toggle();                         // hide(), show() 함수가 toggle 됨. */

				    $(".kakao_submit").css('visibility', 'visible'); // 숨기기. 영역은 같이 사라지지 않음.

			/* 	    $("#hh1").attr("disabled", "true"); // 숨기기는 아님. form 으로 전달되지 않음. */

				}



			
				
				
				</script>
				
				
		</div>

		<!-- ============================================================================================================================= -->

	</div>
</div>





<!--// container -->


<%@ include file="./include/footer.jsp"%>