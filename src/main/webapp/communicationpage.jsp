<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="tr">

<head>
    <title>İletisim</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
    <%@ include file="navbar.jsp" %>


    <div class="contact-3 content-area-6">
        <div class="container">
            <!-- Main title -->
            <div class="main-title text-center">
                <h1>İLETİŞİME <span>GEÇİN</span></h1>
                <img src="img/düz-çizgi.png" alt="" style="margin: 2%;">
            </div>
            <form action="#" method="GET" enctype="multipart/form-data" style="margin-top: 30px;">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floating-full-name" placeholder="Ad - Soyad">
                                    <label for="floating-full-name">Ad - Soyad</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating mb-3">
                                    <input type="email" class="form-control" id="floating-email-address" placeholder="E-Posta Adresiniz">
                                    <label for="floating-email-address">E-Posta Adresiniz</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floating-subject" placeholder="Konu">
                                    <label for="floating-subject">Konu</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floating-phone-Number" placeholder="Telefon Numaranız">
                                    <label for="floating-phone-Number">Telefon Numaranız</label>
                                </div>
                            </div>
                            <div class="">
                                <div class="form-floating mb-3">
                                    <textarea class="form-control" placeholder="Mesajınız" id="floatingTextarea2" style="height: 100px"></textarea>
                                    <label for="floatingTextarea2">Mesajınız</label>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="send-btn text-center">
                                    <button class="custom-btn btn-1">Gönder</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="contact-info-2">
                            <div class="ci-box d-flex mb-3">
                                <div class="icon">
                                    <i class="fa fa-phone"></i>
                                </div>
                                <div class="detail align-self-center">
                                    <h5>Telefon Numaramız:</h5>
                                    <p><a href="#">0555 555 55 55</a></p>
                                </div>
                            </div>
                            <div class="ci-box d-flex  mb-3">
                                <div class="icon">
                                    <i class="fa fa-envelope"></i>
                                </div>
                                <div class="detail align-self-center">
                                    <h5>E-Posta Adresimiz:</h5>
                                    <p><a href="#">JojaCart@gmail.com</a></p>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>






<%@ include file="foother.jsp" %>


    <script src="https://kit.fontawesome.com/yourcode.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="js/scripts.js"></script>

</body>