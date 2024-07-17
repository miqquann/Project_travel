<%-- 
    Document   : updateDiscountAD
    Created on : Jun 27, 2024, 3:21:17 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Basic Page Needs -->
        <meta charset="utf-8">
        <title>Update Discount</title>
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
                                        <h3>Chỉnh sửa mã giảm giá</h3>
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
                                                <div class="text-tiny">Chỉnh sửa Mã Giảm Giá</div>
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

                                    <!-- form-update-discount -->
                                    <form action="updateDiscountAD" onsubmit="return validateForm()" method="post" enctype="multipart/form-data" class="tf-section-2 form-update-discount">

                                        <c:set value="${requestScope.Discount}" var="d"/>
                                        <div class="wg-box">
                                            <fieldset class="name">
                                                <div class="body-title mb-10">Mã voucher<span class="tf-color-1">*</span></div>
                                                <input id="discountInput" class="mb-10" type="text" placeholder="Mã giảm giá" name="discount_id" tabindex="0" value="${d.discount_id}" aria-required="true" required="" readonly>
                                            </fieldset>
                                            <div class="gap22 cols">
                                                <fieldset class="name" id="discount">
                                                    <div class="body-title mb-10">Loại mã giảm giá<span class="tf-color-1">*</span></div>
                                                    <input id='percentInput' name="type_percent" type="text"value="${(d.type_percent == 1)?"%":"VND"}" min="1" max="100" aria-required="true" required readonly>
                                                </fieldset>

                                                <fieldset class="name" id="discount">
                                                    <div class="body-title mb-10">Giá được giảm<span class="tf-color-1">*</span></div>
                                                    <input id='percentInput' name="percent" type="number"value="${d.percent}" min="1" max="100" aria-required="true" required readonly>
                                                </fieldset>
                                            </div>

                                            <fieldset class="quanlity">
                                                <div class="body-title mb-10">Số lượng mã<span class="tf-color-1">*</span></div>
                                                <input id="quantityInput" class="mb-10" name="quantity" type="number" placeholder="Số lượng mã" value="${d.quantity}" name="text" tabindex="0"  aria-required="true" >
                                                <span class="error-message" style="color:red"></span>
                                            </fieldset>

                                            <fieldset class="description">
                                                <div class="body-title mb-10">Mô tả <span class="tf-color-1">*</span></div>
                                                <textarea id="desInput" class="mb-10" name="description" placeholder="Description" tabindex="0" aria-required="true" >${d.describe_discount}</textarea>
                                                <span class="error-message" style="color:red"></span>
                                            </fieldset>
                                        </div>
                                        <div class="wg-box">
                                            <fieldset>
                                                <div class="body-title mb-10">Tải ảnh</div>
                                                <div class="upload-image mb-16">
                                                    <div class="item up-load">
                                                        <img style="border-radius: 10px;object-fit: cover" width="100%" height="auto" src="${d.img_discount}" alt="" id="imagePreview" onclick="triggerFileInput('uploadInput')"/>
                                                        <input style="display: none" type="file" name="imageFile" accept="image/*" id="uploadInput" onchange="uploadImage(event, 'imagePreview')">
                                                        <input type="hidden" value="${d.img_discount}" name="data">
                                                    </div>
                                                </div>
                                            </fieldset>
                                            <div class="cols gap22">
                                                <fieldset class="name">
                                                    <div>
                                                        <p>Ngày bắt đầu <input type="date" id="date1" name="dateRange1" class="date-picker" value="${d.startdate}" required=""></p>
                                                        <p>Ngày kết thúc <input type="date" id="date2" name="dateRange2" class="date-picker" value="${d.enddate}" required=""></p>
                                                    </div>
                                                </fieldset>
                                            </div>

                                            <div class="cols gap10">
                                                <a href="#"><button class="tf-button w-full" type="submit">Chỉnh sửa mã giảm giá</button></a>
                                            </div>
                                        </div>


                                    </form>
                                    <!-- /form-update-discount -->
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
            const quantity = document.getElementById('quantityInput');
            const description = document.getElementById('desInput');

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
          
            // Kiểm tra trường quantity
            if (quantity.value === "" || isNaN(quantity.value) || quantity.value < 1) {
                showError(quantity, "Số lượng phải là một số lớn hơn 0.");
                isValid = false;
            } else {
                clearError(quantity);
            }

            // Kiểm tra trường description
            if (description.value.trim() === "" || specialCharRegex.test(description.value)) {
                showError(description, "Mô tả không được để trống ");
                isValid = false;
            } else {
                clearError(description);
            }         
            return isValid ;
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

                                                                function triggerFileInput(id) {
                                                                document.getElementById(id).click();
                                                            }

                                                            function uploadImage(event, previewId) {
                                                                var input = event.target;
                                                                var reader = new FileReader();
                                                                reader.onload = function () {
                                                                    var dataURL = reader.result;
                                                                    var output = document.getElementById(previewId);
                                                                    output.src = dataURL;
                                                                };
                                                                reader.readAsDataURL(input.files[0]);
                                                            }
            </script>
        </div>
    </body>
</html>
