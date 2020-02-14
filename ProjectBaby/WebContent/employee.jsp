
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>

.employee .wantDate-btn.click-button-event{
	color: white !important;
	background-color: #ff7928 !important; 

}
</style>
<%@ include file="./include/header.jsp"%>


<%
	//시터 리스트 뿌리는 list
	List<BabyMemberDto> list = (List<BabyMemberDto>) request.getAttribute("SitterName");
	// EmployeeDao dao = EmployeeDao.getInstance();
	//List<BabyMemberDto> sitterList = dao.getSitterList();
	//BabyMemberDto member = sitterList.get(i);
%>

<!-- content 영역 -->
<div class="containerWrap employee">
	<div class="container_inner">
		<div class="cont1 content clearfix">
			<div class="inner">
				<div class="emp_layout">
					<div class="lay_border title">
						<h2>
							<strong><span>시터</span>를 찾고 싶은 지역,</strong><br>원하는 요일, 시간을
							넣어 검색해주세요.
						</h2>
						<p>
							Oh My Baby 시터는 0 ~ 13세 아이를 집에서 안전하고 즐겁게<br> 돌봐주는 베이비시터 역할을
							합니다.
						</p>
					</div>

					<div class="lay_border">
						<div class="select_wrap">
							<form action="empChoice" class="selectName">
								<span class="sel_title">돌봄지역</span>
								<svg viewBox="0 0 24 24"
									style="display: inline-block; margin: 0; color: rgba(0, 0, 0, 0.87); fill: #ff5300; height: 20px; width: 20px; user-select: none; transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms; position: absolute; left: 32px; top: 90px;">
								<path
										d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"></path>
								</svg>
								<input type="hidden" name="choice" value="sitterMember">
								<input type="text" name="address" placeholder="지역을 입력하세요">
							</form>

							<form action="empChoice" class="selectName selectWeek">
								<span class="sel_title">돌봄 요일</span> <span class="btnWrap">
									<button class="wantDate-btn" tabindex="0" type="button"
										name="wantDate">월</button>
									<button class="wantDate-btn" tabindex="0" type="button"
										name="wantDate">화</button>
									<button class="wantDate-btn" tabindex="0" type="button"
										name="wantDate">수</button>
									<button class="wantDate-btn" tabindex="0" type="button"
										name="wantDate">목</button>
									<button class="wantDate-btn" tabindex="0" type="button"
										name="wantDate">금</button>
									<button class="wantDate-btn" tabindex="0" type="button"
										name="wantDate">토</button>
									<button class="wantDate-btn" tabindex="0" type="button"
										name="wantDate">일</button>
								</span>

								<p class="selectName selectTime"></p>
							</form>



							<!-- <p class="selectName selectTime">
								<span class="sel_title">시간대</span>
								<span class="btnWrap">
									<button tabindex="0" type="button">6시 ~ 10시</button>
									<button tabindex="0" type="button">10시 ~ 12시</button>
									<button tabindex="0" type="button">12시 ~ 16시</button>
									<button tabindex="0" type="button">16시 ~ 20시</button>
									<button tabindex="0" type="button">20시 ~ 24시</button>
								</span>
							</p> -->
						</div>
					</div>

					<div class="lay_border">
						<div class="select_wrap refine_search">
							<form class="selectName selectTime">
								<span class="sel_title">성별</span> <input type="checkbox"
									name="gender" id="">여자 <input type="checkbox"
									name="gender" id="">남자
							</form>

							<form class="selectName">
								<span class="sel_title">인증</span> <input type="checkbox"
									name="licece">인증된 시터
							</form>
						</div>
					</div>

				</div>
				<div class="lay_border">
					<div class="select_wrap refine_searchBtnWrap">
						<!-- <p class="selectName">
								<span>나이대</span>
								<span class="range">
								  <input type="range" min="1" max="7" steps="1" value="1">
								</span>
								<ul class="range-labels">
								  <li class="active selected">전체</li>
								  <li>20대</li>
								  <li>30대</li>
								  <li>40대</li>
								  <li>50대</li>
								  <li>60대</li>
								</ul>
							</p> -->

						<form class="refineBtn">
							<input class="rf" type="button" id="searchBtn" value="검색하기">
							<!-- 타입수정 -->
							<input type="reset" value="초기화" class="reset">
							</from>
					</div>
				</div>
			</div>
		</div>
		<!-- //cont1 -->
		<div class="cont2 content clearfix" style="background-color: #eee;">
			<div class="inner list-inner"></div>
		</div>
	</div>
	<!--// container_inner -->
