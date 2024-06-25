package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.entity.Products;
import com.entity.Users;
import com.entity.cart_items;

public class CartDAOImpl implements CartDAO{
	
	
	private Connection conn;
	public CartDAOImpl(Connection conn) 
	{
		this.conn=conn;
	}
	
	
	@Override
	public boolean cartAdd(cart_items c) {
		boolean f= false;
		
		try {
            String sql = "INSERT INTO cart_items (Product_id, User_id, Quantity) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, c.getProduct_id());
            ps.setInt(2, c.getUser_id());
            ps.setInt(3, c.getQuantity());


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
	public List<cart_items> getMyCartItems(HttpServletRequest req) {
		List<cart_items> list = new ArrayList<cart_items>();
		cart_items c = null;
		try {
			HttpSession session =req.getSession();
			Users user = (Users)session.getAttribute("userobj");
			int User_id = user.getUser_id();
			
			String sql= "SELECT * FROM cart_items";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			 while (rs.next()) {
				 c = new cart_items();
				 c.setCartitem_id(rs.getInt(1));
				 c.setProduct_id(rs.getInt(2));	
				 c.setUser_id(rs.getInt(3));
				 c.setQuantity(rs.getInt(4));
				 
				  if (User_id == c.getUser_id()) {
	                    list.add(c);
	                } else {
	                    System.out.println("ürün eklenmedi " + c.getUser_id());
	                }
			 }
		} catch (Exception e) {
		       e.printStackTrace();
		}
		return list;
	}


	@Override
	public boolean deleteCartItems(int id) {
		boolean f = false;
			try {
				String sql= "DELETE FROM cart_items WHERE cartitem_id = ?";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setInt(1, id);
				int i =ps.executeUpdate();
				if (i==1) {
					f=true;
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		
		return f;
	}


	@Override
	public List<Integer> getCartItemsById(int id) {
		  List<Integer> list = new ArrayList<Integer>();
	        
		try {
			
			String sql = "SELECT * FROM cart_items WHERE User_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				int c = rs.getInt(1);
               
                list.add(c);
                
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return list;
	}

}
