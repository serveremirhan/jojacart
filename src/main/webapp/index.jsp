
<%@page language="java" import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored= "false" %>
<html lang="tr">
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div class="hero">
    <div class="formbox">
        <div class="buttonbox">
            <div id="btn"></div>
            <button type="button" class="togglebtn active" onclick="login()" id="loginbtn">Giris</button>
            <button type="button" class="togglebtn" onclick="register()" id="registerbtn">Kayit Ol</button>
        </div>
        
        <c:if test= "${not empty succMsg}">
            <p class= "text-center text-success">${succMsg  }</p>    <!-- bootsrap işe yaramadı şunlara bi el at -->
            <c:remove var="succMsg" scope="session"/> </c:if>
            
            <c:if test="${not empty failMsg }">
            <p class= "text-center text-denger">${failMsg }</p> 
            <c:remove var="failMsg" scope="session"/></c:if>
                    
            <c:if test="${not empty failedMsg }">
            <p class= "text-center text-denger">${failedMsg}</p> 
            <c:remove var="failedMsg" scope="session"/></c:if>
            
                <% 
            Connection conn = DBConnect.getConnection();
       
        %>
        
        <div class="socialicon">
            <i class="fa fa-facebook" aria-hidden="true"></i>
            <i class="fa fa-twitter" aria-hidden="true"></i>
            <i class="fa fa-google" aria-hidden="true"></i>
        </div>
        
        <form class="input" id="login" action="LoginServlet" method="post" style="top: 150px">
            <input type="text" class="inputfile" name="Email" placeholder="Email" required>
            <input type="password" class="inputfile" name="Password" placeholder="Sifre" required>
            <button type="submit" class="submitbtn">Giris Yap</button>
        </form>
        
        <form class="input" id="register" action="RegisterServlet" method="post" >
            <input type="text" class="inputfile" name="First_name" placeholder="Ad" required>
            <input type="text" class="inputfile" name="Last_name" placeholder="Soyad" required>
            <input type="email" class="inputfile" name="Email" placeholder="Email" required>
            <input type="password" class="inputfile" name="Password" placeholder="Sifre" required>
            <input type="text" class="inputfile" name="Phone" placeholder="Telefon" required>
            <input type="text" class="inputfile" name="Address" placeholder="Adres" required>
            <span style="display: flex; left: 10px ;margin-bottom: 40px; margin-top: 20px;"> <input type="checkbox" class="checkbox" name="check" style="width: 20%"><span>OKUDUM ONAYLIYORUM</span>
            </span>
            <button type="submit" class="submitbtn">Kayit Ol</button>
           
        </form>
    </div>
</div>
<script>
    var x = document.getElementById("login");
    var y = document.getElementById("register");
    var btn = document.getElementById("btn");

    function setActiveButton(buttonId) {
        document.querySelectorAll('.togglebtn').forEach(function (btn) {
            btn.classList.remove('active');
        });
        document.getElementById(buttonId).classList.add('active');
    }

    function register() {
        x.style.left = "-400px";
        y.style.left = "50px";
        btn.style.left = "110px";
        setActiveButton('registerbtn');
    }

    function login() {
        x.style.left = "50px";
        y.style.left = "450px";
        btn.style.left = "0px";
        setActiveButton('loginbtn');
    }

    login();
</script>
</body>
</html>