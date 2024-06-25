package com.DAO;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.entity.cart_items;

public interface CartDAO {
	public boolean cartAdd(cart_items c);
	
	public List<cart_items> getMyCartItems(HttpServletRequest req);
	
	public boolean deleteCartItems(int id);
	
	public List<Integer> getCartItemsById(int id);
	
	
}
