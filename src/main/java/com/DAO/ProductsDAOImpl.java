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

public class ProductsDAOImpl implements ProductsDAO {

    private Connection conn;

    public ProductsDAOImpl(Connection conn) {
        this.conn = conn;
    }

    @Override
    public boolean addProducts(Products p) {
        boolean f = false;
        try {
            String sql = "INSERT INTO Products (Catagory_name, Title, Descirption, Sale_price, Admin_id, Photo_name) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getCatagory_name());
            ps.setString(2, p.getTitle());
            ps.setString(3, p.getDescirption());
            ps.setString(4, p.getSale_price());
            ps.setInt(5, p.getAdmin_id());
            ps.setString(6, p.getPhoto_name());
            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public List<Products> getMyProducts(HttpServletRequest req) {
        List<Products> list = new ArrayList<Products>();
        Products p = null;

        try {
            HttpSession session = req.getSession();
            int adminId = (int) session.getAttribute("adminId");

            String sql = "SELECT * FROM Products";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Products();
                p.setProduct_id(rs.getInt(1));
                p.setCatagory_name(rs.getString(2));
                p.setTitle(rs.getString(3));
                p.setDescirption(rs.getString(4));
                p.setSale_price(rs.getString(5));
                p.setAdmin_id(rs.getInt(6));
                p.setPhoto_name(rs.getString(7));

                if (adminId == p.getAdmin_id()) {
                    list.add(p);
                } else {
                    System.out.println("ürün eklenmedi " + p.getAdmin_id());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

	@Override
	public Products getProductById(int id) {
		Products p = null;
		try {
			String sql = "SELECT * FROM Products WHERE Product_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				p = new Products();
                p.setProduct_id(rs.getInt(1));
                p.setCatagory_name(rs.getString(2));
                p.setTitle(rs.getString(3));
                p.setDescirption(rs.getString(4));
                p.setSale_price(rs.getString(5));
                p.setAdmin_id(rs.getInt(6));
                p.setPhoto_name(rs.getString(7));

				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return p;
	}

	@Override
	public boolean updateEditProducts(Products p) {
	    boolean f = false;

	    try {
	        // Update query for SQL Server
	        String sql = "UPDATE Products SET Catagory_name = ?, Title = ?, Sale_price = ?, Descirption = ?, Photo_name = ? WHERE Product_id = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);

	        ps.setString(1, p.getCatagory_name());
	        ps.setString(2, p.getTitle());
	        ps.setString(3, p.getSale_price());
	        ps.setString(4, p.getDescirption());
	        ps.setString(5, p.getPhoto_name());
	        ps.setInt(6, p.getProduct_id());

	        int i = ps.executeUpdate();
	        if (i == 1) {
	            f = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace(); // Print the exception for debugging purposes
	    }

	    return f;
	}

	@Override
	public boolean deleteProducts(int id) {
		boolean f =false;
		try {
			String sql="DELETE FROM Products WHERE Product_id = ?";
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
	public List<Products> getAllProducts() {
		List<Products> list =new ArrayList<Products>();
		
		try {
			Products p =null;
            String sql = "SELECT * FROM Products";
            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Products();
                p.setProduct_id(rs.getInt(1));
                p.setCatagory_name(rs.getString(2));
                p.setTitle(rs.getString(3));
                p.setDescirption(rs.getString(4));
                p.setSale_price(rs.getString(5));
                p.setAdmin_id(rs.getInt(6));
                p.setPhoto_name(rs.getString(7));
                
                list.add(p);
                

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	
		
		
		
		return list;
	}

	@Override
	public List<Products> getProductByCatagories(String Category) {
		
			List<Products> list =new ArrayList<Products>();
		
		try {
			Products p =null;
            String sql = "SELECT * FROM Products WHERE Catagory_name = ?";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, Category);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Products();
                p.setProduct_id(rs.getInt(1));
                p.setCatagory_name(rs.getString(2));
                p.setTitle(rs.getString(3));
                p.setDescirption(rs.getString(4));
                p.setSale_price(rs.getString(5));
                p.setAdmin_id(rs.getInt(6));
                p.setPhoto_name(rs.getString(7));
                
                list.add(p);
                

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	
		
		
		
		return list;
	
	}

	@Override
	public List<Products> getProductBySearch(String ch) {
List<Products> list =new ArrayList<Products>();
		
		try {
			Products p =null;
			String sql = "SELECT * FROM Products WHERE Title LIKE ? OR Catagory_name LIKE ?";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+ch+"%");
            ps.setString(2, "%"+ch+"%");
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                p = new Products();
                p.setProduct_id(rs.getInt(1));
                p.setCatagory_name(rs.getString(2));
                p.setTitle(rs.getString(3));
                p.setDescirption(rs.getString(4));
                p.setSale_price(rs.getString(5));
                p.setAdmin_id(rs.getInt(6));
                p.setPhoto_name(rs.getString(7));
                
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	
		
		
		
		return list;
	}

	
	
}
