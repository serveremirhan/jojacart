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
        <p class= "text-center text-success">${succMsg  }</p>    <!-- bootsrap işe yaramadı şunlara bi el at -->
        <c:remove var="succMsg" scope="session"/> </c:if>
        
        <c:if test="${not empty failMsg }">
        <p class= "text-center text-denger">${failMsg }</p> 
        <c:remove var="failMsg" scope="session"/></c:if>
        
    <section class="content-section">
        <div class="box-container">
            <a class="box" href="orders.jsp" style="color: black;text-decoration: none;">
                <i class="fa fa-shopping-basket"></i>
                <p>Siparişlerim</p>
            </a>
            <a class="box" href="addproducts.jsp" style="color: black;text-decoration: none;">
                <i class="fa fa-box"></i>
                <p>Ürün Ekle</p>
            </a>
            <a class="box" href="products.jsp" style="color: black;text-decoration: none;">
                <i class="fa fa-shopping-cart"></i>
                <p>Ürünlerim</p>
            </a>
        </div>
       
    </section>
    
    <%@ include file="foother.jsp" %>



    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>
    