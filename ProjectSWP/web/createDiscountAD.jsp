<%-- 
    Document   : haha
    Created on : Jun 24, 2024, 2:39:42 AM
    Author     : Admin
--%>

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
                <%@ include file="mainAdmin.jsp" %>
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
                                    <h3>Tạo mã giảm giá</h3>
                                    <ul class="breadcrumbs flex items-center flex-wrap justify-start gap10">
                                        <li>
                                            <a href="homeadmin"><div class="text-tiny">Trang chủ</div></a>
                                        </li>
                                        <li>
                                            <i class="icon-chevron-right"></i>
                                        </li>
                                        <li>
                                            <a href="#"><div class="text-tiny">Khuyến Mại</div></a>
                                        </li>
                                        <li>
                                            <i class="icon-chevron-right"></i>
                                        </li>
                                        <li>
                                            <div class="text-tiny">Tạo Mã Giảm Giá</div>
                                        </li>
                                    </ul>
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

                                <!-- form-add-product -->
                                <form action="addnewdiscount" method="post" onsubmit="return validateForm()" enctype="multipart/form-data" class="tf-section-2 form-add-product">
                                    <div class="wg-box">
                                        <fieldset class="name">
                                            <div class="body-title mb-10">Mã voucher<span class="tf-color-1">*</span></div>
                                            <input id="discountInput" class="mb-10" type="text" placeholder="Mã giảm giá" name="discount_id" tabindex="0" value="" aria-required="true" >
                                            <span class="error-message" style="color:red"></span>
                                        </fieldset>
                                        <div class="gap22 cols">
                                            <fieldset class="category">
                                                <div class="body-title mb-10">Loại mã giảm giá <span class="tf-color-1">*</span></div>
                                                <div class="select">
                                                    <select id="discountType" name="type_percent">
                                                        <option>Chọn loại</option>
                                                        <option value="%">%</option>
                                                        <option value="VND">VNĐ</option>
                                                    </select>
                                                    <span class="error-message" style="color:red"></span>
                                                </div>
                                            </fieldset>

                                            <fieldset class="name" id="discount"></fieldset>
                                        </div>

                                        <fieldset class="quanlity">
                                            <div class="body-title mb-10">Số lượng mã<span class="tf-color-1">*</span></div>
                                            <input id="quantityInput" class="mb-10" name="quantity" type="number" placeholder="Số lượng mã" name="text" tabindex="0" min="1" step="1" aria-required="true" >
                                            <span class="error-message" style="color:red"></span>
                                        </fieldset>

                                        <fieldset class="description">
                                            <div class="body-title mb-10">Mô tả <span class="tf-color-1">*</span></div>
                                            <textarea id="desInput" class="mb-10" name="description" placeholder="Description" tabindex="0" aria-required="true" ></textarea>
                                            <span class="error-message" style="color:red"></span>
                                        </fieldset>
                                    </div>
                                    <div class="wg-box">
                                        <fieldset>
                                            <div class="body-title mb-10">Tải ảnh</div>
                                            <div class="upload-image mb-16">
                                                <div class="item up-load">
                                                    <img style="border-radius: 10px;object-fit: cover" width="100%" height="auto" src="" alt="" id="imagePreview" onclick="triggerFileInput('uploadInput')"/>
                                                    <input style="display: none" type="file" name="imageFile" accept="image/*" id="uploadInput" onchange="uploadImage(event, 'imagePreview')" >
                                                    <span class="error-message" style="color:red"></span>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <div class="cols gap22">
                                            <fieldset class="name">
                                                <div>
                                                    <p>Ngày bắt đầu <input type="date" id="date1" name="dateRange1" class="date-picker" required=""></p>
                                                    <span class="error-message" style="color:red"></span>
                                                </div>
                                                <div>
                                                    <p>Ngày kết thúc <input type="date" id="date2" name="dateRange2" class="date-picker" required=""></p>
                                                    <span class="error-message" style="color:red"></span>
                                                </div>
                                            </fieldset>
                                        </div>

                                        <div class="cols gap10">
                                            <a href="#"><button class="tf-button w-full" type="submit">Tạo mã giảm giá</button></a>
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
            
            function validateForm() {
            let isValid = true;

            // Lấy giá trị của các trường input
            const discountInput = document.getElementById('discountInput');
            const quantity = document.getElementById('quantityInput');
            const description = document.getElementById('desInput');
            const imageFile = document.getElementById('uploadInput');
            const discountType = document.getElementById('discountType');
            const percentInput = document.getElementById('percentInput');
            const vndInput = document.getElementById('vndInput');

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
            if (discountInput.value.trim() === "" || specialCharRegex.test(tourName.value)) {
                showError(discountInput, "Mã không được để trống và không chứa ký tự đặc biệt.");
                isValid = false;
            } else {
                clearError(discountInput);
            }
            
            // Kiểm tra 
            if (isNaN(discountType.value)) {
                showError(discountType, "Chọn 1 trong 2");
                isValid = false;
            } else {
                clearError(discountType);
            }

            // Kiểm tra trường quantity
            if (quantity.value === "" || isNaN(quantity.value) || quantity.value < 1) {
                showError(quantity, "Số lượng phải là một số lớn hơn 0.");
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
            
            return isValid ;
        }
        
        
            document.getElementById('discountType').addEventListener('change', function () {
                $('#discount').empty();
                if (this.value === '%') {
                    $('#discount').html(`<div class="body-title mb-10">Giá được giảm<span class="tf-color-1">*</span></div>
                                        <input oninput="checkPercentInput()" id='percentInput' name="percentInput" type="number" placeholder="Giá giảm (%)" min="1" max="100" aria-required="true" required>`);
                } else if (this.value === 'VND') {
                    $('#discount').html(`<div class="body-title mb-10">Giá được giảm<span class="tf-color-1">*</span></div>
                                        <input oninput="checkVndInput()" id='vndInput' name="vndInput" type="text" placeholder="Giá giảm (VNĐ)" aria-required="true" required>`);
                }
            });

            function checkPercentInput() {
                var value = this.value;
                if (value && (parseInt(value) < 1 || parseInt(value) > 100 || isNaN(parseInt(value)))) {
                    this.value = '';
                }
            }

            function checkVndInput() {
                var value = this.value;
                if (value && (parseInt(value) < 1 || isNaN(parseInt(value)))) {
                    this.value = '';
                }
            }
            
            var today = new Date().toISOString().split('T')[0];
            var today1 = new Date();
            today1.setDate(today1.getDate() + 1);
            var tomorrow = today1.toISOString().split('T')[0];
            var date1 = document.getElementById('date1');
            var date2 = document.getElementById('date2');
            date1.setAttribute('min', today);
            date2.setAttribute('min', tomorrow);
            date1.onchange = function () {
                var x = new Date(date1.value);
                x.setDate(x.getDate()+1);
                date2.setAttribute('min', x.toISOString().split('T')[0]);
            };

            date2.onchange = function () {
                var x = new Date(date2.value);
                x.setDate(x.getDate()-1);
                date1.setAttribute('max', x.toISOString().split('T')[0]);
            };

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
        </script>
    </body>
</html>





