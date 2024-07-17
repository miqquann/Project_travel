<%-- 
    Document   : homehoteliser
    Created on : May 21, 2024, 7:54:27 AM
    Author     : thait
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Hotel Management</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f5f5f5;
            }

            nav {
                width: 100%;
                background-color: #d8cbf5;

            }

            nav .header{
                display: flex;
                justify-content: space-evenly;
            }

            nav li{
                list-style: none;
                padding: 30px 20px;
                justify-content: center;
            }

            nav li a{
                color: black;
                padding: 30px 20px;
                text-decoration: none;
            }

            nav li a:hover {
                background-color: white;
            }

            .container {
                display: flex;
                max-width: 1200px;
                margin: 20px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            aside {
                width: 20%;
                margin-right: 20px;
            }

            aside .sub {
                margin-bottom: 20px;
            }

            aside .sub a {
                display: block;
                text-decoration: none;
                font-family: Arial, sans-serif;
                color: #333;
                background-color: #e0e0e0;
                padding: 15px;
                border-radius: 5px;
                transition: background-color 0.3s ease, color 0.3s ease;
                text-align: center;
            }

            aside .sub a:hover {
                background-color: #0099ff;
                color: white;
            }

            main {
                width: 100%;
            }

            .hotel-container {
                display: flex;
                flex-direction: column;
            }

            .hotel-row {
                display: flex;
                flex-wrap: wrap;
                margin-bottom: 20px;
                padding-bottom: 20px;
                border-bottom: 1px solid #ddd;
            }

            .hotel-images {
                flex: 1;
                min-width: 300px;
                margin-right: 20px;
            }

            .hotel-images .main-image,
            .hotel-images .sub-image {
                width: 100%;
                height: 100px;
                object-fit: cover;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease;
            }

            .hotel-images .sub-images {
                display: flex;
                gap: 10px;
            }

            .hotel-images .sub-image {
                flex: 1;
                height: 60px;
                object-fit: cover;
                width: calc(50% - 5px);
            }

            .hotel-images .main-image:hover,
            .hotel-images .sub-image:hover {
                transform: scale(1.05);
                z-index: 10;
            }

            .hotel-info {
                flex: 2;
                min-width: 300px;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .info-item {
                margin-bottom: 20px;
            }

            .info-item p {
                margin: 0;
            }

            .info-item p:first-child {
                font-weight: bold;
            }

            .hotel-actions {

                flex: 1;
                min-width: 150px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: flex-start;
                padding: 20px;
            }

            .hotel-actions a {
                background-color: #007bff;
                width: 120px;
                padding: 10px 20px;
                margin-bottom: 10px;
                text-decoration: none;
                color: white;
                text-align: center;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .hotel-actions a:hover {
                background-color: #0099ff;
            }

            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                padding-top: 60px;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.9);
            }

            .modal-content {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 700px;
            }

            #caption {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 700px;
                text-align: center;
                color: #ccc;
                padding: 10px 0;
                height: 150px;
            }

            .modal-content, #caption {
                animation-name: zoom;
                animation-duration: 0.6s;
            }

            @keyframes zoom {
                from {
                    transform: scale(0);
                }
                to {
                    transform: scale(1);
                }
            }

            .close {
                position: absolute;
                top: 15px;
                right: 35px;
                color: #f1f1f1;
                font-size: 40px;
                font-weight: bold;
                transition: 0.3s;
            }

            .close:hover,
            .close:focus {
                color: #bbb;
                text-decoration: none;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <nav>
            <ul class="header">
                <li> <a href="homehotelier">Trang chủ</a></li>
                <li> <a href="addhotel">Thêm khách sạn</a></li>
                <li> <a href="updateprofile">Hồ sơ của tôi</a></li>
                <li> <a href="logout">Đăng xuất</a></li>
            </ul>
        </nav>
        <div class="container">
<!--            <aside>
                <div class="sub">
                    <a href="url">Báo cáo thống kê</a>
                </div>
            </aside>-->
            <main>
                <div class="hotel-container">
                    <c:forEach items="${requestScope.list}" var="l">
                        <div class="hotel-row">
                            <div class="hotel-images">
                                <img src="${l.imagemain}" alt="Main Image" class="main-image"/>
                                <div class="sub-images">
                                    <img src="${l.imagesub}" alt="Sub Image 1" class="sub-image"/>
                                    <img src="${l.imagesub1}" alt="Sub Image 2" class="sub-image"/>
                                </div>
                            </div>

                            <div class="hotel-info">
                                <div class="info-item">
                                    <p><strong>Tên:</strong></p>
                                    <p>${l.name}</p>
                                </div>
<!--                                <div class="info-item">
                                    <p><strong>Địa chỉ:</strong></p>
                                    <p>${l.address}</p>
                                </div>
                                <div class="info-item">
                                    <p><strong>Chính sách:</strong></p>
                                    <p>${l.refund ? "Hủy 2 ngày trước khi nhận phòng (hoàn 100%)" : "Hủy sẽ mất toàn bộ chi phí"}</p>
                                </div>-->
                                <div class="info-item">
                                    <p><strong>Trạng Thái:</strong></p>
                                    <p>${l.poststatus ? "Hoạt động" : "Chưa hoạt động"}</p>
                                </div>
                            </div>
                            <div class="hotel-actions">
                                <a href="detailhotel?id=${l.id}" target="target">Xem chi tiết</a>
                                <a href="edithotel?id=${l.id}" target="target">Chỉnh sửa</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </main>
        </div>
        <div id="imageModal" class="modal">
            <span class="close">&times;</span>
            <img class="modal-content" id="img01">
            <div id="caption"></div>
        </div>
        <script>
            var modal = document.getElementById("imageModal");
            var images = document.querySelectorAll('.hotel-images img');
            var modalImg = document.getElementById("img01");
            var captionText = document.getElementById("caption");

            images.forEach(image => {
                image.onclick = function () {
                    modal.style.display = "block";
                    modalImg.src = this.src;
                    captionText.innerHTML = this.alt;
                }
            });

            var span = document.getElementsByClassName("close")[0];
            span.onclick = function () {
                modal.style.display = "none";
            }
        </script>
    </body>
</html>
