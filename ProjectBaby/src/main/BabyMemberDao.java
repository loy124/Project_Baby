package main;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

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
				+ " CUSTOMER_REQUEST_DATE, REGISTER_DATE, UN_REGISTER_DATE, PROFILE_PHOTO) "
				+ " VALUES(?, ?, ?, ?, ?, ?, 0, ?, 0, 0, 3, 0, null, SYSDATE, null, '')";
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
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;
	}

	public boolean registerSitter(BabyMemberDto dto) {
		String sql = "INSERT INTO BABY_MEMBER (" + "ID," + " PASSWORD," + " NAME, " + "AGE, " + "GENDER," + " ADDRESS,"
				+ " MONEY," + " PHONE_NUMBER," + " BANK_ACCOUNT," + " BANK_ACCOUNT_MONEY," + " AUTH," + " POINT, "
				+ " CUSTOMER_REQUEST_DATE," + " REGISTER_DATE, " + "UN_REGISTER_DATE," + "LICENSE," + " WANT_PAY, "
				+ "CAREER," + " HIRE_DATE," + " EXPIRE_DATE," + " PROFILE_PHOTO, " + "INTRODUCE," + " START_WORK_DATE,"
				+ " END_WORK_DATE," + " WANT_DATE," + " WANT_LOCAL," + " WANT_TIME ) " + " VALUES(" + "?, " + "?, "
				+ "?, " + "?, " + "?, " + "?, " + "0, " + "?, " // 폰넘버
				+ "0, " + "0, " + "5, " + "0, " + "null, " + "SYSDATE, " + "null, " // 날짜
				+ "null, " // 라이센스
				+ " ?," // 원하는 돈
				+ " ?, " // 경력
				+ "null," + " null, " + "''," // 사진
				+ " ?, " // 소개
				+ "null," + " null," + " ?, " + "?," + " ?)";
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
			if (wantDate != null) {
				for (int j = 0; j < wantDate.length; j++) {
					if (j != 0) {
						str = str + "," + wantDate[j];
					} else {
						str = str + wantDate[0];
					}
				}
			}

			psmt.setString(i++, str);
			psmt.setString(i++, dto.getWantLocal());
			psmt.setString(i++, dto.getWantTime());
			count = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;
	}

	public BabyMemberDto login(String id, String password) {
		String sql = " SELECT ID, NAME, AGE, GENDER, ADDRESS, MONEY, PHONE_NUMBER, "
				+ " BANK_ACCOUNT, BANK_ACCOUNT_MONEY, AUTH, POINT, "
				+ " CUSTOMER_REQUEST_DATE, REGISTER_DATE, UN_REGISTER_DATE, "
				+ " LICENSE, WANT_PAY, CAREER, HIRE_DATE, EXPIRE_DATE, PROFILE_PHOTO, "
				+ " INTRODUCE, START_WORK_DATE, END_WORK_DATE, WANT_DATE, WANT_LOCAL, WANT_TIME, "
				+ " SITTER_ID, SITTER_REQUEST_RECIEVE_DATE, realFileName, USER_ID, WORKING_HOUR " 
				+ " FROM BABY_MEMBER "
				+ "WHERE ID = ? AND PASSWORD = ? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		BabyMemberDto babyMemberDto = null;
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, password);
			System.out.println("psmt");
			rs = psmt.executeQuery();
			int i = 1;
			String arrArray[] = null;

			while (rs.next()) {
				String arr = rs.getString(24);
				if (arr != null) {
					System.out.println("arr" + arr);
					System.out.println("test");
					arrArray = arr.split(",");
				}
				System.out.println("split까지 체크");


				System.out.print(i);
				babyMemberDto = new BabyMemberDto(rs.getString(i++), rs.getString(i++), rs.getInt(i++),
						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
						rs.getString(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
						arrArray, rs.getString(25), rs.getString(26), rs.getString(27), rs.getString(28));
				babyMemberDto.setRealFileName(rs.getString(29));
				babyMemberDto.setUserId(rs.getString(30));
				babyMemberDto.setWorkingHour(rs.getString(31));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}

		return babyMemberDto;

	}

	public List<BabyMemberDto> getMemberList() {
		
		String sql = " SELECT " + "ID," + " NAME, " + "AGE, " + "GENDER," + " ADDRESS," + " MONEY," + " PHONE_NUMBER,"
				+ " BANK_ACCOUNT," + " BANK_ACCOUNT_MONEY," + " AUTH," + " POINT, " + " CUSTOMER_REQUEST_DATE,"
				+ " REGISTER_DATE, " + "UN_REGISTER_DATE," + "LICENSE," + " WANT_PAY, " + "CAREER," + " HIRE_DATE,"
				+ " EXPIRE_DATE," + " PROFILE_PHOTO, " + "INTRODUCE," + " START_WORK_DATE," + " END_WORK_DATE, "
				+ " WANT_DATE, " + " WANT_LOCAL, " + " WANT_TIME, " + "SITTER_ID, SITTER_REQUEST_RECIEVE_DATE , realFileName, USER_ID, WORKING_HOUR " + " FROM BABY_MEMBER ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<BabyMemberDto> list = new ArrayList<BabyMemberDto>();
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			System.out.println("psmt");
			rs = psmt.executeQuery();
			int i = 1;
			String arrArray[] = null;

			while (rs.next()) {
				String arr = rs.getString(24);
				if (arr != null) {
					System.out.println("arr" + arr);
					System.out.println("test");
					arrArray = arr.split(",");
				}

				System.out.println(i);
				i = 1;
				BabyMemberDto babyMemberDto = new BabyMemberDto(rs.getString(i++), rs.getString(i++), rs.getInt(i++),
						rs.getString(i++), rs.getString(i++),

						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++),

						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),

						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),

						rs.getString(i++), rs.getString(i++), rs.getString(i++), arrArray, rs.getString(25),

						rs.getString(26), rs.getString(27), rs.getString(28));
				System.out.println("babyMemberDto=" + babyMemberDto.toString());
				babyMemberDto.setRealFileName(rs.getString(29));
				babyMemberDto.setUserId(rs.getString(30));
				babyMemberDto.setWorkingHour(rs.getString(31));
				list.add(babyMemberDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}

		return list;

	}
	
