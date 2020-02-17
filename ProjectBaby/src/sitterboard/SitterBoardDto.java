package sitterboard;

import java.io.Serializable;

public class SitterBoardDto implements Serializable {

	private int seq;
	private String id;
	private String title;
	private String content;

	private String fileName;
	private String originalFileName;
	private int readCount;
	private String registerDate;
	private int del;

	public SitterBoardDto() {

	}
	
	
	
	
	public SitterBoardDto(String id) {
		super();
		this.id = id;
	}


	public SitterBoardDto(String id, String title, String content, String fileName, String originalFileName) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.fileName = fileName;
		this.originalFileName = originalFileName;
	}


	public SitterBoardDto(int seq, String id, String title, String content, String fileName, String originalFileName,
			int readCount, String registerDate, int del) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.fileName = fileName;
		this.originalFileName = originalFileName;
		this.readCount = readCount;
		this.registerDate = registerDate;
		this.del = del;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public int getreadCount() {
		return readCount;
	}

	public void setreadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "SitterBoardDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", fileName="
				+ fileName + ", originalFileName=" + originalFileName + ", readCount=" + readCount + ", registerDate="
				+ registerDate + ", del=" + del + "]";
	}

}