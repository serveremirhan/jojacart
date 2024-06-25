package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/Delete_Cart")
public class DeleteCartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnection());
			boolean f = dao.deleteCartItems(id);
			HttpSession session =req.getSession();
			 if (f) {
	            	

					session.setAttribute("succMsg", "Product Delete Successfully");
					resp.sendRedirect("basket.jsp");
				} else {
					session.setAttribute("failMsg", "SomeThing went wrong");
					resp.sendRedirect("basket.jsp");
				}
		} catch (Exception e){
			// TODO: handle exception
		}
	}
	
	

}
