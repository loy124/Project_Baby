package mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.BabyMemberDao;
import main.BabyMemberDto;

@WebServlet("/kakao")
public class kakaoServletO extends HttpServlet{

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
	    String money = req.getParameter("money");
	    String id = req.getParameter("id");
	    PointDao pointDao = PointDao.getInstance();
	    
	    if(type.equals("payAfter")) {
	    	if(id != null && money != null) {
	    	boolean isS = pointDao.payMoney(id, Integer.parseInt(money));
	    	resp.sendRedirect("process.jsp?type=kakao&isS=" + isS);
	    	}
	    }else if (type.equals("moveMypagePoint")) {
	    	HttpSession session = req.getSession();
	    	BabyMemberDto babyMember = (BabyMemberDto)session.getAttribute("login");
	    	BabyMemberDao babyMemberDao = BabyMemberDao.getInstance();
	    	BabyMemberDto babyMemberDto = babyMemberDao.getDetail(babyMember.getId());
			session.setAttribute("login", babyMemberDto);
	    	resp.sendRedirect("mypage_point.jsp");
	    }
	}
	public void forward(String link, HttpServletRequest req, HttpServletResponse resp)
	        throws ServletException, IOException {
	    RequestDispatcher dispatch = req.getRequestDispatcher(link);
	    dispatch.forward(req, resp);
	}

}
