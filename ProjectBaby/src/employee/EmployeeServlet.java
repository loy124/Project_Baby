package employee;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import main.BabyMemberDao;
import main.BabyMemberDto;

@WebServlet("/employee")
public class EmployeeServlet extends HttpServlet {

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
		System.out.println("type");
		BabyMemberDao babyMemberDao = BabyMemberDao.getInstance();
		
		 List<BabyMemberDto> list = (List<BabyMemberDto>) babyMemberDao.getSitterList();
		 resp.setContentType("application/json");
			resp.setCharacterEncoding("utf-8");
			String gson = new Gson().toJson(list);
			resp.getWriter().write(gson);
		/* PrintWriter out = */
		/* String choice = req.getParameter("choice"); */

		/*
		 * req.setAttribute("SitterName", list); forward("employee.jsp", req, resp);
		 */
//		if(choice.equals("select"))
//			EmployeeDao dao = EmployeeDao.getInstance();
		/*
		 * List<BabyMemberDto> empList = dao.getSitterList();
		 * req.setAttribute("empList", empList);
		 */

//		forward("NewFile.jsp", req, resp);

	}



	public void forward(String link, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { RequestDispatcher dispatch =
	req.getRequestDispatcher(link); dispatch.forward(req, resp); }


}
