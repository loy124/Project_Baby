package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
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
		if(type.equals("moveLogin")) {
			resp.sendRedirect("login.jsp");
		}else if(type.equals("loginStart")) {
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			System.out.println(id + " " +  password);
			BabyMemberDao babyMemberDao = BabyMemberDao.getInstance();
			BabyMemberDto babyMemberDto = babyMemberDao.login(id, password);
			
			if(babyMemberDto != null) {
				System.out.println("아이디가 있어요");
				HttpSession session = req.getSession();
				session.setAttribute("login", babyMemberDto);
				/* session.setMaxInactiveInterval(30 * 60 * 60); */
				System.out.println(babyMemberDto.toString());
				System.out.println(babyMemberDto.getName());
				String name = URLEncoder.encode(babyMemberDto.getName(), "UTF-8");
				
				resp.sendRedirect("process.jsp?type=login&name="+ name);
			}else {
				resp.sendRedirect("process.jsp?type=login");
			}
			
		}else if (type.equals("moveMain")) {
			resp.sendRedirect("main.jsp");
		}else if(type.equals("logout")) {
			HttpSession session = req.getSession();
			session.invalidate();
			resp.sendRedirect("main.jsp");
		}
		
	}
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}

}