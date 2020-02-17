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
	background-color: rgba(205,255,254,0.8);
}

/* .mypage .box2 {
	flex-direction: column;
    height: 550px;
	width: 500px;
	background-color: rgba(190, 255, 239, 0.8);
}

.mypage .box3 {
	flex-direction: column;
    height: 550px;
	width: 300px;
	background-color: rgba(190, 255, 239, 0.8);
	/* background-color: black; */
}
 */
/* <!--  ============================================================== --> */
       *{
            border: 1px solid black;
        }
        
        .profile-img {
            width: 150px;
            height: auto;
        }
        
        .profile-content {
            background-color: bisque;
            width: 50%;
        }
        
        .profile-container {
            display: flex;
        }
        
        .profile-title-wrap {
            display: flex;
        }
        
        .profile-title-wrap div:nth-child(1) {
            flex-grow: 1;
        }
        
        .profile-title-wrap div:nth-child(2) {
            flex-grow: 4;
        }
        
        .main-container {
            display: flex;
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
				<tr>

					<span><img src='./image/user.png' width='110x'
						height='110px'> </span>

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


<!-- 		<div class="boxs box2">

			<p  style="padding-top: 50px; padding-left: 50px;" >
				<b class="title" style="font-size: 15pt; color: #82a3d4;">예약 내역
					확인</b>
			</p>
		</div>
		<div class="boxs box3">
			<p>
				<b class="title" style="font-size: 15pt; color: navy;">세번째 영역</b>
			</p>
		</div>
 -->
 
    <div class="main-container">
<!--         <div>
            메뉴 넣을곳
        </div> -->
        <div>
            <div>
                예약 내역 확인
            </div>
            <div class="profile-container">
                <img class="profile-img" src="./user.PNG">
                <div class="profile-content">
                    <div class="profile-information">간단한 프로필[상세보기]</div>
                    <div class>
                        <div class="profile-title-wrap profile-name">
                            <div class="aa">aaa</div>
                            <div>aaa</div>
                        </div>

                        <div class="profile-title-wrap profile-phone-number">
                            <div class="aa">aaa</div>
                            <div>aaa</div>
                        </div>
                        <div class="profile-title-wrap profile-id">
                            <div class="aa">aaa</div>
                            <div>aaa</div>
                        </div>
                    </div>
                    <div>상세보기: 회원가입시 넣었던 것 경력사항등 자기소개 디테일</div>
                </div>
            </div>
            <div>
                <div>

                    <div>예약 날짜</div>
                </div>
            </div>
        </div>
    </div>
		<!-- ============================================================================================================================= -->



	</div>
</div>

<!--// container -->


<%@ include file="./include/footer.jsp"%>