package mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DBClose;
import db.DBConnection;

public class PointDao {
	private static PointDao pointDao = new PointDao();

	private PointDao() {
	}

	public static PointDao getInstance() {
		return pointDao;
	}

	public boolean payMoney(String id, int money) {
		int point = (int)(money * 0.9);
		int commission = (int)(money * 0.1);
		String sql1 = " UPDATE BABY_MEMBER SET POINT = POINT + ? WHERE ID = ?";

		String sql2 = " INSERT INTO BABY_COMMISSION (ID, COMMISSION) VALUES(?, ?)";

		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(sql1);
			psmt.setInt(1, point);
			psmt.setString(2, id);

			count = psmt.executeUpdate();

			psmt.clearParameters();

			// 커미션에 돈 넣기
			
			psmt = conn.prepareStatement(sql2);
			psmt.setString(1, id);
			psmt.setInt(2, commission);
			
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
	
	//포인트 차감 결제하기
	public boolean payPoint(String userId, String sitterId, int point) {
		String sql1 = " UPDATE BABY_MEMBER SET POINT = POINT - ? WHERE ID = ? ";

		String sql2 = " UPDATE BABY_MEMBER SET POINT = POINT + ? WHERE ID = ? ";

		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(sql1);
			psmt.setInt(1, point);
			psmt.setString(2, userId);

			count = psmt.executeUpdate();

			psmt.clearParameters();

			// 커미션에 돈 넣기
			
			psmt = conn.prepareStatement(sql2);
			psmt.setInt(1, point);
			psmt.setString(2, sitterId);
			
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
	
	public int getPoint(String id) {
		String sql =  "SELECT SUM(TO_NUMBER(NVL(POINT, 0))) FROM  BABY_MEMBER WHERE ID = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int point = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				point = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return point;
	}
	
	
	public int getCommision() {
		String sql =  "SELECT SUM(TO_NUMBER(NVL(POINT, 0))) FROM BABY_COMMISSION ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int commission = 0;
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				commission = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}
		return commission;
	}
}












