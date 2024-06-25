package com.entity;

import java.util.List;

public class Orders {
	public Orders() {
		super();
	}
	public Orders(int user_id, String email, String adress, int status, String phone, String created,
			String payment_method, int price , int product_Id) {
		
		User_id = user_id;
		Email = email;
		Adress = adress;
		Status = status;
		Phone = phone;
		Created = created;
		Payment_method = payment_method;
		Price= price;
		Product_Id =product_Id;
	}
	private int Order_id;
	private int User_id;
	private String Email;
	private String Adress;
	private int Status;
	private String Phone;
	private String Created;
	private String Payment_method;
	private int Price;
	private int Product_Id;
	public int getUser_id() {
		return User_id;
	}
	public void setUser_id(int user_id) {
		User_id = user_id;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getAdress() {
		return Adress;
	}
	public void setAdress(String adress) {
		Adress = adress;
	}
	public int getStatus() {
		return Status;
	}
	public void setStatus(int status) {
		Status = status;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getCreated() {
		return Created;
	}
	public void setCreated(String created) {
		Created = created;
	}
	public String getPayment_method() {
		return Payment_method;
	}
	public void setPayment_method(String payment_method) {
		Payment_method = payment_method;
	}
	@Override
	public String toString() {
		return "Orders [User_id=" + User_id + ", Email=" + Email + ", Adress=" + Adress + ", Status=" + Status
				+ ", Phone=" + Phone + ", Created=" + Created + ", Payment_method=" + Payment_method +", Price="+Price +", Products="+ Product_Id+"]";
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public int getProduct_Id() {
		return Product_Id;
	}
	public void setProduct_Id(int product_Id) {
		Product_Id = product_Id;
	}
	public int getOrder_id() {
		return Order_id;
	}
	public void setOrder_id(int order_id) {
		Order_id = order_id;
	}

	
}
