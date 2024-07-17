<%-- 
    Document   : errpage1
    Created on : May 27, 2024, 11:13:28 PM
    Author     : thait
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            .container {
                text-align: center;
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .message {
                font-size: 18px;
                color: #333;
                margin-bottom: 20px;
            }

            .login-link {
                display: inline-block;
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s;
            }

            .login-link:hover {
                background-color: #0056b3;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <p class="message">Bạn chưa thêm phòng cho khách sạn của bạn</p>
            <a href="edithotel?id=${requestScope.id}" class="login-link">Quay lại trang</a>
        </div>
    </body>
</html>
