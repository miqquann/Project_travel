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

            textArea{
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

                    <li> <a href="#">Thêm Phòng</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() == 2 || sessionScope.account.getRoleID() == 3 )}">
                    <li> <a href="updateprofile">Hồ sơ của tôi</a></li>
                    </c:if>
                <li> <a href="logout">Đăng xuất</a></li>               
            </ul>
        </nav>
        <div class="hotel-container">
            <form action="addroom" onsubmit="return validateForm()" method="post" enctype="multipart/form-data">
                <div class="name ip">
                    <div class="info">
                        <input type="hidden" name="hotel_id" value="${requestScope.hotel_id}" >
                        <div>
                            Tên phòng:
                            <input type="text" id="name" name="name" value="" >
                            <span class="error-message" style="color:red"></span>
                        </div>
                        <div>
                            Mô tả phòng:
                            <textarea id="namedes" name="describe" rows="5" cols="15" ></textarea>
                            <span class="error-message" style="color:red"></span>
                        </div>                       
                    </div>
                </div>
                <div class="checktime ip">
                    <div class="info">
                        Thể loại phòng: <br/>
                        <select id="locationId" name="cate_id" required>
                            <c:forEach var="lc" items="${requestScope.list}">
                                <option value="${lc.id}">${lc.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="info">
                        Số lượng phòng:
                        <input type="number" id="quantity" name="quantity" value="" >  
                        <span class="error-message" style="color:red"></span>
                    </div>
                    <div class="info">
                        Giá phòng:
                        <input type="number" id="price" name="price" value="" >  
                        <span class="error-message" style="color:red"></span>
                    </div>
                </div>

                <div class="utilities ip">
                    Tiện ích: <br/>
                    <input style="margin: 10px" type="checkbox" name="utilities" value="Không hút thuốc" />
                    <i class="fas fa-smoking-ban"></i> Không hút thuốc <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Hướng Thành phố" />
                    <i class="fas fa-city"></i> Hướng Thành phố <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Phòng tắm vòi sen & bồn tắm" />
                    <i class="fas fa-bath"></i> Phòng tắm vòi sen & bồn tắm <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Wifi miễn phí" />
                    <i class="fas fa-wifi"></i> Wifi miễn phí <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="1 giường" />
                    <i class="fas fa-bed"></i> 1 giường <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="2 giường" />
                    <i class="fas fa-bed"></i> 2 giường <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Dọn phòng hằng ngày" />
                    <i class="fas fa-broom"></i> Dọn phòng hằng ngày <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Nước miễn phí" />
                    <i class="fas fa-tint"></i> Nước miễn phí <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Truyền hình cáp" />
                    <i class="fas fa-tv"></i> Truyền hình cáp <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Các loại khắn" />
                    <i class="fas fa-hands-wash"></i> Các loại khăn <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Vật dụng tắm rửa" />
                    <i class="fas fa-soap"></i> Vật dụng tắm rửa <br/>
                </div>
                <div class="img ip">
                    <div class="info">
                        <label for="imageFile">Hình ảnh phòng:</label><br/>
                        <input type="file" id="imageFile" name="imageFile" accept="image/*" required>
                    </div>
                    <div class="info">
                        <label for="imageFile">Hình ảnh phòng:</label><br/>
                        <input type="file" id="imageFile" name="imageFile1" accept="image/*" required>
                    </div>
                    <div class="info">
                        <label for="imageFile">Hình Ảnh phòng:</label><br/>
                        <input type="file" id="imageFile" name="imageFile2" accept="image/*" required>
                    </div>
                    <div class="info">
                        <label for="imageFile">Hình Ảnh phòng tắm:</label><br/>
                        <input type="file" id="imageFile" name="imageFile3" accept="image/*" required>
                    </div>
                    <div class="info">
                        <label for="imageFile">Hình Ảnh ban công:</label><br/>
                        <input type="file" id="imageFile" name="imageFile4" accept="image/*" required>
                    </div>
                </div>
                <div class="hd">
                    <p>Bạn có trách nhiệm xem xét luật pháp và thuế địa phương.
                        Hãy tìm hiểu các quy định, luật pháp và nghĩa vụ thuế tại địa phương của bạn trước khi bạn đặt chỗ. Nhiều quốc gia và một số thành phố có luật cụ thể về việc sử dụng tài sản của bạn dưới dạng cho thuê ngắn hạn, chia sẻ nhà và/hoặc cho thuê chỗ ở chuyên nghiệp. Bạn có trách nhiệm làm việc trong khuôn khổ pháp lý của quốc gia mình, có thể bao gồm việc xin giấy phép, giấy phép hoặc đăng ký liên quan trước khi đặt chỗ và thanh toán mọi khoản thuế hiện hành đối với mọi thu nhập bạn tạo ra từ việc đặt chỗ đó.</p>
                    <p>Theo Đạo luật Dịch vụ Kỹ thuật số (DSA), danh sách chỗ nghỉ của bạn trên agoda sẽ không được hiển thị cho khách hàng ở EU cho đến khi 1) bạn cung cấp thông tin theo yêu cầu của DSA và 2) thông tin đó được xác minh. Bạn sẽ có thể cung cấp thông tin này cho agoda tại Trung tâm Tuân thủ YCS từ tháng 6 năm 2024.</p>
                    <p>Hoa hồng theo hợp đồng 5%</p>
                </div>
                <div>
                    <input type="submit" name="" value="xác nhận" />
                </div>
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



            function uploadImage(event) {
                var input = event.target;

                // Kiểm tra xem người dùng đã chọn file chưa
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    // Đọc file ảnh
                    reader.readAsDataURL(input.files[0]);
                }
            }
        </script>
    </body>
</html>
