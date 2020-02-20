package commission;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;

public class CommissionDao {
	private static CommissionDao commissionDao = new CommissionDao();

	private CommissionDao() {
	}

	public static CommissionDao getInstance() {
		return commissionDao;
	}

	public List<CommissionDto> getCommissionList(){
		String sql = "SELECT ID, SUM(COMMISSION) FROM BABY_COMMISSION GROUP BY ID ORDER BY ID";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<CommissionDto> list = new ArrayList<CommissionDto>();
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				CommissionDto commissionDto = new CommissionDto();
				commissionDto.setId(rs.getString(1));
				commissionDto.setCommission(rs.getString(2));
				
				list.add(commissionDto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
	public int getCommision() {
		String sql =  "SELECT SUM(TO_NUMBER(NVL(COMMISSION, 0))) FROM BABY_COMMISSION ";
		
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












