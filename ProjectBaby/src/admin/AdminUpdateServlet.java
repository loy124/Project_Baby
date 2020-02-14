package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.BabyMemberDao;
import main.BabyMemberDto;

@WebServlet("/adminUpdate")
public class AdminUpdateServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		processFunc(req, resp);
	}

	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String type = req.getParameter("type");
		if (type.equals("moveUpdate")) {
			String id = req.getParameter("id");
			BabyMemberDao babyMemberDao = BabyMemberDao.getInstance();
			BabyMemberDto dto = babyMemberDao.getDetail(id);
			req.setAttribute("dto", dto);
			forward("adminUpdate.jsp", req, resp);
		} else if (type.equals("updateAf")) {
			String id = req.getParameter("id");
			String roadAddress = req.getParameter("roadAddress");
			String detailAddress = req.getParameter("detailAddress");
			String address = roadAddress + "/" + detailAddress;
			String phoneNumber = req.getParameter("phoneNumber");
			String bankAccount = req.getParameter("bankAccount");
			int auth = Integer.parseInt(req.getParameter("auth"));
			if (auth == 4 || auth == 5 || auth == 6) {
				String license = req.getParameter("license");
				String wantPay = req.getParameter("wantPay");
				String career = req.getParameter("career");
				String introduce = req.getParameter("introduce");
				String date = req.getParameter("wantDate");
				String[] wantDate = null;
				if(date != null) {
					wantDate = date.split(",");
				}
				String wantLocal = req.getParameter("wantLocal");
				// String wantLocal

				String wantTime = req.getParameter("wantTime");
				BabyMemberDao babyMemberDao = BabyMemberDao.getInstance();
				BabyMemberDto dto = new BabyMemberDto(id, address, phoneNumber, bankAccount, auth, license, wantPay,
						career, introduce, wantDate, wantLocal, wantTime);
				boolean isS = babyMemberDao.sitterAdminUpdate(dto);
				resp.sendRedirect("process.jsp?type=adminUpdate&isS="+isS);
				// sendRedirect 보내기
			} else {
				BabyMemberDao babyMemberDao = BabyMemberDao.getInstance();
				BabyMemberDto dto = new BabyMemberDto(id, address, phoneNumber, bankAccount, auth);
				boolean isS = babyMemberDao.memberAdminUpdate(dto);
				resp.sendRedirect("process.jsp?type=adminUpdate&isS="+isS);
				// 생성자 새로 만들기
			}
		}

	}

	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}

}
