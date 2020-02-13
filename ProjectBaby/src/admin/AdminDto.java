package admin;

import java.io.Serializable;

public class AdminDto  implements Serializable{

		private int seq;
		private String id;
		private String title;
		private String content;
		private int del;

		public AdminDto() {
			
		}
		public AdminDto(int seq, String id, String title, String content, int del) {
			super();
			this.seq = seq;
			this.id = id;
			this.title = title;
			this.content = content;
			this.del = del;
		}

		@Override
		public String toString() {
			return "Admin [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", del=" + del
					+ "]";
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

		public int getDel() {
			return del;
		}

		public void setDel(int del) {
			this.del = del;
		}

	
}
