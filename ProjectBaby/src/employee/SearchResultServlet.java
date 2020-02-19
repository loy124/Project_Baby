package employee;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.BabyMemberDao;
import main.BabyMemberDto;

@WebServlet("/searchResult")
public class SearchResultServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		 * this.processFunc(req, resp);
		 */
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/* this.processFunc(req, resp); */
		resp.setContentType("text/html;charset=UTF-8");
		String json = searchResult(req, resp);
		System.out.println("============================\n" + json + "\n========================================\n");

		req.setAttribute("json", json);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/ajax/ajaxResultPage.jsp");
		System.out.println("asdf");

		dispatcher.forward(req, resp);

	}

	//검색
	public String searchResult (HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println(req.getParameter("address"));

		String address = req.getParameter("address");
		String gender = req.getParameter("gender");
		String career = req.getParameter("career");
		System.out.println("hi123");

		System.out.println(gender);
		System.out.println(address);
		System.out.println(career);

		BabyMemberDao dao = BabyMemberDao.getInstance();
		System.out.println("hi12344444");



		//주소, 경력, 성별 list에 넣어주기
		ArrayList<BabyMemberDto> searchList = dao.getSearchList(address, career, gender);
		System.out.println("=============================================================");
		for(int i = 0 ; i < searchList.size() ; i++) {
			System.out.println(searchList.get(i));
		}
		System.out.println("=============================================================");

		String json = createJson(searchList);

		return json;


	}


	public String createJson(ArrayList<BabyMemberDto> searchList) {
		String json = "";

		json += "[";

		for(int i = 0 ; i < searchList.size() ; i++) {
			json += "{";
			
			json += "\"id\":";
			json += "\"" + searchList.get(i).getId() + "\",";
			
			json += "\"name\":";
			json += "\"" + searchList.get(i).getName() + "\",";

			json += "\"age\":";
			json += "\"" + searchList.get(i).getAge() + "\",";

			json += "\"gender\":";
			json += "\"" + searchList.get(i).getGender() + "\",";

			json += "\"money\":";
			json += "\"" + searchList.get(i).getMoney() + "\",";

			json += "\"phone_number\":";
			json += "\"" + searchList.get(i).getPhoneNumber() + "\",";

			json += "\"customer_request_date\":";
			json += "\"" + searchList.get(i).getCustomerRequestDate() + "\",";

			json += "\"license\":";
			json += "\"" + searchList.get(i).getLicense() + "\",";

			json += "\"wantPay\":";
			json += "\"" + searchList.get(i).getWantPay() + "\",";

			json += "\"career\":";
			json += "\"" + searchList.get(i).getCareer() + "\",";

			json += "\"hireDate\":";
			json += "\"" + searchList.get(i).getHireDate() + "\",";

			json += "\"expireDate\":";
			json += "\"" + searchList.get(i).getExpireDate() + "\",";

			json += "\"profilePhoto\":";
			json += "\"" + searchList.get(i).getProfilePhoto() + "\",";

			json += "\"startWorkDate\":";
			json += "\"" + searchList.get(i).getStartWorkDate() + "\",";

			json += "\"endWorkDate\":";
			json += "\"" + searchList.get(i).getEndWorkDate() + "\",";

			json += "\"wantDate\":";
			json += "\"" + searchList.get(i).getWantDate() + "\",";

			json += "\"wantLocal\":";
			json += "\"" + searchList.get(i).getWantLocal() + "\",";

			json += "\"wantTime\":";
			json += "\"" + searchList.get(i).getWantTime() + "\",";

			json += "\"sitterId\":";
			json += "\"" + searchList.get(i).getSitterId() + "\",";
			
			json += "\"img\":";
			json += "\"" + searchList.get(i).getRealFileName() + "\",";

			json += "\"sitterRequestRecieveDate\":";
			json += "\"" + searchList.get(i).getRequestReceiveDate() + "\"";
			/*
			 NAME, " + "AGE, " + "GENDER," + " MONEY," + " PHONE_NUMBER,"
						+ " CUSTOMER_REQUEST_DATE,"
						+ " REGISTER_DATE, " + "LICENSE," + " WANT_PAY, " + "CAREER," + " HIRE_DATE,"
						+ " EXPIRE_DATE," + " PROFILE_PHOTO, " + " START_WORK_DATE," + " END_WORK_DATE, "
						+ " WANT_DATE, " + " WANT_LOCAL, " + " WANT_TIME, " + "SITTER_ID, SITTER_REQUEST_RECIEVE_DATE
			 */

			if(i == (searchList.size())-1) {
				json += "}";
				break;
			}

			json += "},";
		}

		json += "]";

		return json;
	}
}
