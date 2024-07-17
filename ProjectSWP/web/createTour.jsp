<%-- 
    Document   : haha
    Created on : Jun 24, 2024, 2:39:42 AM
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Basic Page Needs -->
    <meta charset="utf-8">
    <title>Create Discount</title>
    <!-- Theme Style -->
    <link rel="stylesheet" type="text/css" href="css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="css/animation.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-select.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <!-- Font -->
    <link rel="stylesheet" href="fonts/fonts.css">
    <!-- Icon -->
    <link rel="stylesheet" href="icon/style.css">
    <!-- Favicon and Touch Icons  -->
    <link rel="shortcut icon" href="img/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="imgages/favicon.png">
</head>
<body>
    <div id="wrapper">
        <!-- #page -->
        <div id="page" class="">
            <!-- layout-wrap -->
            <div class="layout-wrap">
                <!-- preload -->
                <%@ include file="mainSuplier.jsp" %>
                <!-- /section-menu-left -->
                <!-- section-content-right -->
                <div class="section-content-right">
                    <!-- header-dashboard -->
                    <div class="header-dashboard">
                        <div class="wrap">
                            <div class="header-left">
                                <div class="button-show-hide">
                                    <i class="icon-menu-left"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /header-dashboard -->
                    <!-- main-content -->
                    <div class="main-content">
                        <!-- main-content-wrap -->
                        <div class="main-content-inner">
                            <!-- main-content-wrap -->
                            <div class="main-content-wrap">
                                <div class="flex items-center flex-wrap justify-between gap20 mb-27">
                                    <h3>Tạo tour du lịch</h3>
                                </div>

                                <%-- Display success message --%>
                                <%
                                    String successMessage = (String) request.getAttribute("successMessage");
                                    if (successMessage != null) {
                                %>
                                    <div id="successMessage" class="alert alert-success"><%= successMessage %></div>
                                <%
                                    }
                                %>

                                <!-- form-add- -->
                                <form action="addtour" method="post" onsubmit="return validateForm()" enctype="multipart/form-data" class="tf-section-2 form-add-product">
        <div class="wg-box">
            <fieldset class="name">
                <div class="body-title mb-10">Tên tour<span class="tf-color-1">*</span></div>
                <input id="nameInput" class="mb-10" type="text" placeholder="Tên" name="name" tabindex="0" aria-required="true" >
                <span class="error-message" style="color:red"></span>
            </fieldset>
            <fieldset class="quanlity">
                <div class="body-title mb-10">Số lượng người tối đa<span class="tf-color-1">*</span></div>
                <input id="quantityInput" class="mb-10" name="quantity" type="number" placeholder="Số lượng "  aria-required="true" >
                <span class="error-message" style="color:red"></span>
            </fieldset>

            <fieldset class="description">
                <div class="body-title mb-10">Mô tả <span class="tf-color-1">*</span></div>
                <textarea id="describeInput" class="mb-10" name="description" placeholder="Description" tabindex="0" aria-required="true" ></textarea>
                <span class="error-message" style="color:red"></span>
            </fieldset>
        </div>
        <div class="wg-box">
            <fieldset>
                <div class="body-title mb-10">Tải ảnh</div>
                <div class="upload-image mb-16">
                    <div class="item up-load">
                        <img style="border-radius: 10px; object-fit: cover" width="100%" height="auto" src="" alt="" id="imagePreview" onclick="triggerFileInput('uploadInput')"/>
                        <input style="display: none" type="file" name="imageFile" accept="image/*" id="uploadInput" onchange="uploadImage(event, 'imagePreview')" >
                        <span class="error-message" style="color:red"></span>
                    </div>
                </div>
            </fieldset>
            <div class="cols gap22">
                <fieldset class="quanlity">
                    <div class="info">
                        <div class="body-title mb-10">Thành phố<span class="tf-color-1">*</span></div>
                        <select id="locationId" name="locationId" >
                            <c:forEach var="lc" items="${requestScope.listcity}">
                                <option value="${lc.id}">${lc.city}</option>
                            </c:forEach>
                        </select>
                        <span class="error-message" style="color:red"></span>
                    </div>
                </fieldset>
            </div>
            <div class="cols gap22">
                <fieldset class="quanlity">
                    <div class="body-title mb-10">Giá tour<span class="tf-color-1">*</span></div>
                    <input id="tourPrice" class="mb-10" name="price" type="number" placeholder="Giá"  aria-required="true">
                    <span class="error-message" style="color:red"></span>
                </fieldset>
            </div>
            <div class="cols gap10">
                <a href="#"><button class="tf-button w-full" type="submit">Tạo mã tour</button></a>
            </div>
        </div>
    </form>
                                <!-- /form-add-product -->
                            </div>
                            <!-- /main-content-wrap -->
                        </div>
                        <!-- /main-content-wrap -->
                    </div>
                    <!-- /main-content -->
                </div>
                <!-- /section-content-right -->
                <!-- /layout-wrap -->
            </div>
            <!-- /#page -->
        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-select.min.js"></script>
        <script src="js/zoom.js"></script>
        <script src="js/switcher.js"></script>
        <script src="js/theme-settings.js"></script>
        <script src="js/main_1.js"></script>
        <script>
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
            window.onload = function() {
                var successMessage = document.getElementById('successMessage');
                if (successMessage) {
                    setTimeout(function() {
                        successMessage.classList.add('fade-out');
                    }, 4000);
                    setTimeout(function() {
                        successMessage.style.display = 'none';
                    }, 5000);
                }
            };
            
            function validateForm() {
            let isValid = true;

            // Lấy giá trị của các trường input
            const tourName = document.getElementById('nameInput');
            const quantity = document.getElementById('quantityInput');
            const description = document.getElementById('describeInput');
            const imageFile = document.getElementById('uploadInput');
            const locationId = document.getElementById('locationId');
            const tourPrice = document.getElementById('tourPrice');

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

            // Kiểm tra trường tourName
            if (tourName.value.trim() === "" || specialCharRegex.test(tourName.value)) {
                showError(tourName, "Tên tour không được để trống và không chứa ký tự đặc biệt.");
                isValid = false;
            } else {
                clearError(tourName);
            }

            // Kiểm tra trường quantity
            if (quantity.value === "" || isNaN(quantity.value) || quantity.value < 1) {
                showError(quantity, "Số lượng người tối đa phải là một số lớn hơn 0.");
                isValid = false;
            } else {
                clearError(quantity);
            }

            // Kiểm tra trường description
            if (description.value.trim() === "" || specialCharRegex.test(description.value)) {
                showError(description, "Mô tả không được để trống và không chứa ký tự đặc biệt.");
                isValid = false;
            } else {
                clearError(description);
            }

            // Kiểm tra trường imageFile
            if (imageFile.files.length === 0) {
                const errorElement = imageFile.closest('.item').querySelector('.error-message');
                errorElement.textContent = "Vui lòng tải lên một hình ảnh.";
                imageFile.classList.add('error-input');
                isValid = false;
            } else {
                const errorElement = imageFile.closest('.item').querySelector('.error-message');
                errorElement.textContent = "";
                imageFile.classList.remove('error-input');
            }

            // Kiểm tra trường locationId
            if (locationId.value === "") {
                showError(locationId, "Vui lòng chọn một thành phố.");
                isValid = false;
            } else {
                clearError(locationId);
            }

            // Kiểm tra trường tourPrice
            if (tourPrice.value === "" || isNaN(tourPrice.value) || tourPrice.value < 5000 || tourPrice.value % 1000 !==0 ) {
                showError(tourPrice, "Giá tour phải là một số lớn hơn hoặc bằng 5000 và phải chia hết cho 1000");
                isValid = false;
            } else {
                clearError(tourPrice);
            }

            return isValid;
        }
        </script>
    </body>
</html>





