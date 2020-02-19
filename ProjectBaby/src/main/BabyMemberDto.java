package main;

import java.io.Serializable;
import java.util.Arrays;

public class BabyMemberDto implements Serializable {

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

	// 여기서부터 Sitter에서만 받아오는 부분
	private String license;
	private String wantPay;
	private String career;

	private String hireDate; // 시터 입사일
	private String expireDate; // 시터 해고일

	private String profilePhoto;
	private String introduce;
	private String startWorkDate; // 일반회원이 시터 고용시작
	private String endWorkDate; // 일반회원이 시터 고용끝

	private String[] wantDate;
	private String wantLocal;
	private String wantTime;

	// 수정
	// 추가된 부분
	private String sitterId; // 예약자 아이디

	private String requestReceiveDate; // 예약받을경우 예약 받은날짜

	private String fileName;

	private String realFileName;

	private String userId;

	private String workingHour;

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

	public String getCustomerRequestDate() {
		return customerRequestDate;
	}

	public void setCustomerRequestDate(String customerRequestDate) {
		this.customerRequestDate = customerRequestDate;
	}

	public String getSitterId() {
		return sitterId;
	}

	public void setSitterId(String sitterId) {
		this.sitterId = sitterId;
	}

	public String getRequestReceiveDate() {
		return requestReceiveDate;
	}

	public void setRequestReceiveDate(String requestReceiveDate) {
		this.requestReceiveDate = requestReceiveDate;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getRealFileName() {
		return realFileName;
	}

	public void setRealFileName(String realFileName) {
		this.realFileName = realFileName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getWorkingHour() {
		return workingHour;
	}

	public void setWorkingHour(String workingHour) {
		this.workingHour = workingHour;
	}

	@Override
	public String toString() {
		return "BabyMemberDto [id=" + id + ", password=" + password + ", name=" + name + ", age=" + age + ", gender="
				+ gender + ", address=" + address + ", money=" + money + ", phoneNumber=" + phoneNumber
				+ ", bankAccount=" + bankAccount + ", bankAccountMoney=" + bankAccountMoney + ", auth=" + auth
				+ ", point=" + point + ", customerRequestDate=" + customerRequestDate + ", registerDate=" + registerDate
				+ ", unRegisterDate=" + unRegisterDate + ", license=" + license + ", wantPay=" + wantPay + ", career="
				+ career + ", hireDate=" + hireDate + ", expireDate=" + expireDate + ", profilePhoto=" + profilePhoto
				+ ", introduce=" + introduce + ", startWorkDate=" + startWorkDate + ", endWorkDate=" + endWorkDate
				+ ", wantDate=" + Arrays.toString(wantDate) + ", wantLocal=" + wantLocal + ", wantTime=" + wantTime
				+ ", SitterId=" + sitterId + ", requestReceiveDate=" + requestReceiveDate + ", fileName=" + fileName
				+ ", realFileName=" + realFileName + ", userId=" + userId + ", workingHour=" + workingHour + "]";
	}

	public BabyMemberDto() {
		// TODO Auto-generated constructor stub
	}
	public BabyMemberDto(String id, String password, String name, int age, String gender, String address, String money,
			String phoneNumber, String bankAccount, String bankAccountMoney, int auth, String point,
			String customerRequestDate, String registerDate, String unRegisterDate, String license, String wantPay,
			String career, String hireDate, String expireDate, String profilePhoto, String introduce,
			String startWorkDate, String endWorkDate, String[] wantDate, String wantLocal, String wantTime) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.money = money;
		this.phoneNumber = phoneNumber;
		this.bankAccount = bankAccount;
		this.bankAccountMoney = bankAccountMoney;
		this.auth = auth;
		this.point = point;
		this.customerRequestDate = customerRequestDate;
		this.registerDate = registerDate;
		this.unRegisterDate = unRegisterDate;
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

	public BabyMemberDto(String id, String name, int age, String gender, String address, String money,
			String phoneNumber, String bankAccount, String bankAccountMoney, int auth, String point,
			String customerRequestDate, String registerDate, String unRegisterDate, String license, String wantPay,
			String career, String hireDate, String expireDate, String profilePhoto, String introduce,
			String startWorkDate, String endWorkDate, String[] wantDate, String wantLocal, String wantTime) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.money = money;
		this.phoneNumber = phoneNumber;
		this.bankAccount = bankAccount;
		this.bankAccountMoney = bankAccountMoney;
		this.auth = auth;
		this.point = point;
		this.customerRequestDate = customerRequestDate;
		this.registerDate = registerDate;
		this.unRegisterDate = unRegisterDate;
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

	public BabyMemberDto(String id, String password, String name, int age, String gender, String address,
			String phoneNumber, String wantPay, String career, String introduce, String[] wantDate, String wantLocal,
			String wantTime) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.wantPay = wantPay;
		this.career = career;
		this.introduce = introduce;
		this.wantDate = wantDate;
		this.wantLocal = wantLocal;
		this.wantTime = wantTime;
	}

	public BabyMemberDto(String id, String password, String name, int age, String gender, String address,
			String phoneNumber) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.phoneNumber = phoneNumber;
	}

