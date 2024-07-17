<%-- 
    Document   : checkout
    Created on : Jun 11, 2024, 10:17:19 PM
    Author     : thait
--%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                background-color: #f0f0f0;
            }

            .container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .notification {
                background-color: #fff;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
            }

            .notification h1 {
                color: #333;
            }

            .notification p {
                margin-bottom: 20px;
                color: #666;
            }

            .btn {
                display: inline-block;
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .btn:hover {
                background-color: #0056b3;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <div class="notification">
                <h1>Thanh toán Thành công!</h1>
                <p>Cảm ơn bạn đã thanh toán đơn hàng. Đơn hàng của bạn đã được xử lý.</p>
                <p>Thông tin sẽ sớm được gửi qua email</p>
                <a href="home" class="btn">Quay lại Trang chủ</a>
            </div>
        </div>
    </body>
</html>