public List<BabyMemberDto> getSitterList() {
		
		String sql = " SELECT " + "ID," + " NAME, " + "AGE, " + "GENDER," + " ADDRESS," + " MONEY," + " PHONE_NUMBER,"
				+ " BANK_ACCOUNT," + " BANK_ACCOUNT_MONEY," + " AUTH," + " POINT, " + " CUSTOMER_REQUEST_DATE,"
				+ " REGISTER_DATE, " + "UN_REGISTER_DATE," + "LICENSE," + " WANT_PAY, " + "CAREER," + " HIRE_DATE,"
				+ " EXPIRE_DATE," + " PROFILE_PHOTO, " + "INTRODUCE," + " START_WORK_DATE," + " END_WORK_DATE, "
				+ " WANT_DATE, " + " WANT_LOCAL, " + " WANT_TIME, " + "SITTER_ID, SITTER_REQUEST_RECIEVE_DATE , realFileName, USER_ID, WORKING_HOUR " + " FROM BABY_MEMBER WHERE AUTH = 4";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<BabyMemberDto> list = new ArrayList<BabyMemberDto>();
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			System.out.println("psmt");
			rs = psmt.executeQuery();
			int i = 1;
			String arrArray[] = null;

			while (rs.next()) {
				String arr = rs.getString(24);
				if (arr != null) {
					System.out.println("arr" + arr);
					System.out.println("test");
					arrArray = arr.split(",");
				}

				System.out.println(i);
				i = 1;
				BabyMemberDto babyMemberDto = new BabyMemberDto(rs.getString(i++), rs.getString(i++), rs.getInt(i++),
						rs.getString(i++), rs.getString(i++),

						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++),

						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),

						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),

						rs.getString(i++), rs.getString(i++), rs.getString(i++), arrArray, rs.getString(25),

						rs.getString(26), rs.getString(27), rs.getString(28));
				System.out.println("babyMemberDto=" + babyMemberDto.toString());
				babyMemberDto.setRealFileName(rs.getString(29));
				babyMemberDto.setUserId(rs.getString(30));
				babyMemberDto.setWorkingHour(rs.getString(31));
				list.add(babyMemberDto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}

		return list;

	}
	
	

	public BabyMemberDto getDetail(String id) {
		String sql = " SELECT ID, NAME, AGE, GENDER, ADDRESS, MONEY, PHONE_NUMBER, "
				+ " BANK_ACCOUNT, BANK_ACCOUNT_MONEY, AUTH, POINT, "
				+ " CUSTOMER_REQUEST_DATE, REGISTER_DATE, UN_REGISTER_DATE, "
				+ " LICENSE, WANT_PAY, CAREER, HIRE_DATE, EXPIRE_DATE, PROFILE_PHOTO, "
				+ " INTRODUCE, START_WORK_DATE, END_WORK_DATE, WANT_DATE, WANT_LOCAL, WANT_TIME, " + " SITTER_ID, SITTER_REQUEST_RECIEVE_DATE, realFileName, USER_ID, WORKING_HOUR " + " FROM BABY_MEMBER "
				+ " WHERE ID = ? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		BabyMemberDto babyMemberDto = null;
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			System.out.println("psmt");
			rs = psmt.executeQuery();
			int i = 1;
			String arrArray[] = null;

			while (rs.next()) {
				String arr = rs.getString(24);
				if (arr != null) {
					System.out.println("arr" + arr);
					System.out.println("test");
					arrArray = arr.split(",");

				}
				System.out.println("split까지 체크");

				/*
				 * for (int j = 0; j < arrArray.length; j++) { System.out.println(arrArray[j]);
				 * }
				 */

				System.out.print(i);
				babyMemberDto = new BabyMemberDto(rs.getString(i++), rs.getString(i++), rs.getInt(i++),
						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
						rs.getString(i++), rs.getInt(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),
						arrArray, rs.getString(25), rs.getString(26), rs.getString(27), rs.getString(28));
					babyMemberDto.setRealFileName(rs.getString(29));
					babyMemberDto.setUserId(rs.getString(30));
					babyMemberDto.setWorkingHour(rs.getString(31));

				System.out.println("sql내 babyMember" + babyMemberDto.toString());

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}

		return babyMemberDto;

	}

	public boolean memberAdminUpdate(BabyMemberDto babyMemberDto) {
		String sql = "UPDATE BABY_MEMBER SET ADDRESS = ?, PHONE_NUMBER = ?, BANK_ACCOUNT = ?, AUTH = ?"
				+ " WHERE ID = ? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, babyMemberDto.getAddress());
			psmt.setString(2, babyMemberDto.getPhoneNumber());
			psmt.setString(3, babyMemberDto.getBankAccount());
			psmt.setInt(4, babyMemberDto.getAuth());
			psmt.setString(5, babyMemberDto.getId());

			count = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;
	}

	public boolean sitterAdminUpdate(BabyMemberDto babyMemberDto) {
		String sql = "UPDATE BABY_MEMBER SET ADDRESS = ?, PHONE_NUMBER = ?, BANK_ACCOUNT = ?, AUTH = ?, "
				+ " LICENSE = ?, WANT_PAY = ?, CAREER = ?, INTRODUCE = ?, WANT_DATE = ?, WANT_LOCAL = ?, WANT_TIME = ?"
				+ "   WHERE ID = ? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, babyMemberDto.getAddress());
			psmt.setString(2, babyMemberDto.getPhoneNumber());
			psmt.setString(3, babyMemberDto.getBankAccount());
			psmt.setInt(4, babyMemberDto.getAuth());
			psmt.setString(5, babyMemberDto.getLicense());
			psmt.setString(6, babyMemberDto.getWantPay());
			psmt.setString(7, babyMemberDto.getCareer());
			psmt.setString(8, babyMemberDto.getIntroduce());
			String str = "";

			if (babyMemberDto.getWantDate() != null) {
				for (int i = 0; i < babyMemberDto.getWantDate().length; i++) {
					if (i != 0) {
						str = str + "," + babyMemberDto.getWantDate()[i];
					} else {
						str = babyMemberDto.getWantDate()[0];
					}
				}
			}
			psmt.setString(9, str);
			psmt.setString(10, babyMemberDto.getWantLocal());
			psmt.setString(11, babyMemberDto.getWantTime());
			psmt.setString(12, babyMemberDto.getId());

			count = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;
	}

	// 삭제 만들기
	public boolean deleteMember(String id) {
		String sql = "UPDATE BABY_MEMBER SET AUTH = 7, UN_REGISTER_DATE = SYSDATE WHERE ID = ? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}

		return count > 0 ? true : false;
	}

	public int getAllMember(String address, String wantDate, String wantTime) {
		String sql = "SELECT COUNT(*) FROM BABY_MEMBER WHERE 1 = 1 ";

		if (address != null && !address.equals("")) {
			sql += " AND ADDRESS LIKE '%" + address.trim() + "%'";
		}
		if (wantDate != null && !wantDate.equals("")) {
			sql += " AND WANT_DATE LIKE '%" + wantDate.trim() + "%' ";
		}
		if (wantTime != null && !wantTime.equals("")) {
			sql += " AND WANT_TIME = '%" + wantTime.trim() + "%' ";
		}

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int len = 0;

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {
				len = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}

		return len;
	}

	public List<BabyMemberDto> getMemberPagingList(String address, String wantDate, String wantTime, int page) {
		String sql = " SELECT " + "ID," + " NAME, " + "AGE, " + "GENDER," + " ADDRESS," + " MONEY," + " PHONE_NUMBER,"
				+ " BANK_ACCOUNT," + " BANK_ACCOUNT_MONEY," + " AUTH," + " POINT, " + " CUSTOMER_REQUEST_DATE,"
				+ " REGISTER_DATE, " + "UN_REGISTER_DATE," + "LICENSE," + " WANT_PAY, " + "CAREER," + " HIRE_DATE,"
				+ " EXPIRE_DATE," + " PROFILE_PHOTO, " + "INTRODUCE," + " START_WORK_DATE," + " END_WORK_DATE, "
				+ " WANT_DATE, " + " WANT_LOCAL, " + " WANT_TIME" + " FROM  ";

		sql += "(SELECT ROW_NUMBER()OVER(ORDER BY SYSDATE) AS RNUM, " + "ID," + " NAME, " + "AGE, " + "GENDER,"
				+ " ADDRESS," + " MONEY," + " PHONE_NUMBER," + " BANK_ACCOUNT," + " BANK_ACCOUNT_MONEY," + " AUTH,"
				+ " POINT, " + " CUSTOMER_REQUEST_DATE," + " REGISTER_DATE, " + "UN_REGISTER_DATE," + "LICENSE,"
				+ " WANT_PAY, " + "CAREER," + " HIRE_DATE," + " EXPIRE_DATE," + " PROFILE_PHOTO, " + "INTRODUCE,"
				+ " START_WORK_DATE," + " END_WORK_DATE, " + " WANT_DATE, " + " WANT_LOCAL, " + " WANT_TIME"
				+ " FROM BABY_MEMBER ";
		sql += " ORDER BY SYSDATE) ";
		sql += " WHERE RNUM >= ? AND RNUM <= ?";
		String sqlWord = "";

		if (address != null && !address.equals("")) {
			sqlWord += " AND ADDRESS LIKE '%" + address.trim() + "%' ";
		}
		if (wantDate != null && !wantDate.equals("")) {
			sqlWord += " AND WANT_DATE LIKE '%" + wantDate.trim() + "%' ";
		}
		if (wantTime != null && !wantTime.equals("")) {
			sqlWord += " AND WANT_TIME = '%" + wantTime.trim() + "%' ";
		}

		sql += sqlWord;

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		List<BabyMemberDto> list = new ArrayList<BabyMemberDto>();

		int start, end;
		start = 1 + 10 * page;
		end = 10 + 10 * page;

		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, start);
			psmt.setInt(2, end);
			System.out.println("psmt");
			rs = psmt.executeQuery();
			int i = 1;
			String arrArray[] = null;

			while (rs.next()) {
				String arr = rs.getString(24);
				if (arr != null) {
					System.out.println("arr" + arr);
					System.out.println("test");
					arrArray = arr.split(",");
				}

				System.out.println(i);
				i = 1;
				BabyMemberDto babyMemberDto = new BabyMemberDto(rs.getString(i++), rs.getString(i++), rs.getInt(i++),
						rs.getString(i++), rs.getString(i++),

						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getInt(i++),

						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),

						rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++),

						rs.getString(i++), rs.getString(i++), rs.getString(i++), arrArray, rs.getString(25),

						rs.getString(26));
				System.out.println("babyMemberDto=" + babyMemberDto.toString());

				list.add(babyMemberDto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, rs);
		}

		return list;

	}
	
	public int insertImageFile(String loginId, String fileName, String fileRealName) {

	      String sql = " UPDATE BABY_MEMBER " + " SET FILENAME = ?, REALFILENAME = ? " + " WHERE ID = ? ";

	      Connection conn = null;
	      PreparedStatement psmt = null;

	      try {
	         conn = DBConnection.getConnection();
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, fileName);
	         psmt.setString(2, fileRealName);
	         psmt.setString(3, loginId);

	         return psmt.executeUpdate(); // return이 나오면 무조건 끝이 난다. 숫자로 표출된다. 초기값은 0 그외에는 1이상

	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally { // 무조건 실행된다
	         DBClose.close(psmt, conn, null);
	      }

	      return -1; // 실패한 경우 여기까지 내려온다.

	   }

	/*
	 * public int getAllMember(String choice, String searchWord) { String sql =
	 * " SELECT COUNT(*) FROM BABY_MEMBER ";
	 * 
	 * String sqlWord = ""; if(choice.equals("title")) { sqlWord =
	 * " WHERE TITLE LIKE '%" + searchWord.trim() + "%' "; }else
	 * if(choice.equals("writer")) { sqlWord = " WHERE ID='" + searchWord.trim() +
	 * "'"; }else if(choice.equals("content")) { sqlWord = " WHERE CONTENT LIKE '%"
	 * + searchWord.trim() + "%' "; } sql += sqlWord;
	 * 
	 * Connection conn = null; PreparedStatement psmt = null; ResultSet rs = null;
	 * 
	 * int len = 0;
	 * 
	 * try { conn = DBConnection.getConnection(); psmt = conn.prepareStatement(sql);
	 * rs = psmt.executeQuery(); if(rs.next()) { len = rs.getInt(1); } } catch
	 * (SQLException e) { // TODO Auto-generated catch block e.printStackTrace();
	 * }finally { DBClose.close(psmt, conn, rs); } return len; }
	 */
}
