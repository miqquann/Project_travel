<%-- 
    Document   : addroom
    Created on : May 21, 2024, 9:19:17 PM
    Author     : thait
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                margin-top: 30px;
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
            input[type="number"],
            input[type="file"],
            select {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 5px;
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
                width: 30%;
            }

            .img{
                width: 50%;
                display: flex
            }

            .img .info{
                margin-right: 20px;
                width: 25%;
            }

            .img .info img{
                width: 100%;
            }

            .utilities{
                width: 50%;
            }


            textArea{
                width: 100%;
            }

            .more{
                display: flex;
            }

            .submit{
                width: 100%;
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
        <c:set value="${requestScope.room}" var="r" />
        <nav>
            <ul class="header">
                <li> <a href="homehotelier">Trang chủ</a></li>
                <li> <a href="addhotel">Thêm khách sạn</a></li>
                <li> <a href="addroom?id=${requestScope.hotel_id}">Thêm Phòng</a></li>
                <li> <a href="updateprofile">Hồ sơ của tôi</a></li>
                <li> <a href="logout">Đăng xuất</a></li>
            </ul>
        </nav>
        <div class="hotel-container">
            <form action="editroom" onsubmit="return validateForm()" method="post" enctype="multipart/form-data">
                <div class="name ip">
                    <div class="info">
                        <div>
                            Tên phòng:
                            <input type="text" id="name" name="name" value="${r.name}" >
                            <span class="error-message" style="color:red"></span>
                        </div>
                        <div>
                            Mô tả phòng:
                            <textarea id="namedes" name="describe" rows="5" cols="15" >${r.describe}</textarea>
                            <span class="error-message" style="color:red"></span>
                        </div> 
                        <input type="hidden"  name="hotel_id" value="${requestScope.hotel_id}" required>
                        <input type="hidden"  name="id" value="${r.id}" required>
                    </div>
                </div>
                <div class="checktime ip">
                    <div class="info">
                        Thể loại phòng: <br/>
                        <select id="locationId" name="cate_id" >
                            <c:forEach var="lc" items="${requestScope.list}">
                                <option value="${lc.id}" ${(r.cate_id == lc.id)?"checked":""}>${lc.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="info">
                        Số lượng phòng:
                        <input type="number" id="quantity" name="quantity" value="${r.quantity}" >  
                        <span class="error-message" style="color:red"></span>
                    </div>
                    <div class="info">
                        Giá phòng:
                        <input type="number" id="price" name="price" value="${r.price}" >  
                        <span class="error-message" style="color:red"></span>
                    </div>
                </div>

                <div class="more">
                    <div class="utilities ip">
                        Tiện ích: <br/>
                        <input style="margin: 10px" type="checkbox" name="utilities" value="Không hút thuốc" ${(r.utilities.contains("Không hút thuốc"))?"checked":""} />
                        <i class="fas fa-smoking-ban"></i> Không hút thuốc <br/>

                        <input style="margin: 10px" type="checkbox" name="utilities" value="Hướng Thành phố" ${(r.utilities.contains("Hướng Thành phố"))?"checked":""} />
                        <i class="fas fa-city"></i> Hướng Thành phố <br/>

                        <input style="margin: 10px" type="checkbox" name="utilities" value="Phòng tắm vòi sen & bồn tắm" ${(r.utilities.contains("Phòng tắm vòi sen & bồn tắm"))?"checked":""} />
                        <i class="fas fa-bath"></i> Phòng tắm vòi sen & bồn tắm <br/>

                        <input style="margin: 10px" type="checkbox" name="utilities" value="Wifi miễn phí" ${(r.utilities.contains("Wifi miễn phí"))?"checked":""} />
                        <i class="fas fa-wifi"></i> Wifi miễn phí <br/>

                        <input style="margin: 10px" type="checkbox" name="utilities" value="1 giường" ${(r.utilities.contains("1 giường"))?"checked":""} />
                        <i class="fas fa-bed"></i> 1 giường <br/>

                        <input style="margin: 10px" type="checkbox" name="utilities" value="2 giường" ${(r.utilities.contains("2 giường"))?"checked":""} />
                        <i class="fas fa-bed"></i> 2 giường <br/>

                        <input style="margin: 10px" type="checkbox" name="utilities" value="Dọn phòng hằng ngày" ${(r.utilities.contains("Dọn phòng hằng ngày"))?"checked":""} />
                        <i class="fas fa-broom"></i> Dọn phòng hằng ngày <br/>

                        <input style="margin: 10px" type="checkbox" name="utilities" value="Nước miễn phí" ${(r.utilities.contains("Nước miễn phí"))?"checked":""} />
                        <i class="fas fa-tint"></i> Nước miễn phí <br/>

                        <input style="margin: 10px" type="checkbox" name="utilities" value="Truyền hình cáp" ${(r.utilities.contains("Truyền hình cáp"))?"checked":""} />
                        <i class="fas fa-tv"></i> Truyền hình cáp <br/>

                        <input style="margin: 10px" type="checkbox" name="utilities" value="Các loại khăn" ${(r.utilities.contains("Các loại khăn"))?"checked":""} />
                        <i class="fas fa-hands-wash"></i> Các loại khăn <br/>

                        <input style="margin: 10px" type="checkbox" name="utilities" value="Vật dụng tắm rửa" ${(r.utilities.contains("Vật dụng tắm rửa"))?"checked":""} />
                        <i class="fas fa-soap"></i> Vật dụng tắm rửa <br/>
                    </div>
                    <div class="img ip">
                        <div class="info">
                            <label for="imageFile">Hình ảnh Phòng:</label><br/>
                            <img width="200px" src="${r.img1}" alt="" id="imagePreview" onclick="triggerFileInput('uploadInput')"/>
                            <input type="file" name="imageFile" accept="image/*"  id="uploadInput" onchange="uploadImage(event, 'imagePreview')">
                            <input type="hidden" value="${r.img1}" name="data1">
                        </div>
                        <div class="info">
                            <label for="imageFile">Hình ảnh Phòng:</label><br/>
                            <img width="200px" src="${r.img2}" alt="" id="imagePreview1" onclick="triggerFileInput('uploadInput1')"/>
                            <input type="file" name="imageFile1" accept="image/*"  id="uploadInput1" onchange="uploadImage(event, 'imagePreview1')">
                            <input type="hidden" value="${r.img2}" name="data2">
                        </div>
                        <div class="info">
                            <label for="imageFile">Hình ảnh Phòng:</label><br/>
                            <img width="200px" src="${r.img3}" alt="" id="imagePreview2" onclick="triggerFileInput('uploadInput2')"/>
                            <input type="file" name="imageFile2" accept="image/*"  id="uploadInput2" onchange="uploadImage(event, 'imagePreview2')">
                            <input type="hidden" value="${r.img3}" name="data3">
                        </div>
                        <div class="info">
                            <label for="imageFile">Hình Ảnh phòng tắm:</label><br/>
                            <img width="200px" src="${r.img4}" alt="" id="imagePreview3" onclick="triggerFileInput('uploadInput3')"/>
                            <input type="file" name="imageFile3" accept="image/*"  id="uploadInput3" onchange="uploadImage(event, 'imagePreview3')">
                            <input type="hidden" value="${r.img4}" name="data4">
                        </div>
                        <div class="info">
                            <label for="imageFile">Hình Ảnh ban công:</label><br/>
                            <img width="200px" src="${r.img5}" alt="" id="imagePreview4" onclick="triggerFileInput('uploadInput4')"/>
                            <input type="file" name="imageFile4" accept="image/*"  id="uploadInput4" onchange="uploadImage(event, 'imagePreview4')">
                            <input type="hidden" value="${r.img5}" name="data5">

                        </div>
                    </div>
                </div>

                <div class="submit">
                    <input type="submit" name="" value="chỉnh sửa" />
                </div>
<!--                <a class="post" href="#" onclick="DoDelete('${r.id}','${requestScope.hotel_id}')">Xóa phòng này khỏi khách sạn của tôi </a>-->
            </form>
        </div>

        <script>
            
            function validateForm() {
                let isValid = true;

                // Lấy giá trị của các trường input
                const name = document.getElementById('name');
                const namedes = document.getElementById('namedes');
                const quantity = document.getElementById('quantity');
                const price = document.getElementById('price');

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

                // Kiểm tra
                if (namedes.value.trim() === "" || specialCharRegex.test(namedes.value)) {
                    showError(namedes, "Mô tả không được để trống và không chứa ký tự đặc biệt.");
                    isValid = false;
                } else {
                    clearError(namedes);
                }

                // Kiểm tra
                if (quantity.value === "" || isNaN(quantity.value) || quantity.value < 1) {
                    showError(quantity, "Số lượng phải là một số lớn hơn 0.");
                    isValid = false;
                } else {
                    clearError(quantity);
                }

                // Kiểm tra
                if (price.value === "" || isNaN(price.value) || price.value < 5000 || price.value % 1000 !== 0) {
                    showError(price, "Giá phải là một số lớn hơn hoặc bằng 5000 và phải chia hết cho 1000");
                    isValid = false;
                } else {
                    clearError(price);
                }


                return isValid;
            }
            
            
            function triggerFileInput(t) {
                document.getElementById(t).click();
            }

            function uploadImage(event, t) {
                var input = event.target;
                var preview = document.getElementById(t);

                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        preview.src = e.target.result;
                    };


                    reader.readAsDataURL(input.files[0]);
                }
            }

            function DoDelete(id,id2) {
                if (confirm("Bạn chắc muốn xóa phòng này chứ")) {
                    window.location = "deleteroom?id=" + id+"&hotel_id="+id2;
                }
            }
        </script>
    </body>
</html>
