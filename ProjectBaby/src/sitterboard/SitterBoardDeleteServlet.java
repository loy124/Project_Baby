package sitterboard;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/boardDelete")
public class SitterBoardDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.processFunc(req, resp);
	}

	public void processFunc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    req.setCharacterEncoding("utf-8");
	    
	    String type = req.getParameter("type");
	    String sseq = req.getParameter("seq");
	    int seq = Integer.parseInt(sseq);
	    
	    SitterBoardDao dao = SitterBoardDao.getInstance();
	    boolean isS = dao.deleteSitterBoard(seq);
	    
	    System.out.println("딜리트 isS: "  + isS);
	    resp.sendRedirect("process.jsp?type=delete&isS="+isS);
	    
	    
	    
	    
	    
	    

	}
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
	    RequestDispatcher dispatch = req.getRequestDispatcher(link);
	    dispatch.forward(req, resp);
	}
	
}
