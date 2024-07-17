<%-- 
    Document   : chooseRole
    Created on : May 16, 2024, 5:42:45 PM
    Author     : ADMIN
--%>

<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css">

        <style>
            .probootstrap-service-2 {
                border-radius: 15px;
                overflow: hidden;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                transition: transform 0.3s;
                background: #fff;
                margin-bottom: 30px;
                display: flex; /* Sử dụng flexbox để căn chỉnh nội dung */
            }

            .probootstrap-service-2:hover {
                transform: translateY(-10px);
            }

            .probootstrap-service-2 .text {
                width: 50%; /* Đặt chiều rộng của văn bản là 50% để nó chiếm nửa phần bên trái */
                padding: 20px;
            }

            .probootstrap-service-2 .image {
                width: 50%; /* Đặt chiều rộng của hình ảnh là 50% để nó chiếm nửa phần bên phải */
            }

            .probootstrap-service-2 .image-bg {
                overflow: hidden;
            }

            .probootstrap-service-2 img {
                width: 100%;
                height: auto;
                display: block;
            }

            .probootstrap-service-2 .btn {
                margin-top: 10px;
            }

            .section-heading h2 {
                font-size: 2.5em;
                font-weight: bold;
                color: #333;
            }

            .section-heading p.lead {
                font-size: 1.2em;
                color: #777;
            }

            .highlight-box {
                border: 2px solid indigo;
                transition: all 0.3s ease;
            }

            .highlight-box:hover {
                transform: scale(1.05);
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }

            .custom-background {
                background-color: lightblue;
                height: 40vh;
                padding: 20px;
                border-radius: 15px;
            }

            .custom-background h2 {
                font-family: 'Montserrat', sans-serif;
                color: indigo;
                font-size: 32px;
                margin-bottom: 10px;
            }

            .custom-border {
                border: 2px solid #007bff;
                box-shadow: 0px 0px 15px rgba(0, 123, 255, 0.3);
            }


        </style>
    </head>

    <body>


        <section class="probootstrap-section probootstrap-bg-white probootstrap-border-top">
            <div class="container">


                <div class="row justify-content-center align-items-center custom-background custom-border">
                    <div class="col-md-6 text-center section-heading probootstrap-animate">
                        <h2>ĐĂNG KÝ VỚI VAI TRÒ</h2>
                        <p>Bạn muốn đăng ký với chúng tôi với vai trò là Khách Hàng hay Nhà Cung Cấp</p>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-6">
                        <div class="probootstrap-service-2 probootstrap-animate highlight-box">
                            <div class="text">
                                <h3>Khách Hàng</h3>
                                <p>Bạn muốn tìm kiếm và đặt các dịch vụ lưu trú như khách sạn, nhà nghỉ, resort hoặc homestay.</p>
                                <p><a href="register?role=3" class="btn btn-primary">Đăng ký</a></p>
                            </div>
                            <div class="image">
                                <div class="image-bg" style="">
                                    <img src="img/core-img/KhachHang.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="probootstrap-service-2 probootstrap-animate highlight-box">
                            <div class="text">
                                <h3>Nhà Cung Cấp</h3>
                                <p>Những cá nhân hoặc tổ chức cung cấp các dịch vụ lưu trú cho khách đặt phòng thông qua trang web.</p>
                                <p><a href="register?role=2" class="btn btn-primary">Đăng ký</a></p>
                            </div>
                            <div class="image">
                                <div class="image-bg">
                                    <img src="img/core-img/ChuNha.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>




    </body>
</html>
