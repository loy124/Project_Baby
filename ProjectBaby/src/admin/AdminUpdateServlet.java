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
public class AdminUpdateServlet extends HttpServlet{

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
	    String type =req.getParameter("type");
	    if(type.equals("moveUpdate")) {
	    	String id = req.getParameter("id");
	    	BabyMemberDao babyMemberDao = BabyMemberDao.getInstance();
	    	BabyMemberDto dto = babyMemberDao.getDetail(id);
	    	req.setAttribute("dto", dto);
	    	forward("adminUpdate.jsp", req, resp);
	    }

	}
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
	    RequestDispatcher dispatch = req.getRequestDispatcher(link);
	    dispatch.forward(req, resp);
	}
	
}
