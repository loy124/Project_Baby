package sitterboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import main.BabyMemberDto;

public class SitterBoardDao {

	private static SitterBoardDao dao = new SitterBoardDao();
	
	public SitterBoardDao() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static SitterBoardDao getInstance() {
		return dao;
	}
	
	
	// 글목록 가져오는 거
	public List<SitterBoardDto> getSitterBoardList() {
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, FILE_NAME, "
				+ " ORIGINAL_FILE_NAME, READCOUNT, REGISTER_DATE, DEL "
				+ " FROM SITTER_BOARD "
				+ " ORDER BY REGISTER_DATE DESC";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<SitterBoardDto> list = new ArrayList<SitterBoardDto>();
		System.out.println("1/6 getSitterBoardList success");
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getSitterBoardList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getSitterBoardList success");
			
			while(rs.next()) {
				int i = 1;
				SitterBoardDto dto = new SitterBoardDto(rs.getInt(i++),
														rs.getString(i++), 
														rs.getString(i++), 
														rs.getString(i++), 
														rs.getString(i++), 
														rs.getString(i++), 
														rs.getInt(i++), 
														rs.getString(i++), 
														rs.getInt(i++));
			
				list.add(dto);
			}
			System.out.println("4/6 getSitterBoardList success");
		} catch (SQLException e) {
			System.out.println("getSitterBoardList fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	
	
	// 글 작성
	public boolean writeSitterBoard(SitterBoardDto dto) {
		String sql = " INSERT INTO SITTER_BOARD(SEQ, ID, TITLE, CONTENT, FILE_NAME, "
				+ " ORIGINAL_FILE_NAME, READCOUNT, REGISTER_DATE, DEL) "
				+ " VALUES(SITTER_BOARD_SEQ.NEXTVAL, ?, ?, ?, ?, ?, 0, SYSDATE, 0) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0; 
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 writeSitterBoard success");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getFileName());
			psmt.setString(5, dto.getOriginalFileName());
			System.out.println("2/6 writeSitterBoard success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 writeSitterBoard success");						
		} catch (SQLException e) {
			System.out.println("3/6 writeSitterBoard fail");	
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;				
	}
	
	// 댓글 테이블 추가
	public boolean insertComment(String id) {
		
		String sql = " INSERT INTO sitter_board_comment(SEQ) "
				+ " SELECT SEQ FROM SITTER_BOARD WHERE ID= '" + id +"'";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0; 
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 writeSitterBoard success");
			
			psmt = conn.prepareStatement(sql);
			count = psmt.executeUpdate();
			System.out.println("3/6 writeSitterBoard success");						
		} catch (SQLException e) {
			System.out.println("3/6 writeSitterBoard fail");	
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;				
	}
	
	
	// 조회수
	public void readCount(int seq) {
		String sql = " UPDATE SITTER_BOARD "
				+ " SET READCOUNT = READCOUNT+1 "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;

		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 readCount success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 readCount success");

			psmt.setInt(1, seq); // seq = ?
			count = psmt.executeUpdate();
			System.out.println("3/6 readCount success");
			if (count > 0) {
				System.out.println("업데이트 성공");
			}
			System.out.println("4/6 readCount success");

		} catch (SQLException e) {
			System.out.println("readCount fail");
			e.printStackTrace();
		} finally {
			DBClose.close(psmt, conn, null);
		}				
	}
	
	
	// 글 디테일 보기
	public SitterBoardDto getSitterBoard(int seq) {
		String sql =  " SELECT SEQ, ID, TITLE, CONTENT, FILE_NAME, "
				+ " ORIGINAL_FILE_NAME, READCOUNT, REGISTER_DATE, DEL "
				+ " FROM SITTER_BOARD "
				+ " WHERE SEQ=? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		SitterBoardDto dto = null;
		
		
        
        try {
        	conn = DBConnection.getConnection();
        	System.out.println("1/6 getSitterBoard success");
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/6 getSitterBoard success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getSitterBoard success");
			
			if(rs.next()) {
				int i = 1;
				dto = new SitterBoardDto(rs.getInt(i++),
										rs.getString(i++), 
										rs.getString(i++), 
										rs.getString(i++), 
										rs.getString(i++), 
										rs.getString(i++), 
										rs.getInt(i++), 
										rs.getString(i++), 
										rs.getInt(i++));

				
			}
			System.out.println("4/6 getSitterBoard success");
			
		} catch (SQLException e) {
			System.out.println("2/6 getSitterBoard fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
        return dto;
	}
	
	
	// 댓글 달기
	public boolean comment(int seq, SitterBoardCommentDto cDto ) {
		String sql = " INSERT INTO SITTER_BOARD_COMMENT "
				+ " (SEQ, BOARD_COMMENT, REGISTER_DATE) "
				+ " VALUES(?, ?, SYSDATE) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		System.out.println("=======================================\n"+sql+"\n==========================================");
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 comment success");
			psmt = conn.prepareStatement(sql);
			 psmt.setInt(1, cDto.getSeq()); 
			psmt.setString(2, cDto.getComment());
			System.out.println("2/6 comment success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 comment success");
			
		} catch (SQLException e) {
			System.out.println("comment fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;	
	}
	
	
	// 댓글 하나만 보여주기
	public SitterBoardCommentDto getComment(int seq) {
		String sql = " SELECT SEQ, BOARD_COMMENT, REGISTER_DATE "
				+ " FROM SITTER_BOARD_COMMENT "
				+ " WHERE SEQ = ?"
				+ " ORDER BY REGISTER_DATE DESC";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		SitterBoardCommentDto dto = null;
		System.out.println("1/6 getSitterCommentList success");
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/6 getSitterCommentList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getSitterCommentList success");
			
			while(rs.next()) {
				int i = 1;
				dto = new SitterBoardCommentDto(rs.getInt(i++),
																	rs.getString(i++),//boardComment, 
																	rs.getString(i++));//registerDate)
				
			}
			System.out.println("4/6 getSitterCommentList success");
		} catch (SQLException e) {
			System.out.println("getSitterCommentList fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return dto;
	}
	
	
	// 댓글 여러개 
	public List<SitterBoardCommentDto> getSitterCommentList(int seq) {
		String sql = " SELECT SEQ, BOARD_COMMENT, REGISTER_DATE "
				+ " FROM SITTER_BOARD_COMMENT "
				+ " WHERE SEQ=? "
				+ " ORDER BY REGISTER_DATE DESC";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<SitterBoardCommentDto> list = new ArrayList<SitterBoardCommentDto>();
		System.out.println("1/6 getSitterCommentList success");
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/6 getSitterCommentList success");
			
			rs = psmt.executeQuery();
			System.out.println("3/6 getSitterCommentList success");
			
			while(rs.next()) {
				int i = 1;
				SitterBoardCommentDto dto = new SitterBoardCommentDto(rs.getInt(i++),
																	rs.getString(i++),//boardComment, 
																	rs.getString(i++));//registerDate)
				list.add(dto);
			}
			System.out.println("4/6 getSitterCommentList success");
		} catch (SQLException e) {
			System.out.println("getSitterCommentList fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return list;
	}
	
	
	// 글 수정
	public boolean updateBoard(int seq, SitterBoardDto dto) {
		System.out.println("업데이트 디티오: " + dto.toString());
		
		String sql = " UPDATE SITTER_BOARD "
				+ " SET TITLE=?, CONTENT=?, FILE_NAME=?, ORIGINAL_FILE_NAME=?, "
				+ " REGISTER_DATE=SYSDATE "
				+ " WHERE SEQ=? ";
				
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 updateBoard success");
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getFileName());
			psmt.setString(4, dto.getOriginalFileName());
			psmt.setInt(5, seq);
			System.out.println("2/6 updateBoard success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 updateBoard success");
		} catch (SQLException e) {
			System.out.println(" updateBoard fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
			
		}
		return count>0?true:false;	
	}
	
	// 글 삭제
	public boolean deleteSitterBoard(int seq) {
		String sql = " UPDATE SITTER_BOARD "
				+ " SET DEL=1 "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 deleteSitterBoard success");
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/6 deleteSitterBoard success");
			
			count = psmt.executeUpdate();
			System.out.println("3/6 deleteSitterBoard success");
			
		} catch (SQLException e) {
			System.out.println("deleteSitterBoard fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;	
	}
	
	// 총 글의 개수
	public int getAllSitterBoard(String choice, String searchWord) {
		String sql = " SELECT COUNT(*) FROM SITTER_BOARD ";
		
		String sqlWord = "";
		/*
		 * System.out.println("다오 초이스 : " + choice); System.out.println("다오 서치워 : " +
		 * choice);
		 */
		if(choice.equals("title")) {
			sqlWord = " WHERE TITLE LIKE '%" + searchWord.trim() + "%' ";
		}else if(choice.equals("writer")) {
			sqlWord = " WHERE ID='" + searchWord.trim() + "'";
		}else if(choice.equals("content")) {
			sqlWord = " WHERE CONTENT LIKE '%" + searchWord.trim() + "%' ";
		}
		sql += sqlWord;
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int length = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 getAllSitterBoard success");
			psmt = conn.prepareStatement(sql);
			System.out.println("2/6 getAllSitterBoard success");
			rs = psmt.executeQuery();
			System.out.println("3/6 getAllSitterBoard success");
			if(rs.next()) {
				length = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			System.out.println("getAllSitterBoard fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, rs);
		}
		return length;
		
	}
	
	
	// 페이징 검색
	public List<SitterBoardDto> getSitterBoardPagingList(String choice, String searchWord, int page) {
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, FILE_NAME, "
				+ " ORIGINAL_FILE_NAME, READCOUNT, REGISTER_DATE, DEL "
				+ " FROM ";
			sql += "(SELECT ROW_NUMBER()OVER(ORDER BY REGISTER_DATE DESC) AS RNUM, "
					+ " SEQ, ID, TITLE, CONTENT, FILE_NAME, "
					+ " ORIGINAL_FILE_NAME, READCOUNT, REGISTER_DATE, DEL "
					+ " FROM SITTER_BOARD ";
			
			
			String sqlWord = "";
			
			
			if(choice.equals("title")) {
				sqlWord = " WHERE TITLE LIKE '%" + searchWord.trim() + "%' ";
				
			}else if(choice.equals("writer")) {
				sqlWord = " WHERE ID LIKE '%" + searchWord.trim() + "%' ";
			}else if(choice.equals("content")) {
				sqlWord = " WHERE CONTENT LIKE '%" + searchWord.trim() + "%'";
			}
			sql += sqlWord;
			sql += " ORDER BY REGISTER_DATE DESC) ";
			sql += " WHERE RNUM >=? AND RNUM <=?";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			List<SitterBoardDto> list = new ArrayList<SitterBoardDto>();
			int start, end;
			
			start = 1 + 10 * page;
			end = 10 + 10 * page;
			
			try {
				conn = DBConnection.getConnection();
				System.out.println("1/6  getSitterBoardPagingList success");
				
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, start);
				psmt.setInt(2, end);
				System.out.println("2/6 getSitterBoardPagingList success");
				
				rs = psmt.executeQuery();
				System.out.println("3/6 getSitterBoardPagingList success");
				
				while(rs.next()) {
					int i = 1;
					SitterBoardDto dto = new SitterBoardDto(rs.getInt(i++),
															rs.getString(i++), 
															rs.getString(i++), 
															rs.getString(i++), 
															rs.getString(i++), 
															rs.getString(i++), 
															rs.getInt(i++), 
															rs.getString(i++), 
															rs.getInt(i++));

					list.add(dto);
				}
				System.out.println("4/6 getSitterBoardPagingList success");
				
			} catch (SQLException e) {
				System.out.println("getSitterBoardPagingList fail");
				e.printStackTrace();
			}finally {
				DBClose.close(psmt, conn, rs);
			}
			return list;
	}
	
	public boolean sitterRecognize(SitterBoardDto sdto) {
		String sql = " UPDATE BABY_MEMBER "
				+ " SET AUTH=4 "
				+ " WHERE ID=? ";
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 sitterRecognize suceess");
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, sdto.getId());
			System.out.println("2/6 sitterRecognize suceess");
			count = psmt.executeUpdate();
			System.out.println("3/6 sitterRecognize suceess");
		} catch (SQLException e) {
			System.out.println("1/6 sitterRecognize fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;	
	}
	
	
	public boolean sitterReject(SitterBoardDto sdto) {
		String sql = " UPDATE BABY_MEMBER "
				+ " SET AUTH=6 "
				+ " WHERE ID=? ";
		
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/6 sitterRecognize suceess");
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, sdto.getId());
			System.out.println("2/6 sitterRecognize suceess");
			count = psmt.executeUpdate();
			System.out.println("3/6 sitterRecognize suceess");
		} catch (SQLException e) {
			System.out.println("1/6 sitterRecognize fail");
			e.printStackTrace();
		}finally {
			DBClose.close(psmt, conn, null);
		}
		return count>0?true:false;	
	}
	
}
























