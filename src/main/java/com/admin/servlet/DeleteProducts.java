package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ProductsDAOImpl;
import com.DB.DBConnect;

@WebServlet("/Delete_Servlet")
public class DeleteProducts extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			
			ProductsDAOImpl dao= new ProductsDAOImpl(DBConnect.getConnection());
			boolean f =dao.deleteProducts(id);
			HttpSession session = req.getSession();
			
			 if (f) {
	            	

					session.setAttribute("succMsg", "Product Delete Successfully");
					resp.sendRedirect("products.jsp");
				} else {
					session.setAttribute("failMsg", "SomeThing went wrong");
					resp.sendRedirect("products.jsp");
				}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
