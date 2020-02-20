<%@page import="main.BabyMemberDao"%>
<%@page import="main.BabyMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<%@ include file="./include/header.jsp"%>
<style>

.abs {
   color: #ff9999
}

.mypage .boxs {
    display: flex; 
   flex-direction: row;
   float: left;

   /*     margin-right: 10px; */
}

.mypage .box1 {
   flex-direction: column;
   height: 550px;
   width: 300px;
   text-align: center;
   /*   align-self:center; */
   background-color: rgba(205,255,254,0.8);
}

.mypage .box2 {
   flex-direction: column;
    height: 550px;
   width: 800px;
   background-color: rgba(190, 255, 239, 0.8); 
   padding-left: 50px;
   padding-right: 50px;
   padding-bottom: 60px;
   
   
}

.mypage .row1{
height: 120px;
/* background-color:black; */ 
}
.mypage .row2{
height: 275px;
/*  background-color:blue;  */
}

.mypage .items{
    display: flex; 
   flex-direction: row;
    float: left; 
      padding-top:20px;
 
}

.mypage .item1{
   width: 200px;   height: 275px;
/*    background-color:red;  */
}
.mypage .item2{
   width: 250px;    height: 275px;
/*     background-color:orange;  */

   /* padding-bottom:30px; */
   padding-left: 30px;
   
   font-size: 14px;
}

.mypage .keyTr {
height:40px;

}
.mypage .keyTd {
text-align:left;
font-size:12px;
}

.mypage .item3{
   width: 250px;    height: 275px;
/*    background-color:yellow;  */
   padding-left: 10px;
}


.mypage .row3{
height: 155px;
/* background-color:lime;  */
}

/* vertical-align: middle; */
.menu>a:hover {
text-decoration:underline;
color: #ff9999;

}

.mypage .content {
margin-bottom:100px;
}  

.emptyUserID{
text-align:center;
font-size:30px;
}

</style>

   <%
       BabyMemberDao dao = BabyMemberDao.getInstance();
      BabyMemberDto dto = (BabyMemberDto) request.getSession().getAttribute("login");
      BabyMemberDto sitterDto = null;
      BabyMemberDto userDto = null;
      
   %>


   <%
      if (dto.getAuth() == 3 || dto.getAuth() == 9) { //일반회원의 경우
   
      sitterDto = dao.getDetail(dto.getSitterId());
   
      } else if (dto.getAuth() == 4 || dto.getAuth() == 5 || dto.getAuth() == 6 || dto.getAuth() == 8) { //시터의 경우
   
      userDto = dao.getDetail(dto.getUserId());
   
      }
   %>
            












<!-- content 영역 -->

