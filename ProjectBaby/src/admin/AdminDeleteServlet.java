package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.BabyMemberDao;

@WebServlet("/adminDelete")
public class AdminDeleteServlet extends HttpServlet{

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
	    String id = req.getParameter("id");
	    if(type.equals("deleteAf")) {
	    	BabyMemberDao babyMemberDao = BabyMemberDao.getInstance();
	    	boolean isS = babyMemberDao.deleteMember(id);
	    	resp.sendRedirect("process.jsp?type=deleteMember&isS="+ isS);
	    }
	    

	}
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
	    RequestDispatcher dispatch = req.getRequestDispatcher(link);
	    dispatch.forward(req, resp);
	}
}
