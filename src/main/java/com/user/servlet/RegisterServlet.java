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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Handle GET request if needed
        // You can redirect or forward to a JSP page here
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("First_name");
            String email = req.getParameter("Email");
            String password = req.getParameter("Password");
            String phone = req.getParameter("Phone");
            String last_name = req.getParameter("Last_name");
            String address = req.getParameter("Address");
            String check= req.getParameter("check");

            System.out.println(name + email+ password +phone + last_name+ address);
            Users us = new Users();
            us.setFrist_name(name);
            us.setPhone(phone);
            us.setAdress(address);
            us.setLast_name(last_name);
            us.setPassword(password);
            us.setEmail(email);
            
            HttpSession session = req.getSession();
            if (check!=null) {
            	UserDAOImpl dao = new UserDAOImpl(DBConnect.getConnection());
                boolean f = dao.userRegister(us);
                if (f) {
                    //System.out.println("User registered successfully");
                	session.setAttribute("succMsg", "Registration successfully!");
                	resp.sendRedirect("index.jsp");
                } else {
                	session.setAttribute("failMsg", "Someting went wrong!");
                    System.out.println("User registration failed");
                    resp.sendRedirect("index.jsp"); // Error page redirect
                }
			}else
			{
				session.setAttribute("failMsg","Please Check Agree Terms & Condition");
				resp.sendRedirect("index.jsp");
			}

      
            

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

