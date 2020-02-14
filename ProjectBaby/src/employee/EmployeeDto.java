package employee;

import java.util.Arrays;

public class EmployeeDto{

	private String id;
	private String password;
	private String name;
	private int age;
	private String gender;
	private String address;

	private String money;
	private String phoneNumber;
	private String bankAccount;
	private String bankAccountMoney;

	private int auth;
	private String point;
	private String customerRequestDate;

	private String registerDate;
	private String unRegisterDate;

	//여기서부터 Sitter에서만 받아오는 부분
	private String license;
	private String wantPay;
	private String career;

	private String hireDate;
	private String expireDate;

	private String profilePhoto;
	private String introduce;
	private String startWorkDate;
	private String endWorkDate;

	private String[] wantDate;
	private String wantLocal;
	private String wantTime;


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getBankAccount() {
		return bankAccount;
	}
	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}
	public String getBankAccountMoney() {
		return bankAccountMoney;
	}
	public void setBankAccountMoney(String bankAccountMoney) {
		this.bankAccountMoney = bankAccountMoney;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	public String getCustomerRequestDate() {
		return customerRequestDate;
	}
	public void setCustomerRequestDate(String customerRequestDate) {
		this.customerRequestDate = customerRequestDate;
	}
	public String getRegisterDate() {
		return registerDate;
	}
	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}
	public String getUnRegisterDate() {
		return unRegisterDate;
	}
	public void setUnRegisterDate(String unRegisterDate) {
		this.unRegisterDate = unRegisterDate;
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
	public String[] getWantDate() {
		return wantDate;
	}
	public void setWantDate(String[] wantDate) {
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

	//사용자가 검색할때 항목들
	public EmployeeDto(int age, String gender, String license, String wantPay, String career,
			String[] wantDate, String wantLocal, String wantTime) {
		super();
		this.age = age;
		this.gender = gender;
		this.license = license;
		this.wantPay = wantPay;
		this.career = career;
		this.wantDate = wantDate;
		this.wantLocal = wantLocal;
		this.wantTime = wantTime;
	}


	//시터리스트 뿌릴 것
	public EmployeeDto(String name, int age, String gender, String phoneNumber, String license,
			String wantPay, String career, String hireDate, String profilePhoto, String introduce, String wantLocal) {
		super();
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.phoneNumber = phoneNumber;
		this.license = license;
		this.wantPay = wantPay;
		this.career = career;
		this.hireDate = hireDate;
		this.profilePhoto = profilePhoto;
		this.introduce = introduce;
		this.wantLocal = wantLocal;
	}


	@Override
	public String toString() {
		return "EmployeeDto [id=" + id + ", password=" + password + ", name=" + name + ", age=" + age + ", gender="
				+ gender + ", address=" + address + ", money=" + money + ", phoneNumber=" + phoneNumber
				+ ", bankAccount=" + bankAccount + ", bankAccountMoney=" + bankAccountMoney + ", auth=" + auth
				+ ", point=" + point + ", customerRequestDate=" + customerRequestDate + ", registerDate=" + registerDate
				+ ", unRegisterDate=" + unRegisterDate + ", license=" + license + ", wantPay=" + wantPay + ", career="
				+ career + ", hireDate=" + hireDate + ", expireDate=" + expireDate + ", profilePhoto=" + profilePhoto
				+ ", introduce=" + introduce + ", startWorkDate=" + startWorkDate + ", endWorkDate=" + endWorkDate
				+ ", wantDate=" + Arrays.toString(wantDate) + ", wantLocal=" + wantLocal + ", wantTime=" + wantTime
				+ "]";
	}



}
