<%@page import="com.entity.Users"%>
<%@page import="com.entity.Products"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductsDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="tr">

<head>


	<%
		Users u=(Users)session.getAttribute("userobj");
	%>
    <title>Admin Panel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
    <%@ include file="navbar.jsp" %>
	<%
		int id =Integer.parseInt(request.getParameter("Product_id"));
		System.out.println(id+"id bu");
		ProductsDAOImpl dao = new ProductsDAOImpl(DBConnect.getConnection());
		Products p =dao.getProductById(id);

	%>
<main>
    <div class="product-page-container">
        <div class="grid product">
            <div class="product-image">
                <img class="active" src="<%= request.getContextPath() %>/ItemImg/<%= p.getPhoto_name() %>" alt="Product Image" style="max-width: 100%; max-height: 100%; object-fit: cover;">
            </div>
            <div class="product-details">
                <h1><%= p.getTitle() %></h1>
                <h2><%= p.getSale_price() %> TL</h2>
     
                <div class="description">
                    <p><%= p.getDescirption() %></p>
                </div>

                <%
                if (u == null) { %>
                
                    <a href="index.jsp"><button type="submit" class="add-product-btn" style="text-decoration: none">Sepete Ekle</button></a>
                <% } else { %>
                    <a href="CartServlet?Product_id=<%= p.getProduct_id()%>&&User_id=<%= u.getUser_id()%>" style="text-decoration: none"><button type="submit" class="add-product-btn">Sepete Ekle</button></a>
                <% } %>
            </div>
        </div>
    </div>
</main>


    <%@ include file="foother.jsp" %>

    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>

</html>
