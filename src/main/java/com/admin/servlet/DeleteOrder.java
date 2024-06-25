package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.OrderDAOImpl;
import com.DB.DBConnect;
@WebServlet("/Delete_Orders")
public class DeleteOrder extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			System.out.println("silincek id "+ id);
			OrderDAOImpl dao= new OrderDAOImpl(DBConnect.getConnection());
			boolean f =dao.deleteOrders(id);
			HttpSession session = req.getSession();
			
			 if (f) {
					session.setAttribute("succMsg", "Order Delete Successfully");
					resp.sendRedirect("orders.jsp");
				} else {
					session.setAttribute("failMsg", "Something went wronggggggg");
					resp.sendRedirect("orders.jsp");
				}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	

}
