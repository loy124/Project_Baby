package sitterboard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sitterDetail")
public class SitterBoardDetailServlet extends HttpServlet {

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
		String sseq = req.getParameter("seq");
		String id = req.getParameter("id");
		String wid = req.getParameter("wid");
		String sauth = req.getParameter("auth");
		System.out.println("디테일서블릿 변환전 어스 :" + sauth);
		int auth = Integer.parseInt(sauth);
		int seq = Integer.parseInt(sseq);
		System.out.println("서블릿 변환전 시퀀스: " + sseq);
		System.out.println("서블릿 변환 후 시퀀스: " + seq);
		String type = req.getParameter("type");
		
		if(type.equals("detail")) {
			if(id.equals(wid) || auth == 1) {
				SitterBoardDao dao = SitterBoardDao.getInstance();
				dao.readCount(seq);
				
				SitterBoardDto dto = dao.getSitterBoard(seq);
				SitterBoardCommentDto sitterBoardCommentDto = dao.getComment(seq);
				req.setAttribute("sitterBoardCommentDto", sitterBoardCommentDto);
				req.setAttribute("detailDto", dto);
				
				
				forward("sitterBoardDetail.jsp",req,resp);
			
			}else {
				
				 resp.setContentType("text/html; charset=utf-8"); PrintWriter out =
				 resp.getWriter(); 
				 out.println("<script>");
				 out.println("alert('관리자 권한입니다.');"); 
				 out.println("location.href = 'searchSitterBoard';"); 
				//out.println("location.href = 'sitterDetail?seq=" + seq + "'&type=detail&filename=null'");
				 out.println("</script>");
				 //out.close();
				 out.flush();

				 return;
				
				//forward("searchSitterBoard", req, resp);
				
				//resp.sendRedirect("context.getServletContext().getContextPath()+\"/login");
				//return;
			}
			
			
		}else if(type.equals("sitterBoardUpdate")) {
			
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
