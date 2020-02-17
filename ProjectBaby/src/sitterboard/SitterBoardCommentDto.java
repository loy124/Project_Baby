package sitterboard;

import java.io.Serializable;

public class SitterBoardCommentDto implements Serializable {

	private int seq;
	private String boardComment;
	private String registerDate;

	public SitterBoardCommentDto() {
		// TODO Auto-generated constructor stub
	}

	
	
	public SitterBoardCommentDto(int seq, String boardComment) {
		super();
		this.seq = seq;
		this.boardComment = boardComment;
	}



	public SitterBoardCommentDto(int seq, String boardComment, String registerDate) {
		super();
		this.seq = seq;
		this.boardComment = boardComment;
		this.registerDate = registerDate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getComment() {
		return boardComment;
	}

	public void setComment(String comment) {
		this.boardComment = comment;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegister_date(String registerDate) {
		this.registerDate = registerDate;
	}

	@Override
	public String toString() {
		return "SitterBoardCommentDto [seq=" + seq + ", boardComment=" + boardComment + ", registerDate=" + registerDate
				+ "]";
	}

}