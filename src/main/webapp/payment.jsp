<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>

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

	<div class="wrapper" style="margin-top: 400px;">
		<div class="credit-card" id="card">
		  <div class="card-front">
			<div class="branding">
			  <img src="img/chip.png" class="chip-img" />
			  <img src="img/visa.png" class="visa-logo" />
			</div>
			<div class="card-number">
			  <div>
				<span class="card-number-display">_</span>
				<span class="card-number-display">_</span>
				<span class="card-number-display">_</span>
				<span class="card-number-display">_</span>
			  </div>
			  <div>
				<span class="card-number-display">_</span>
				<span class="card-number-display">_</span>
				<span class="card-number-display">_</span>
				<span class="card-number-display">_</span>
			  </div>
			  <div>
				<span class="card-number-display">_</span>
				<span class="card-number-display">_</span>
				<span class="card-number-display">_</span>
				<span class="card-number-display">_</span>
			  </div>
			  <div>
				<span class="card-number-display">_</span>
				<span class="card-number-display">_</span>
				<span class="card-number-display">_</span>
				<span class="card-number-display">_</span>
			  </div>
			</div>
			<div class="details">
			  <div>
				<span>Kart Sahibi</span>
				<span id="card-holder-name">-</span>
			  </div>
			  <div>
				<span>Tarih</span>
				<span id="validity">-/-</span>
			  </div>
			</div>
		  </div>
		  <div class="card-back">
			<div class="black-strip"></div>
			<div class="white-strip">
			  <span>CVV</span>
			  <div id="cvv-display"></div>
			</div>
			<img src="img/visa.png" class="visa-logo" />
		  </div>
		</div>
		<form>
		  <label for="card-number">Kart Numarasi</label>
		  <input type="number" id="card-number" placeholder="xxxx xxxx xxxx xxxx" />
		  <label for="card-holder">Kart Sahibi:</label>
		  <input type="text" id="card-name-input" placeholder="İsminiz" />
		  <div class="date-cvv">
			<div>
			  <label for="validity">Son Tarih:</label>
			  <input type="month" id="validity-input"/>
			</div>
			<div>
			  <label for="cvv">CVV:</label>
			  <input type="number" id="cvv" placeholder="***" />
			</div>
		  </div>
		  <button type="button" class="add-product-btn" onclick="basarilisiparis()">Sipariş Ver</button>
		</form>
	  </div>
    
    
    <%@ include file="foother.jsp" %>

	<script src="https://kit.fontawesome.com/yourcode.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>