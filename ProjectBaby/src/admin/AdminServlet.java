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
			/*
			 * for(int i = 0; i < list.size(); i++) { System.out.println("list="+
			 * list.get(i).toString()); }
			 */
	    	int memberCount = 0;
	    	System.out.println("memberCount = " + memberCount);
	    	String address = "";
	    	String wantD[] = null;
	    	address = req.getParameter("address");
	    	wantD = req.getParameterValues("wantDate");
	    	String wantDate = "";
	    	if(wantD != null) {
	    		for(int i = 0; i < wantD.length; i++) {
		    		if(i!= 0) {
		    			wantDate = wantDate.trim() +"," +wantD[i].trim();
		    		} else {
		    			wantDate = wantD[0];
		    		}
		    	}
	    	}
	    	String pageNumber = req.getParameter("pageNumber");
	    	System.out.println("페이지 남바:" + pageNumber);
	    	int page = -1;
	    	
	    	if(pageNumber != null) {
	    		page = Integer.parseInt(pageNumber);
	    	}else {
	    		page = 0;
	    	}
	    	System.out.println("페이지 남바:" + page);
			/*
			 * // List<BabyMemberDto> list = babyMemberDao.getMemberList();
			 */

	    	memberCount = babyMemberDao.getAllMember(address, wantDate, "");
	    	
	    	
	    	List<BabyMemberDto> list = babyMemberDao.getMemberPagingList(address, wantDate, "", page);
	    	
	    	req.setAttribute("address", address);
	    	req.setAttribute("wantDate", wantDate);
	    	req.setAttribute("memberList", list);
	    	req.setAttribute("memberCount", memberCount);
	    	forward("admin.jsp", req, resp);
	    }else if (type.equals("searchMember")) {
	    	String address = req.getParameter("address").trim();;
	    	String wantD[] = req.getParameterValues("wantDate");
	    	String wantDate = "";
	    	
	    	if(wantD != null) {
	    		for(int i = 0; i < wantD.length; i++) {
		    		if(i!= 0) {
		    			wantDate = wantDate.trim() +"," +wantD[i].trim();
		    		} else {
		    			wantDate = wantD[0];
		    		}
		    	}
	    	}
	    	System.out.println("wantDate =" + wantDate);
	    	String pageNumber = req.getParameter("pageNumber");
	    	int page =  0;
	    	int memberCount = 0;
	    	System.out.println("pageNumber" + pageNumber);
	    	
			/* 상세검색시 사용 String wantTime = req.getParameter("wantTime"); */
	    	BabyMemberDao babyMemberDao = BabyMemberDao.getInstance();
	    	memberCount = babyMemberDao.getAllMember(address, wantDate, "");
	    	System.out.println("memberCount = " + memberCount);
			/* List<BabyMemberDto> list = babyMemberDao.getMemberList(); */

	    	if(pageNumber != null) {
	    		page = Integer.parseInt(pageNumber);
	    	}else {
	    		page = 0;
	    	}
	    	List<BabyMemberDto> list = babyMemberDao.getMemberPagingList(address, wantDate, "", page );
	
	    	req.setAttribute("address", address);
	    	req.setAttribute("wantDate", wantDate);
	    	req.setAttribute("memberList", list);
	    	req.setAttribute("memberCount", memberCount);
	    	forward("admin.jsp", req, resp);
	    	//페이징 Dao 짜기및 페이지 표시하기
	    }else if (type.equals("page")) {
	    	String pageNumber = req.getParameter("pageNumber");
	    	int page =  0;
	    	int memberCount = 0;
	    	if(pageNumber != null) {
	    		page = Integer.parseInt(pageNumber);
	    	}
	    	String wantDate = req.getParameter("wantDate");
	    	System.out.println("원하는날 =" + wantDate);
	    	System.out.println(pageNumber);
	    	String address = req.getParameter("address");
	    	//페이징 다오 소환및 보내기
	    	BabyMemberDao babyMemberDao = BabyMemberDao.getInstance();
	    	memberCount = babyMemberDao.getAllMember(address, wantDate, "");
	    	List<BabyMemberDto> list = babyMemberDao.getMemberPagingList(address, wantDate, "", page);
	    	req.setAttribute("address", address);
	    	req.setAttribute("wantDate", wantDate);
	    	req.setAttribute("memberList", list);
	    	req.setAttribute("memberCount", memberCount);
	    	forward("admin.jsp", req, resp);
	    }
	}
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
	    RequestDispatcher dispatch = req.getRequestDispatcher(link);
	    dispatch.forward(req, resp);
	}
}
