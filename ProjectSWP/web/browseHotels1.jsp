<%-- 
    Document   : browseHotels1.jsp
    Created on : Jun 27, 2024, 5:40:05 PM
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                            <a href="#"><div class="text-tiny">Duyệt khách sạn</div></a>
                                        </li>
                                    </ul>
                                </div>
                                <!-- product-list -->
                                <div class="wg-box">

                                    <div class="wg-table table-product-list">
                                        <ul style="justify-content:flex-start" class="table-title flex gap20 mb-14">
                                            <li style="width:300px">
                                                <div class="body-title">Tên</div>
                                            </li>
                                            <li style="width:200px">
                                                <div class="body-title">Địa Chỉ</div>
                                            </li>
                                            <li style="width:150px">
                                                <div class="body-title">CheckIn</div>
                                            </li>
                                            <li style="width:150px">
                                                <div class="body-title">CheckOut</div>
                                            </li>
                                            <li>
                                                <div class="body-title">Action</div>
                                            </li>
                                        </ul>
                                        <c:forEach items="${requestScope.list}" var="l">
                                            <ul class="flex flex-column">

                                                <li class="product-item gap14">
                                                    <div class="image no-bg">
                                                        <img src="${l.imagemain}" alt="">
                                                    </div>
                                                    <div style="justify-content:flex-start" class="flex items-center justify-between gap20 flex-grow">
                                                        <div style="width:236px" class="name">
                                                            <a href="detailhotel?id=${l.id}" class="body-title-2">${l.name}</a>
                                                        </div>
                                                        <div style="width:200px" class="body-text">${l.address}</div>
                                                        <div style="width:150px" class="body-text">${l.checkin}</div>
                                                        <div style="width:150px" class="body-text">${l.checkout}</div>

                                                        <div class="list-icon-function">
                                                            <a href="detailhotel?id=${l.id}" class="item edit">
                                                                <i class="icon-edit-3"></i>
                                                            </a>
                                                            <a href="browsehotels" class="item check" onclick="event.preventDefault(); document.getElementById('approveForm_${l.id}').submit();">
                                                                <i class="icon-check"></i>
                                                            </a>
                                                            <a href="browsehotels" class="item trash" onclick="event.preventDefault(); document.getElementById('deleteForm_${l.id}').submit();">
                                                                <i class="icon-trash"></i>
                                                            </a>
                                                        </div>
                                                        <form id="approveForm_${l.id}" action="browsehotels" method="post" style="display: none;">
                                                            <input type="hidden" name="action" value="1" />
                                                            <input type="hidden" name="id" value="${l.id}" />
                                                            <input type="hidden" name="email" value="${l.emailOwn}"/>
                                                        </form>

                                                        <form id="deleteForm_${l.id}" action="browsehotels" method="post" style="display: none;">
                                                            <input type="hidden" name="action" value="0" />
                                                            <input type="hidden" name="id" value="${l.id}" />
                                                            <input type="hidden" name="email" value="${l.emailOwn}"/>
                                                        </form>
                                                    </div>
                                                </li>

                                            </ul>

                                        </c:forEach>

                                    </div>
                                    <div class="divider"></div>
                                    <div class="flex items-center justify-between flex-wrap gap10">
                                        <div class="text-tiny">Showing 10 entries</div>
                                        <ul class="wg-pagination">
                                            <li>
                                                <a href="#"><i class="icon-chevron-left"></i></a>
                                            </li>
                                            <li>
                                                <a href="#">1</a>
                                            </li>
                                            <li class="active">
                                                <a href="#">2</a>
                                            </li>
                                            <li>
                                                <a href="#">3</a>
                                            </li>
                                            <li>
                                                <a href="#"><i class="icon-chevron-right"></i></a>
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

    </body>
</html>
