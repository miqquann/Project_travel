<%-- 
    Document   : SendEmailToForgot
    Created on : May 15, 2024, 10:56:09 PM
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
            body {
                font-family: Arial, sans-serif;
                background-color: #f9f9f9;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .form-container {
                background-color: #fff;
                padding: 20px 30px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                max-width: 400px;
                width: 100%;
            }
            .form-container h2 {
                margin-bottom: 20px;
                color: #333;
            }
            .form-container label {
                display: block;
                margin-bottom: 5px;
                color: #555;
            }

            .form-container input[type="email"],
            .form-container input[type="password"] {
                width: 95%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 14px;
            }
            .form-container input[type="radio"] {
                margin-right: 10px;
            }
            .form-container .radio-group {
                margin-bottom: 15px;
            }
            .form-container input[type="submit"]:hover {
                background-color: #0056b3;
            }
            .form-container .error {
                color: red;
                margin-top: 10px;
            }
            /* Style for submit button */
            .submit-button {
                width: 100%;
                padding: 10px;
                background-color: #006699; /* Button color */
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease; /* Smooth hover effect */
            }

            .submit-button:hover {
                background-color: #00557e; /* Darker shade on hover */
            }
            .err{
                margin: 10px;
            }

            .back-to-login {
                display: inline-block;
                padding: 10px 20px;
                background-color: #4CAF50; /* Màu nền */
                color: white; /* Màu chữ */
                text-align: center;
                text-decoration: none;
                font-size: 16px;
                border-radius: 5px; /* Bo tròn góc */
                border: none;
                cursor: pointer;
            }

            .back-to-login:hover {
                background-color: #45a049; /* Màu nền khi di chuột qua */
            }

        </style>
    </head>
    <body>
        <div class="form-container">
            <h2>Send email</h2>
            <form action="setf" method="post">
                <label for="email">Email:</label>
                <c:if test="${requestScope.err!=null}">
                    <div style="color:#00ff00;" id="existedError">${requestScope.err}</div>
                </c:if>
                <input type="email" id="email" name="email"  onclick="hideError()"  required=""/>
                <p>Xin vui lòng nhập email của bạn vào ô bên trên. Chúng tôi sẽ gởi cho bạn đường dẫn để xem hướng dẫn cụ thể.</p>
                <input type="submit" value="Send" class="submit-button" /><br/>
                <a href="login.jsp" class="back-to-login">Back to Login</a>
            </form>
        </div>
        
        
        <script>
            function hideError() {
                const errorExisted = document.getElementById('existedError');
                errorExisted.style.display = 'none';
            }
        </script>
    </body>

</html>