	public BabyMemberDto(String id, String address, String phoneNumber, String bankAccount, int auth, String license,
			String wantPay, String career, String introduce, String[] wantDate, String wantLocal, String wantTime) {
		super();
		this.id = id;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.bankAccount = bankAccount;
		this.auth = auth;
		this.license = license;
		this.wantPay = wantPay;
		this.career = career;
		this.introduce = introduce;
		this.wantDate = wantDate;
		this.wantLocal = wantLocal;
		this.wantTime = wantTime;
	}

	public BabyMemberDto(String id, String address, String phoneNumber, String bankAccount, int auth) {
		super();
		this.id = id;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.bankAccount = bankAccount;
		this.auth = auth;
	}

	// 시터 검색하기 (성별, 자격, 원하는시급, 경력, 원하는 날짜, 원하는 지역, 원하는 시간)
	public BabyMemberDto(String gender, String license, String career, String[] wantDate, String wantLocal,
			String wantTime) {
		super();
		this.gender = gender;
		this.license = license;
		this.career = career;
		this.wantDate = wantDate;
		this.wantLocal = wantLocal;
		this.wantTime = wantTime;
	}

	// 시터 리스트 뿌리기(이름, 나이, 성별, 폰번호, 자격, 원하는 시급, 경력, 고용날짜, 이력서 사진, 소개, 원하는 지역)
	public BabyMemberDto(String name, int age, String gender, String phoneNumber, String license, String wantPay,
			String career, String hireDate, String profilePhoto, String introduce, String wantLocal) {
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

	public BabyMemberDto(String id, String name, int age, String gender, String address, String money,
			String phoneNumber, String bankAccount, String bankAccountMoney, int auth, String point,
			String customerRequestDate, String registerDate, String unRegisterDate, String license, String wantPay,
			String career, String hireDate, String expireDate, String profilePhoto, String introduce,
			String startWorkDate, String endWorkDate, String[] wantDate, String wantLocal, String wantTime,
			String sitterId, String requestReceiveDate) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.money = money;
		this.phoneNumber = phoneNumber;
		this.bankAccount = bankAccount;
		this.bankAccountMoney = bankAccountMoney;
		this.auth = auth;
		this.point = point;
		this.customerRequestDate = customerRequestDate;
		this.registerDate = registerDate;
		this.unRegisterDate = unRegisterDate;
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
		this.sitterId = sitterId;
		this.requestReceiveDate = requestReceiveDate;
	}

	public BabyMemberDto(String id, String name, int age, String gender, String address, String money,
			String phoneNumber, String bankAccount, String bankAccountMoney, int auth, String point,
			String customerRequestDate, String registerDate, String unRegisterDate, String license, String wantPay,
			String career, String hireDate, String expireDate, String profilePhoto, String introduce,
			String startWorkDate, String endWorkDate, String[] wantDate, String wantLocal, String wantTime,
			String sitterId, String requestReceiveDate, String fileName, String realFileName, String userId) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.money = money;
		this.phoneNumber = phoneNumber;
		this.bankAccount = bankAccount;
		this.bankAccountMoney = bankAccountMoney;
		this.auth = auth;
		this.point = point;
		this.customerRequestDate = customerRequestDate;
		this.registerDate = registerDate;
		this.unRegisterDate = unRegisterDate;
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
		this.sitterId = sitterId;
		this.requestReceiveDate = requestReceiveDate;
		this.fileName = fileName;
		this.realFileName = realFileName;
		this.userId = userId;
	}

	public BabyMemberDto(String id, String password, String name, int age, String gender, String address, String money,
			String phoneNumber, String bankAccount, String bankAccountMoney, int auth, String point,
			String customerRequestDate, String registerDate, String unRegisterDate, String license, String wantPay,
			String career, String hireDate, String expireDate, String profilePhoto, String introduce,
			String startWorkDate, String endWorkDate, String[] wantDate, String wantLocal, String wantTime,
			String sitterId, String requestReceiveDate, String fileName, String realFileName, String userId) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.address = address;
		this.money = money;
		this.phoneNumber = phoneNumber;
		this.bankAccount = bankAccount;
		this.bankAccountMoney = bankAccountMoney;
		this.auth = auth;
		this.point = point;
		this.customerRequestDate = customerRequestDate;
		this.registerDate = registerDate;
		this.unRegisterDate = unRegisterDate;
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
		this.sitterId = sitterId;
		this.requestReceiveDate = requestReceiveDate;
		this.fileName = fileName;
		this.realFileName = realFileName;
		this.userId = userId;
	}
	
	public BabyMemberDto(String name, int age, String gender, String money, String phoneNumber, String customerRequestDate,
			String registerDate, String license, String wantPay, String career, String hireDate, String expireDate, String profilePhoto,
			String startWorkDate, String endWorkDate, String wantLocal, String wantTime,
			String sitterId, String requestReceiveDate) {
		super();
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.money = money;
		this.phoneNumber = phoneNumber;
		this.customerRequestDate = customerRequestDate;
		this.registerDate = registerDate;
		this.license = license;
		this.wantPay = wantPay;
		this.career = career;
		this.hireDate = hireDate;
		this.expireDate = expireDate;
		this.profilePhoto = profilePhoto;
		this.startWorkDate = startWorkDate;
		this.endWorkDate = endWorkDate;
		this.wantLocal = wantLocal;
		this.wantTime = wantTime;
		this.sitterId = sitterId;
		this.requestReceiveDate = requestReceiveDate;
	}

}
