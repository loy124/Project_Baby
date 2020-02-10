package admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.BabyMemberDao;
import main.BabyMemberDto;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet{

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
	    
	    if(type.equals("moveAdmin")) {
	    	BabyMemberDao babyMemberDao = BabyMemberDao.getInstance();
	    	List<BabyMemberDto> list = babyMemberDao.getMemberList();
	    	for(int i = 0; i < list.size(); i++) {
	    		System.out.println("list="+ list.get(i).toString());
	    	}
	    	req.setAttribute("memberList", list);
	    	forward("admin.jsp", req, resp);
	    }
	}
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
	    RequestDispatcher dispatch = req.getRequestDispatcher(link);
	    dispatch.forward(req, resp);
	}
}
