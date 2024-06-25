package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.OrderDAOImpl;
import com.DB.DBConnect;

@WebServlet("/update_Order")
@MultipartConfig
public class UpdateOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));

            OrderDAOImpl dao = new OrderDAOImpl(DBConnect.getConnection());
            boolean f = dao.approveProduct(id);

            HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("succMsg", "Order Updated Successfully");
            } else {
                session.setAttribute("failMsg", "Something went wrong");
            }
            resp.sendRedirect("orders.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            HttpSession session = req.getSession();
            session.setAttribute("failMsg", "An error occurred");
            resp.sendRedirect("orders.jsp");
        }
    }
}
