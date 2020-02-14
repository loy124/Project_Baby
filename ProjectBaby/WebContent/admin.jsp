<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%
		//카운트
		
		List<BabyMemberDto> list = (List<BabyMemberDto>) request.getAttribute("memberList");
		//String sMemberCount =  (String)request.getAttribute("memberCount");
		int memberCount = (int)request.getAttribute("memberCount");
		String address = (String)request.getAttribute("address");
		String wantDate = (String)request.getAttribute("wantDate");
		String wantDateIndex[] = wantDate.split(",");
		
		
		String day[] = {"월", "화", "수", "목", "금", "토", "일"};
		
		if(wantDateIndex != null){
			for(int i = 0; i < wantDateIndex.length; i ++){
				System.out.println(wantDateIndex[i] + "aa");
				for(int j = 0; j< day.length; j++){
					if(wantDateIndex[i].equals(day[j])){
						%>
						<script>
						$(document).ready(function () {
							
							$("input[value=<%=wantDateIndex[i]%>]").prop("checked", true);
						});
						</script>
						<%
					}
				}
			}
		}
		
		System.out.println("주소:" + address);
		System.out.println("원하는날:" + wantDate);
		if(list != null){
			
			for(int i = 0; i < list.size(); i++){
				System.out.print("리스트");
				System.out.println(list.get(i).toString());
			}
		}
		
		System.out.println("admin의 " + memberCount);
		//페이지 번호 불러오기 req.getParameter
		/* if(sMemberCount != null){
			memberCount = (Integer.parseInt(sMemberCount));
		} */
		int memberPage = memberCount / 10; //22개글 -> 3페이지
		if(memberCount % 10 > 0){
			memberPage = memberPage + 1;
		}
	%>

</head>
<body>
	
	<%@ include file="./include/header.jsp"%>
	<!-- <table class="table table-striped .table-bordered .table-hover">
  
</table> -->

	<div class="containerWrap main">
		<div class="container_inner">
			<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
			<div class="cont1 content clearfix" style="background-color: #ccc;">
				<table class="table table-bordered table-hover"
					style="background-color: #f2f2f2;">
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>가입상태</th>
					</tr>
					<%
						if (list == null || list.size() == 0) {
					%>
					<tr>
						<td colspan="4">가입한 회원이 없습니다</td>
					</tr>
					<%
						} else {
							for (int i = 0; i < list.size(); i++) {
								BabyMemberDto dto = list.get(i);
					%>
					<tr>
						<th><%=i + 1%></th>
						<td><a href="adminDetail?type=moveDetail&id=<%=dto.getId()%>"><%=dto.getId()%></a></td>
						<td><%=dto.getName()%></td>
						<td><%=dto.getAuth()%></td>
					</tr>
					<%
						}
						}
					%>

					<tr>
						<td colspan="4">
						
							<form action="admin">
							<input type="hidden" name="type" value="searchMember">
							<input type="hidden" name="pageNumber" value="0">
								<input name="address" placeholder="지역을 입력하세요">
								&nbsp;&nbsp;&nbsp; <span> <span><input
										type="checkbox" name="wantDate" value="월"><span>월</span>&nbsp;</span>
									<span><input type="checkbox" name="wantDate" value="화"><span>화</span>&nbsp;</span>
									<span><input type="checkbox" name="wantDate" value="수"><span>수</span>&nbsp;</span>
									<span><input type="checkbox" name="wantDate" value="목"><span>목</span>&nbsp;</span>
									<span><input type="checkbox" name="wantDate" value="금"><span>금</span>&nbsp;</span>
									<span><input type="checkbox" name="wantDate" value="토"><span>토</span>&nbsp;</span>
									<span><input type="checkbox" name="wantDate" value="일"><span>일</span>&nbsp;</span>
								</span> <input type="submit" value="검색">
								
								<span>
							<!-- 	<select name="wantTime">
									<option selected value="6시~10시">6시 ~ 10시</option>
									<option value="10시~12시">10시 ~ 12시</option>
									<option value="12시~16시">12시 ~ 16시</option>
									<option value="16시~20시">16시 ~ 20시</option>
									<option value="20시~24시">20시 ~ 24시</option>
								</select> -->
								</span>
							</form>
						</td>
					</tr>
				</table>

				<%
				for(int i = 0; i < memberPage; i++){
					//페이지넘버
					%>
					<button onclick="goPage(<%=i%>)"><%=i +1 %></button>
					<%
					
				}
				%>

			</div>
		</div>
	</div>
	<%@ include file="./include/footer.jsp"%>
	<script type="text/javascript">
	//페이징상태에도 주소값을 저장
	$("input[name=address]").val(<%=request.getAttribute("address")%>);
	function goPage(pageNum){
		let address = $("input[name=address]").val();
		let arr=[];
		let wantDate = $("input:checkbox[name=wantDay]:checked").each(function(){
			//console.log("값 + " + this.value);
			console.log(this.value);
			arr.push(this.value);
		});
		let link = "admin?type=moveAdmin&pageNumber=" + pageNum;	
			if(address != "" && address != undefined){
				link = link + "&address=" + address;
			}
			if(wantDate != ""){
				link = link + "&wantDate=" + arr;
			}
			console.log("pageNum = " + pageNum);
			
		console.log(arr);
		
		console.log(address);
		console.log(wantDate);
		location.href = link;
	}
	</script>





