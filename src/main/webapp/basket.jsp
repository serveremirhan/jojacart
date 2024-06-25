<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.ProductsDAOImpl"%>
<%@page import="com.entity.Products"%>
<%@page import="com.entity.cart_items"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="tr">

<head>
    <title>JojaCart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
          integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
    <%@ include file="navbar.jsp" %>
	
    <form action="orderServlet" method="post" style="margin-top: 50px;">
        <div id="box1" class="box-content" style="margin-bottom: 25px;">
            <h3>Sepetim:</h3>
                <%
        CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnection());
        List<cart_items> list =dao.getMyCartItems(request);
        ProductsDAOImpl dao2 = new ProductsDAOImpl(DBConnect.getConnection());
      	List<Integer> OrdersProduct_id = new ArrayList<>();
        for(cart_items c:list){
        	Products p = dao2.getProductById(c.getProduct_id());
        	OrdersProduct_id.add(c.getProduct_id());
        	
        %>
            <div class="order-item">
                <div class="item-content">
                    <img src="<%= request.getContextPath() %>/ItemImg/<%= p.getPhoto_name() %>" alt="Ürün Resmi" style="max-width: 150px; max-height: 100px;">
                    <span class="item-name"><%=p.getTitle()%></span>
                    <span class="item-price"><%=p.getSale_price()%></span>
                </div>
                <a href="Delete_Cart?id=<%=c.getCartitem_id() %>"><span><i class="fa fa-times icon-delete" aria-label="Sepetten Çıkar"></i></span></a>
            </div>
             <%}
            session.setAttribute("OrdersProduct_id", OrdersProduct_id);
        %>
 
            <span id="total-price">Toplam: 0 TL</span>
        </div>
        <div>
            <button type="button" class="add-product-btn" onclick="odemeekrani()">Sipariş Ver</button>
        </div>
    </form>

<%@ include file="foother.jsp" %>

    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>
</html>
