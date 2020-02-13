package mypage;

import java.io.Serializable;

public class PointDto implements Serializable {
	private String id;
	private String commission;

	@Override
	public String toString() {
		return "Point [id=" + id + ", commission=" + commission + "]";
	}

	public PointDto() {

	}

	public PointDto(String id, String commission) {
		super();
		this.id = id;
		this.commission = commission;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCommission() {
		return commission;
	}

	public void setCommission(String commission) {
		this.commission = commission;
	}
}
