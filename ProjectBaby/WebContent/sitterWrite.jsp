<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="./include/header.jsp" %>

<%
BabyMemberDto login = (BabyMemberDto)session.getAttribute("login");
%>

<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>


<!-- content 영역 -->
<div class="containerWrap main">
	<div class="container_inner">
		<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
		<div class="cont1 content clearfix" >
		<!-- jQuery -->

			<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
				integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
				crossorigin="anonymous"></script>



			<!-- Bootstrap CSS -->
			 <link rel="stylesheet"
				href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
				integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
				crossorigin="anonymous">  



			<title>board</title>





<style>
body {
	
	padding-bottom: 30px;
}
</style>



	<article>

		<div class="container" role="main">

			<h2>Sitter</h2>

			<form name="form" id="form"  method="post"
				action="sitterWrite?type=write" enctype="multipart/form-data">
				<input type="hidden" name="type" value="write">

					<div class="mb-3">

						<label for="title">제목</label> <input type="text"
							class="form-control" name="title" id="title"
							placeholder="제목을 입력해 주세요">

					</div>



					<div class="mb-3">

						<label for="reg_id">작성자</label> <input type="text"
							class="form-control" name="id" id="id_"
							value="<%=login.getId() %>" readonly="readonly">

					</div>



					<div class="mb-3">

						<label for="content">내용</label>

						<textarea class="form-control" rows="5" name="content"
							id="content" placeholder="내용을 입력해 주세요"></textarea>

					</div>



					<div class="mb-3">

						<label for="tag">파일첨부</label> 
						<input type="file" class="form-control" name="fileload" id="file"	
							placeholder="이력서를 첨부 해주세요" style="width: 400px">

					</div>



				</form>

				<div>

					<button type="button" class="btn btn-sm btn-primary" id="btnSave">등록</button>

					<button type="button" class="btn btn-sm btn-outline-danger" id="btnList">취소</button>

				</div>

			</div>

		</article>
		
		
		
		</div>
					<script>
				$(document).on('click', '#btnSave', function(e) {
					alert("클릭");
					e.preventDefault();

					$("#form").submit();

				});

				$(document).on('click','#btnList',
						function(e) {
							e.preventDefault();
							location.href = "sitterBoard.jsp";
						});
			</script>
<!-- 		<div class="cont2 content clearfix" style="background-color: #eee;"></div>
		<div class="cont3 content clearfix" style="background-color: #ccc;"></div> -->
	</div>
</div>
<!--// container -->


<%@ include file="./include/footer.jsp" %>