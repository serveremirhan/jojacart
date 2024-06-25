package com.user.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.OrderDAOImpl;
import com.DB.DBConnect;
import com.entity.Orders;
import com.entity.Products;
import com.entity.Users;
import com.entity.cart_items;

@WebServlet("/add_Orders")
@MultipartConfig
public class OrdersServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			Users user = (Users)session.getAttribute("userobj");
		
			int userId = user.getUser_id();
			
			List<Integer> products_id = (List<Integer>) session.getAttribute("OrdersProduct_id");;
			System.out.println(products_id);
			int size = products_id.size();
	        LocalDateTime now = LocalDateTime.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	        String formattedDateTime = now.format(formatter);

			int User_id= userId;
			String Email = req.getParameter("Email");
			String Adress =req.getParameter("Adress");
			int Status = 1;
			String Phone = req.getParameter("Phone");
			String Created = formattedDateTime;
			String Payment_method = req.getParameter("Payment");
			System.out.println(Payment_method);
			int Price =1;
			int i =0;
			CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConnection());
			List<Integer> c = dao2.getCartItemsById(User_id);
			
			
			while (i<size) {
				int selectedID = products_id.get(i);
				int selectedCartID = c.get(i);
				Orders order = new Orders(User_id, Email, Adress, Status, Phone, Created, Payment_method, Price, selectedID);
				System.out.println(order);
				
				OrderDAOImpl dao = new OrderDAOImpl(DBConnect.getConnection());
				Boolean isOrderAdded = dao.addOrder(order);
				
				
				if(isOrderAdded) {
					session.setAttribute("succMsg", "Order Add Successfully");
					dao2.deleteCartItems(selectedCartID);
				}
				else {
				session.setAttribute("failMsg", "something went wrong");
				}
				i++;	
			}
			
			
			if ("credit-card".equals(Payment_method)){
				resp.sendRedirect("payment.jsp");
			}else {
				resp.sendRedirect("successfull.jsp");
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	

}
