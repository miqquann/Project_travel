<%-- 
    Document   : Login
    Created on : May 15, 2024, 8:48:47 PM
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

            #remember {
                margin-bottom: 10px;
            }

            /* Style for links */
            .forgot-password {
                margin: 10px; /* Add some right margin for spacing */
                color: #006699; /* Link color */
                text-decoration: none;
            }
            .create-account {
                margin: 10px; /* Add some right margin for spacing */
                color: #006699; /* Link color */
                text-decoration: none;
                margin-left: 100px;
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

            .btn {
                width: 100%;
                display: flex;
                justify-content: space-around
            }
            
            .err{
                margin: 10px;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <c:set var="cookie" value="${pageContext.request.cookies}"/>
            <h2>Đăng nhập</h2>
            <form action="login" method="post" onsubmit="return validateForm()">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email"  onclick="hideError()" value="${cookie.e.value}" />
                <span class="error-message" style="color:red"></span>


                <label for="password">Mật khẩu:</label>
                <input type="password" id="password" name="password" onclick="hideError()" value="${cookie.p.value}" />
                <span class="error-message" style="color:red"></span>


                <input type="checkbox" id="remember" name="remember" value="ON" ${cookie.r!=null?'checked':''}/>Lưu đăng nhập
                <input type="submit" value="Đăng nhập" class="submit-button" /><br/>
                
                <div class="err">
                    <c:if test="${requestScope.err!=null}">
                    <div style="color:red;" id="existedError">${requestScope.err}</div>
                    </c:if>
                </div>
                <div class="btn">
                    <a href="setf" class="forgot-password" >Quên mật khẩu?</a><br/>
                    <a href="chooseRole.jsp" class="create-account" >Tạo tài khoản?</a><br/>
                </div>
            </form>
        </div>

        <script>
            function validateForm() {
            let isValid = true;

            // Lấy giá trị của các trường input
            const name = document.getElementById('email');

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
            if (name.value.trim() === "") {
                showError(name, "Tên không được để trống");
                isValid = false;
            } else {
                clearError(name);
            }
            
            // Kiểm tra 
            if (!name.value.match('^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')) {
                showError(name, "Chưa đúng định dạng email");
                isValid = false;
            } else {
                clearError(name);
            }


            return isValid;
        }
            
            function hideError() {
                const errorExisted = document.getElementById('existedError');
                errorExisted.style.display = 'none';
            }
        </script>

    </body>
</html>
