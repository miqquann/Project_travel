<%-- 
    Document   : hotelreview
    Created on : Jun 5, 2024, 11:06:44 PM
    Author     : thait
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

            .contain{
                display: flex;
            }

            aside{
                width: 20%;
            }

            aside .sub{
                margin-left: 100px;
                margin-top: 20px;
            }

            aside .sub a{
                text-decoration: none;
            }

            main{
                width: 60%;
                margin-left: 30px;
            }

            .cover{
                display: inline-flex;
                background-color: #ffffff;
                -webkit-box-shadow: 0 4px 10px 0 rgba(0, 0, 0, .1);
                margin: 10px ;
            }

            .sub {
                margin-bottom: 15px;
            }

            .sub a {
                display: block;
                text-decoration: none;
                font-family: Arial, sans-serif;
                color: #333;
                background-color: #fff;
                padding: 10px 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            .sub a:hover {
                background-color: #0099ff;
                color: white;
            }

            nav {
                width: 100%;
                background-color: #d8cbf5;

            }

            nav .header{
                display: flex;
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

            main {
                width: 75%;
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
                height: 150px;
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

            .contain-full{
                display: flex;
            }
        </style>
    </head>
    <body>
        <nav>
            <ul class="header">
                <c:if test="${(sessionScope.account.getRoleID() == 3)}">
                    <li> <a href="home">Trang chủ</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() == 2)}">
                    <li> <a href="homehotelier">Trang chủ</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() == 2 || sessionScope.account.getRoleID() == 3 )}">
                    <li> <a href="updateprofile">Hồ sơ của tôi</a></li>
                    </c:if>
                <li> <a href="logout">Đăng xuất</a></li>               
            </ul>
        </nav>
        <div class="contain-full">
            <aside>
                <div class="sub">
                    <a href="vieworder">Đơn đặt phòng</a>
                </div>
                <div class="sub">
                    <a href="#" target="_blank">Đánh giá khách sạn</a>
                </div>
                <div class="sub">
                    <a href="listhotelfavorite">Khách sạn yêu thích</a>
                </div>
                <div class="sub">
                    <a href="#">Travelmoney</a>
                </div>
                <div class="sub">
                    <a href="wallet">Mã giảm giá của tôi</a>
                </div>
            </aside>
            <main>
                <div class="hotel-container">
                    <c:forEach items="${requestScope.listhr}" var="l">
                        <div class="hotel-row">
                            <div class="hotel-images">
                                <img src="${l.imagemain}" alt="Main Image" class="main-image"/>
                            </div>

                            <div class="hotel-info">
                                <div class="info-item">
                                    <p><strong>Tên:</strong></p>
                                    <p>${l.name}</p>
                                </div>
                                <div class="info-item">
                                    <p><strong>Địa chỉ:</strong></p>
                                    <p>${l.address}</p>
                                </div>
                            </div>
                            <div class="hotel-actions">
                                <a href="review?hotel_id=${l.id}">Đánh giá</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </main>
        </div>


    </body>
</html>
