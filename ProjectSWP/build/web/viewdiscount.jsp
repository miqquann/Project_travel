<%-- 
    Document   : viewdiscount
    Created on : Jun 27, 2024, 3:19:40 PM
    Author     : thait
--%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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

                background-color: #cccccc;
                color: white;
                padding: 50px 0;
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
                width: 400px;
                height: 45px;
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
                justify-content: start;
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
                margin-left: 20px;
            }

            .destination-item:hover {
                transform: translateY(-5px);
            }

            .destination-item img {
                width: 100%;
                height: 150px;
                object-fit: cover;
                border-bottom: 1px solid #e0e0e0;
            }

            .destination-item h3 {
                font-size: 1em;
                color: black;
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
                margin-top: 50px;
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
                        <li><a href="home">Trang chủ</a></li>
                        <li><a href="newpost">Khách sạn</a></li>
                        <li><a href="updateprofile">Hồ sơ</a></li>
                        <li><a href="viewdiscount">Khuyến mại</a></li>
                        <li><a href="cart1">Hàng chờ</a></li>
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
            <div >
                <form action="searchdiscount" method="post">
                    <input type="text" name="query" value="${requestScope.query}" placeholder="Nhập mã giảm giá " required>  
                    <button type="submit">Tìm Kiếm</button><br/>
                    <input type="radio" name="type" value="0" ${(requestScope.type ==0)?"checked":""} onclick="submit()"/>tất cả
                    <input type="radio" name="type" value="1" ${(requestScope.type ==1)?"checked":""} onclick="submit()"/>%
                    <input type="radio" name="type" value="2" ${(requestScope.type ==2)?"checked":""} onclick="submit()"/>VND                 
                </form>
            </div>
        </section>

        <section class="featured-destinations">
            <h2 >Ưu đãi ngập tràn</h2>
            <div class="destinations-container" id="quan">
                <c:forEach items="${requestScope.listd}" var="ld">
                    <div class="destination-item">
                        <a href="adddiscounttowallet?discount_id=${ld.discount_id}"><img src="${ld.img_discount}"></a>
                    </div>
                </c:forEach>               
            </div>
        </section>
        <div class="showpage">
            <c:forEach begin="1" end="${requestScope.num}" var="i">
                <li class="pagination-item" data-page="${i}">
                    <a class="pagination-link" href="viewdiscount?page=${i}#quan">${i}</a>
                </li>
            </c:forEach>
        </div>

        <footer>
            <p>&copy; 2024 Travelocket. All rights reserved.</p>
        </footer>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const urlParams = new URLSearchParams(window.location.search);
                const currentPage = urlParams.get('page') || '1';

                document.querySelectorAll('.pagination-item').forEach(item => {
                    if (item.getAttribute('data-page') === currentPage) {
                        item.classList.add('active');
                    }
                });
            });
        </script>
    </body>
</html>