<div class="container_inner mypage">
   <!-- 필요 없으면 div 삭제 (필요한거 남기고!) 배결색은 style만 삭제하면 되요~~!! -->
   <div class="cont1 content clearfix mypage"
      style=" height: 550px">

      <div class="boxs box1">
         <p style="padding-top: 30px;">
            <b class="abs" style="font-size: 25pt;">MyPage</b>
         </p>



         <br>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <table>
            <tr>

                 <%   if (dto.getRealFileName() == null || dto.getRealFileName() == "null") {
               %>
            <span>   <img src='./image/mainImage.png'
                  style="border-radius: 100%;" width='110px' height='110px'> </span>
               <%
                  } else {
               %>

            <span>   <img src='http://192.168.2.10:8090/ProjectBaby/upload/<%=dto.getRealFileName()%>'
                  style="border-radius: 100%;" width='110px' height='110px'> </span>
               <%
                  }
               %>
                   

            </tr>
         </table>

         <br>

         <table style="background-color: #f0f0f0; height: 30px;">
            <col width="130px">
            <tr>
               <td style="text-align: center; font-size: 15pt;">
                  <p style="padding-top: 5px;"><%=dto.getName()%>님
                  </p>
               </td>
            </tr>
            <tr>
               <td>
                  <p
                     style="font-size: 9pt; text-align: center; font-weight: bold; padding-bottom: 10px;">
                     <%=dto.getId()%></p>
               </td>
            </tr>
         </table>
         <br>
         <div>
            <table
               style="background-color: #f0f0f0; size: '30'; font-size: '14px'; height: '13px'; margin-left: 50px;">
               <col width="200px">
               <tr>
                  <td style="text-align: center;">
                     <p style="margin: 3px; padding-top: 17px;" class="menu">
                           &nbsp;&nbsp;<img src='./image/arrow.png' width='10px' height='10px' /> &nbsp;
                           <a href="mypage_main.jsp">예약 내역 확인</a>
                     </p>
                  </td>
               </tr>

               <tr>
                  <td style="text-align: center;">
                     <p style="margin: 3px;" class="menu">
                        <a href="mypage_imageUpdate.jsp">프로필 사진 업데이트</a>
                     
                     </p>
                  </td>
               </tr>

               <tr>
                  <td style="text-align: center;">
                     <p style="margin: 3px;" class="menu">
                        <a href="mypage_point.jsp">내 포인트 관리</a>
                        <!-- <a href="bbsWrite?type=write"> -->
                     </p>
                  </td>
               </tr>

               <tr>
                  <td style="text-align: center">
                     <p style="margin: 3px; color: #ff9999; padding-bottom: 17px;"
                        class="menu">
                      <a href="mypage_profile.jsp">내 계정
                           관리</a>
                     </p>
                  </td>
               </tr>

            </table>
         </div>
      </div>
       
       
         
       <div class="boxs box2">
            <div class="row1 rows"> <!--  내 예약 내역/프로필   -->
                  <p  style="padding-top: 50px;" >
                  <b class="title" style="font-size: 15pt; color: #82a3d4;">예약 내역 확인</b>
               </p>
               

      <%
      if (dto.getAuth() == 3 || dto.getAuth() == 9) { //일반회원의 경우
      %>
         <p>
         <b class="title" style="font-size: 13pt; color: #FFC561; text-decoration:underline;">예약한 시터 정보</b>
         </p>
       <%
      } else if (dto.getAuth() == 4 || dto.getAuth() == 5 || dto.getAuth() == 6 || dto.getAuth() == 8) { //시터의 경우
       %>
         <p>
         <b class="title" style="font-size: 13pt; color: #FFC561; text-decoration:underline;">예약한 회원 정보</b>
         </p>
      <%    
      }
      %>

               
               

            </div>
           
            
        <%
      if ((dto.getUserId()==null||dto.getUserId()=="null") && (dto.getSitterId()==null||dto.getSitterId()=="null")) { 
      %>


           <div class="row2 rows" style="padding-top:100px;"> <!-- #f0f0f0; -->

       <div  class="alert alert-danger" role="alert" style="vertical-align:middle; ">
         
         
         
         
            <%
      if (dto.getAuth() == 3 || dto.getAuth() == 9) { //일반회원의 경우
   %>
     
             <p class="emptyUserID"> 
                <b>
                
                예약한 시터가 없습니다.
                </b>
             </p> 

     
   <%
      } else if (dto.getAuth() == 4 || dto.getAuth() == 5 || dto.getAuth() == 6 || dto.getAuth() == 8) { //시터의 경우
        %>
   
   
             <p class="emptyUserID"> 
                <b>
                
                예약한 회원이 없습니다.
                </b>
             </p> 
             
        <%
      }
   %>
         
         

         

          </div>
        <%
      }else{
        %>
         <div class="row2 rows">    
            
            
          <div class="items"> 
                  <div class="item1" style="text-align:center;">
                     <!--    <p style="padding-top:30px;"><img src='./image/user.png' width='130x' height='130px'> </p> -->
   
   
            <p style="padding-top:30px;">
            
            
            
      
      <%

   
            if (dto.getAuth() == 3 || dto.getAuth() == 9) { //일반회원의 경우
                   if (sitterDto.getRealFileName() == null || sitterDto.getRealFileName() == "null" ) {
                     %>
                     
                  <span>   <img src='./image/mainImage.png'
                        style="border-radius: 100%;" width='130px' height='130px'> </span>
                        
                  
                     <%
                        } else {
                     %>
      
                  <span>   <img src='http://192.168.2.10:8090/ProjectBaby/upload/<%=sitterDto.getRealFileName() %>'
                        style="border-radius: 100%;" width='130px' height='130px'> </span>
                     <%
                        }
      
            } else if (dto.getAuth() == 4 || dto.getAuth() == 5 || dto.getAuth() == 6 || dto.getAuth() == 8) { //시터의 경우
                  if (userDto.getRealFileName() == null || userDto.getRealFileName() == "null" ) {
                     %>
                     
               <span>   <img src='./image/mainImage.png'
                     style="border-radius: 100%;" width='130px' height='130px'> </span>
                     <%
                        } else {
                     %>   
                  <span>   <img src='http://192.168.2.10:8090/ProjectBaby/upload/<%=userDto.getRealFileName() %>'
                        style="border-radius: 100%;" width='130px' height='130px'> </span>   
                        
                      <%   
                        }
            }
      
   
               %>
                        
            
            
            
            
            
            
            
       
               
               
               
               
               
             </p>
   
   
   
   
   
    <%--      ==========================================   일반 회원 일때     =============================================     --%>          

                  
               
                  <%
                     if (dto.getAuth() == 3 || dto.getAuth() == 9) {
                  %>
                  <p style="padding-bottom:17px;"><b  style="font-size: 15pt; "><%=sitterDto.getName() %></b></p> 
                  <%
                     } else if (dto.getAuth() == 4 || dto.getAuth() == 5 || dto.getAuth() == 6 || dto.getAuth() == 8) {
                  %>
                   <p style="padding-bottom:17px;"><b  style="font-size: 15pt; "><%=userDto.getName() %></b></p>  
                  <%
                     }
                  %>
                           
            
                  
                  </div>
                  
              
             <%
            if (dto.getAuth() == 3 || dto.getAuth() == 9) {
         %>

                  
                  <div class="item2" >
                    <table>
                        <tr class="keyTr">
                           <td class="keyTd"><b style="font-size: 14px;"> id : </b></td>
                           <td class="keyTd" style="font-size: 14px;"> <%=sitterDto.getId() %> </td>
                        </tr>
                        <tr class="keyTr">
                           <td class="keyTd"  style="font-size: 14px;"><b > 전화번호 : </b></td>
                           <td class="keyTd" style="font-size: 14px;"> <%=sitterDto.getPhoneNumber() %> </td>
                        </tr>
                        <tr class="keyTr">
                           <td class="keyTd"  style="font-size: 14px;"><b > 성별 : </b></td>
                           <td class="keyTd" style="font-size: 14px;"> <%=sitterDto.getGender() %></td>
                        </tr>
                        <tr class="keyTr">
                           <td class="keyTd"  style="font-size: 14px;"><b > 돌봄지역 : </b></td>
                           <td class="keyTd" style="font-size: 14px;"> <%=sitterDto.getWantLocal() %></td>
                        </tr>
                        <tr class="keyTr">
                           <td class="keyTd"  style="font-size: 14px;"><b> 경력 : </b></td>
                           <td class="keyTd" style="font-size: 14px;"><%=sitterDto.getCareer() %></td>
                        </tr>
                        <tr class="keyTr">
                           <td class="keyTd"  style="font-size: 14px;"><b> 시간당 페이 : </b></td>
                           <td class="keyTd" style="font-size: 14px;"><%=sitterDto.getWantPay()%></td>
                        </tr>
                    </table>

                  </div>
                  <div class="item3">
                       <p style="font-size: 15px;"><b>소개글  </b></p>
                       
                       
                   <%   if (sitterDto.getIntroduce() == null || sitterDto.getIntroduce() == "null") {
               %>
                      <textarea rows="9" cols="25" readonly="readonly" placeholder="작성된 소개글이 없습니다."></textarea>
               <%
                  } else {
               %>

            <textarea rows="9" cols="25" readonly="readonly" ><%=sitterDto.getIntroduce() %></textarea>
            
            
            
            
            
            
            
            
               <%
                  }
               %>
                       
   
                  </div>
           </div>
            </div>
      
             <%
            } else if (dto.getAuth() == 4 || dto.getAuth() == 5 || dto.getAuth() == 6 || dto.getAuth() == 8) {
         %>
         
             <div class="item2" >
                    <table>
                        <tr class="keyTr">
                           <td class="keyTd"><b style="font-size: 14px;"> id : </b></td>
                           <td class="keyTd" style="font-size: 14px;"> <%=userDto.getId() %> </td>
                        </tr>
                        <tr class="keyTr">
                           <td class="keyTd"  style="font-size: 14px;"><b > 전화번호 : </b></td>
                           <td class="keyTd" style="font-size: 14px;"> <%=userDto.getPhoneNumber() %> </td>
                        </tr>
                        <tr class="keyTr">
                           <td class="keyTd"  style="font-size: 14px;"><b > 성별 : </b></td>
                           <td class="keyTd" style="font-size: 14px;"> <%=userDto.getGender() %></td>
                        </tr>
                        <tr class="keyTr">
                           <td class="keyTd"  style="font-size: 14px;" colspan="2"><b > 거주지 : </b></td>
                        
                        </tr>
                        <tr>
                            <td class="keyTd" style="font-size: 14px;" colspan="2"> <%=userDto.getAddress() %></td>
                        </tr>
   
                    </table>

                  </div>
                  <div class="item3">
                       <p style="font-size: 15px;"><b>소개글  </b></p>
                       
                       
                  <%   if (userDto.getIntroduce() == null || userDto.getIntroduce() == "null") {
               %>
                      <textarea rows="9" cols="25" readonly="readonly" placeholder="작성된 소개글이 없습니다."></textarea>
               <%
                  } else {
               %>

            <textarea rows="9" cols="25" readonly="readonly" ><%=userDto.getIntroduce() %></textarea>
               <%
                  }
               %>
                       

                  </div>
           </div>
            </div>
      
      
         <%
            }
            
         
         %>
      
            
            
            <div class="row3 rows">
                   <p  style="padding-top: 10px;" >
                  <b class="title" style="font-size: 13pt; color: #FFC561; text-decoration:underline;">상세 예약 내역</b>
               </p>
               <p style="font-size: 14px;">
               <b>
               
               
                  <%
                  if (dto.getAuth() == 3 || dto.getAuth() == 9) { //일반회원의 경우
               %>
                       예약신청일:<% if(dto.getCustomerRequestDate()==null||dto.getCustomerRequestDate()=="null"){%>
                     없음
                     <% 
                     }else{ 
                     %>
                          <%=dto.getCustomerRequestDate() %>            
                     <% }%>
                 
                 
                 
               <%
                  } else if (dto.getAuth() == 4 || dto.getAuth() == 5 || dto.getAuth() == 6 || dto.getAuth() == 8) { //시터의 경우
                    %>
               
                     예약신청일:<% if(dto.getRequestReceiveDate()==null||dto.getRequestReceiveDate()=="null"){%>
                     없음
                     <% 
                     }else{ 
                     %>
                          <%=dto.getRequestReceiveDate() %>            
                     <% }%>
               
               
                    <%
                  }
               %>
                           
               
               
               
      
                  <%
                  if (dto.getAuth() == 3 || dto.getAuth() == 9) { //일반회원의 경우
               %>         
               
               
               &nbsp;&nbsp;&nbsp;&nbsp;
               
               시작일 : 
               <% if(sitterDto.getStartWorkDate()==null||sitterDto.getStartWorkDate()=="null"){%>
               없음
               <% 
               }else{ 
            	   String startDate = sitterDto.getStartWorkDate().split(" ")[0];
            	   System.out.println(startDate);
               %>
                    <%-- <%=sitterDto.getStartWorkDate() %> --%>
                    <%=startDate %>            
               <% }%>
               ~ 마감일 : 
               <% if(sitterDto.getEndWorkDate()==null||sitterDto.getEndWorkDate()=="null"){%>
               없음
               <% 
               }else{
            	   String endDate = sitterDto.getEndWorkDate().split(" ")[0];
            	   System.out.println(endDate);
               %>
                    <%-- <%=sitterDto.getEndWorkDate() %> --%>    
                    <%=endDate %>        
               <% }%> &nbsp;&nbsp;&nbsp;&nbsp;
               총시간 :
               <% if(sitterDto.getWorkingHour()==null||sitterDto.getWorkingHour()=="null"){%>
               없음
               <% 
               }else{ 
               %>
                    <%=sitterDto.getWorkingHour() %>            
               <% }%> &nbsp;&nbsp;&nbsp;&nbsp;
               
               
               
               
            <%
                  } else if (dto.getAuth() == 4 || dto.getAuth() == 5 || dto.getAuth() == 6 || dto.getAuth() == 8) { //시터의 경우
                    %>
               
               
            &nbsp;&nbsp;&nbsp;&nbsp;
               
               시작일 : 
               <% if(dto.getStartWorkDate()==null||dto.getStartWorkDate()=="null"){%>
               없음
               <% 
               }else{ 
               %>
                    <%=dto.getStartWorkDate() %>            
               <% }%>
               ~ 마감일 : 
               <% if(dto.getEndWorkDate()==null||dto.getEndWorkDate()=="null"){%>
               없음
               <% 
               }else{ 
               %>
                    <%=dto.getEndWorkDate() %>            
               <% }%> &nbsp;&nbsp;&nbsp;&nbsp;
               총시간 :
               <% if(dto.getWorkingHour()==null||dto.getWorkingHour()=="null"){%>
               없음
               <% 
               }else{ 
               %>
                    <%=dto.getWorkingHour() %>            
               <% }%> &nbsp;&nbsp;&nbsp;&nbsp;
               
               
               
                     <%
                  } 
                    %>
               
               
               </b>
               
               
               <%-- 시작일 :<%=dto.getStartWorkDate() %> ~ 마감일 :<%=dto.getEndWorkDate() %> &nbsp;&nbsp;&nbsp;&nbsp;
               총시간 : <%=dto.getWorkingHour() %>&nbsp;&nbsp;&nbsp;&nbsp;TotalPoint:</b> --%>
               </p>
               
            </div> 

         <%
      }
            %>


       </div>
 

   </div>
</div>

<!--// container -->


<%@ include file="./include/footer.jsp"%>