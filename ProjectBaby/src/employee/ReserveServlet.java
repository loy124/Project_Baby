package employee;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.BabyMemberDao;
import javax.servlet.http.HttpSession;

import main.BabyMemberDto;
import mypage.PointDao;
import main.BabyMemberDto;

@WebServlet("/reserve")
public class ReserveServlet extends HttpServlet {

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
		String sitterId = req.getParameter("id");
		System.out.println("아이디이이이" + sitterId);
		String sWantPay = req.getParameter("wantPay");
		System.out.println("원 하아아아는 도오오오온" + sWantPay);
		String sStartWorkHour = req.getParameter("startWorkHour");
		String sEndWorkHour = req.getParameter("endWorkHour");
		String wantDate = req.getParameter("wantDate");
		String workingHour = req.getParameter("workingHour");
		int wantPay = 0;
		int startWorkHour = 0;
		int endWorkHour = 0;
		if (sWantPay != null) {
			wantPay = Integer.parseInt(sWantPay);
		} else {
			wantPay = 8600;
		}
		if (sStartWorkHour != null) {
			startWorkHour = Integer.parseInt(sStartWorkHour.split(":")[0]);
		}
		if (sEndWorkHour != null) {
			endWorkHour = Integer.parseInt(sEndWorkHour.split(":")[0]);
		}
		System.out.println("시이이급" + wantPay);
		System.out.println("시이이간" + startWorkHour);
		System.out.println("시이이간" + endWorkHour);
		int payPoint = wantPay * (endWorkHour - startWorkHour);
		HttpSession session = req.getSession();
		BabyMemberDto babyMember = (BabyMemberDto) session.getAttribute("login");
		BabyMemberDao babyMemberDao = BabyMemberDao.getInstance();

		System.out.print(payPoint);
		BabyMemberDto babyMemberDto = new BabyMemberDto();
		babyMemberDto.setStartWorkDate(wantDate);
		babyMemberDto.setEndWorkDate(wantDate);
		babyMemberDto.setWorkingHour((endWorkHour - startWorkHour) + "");
		babyMemberDto.setId(sitterId);

		if (type.equals("payReserve")) {

			req.setAttribute("payPoint", payPoint);
			req.setAttribute("userId", babyMember.getId());
			req.setAttribute("babyMemberDto", babyMemberDto);

			HttpSession session1 = req.getSession();
			BabyMemberDto babyMember1 = (BabyMemberDto) session.getAttribute("login");
			BabyMemberDao babyMemberDao1 = BabyMemberDao.getInstance();
			BabyMemberDto babyMemberDto1 = babyMemberDao1.getDetail(babyMember1.getId());
			session1.setAttribute("login", babyMemberDto1);
			forward("reserveButton.jsp", req, resp);
			/* req.setAttribute("", o); */
			/* employeeDao.updateHire(userId, babySitterDto); */
		} else if (type.equals("payPoint")) {
			PointDao pointDao = PointDao.getInstance();
			EmployeeDao employeeDao = EmployeeDao.getInstance();
			System.out.println("유저 아이디 : " + babyMember.getId());
			System.out.println("시터 아이디 : " + sitterId);
			System.out.println("지불해야 할 돈: " + payPoint);
			System.out.println(babyMemberDto.toString());

			payPoint = Integer.parseInt(req.getParameter("payPoint"));
			boolean isS = pointDao.payPoint(babyMember.getId(), sitterId, payPoint);
			babyMemberDto.setWorkingHour(workingHour);
			System.out.println("결제 :" + isS);
			isS = employeeDao.updateHire(babyMember.getId(), babyMemberDto);
			System.out.println("예약 :" + isS);

			babyMember = (BabyMemberDto) session.getAttribute("login");
			babyMemberDto = babyMemberDao.getDetail(babyMember.getId());
			session.setAttribute("login", babyMemberDto);
			resp.sendRedirect("process.jsp?type=reserve&isS=" + isS);
		}
	}

	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}
}
