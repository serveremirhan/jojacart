<%@page import="com.entity.Products"%>
<%@page import="com.DAO.ProductsDAOImpl"%>

<%@page import="com.entity.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.OrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="tr">

<head>
    <title>Geçmiş Siparişlerim</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    
    <style >
    
.order-container {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 1100px;
    margin: 20px 0;
    padding: 10px;
    border-bottom: 1px solid;
}

.order-image {
    max-width: 200px;
    max-height: 400px;
    flex: 0 0 150px;
    height: 150px;
    margin-right: 20px;
}

.order-details {
    flex: 1;
}

.order-title {
    font-size: 1.5em;
    margin-bottom: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.order-recipient {
    margin-left: auto;
    font-size: 0.8em;
    color: #555;
}

.order-description {
    margin-bottom: 10px;
}

.order-price-payment {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.order-payment-method {
    display: flex;
    flex-direction: column;
}

.order-icons {
    display: flex;
    gap: 10px;
    margin-top: 5px;
}
    </style>
</head>

<body>
    <%@ include file="navbar.jsp" %>

<div id="box1" class="box-content" style="margin-bottom: 25px;">
    <h3>Siparişlerim</h3>
           <%
         
        ProductsDAOImpl dao2 = new ProductsDAOImpl(DBConnect.getConnection());
        OrderDAOImpl dao = new OrderDAOImpl(DBConnect.getConnection());
       	String u = null;
        List<Orders> list =dao.listMyOrders(request);
        for(Orders o:list){
        Products p = dao2.getProductById(o.getProduct_Id());  
        if(o.getStatus() ==2 ){
        	 u ="Onaylandı";
        }
        else{
        	 u= "Bekliyor";
        }
        %>
        <div class="order-container">
    <div style="width: 250px; justify-content: center; align-items: center; display:grid;">
        <img src="<%= request.getContextPath() %>/ItemImg/<%= p.getPhoto_name() %>" alt="Ürün Resmi" class="order-image">
    </div>
    <div class="order-details">
        <div class="order-title">
           <%=p.getTitle()%>
            <span class="order-recipient"><%=u%></span>
        </div>
        <div class="order-description"><%=p.getDescirption()%></div>
        <div class="order-price-payment">
            <div class="order-price">Fiyat: <%=p.getSale_price()%></div>
            <div class="order-payment-method">
                Ödeme Yöntemi: <%=o.getPayment_method()%>
                <div class="order-icons" style="margin-left: 70px;">

                </div>
            </div>
        </div>
    </div>
</div>
        

  

 <%}
        
        %>
</div>





<%@ include file="foother.jsp" %>
   
    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>