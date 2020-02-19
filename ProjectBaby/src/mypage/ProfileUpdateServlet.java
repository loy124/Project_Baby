package mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.BabyMemberDao;
import main.BabyMemberDto;

@WebServlet("/ProfileUpdateServlet")
public class ProfileUpdateServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");

		String id = req.getParameter("id");
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		String phoneNumber = req.getParameter("phoneNumber");

		// 주소 받아오기
		String roadAddress = req.getParameter("roadAddress");
		String detailAddress = req.getParameter("detailAddress");
		String address = roadAddress;

		if (detailAddress != null && detailAddress != "null" && detailAddress != "") {
			address = roadAddress + " / " + detailAddress; // 도로명주소 + 상세주소(동, 호수) 합치기
		}

		String wantPay = req.getParameter("wantPay");
		String career = req.getParameter("career");
		String wantDate[] = req.getParameterValues("wantDate");
		String wantLocal = req.getParameter("wantLocal");
		String wantTime = req.getParameter("wantTime");
		String account = req.getParameter("account");
		String introduce = req.getParameter("introduce");
//		System.out.println(id);
//		System.out.println(password);
//		System.out.println(name);
//		System.out.println(phoneNumber);
//		System.out.println(roadAddress);
//		System.out.println(wantPay);
//		System.out.println(career);
//		System.out.println(wantTime);
//		System.out.println(account);
//		System.out.println(introduce);

		BabyMemberDto dto = new BabyMemberDto();
		dto.setId(id);
		dto.setPassword(password);
		dto.setName(name);
		dto.setPhoneNumber(phoneNumber);
		dto.setAddress(address);
		dto.setWantPay(wantPay);
		dto.setCareer(career);
		dto.setWantDate(wantDate);
		dto.setWantLocal(wantLocal);
		dto.setWantTime(wantTime);
		dto.setBankAccount(account);
		dto.setIntroduce(introduce);
		
		System.out.println(dto.toString());

		BabyMemberDao dao = BabyMemberDao.getInstance();

		int count = dao.profileUpdateDao(dto);

		if (count > 0) { // 성공할 시
			secondFunc(req, resp);

		} else { // 실패할 시
			System.out.println("프로필 업데이트가 실패하였습니다.");
			resp.sendRedirect("mypage_profile.jsp");
		}
		processFunc(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

	public void secondFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		BabyMemberDto babyMember = (BabyMemberDto) session.getAttribute("login");
		BabyMemberDao babyMemberDao = BabyMemberDao.getInstance();
		BabyMemberDto babyMemberDto = babyMemberDao.getDetail(babyMember.getId());
		session.setAttribute("login", babyMemberDto);

		System.out.println("프로필 업데이트를 성공하였습니다.");
		resp.sendRedirect("mypage_profile.jsp");

	}
}
