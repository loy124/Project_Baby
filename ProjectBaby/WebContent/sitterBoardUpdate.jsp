<%@page import="sitterboard.SitterBoardCommentDto"%>
<%@page import="sitterboard.SitterBoardDto"%>
<%@page import="main.BabyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<style>
/* -------------- 게시판 ---------------*/
.bdList th {
	background: #f8f8f8;
	font-size: 16px;
	color: #3b3b3b;
	font-weight: 400;
	padding: 20px 8px;
	text-align: left;
}

table th, table td {
	vertical-align: middle;
}

.bdList td.toe {
	height: auto;
}

th {
	font-family: 'Noto Sans KR', sans-serif;
	list-style: none;
	line-height: 1;
	letter-spacing: -0.5px;
	display: table-cell;
	text-align: -internal-center;
}

.a {
	color: #545454;
}

.writeBtn {
	color: #fff !important;
	background-color: #bbb8b2 !important;
	border-color: #bbb8b2 !important;
	box-shadow: none !important;
	border-radius: 3px;
	padding: 4px 5px 5px 5px;
	margin-bottom: 10px;
	display: inline-block;
}

.sitterBoard .inner {
	margin: 0 150px;
	position: relative;
}

.bdList tr.content td {
	padding: 10px 10px;
	text-align: left;
	vertical-align: top;
	height: 250px;
}

.file {
	text-align: left;
	padding: 10px 8px;
}

.sitterBoard .bdList table {
	box-sizing: border-box;
	width: 1000px;
}

.btn1 {
	color: #fff !important;
	background-color: #bbb8b2 !important;
	border-color: #bbb8b2 !important;
	box-shadow: none !important;
	border-radius: 3px;
	padding: 5px 5px 5px 6px;
	margin-bottom: 10px;
	margin-top: 10px;
	margin-left: 50px;
	display: inline-block;
	float: right;
}

.cont2 {
	padding: 13px 47px;
	text-align: left;
	vertical-align: top;
	height: 250px;
}

.ud {
	font-size: 11px;
	text-align: right;
}

body {
	
	padding-bottom: 30px;
}
</style>

<%@ include file="./include/header.jsp"%>


<!-- content 영역 -->

<%
	/* BabyMemberDto babyMemberDto = (BabyMemberDto)session.getAttribute("login");
	if(babyMemberDto != null){
		System.out.println("로그인후 dto" + babyMemberDto.toString());
	} */
%>
<%
	BabyMemberDto login = (BabyMemberDto) session.getAttribute("login");
%>
<%
	SitterBoardDto dto = (SitterBoardDto) request.getAttribute("sitterBoardUpdate");
	String mail1 = null;
	String mail = dto.getId();
	int idx = dto.getId().indexOf("@");
	mail1 = mail.substring(0, idx);

	String date1 = null;
	String date = dto.getRegisterDate();
	date1 = date.substring(0, 11);
%>
<%
	SitterBoardCommentDto cDto = (SitterBoardCommentDto) request.getAttribute("sitterBoardCommentDto");
	if (cDto != null) {
		System.out.println(cDto.toString());
	} else {
		System.out.print("음슴");
	}
%>

<div class="containerWrap sitterBoard">
	<div class="container_inner">
		<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
		<div class="cont1 content clearfix">
			
			<h2></h2>

			<form name="form" id="form" method="post" 
				action="sitterUpdate?type=sitterBoardUpdate" enctype="multipart/form-data">
				<!-- <input type="hidden" name="type" value="sitterBoardUpdate" > -->
				<input type="hidden" name="seq" value="<%=dto.getSeq() %>">

					<div class="mb-3">

						<label for="title">제목</label> <input type="text"
							class="form-control" name="title" id="title"
							 value="<%=dto.getTitle() %>">

					</div>



					<div class="mb-3">

						<label for="reg_id">작성자</label> <input type="text"
							class="form-control" name="id" id="id_"
							value="<%=login.getId() %>" readonly="readonly">

					</div>



					<div class="mb-3">

						<label for="content">내용</label>

						<textarea class="form-control" rows="5" name="content"
							id="content" ><%=dto.getContent() %></textarea>

					</div>



					<div class="mb-3">

						<label for="tag">파일첨부</label> 
						<input type="file" class="form-control" name="fileload" id="file"	
							placeholder="이력서를 첨부 해주세요" style="width: 400px">
							<input type="hidden" name="oldfile" value="<%=dto.getFileName() %>"> 

					</div>



				</form>

				<div>

					<button type="submit" class="btn btn-sm btn-primary" id="btnSave">수정</button>

					<button type="button" class="btn btn-sm btn-outline-danger" id="btnList">취소</button>

				</div>

			</div>

		</article>

		</div>
<%-- 		<div class="cont2 content clearfix" style="">
			<form id="commentForm" name="commentForm" action="comment">
				<input type="hidden" name="type" value="scomment"> <input
					type="hidden" name="seq" value="<%=dto.getSeq()%>">
				<%
					System.out.println("seq: " + dto.getSeq());
				%>
				<br>
				<br>
				<div>
					<div>
						<span><strong>Comments</strong></span> <span id="cCnt"></span>
					</div>
					<div>
						<br>
						<table class="table">
							<tr>
								<td><textarea style="width: 1002px" rows="3" cols="20"
										id="comment" name="boardComment" class="text"
										placeholder="댓글을 입력하세요"></textarea> <br>
									<div>
										<input type="submit" value="등록" class="btn1" id="go">
										<a href='#' onClick="fn_comment('${result.code }')" class="btn pull-right btn-success">등록</a>
									</div></td>
							</tr>
						</table>
					</div>
				</div>
				<input type="hidden" id="b_code" name="b_code" value="${result.code }" />

				<div class="form-check" style="">
				<%
				if(cDto.getComment() != null){
					%>
					<div>
						<span><strong>관리자</strong></span> <span id="cCnt"></span>
					
					</div>
					<p><%=cDto.getComment()%></p>
					<%
				}
				%>



					<!-- <span class="check-email-text"></span> -->
				</div>
			</form>

		</div> --%>
		<!-- <div class="cont3 content clearfix" style="background-color: #ccc;"></div> -->
	</div>
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
<!--// container -->

<%@ include file="./include/footer.jsp"%>



















