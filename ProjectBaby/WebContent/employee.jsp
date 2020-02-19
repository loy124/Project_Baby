
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.employee .wantDate-btn.click-button-event {
	color: white !important;
	background-color: #ff7928 !important;
}
/* -- 팝업창 -- */
.lp_bg, .popupBox {
	display: none;
}

.lp_bg {
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.4);
	z-index: 550;
}

.popup_wrap {
	position: absolute;
	bottom: -390px;
	left: 0;
	width: 100%;
	z-index: 999;
	text-align: center;
}

.popup_wrap .popup_inner {
	display: inline-block;
	margin: 0 auto;
}

.popup_wrap .popup_inner p {
	text-align: left;
}

.popupBox {
	margin: 0 5px;
	float: left;
	padding: 25px;
}

#layer1 {
	position: fixed;
	left: 20%;
	top: 10%;
	background-color: #fff;
	width: 420px;
	/* display: none; */
	padding-bottom: 10px;
	text-align: right;
	z-index: 997;
}

#layer1 .layerInner {
	position: relative;
}

.popup_wrap input[type="checkbox"] {
	vertical-align: middle;
	margin-right: 7px;
}

.lp_box {
	position: fixed;
	background: #fff;
	z-index: 9999;
}

.lp_box, .lp_bg, .lp_bg2 {
	display: none;
}

.lp_box, .lp_bg, .lp_bg2 {
	display: none;
}

.btn_close_lp {
	display: block;
	position: absolute;
	top: 20px;
	right: 20px;
}

.lp_cn {
	box-sizing: border-box;
	padding: 30px 20px 20px;
	font-family: 'NanumSquare';
}
</style>
<%@ include file="./include/header.jsp"%>
<link rel="stylesheet" href="./css/front/bootstrap-datepicker.css">
<script src="./js/front/bootstrap-datepicker.js"></script>
<script src="./js/front/bootstrap-datepicker.ko.min.js"></script>

<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

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
								<input type="text" name="address" id="address"
									placeholder="지역을 입력하세요">
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
									name="gender" id="woman">여자 <input type="checkbox"
									name="gender" id="man">남자
							</form>

							<form class="selectName">
								<span class="sel_title">경력</span> <input type="checkbox"
									name="career" id="career">경력있음
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
							<input class="rf" type="button" id="searchBtn"
								onclick="ajaxSearch()" value="검색하기">
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
<div class="test111"></div>


<!-- 고용 팝업 --->
<div class="lp_bg"></div>
<div class="popup_wrap"></div>

