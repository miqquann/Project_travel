<%-- 
    Document   : cart1
    Created on : Jun 4, 2024, 1:31:19 PM
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
            body{
                margin: 0;
                padding: 0;
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

            .container{
                width: 100%;
                display: flex;
            }

            

            .item{
                border-style: groove;
                border-radius: 10px;
                width: 50%;
                margin: 5px;
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
                        <li><a href="#">Hàng chờ</a></li>
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
                <div class="item" >
                    <a href="cart1">
                        <div class="p1">
                        <div class="img">
                        </div>
                        <div style="margin: 0px 5px" class="info">
                            <h3>Hàng chờ đặt Phòng</h3>
                        </div>
                        <div class="but">
                        </div>
                    </div>
                    </a>
                </div>
                <div class="item" >
                    <a href="cartfortour">
                        <div class="p1">
                        <div class="img">
                        </div>
                        <div style="margin: 0px 5px" class="info">
                            <h3>Hàng chờ đặt tour</h3>
                        </div>
                        <div class="but">
                        </div>
                    </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
