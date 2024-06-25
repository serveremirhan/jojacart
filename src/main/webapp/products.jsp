
    <%@page import="com.DAO.ProductsDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page language="java" import="java.sql.Connection"%>
<%@page language="java" import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Products"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored= "false" %>
<!DOCTYPE html>
<html lang="tr">

<head>
    <title>Admin Panel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
    <%@ include file="navbar.jsp" %>

	     <c:if test= "${not empty succMsg}">
        <p class= "text-center text-success">${succMsg  }</p> 
        <c:remove var="succMsg" scope="session"/> </c:if>
        
        <c:if test="${not empty failMsg }">
        <p class= "text-center text-denger">${failMsg }</p> 
        <c:remove var="failMsg" scope="session"/></c:if>
        
    <form action="" style="width: 800px;margin-left: 370px">
            
    
      <h3 style="margin-left: 10px;margin-bottom: 50px">Ürünlerim</h3>
        <table class="table table-striped">
        <thead class="bg-dark text-white">
        <tr>
          <th scope="col">Image</th>
          <th scope="col">Name</th>
          <th scope="col">Description</th>	
          <th scope="col">Price</th>
          <th scope="col">Category</th>
          <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
      

      
        <%
        ProductsDAOImpl dao = new ProductsDAOImpl(DBConnect.getConnection());
        List<Products> list =dao.getMyProducts(request);
        for(Products p:list){%>
          <tr>

    <td><img alt="" src="<%= request.getContextPath() %>/ItemImg/<%= p.getPhoto_name() %>" style="width: 50px; height: 50px;"></td>

          <td><%=p.getTitle()%></td>
          <td><%=p.getDescirption()%></td>
          <td><%=p.getSale_price()%></td>
          <td><%=p.getCatagory_name()%></td>
          <td><span class="edit-icons">
                <a href="editproducts.jsp?id=<%=p.getProduct_id() %>"><i class="fa fa-pencil icon-pencil" aria-label="Duzenle"></i></a>
                <a href="Delete_Servlet?id=<%=p.getProduct_id() %>"><i class="fa fa-times icon-delete" style="margin-left: 15px;" aria-label="Sil"></i></a>
            </span></td>
          
          </tr>
       <%}
        
        %>
        </tbody>
        </table>
    </form>

   
<%@ include file="foother.jsp" %>
   
    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>