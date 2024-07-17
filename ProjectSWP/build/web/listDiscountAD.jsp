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
                                    <h3>Danh sách mã giảm giá</h3>
                                    <ul class="breadcrumbs flex items-center flex-wrap justify-start gap10">
                                        <li>
                                            <a href="homeadmin"><div class="text-tiny">Trang chủ</div></a>
                                        </li>
                                        <li>
                                            <i class="icon-chevron-right"></i>
                                        </li>
                                        <li>
                                            <a href="#"><div class="text-tiny">Khuyến mại</div></a>
                                        </li>
                                        <li>
                                            <i class="icon-chevron-right"></i>
                                        </li>
                                        <li>
                                            <div class="text-tiny">Danh sách mã giảm giá</div>
                                        </li>
                                    </ul>
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
                                    <div class="dropdown default">
                                        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <span class="icon-more"><i class="icon-more-horizontal"></i></span>
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-end">
                                            <li>
                                                <a href="filterDiscountAD?isOrder=1">Mã còn sử dụng được</a>
                                            </li>
                                            <li>
                                                <a href="filterDiscountAD?isOrder=0">Mã không còn sử dụng được</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <div class="title-box">
                                        <i class="icon-coffee"></i>
                                        <div class="body-text">Bạn hãy tìm mã giảm giá theo tên mã giảm giá mà bạn muốn tìm</div>
                                    </div>
                                    <div class="flex items-center justify-between gap10 flex-wrap">
                                        <div class="wg-filter flex-grow">
                                            <div class="show">
                                                <div class="text-tiny">Hiển thị</div>
                                                <div class="select">
                                                    <form id="paginationForm" method="GET" action="listDiscount">
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
                                        <a class="tf-button style-1 w208" href="addnewdiscount"><i class="icon-plus"></i>Tạo mã giảm giá</a>
                                    </div>
                                    <div class="wg-table table-product-list">
                                        <ul style="justify-content:flex-start" class="table-title flex gap20 mb-14">
                                            <li style="width:230px">
                                                <div class="body-title">Mã</div>
                                            </li>
                                            <li style="width:100px">
                                                <div class="body-title">Giá giảm</div>
                                            </li>
                                            <li style="width:100px">
                                                <div class="body-title">Số lượng</div>
                                            </li>
                                            <li style="width:130px">
                                                <div class="body-title">Ngày bắt đầu</div>
                                            </li>
                                            <li style="width:130px">
                                                <div class="body-title">Ngày kết thúc</div>
                                            </li>
                                            <li style="width:130px">
                                                <div class="body-title">Tình trạng</div>
                                            </li>
                                            <li style="width:200px">
                                                <div class="body-title">Mô tả</div>
                                            </li>
                                            <li>
                                                <div class="body-title">Action</div>
                                            </li>
                                        </ul>
                                        <ul class="flex flex-column">
                                            <c:forEach items="${discounts}" var="d"> 
                                                <li class="product-item gap14">
                                                    <div class="image no-bg">
                                                        <img src="${d.img_discount}" alt="">
                                                    </div>
                                                    <div style="justify-content:flex-start" class="flex items-center justify-between gap20 flex-grow">
                                                        <div style="width:166px" class="name">
                                                            <a  class="body-title-2">${d.discount_id}</a>
                                                        </div>
                                                        <div style="width:100px" class="body-text">
                                                            <c:choose>
                                                                <c:when test="${d.type_percent == 1}">
                                                                    ${d.percent}%
                                                                </c:when>
                                                                <c:otherwise>
                                                                    ${d.percent} VND
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <div style="width:100px" class="body-text">${d.quantity}</div>
                                                        <div style="width:130px" class="body-text">${d.startdate}</div>
                                                        <div style="width:130px" class="body-text">${d.enddate}</div>
                                                        <div style="width:130px">
                                                            <div class="block-not-available" style="color: <c:out value='${d.status == "hoạt động" ? "green" : "orange"}' />;">
                                                                ${d.status}
                                                            </div>
                                                        </div>
                                                        <div style="width:200px" class="body-text">${d.describe_discount}</div>
                                                        <div class="list-icon-function">
                                                            <a href="updateDiscountAD?discount_id=${d.discount_id}" class="item edit">
                                                                <i class="icon-edit-3"></i>
                                                            </a>
                                                            <c:if test="${d.status == 'không hoạt động'}">
                                                                <form action="listDiscount" method="post" onsubmit="return confirm('Bạn có chắc chắn muốn xóa mã này?');">
                                                                    <input type="hidden" name="id" value="${d.discount_id}" />
                                                                    <input type="hidden" name="action" value="delete" />
                                                                    <button type="submit" class="icon-trash-2"></button>
                                                                </form>
                                                            </c:if>
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
