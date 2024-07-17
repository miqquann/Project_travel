<%-- 
    Document   : Resgister
    Created on : May 15, 2024, 12:02:22 AM
    Author     : thait
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Travelocket</title>
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
            .form-container input[type="text"],
            .form-container input[type="email"],
            .form-container input[type="number"],
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

            .good{
                width: 100%;
                padding: 10px 0;
            }

            .good:hover{
                background-color: #0066ff;
                color: white;
            }
        </style>
    </head>
    <body>

        <div class="form-container">
            <h2>Đăng ký</h2>
            <form action="register" method="post" id="register" onsubmit="return validateForm()">
                <label for="name">Tên đầy đủ:</label>
                <input type="text" id="name" name="name" onclick="hideError()"   value="${requestScope.name}"/>
                <span  class="error-message" style="color:red;font-size: 10px"></span>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" onclick="hideError()"  value=""/>
                <span  class="error-message" style="color:red;font-size: 10px"></span>

                <label for="phone">Số điện thoại:</label>
                <input type="number" id="phone" name="phone" onclick="hideError()" value="${requestScope.phone}"/>
                <span  class="error-message" style="color:red;font-size: 10px"></span>

                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password"  onclick="hideError()"/>
                <span  class="error-message" style="color:red;font-size: 10px"></span>

                <label for="confirm">xác nhận lại mật khẩu:</label>
                <input type="password" id="confirm" name="confirm"  onclick="hideError()"/>
                <span  class="error-message" style="color:red;font-size: 10px"></span>

                <input type="hidden" name="role" value="${requestScope.role}" />

                <div id="error" style="color:red;"></div>
                <c:if test="${requestScope.err!=null}">
                    <div style="color:red;" id="existedError">${requestScope.err}</div>
                </c:if>
                    <input type="submit" value="Đăng kí" class="good" />
            </form>
        </div>

        <script>
            
            function validateForm() {
            let isValid = true;

            // Lấy giá trị của các trường input
            const name = document.getElementById('name');
            const email = document.getElementById('email');
            const phone = document.getElementById('phone');
            const pass = document.getElementById('password');
            const confirm = document.getElementById('confirm');

            // Biểu thức chính quy để kiểm tra ký tự đặc biệt
            const specialCharRegex = /[!@#$%^&*(),.?":{}|<>]/;

            // Hàm để hiển thị thông báo lỗi
            function showError(input, message) {
                const errorElement = input.nextElementSibling;
                input.classList.add('error-input');
                errorElement.textContent = message;
            }

            // Hàm để xóa thông báo lỗi
            function clearError(input) {
                const errorElement = input.nextElementSibling;
                input.classList.remove('error-input');
                errorElement.textContent = '';
            }
            
            // Kiểm tra 
            if (!email.value.match('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$') ||email.value.trim() === "" ) {
                showError(email, "Chưa đúng định dạng email");
                isValid = false;
            } else {
                clearError(email);
            }
//            
            // Kiểm tra 
            if (!phone.value.match('^0[0-9]{9}$') ||phone.value.trim() === "" ) {
                showError(phone, "Chưa đúng định dạng số ");
                isValid = false;
            } else {
                clearError(phone);
            }
//            
//            // Kiểm tra 
            if (!pass.value.match('^(?=.*\d)(?=.*[A-Z])(?=.*[!@#$%^&*]).{6,}$') ||pass.value.trim() === "" ) {
                showError(pass, "mật khẩu phải từ 6 kí tự tối thiểu 1 chữ số,viết hoa và 1 kí tự đặc biệt");
                isValid = false;
            } else {
                clearError(pass);
            }
            
            // Kiểm tra 
            if (!(confirm.value === pass.value) ) {
                showError(confirm, "mật khẩu không khớp");
                isValid = false;
            } else {
                clearError(confirm);
            }
            
            // Kiểm tra 
            if (name.value.trim() === "" || !name.value.match('^(?! *$)[A-Za-zÀ-ỹ ]+$')) {
                showError(name, "Tên không được để trống và không được để ký tự đặc biệt");
                isValid = false;
            } else {
                clearError(name);
            }

            return isValid;
        }
            

            function hideError() {
                const error = document.getElementById('error');
                error.style.display = 'none';
                const errorExisted = document.getElementById('existedError');
                errorExisted.style.display = 'none';
            }
        </script>
    </body>
</html>

