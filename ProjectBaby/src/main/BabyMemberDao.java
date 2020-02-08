package main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;

public class BabyMemberDao {
	private static BabyMemberDao babyMemberDao = new BabyMemberDao();

	private BabyMemberDao() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	/*
	 * ID, PASSWORD, NAME, AGE, GENDER, ADDRESS, MONEY," + " PHONE_NUMBER," +
	 * " BANK_ACCOUNT, BANK_ACCOUNT_MONEY, AUTH, POINT, " +
	 * " CUSTOMER_REQUEST_DATE, REGISTER_DATE, UN_REGISTER_DATE," +
	 * "LICENSE, WANT_PAY, CAREER, HIRE_DATE, EXPIRE_DATE, PROFILE_PHOTO, " +
	 * "INTRODUCE, START_WORK_DATE, END_WORK_DATE, WANT_DATE, WANT_LOCAL, WANT_TIME
	 */
	
	
	/*
	 * String sql =
	 * "SELECT ID, PASSWORD, NAME, AGE, GENDER, ADDRESS, MONEY, PHONE_NUMBER," +
	 * " BANK_ACCOUNT, BANK_ACCOUNT_MONEY, AUTH, POINT," +
	 * " CUSTOMER_REQUEST, REGISTER_DATE, UN_REGISTER_DATE FROM BABY_MEMBER ";
	 */
	
	public static BabyMemberDao getInstance() {
		return babyMemberDao;
	}
	
	public boolean getId(String id) {
		String sql = " SELECT ID " + " FROM BABY_MEMBER " + " WHERE ID = ? ";

		Connection conn = null; // DB Connection
		PreparedStatement psmt = null; // SQL
		ResultSet rs = null; // result

		boolean findId = false;

		System.out.println("sql:" + sql);

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();

			if (rs.next()) {
				findId = true; // 데이터가 있을 때
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}

		return findId;
	}
	
	public boolean registerMember(BabyMemberDto dto) {
		String sql = "INSERT INTO BABY_MEMBER (ID, PASSWORD, NAME, AGE, GENDER, ADDRESS, MONEY, PHONE_NUMBER,"
				+ " BANK_ACCOUNT, BANK_ACCOUNT_MONEY, AUTH, POINT, "
				+ " CUSTOMER_REQUEST_DATE, REGISTER_DATE, UN_REGISTER_DATE) "
				+ " VALUES(?, ?, ?, ?, ?, ?, 0, ?, 0, 0, 3, 0, null, SYSDATE, null)";
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			int i = 1;
			psmt.setString(i++, dto.getId());
			psmt.setString(i++, dto.getPassword());
			psmt.setString(i++, dto.getName());
			psmt.setInt(i++, dto.getAge());
			psmt.setString(i++, dto.getGender());
			psmt.setString(i++, dto.getAddress());
			psmt.setString(i++, dto.getPhoneNumber());
			count = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return count > 0 ? true : false;
	}
	
	
	
	public boolean registerSitter(BabyMemberDto dto) {
	      String sql = "INSERT INTO BABY_MEMBER (ID, PASSWORD, NAME, AGE, GENDER, ADDRESS, MONEY,"
	      		+ " PHONE_NUMBER,"
	            + " BANK_ACCOUNT, BANK_ACCOUNT_MONEY, AUTH, POINT, "
	            + " CUSTOMER_REQUEST_DATE, REGISTER_DATE, UN_REGISTER_DATE,"
	            + "LICENSE, WANT_PAY, CAREER, HIRE_DATE, EXPIRE_DATE, PROFILE_PHOTO, "
	            + "INTRODUCE, START_WORK_DATE, END_WORK_DATE, WANT_DATE, WANT_LOCAL, WANT_TIME ) "
	            + " VALUES(?, ?, ?, ?, ?, ?, 0, ?, 0, 0, 3, 0, null, SYSDATE, null, null, "
	            + " ?, ?, null, null, null, ?, null, null, ?, ?, ?)";
	      Connection conn = null;
	      PreparedStatement psmt = null;
	      int count = 0;
	      
	      try {
	         conn = DBConnection.getConnection();
	         psmt = conn.prepareStatement(sql);
	         int i = 1;
	         psmt.setString(i++, dto.getId());
	         psmt.setString(i++, dto.getPassword());
	         psmt.setString(i++, dto.getName());
	         psmt.setInt(i++, dto.getAge());
	         psmt.setString(i++, dto.getGender());
	         psmt.setString(i++, dto.getAddress());
	         psmt.setString(i++, dto.getPhoneNumber());
	         psmt.setString(i++, dto.getWantPay());
	         psmt.setString(i++, dto.getCareer());
	         psmt.setString(i++, dto.getIntroduce());
	         
	         String[] wantDate = dto.getWantDate();
	         String str = "";
	         for (int j = 0; j < wantDate.length; j++) {
	            str = str + "," + wantDate[j];
	         }
	         psmt.setString(i++, str);
	         psmt.setString(i++, dto.getWantLocal());
	         psmt.setString(i++, dto.getWantTime());
	         count = psmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      
	      return count > 0 ? true : false;
	   }
	
}





























