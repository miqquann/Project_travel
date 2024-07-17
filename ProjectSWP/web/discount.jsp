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
                background-color: #cccccc
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

            footer {
                background-color: #2c3e50;
                color: white;
                text-align: center;
                padding: 20px 0;
                margin-top: 100px;
            }

            .contact-area {
                max-width: 600px;
                margin: 20px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .up {
                display: flex;
                align-items: center;
            }

            .img {
                text-align: center;
            }

            .img img {
                max-width: 100%;
                height: auto;
                border-radius: 5px;
                box-shadow: 0 0 8px rgba(0, 0, 0, 0.2);
            }

            .des {
                flex: 3;
                padding-left: 20px;
            }

            .des h4 {
                margin-top: 0;
                color: #333;
            }

            .down {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 20px;
            }

            .date input, .percent input {
                width: 120px;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .percent input {
                width: 120px;
            }

            .add-to-wallet {
                margin-top: 10px;
            }

            .add-to-wallet a {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                text-decoration: none;
                border-radius: 4px;
            }

            .add-to-wallet a:hover {
                background-color: #45a049;
            }

            @media (max-width: 768px) {
                .contact-area {
                    padding: 15px;
                }
            }

            .but a{
                text-decoration: none;
                color: black;
                padding: 20px;
                background-color: #cccccc;
                border-radius: 3px;
            }
            .but a:hover{
                background-color: #999999;
            }

        </style>
    </head>
    <body>
        <c:set value="${requestScope.discount}" var="d" ></c:set>
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
        <main>
            <div class="contact-area">
                <div class="up">
                    <div class="img">
                        <img src="${d.img_discount}" alt="alt"/>
                    </div>
                    <div class="des">
                        <div class="date">
                            <h6 style="padding: 1px;margin: 0">Ngày bắt đầu:</h6>
                            <input type="date" name="" value="${d.startdate}" readonly=""/><br/>
                            <h6 style="padding: 1px;margin: 0">Ngày kết thúc:</h6>
                            <input type="date" name="" value="${d.enddate}" readonly=""/>
                        </div>
                        <div class="percent">
                            <h6 style="padding: 1px;margin: 0">Giảm:</h6>
                            <input type="text" name="" value="${d.percent} ${(d.type_percent == 1)?"%":"VND"}" readonly="" />
                            <h6 style="padding: 1px;margin: 0">Số lượng còn:</h6>
                            <input type="text" name="" value="${d.quantity}" readonly=""/>
                        </div>
                    </div>
                </div>
                <div class="down">
                    <div class="des">
                        <h4>Mô tả</h4>
                        <p>${d.describe_discount}</p>
                    </div>
                    <div class="but">
                        <form action="adddiscounttowallet" method="post">
                            <input type="hidden" name="discount_id" value="${d.discount_id}" />
                            <input type="submit" name="" value="Nhận mã" style="padding: 10px;border-radius: 5px "/>
                        </form>
                        <form action="wallet" >
                            <input type="submit" name="" value="Ví của tôi" style="padding: 10px;border-radius: 5px "/>
                        </form>
                    </div>
                </div>
                <h6>${requestScope.mess}</h6>
            </div>
        </main>

        <footer>
            <p>&copy; 2024 Travelocket. All rights reserved.</p>
        </footer>
    </body>
</html>
