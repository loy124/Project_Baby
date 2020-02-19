package employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import main.BabyMemberDto;

public class EmployeeDao {
	private static EmployeeDao babyMemberDao = new EmployeeDao();

	private EmployeeDao() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/*
	 * "ID, PASSWORD, NAME, AGE, GENDER, ADDRESS, MONEY," + " PHONE_NUMBER," +
	 * " BANK_ACCOUNT, BANK_ACCOUNT_MONEY, AUTH, POINT, " +
	 * " CUSTOMER_REQUEST_DATE, REGISTER_DATE, UN_REGISTER_DATE, " +
	 * " LICENSE, WANT_PAY, CAREER, HIRE_DATE, EXPIRE_DATE, PROFILE_PHOTO, " + "
	 * INTRODUCE, START_WORK_DATE, END_WORK_DATE, WANT_DATE, WANT_LOCAL, WANT_TIME
	 */

	/*
	 * String sql =
	 * "SELECT ID, PASSWORD, NAME, AGE, GENDER, ADDRESS, MONEY, PHONE_NUMBER," +
	 * " BANK_ACCOUNT, BANK_ACCOUNT_MONEY, AUTH, POINT," +
	 * " CUSTOMER_REQUEST, REGISTER_DATE, UN_REGISTER_DATE FROM BABY_MEMBER ";
	 */

	public static EmployeeDao getInstance() {

		return babyMemberDao;
	}


	//시터 검색하기 (원하는 지역, 원하는 요일, 원하는 시간, 성별, 자격, 경력 )
	public BabyMemberDto getSelectDetail(String choice){
		String sql = " SELECT WANT_LOCAL, WANT_DATE, WANT_TIME, GENDER, LICENSE, CAREER "
				   + " FROM BABY_MEMBER "
				   + " WHERE AUTH=4 ";


		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		BabyMemberDto babyMemberDto = null;
		String wantdate[] = null;


		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getSelectDetail success");

			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getSelectDetail success");

			rs = psmt.executeQuery();
			System.out.println("3/6 getSelectDetail success");

			while(rs.next()) {
				int i = 1;
				String arr = rs.getString(4);
				if(arr != null) { // wantDate가 null이 아닐 때
					System.out.println("arr" + arr);
					wantdate = arr.split(",");
				}
//				String wantdate[] = rs.getString(4).split(",");
				//BabyMemberDto dto = new BabyMemberDto(gender, license, career, wantDate, wantLocal, wantTime)
				System.out.print(i);
				BabyMemberDto dto = new BabyMemberDto(rs.getString(i++), //gender
													  rs.getString(i++), //license
													  rs.getString(i++), //career
													  wantdate, //wantDate
													  rs.getString(i++), //wantLocal
													  rs.getString(i++) //wantTime
													  );
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}

		return babyMemberDto;
	}



	//시터 리스트 뿌리기(이름, 나이, 성별, 폰번호, 자격, 원하는 시급, 경력, 고용날짜, 이력서 사진, 소개, 원하는 지역)
	public List<BabyMemberDto> getSitterList(int auth){

		String sql = " SELECT NAME, AGE, GENDER, PHONE_NUMBER, "
				+ " LICENSE, WANT_PAY, CAREER, HIRE_DATE, PROFILE_PHOTO, INTRODUCE, WANT_LOCAL "
				+ " FROM BABY_MEMBER"
				+ " WHERE AUTH=4 ";

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<BabyMemberDto> sitterList = new ArrayList<BabyMemberDto>();


		try {
			conn = DBConnection.getConnection();
			System.out.println(" 1/6 getSitterList success");

			psmt = conn.prepareStatement(sql);
			System.out.println(" 2/6 getSitterList success");
			rs = psmt.executeQuery();
			System.out.println(" 3/6 getSitterList success");

			while (rs.next()) {
				int i = 1;
				BabyMemberDto dto = new BabyMemberDto(rs.getString(i++),
								rs.getInt(i++),  //이름
								rs.getString(i++),
								rs.getString(i++),
								rs.getString(i++),
								rs.getString(i++),
								rs.getString(i++),
								rs.getString(i++),
								rs.getString(i++),
								rs.getString(i++),
								rs.getString(i++));

				sitterList.add(dto);
				System.out.println("dto : " + dto.getId());

			}
			System.out.println(" 4/6 getSitterList success");

		} catch (SQLException e) {
			System.out.println("fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return sitterList;

	}
	
	
	public boolean updateHire(String userId, BabyMemberDto babySitterDto) {
		
		String sql1 = " UPDATE BABY_MEMBER SET SITTER_ID = ?, CUSTOMER_REQUEST_DATE = SYSDATE WHERE ID = ?" ;

		String sql2 = " UPDATE BABY_MEMBER SET USER_ID = ?, SITTER_REQUEST_RECIEVE_DATE = SYSDATE, START_WORK_DATE = ? ,"
				+ " END_WORK_DATE = ?, WORKING_HOUR = ?, AUTH = 8 WHERE ID = ?";

		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(sql1);
			psmt.setString(1, babySitterDto.getId());
			psmt.setString(2, userId);
			count = psmt.executeUpdate();
			psmt.clearParameters();
			
			// 커미션에 돈 넣기
			psmt = conn.prepareStatement(sql2);
			
			psmt.setString(1, userId);
			psmt.setString(2, babySitterDto.getStartWorkDate());
			psmt.setString(3, babySitterDto.getEndWorkDate());
			psmt.setString(4, babySitterDto.getWorkingHour());
			psmt.setString(5, babySitterDto.getId());
			
			count = psmt.executeUpdate();
			
			conn.commit();
			
		} catch (SQLException e) {
			System.out.println("fail");
			
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			DBClose.close(psmt, conn, null);
		}
		return count > 0 ? true : false;
	}



}
