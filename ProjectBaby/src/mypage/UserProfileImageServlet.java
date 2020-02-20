package mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import main.BabyMemberDao;
import main.BabyMemberDto;

@WebServlet("/userProfileImageServlet")
public class UserProfileImageServlet extends HttpServlet {

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      processFunc(req, resp);

   }

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      processFunc(req, resp);
   }

   public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      
      String saveDirectory = req.getSession().getServletContext().getRealPath("upload");
      System.out.println(saveDirectory);
      int maxSize = 1024 * 1024 * 10;
      String encoding = "UTF-8";

   
      
      MultipartRequest multipartReq = new MultipartRequest(req, saveDirectory, maxSize, encoding,
            new DefaultFileRenamePolicy());

      String loginId = multipartReq.getParameter("loginId");
      String fileName = multipartReq.getOriginalFileName("imageFile");
      String fileRealName = multipartReq.getFilesystemName("imageFile");
       if(fileName==null||fileName.equals(null)||fileName.equals("null")||fileName.equals("NULL")||fileName.equals("")) {
         
         BabyMemberDao dao = BabyMemberDao.getInstance();
   
         int count = dao.insertImageFile(loginId, fileName, fileRealName);
   
         if (count > 0) {
            
            
              resp.setContentType("text/html; charset=UTF-8");
                  PrintWriter out = resp.getWriter(); 
                  out.println("<script>alert('이미지 파일이 없음으로 기본이미지로 나옵니다.');location.href='mypage_imageUpdate.jsp';</script>"); 
                  out.flush();
                          
            
            
            
            
            secondFunc(req, resp);
            
         } else {
            System.out.println("이미지 파일을 올려주세요");
         }
          
       }else {
          String ext = fileName.substring(fileName.lastIndexOf(".")+1); //가장 마지막 파일의 확장자 처리
          System.out.println(ext);
          if(ext.equals("jpg")||ext.equals("png")||ext.equals("gif")
                ||ext.equals("JPG")||ext.equals("PNG")||ext.equals("GIF")) {
             
             
             BabyMemberDao dao = BabyMemberDao.getInstance();
             
             int count = dao.insertImageFile(loginId, fileName, fileRealName);
             
             if (count > 0) {
                
               
                secondFunc(req, resp);
             } else {
                System.out.println("파일업로드가 실패였습니다.");
             }
          }else {
             
             resp.setContentType("text/html; charset=UTF-8");
               PrintWriter out = resp.getWriter(); 
               out.println("<script>alert('파일형식이 이미지가 아닙니다.');location.href='mypage_imageUpdate.jsp';</script>"); 
               out.flush();
                       
   
          }
       }
 
   }
   
   public void secondFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      HttpSession session = req.getSession();
       BabyMemberDto babyMember = (BabyMemberDto)session.getAttribute("login");
       BabyMemberDao babyMemberDao = BabyMemberDao.getInstance();
       BabyMemberDto babyMemberDto = babyMemberDao.getDetail(babyMember.getId());
      session.setAttribute("login", babyMemberDto);
            
      resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter(); 
        out.println("<script>alert('프로필 업로드에 성공했습니다.');location.href='mypage_imageUpdate.jsp';</script>"); 
        out.flush();
      
      


   }
}