package sitterboard;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/adminSearchSitterBoard")
public class AdminSitterBoardSearchPagingServlet extends HttpServlet {

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
	    	String searchWord = req.getParameter("searchWord");
	    	String choice = req.getParameter("choice");
	    	
			
		  String spageNumber = req.getParameter("pageNumber"); 
		  
		  int pageNumber = 0; // 페이지넘버
		  
		  int allCount = 0; // 전체 글 
		 
	    	
	    	if(choice == null || choice.equals("")) {
	    		choice = "sel";
	    	}
	    	
	    	if(choice.equals("sel")) {
	    		searchWord = "";
	    	}
	    	if(searchWord == null) {
	    		searchWord = "";
	    		choice = "sel";
	    	}
	    	
			if(spageNumber != null && !spageNumber.equals("")) { 
				 pageNumber =  Integer.parseInt(spageNumber); 
			 }else {
				 pageNumber = 0;
			 }
			
			SitterBoardDao dao = SitterBoardDao.getInstance();
			allCount = dao.getAllSitterBoard(choice, searchWord);
			
			List<SitterBoardDto> list = dao.getSitterBoardPagingList(choice, searchWord, pageNumber);
			
			
			req.setAttribute("choice", choice);
			req.setAttribute("searchWord", searchWord);
			req.setAttribute("pageNumber", pageNumber);
			req.setAttribute("searchList", list);
			
			//페이지 최대값
			int boardPage = allCount /10; 
			if(allCount % 10 > 0) {
				boardPage = boardPage + 1;
			}
			
			req.setAttribute("boardPage", boardPage);
			
			
			
			System.out.println("페이지수 : " + boardPage);
			System.out.println("페이지넘버 : " + pageNumber);
			System.out.println("boardPage : " + boardPage);
			System.out.println("spageNumber : " + spageNumber);
			
			
			//req.setAttribute("allCount", allCount);
			
			forward("adminSitterBoard.jsp", req, resp);
	
	}

	
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
	    RequestDispatcher dispatch = req.getRequestDispatcher(link);
	    dispatch.forward(req, resp);
	}
}