</div>
<!--// container -->


<!-- 요일 선택시 버튼 수정 -->
<script type="text/javascript">
	$(document).ready(function(){
	$.ajax({
		url : "./employee",
		type : "get",
		data : {
			/* "id" : $("#id").val() */
			"type" : "getSitterList",
			

		},
		success : function(data) {
			console.log(data);
			
			let arr = data.map(i => {
				$(".list-inner").append(list(i));
				console.log(i);
			});
			
			
			

		}
	});
	$("#seachBtn").click(function(){
		var genderList = [];
		$('input[name="gender"]:checked').each(function(i){
			genderList.push($(this).val());
		})
		
		}); 
	//버튼 클릭시 색깔 토글
	$(".wantDate-btn").click(function(){
		$(this).toggleClass("click-button-event");
	});
	
	});
	
	function existElement(el){
		if(el !== null && el !== false && el !== 0 && el !== undefined){
			return el;
		}else{
			return "기재되지 않음";
		}
	}
	

	function list(data){ 
		return ` <div class="sitter_wrap">
	               <div class="card_wrap">
	                  <div class="d1"> 
	                     <div class="photo_layout">
	                        <div class="_3xT8G" style="display: none;">
	                           <div mode="indeterminate" value="0" min="0" max="100" style="position: relative; display: inline-block; width: 70px; height: 70px;">
	                              <div style="width: 70px; height: 70px; display: inline-block; transition: -webkit-transform 10s linear 0ms, transform 0ms; transform: rotate(1800deg);">
	                                 <svg viewBox="0 0 70 70" style="width: 70px; height: 70px; position: relative;">
	                                    <circle cx="35" cy="35" r="33.25" fill="none" stroke-width="3.5" stroke-miterlimit="20" style="stroke: rgb(255, 96, 0); stroke-linecap: round; transition: all 750ms ease-in-out 0ms; stroke-dasharray: 146.241, 208.916; stroke-dashoffset: -62.6748;"></circle>
	                                 </svg>
	                              </div>
	                           </div>
	                        </div> 

	                        <div class="photo_wrap"> 
	                           <img alt="프로필 이미지" src="./images/front/profile_w.png">
	                        </div>
	                     </div>

	                     <div class="info_layout">
	                        <div class="info_content">
	                           <div class="name_wrap">
	                              <p id="s_name" class="sitter_info sitter_name"> 
															이름 =`+ existElement(data.name) +
																	 `
	                              </p> 
	                           </div> 
	                           <button tabindex="0" type="button" style=""> 
	                           <div> 
	                              <img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/favorites/s-list-like-off.png" alt="favorites"> 
	                           </div> 
	                           </button> 
	                        </div> 

	                        <div class="info_content">
	                           <div> 
	                              <span class="local"></span> 
	                           </div> 
	                        </div> 

	                        <div class="info_content info_txt_align"> 
	                           <div class="sitter_age"> 나이: ` +existElement(data.age)+ `
														 </div>
	                           <span class="want_pay">희망시급 : `+existElement(data.wantMoney) + ` </span> 
	                        </div>

	                        <div id="sitter_review" class="info_content"> 
	                           <div class="review_count">후기: `+existElement()+`</div> 
	                                 <div class="badge"> 
                             
                              <img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/kb/p-search-320-kb-logo.svg" width="11px" height="13px" alt="안전 보험 뱃지">
                           </div> 
                        </div> 
                     </div> 
                  </div>

                  <div class="d2"> 
                     <div class="info_content">
                        <p>최근 고용일자 :`+existElement(data.registerDate) +` <span></span></p>
                     </div>
                  </div>`
           
	
;}

	</script>


<!-- /* 
	$("#seachBtn").click(function(){
		var genderList = [];
		$('input[name="gender"]:checked').each(function(i){
			genderList.push($(this).val());
		});

	}) */

	/* $(document).ready(function() {

	 $('.selectName button').on('click',function(){
	 $()
	 })

	 }); */

	/*

	 $('.employee .btnWrap button').click(function(){
	 $(this).css({
	 'color': '#fff',
	 'background-color': '#88afe0'
	 })

	 $(this).removeAttr('style');

	 });
	 */ -->



<%-- <% response.sendRedirect("./employee"); %> --%>


<%@ include file="./include/footer.jsp"%>