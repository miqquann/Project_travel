<%-- 
    Document   : newjsp
    Created on : May 16, 2024, 9:06:50 PM
    Author     : thait
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }

            .hotel-container {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin-top: 20px;
            }

            .hotel-container form {
                display: flex;
                flex-direction: column;
            }

            .ip {
                margin-bottom: 15px;
            }

            .info {
                margin-bottom: 10px;
            }

            label {
                font-weight: bold;
                display: block;
                margin-bottom: 5px;
            }

            input[type="text"],
            input[type="time"],
            input[type="file"],
            select {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            textArea{
                width: 100%;
            }

            input[type="radio"] {
                margin-right: 5px;
            }

            .hd {
                background-color: #f0f0f0;
                padding: 15px;
                border-radius: 5px;
                margin-bottom: 20px;
            }

            .hd p {
                margin: 0 0 10px;
            }

            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                width: 100%;
            }

            input[type="submit"]:hover {
                background-color: #45a049;
            }

            @media (min-width: 768px) {
                .hotel-container form {
                    flex-direction: row;
                    flex-wrap: wrap;
                }

                .ip {
                    flex: 1 1 calc(50% - 20px);
                    margin-right: 20px;
                }

                .ip:last-child {
                    margin-right: 0;
                }
            }

            .utilities{
                display: block;
            }

            .refund{
                align-content: center;
            }

            .img{
                display: flex;
            }

            .img .info{
                margin-right: 30px;
            }

            nav {
                width: 100%;
                background-color: #cccccc;
            }

            nav .header{
                display: flex;
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

            .post{
                width: 100%;
                padding: 20px;
                text-align: center;
                background: #cccccc;
                margin: 10px 0;
                text-decoration: none;
                color: white;
            }

            .post:hover{
                background-color: #ccffff;
                color: black;
            }

            .submit{
                width: 100%;
            }

            nav {
                width: 100%;
                background-color: #d8cbf5;

            }

            nav .header{
                display: flex;
                justify-content: space-evenly;
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
        </style>
    </head>
    <body>
        <c:set value="${requestScope.hotel}" var="h"/>
        <nav>
            <ul class="header">
                <c:if test="${(sessionScope.account.getRoleID() == 3)}">
                    <li> <a href="home">Trang chủ</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() == 2)}">
                    <li> <a href="homehotelier">Trang chủ</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() == 1)}">
                    <li> <a href="homeadmin">Trang chủ</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() == 2)}">
                    <li> <a href="addhotel">Thêm khách sạn</a></li>
                    <li> <a href="addroom?id=${h.id}">Thêm Phòng</a></li>
                    <li> <a href="#" >Chỉnh sửa</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() == 2 || sessionScope.account.getRoleID() == 3 )}">
                    <li> <a href="updateprofile">Hồ sơ của tôi</a></li>
                    </c:if>
                <li> <a href="logout">Đăng xuất</a></li>               
            </ul>
        </nav>
        <div class="hotel-container">
            <form action="edithotel" onsubmit="return validateForm()" method="post" enctype="multipart/form-data" id="addhotel" >
                <div class="name ip">
                    <div class="info">
                        Tên khách sạn:
                        <input id="name" type="text"  name="name" value="${h.name}" >
                        <span class="error-message" style="color:red"></span>
                        Mô tả khách sạn:
                        <textarea id="namedes" name="describe" rows="5" cols="15" >${h.describe}</textarea>
                        <span class="error-message" style="color:red"></span>
                    </div>
                </div>
                <div class="address ip">
                    <div class="info">
                        Thành Phố:
                        <select id="locationId" name="locationId"  required>
                            <c:forEach var="lc" items="${requestScope.listcity}">
                                <option value="${lc.id}" ${(lc.id == h.locationId)?"selected":""}>${lc.city}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="info">
                        Địa chỉ cụ thể:
                        <input id="address" type="text" name="address" value="${h.address}" />
                        <span class="error-message" style="color:red"></span>
                    </div>
                </div>
                <div class="refund ip">
                    <div class="info">
                        <input type="radio" name="refund" value="true" ${(h.refund)?"checked":""} />Được hủy đơn
                    </div>
                    <div class="info">
                        <input type="radio" name="refund" value="false" ${(!h.refund)?"checked":""}/>Không được hủy đơn
                    </div>
                </div>
                <div class="checktime ip">
                    <div id="time">
                        <div class="info">
                            Giờ nhận phòng:
                            <input type="time" id="checkin" name="checkin"  value="${h.checkin}" >  
                        </div>
                        <div class="info">
                            Giờ trả phòng:
                            <input type="time" id="checkout" name="checkout"  value="${h.checkout}">  
                        </div>
                    </div>
                    <span class="error-message" style="color:red"></span>
                </div>
                <div class="utilities ip">
                    Bạn có thể đáp ứng được những tiện ích nào? <br/>
                    <input style="margin: 10px" type="checkbox" name="utilities" value="Tiếp tân [24h]" ${(h.utilities.contains("Tiếp tân [24h]"))?"checked":""}/>
                    <i class="fas fa-concierge-bell"></i> Tiếp tân [24h] <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Bãi để xe" ${(h.utilities.contains("Bãi để xe"))?"checked":""}/>
                    <i class="fas fa-parking"></i> Bãi để xe <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Khu vực hút thuốc" ${(h.utilities.contains("Khu vực hút thuốc"))?"checked":""}/>
                    <i class="fas fa-smoking"></i> Khu vực hút thuốc <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Được phép mang thú cưng" ${(h.utilities.contains("Được phép mang thú cưng"))?"checked":""}/>
                    <i class="fas fa-paw"></i> Được phép mang thú cưng <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="buffet sáng" ${(h.utilities.contains("buffet sáng"))?"checked":""}/>
                    <i class="fas fa-utensils"></i> buffet sáng <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Phòng tập" ${(h.utilities.contains("Phòng tập"))?"checked":""}/>
                    <i class="fas fa-dumbbell"></i> Phòng tập <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Hồ Bơi" ${(h.utilities.contains("Hồ Bơi"))?"checked":""}/>
                    <i class="fas fa-swimming-pool"></i> Hồ Bơi <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Nhận/trả phòng [nhanh]" ${(h.utilities.contains("Nhận/trả phòng [nhanh]"))?"checked":""}/>
                    <i class="fas fa-clock"></i> Nhận/trả phòng [nhanh] <br/>
                </div>
                <div class="img ip">
                    <div class="info">
                        <label for="imageFile">Hình ảnh khách Sạn:</label><br/>
                        <img width="200px" height="130px" style="object-fit: cover"src="${h.imagemain}" alt="" id="imagePreview" onclick="triggerFileInput('uploadInput')"/>
                        <input type="file" name="imageFile" accept="image/*"  id="uploadInput" onchange="uploadImage(event, 'imagePreview')">
                        <input type="hidden" value="${h.imagemain}" name="data">
                    </div>
                    <div class="info">
                        <label for="imageFile">Hình ảnh sảnh chính:</label><br/>
                        <img width="200px" height="130px" style="object-fit: cover"src="${h.imagesub}" alt="" id="imagePreview1" onclick="triggerFileInput('uploadInput1')"/>
                        <input type="file" name="imageFile1" accept="image/*"  id="uploadInput1" onchange="uploadImage(event, 'imagePreview1')">
                        <input type="hidden" value="${h.imagesub}" name="data1">
                    </div>
                    <div class="info">
                        <label for="imageFile">Hình Ảnh cảnh quan:</label><br/>
                        <img width="200px" height="130px" style="object-fit: cover" src="${h.imagesub1}" alt="" id="imagePreview2" onclick="triggerFileInput('uploadInput2')"/>
                        <input type="file" name="imageFile2" accept="image/*"  id="uploadInput2" onchange="uploadImage(event, 'imagePreview2')">
                        <input type="hidden" value="${h.imagesub1}" name="data2">
                    </div>
                </div>
                <div class="submit">
                    <input type="hidden" name="id" value="${h.id}" />
                    <input type="submit"  name="" value="Chỉnh sửa" />
                </div>
                <c:if test="${(!h.poststatus)}">
                    <a class="post" href="changestatuspost?id=${h.id}&status=${!h.poststatus}">Bật trạng thái hoạt động</a>
                </c:if>
                <c:if test="${(h.poststatus)}">
                    <a class="post" onclick="DoPost('${h.id}', '${!h.poststatus}')" href="#">Tắt trạng thái hoạt động</a>
                </c:if>
            </form>
        </div>

        <script>
            function validateForm() {
                let isValid = true;

                // Lấy giá trị của các trường input
                var checkinTime = document.getElementById("checkin").value;
                var checkoutTime = document.getElementById("checkout").value;
                var checkinDate = new Date("2000-01-01T" + checkinTime);
                var checkoutDate = new Date("2000-01-01T" + checkoutTime);
                checkinDate.setHours(checkinDate.getHours() - 2);
                const name = document.getElementById('name');
                const namedes = document.getElementById('namedes');
                const address = document.getElementById('address');
                const time = document.getElementById('time');

                // Biểu thức chính quy để kiểm tra ký tự đặc biệt
                const specialCharRegex = /[!@#$%^&*?":{}|<>]/;

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
                if (name.value.trim() === "" || specialCharRegex.test(name.value)) {
                    showError(name, "Tên không được để trống và không chứa ký tự đặc biệt.");
                    isValid = false;
                } else {
                    clearError(name);
                }

                //Kiểm tra
                if (checkoutDate > checkinDate) {
                    showError(time, 'Thời gian trả phòng phải sớm hơn ít nhất 2 tiếng so với thời gian nhận phòng!');
                    isValid = false;
                } else {
                    clearError(time);
                }


                // Kiểm tra
                if (namedes.value.trim() === "" || specialCharRegex.test(namedes.value)) {
                    showError(namedes, "Mô tả không được để trống và không chứa ký tự đặc biệt.");
                    isValid = false;
                } else {
                    clearError(namedes);
                }

                // Kiểm tra 
                if (address.value.trim() === "" || specialCharRegex.test(address.value)) {
                    showError(address, "không được để trống và không chứa ký tự đặc biệt");
                    isValid = false;
                } else {
                    clearError(address);
                }


                return isValid;
            }

            function triggerFileInput(t) {
                document.getElementById(t).click();
            }

            // Hàm để xử lý sự kiện khi người dùng chọn file
            function uploadImage(event, t) {
                var input = event.target;
                var preview = document.getElementById(t);

                // Kiểm tra xem người dùng đã chọn file chưa
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        // Hiển thị ảnh đã chọn
                        preview.src = e.target.result;
                    };

                    // Đọc file ảnh
                    reader.readAsDataURL(input.files[0]);
                }
            }

            function DoPost(id, h) {
                if (confirm("Bạn chắc muốn tắt trạng thái khách sạn này chứ")) {
                    window.location = "changestatuspost?id=" + id + "&status=" + h;
                }
            }
        </script>
    </body>
</html>
