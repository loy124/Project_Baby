package sitterboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/comment")
public class SitterBoardCommentServlet extends HttpServlet {

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
		String sauth = req.getParameter("auth");
		int auth = Integer.parseInt(sauth);
		System.out.println("변환전 시퀀스 : " + sseq);
		int seq = 0;
		if (sseq != null) {
			seq = Integer.parseInt(sseq);
		}
		System.out.println("댓글시퀀스: " + seq);

		String boardComment = req.getParameter("boardComment");

		if (type.equals("comment")) {
			if(auth == 1) {
				SitterBoardDao dao = SitterBoardDao.getInstance();
				SitterBoardCommentDto sitterBoardCommentDto = new SitterBoardCommentDto(seq, boardComment);
				boolean dto = dao.comment(seq, sitterBoardCommentDto);
				
				
				System.out.println(seq + "시퀀 " + boardComment);
				System.out.println(sitterBoardCommentDto.toString());
				
				SitterBoardDto dto1 = dao.getSitterBoard(seq);
				
				
				req.setAttribute("detailDto", dto1);
				
				req.setAttribute("sitterBoardCommentDto", sitterBoardCommentDto);
				
				forward("sitterBoardDetail.jsp", req, resp);
				//resp.sendRedirect("sitterlist?type=allList");
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
			
		}

	}

	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		RequestDispatcher dispatch = req.getRequestDispatcher(link);
		dispatch.forward(req, resp);
	}

}
