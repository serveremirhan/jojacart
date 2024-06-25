package com.admin.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.DAO.ProductsDAOImpl;
import com.DB.DBConnect;
import com.entity.Products;

import javax.servlet.annotation.MultipartConfig;

@WebServlet("/add_Products")
@MultipartConfig
public class ProductAddServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	      try {
            HttpSession session = req.getSession();
            int adminId = (int) session.getAttribute("adminId");
                      
            String title = req.getParameter("Title");
            String description = req.getParameter("Description");
            String salePrice = req.getParameter("Price");
            String categoryName = req.getParameter("Categories");
            Part part = req.getPart("bimg");
            String fileName = part.getSubmittedFileName();           
            
            Products product = new Products(categoryName, title, description, fileName, salePrice, adminId);   
            ProductsDAOImpl dao = new ProductsDAOImpl(DBConnect.getConnection());         
            boolean isProductAdded = dao.addProducts(product);
            
            if (isProductAdded) {
                String path = getServletContext().getRealPath("") + "ItemImg\\";
                File dir = new File(path);
                if (!dir.exists()) {
                	System.out.println("var");
                    dir.mkdirs();
                }     
                part.write(path + File.separator + fileName);
				session.setAttribute("succMsg", "Product Add Successfully");
			}else {
				session.setAttribute("failMsg", "something went wrong");
			}
        	resp.sendRedirect("adminpage.jsp");

        } catch (Exception e) {
            HttpSession session = req.getSession(); // Ensure session is accessible here
            session.setAttribute("failMsg", "Invalid price format");
            resp.sendRedirect("adminpage.jsp");

        }
    }
}
