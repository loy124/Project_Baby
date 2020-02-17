<%@page import="main.BabyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ include file="./include/header.jsp" %>


<head>
    <link rel="stylesheet" href="/css/bootstrap.css">
</head>
<style>
.text{
    width: 977px;
    height: 66px;

}

.btn1{
    color: #fff !important;
    background-color: #bbb8b2 !important;
    border-color: #bbb8b2 !important;
    box-shadow: none !important;
    border-radius: 3px;
    padding: 5px 5px 5px 6px;
    margin-bottom: 10px;
    margin-left: 50px;
    display: inline-block;
    float: right;
}
</style>

<!-- content 영역 -->

<%
/* BabyMemberDto babyMemberDto = (BabyMemberDto)session.getAttribute("login");
if(babyMemberDto != null){
	System.out.println("로그인후 dto" + babyMemberDto.toString());
} */
%>
<div class="containerWrap main">
	<div class="container_inner">
		<!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
		<div class="cont1 content clearfix" style="background-color: #ccc;"></div>
		<div class="cont2 
		content clearfix" style="background-color: #eee;">
		<form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
            <br>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 1039px" rows="3" cols="20" id="comment" name="comment"  class="text" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                            	<input type="button" value="등록" class="btn1">
                                <a href='#' onClick="fn_comment('${result.code }')" class="btn pull-right btn-success">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="b_code" name="b_code" value="${result.code }" />        
    </form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
 
<!-- <script>
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(code){
    
    $.ajax({
        type:'POST',
        url : "<c:url value='/board/addComment.do'/>",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
    
    $.ajax({
        type:'GET',
        url : "<c:url value='/board/commentList.do'/>",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
                    html += data[i].comment + "<tr><td></td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                }
                
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}
 
</script>
  -->
		
		
		
		
		
		</div>
		<div class="cont3 content clearfix" style="background-color: #ccc;"></div>
	</div>
</div>
<!--// container -->


<%@ include file="./include/footer.jsp" %>