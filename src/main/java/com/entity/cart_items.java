package com.entity;

public class cart_items {
	public cart_items(int product_id, int user_id, int quantity) {
		
		Product_id = product_id;
		User_id = user_id;
		Quantity = quantity;
	}
	public cart_items() {
		super();
	}
	private int Product_id;
	private int User_id;
	private int Quantity;
	private int Cartitem_id;
	
	
	public int getProduct_id() {
		return Product_id;
	}
	public void setProduct_id(int product_id) {
		Product_id = product_id;
	}
	public int getUser_id() {
		return User_id;
	}
	public void setUser_id(int user_id) {
		User_id = user_id;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public int getCartitem_id() {
		return Cartitem_id;
	}
	public void setCartitem_id(int cartitem_id) {
		Cartitem_id = cartitem_id;
	}
	@Override
	public String toString() {
		return "cart_item [Product_id=" + Product_id + ", User_id=" + User_id + ", Quantity=" + Quantity
				+ ", Cartitem_id=" + Cartitem_id + "]";
	}
	
}
