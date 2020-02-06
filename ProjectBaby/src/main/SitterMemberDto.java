package main;

public class SitterMemberDto {

	private String id;
	private String license;
	private String wantPay;
	private String career;

	private String hireDate;
	private String expireDate;

	private String profilePhoto;
	private String introduce;
	private String startWorkDate;
	private String endWorkDate;

	private String wantDate;
	private String wantLocal;
	private String wantTime;
	@Override
	public String toString() {
		return "SitterMemberDto [id=" + id + ", license=" + license + ", wantPay=" + wantPay + ", career=" + career
				+ ", hireDate=" + hireDate + ", expireDate=" + expireDate + ", profilePhoto=" + profilePhoto
				+ ", introduce=" + introduce + ", startWorkDate=" + startWorkDate + ", endWorkDate=" + endWorkDate
				+ ", wantDate=" + wantDate + ", wantLocal=" + wantLocal + ", wantTime=" + wantTime + "]";
	}
	public SitterMemberDto() {
		
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public String getWantPay() {
		return wantPay;
	}
	public void setWantPay(String wantPay) {
		this.wantPay = wantPay;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getHireDate() {
		return hireDate;
	}
	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}
	public String getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}
	public String getProfilePhoto() {
		return profilePhoto;
	}
	public void setProfilePhoto(String profilePhoto) {
		this.profilePhoto = profilePhoto;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getStartWorkDate() {
		return startWorkDate;
	}
	public void setStartWorkDate(String startWorkDate) {
		this.startWorkDate = startWorkDate;
	}
	public String getEndWorkDate() {
		return endWorkDate;
	}
	public void setEndWorkDate(String endWorkDate) {
		this.endWorkDate = endWorkDate;
	}
	public String getWantDate() {
		return wantDate;
	}
	public void setWantDate(String wantDate) {
		this.wantDate = wantDate;
	}
	public String getWantLocal() {
		return wantLocal;
	}
	public void setWantLocal(String wantLocal) {
		this.wantLocal = wantLocal;
	}
	public String getWantTime() {
		return wantTime;
	}
	public void setWantTime(String wantTime) {
		this.wantTime = wantTime;
	}
	public SitterMemberDto(String id, String license, String wantPay, String career, String hireDate, String expireDate,
			String profilePhoto, String introduce, String startWorkDate, String endWorkDate, String wantDate,
			String wantLocal, String wantTime) {
		super();
		this.id = id;
		this.license = license;
		this.wantPay = wantPay;
		this.career = career;
		this.hireDate = hireDate;
		this.expireDate = expireDate;
		this.profilePhoto = profilePhoto;
		this.introduce = introduce;
		this.startWorkDate = startWorkDate;
		this.endWorkDate = endWorkDate;
		this.wantDate = wantDate;
		this.wantLocal = wantLocal;
		this.wantTime = wantTime;
	}

	

}
