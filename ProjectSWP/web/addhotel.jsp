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
                    <li> <a href="#">Thêm khách sạn</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() == 2 || sessionScope.account.getRoleID() == 3 )}">
                    <li> <a href="updateprofile">Hồ sơ của tôi</a></li>
                    </c:if>
                <li> <a href="logout">Đăng xuất</a></li>               
            </ul>
        </nav>
        <div class="hotel-container">
            <form action="addhotel" onsubmit="return validateForm()" method="post" enctype="multipart/form-data" id="addhotel">
                <div class="name ip">
                    <div class="info">
                        <div>
                        Tên khách sạn:
                        <input type="text" id="name" name="name" value=""  >
                        <span class="error-message" style="color:red"></span>
                        </div>
                        <div>
                        Mô tả khách sạn:
                        <textarea id="namedes" name="describe" rows="5" cols="15" ></textarea>
                        <span class="error-message" style="color:red"></span>
                        </div>
                    </div>
                </div>
                <div class="address ip">
                    <div class="info">
                        Thành Phố:
                        <select id="locationId" name="locationId" >
                            <c:forEach var="lc" items="${requestScope.listcity}">
                                <option value="${lc.id}">${lc.city}</option>
                            </c:forEach>
                        </select>
                    </div>                    
                    <div class="info">
                        Địa chỉ cụ thể:
                        <input id="address" type="text" name="address" value="" />
                        <span class="error-message" style="color:red"></span>
                    </div>
                </div>
                <div class="refund ip">
                    <div class="info">
                        <input type="radio" name="refund" value="true" checked="" />Hủy miễn phí (hoàn 100%)
                    </div>
                    <div class="info">
                        <input type="radio" name="refund" value="false" />Hủy sẽ mất toàn bộ chi phí
                    </div>
                </div>
                <div  class="checktime ip">
                    <div id="time">
                        <div class="info">
                        Giờ nhận phòng:
                        <input type="time" id="checkin" name="checkin"  value="" >  
                    </div>
                    <div class="info">
                        Giờ trả phòng:
                        <input type="time" id="checkout" name="checkout"  value="">  
                    </div>
                    </div>
                    <span class="error-message" style="color:red"></span>
                </div>
                <div class="utilities ip">
                    Bạn có thể đáp ứng được những tiện ích nào? <br/>
                    <input style="margin: 10px" type="checkbox" name="utilities" value="Tiếp tân [24h]" />
                    <i class="fas fa-concierge-bell"></i> Tiếp tân [24h] <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Bãi để xe" />
                    <i class="fas fa-parking"></i> Bãi để xe <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Khu vực hút thuốc" />
                    <i class="fas fa-smoking"></i> Khu vực hút thuốc <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Được phép mang thú cưng" />
                    <i class="fas fa-paw"></i> Được phép mang thú cưng <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="buffet sáng" />
                    <i class="fas fa-utensils"></i> buffet sáng <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Phòng tập" />
                    <i class="fas fa-dumbbell"></i> Phòng tập <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Hồ Bơi" />
                    <i class="fas fa-swimming-pool"></i> Hồ Bơi <br/>

                    <input style="margin: 10px" type="checkbox" name="utilities" value="Nhận/trả phòng [nhanh]" />
                    <i class="fas fa-clock"></i> Nhận/trả phòng [nhanh] <br/>
                </div>
                <div class="img ip">
                    <div class="info">
                        <label for="imageFile">Hình ảnh khách Sạn:</label><br/>
                        <input type="file" id="imageFile1" name="imageFile" accept="image/*" required="">
                    </div>
                    <div class="info">
                        <label for="imageFile">Hình ảnh sảnh chính:</label><br/>
                        <input type="file" id="imageFile2" name="imageFile1" accept="image/*" required="">
                    </div>
                    <div class="info">
                        <label for="imageFile">Hình Ảnh cảnh quan:</label><br/>
                        <input type="file" id="imageFile3" name="imageFile2" accept="image/*" required="">
                    </div>
                </div>
                <div class="hd">
                    <p>Bạn có trách nhiệm xem xét luật pháp và thuế địa phương.
                        Hãy tìm hiểu các quy định, luật pháp và nghĩa vụ thuế tại địa phương của bạn trước khi bạn đặt chỗ. Nhiều quốc gia và một số thành phố có luật cụ thể về việc sử dụng tài sản của bạn dưới dạng cho thuê ngắn hạn, chia sẻ nhà và/hoặc cho thuê chỗ ở chuyên nghiệp. Bạn có trách nhiệm làm việc trong khuôn khổ pháp lý của quốc gia mình, có thể bao gồm việc xin giấy phép, giấy phép hoặc đăng ký liên quan trước khi đặt chỗ và thanh toán mọi khoản thuế hiện hành đối với mọi thu nhập bạn tạo ra từ việc đặt chỗ đó.</p>
                    <p>Theo Đạo luật Dịch vụ Kỹ thuật số (DSA), danh sách chỗ nghỉ của bạn trên agoda sẽ không được hiển thị cho khách hàng ở EU cho đến khi 1) bạn cung cấp thông tin theo yêu cầu của DSA và 2) thông tin đó được xác minh. Bạn sẽ có thể cung cấp thông tin này cho agoda tại Trung tâm Tuân thủ YCS từ tháng 6 năm 2024.</p>
                    <p>Hoa hồng theo hợp đồng 5%</p>
                </div>
                <div class="submit">
                    <input type="submit" name="" value="xác nhận" />
                </div>
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
            if (name.value.trim() === "" || specialCharRegex.test(name.value)) {
                showError(name, "Tên không được để trống và không chứa ký tự đặc biệt.");
                isValid = false;
            } else {
                clearError(name);
            }
            
            //Kiểm tra
            if(checkoutDate > checkinDate){
                showError(time, 'Thời gian trả phòng phải sớm hơn ít nhất 2 tiếng so với thời gian nhận phòng!');
                isValid = false; 
            }else {
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
