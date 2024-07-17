<%-- 
    Document   : viewOrderDetail
    Created on : Jun 5, 2024, 3:58:27 PM
    Author     : thait
--%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

            .cancel{
                background-color: #dc3545;
                color: #fff;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-top: 10px;
                text-decoration: none;
            }
            .cancel:hover{
                background-color: #cccccc;
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
                text-align: center;
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

            .overlay input[type="button"]:hover {
                background-color: #00ccff;
            }

            .huy{
                padding: 10px;
                background-color: #ff6666;
                border-radius: 5px;
            }
            .huy:hover{
                background-color: #cccccc;
                border-radius: 5px;
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
        <div class="contain">
            <aside>
                <div class="sub">
                    <a href="vieworder">Đơn đặt phòng</a>
                </div>
                <div class="sub">
                    <a href="viewordercancel">Đơn đã hủy</a>
                </div>
                <div class="sub">
                    <a href="hotelreview">Đánh giá khách sạn</a>
                </div>
                <div class="sub">
                    <a href="listhotelfavorite">Khách sạn yêu thích</a>
                </div>
            </aside>
            <div class="table">
                <table border="1">
                    <thead>
                        <tr>
                            <th>Tên phòng</th>
                            <th>Ảnh</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                            <th>checkin</th>
                            <th>checkout</th>                         
                            <th>Trạng thái</th>                         
                            <th>Khác</th>                         
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listodd}" var="od">
                            <tr>
                                <td>${od.room_name}</td>
                                <td><a href="detailhotel?id=${od.hotel_id}#${od.room_id}"><img src="${od.img}" width="250px" height="150px" style="object-fit: cover" alt="alt"/></a></td>
                                <td>${od.quantity}</td>
                                <td>${od.price}</td>
                                <td>${od.checkin}</td>
                                <td>${od.checkout}</td>
                                <td>${(od.status == 0)?"chưa checkin":"đã checkin"}</td>
                                <c:if test="${od.refund == true}">
                                    <td><input type="button" onclick="Action1(event,${od.id})" name="" value="Hủy" class="huy"/></td>
                                    </c:if>
                            </tr>
                        <div class="overlay" id="overlay${od.id}">
                            <div>
                                <h2>Bạn có chắc muốn hủy đơn đặt phòng này</h2>
                                <p>khi hủy đơn đặt này bạn sẽ được hoàn tiền về ví travelmoney</p>
                                <a href="cancelroom?od_id=${od.id}&o_id=${od.order_id}&price=${od.price}" class="cancel">HỦY</a>
                                <input type="button" onclick="Action2(event,${od.id})" value="Trở Lại" />
                            </div>
                        </div>
                    </c:forEach>
                    </tbody>
                </table>
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
