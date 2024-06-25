<%@page import="com.entity.Products"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ProductsDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="tr">

<head>
    <title>Ürünler</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
    <%@ include file="navbar.jsp" %>


    <div style="margin-top: 4%;margin-left: 4%; font-family: 'Courier New', Courier, monospace; font-weight: bold;">
        <h2>Ürünler:</h2>
      </div>

    <div class="shop-container" style="margin: 50px;  flex-wrap: wrap; ">
    	<%
    	
        String category = request.getParameter("Category");
        System.out.println("Category parameter: " + category);
        ProductsDAOImpl dao = new ProductsDAOImpl(DBConnect.getConnection());
    	List<Products> list = dao.getProductByCatagories(category);
    	for(Products p: list){%>
    	<a href="productspage.jsp?Product_id=<%=p.getProduct_id()%>" style="text-decoration: none ;color: black;">
 		<div class="shop-card">
			<div class="title"><%=p.getTitle() %></div>
			<div class="desc"><%=p.getDescirption() %></div>
			<div class="slider">
				<figure>
					<img src="<%= request.getContextPath() %>/ItemImg/<%= p.getPhoto_name() %>" />
				</figure>
			</div></a>
			<div class="cta">
				<div class="price"><%=p.getSale_price()+" TL" %></div>
				<button class="btn">
					Sepete Ekle<span class="bg"></span>
				</button>
			</div>
		</div>
		
    	<%
    	}
    	%>
    </div>



<%@ include file="foother.jsp" %>
    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
    
</body>