package com.wipro.ctb.user.model;

public class StoringUserDetails {
	private static String UserID;
	private static String Password;
	private static String FirstName;
	private static String LastName;
	private static String DateofBirth;
	private static String Gender;
	private static String loc;
	public static String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		StoringUserDetails.loc = loc;
	}
	private static String PresentAddress;
	private static String PermanentAddress;
	private static String MobileNo;
	private static String MailID;
	public static String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		this.UserID = userID;
	}
	public static String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		this.Password = password;
	}
	public static String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		this.FirstName = firstName;
	}
	public static String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		this.LastName = lastName;
	}
	public static String getDateofBirth() {
		return DateofBirth;
	}
	public void setDateofBirth(String dateofBirth) {
		this.DateofBirth = dateofBirth;
	}
	public static String getGender() {
		return Gender;
	}
	public void setGender(String c) {
		this.Gender = c;
	}
	public static String getPresentAddress() {
		return PresentAddress;
	}
	public void setPresentAddress(String presentAddress) {
		this.PresentAddress = presentAddress;
	}
	public static String getPermanentAddress() {
		return PermanentAddress;
	}
	public void setPermanentAddress(String permanentAddress) {
		this.PermanentAddress = permanentAddress;
	}
	public static String getMobileNo() {
		return MobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.MobileNo = mobileNo;
	}
	public static String getMailID() {
		return MailID;
	}
	public void setMailID(String MailID) {
		StoringUserDetails.MailID = MailID;
	}
	
}
