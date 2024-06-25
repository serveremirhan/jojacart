package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.ProductsDAOImpl;
import com.DB.DBConnect;
import com.entity.Products;

@WebServlet("/edit_Product")
@MultipartConfig
public class EditProducts extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			 int adminId = Integer.parseInt(req.getParameter("Admin_id"));
            String title = req.getParameter("Title");
            String description = req.getParameter("Description");
            String salePrice = req.getParameter("Price");
            String categoryName = req.getParameter("Categories");
            Part part = req.getPart("bimg");
            String photoName = req.getParameter("Photo_name");
            int Product_id = Integer.parseInt(req.getParameter("Product_id"));
            String fileName = null;         
            String ilkOnKarakter = part.getSubmittedFileName();    
            boolean noChange= false;
            if (ilkOnKarakter!="") {
            	fileName = part.getSubmittedFileName();
            	noChange= true;
            	  System.out.println(ilkOnKarakter);
			}else {
				fileName = photoName;
				noChange= false;	  
			}
           
            Products product = new Products(categoryName, title, description, fileName, salePrice, adminId);
            product.setProduct_id(Product_id);
            ProductsDAOImpl dao= new ProductsDAOImpl(DBConnect.getConnection());
            boolean f = dao.updateEditProducts(product);
            HttpSession session= req.getSession();
            if (f) {
            	if (noChange) {
                    String path = getServletContext().getRealPath("") + "ItemImg\\";
                    File dir = new File(path);
                    System.out.println(path);
                    if (!dir.exists()) {
                    	System.out.println("var");
                        dir.mkdirs();
                    }
                    part.write(path + File.separator + fileName);
				}
	
				session.setAttribute("succMsg", "Product Update Successfully");
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
