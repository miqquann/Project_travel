<%-- 
    Document   : viewWallet
    Created on : Jun 28, 2024, 4:14:21 PM
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
            body {
                background-color: #f5f5f5;
            }

            .contain {
                display: flex;
            }

            aside {
                width: 20%;
            }

            aside .sub {
                margin-left: 100px;
                margin-top: 20px;
            }

            aside .sub a {
                text-decoration: none;
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

            nav .header {
                display: flex;
                /* justify-content: space-evenly; */
            }

            nav li {
                list-style: none;
                padding: 30px 20px;
                justify-content: center;
            }

            nav li a {
                color: black;
                padding: 30px 20px;
                text-decoration: none;
            }

            nav li a:hover {
                background-color: white;
            }

            main {
                width: 70%;
                margin-left: 30px;
                display: flex;
                flex-wrap: wrap;
                gap: 20px; /* Optional: adds space between the cards */
                align-items: baseline;
            }

            .card {
                width: calc(50% - 20px); /* Subtract the gap size */
                border-radius: 10px;
                background-color: #fff;
                display: flex;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                margin-left: 0; /* Adjusted for consistent layout */
            }

            .card .card-image {
                width: 70%;
            }

            .card .card-image img {
                border-radius: 10px;
                border: 2px solid hsl(0, 0%, 90%); /* Light gray border */
                margin: 10px;
            }

            .card-details {
                align-content: center;
            }

            .card-details .detail {
                margin-top: 10px;
            }

            input[type="submit"] {
                background-color: #99ccff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-top: 10px;
            }

            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.7);
                display: none;
                align-items: center;
                justify-content: center;
            }

            .overlay div {
                background-color: #fff;
                padding: 30px;
                border-radius: 10px;
                width: 90%;
                max-width: 500px;
                /*                text-align: center;*/
            }

            .overlay h2 {
                margin-bottom: 20px;
                font-size: 24px;
            }

            .overlay input[type="button"] {
                background-color: #dc3545;
                color: #fff;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-top: 10px;
            }

            .overlay input[type="button"]:hover {
                background-color: #c82333;
            }

            /* Display overlay when active */
            .overlay.active {
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
                <li> <a href="#">Hồ sơ của tôi</a></li>
                <li> <a href="logout">Đăng xuất</a></li>
            </ul>
        </nav>

        <div class="contain">
            <aside>
                <c:if test="${sessionScope.account.roleID == 3}">
                    <div class="sub">
                        <a href="vieworder">Đơn đặt phòng</a>
                    </div>
                    <div class="sub">
                        <a href="hotelreview">Đánh giá khách sạn</a>
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
                </c:if>
            </aside>
            <main>
                <c:forEach items="${requestScope.listd}" var="ld">
                    <div class="card">
                        <div class="card-image">
                            <img src="${ld.img_discount}" width="80%" height="130px" style="object-fit: cover">
                        </div>
                        <div class="card-details">
                            <div class="detail">
                                <h5 style="margin: 2px">từ ngày</h5>
                                <input style="width: 100px" type="date" name="" value="${ld.startdate}" readonly="" />
                                <h5 style="margin: 2px">đến ngày</h5>
                                <input style="width: 100px" type="date" name="" value="${ld.enddate}" readonly="" />
                                <h5 style="margin: 2px">giảm</h5>
                                <input style="width: 100px" type="text" name="" value="${ld.percent} ${(ld.type_percent == 1) ? "%" : "VND"}" readonly="" />
                            </div>
                        </div>
                        <div class="btn">
                            <a onclick="Action1(event,'${ld.discount_id}')" href="#" style="text-decoration: none;color: black;margin-left: 25px">X</a>
                        </div>
                        <div class="overlay" id="overlay${ld.discount_id}">
                            <div style="text-align: center">
                                <h2 >bạn chắc muốn xóa khuyến mại này</h2>
                                <a href="deletewallet?email=${account.email}&discount_id=${ld.discount_id}" style="text-decoration: none;
                                   color: black;
                                   padding: 15px;
                                   border-radius: 5px;
                                   background-color: #cccccc;">Xoá</a>
                                <a onclick="Action2(event,'${ld.discount_id}')" href="" style="text-decoration: none;
                                   color: black;
                                   padding: 15px;
                                   border-radius: 5px;
                                   background-color: #ff0000;">Hủy</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </main>
        </div>
        <script>
            function Action1(event,x) {
                event.preventDefault();
                document.getElementById('overlay'+x).style.display = 'flex';
            }

            function Action2(event,x) {
                event.preventDefault();
                document.getElementById('overlay'+x).style.display = 'none';
            }
        </script>
    </body>
</html>

