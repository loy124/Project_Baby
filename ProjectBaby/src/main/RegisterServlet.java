package main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		processFunc(req, resp);
	}

	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String type = req.getParameter("type");
		if (type.equals("moveRegister")) {
			resp.sendRedirect("registerSelect.jsp");
		} else if (type.equals("moveRegisterMember")) {
			resp.sendRedirect("registerMember.jsp");
		} else if (type.equals("moveRegisterSitter")) {
			resp.sendRedirect("registerSitter.jsp");
		} else if (type.equals("idCheck")) {
			String id = req.getParameter("id");
			System.out.println(id);
			PrintWriter out = resp.getWriter();
			BabyMemberDao babyMemberDao = BabyMemberDao.getInstance();
			boolean isS = babyMemberDao.getId(id);
			out.println(isS);
		}
		
		else {
			req.setCharacterEncoding("utf-8");
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			String name = req.getParameter("name");
			int age = Integer.parseInt(req.getParameter("age"));
			String gender = req.getParameter("gender");
			String numberFirst = req.getParameter("numberFirst");
			String numberSecond = req.getParameter("numberSecond");
			String numberThird = req.getParameter("numberThird");
			String phoneNumber = numberFirst + "-" + numberSecond + "-" + numberThird;
			// 주소 받아오기
			String roadAddress = req.getParameter("roadAddress");
			String detailAddress = req.getParameter("detailAddress");

			// 도로명주소 + 상세주소(동, 호수) 합치기
			String address = roadAddress + " / " + detailAddress;

			BabyMemberDao babyMemberDao = BabyMemberDao.getInstance();
			if (type.equals("registerMemberAf")) {

				BabyMemberDto babyMemberDto = new BabyMemberDto(id, password, name, age, gender, address, phoneNumber);
				System.out.println(babyMemberDto.toString());
				boolean isS = babyMemberDao.registerMember(babyMemberDto);
				System.out.println(isS);
				 resp.sendRedirect("process.jsp?type=register&isS="+isS);
			} else if (type.equals("registerSitterAf")) {
				req.setCharacterEncoding("utf-8");
				String wantPay = req.getParameter("wantPay");
				String career = req.getParameter("career");
				String wantDate[] = req.getParameterValues("wantDate");
				String wantLocal = req.getParameter("wantLocal");
				String wantTime = req.getParameter("wantTime");
				String introduce = req.getParameter("introduce");
			
				BabyMemberDto sitterDto = new BabyMemberDto(id, password, name, age, gender, address, phoneNumber, wantPay, career, introduce, wantDate, wantLocal, wantTime);
				boolean isS = babyMemberDao.registerSitter(sitterDto);
				System.out.println(isS);
				resp.sendRedirect("process.jsp?type=register&isS="+isS);
				/*
				 * SitterMemberDto dto = new SitterMemberDto(id, password, name, age, gender,
				 * address, phoneNumber, wantPay, career, introduce, wantDate, wantLocal,
				 * wantTime); System.out.println(dto.toString());
				 */
			}
		}
	}
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}

}