<%@ include file="./include/footer.jsp"%>
<!-- 요일 선택시 버튼 수정 -->
<script type="text/javascript">

	let dataJson;
	$(document).ready(function(){

	 $.ajax({
		url : "./employee",
		type : "post",
		data : {
			/* "id" : $("#id").val() */
			"type" : "getSitterList",


		},
		success : function(data) {
			console.log(data);
			let index = 0;
			dataJson = data;
			console.log(dataJson.length);
			let arr = data.map((d, i) => {
				$(".list-inner").append(list(d, i));
				index = i;

				console.log("길이" +dataJson.length);

				dataJson.map((d, i) => {
					$(`#popupIndex`+i).click(function(){
						$(".test111").append(popupList(d));
					});


				});

				$(window).on("load",function(){
					$(".popClose").click(function(){
						console.log("되냐");
						$(".test111").remove();

					});
				})



				/* $(".test111").append(popupList(data[index])); */
			});

			 /* $(".test111").append(popupList(data[index])); */
			$(document).ready(function() {
				  // 로딩 완료되었을때
				  console.log("로딩완료");
				  $(".card_wrap").click(function() {
				  	 $('.lp_bg, .popup_wrap .popupBox').show();

							console.log("이거 실화냐");
							$('.empBox .popClose, .lp_bg').click(function() {
								  console.log("씨알도 안먹힘ㅋ");

							  	$('.lp_bg, .popup_wrap .popupBox').hide();
							  });
				  });

				});

		}

	});
		 console.log(dataJson);

	//검색 버튼 눌렀을때
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

	//정보가 기재되어 있지 않은 경우
	function existElement(el){
		if(el !== null && el !== false && el !== 0 && el !== undefined){
			return el;
		}else{
			return "기재되지 않음";
		}
	};


function haveImg(realFileName){
	console.log("파일이름" + realFileName);
		if(realFileName !== null && realFileName !== false && realFileName !== 0 
				&&realFileName !== undefined &&realFileName !=="null" && realFileName !=="noImage"){
				return "http://localhost:8090/ProjectBaby/upload/"+img;
			}
	else{
		return "./images/front/profile_w.png";
	}
	}
	



	//인덱스값을 추가로 파라미터로 넣어서 함수를 짜보도록 하자 (고용팝업)
	function list(data, index){

		return ` <div class="sitter_wrap">
	               <div class="card_wrap" id="popupIndex`+index+`">
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
	                           <img alt="프로필 이미지" src="`+haveImg(data.realFileName)+`">
	                        </div>
	                     </div>

	                     <div class="info_layout">
	                        <div class="info_content">
	                           <div class="name_wrap">
	                              <p id="s_name" class="sitter_info sitter_name">
															이름 =`+ existElement(data.name) +`
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
	                           <div class="sitter_age"> 나이: ` +existElement(data.age)+ `</div>
	                           <span class="want_pay">희망시급 : `+existElement(data.wantPay) + ` </span>
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
                  </div>
                  `;


	};


	function popupList(popupdata){

		/* datepicker 설정 */
		$(function() {
			$('.datePicker').datepicker({
			    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
			    startDate: '-0d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
			    endDate: '+50d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
			    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
			    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
			    clearBtn : true, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
			    /* datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함. */
			   /*  daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일 */
			    daysOfWeekHighlighted : [3], //강조 되어야 하는 요일 설정
			    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
			    immediateUpdates: true,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
			    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
			    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
			    templates : {
			        leftArrow: '&laquo;',
			        rightArrow: '&raquo;'
			    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
			    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
			    title: "예약할 날짜를 입력해주세요",	//캘린더 상단에 보여주는 타이틀
			    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false
			    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
			    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일
			    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.

			}).on("changeDate", function(e) {
	            //이벤트의 종류
	            //show : datePicker가 보이는 순간 호출
	            //hide : datePicker가 숨겨지는 순간 호출
	            //clearDate: clear 버튼 누르면 호출
	            //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
	            //changeMonth : 월이 변경되면 호출
	            //changeYear : 년이 변경되는 호출
	            //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간

	            console.log(e);// 찍어보면 event 객체가 나온다.
	            //간혹 e 객체에서 date 를 추출해야 하는 경우가 있는데
	            // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시)
	            // 위와 같은 형태로 보인다.
	            // 추후에 yyyy-mm-dd 형태로 변경하는 코드를 업로드 하겠습니다.
	       });
			$(function() {
		        $('.timepicker1').timepicker({
		        	zindex: 99000,
		        	dynamic: true,
		        	timeFormat: 'H:00'
		        });

		    });

		});//ready end

		
		/* datepicker 마무리 */
		return `<div class="popup_wrap">
		<div class="popup_inner">
			<div id="layer1" class="popupBox empBox" >
				<div class="layerInner">
					<div>
						<form action="reserve" method="post">
							<textarea hidden name="type">payReserve</textarea>
							<textarea hidden name="id">`+popupdata.id+`</textarea>
							<textarea hidden name="wantPay">`+popupdata.wantPay+`</textarea>
							<p>이름 : `+existElement(popupdata.name)+ ` </p>
							<p>나이 : `+existElement(popupdata.age)+ `  </p>
							<p>희망 지역 : `+existElement(popupdata.wantLocal) +`  </p>
							<p>희망 시급 : <span>`+existElement(popupdata.wantPay)+`</span> </p>	
							<p>희망 요일 : `+existElement(popupdata.wantDate) +` </p>
							<p>희망 날짜 :  <input type="text" class="datePicker" name="wantDate" style="width:200px;" class="form-control">
							<p>시작 시간 :	<input style="width:200px;" type="text" name="startWorkHour" class="timepicker1"/></p>
							<p>종료 시간 :	<input style="width:200px;" type="text" name="endWorkHour" class="timepicker1" /></p>
							<p>고용하시겠습니까?</p>
							<input type="submit" value="예">
							<input type="button" class="popClose" value="아니오">
						</form>
					</div>
				</div>
				<!-- <input type="checkbox" name="popCheck" id="pop03" onClick="" /><label for="pop03">오늘 하루 창 열지않기</label> -->
				<!-- <a href="#" onClick="layerX(this);" class="popClose">[닫기]</a> -->
			</div>
			</div>
		</div>`
	};



	</script>




<script src="js/front/searchResult.js"></script>









