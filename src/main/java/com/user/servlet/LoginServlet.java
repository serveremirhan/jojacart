package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.Users;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConnection());
            
            HttpSession session = req.getSession();
            String email = req.getParameter("Email");
            String password = req.getParameter("Password");
            Users us = dao.login(email, password);
           

            if (us != null) {
            	 int adminID= us.getUser_id();
                session.setAttribute("userobj", us);
                session.setAttribute("adminId", adminID);
                System.out.println("Admin status: " + us.getAdmin()); 
                if (us.getAdmin() == 1) {
                    resp.sendRedirect("adminpage.jsp");
                  
                } else {
                    resp.sendRedirect("homepage.jsp");
                }
            } else {
                session.setAttribute("failedMsg", "Email & Password Invalid");
                resp.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp");
        }
    }
}
