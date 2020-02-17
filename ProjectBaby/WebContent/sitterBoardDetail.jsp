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

.okbtn {
	color: #fff !important;
	background-color: #bbb8b2 !important;
	border-color: #bbb8b2 !important;
	box-shadow: none !important;
	border-radius: 3px;
	padding: 5px 5px 5px 6px;
	margin-bottom: 10px;
	margin-left: 50px;
	display: inline-block;
}

.nobtn {
	color: #fff !important;
	background-color: #bbb8b2 !important;
	border-color: #bbb8b2 !important;
	box-shadow: none !important;
	border-radius: 3px;
	padding: 5px 5px 5px 6px;
	margin-bottom: 10px;
	margin-left: 8px;
	display: inline-block;
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
	SitterBoardDto dto = (SitterBoardDto) request.getAttribute("detailDto");
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
			<form action="" enctype="multipart/form-data" id="frm">
					<%
					if (login.getAuth() == 1) {
				%>
				<button type="button" class="okbtn" id="okBtn">승인</button>
				<button type="button" class="nobtn" id="noBtn">거절</button>
				<%
					}
				%>
				
				<div class="bdList" align="center">
					<table style="border: 2px;">
						<colgroup>
							<col width="100px">
							<!-- 번호 -->
							<col width="130px">
							<!-- 구분1 -->
							<col width="200px">
							<!-- 제목 -->
							<col width="120px">
							<!-- 첨부파일여부(공지사항) 그 외(작성자) -->
							<col width="150px">
							<!-- 등록일 -->
							<col width="100px">
							<!-- 조회수 -->
						</colgroup>
						<tbody>
							<%
								if (dto != null) {
							%>
							<tr height="1.2" bgcolor="#000">
								<td colspan="6"></td>
							</tr>
							<tr>
								<th colspan="6"><%=dto.getTitle()%></th>
								<input type="hidden" name="title" value="<%=dto.getTitle()%>">

								<!-- <th>수정</th>                                        
	                        <th>삭제</th> -->
								<!-- <th>작성자 </th>
	                        <th>등록일</th>
	                        <th>조회수</th>  -->
							</tr>
							<tr height="0.5" bgcolor="#dddddd">
								<td colspan="6"></td>
							</tr>

							<tr>
								<td colspan="3" align="center" class="file"><input
									type="button" name="btndown" value="파일"
									onclick="location.href='fileDown?filename=<%=dto.getFileName()%>&seq=<%=dto.getSeq()%>&type=download&ofilename=<%=dto.getOriginalFileName()%>'">
									파일 : <%=dto.getOriginalFileName()%> 
									<input type="hidden" name="filename" value="<%=dto.getFileName()%>">
									<input type="hidden" name="originalFileName" value="<%=dto.getOriginalFileName() %>">
									</td>
								<td style="font-size: 11px;">등록일 <%=date1%>
								</td>
								<td style="font-size: 11px;">작성자:<%=mail1%> <input
									type="hidden" name="writer" value="<%=mail1%>">
								</td>
								<td style="font-size: 11px;">조회수<%=dto.getreadCount()%></td>
							</tr>
							<tr height="0.5" bgcolor="#dddddd">
								<td colspan="6"></td>
							</tr>

							<tr class="content">

								<td colspan="6"><%=dto.getContent()%> <input type="hidden"
									name="content" value="<%=dto.getContent()%>"></td>

							</tr>
							<tr height="0.5" bgcolor="#dddddd">
								<td colspan="6"></td>
							</tr>
							<%
								}
							%>
							<div align="right" class="dup">
								<tr>
									<td colspan="4">
										<!--    <a href="update" class="ud">삭제</a>&nbsp;&nbsp;&nbsp;
	                    <a href="update" class="ud">수정</a>   -->

									</td>
									<!-- <td>
	                     <a href="update" class="ud">수정</a>  
	                    </td> -->
									<td colspan="2" class="ud">
									<a href="writeUpdate?type=sitterBoardUpdate&seq=<%=dto.getSeq()%>"
										class="" id="update">수정
										<input type="hidden" name="type" value="sitterBoardUpdate" > 
										<input type="hidden" name="seq" value="<%=dto.getSeq()%>">
										</a> 
										
										&nbsp;&nbsp;&nbsp; <a href="boardDelete?type=sitterBoardDelete&seq=<%=dto.getSeq() %>" class="">삭제</a></td>
									<!--  <td>삭제</td> -->
								</tr>
							</div>
						</tbody>
					</table>
				</div>
			</form>

		</div>
		<div class="cont2 content clearfix" style="">
			<form id="commentForm" name="commentForm" action="comment?type=comment&seq=<%=dto.getSeq()%>">
				<input type="hidden" name="type" value="comment"> <input
					type="hidden" name="seq" value="<%=dto.getSeq()%>"> 
					<input	type="hidden" value="<%=login.getAuth()%>" name="auth">
				<%
					System.out.println("seq: " + dto.getSeq());
				%>
				<br> <br>
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
										placeholder="관리자 권한입니다."></textarea> <br>
									<div>
										<input type="submit" value="등록" class="btn1" id="go">
										<%-- <a href='#' onClick="fn_comment('${result.code }')" class="btn pull-right btn-success">등록</a> --%>
									</div></td>
							</tr>

						</table>


					</div>
				</div>
			</form>
				<%-- <input type="hidden" id="b_code" name="b_code" value="${result.code }" /> --%>

				<div class="form-check" style="">
					<%
						if (cDto.getComment() != null) {
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

		</div>
		<!-- <div class="cont3 content clearfix" style="background-color: #ccc;"></div> -->
	</div>
</div>
<!--// container -->
<script>
	/* $("#go").prop("disabled", true); */
	/* $("#go").click(function () {
	 alert("클릭");
	 location.href="comment?type=scomment";
	 }) */
	$("#update").click(function() {
		$("#frm").submit();
	});
	
	$("#okBtn").click(function () {
		alert("클릭");
		location.href = "sitterOk?id=<%=dto.getId()%>"
	});
	
	$("#noBtn").click(function () {
		alert("클릭");
		location.href = "sitterNo?seq=<%=dto.getSeq()%>&id=<%=dto.getId()%>"
	});
</script>

<%@ include file="./include/footer.jsp"%>



















