package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.apache.catalina.User;

import com.entity.Users;
import com.entity.cart_items;

public class UserDAOImpl implements UserDAO {

    private Connection conn;

    public UserDAOImpl(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean userRegister(Users us) {
        boolean f = false;
        String mssql = "INSERT INTO [Users] (Password, Email, Phone, First_name, Last_name, Address) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(mssql)) {
            ps.setString(1, us.getPassword());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhone());
            ps.setString(4, us.getFrist_name());
            ps.setString(5, us.getLast_name());
            ps.setString(6, us.getAdress());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Hata yönetimi, loglama vb. yapılabilir.
        }
        return f;
    }

	@Override
	public Users login(String email, String password) {
		Users us = null;
		try {
			String sql = "select * from Users where email=? and password=?";
			
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, email);
	        ps.setString(2, password);
	        
	    
	        ResultSet rs = ps.executeQuery();
	        
	      
	        while (rs.next()) {
	            us = new Users();
	            us.setAdmin(rs.getInt("Admin"));
	            us.setUser_id(rs.getInt("User_id"));
	            us.setFrist_name(rs.getString("First_name")); 
	            us.setLast_name(rs.getString("Last_name")); 
	            us.setAdress(rs.getString("Adress")); 
	            us.setPhone(rs.getString("Phone")); 
	            us.setPassword(rs.getString("Password")); 
	            us.setEmail(rs.getString("Email"));
	           
	          
	        }
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return us;
	}

	@Override
	public String UserNameById(int UserID) {
		String UserName = null;
		Users u = null;
		try {

			String sql = "SELECT * FROM Users";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			 while (rs.next()) {
				 u = new Users();
				 u.setUser_id(rs.getInt(1));
				 u.setFrist_name(rs.getString(5));	
				 u.setLast_name(rs.getString(6));
				 
				 
				  if (UserID == u.getUser_id()) {
	                    UserName = u.getFrist_name()+" "+ u.getLast_name();
	                } else {
	                    System.out.println("ürün eklenmedi " + u.getUser_id());
	                }
			 }
		} catch (Exception e) {
		       e.printStackTrace();
		}
		
		return UserName;
	}
    
    
}
