package com.entity;

public class Users {
	private int User_id;
	private String Password;
	private String Email;
	private String Phone;
	private String Frist_name;
	private String Last_name;
	private String Adress;
	private int Admin;
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getUser_id() {
		return User_id;
	}
	public void setUser_id(int user_id) {
		User_id = user_id;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getFrist_name() {
		return Frist_name;
	}
	public void setFrist_name(String frist_name) {
		Frist_name = frist_name;
	}
	public String getLast_name() {
		return Last_name;
	}
	public void setLast_name(String last_name) {
		Last_name = last_name;
	}
	public String getAdress() {
		return Adress;
	}
	public void setAdress(String adress) {
		Adress = adress;
	}
	public int getAdmin() {
		return Admin;
	}
	public void setAdmin(int admin) {
		Admin = admin;
	}
	@Override
	public String toString() {
		return "Users [User_id=" + User_id + ", Password=" + Password + ", Email=" + Email + ", Phone=" + Phone
				+ ", Frist_name=" + Frist_name + ", Last_name=" + Last_name + ", Adress=" + Adress + ", Admin=" + Admin
				+ "]";
	}
	
}
