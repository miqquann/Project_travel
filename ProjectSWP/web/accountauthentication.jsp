
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Xác Nhận Tài Khoản</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background-color: #ffffff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                padding: 20px;
                max-width: 400px;
                width: 100%;
                text-align: center;
            }
            .container p {
                font-size: 16px;
                color: #333333;
            }
            .container input[type="submit"] {
                background-color: #007bff;
                color: #ffffff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }
            .container input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <form action="accountauthentication" method="post">
                <input type="hidden" name="email" value="${requestScope.email}" />
                <p>Email của bạn được dùng để đăng ký tài khoản tại travelocket nếu đúng là bạn hãy nhấn xác nhận</p>
                <input type="submit" value="Xác Nhận Tài Khoản" />
            </form>
        </div>
    </body>
</html>

