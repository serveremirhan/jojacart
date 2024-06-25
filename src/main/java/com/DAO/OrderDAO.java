package com.DAO;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.entity.Orders;



public interface OrderDAO {
	public boolean addOrder(Orders o);
	
	public List<Orders> listMyOrders(HttpServletRequest req);
	
	public List<Orders> listAdminOrders(HttpServletRequest req);
	
	public boolean deleteOrders(int id);
	
	public boolean approveProduct(int id);
}
