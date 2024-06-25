package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.CartDAOImpl;
import com.DAO.ProductsDAOImpl;
import com.DB.DBConnect;
import com.entity.cart_items;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	

		try {
			int Product_id=Integer.parseInt(req.getParameter("Product_id"));
			int User_id =Integer.parseInt(req.getParameter("User_id"));
			int Quantity = 1;
			
			
			
			
			cart_items c = new cart_items(Product_id, User_id, Quantity);
			CartDAOImpl dao =new CartDAOImpl(DBConnect.getConnection());
			System.out.println(c);
			
			
			boolean f =dao.cartAdd(c);
			
			
			if (f) {
				resp.sendRedirect("productspage.jsp?Product_id="+req.getParameter("Product_id"));
				System.out.println("eklendi");
			}else {
				System.out.println("eklenmedi");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	
}
