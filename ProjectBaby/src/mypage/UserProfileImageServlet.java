package mypage;

import java.io.IOException;

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

		BabyMemberDao dao = BabyMemberDao.getInstance();

		int count = dao.insertImageFile(loginId, fileName, fileRealName);

		if (count > 0) {
			secondFunc(req, resp);
			
		} else {
			System.out.println("파일업로드가 실패였습니다.");
		}
		// dao loginId -> 1명을 찾아서 UPDATE userMember ;
 
		
		
	}
	
	public void secondFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
    	BabyMemberDto babyMember = (BabyMemberDto)session.getAttribute("login");
    	BabyMemberDao babyMemberDao = BabyMemberDao.getInstance();
    	BabyMemberDto babyMemberDto = babyMemberDao.getDetail(babyMember.getId());
		session.setAttribute("login", babyMemberDto);
		
		System.out.println("파일업로드를 성공하였습니다.");
		resp.sendRedirect("mypage_imageUpdate.jsp");


	}
}
