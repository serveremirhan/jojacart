package com.entity;

public class Products {


	private int Product_id;
	private String Catagory_name;
	private String Title;
	private String Descirption;
	private String Photo_name;
	private String Sale_price;
	private int Admin_id;
	public Products() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Products(String catagory_name, String title, String descirption, String photo_name, String sale_price,
			int admin_id) {
		
		Catagory_name = catagory_name;
		Title = title;
		Descirption = descirption;
		Photo_name = photo_name;
		Sale_price = sale_price;
		Admin_id = admin_id;
	}
	public int getProduct_id() {
		return Product_id;
	}
	public void setProduct_id(int product_id) {
		Product_id = product_id;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}

	public String getDescirption() {
		return Descirption;
	}
	public void setDescirption(String descirption) {
		Descirption = descirption;
	}
	public String getSale_price() {
		return Sale_price;
	}
	public void setSale_price(String sale_price) {
		Sale_price = sale_price;
	}
	public String getCatagory_name() {
		return Catagory_name;
	}
	public void setCatagory_name(String catagory_name) {
		Catagory_name = catagory_name;
	}
	public String getPhoto_name() {
		return Photo_name;
	}
	public void setPhoto_name(String photo_name) {
		Photo_name = photo_name;
	}
	public int getAdmin_id() {
		return Admin_id;
	}
	public void setAdmin_id(int admin_id) {
		Admin_id = admin_id;
	}
	@Override
	public String toString() {
		return "Products [Product_id=" + Product_id + ", Catagory_id=" + Catagory_name + ", Title=" + Title
				+ ", Descirption=" + Descirption + ", Photo_name=" + Photo_name + ", Sale_price=" + Sale_price
				+ ", Admin_id=" + Admin_id + "]";
	}

	
}
