
    <%@page import="com.DAO.ProductsDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page language="java" import="java.sql.Connection"%>
<%@page language="java" import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Products"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="tr">

<head>
    <title>Ürün Düzenleme</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
    <%@ include file="navbar.jsp" %>


	<%
	
	int id =Integer.parseInt(request.getParameter("id"));
	ProductsDAOImpl dao =new ProductsDAOImpl(DBConnect.getConnection());
	
	Products p = dao.getProductById(id);
	
	%>

  <div style="margin-bottom: 25px;">
    <h3 style="margin-left: 350px;margin-top: 50px">Ürünü Düzenle</h3>
    <form class="input" action="edit_Product" method="post" enctype="multipart/form-data">
      <div class="form-container" style="width: 800px;margin-left: 400px">
        <div class="image-upload">
          <img id="image-preview" src="#" alt="Resim Önizlemesi" style="display:none; margin-bottom:10px; max-width:70px;">
          <label for="upload-image">
            <i class="fa fa-camera"></i> Resim Ekle
          </label>
          <input type="file" id="upload-image" name="bimg" accept="image/*" onchange="previewImage(event)" >
        </div>
        <div class="form-fields">
         <input  type="hidden"  class="inputfile" placeholder="product id" name="Product_id" required  value ="<%=p.getProduct_id() %>">
          <input type="hidden" class="inputfile" placeholder="admin id" name="Admin_id" required  value ="<%=p.getAdmin_id() %>">
          <input type="hidden" class="inputfile" placeholder="photo" name="Photo_name" required  value ="<%=p.getPhoto_name() %>">
          <input type="text" class="inputfile" placeholder="<%=p.getTitle() %>" name="Title" required value ="<%=p.getTitle() %>">
          <input type="number" class="inputfile" placeholder="<%=p.getSale_price() %>" name="Price" required  value ="<%=p.getSale_price() %>">
          <input type="text" class="inputfile"placeholder="<%=p.getDescirption() %>" name="Description" required value ="<%=p.getDescirption() %>">
          <select class="inputfile" name="Categories" required>
            <option value="">Kategori Seçin</option>
                        <option value="">Kategori Seçin</option>
                        <option value="teknoloji">teknoloji</option>
                        <option value="kiyafet">kiyafet</option>
                        <option value="gozluk">Gözlük</option>
                        <option value="ayakkabi">ayakkabi</option>
          </select>
          <button type="submit" class="add-product-btn">Kaydet</button>
        </div>
      </div>
    </form>
  </div> 


<%@ include file="foother.jsp" %>
   
    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>
</body>