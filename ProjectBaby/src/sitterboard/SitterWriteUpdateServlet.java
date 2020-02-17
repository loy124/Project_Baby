package sitterboard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/writeUpdate")
public class SitterWriteUpdateServlet extends HttpServlet {

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
	    
	    
	    if(type.equals("sitterBoardUpdate")) {
			
				SitterBoardDao dao = SitterBoardDao.getInstance();
				SitterBoardDto dto = dao.getSitterBoard(seq);
				
				req.setAttribute("sitterBoardUpdate", dto);
				forward("sitterBoardUpdate.jsp",req,resp);
			
			
		}

	}
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
	    RequestDispatcher dispatch = req.getRequestDispatcher(link);
	    dispatch.forward(req, resp);
	}
}
