<%-- 
    Document   : viewOrder
    Created on : Jun 4, 2024, 11:28:46 PM
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

            .table{
                width: 100%;
                margin-left: 30px;
            }
            table{
                width: 100%;
            }

            .table {
                width: 80%;
                margin: 0 auto;
                border-collapse: collapse;
                background-color: #fff;
                border-radius: 8px;
                overflow: hidden;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            thead {
                background-color: #007bff;
                color: #ffffff;
            }

            th, td {
                padding: 12px 15px;
                text-align: left;
            }

            th {
                background-color: #007bff;
                color: #ffffff;
                font-weight: bold;
                text-transform: uppercase;
            }

            tbody tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            tbody tr:hover {
                background-color: #ddd;
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
        </style>
        <script src="assets/jquery-1.11.3.min.js"></script>
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

        <div class="contain">
            <aside>
                <div class="sub">
                    <a href="#">Đơn đặt phòng</a>
                </div>
                <div class="sub">
                    <a href="viewordercancel">Đơn đã hủy</a>
                </div>
                <div class="sub">
                    <a href="hotelreview">Đánh giá khách sạn</a>
                </div>
                <div class="sub">
                    <a href="listhotelfavorite" >Khách sạn yêu thích</a>
                </div>
            </aside>
            <div class="table">
                <table border="1">
                    <thead>
                        <tr>
                            <th>Mã giao dịch</th>
                            <th>Ngày giao dịch</th>
                            <th>Tổng tiền</th>
                            <th>Khác</th>                         
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listod}" var="o">
                            <tr>
                                <td>${o.id}</td>
                                <td>${o.date}</td>
                                <td>${o.price}VNĐ</td>
                                <td><div class="sub"> 
                                        <a href="vieworderdetail?order_id=${o.id}">Xem chi tiết</a>
                                    </div></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div style="margin: 20px 0px">
                    <c:forEach begin="1" end="${requestScope.num}" var="i">
                        <li class="pagination-item" data-page="${i}">
                            <a class="pagination-link" href="vieworder?page=${i}">${i}</a>
                        </li>
                    </c:forEach>
                </div>
            </div>
            <script>
                //////
                document.addEventListener('DOMContentLoaded', function () {
                    const urlParams = new URLSearchParams(window.location.search);
                    const currentPage = urlParams.get('page') || '1';

                    document.querySelectorAll('.pagination-item').forEach(item => {
                        if (item.getAttribute('data-page') === currentPage) {
                            item.classList.add('active');
                        }
                    });
                });
                ///////
            </script>
    </body>
</html>
