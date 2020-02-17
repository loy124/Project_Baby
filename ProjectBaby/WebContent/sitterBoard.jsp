<%@page import="main.BabyMemberDao"%>
<%@page import="sitterboard.SitterBoardDao"%>
<%@page import="sitterboard.SitterBoardDto"%>
<%@page import="java.util.List"%>
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
	color: #231815;
	font-weight: 500;
	padding: 25px;
}

table th, table td {
	vertical-align: middle;
	text-align: center;
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

.writebtn {
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

.sitterBoard .inner {
	/* 	margin: 0 150px; */
	position: relative;
}

.sitterBoard .bdList table {
	box-sizing: border-box;
	width: 1000px;
}

.sub {
	height: 30px;
	padding: 10px;
}
.paging{
	margin-top: 10px;
}
</style>

<!-- content 영역 -->
<%
	/* BabyMemberDto babyMemberDto = (BabyMemberDto)session.getAttribute("login");
	if(babyMemberDto != null){
		System.out.println("로그인후 dto" + babyMemberDto.toString());
	} */
%>
<%@ include file="./include/header.jsp"%>


<%
	BabyMemberDto login = (BabyMemberDto) session.getAttribute("login");
%>

<%
	List<SitterBoardDto> list = (List<SitterBoardDto>) request.getAttribute("searchList");
	String choice = (String) request.getAttribute("choice");
	String searchWord = (String) request.getAttribute("searchWord");
	int boardPage = (int) request.getAttribute("boardPage");
	System.out.println("보드페이지:" + boardPage);
	
	
	int pageNumber = (int) request.getAttribute("pageNumber");
	System.out.println("pageNumber:" + pageNumber);
	
%>

<div class="containerWrap sitterBoard">
	<div class="container_inner">
		<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
		<div class="cont1 content clearfix">
			<div class="inner">
				<%
					if (login.getAuth() == 5) {
				%>
				<button type="button" class="writebtn" id="btnWrite">글쓰기</button>
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

							<tr height="1.5" bgcolor="#000">
								<td colspan="6"></td>
							</tr>
							<tr>
								<th>번호</th>
								<th>구분</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>조회수</th>
							</tr>
							<tr height="0.5" bgcolor="#dddddd">
								<td colspan="6"></td>
							</tr>
							<%
								if (list.size() == 0 || list == null) {
							%>
							<tr>
								<td colspan="6" align="center">작성 된 글이 없습니다.</td>
							</tr>
							<tr height="0.5" bgcolor="#dddddd">
								<td colspan="6"></td>
							</tr>
							<%
								} else {
									String mail1 = null;
									for (int i = 0; i < list.size(); i++) {
										SitterBoardDto dto = list.get(i);
										if (dto.getId() != null) {
											String mail = dto.getId();
											int idx = dto.getId().indexOf("@");
											mail1 = mail.substring(0, idx);
											System.out.println("idx:" + idx);
											//mail1 = dto.getId().split("@");
											//System.out.println(mail1[0] + " " + mail1[1]);
											System.out.println("mail:" + mail);
											//System.out.println("mail1:" + mail1);

										}
							%>
							<tr class="sub">
								<td><%=i + 1%></td>
								<td><img src="./images/lock.png" style="width: 15px; height: 15px;"></td>


								<%
								if(dto.getDel() == 0) {
									%>
									<td class="subject toe"><a
									href="sitterDetail?seq=<%=dto.getSeq()%>&type=detail&filename=<%=dto.getOriginalFileName()%>&id=<%=login.getId() %>&auth=<%=login.getAuth() %>&wid=<%=dto.getId() %>"
									class="a" id="a_go" onclick="userCheck('<%=dto.getId()%>')"><%=dto.getTitle()%></a></td>
									<%
								}else if(dto.getDel() == 1){
									%>
									<td class="subject toe">삭제 된 글입니다.</td>
									<%
								}
								%>	
								



								<td class="writerMail"><%=mail1%> <input type="hidden"
									value="<%=mail1%>" id="writerMail"></td>
								<td><%=dto.getRegisterDate()%></td>
								<td><%=dto.getreadCount()%></td>
							</tr>
							<tr height="0.5" bgcolor="#dddddd">
								<td colspan="6"></td>
							</tr>
							<%
								}
								}
							%>

						</tbody>
					</table>
				</div>


				<!-- </form> -->

			</div>

		</div>


		<div class="cont2 content clearfix" style="">
		<div align="center" class="paging">
			<%
				for (int i = 0; i < boardPage; i++) {
					if (pageNumber == i) { // 현재페이지
			%>
			<span style="font-size: 15pt; color: #9393ce; font-weight: bold;">
				<%=i + 1%>
			</span>&nbsp;
			<%
				} else { // 나머지
			%>
			<a href="#none" title="<%=i + 1%>페이지" onclick="goPage(<%=i%>)"
				style="font-size: 15pt; color: #000; font-weight: bold; text-decoration: none">
				[<%=i + 1%>]
			</a>&nbsp;
			<%
				}
			}
			%>
			</div>

<br><br>

	<div align="center">
			<select id="choice">
				<option value="sel">선택</option>
				<option value="title">제목</option>
				<option value="writer">작성자</option>
				<option value="content">내용</option>
			</select> <input type="text" id="search" value="" placeholder="검색어를 입력하세요">

			<button type="button" onclick="searchSitterBoard()">검색</button>
	</div>
			<script type="text/javascript">
				function searchSitterBoard() {
					alert("클릭");
					var choice = document.getElementById("choice").value;
					var word = $("#search").val();
					
					location.href = "searchSitterBoard?searchWord=" + word + "&choice="+choice;
				}
				function goPage(pageNum) {
					var choice = $("#choice").val();
					var word = $("#search").val();
					
					alert("pageNum: " + pageNum);
					
					if(word == ""){
						document.getElementById("choice").value = 'sel';
					}
					var linkStr = "searchSitterBoard?pageNumber=" + pageNum;
					if(choice != 'sel' && word != ""){
						linkStr=linkStr + "&searchWord=" + word + "&choice=" + choice;
					}
					location.href = linkStr;
				}
	</script>
</div>
		
		<!-- 		<div class="cont3 content clearfix" style="background-color: #ccc;"></div> -->
	</div>
</div>
<!--// container -->
<script type="text/javascript">
$(document).ready(function () {
	var _choice = '<%=choice %>';
	var _searchWord = '<%=searchWord %>';
	if(_choice != '' && _choice != 'sel'){		
		if(_searchWord != ""){			
			$("#choice").val(_choice);
			$("#search").val(_searchWord);
		}
	}
});

</script>
<script>
	$("#btnWrite").click(function() {
		alert("클릭");
		location.href = "sitterWrite.jsp";
	});
<%-- 	function userCheck(id) {
		if(id == <%=login.getId()%> || <%=login.getAuth()%> == 1){
			System.out.println("스크립트 아이디 : " + id);
			location.href="sitterDetail";
		}else {
			alert("잠긴 글 입니다");
			return;
		}
	}  --%>
</script>

<%@ include file="./include/footer.jsp"%>














