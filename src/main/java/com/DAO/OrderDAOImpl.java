package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.PseudoColumnUsage;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.entity.Orders;
import com.entity.Products;
import com.entity.Users;

public class OrderDAOImpl implements OrderDAO{

	private Connection conn;
	
	public OrderDAOImpl(Connection conn) {
		this.conn = conn;
	}
	
	@Override
	public boolean addOrder(Orders o) {
		boolean f= false;

		try {
			  String sql = "INSERT INTO Orders (User_id, Email, Phone, Adress, Status, Created, Payment_method, Price, Product_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setInt(1, o.getUser_id());
	            ps.setString(2, o.getEmail());
	            ps.setString(3, o.getPhone());
	            ps.setString(4, o.getAdress());
	            ps.setInt(5, o.getStatus());
	            ps.setString(6, o.getCreated());
	            ps.setString(7, o.getPayment_method());
	            ps.setInt(8, o.getPrice());
	            ps.setInt(9, o.getProduct_Id());
	            int i = ps.executeUpdate();
	            
	            
	            if (i == 1) {
	                f = true;
	            }

		} catch (Exception e) {
			// TODO: handle exception
		}
		return f;
	}

	@Override
	public List<Orders> listMyOrders(HttpServletRequest req) {
		List<Orders> list = new ArrayList<Orders>();
		Orders o= null;

		 try {
				HttpSession session =req.getSession();
				Users user = (Users)session.getAttribute("userobj");
				int User_id = user.getUser_id();
				

	            String sql = "SELECT * FROM Orders";
	            PreparedStatement ps = conn.prepareStatement(sql);

	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	            	
	            	o =new Orders();
	            	o.setOrder_id(rs.getInt(1));
	            	o.setUser_id(rs.getInt(2));
	            	o.setEmail(rs.getString(3));
	            	o.setPhone(rs.getString(4));
	            	o.setAdress(rs.getString(5));
	            	o.setStatus(rs.getInt(6));
	            	o.setCreated(rs.getString(7));
	            	o.setPayment_method(rs.getString(8));
	            	o.setPrice(rs.getInt(9));
	            	o.setProduct_Id(rs.getInt(10));
	            	
	                if (User_id == o.getUser_id()) {
	                    list.add(o);
	                } else {
	                    System.out.println(o.getUser_id());
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
		
		return list;
	}

	@Override
	public List<Orders> listAdminOrders(HttpServletRequest req) {
		List<Orders> list = new ArrayList<Orders>();
		Orders o= null;

		 try {
				HttpSession session =req.getSession();
				Users user = (Users)session.getAttribute("userobj");
				int User_id = user.getUser_id();
				

	            String sql = "SELECT * FROM Orders";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ProductsDAOImpl dao = new ProductsDAOImpl(DBConnect.getConnection());
	            
	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	            	
	            	o =new Orders();
	            	o.setOrder_id(rs.getInt(1));
	            	o.setUser_id(rs.getInt(2));
	            	o.setEmail(rs.getString(3));
	            	o.setPhone(rs.getString(4));
	            	o.setAdress(rs.getString(5));
	            	o.setStatus(rs.getInt(6));
	            	o.setCreated(rs.getString(7));
	            	o.setPayment_method(rs.getString(8));
	            	o.setPrice(rs.getInt(9));
	            	o.setProduct_Id(rs.getInt(10));
	            	
	            	int productId =o.getProduct_Id();
	            	Products p = dao.getProductById(productId);
	            	
	            	
	                if (User_id == p.getAdmin_id()) {
	                    list.add(o);
	                } else {
	                    System.out.println(o.getUser_id());
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
		
		return list;
	}

	@Override
	public boolean deleteOrders(int id) {
		boolean f = false;
		
		try {
			String sql="DELETE FROM Orders WHERE Order_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i==1) {
				f=true;
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		
		return f;
	}

	@Override
	public boolean approveProduct(int id) {
		boolean f = false;
		
		try {
			String sql = "UPDATE Orders SET Status = ? WHERE Order_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, 2);
			ps.setInt(2, id);
			 int i = ps.executeUpdate();
		        if (i == 1) {
		            f = true;
		        }		
		} catch (Exception e) {
			// TODO: handle exception
		}	
		return f;
	}
}
