<%-- 
    Document   : listDiscountAD
    Created on : Jun 26, 2024, 8:27:39 PM
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Basic Page Needs -->
        <meta charset="utf-8">

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
        <style>
            .wg-table.table-product-list .product-item > .flex > div{
                width: 0px;
            }
        </style>
    </head>
    <body>
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
                                <img style="width: 220px; margin-left: 450px;" src="img/logo.png" alt="">
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
                                    <h3>Danh sách tour du lịch</h3>
                                </div>
                                <c:if test="${not empty successMessage}">
                                    <div id="successMessage" class="alert alert-success">${successMessage}</div>
                                </c:if>

                                <!-- Thông báo lỗi -->
                                <c:if test="${not empty errorMessage}">
                                    <div id="errorMessage" class="alert alert-danger">${errorMessage}</div>
                                </c:if>
                                <!-- product-list -->
                                <div class="wg-box">

                                    <div class="title-box">
                                        <i class="icon-coffee"></i>
                                        <div class="body-text">Tìm kiếm tour</div>
                                    </div>
                                    <div class="flex items-center justify-between gap10 flex-wrap">
                                        <div class="wg-filter flex-grow">
                                            <div class="show">
                                                <div class="text-tiny">Hiển thị</div>
                                                <div class="select">
                                                    <form id="paginationForm" method="GET" action="listtour">
                                                        <select name="limit" onchange="document.getElementById('paginationForm').submit();">
                                                            <option value="5" ${limit == 5 ? 'selected' : ''}>5</option>
                                                            <option value="10" ${limit == 10 ? 'selected' : ''}>10</option>
                                                            <option value="15" ${limit == 15 ? 'selected' : ''}>15</option>
                                                        </select>
                                                    </form>
                                                </div>
                                                <div class="text-tiny">mã</div>
                                            </div>
                                            <form action="searchDiscountAD" method="post" class="form-search">
                                                <fieldset class="name">
                                                    <input type="text"  class="" name="name" tabindex="2" value="${requestScope.query}" aria-required="true" required="" placeholder="${requestScope.error}" >
                                                </fieldset>
                                                <div class="button-submit">
                                                    <button class="" type="submit"><i class="icon-search"></i></button>
                                                </div>
                                            </form>
                                        </div>
                                        <a class="tf-button style-1 w208" href="addtour"><i class="icon-plus"></i>Thêm tour mới</a>
                                    </div>
                                    <div class="wg-table table-product-list">
                                        <ul style="justify-content:flex-start" class="table-title flex gap20 mb-14">
                                            <li style="width:190px">
                                                <div class="body-title">Tên tour</div>
                                            </li>
                                            <li style="width:100px">
                                                <div class="body-title">Địa điểm</div>
                                            </li>
                                            <li style="width:170px">
                                                <div class="body-title">Mô tả</div>
                                            </li>
                                            <li style="width:130px">
                                                <div class="body-title">Số lượng người mỗi tour</div>
                                            </li>
                                            <li style="width:130px">
                                                <div class="body-title">Trạng thái</div>
                                            </li>
                                            <li style="width:130px">
                                                <div class="body-title">Giá</div>
                                            </li>
                                            <li>
                                                <div class="body-title">Action</div>
                                            </li>
                                        </ul>
                                        <ul class="flex flex-column">
                                            <c:forEach items="${requestScope.listt}" var="l"> 
                                                <li class="product-item gap14">
                                                    <div class="image no-bg">
                                                        <img src="${l.tour_img}" alt="">
                                                    </div>
                                                    <div style="justify-content:flex-start" class="flex items-center justify-between gap20 flex-grow">
                                                        <div style="width:130px" class="name">
                                                            <a  class="body-title-2">${l.tour_name}</a>
                                                        </div>
                                                        <div style="width:100px" class="body-text">
                                                            ${l.city}
                                                        </div>
                                                        <div style="width:170px" class="body-text">${l.tour_describe}</div>
                                                        <div style="width:130px" class="body-text">${l.quantity}</div>
                                                        <div style="width:130px">
                                                            ${(l.status)?"Hoạt động":"Tạm dừng"}
                                                        </div>
                                                        <div style="width:130px" class="body-text">${l.price}</div>
                                                        <div class="list-icon-function">
                                                            <a href="updatetour?tour_id=${l.tour_id}" class="item edit">
                                                                <i class="icon-edit-3"></i>
                                                            </a>
                                                                <form action="editstatustour" method="post" onsubmit="return confirm('Bạn có chắc chắn muốn thay đổi trạng thái?');">
                                                                    <input type="hidden" name="id" value="${l.tour_id}" />
                                                                    <input type="hidden" name="status" value="${l.status}" />
                                                                    <button type="submit" class="icon-trash-2"></button>
                                                                </form>
                                                        </div>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <div class="divider"></div>
                                    <div class="flex items-center justify-between flex-wrap gap10">
                                        <div class="text-tiny">Showing ${totalEntries} entries</div>
                                        <ul class="wg-pagination">
                                            <li>
                                                <a href="listDiscount?page=${currentPage - 1 <= 0 ? 1 : currentPage - 1}&limit=${limit}" ${currentPage == 1 ? 'class="disabled"' : ''}>
                                                    <i class="icon-chevron-left"></i>
                                                </a>
                                            </li>
                                            <c:forEach var="i" begin="1" end="${totalPages}">
                                                <li class="${currentPage == i ? 'active' : ''}">
                                                    <a href="listDiscount?page=${i}&limit=${limit}">${i}</a>
                                                </li>
                                            </c:forEach>
                                            <li>
                                                <a href="listDiscount?page=${currentPage + 1 > totalPages ? totalPages : currentPage + 1}&limit=${limit}" ${currentPage == totalPages ? 'class="disabled"' : ''}>
                                                    <i class="icon-chevron-right"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>

                                </div>

                                <!-- /product-list -->
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
                                    function confirmDelete() {
                                        return confirm("Bạn có chắc chắn muốn xóa discount này?");
                                    }
        </script>

        <script>
            $(document).ready(function () {
                setTimeout(function () {
                    $('#successMessage, #errorMessage').fadeOut('slow');
                }, 5000);
            });
        </script>

    </body>
</html>
