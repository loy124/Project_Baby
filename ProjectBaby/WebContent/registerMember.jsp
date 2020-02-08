<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<style>
body {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.form-container {
	margin-left: 30px;
}

.form-container>* {
	margin-top: 10px;
	text-align: left;
}

.label {
	display: inline-block;
	width: 80px;
}

.form-check {
	margin-top: 10px;
}

.form-address>* {
	margin-bottom: 10px;
}
</style>
<body>
	<h1>회원가입</h1>
	<p>환영합니다</p>
	<div align="center">

		<!-- submit시 RegiInfoServlet에 method방식은 pos에
      type registerAf와 값들을 가지고 이동한다 -->
		<form action="register" method="post">
			<div class="form-container">
				<input type="hidden" name="type" value="registerMemberAf">
				<div class="form-id">
					<span class="label">id(이메일)</span> <input type="text" id="id"
						name="id" size="20"> <span id="idcheck"
						style="font-size: 8px"> <input type="button" id="btn"
						value="id확인"> <span class="id-check-text">id 확인시
							텍스트</span>
					</span>
					<!-- 아이디 확인시 클릭시 이메일인증 번호를 전송 -->
					<div class="form-check" style="display: none;">
						<input type="text" class="check-email-input"
							placeholder="인증번호를 입력하세요">&nbsp;&nbsp;<input
							type="button" class="check-email-button" value="인증번호 확인">
						<span class="check-email-text"></span>
					</div>
				</div>
				<div class="form-password">
					<span class="label">패스워드</span><input type="text" name="password"
						size="20">
				</div>
				<div class="form-name">
					<span class="label">이름</span><input type="text" name="name"
						size="20">
				</div>
				<div class="form-age">
					<span class="label">나이</span><input type="text" name="age"
						size="20">

				</div>
				<div class="form-gender">
					<span class="label">성별</span> <input type="radio" name="gender"
						value="남"> <span>남</span> <input type="radio"
						name="gender" value="여"><span>여</span>
				</div>

				<div class="form-phone-number">
					<span class="label">휴대폰 번호</span> <input type="text"
						name="numberFirst" size="10">- <input type="text"
						name="numberSecond" size="10">- <input type="text"
						name="numberThird" size="10">
				</div>

				<%--주소--%>
				<div class="form-address">
					<div>주소</div>
					<div>
						<input type="text" name="zipCode" id="sample4_postcode"
							placeholder="우편번호"> <input type="button"
							onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
					</div>
					<div></div>
					<div>
						<input type="text" name="roadAddress" id="sample4_roadAddress"
							placeholder="도로명주소" size="30">
						<%-- <input type="text"
							name="numberAddress" id="sample4_jibunAddress"
							placeholder="지번주소" size="30"> --%>
					</div>
					<span id="guide" style="color: #999; display: none"></span>
					<div>
						<input type="text" name="detailAddress" id="sample4_detailAddress"
							placeholder="상세주소">
					</div>
				</div>
				<div class="form-submit">
					<input type="submit" value="회원가입" id="submitBtn">
				</div>
			</div>
		</form>
	</div>


	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		let emailAuthData = "";

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
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}

		//idCheck를 RegiInfoServlet에 넘겨주고 success로 값을 받아온다
		//값을 정확히 받아오면 console.log에 true or false가 찍힌다
		$("#submitBtn").prop("disabled", true);
		$("#btn")
				.click(
						function() {
							//alert("됨");   

							//이메일 정규식 사용하기
							var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							if ($("#id").val().match(regExp) === null) {
								$(".id-check-text").css("color", "#ff0000");
								$(".id-check-text").html("올바른 이메일 형식을 사용해주세요");
								return;
							}

							$
									.ajax({
										url : "./register",
										//data : "id=" + $("#id").val(),
										//json타입
										type : "get",
										data : {
											"type" : "idCheck",
											"id" : $("#id").val()
										},
										success : function(data) {
											console.log(data);
											if (data.trim() === "false") {
												//alert("사용 가능한 아이디입니다")
												$(".id-check-text").css(
														"color", "#0000ff");
												$(".id-check-text")
														.html(
																"사용할 수 있는 id입니다. 해당 이메일로 인증번호를 발송하였습니다");
												/* $("#submitBtn").prop(
														"disabled", false); */
												$(".check-email").prop(
														"disabled", "false");
												$(".form-check").toggle();
												//email과 연동하는 Ajax 호출 (하단에 선언)#/
												emailAjax();
											} else if (data.trim() == "true") {
												$(".id-check-text").css(
														"color", "#ff0000");
												$(".id-check-text").html(
														"사용중인 id입니다");
												$("#id").val("");
												$("#submitBtn").prop(
														"disabled", true);
											}
										}
									})
						});

		function emailAjax() {
			$.ajax({
				url : "./email",
				type : "get",
				data : {
					"id" : $("#id").val()
				},
				success : function(emailData) {
					console.log(emailData);
					//상단에 선언해준 emailAuthData에 data1 할당
					emailAuthData = emailData.trim();
				}
			});
		}

		$(".check-email-button").click(function() {

			console.log(typeof emailAuthData);
			console.log(typeof $(".check-email-input").val());
			let emailInputData = $(".check-email-input").val().trim();

			if (emailInputData !== "" & emailInputData === emailAuthData) {
				$(".check-email-text").css("color", "blue");
				$(".check-email-text").html("인증번호가 확인되었습니다.");
				$(".check-email-button").prop("disabled", "true");
				$("#btn").prop("disabled", "true");
			} else {
				$(".check-email-text").css("color", "red");
				console.log(emailAuthData);
				console.log("val = " + $(".check-email-input").val());
				$(".check-email-text").html("인증번호가 올바르지 않습니다. 다시 확인하세요");
			}
		});

		/* if($("input").val() == ""){
			$("#submitBtn").prop("disabled", true);
			alert("비었지롱");
		}else{
			$("#submitBtn").prop("disabled", true);
			alert("아니지롱");
		} */
	</script>
</body>
</html>