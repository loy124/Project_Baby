package file;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;


import db.DBConnection;

public class UserDAO {

	private static UserDAO dao = new UserDAO();
	
	/*
	 * private UserDAO() {
	 * 
	 * }
	 */

	public static UserDAO getInstance() {
		return dao;
	}

	private UserDAO() { //모든 클래스에서 단 한번만 선언해주면 된다.
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
		
			e.printStackTrace();
		}

	}
	
	
//동빈나 파일 업데이트문
	public int profile(String userID, String userProfile) { //처음에 회원가입 할때 userProfile은 공백처리 해준다. 파라미터 값을 ""으로!
		
			String sql = " UPDATE USER SET " 
	                   + " userProfile = ? "
					   + " WHERE userID = ? ";

			Connection conn = null;
			PreparedStatement psmt = null;
			

			try {
				conn = DBConnection.getConnection();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, userProfile);
				psmt.setString(2, userID);
				return psmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					if(psmt != null) psmt.close();
					if(conn != null) conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}

			}    
			return  -1; //데이터베이스 오류
	
			
		}
	
      }
	
	
/*	
//기존 업데이트문 true/false판단문	
 boolean profile(String userID, String userProfile) {
		String sql = " UPDATE USER SET " 
                   + " userProfile = ? "
				   + " WHERE userID = ? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userProfile);
			psmt.setString(2, userID);
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return count > 0 ? true : false;
	}
*/
	

