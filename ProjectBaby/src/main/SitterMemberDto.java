package main;

public class SitterMemberDto extends BabyMemberDto {

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return super.getPassword();
	}

	@Override
	public void setPassword(String password) {
		// TODO Auto-generated method stub
		super.setPassword(password);
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return super.getName();
	}

	@Override
	public void setName(String name) {
		// TODO Auto-generated method stub
		super.setName(name);
	}

	@Override
	public int getAge() {
		// TODO Auto-generated method stub
		return super.getAge();
	}

	@Override
	public void setAge(int age) {
		// TODO Auto-generated method stub
		super.setAge(age);
	}

	@Override
	public String getGender() {
		// TODO Auto-generated method stub
		return super.getGender();
	}

	@Override
	public void setGender(String gender) {
		// TODO Auto-generated method stub
		super.setGender(gender);
	}

	@Override
	public String getAddress() {
		// TODO Auto-generated method stub
		return super.getAddress();
	}

	@Override
	public void setAddress(String address) {
		// TODO Auto-generated method stub
		super.setAddress(address);
	}

	@Override
	public String getMoney() {
		// TODO Auto-generated method stub
		return super.getMoney();
	}

	@Override
	public void setMoney(String money) {
		// TODO Auto-generated method stub
		super.setMoney(money);
	}

	@Override
	public String getPhoneNumber() {
		// TODO Auto-generated method stub
		return super.getPhoneNumber();
	}

	@Override
	public void setPhoneNumber(String phoneNumber) {
		// TODO Auto-generated method stub
		super.setPhoneNumber(phoneNumber);
	}

	@Override
	public String getBankAccount() {
		// TODO Auto-generated method stub
		return super.getBankAccount();
	}

	@Override
	public void setBankAccount(String bankAccount) {
		// TODO Auto-generated method stub
		super.setBankAccount(bankAccount);
	}

	@Override
	public String getBankAccountMoney() {
		// TODO Auto-generated method stub
		return super.getBankAccountMoney();
	}

	@Override
	public void setBankAccountMoney(String bankAccountMoney) {
		// TODO Auto-generated method stub
		super.setBankAccountMoney(bankAccountMoney);
	}

	@Override
	public int getAuth() {
		// TODO Auto-generated method stub
		return super.getAuth();
	}

	@Override
	public void setAuth(int auth) {
		// TODO Auto-generated method stub
		super.setAuth(auth);
	}

	@Override
	public String getPoint() {
		// TODO Auto-generated method stub
		return super.getPoint();
	}

	@Override
	public void setPoint(String point) {
		// TODO Auto-generated method stub
		super.setPoint(point);
	}

	@Override
	public String getcustomerRequest() {
		// TODO Auto-generated method stub
		return super.getcustomerRequest();
	}

	@Override
	public void setcustomerRequest(String customerRequest) {
		// TODO Auto-generated method stub
		super.setcustomerRequest(customerRequest);
	}

	@Override
	public String getRegisterDate() {
		// TODO Auto-generated method stub
		return super.getRegisterDate();
	}

	@Override
	public void setRegisterDate(String registerDate) {
		// TODO Auto-generated method stub
		super.setRegisterDate(registerDate);
	}

	@Override
	public String getUnRegisterDate() {
		// TODO Auto-generated method stub
		return super.getUnRegisterDate();
	}

	@Override
	public void setUnRegisterDate(String unRegisterDate) {
		// TODO Auto-generated method stub
		super.setUnRegisterDate(unRegisterDate);
	}

	@Override
	public String getId() {
		// TODO Auto-generated method stub
		return super.getId();
	}

	@Override
	public void setId(String id) {
		// TODO Auto-generated method stub
		super.setId(id);
	}

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

	public SitterMemberDto(String id, String password, String name, int age, String gender, String address,
			String money, String phoneNumber, String bankAccount, String bankAccountMoney, int auth, String point,
			String customerRequest, String registerDate, String unRegisterDate) {
		super(id, password, name, age, gender, address, money, phoneNumber, bankAccount, bankAccountMoney, auth, point,
				customerRequest, registerDate, unRegisterDate);
	}
	

	public SitterMemberDto(String id, String password, String name, int age, String gender, String address,
			String money, String phoneNumber, String bankAccount, String bankAccountMoney, int auth, String point,
			String customerRequest, String registerDate, String unRegisterDate, String wantPay, String career,
			String profilePhoto, String introduce, String wantDate, String wantLocal, String wantTime) {
		super(id, password, name, age, gender, address, money, phoneNumber, bankAccount, bankAccountMoney, auth, point,
				customerRequest, registerDate, unRegisterDate);
		this.wantPay = wantPay;
		this.career = career;
		this.profilePhoto = profilePhoto;
		this.introduce = introduce;
		this.wantDate = wantDate;
		this.wantLocal = wantLocal;
		this.wantTime = wantTime;
	}

	@Override
	public String toString() {
		return "SitterMemberDto [license=" + license + ", wantPay=" + wantPay + ", career=" + career + ", hireDate="
				+ hireDate + ", expireDate=" + expireDate + ", profilePhoto=" + profilePhoto + ", introduce="
				+ introduce + ", startWorkDate=" + startWorkDate + ", endWorkDate=" + endWorkDate + ", wantDate="
				+ wantDate + ", wantLocal=" + wantLocal + ", wantTime=" + wantTime + "]";
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

}
