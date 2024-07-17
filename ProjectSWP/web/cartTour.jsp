
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Travelocket Cart</title>
        <style>
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

            .container{
                margin: 30px;
                width: 50%;
            }

            .container1{
                margin-top: 10px;
                width: 30%;
                margin: 30px;
            }

            .item{
                border-style: groove;
                border-radius: 10px;
                width: 100%;
                margin: 10px;
            }

            .p1 {
                display: flex;
                align-items: center;
                padding: 10px;
                border: 1px solid #e0e0e0;
                border-radius: 10px;
                margin-bottom: 15px;
            }


            .p1 .img {
                flex: 0 0 30%;
            }

            .p1 .img img {
                width: 100%;
                height: auto;
                border-radius: 5px;
            }


            .p1 .info {
                flex: 0 0 60%;
                margin: 0 10px;
            }

            .p1 h3 {
                font-size: 1.2em;
                margin-bottom: 5px;
            }

            .p1 p {
                margin: 0;
                color: #666666;
            }


            .p1 .but {
                flex: 0 0 10%;
                text-align: center;
            }

            .p1 .but a {
                color: #ff0000;
                text-decoration: none;
                font-weight: bold;
            }

            .p1 .but a:hover {
                color: #cc0000;
            }


            .p2 {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px;
                border: 1px solid #e0e0e0;
                border-radius: 10px;
                margin-bottom: 15px;
            }


            .p2 .p21/* Container styles */
            .p2 {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                margin-bottom: 10px;
            }

            .p2 .p21 {
                flex: 1;
            }

            .p2 .p21 .quantity {
                margin-bottom: 10px;
            }

            .p2 .p21 .quantity p {
                margin: 0;
            }

            .p2 .p21 .quantity a {
                display: inline-block;
                width: 30px;
                height: 30px;
                line-height: 30px;
                text-align: center;
                background-color: #f0f0f0;
                border: 1px solid #ccc;
                border-radius: 5px;
                text-decoration: none;
                color: #333;
                font-weight: bold;
                margin: 0 5px;
            }

            .p2 .p21 .quantity a:hover {
                background-color: #e0e0e0;
            }

            .p2 .p21 .quantity hr {
                margin-top: 5px;
                margin-bottom: 5px;
                border: none;
                border-top: 1px solid #ccc;
            }

            .p2 .p22 {
                color: #ff0000;
                margin-left: 20px;
            }

            .p2 h2 {
                margin: 0;
            }



            .quantity{
                display: flex;
                align-items: center;
            }

            .checkout{
                border-style: groove;
                border-radius: 10px;
                width: 100%;
                margin-top: 20px;
                height: 100px;
            }

            .checkout a{
                text-decoration: none;
                width: 100%;
                background-color: #3399ff;
                padding: 10px 60px;
                border-radius: 5px;
                color: white;

            }

            .checkout a:hover{
                background-color: #99ccff;
            }

            .containerfull{
                display: flex;
            }

            .btn{
                text-align: center;
            }

            .date {
                display: flex;
                flex-direction: column;
            }

            .date p {
                margin: 5px 0;
            }

            .date p span {
                margin-right: 10px;
            }

            .container1 {
                display: flex;
                justify-content: center;
                margin-top: 20px;
            }

            .checkout {
                background-color: #f2f2f2;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .checkout h3 {
                margin-bottom: 10px;
            }

            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                background: rgba(255, 255, 255, 0.8); /* Điều chỉnh độ trong suốt */
                z-index: 2;
                display: flex;
                align-items: center;
                justify-content: center;
                width: 100%;
                height: 100vh;
                display: none;
            }

            .overlay div {
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            }

            .checkout {
                font-size: 18px;
                color: #333;
            }

            .checkout p {
                font-size: 22px;
                font-weight: bold;
                margin: 10px 0;
            }

            .btn {
                margin-top: 20px;
            }

            .btn input[type="button"] {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .btn input[type="button"]:hover {
                background-color: #0056b3;
            }

            /* Overlay Styling */
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

            .pay{
                margin-bottom: 10px;
            }

            .pay a{
                width: 100%;
                text-decoration: none;
                color: black;
            }

            .pay:hover{
                background-color: #99ccff;
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
                        <li><a href="home">Trang Chủ</a></li>
                        <li><a href="#">Khách Sạn</a></li>
                        <li><a href="updateprofile">Hồ sơ</a></li>
                        <li><a href="viewdiscount">Khuyến mại</a></li>
                        <li><a href="cart1">Hàng chờ</a></li>
                    </ul>
                </nav>
                <div class="user-options">
                    <c:if test="${sessionScope.account == null}">
                        <a href="login">Đăng Nhập</a>
                        <a href="register">Đăng Ký</a>
                    </c:if>
                    <c:if test="${sessionScope.account != null}">
                        <a href="logout">Đăng xuất</a>
                    </c:if>
                </div>
            </div>
        </header>
        <div class="containerfull">
            <div class="container">
                <c:if test="${requestScope.listct.size() == 0}">
                    <img src="img/empty-cart.webp" width="40%" height="auto" alt="alt"/>
                </c:if>
                    <c:if test="${requestScope.listct.size() != 0}">
                    <c:forEach items="${requestScope.listct}" var="ct">
                    <div class="item" onclick="">
                        <div class="p1">
                            <div class="img">
                                <a href="#"><img src="${ct.tour_img}" width="100%" height="auto" alt="alt"/></a>
                            </div>
                            <div style="margin: 0px 5px" class="info">
                                <h3>${ct.tour_name}</h3>
                            </div>
                            <div class="but">
                                <a onclick="DoDelete('${ct.id}', '${ct.quantity}', '${ct.tour_id}')" href="#">Xóa</a>
                            </div>
                        </div>

                        <div class="p2">
                            <div class="p21">
                                <div class="quantity">
                                    <a href="editquantitycarttour?action=decre&id=${ct.id}&quantity=${ct.quantity}&tour_id=${ct.tour_id}">-</a>
                                    <p style="color: #3399ff">${ct.quantity}</p>
                                    <a href="editquantitycarttour?action=incre&id=${ct.id}&quantity=${ct.quantity}&tour_id=${ct.tour_id}">+</a>
                                </div>
                                <div class="date">
                                    <p><span><strong>ngày tham gia:</strong></span> ${ct.tour_date}</p>
                                </div>
                            </div>
                            <div class="p22">
                                <h2>${ct.price}VNĐ</h2>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="container1">
                <div class="checkout">
                    Tổng giá:<p>${requestScope.total}VNĐ</p>
                    <div class="btn">
                        <input type="button" onclick="Action1(event)" name="" value="Tiếp tục" />
                    </div>
                </div>
            </div>
                </c:if>
            <div class="overlay" id="overlay">
                <div>
                    <h2>Chọn hình thức thanh toán</h2>
                    <div class="pay">
                        <a href="checkinfopaytour?amount=${requestScope.total}&pay=0">Thanh toán qua vnpay</a>
                    </div>
                    <div class="pay">
                        <a href="checkinfopaytour?amount=${requestScope.total}&pay=1">Thanh toán bằng travelmoney</a>
                    </div>
                    <input type="button" onclick="Action2(event)" value="Hủy" />
                </div>
            </div>
        </div>
        <script>
            function DoDelete(id, c, t) {
                if (confirm("Bạn chắc muốn xóa đơn hàng này chứ")) {
                    window.location = "editquantitycarttour?action=dele&id=" + id + "&quantity=" + c + "&tour_id=" + t;
                }
            }

            function Action1(event) {
                event.preventDefault();
                document.getElementById('overlay').style.display = 'flex';
            }
            function Action2(event) {
                event.preventDefault();
                document.getElementById('overlay').style.display = 'none';
            }
        </script>
    </body>
</html>
