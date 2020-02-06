package main;

public class BabyMemberDto {

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
	   private String customerRequest;
	   
	   private String registerDate;
	   private String unRegisterDate;
	   public BabyMemberDto(String id, String password, String name, int age, String gender, String address, String money,
	         String phoneNumber, String bankAccount, String bankAccountMoney, int auth, String point,
	         String customerRequest, String registerDate, String unRegisterDate) {
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
	      this.customerRequest = customerRequest;
	      this.registerDate = registerDate;
	      this.unRegisterDate = unRegisterDate;
	   }
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
	   public String getcustomerRequest() {
	      return customerRequest;
	   }
	   public void setcustomerRequest(String customerRequest) {
	      this.customerRequest = customerRequest;
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
	   @Override
	   public String toString() {
	      return "BabyMemberDto [id=" + id + ", password=" + password + ", name=" + name + ", age=" + age + ", gender="
	            + gender + ", address=" + address + ", money=" + money + ", phoneNumber=" + phoneNumber
	            + ", bankAccount=" + bankAccount + ", bankAccountMoney=" + bankAccountMoney + ", auth=" + auth
	            + ", point=" + point + ", customerRequest=" + customerRequest + ", registerDate=" + registerDate
	            + ", unRegisterDate=" + unRegisterDate + "]";
	   }
	   
	   
}
	   
	   
