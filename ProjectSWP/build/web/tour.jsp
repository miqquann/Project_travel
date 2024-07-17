<%-- 
    Document   : tour
    Created on : Jul 16, 2024, 9:26:21 PM
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
                position: relative;
                width: 100%;
                margin: 0;
                padding: 0;
            }
            nav {
                width: 100%;
                background-color: #d8cbf5;

            }

            nav .header{
                display: flex;
                /*                justify-content: space-evenly;*/
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

            footer {
                /*                position: absolute;
                                right: 0;
                                left: 0;
                                bottom: 0;*/
                margin-top: 120px;
                background-color: #2c3e50;
                color: white;
                text-align: center;
                padding: 20px 0;
            }

            .contain {
                max-width: 600px;
                margin: 20px auto;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                overflow: hidden;
            }

            .img img {
                width: 100%;
                height: 200px;
                object-fit: cover;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
            }

            .header1 {
                padding: 15px;
                color: white;
                background-color: #d8cbf5;
                text-align: center;
                border-bottom: 2px solid #0056b3;
            }

            .header1 h5 {
                margin: 0;
                font-size: 16px;
            }

            .content {
                padding: 15px;
            }

            .content p {
                margin: 0;
                line-height: 1.6;
            }

            .action {
                padding: 15px;
                text-align: center;
                display: flex;
                width: 100%;
            }

            .action form{
                width: 95%;
            }

            .action input[type="number"],
            .action input[type="date"] {
                width: 30%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .action input[type="submit"] {
                width: 30%;
                padding: 8px;
                background-color: #007BFF;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .action input[type="submit"]:hover {
                background-color: #0056b3;
            }

            hr {
                border: none;
                border-top: 1px solid #e0e0e0;
                margin: 0;
            }
            
            .test{
                position: fixed;
                border-radius: 10px;
                background-color: #cccccc;
                padding: 20px ;
                display: block;
                right: 0;
                bottom: 0;
                margin-top: 40px;
            }
        </style>
    </head>
    <body>
        <c:set value="${requestScope.Tour}" var="t" />
        <nav>
            <ul class="header">
                <c:if test="${(sessionScope.account.getRoleID() == 3 || sessionScope.account.getRoleID() == null)}">
                    <li> <a href="home">Trang chủ</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() == 2)}">
                    <li> <a href="homehotelier">Trang chủ</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() == 1 )}">
                    <li> <a href="homeadmin">Trang chủ</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() == 2)}">
                    <li> <a href="addhotel">Thêm khách sạn</a></li>
                    <li> <a href="edithotel?id=${hotel.id}">Chỉnh sửa khách sạn</a></li>
                    <li> <a href="addroom?id=${hotel.id}">Thêm Phòng</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() == 2 || sessionScope.account.getRoleID() == 3 )}">
                    <li> <a href="updateprofile">Hồ sơ của tôi</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() != null)}">
                    <li><a href="logout">Đăng xuất</a></li>
                    </c:if>          
                    <c:if test="${(sessionScope.account.getRoleID() == null)}">
                    <li><a href="login">Đăng nhập</a></li>
                    <li><a href="register">Đăng kí</a></li>
                    </c:if>  
            </ul>
        </nav>
        <c:if test="${requestScope.mess != null}">
            <div class="test" id="addcart">
                <h4>đã thêm vào hàng chờ</h4>
            </div>
        </c:if>

        <main>
            <div class="contain">
                <div class="img">
                    <img src="${t.tour_img}" width="100%" height="200px" style="object-fit: cover" alt="alt"/>
                </div>
                <div class="header1" >
                    <h5>${t.tour_name}</h5>
                </div>
                <hr>
                <div class="content">
                    <p>
                        ${t.tour_describe}
                    </p>
                </div>
                <hr>
                <div class="action">
                    <form action="addtourtocart" method="POST" onsubmit="return validateForm()">
                        <input type="hidden" name="tour_id" value="${t.tour_id}"/>
                        <input id="quantity" type="number" name="quantity" value="" min="1" max="${t.quantity}" placeholder="Số lượng vé"/>
                        <span class="error-message" style="color:red"></span>
                        <input id="date" type="date" name="date" value="" required=""/>
                        <input type="submit" name="" value="Thêm vào giỏ" />           
                    </form>
                </div>
            </div>
        </main>

        <footer>
            <p>&copy; 2024 Travelocket. All rights reserved.</p>
        </footer>
        <script>
            ////////// thông báo thêm vào giỏ hàng
            function changeDivContent() {
                var x = document.getElementById("addcart");
                x.style.display = 'none';
            }

            window.onload = function () {
                setTimeout(changeDivContent, 2000); // Thay đổi nội dung sau 2 giây
            };
            
            function validateForm() {
            let isValid = true;

            // Lấy giá trị của các trường input
            const quantity = document.getElementById('quantity');

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
            if (quantity.value.trim() === "" || quantity.value < 0) {
                showError(quantity, "phải là số lớn hơn 0");
                isValid = false;
            } else {
                clearError(quantity);
            }
            
            return isValid;
        }
        
        var today = new Date().toISOString().split('T')[0];
            var today1 = new Date();
            today1.setDate(today1.getDate() + 1);
            var tomorrow = today1.toISOString().split('T')[0];
            var date1 = document.getElementById('date');
            date1.setAttribute('min', tomorrow);
        </script>
    </body>

</html>
