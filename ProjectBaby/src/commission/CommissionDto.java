package commission;

import java.io.Serializable;

public class CommissionDto implements Serializable {
	private String id;
	private String commission;

	@Override
	public String toString() {
		return "Commission [id=" + id + ", commission=" + commission + "]";
	}

	public CommissionDto() {

	}

	public CommissionDto(String id, String commission) {
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
