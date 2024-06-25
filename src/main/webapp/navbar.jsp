<%@page import="com.entity.Users"%>
<%@page import="org.apache.catalina.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<section class="nav__side">
		<nav>
			<div class="barand">
				<a href="homepage.jsp"><img src="img/logo.png" alt=""></a>
			</div>
			<div class="searchbar">
			<form action="search.jsp" method="post" style="display:flex; margin-top: 0px ">
					<input type="text" name="ch">
				<button type="submit">
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>	
			</form>
		
			</div>
			<div class="links">
				<!--  <div class="bell">
					<i class="fa-solid fa-bell"></i>
				</div> -->
				<div class="cart">
					<a href="basket.jsp"><i class="fa-solid fa-cart-shopping"></i></a>
				</div>
				<div class="user" id="profile_dropdown">
					<i class="fa-regular fa-circle-user"></i>
				</div>
			</div>
			<div class="profilre_dropdown">
				<ul>
					<li><a href="personpage.jsp">Profil Ayarlari</a></li>
					<%
					HttpSession session2 = request.getSession();
					Users user = (Users)session.getAttribute("userobj");
					int adminID = user.getAdmin();
					
                    if (adminID == 1) {
                    %>
					
					
					<li><a href="adminpage.jsp">Admin Paneli</a></li><%} %>
					<li><a href="index.jsp" target="_blank">Kayit Ol -
							Giris Yap</a></li>
				</ul>
			</div>
		</nav>
		<div class="nav2">
			<div>
				<ul>
					<li><a href="drees.jsp?Category=kiyafet">Kıyafet</a></li>
					<li><a href="drees.jsp?Category=gozluk">Gozluk</a></li>
					<li><a href="drees.jsp?Category=ayakkabi">Ayakkabi</a></li>	
					<li><a href="drees.jsp?Category=teknoloji">Teknoloji</a></li>
					<li><a href="drees.jsp?Category=gozlukkk">Spor</a></li>
					<li><a href="drees.jsp?Category=gozlukk">Kozmetik</a></li>
					<li><a href="bookmusicpage.html">Kitap,Müzik</a></li>
				</ul>
			</div>
		</div>
	</section>