<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Travelocket</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }


            header {
                background-color: #2c3e50;
                padding: 30px 0;
            }

            .navbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 90%;
                margin: 0 auto;
            }

            .logo a {
                color: white;
                text-decoration: none;
                font-size: 24px;
                font-weight: bold;
            }

            nav ul {
                list-style: none;
                display: flex;
                margin: 0;
                padding: 0;
            }

            nav ul li {
                margin-left: 20px;
            }

            nav ul li a {
                color: white;
                text-decoration: none;
                font-size: 18px;
                margin: 0px 10px;

            }

            nav ul li a:hover{
                color: #0099ff;
            }

            .user-options a {
                color: white;
                margin-left: 20px;
                text-decoration: none;
                font-size: 18px;
            }

            .user-options a:hover{
                color: #0099ff;
            }

            .search-section {
                background: url('img/home.jpg') no-repeat center center/cover;
                color: white;
                padding: 100px 0;
                text-align: center;
            }

            .search-container h1 {
                font-size: 36px;
                margin-bottom: 20px;
            }

            .search-container form {
                display: flex;
                justify-content: center;
                gap: 10px;
            }

            .search-container input, .search-container button {
                padding: 10px;
                font-size: 16px;
                border: none;
            }

            .search-container input {
                width: 200px;
            }

            .search-container button {
                background-color: #66ccff;
                color: white;
                cursor: pointer;
            }

            .search-container button:hover{
                background-color: #cccccc;
            }

            .featured-destinations {
                padding: 20px;
                background-color: #f9f9f9;
                text-align: center;
            }

            .featured-destinations h2 {
                font-size: 2em;
                margin-bottom: 20px;
            }

            /* Container for destination items */
            .destinations-container {
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
            }

            /* Each destination item */
            .destination-item {
                background-color: #ffffff;
                border: 1px solid #e0e0e0;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 23%;
                margin-bottom: 20px;
                transition: transform 0.3s ease;
            }

            .destination-item:hover {
                transform: translateY(-5px);
            }

            .destination-item img {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-bottom: 1px solid #e0e0e0;
            }

            .destination-item h3 {
                font-size: 1.5em;
                padding: 10px 15px;
            }


            @media (max-width: 1200px) {
                .destination-item {
                    width: 48%;
                }
            }

            @media (max-width: 768px) {
                .destination-item {
                    width: 100%;
                }
            }

            footer {
                background-color: #2c3e50;
                color: white;
                text-align: center;
                padding: 20px 0;
            }

            .featured-hotel {
                padding: 20px;
                background-color: #f9f9f9;
                text-align: center;
            }

            .featured-hotel h2 {
                font-size: 2em;
                margin-bottom: 20px;
            }

            /* Container for hotel items */
            .hotel-container {
                display: flex;
                flex-wrap: wrap;
                gap: 20px; /* Add gap for spacing between items */
                justify-content: center;
            }

            /* Each hotel item */
            .hotel-item {
                background-color: #ffffff;
                border: 1px solid #e0e0e0;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 23%;
                position: relative; /* Add relative positioning */
                transition: transform 0.3s ease;
                text-align: left;
            }

            .hotel-item:hover {
                transform: translateY(-5px);
            }

            .hotel-item a {
                color: inherit;
                text-decoration: none;
                display: block; /* Ensure the anchor covers the entire item */
            }

            .hotel-item .favorite {
                background-color: #5392f9;
                color: #ffffff;
                font-weight: bold;
                padding: 5px 10px;
                position: absolute;
                top: 10px;
                left: 10px;
                border-radius: 5px;
                z-index: 10; /* Ensure it stays on top */
            }

            .hotel-item .like{
                position: absolute;
                top: 10px;
                right: 10px;
                font-size: 30px;
            }

            .hotel-item img {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-bottom: 1px solid #e0e0e0;
            }

            .hotel-item p {
                padding: 10px 15px;
                margin: 0;
            }

            .hotel-item p:first-of-type {
                font-size: 1.2em;
                font-weight: bold;
                margin-bottom: 5px;
            }

            .hotel-item p:nth-of-type(2) {
                color: #66ccff;
                margin-bottom: 5px;
            }

            .hotel-item p:last-of-type {
                color: #ff0033;
                font-weight: bold;
            }

            /* Media queries for responsiveness */
            @media (max-width: 1200px) {
                .hotel-item {
                    width: 48%;
                }
            }

            @media (max-width: 768px) {
                .hotel-item {
                    width: 100%;
                }
            }

            .pagination-item {
                display: inline-block;
                margin: 0 5px;
            }

            .pagination-link {
                text-decoration: none;
                color: #007bff;
                padding: 8px 16px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }

            .pagination-link:hover {
                background-color: #ddd;
            }

            .pagination-item.active .pagination-link {
                background-color: #007bff;
                color: white;
            }

            .showpage{
                margin-bottom: 30px;
                text-align: center;
            }

            .error {
                color: red;
                font-size: 12px;
            }
        </style>
    </head>
    <body>
        <header>
            <div class="navbar">
                <div class="logo">
                    <a href="home">Travelocket</a>
                </div>
                <nav>
                    <ul>
                        <li><a href="#">Trang chủ</a></li>
                        <li><a href="newpost">Khách sạn</a></li>
                        <li><a href="updateprofile">Hồ sơ</a></li>
                        <li><a href="viewdiscount">Khuyến mại</a></li>
                        <li><a href="showcart.jsp">Hàng chờ</a></li>
                    </ul>
                </nav>
                <div class="user-options">
                    <c:if test="${sessionScope.account == null}">
                        <a href="login">Đăng Nhập</a>
                        <a href="chooseRole.jsp">Đăng Ký</a>
                    </c:if>
                    <c:if test="${sessionScope.account != null}">
                        <a href="logout">Đăng xuất</a>
                    </c:if>
                </div>
            </div>
        </header>

        <section class="search-section">
            <div class="search-container">
                <h1 >RONG CHƠI BỐN PHƯƠNG, GIÁ VẪN "YÊU THƯƠNG"</h1>
                <form name="searchForm" action="search" method="post" onsubmit="return validateForm()">
                    <div>
                    <input id="query" type="text" name="query" placeholder="Điểm đến hoặc tên khách sạn">
                    <span class="error-message" style="color:red"></span>
                    <input id="date1" type="date" name="checkin" placeholder="Ngày đến" value="${sessionScope.checkin}" min="${sessionScope.min}">
                    <span class="error-message" style="color:red"></span>
                    <input id="date2" type="date" name="checkout" placeholder="Ngày đi" value="${sessionScope.checkout}" min="${sessionScope.max}">  
                    <span class="error-message" style="color:red"></span>
                    <button type="submit">Tìm Kiếm</button>
                    </div>
                    <span class="error-message" style="color:red"></span>
                </form>
            </div>
        </section>

        <section class="featured-destinations">
            <h2 >Địa Điểm Nổi Bật</h2>
            <div class="destinations-container">
                <c:forEach items="${requestScope.listlocation}" var="ll" >
                    <div class="destination-item">
                        <a href="hotellocation?locationId=${ll.id}"><img src="${ll.img}"></a>
                        <a href="hotellocation?locationId=${ll.id}"><h3>${ll.city}</h3></a>
                    </div>
                </c:forEach>               
            </div>
        </section>
        <c:set value="${sessionScope.listfh}" var="fh"/>            
        <section class="featured-hotel" id="tung">
            <h2 style="text-align: center">Những chỗ nghỉ nổi bật được đề xuất cho quý khách</h2>
            <div class="hotel-container">
                <c:forEach items="${requestScope.listhotel}" var="lh">
                    <div class="hotel-item" id="${lh.id}">
                        <a href="detailhotel?id=${lh.id}" >
                            <div class="favorite">${lh.rating}</div>
                            <div style="position: relative">
                                <img src="${lh.imagemain}">
                                <a href="javascript:void(0);" onclick="toggleFavorite('${lh.id}', '${requestScope.indexpage}', this)">
                                    <div class="like" id="like_${lh.id}">❤</div>
                                </a>
                            </div>
                            <p>${lh.name}</p>
                            <p style="color: #66ccff">${lh.address}</p>
                            <p style="color: #ff0033">${lh.price} VNĐ</p>
                        </a>
                    </div>
                </c:forEach>               
            </div>
        </section>
        <div class="showpage">
            <c:forEach begin="1" end="${requestScope.num}" var="i">
                <li class="pagination-item" data-page="${i}">
                    <a class="pagination-link" href="home?page=${i}#tung">${i}</a>
                </li>
            </c:forEach>
        </div>

        <footer>
            <p>&copy; 2024 Travelocket. All rights reserved.</p>
        </footer>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            function toggleFavorite(hotelId, page, element) {
            $.ajax({
                url: "favoritehotel",
                type: "GET",
                data: {
                    hotel_id: hotelId,
                    page: page
                },
                success: function(response) {
                    if (response.status && response.status === "login") {
                        window.location.href = "login";
                    } else {
                        var isFavorite = response.isFavorite;
                        var favoriteHotels = response.favoriteHotels;

                        // Cập nhật màu sắc của biểu tượng yêu thích dựa trên isFavorite
                        if (isFavorite) {
                            $(element).find('.like').css('color', '#ff0033');
                        } else {
                            $(element).find('.like').css('color', '');
                        }

                        console.log(favoriteHotels); // Để xem dữ liệu trong Console
                    }
                }
            });
        }

        $(document).ready(function() {
            // Kiểm tra và cập nhật màu sắc của các biểu tượng yêu thích khi trang tải
            var listfh = ${listfh}; // Chuyển đổi listfh thành một mảng JavaScript từ server-side
            listfh.forEach(function(hotelId) {
                $('#like_' + hotelId).css('color', '#ff0033');
            });
        });

            var today = new Date().toISOString().split('T')[0];
            var today1 = new Date();
            today1.setDate(today1.getDate() + 1);
            var tomorrow = today1.toISOString().split('T')[0];
            var date1 = document.getElementById('date1');
            var date2 = document.getElementById('date2');
            date1.setAttribute('min', today);
            date2.setAttribute('min', tomorrow);
            date1.onchange = function () {
                var x = new Date(date1.value);
                x.setDate(x.getDate() + 1);
                date2.setAttribute('min', x.toISOString().split('T')[0]);
                date2.value = x.value;
            };
            date2.onchange = function () {
                var x = new Date(date2.value);
                x.setDate(x.getDate() - 1);
                date1.setAttribute('max', x.toISOString().split('T')[0]);
            };

            ////////// chuyen trang
            document.addEventListener("DOMContentLoaded", function () {
                document.body.classList.add('loaded');
            });

            window.addEventListener("beforeunload", function () {
                document.body.classList.remove('loaded');
            });
            document.addEventListener('DOMContentLoaded', function () {
                const urlParams = new URLSearchParams(window.location.search);
                const currentPage = urlParams.get('page') || '1';

                document.querySelectorAll('.pagination-item').forEach(item => {
                    if (item.getAttribute('data-page') === currentPage) {
                        item.classList.add('active');
                    }
                });
            });
            ////////

            function validateForm() {
                let isValid = true;

                // Lấy giá trị của các trường input
                const name = document.getElementById('query');
                const datex = document.getElementById('date1');
                const datey = document.getElementById('date2');
                var date1 = document.getElementById('date1').value;
                var date2 = document.getElementById('date2').value;

                // Hàm để hiển thị thông báo lỗi
                function showError(input, message) {
                    const errorElement = input.nextElementSibling;
                    input.classList.add('error-input');
                    errorElement.textContent = message;
                }

                // Hàm để xóa thông báo lỗi
                function clearError(input) {
                    const errorElement = input.nextElementSibling;
                    input.classList.remove('error-input');
                    errorElement.textContent = '';
                }
                
                
                // Kiểm tra 
                if (name.value === "") {
                    showError(name, " không được để trống ");
                    isValid = false;
                } else {
                    clearError(name);
                }
                // Kiểm tra 
                if (!date1) {
                    showError(datex, " không được để trống ");
                    isValid = false;
                } else {
                    clearError(datex);
                }
                
                // Kiểm tra 
                if (!date2) {
                    showError(datey, " không được để trống ");
                    isValid = false;
                } else {
                    clearError(datey);
                }
   
                return isValid;
            }
        </script>
    </body>
</html>

