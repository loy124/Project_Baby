function ajaxSearch() {
    var address = $('#address').val();
    var career;
    var gender;

    if ($("input:checkbox[id='career']").is(':checked') == true) {
        career = '경력';
    } else {
        career = '신입';
    }

    if (
        $("input:checkbox[id='woman']").is(':checked') == true &&
        $("input:checkbox[id='man']").is(':checked') == false
    ) {
        gender = '여';
    } else if (
        $("input:checkbox[id='woman']").is(':checked') == false &&
        $("input:checkbox[id='man']").is(':checked') == true
    ) {
        gender = '남';
    } else {
        gender = 'none';
    }

    $('.sitter_wrap').remove();

    $.ajax({
        url: './searchResult',
        type: 'post',
        dataType: 'json',
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        data: {
            address: address,
            career: career,
            gender: gender,
        },
        success: function(data) {
            /*$(".list-inner").append("" +
					"<div class=\"sitter_wrap\">" +
					"<div class=\"card_wrap\">" +
					"<div class=\"d1\">" +
					"<div class=\"photo_layout\">" +
					"<div class=\"_3xT8G\" style=\"display: none;\">" +
					"");*/
            console.log(data);
            for (var i = 0; i < data.length; i++) {
                $('.list-inner').append(resultList(data[i]));
            }
            /* console.log(data[0].name); */
            console.log('onclick=popUp("테스트")');
        },
        error: function() {},
    });
}

function existElement(el) {
    if (el !== null && el !== false && el !== 0 && el !== undefined) {
        return el;
    } else {
        return '기재되지 않음';
    }
}

function haveImg(img) {
    console.log(img);
    if (
        img !== null &&
        img !== false &&
        img !== 0 &&
        img !== undefined &&
        img !== 'null'
    ) {
        return 'http://localhost:8090/ProjectBaby/upload/' + img;
    } else {
        return './images/front/profile_w.png';
    }
}

function resultList(data) {
    console.log("데이터");
    console.log("데이터터" + data);
    console.log(data);
    return (
        `<div class="sitter_wrap" onclick="popUp(\'` +
        data.id +
        `\', \'` +
        data.name +
        `\', \'` +
        data.age +
        `\', \'` +
        data.wantLocal +
        `\', \'` +
        data.wantPay +
        `\', \'` +
        data.wantDate +
        `\');">
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
             <img alt="프로필 이미지" src="` +
        haveImg(data.img) +
        `">
          </div>
       </div>

       <div class="info_layout">
          <div class="info_content">
             <div class="name_wrap">
                <p id="s_name" class="sitter_info sitter_name">
											이름 =` +
        existElement(data.name) +
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
                <span class="local">희망지역 : ` +
        existElement(data.wantLocal) +
        `</span>
             </div>
          </div>

          <div class="info_content info_txt_align">
             <div class="sitter_age">
             		<span class="age">나이: ` +
        existElement(data.age) +
        ` </span>
             		<span class="want_pay">희망시급 : ` +
        existElement(data.wantPay) +
        ` </span>
			   </div>

          </div>

          <div id="sitter_review" class="info_content">
             <div class="review_count">후기: ` +
        existElement() +
        `</div>
                   <div class="badge">

            <img src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/kb/p-search-320-kb-logo.svg" width="11px" height="13px" alt="안전 보험 뱃지">
         </div>
      </div>
   </div>
</div>

<div class="d2">
   <div class="info_content">
      <p>최근 고용일자 :` +
        existElement(data.registerDate) +
        ` <span></span></p>
   </div>
</div>`
    );
}

function existElement(el) {
    if (el !== null && el !== false && el !== 0 && el !== undefined) {
        return el;
    } else {
        return '기재되지 않음';
    }
}

function popUp(id, name, age, wantLocal, wantPay, wantDate) {
    // 로딩 완료되었을때
    console.log('로딩완료');

    $('.popup_wrap').append(popUpCreate(id, name, age, wantLocal, wantPay, wantDate));

    $('.lp_bg, .popup_wrap .popupBox').show();

    $('.empBox .popClose').click(function() {
        $('.lp_bg, .popup_wrap .popupBox').hide();
    });
}

function popUpCreate(id, name, age, wantLocal, wantPay, wantDate) {
    $(function() {
        $('.datePicker')
            .datepicker({
                format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
                startDate: '-0d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
                endDate: '+50d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
                autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
                calendarWeeks: false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
                clearBtn: true, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
                /* datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함. */
                /*  daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일 */
                daysOfWeekHighlighted: [3], //강조 되어야 하는 요일 설정
                disableTouchKeyboard: false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
                immediateUpdates: true, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
                multidate: false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
                multidateSeparator: ',', //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
                templates: {
                    leftArrow: '&laquo;',
                    rightArrow: '&raquo;',
                }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
                showWeekDays: true, // 위에 요일 보여주는 옵션 기본값 : true
                title: '예약할 날짜를 입력해주세요', //캘린더 상단에 보여주는 타이틀
                todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false
                toggleActive: true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
                weekStart: 0, //달력 시작 요일 선택하는 것 기본값은 0인 일요일
                language: 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
            })
            .on('changeDate', function(e) {
                //이벤트의 종류
                //show : datePicker가 보이는 순간 호출
                //hide : datePicker가 숨겨지는 순간 호출
                //clearDate: clear 버튼 누르면 호출
                //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
                //changeMonth : 월이 변경되면 호출
                //changeYear : 년이 변경되는 호출
                //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간

                console.log(e); // 찍어보면 event 객체가 나온다.
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
    }); //ready end

    return (
        `<div class="popup_inner">
			<div id="layer1" class="popupBox empBox">
				<div class="layerInner">
					<div>
                        <form action="reserve" method="post">
                        <textarea hidden name="type">payReserve</textarea>
							<textarea hidden name="id">`+id+`</textarea>
							<textarea hidden name="wantPay">`+wantPay+`</textarea>
						<p>이름 : ` +
        existElement(name) +
        `</p>
						<p>나이 : ` +
        existElement(age) +
        `</p>
						<p>희망 지역 : ` +
        existElement(wantLocal) +
        `</p>
						<p name="wantPay">희망 시급 : ` +
        existElement(wantPay) +
        `</p>
						<p>희망 요일 : ` +
        existElement(wantDate) +
        `</p>
						<p>희망 날짜 :  <input type="text" class="datePicker" name="wantDate" style="width:200px;" class="form-control">
						<p>시작 시간 :	<input style="width:200px;" type="text" name="startWorkHour" class="timepicker1"/></p>
						<p>종료 시간 :	<input style="width:200px;" type="text" name="endWorkHour" class="timepicker1"/></p>
						<p>고용하시겠습니까?</p>
						<input type="submit" value="예">
						<input type="button" class="popClose" value="아니오">
						<hr>
						</form>
					</div>
				</div>
				<!-- <input type="checkbox" name="popCheck" id="pop03" onClick="" /><label for="pop03">오늘 하루 창 열지않기</label> -->
				<!-- <a href="#" onClick="layerX(this);" class="popClose">[닫기]</a> -->
			</div>

		</div>`
    );
}