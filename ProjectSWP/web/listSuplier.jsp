<%-- 
    Document   : listSuplier
    Created on : Jun 6, 2024, 5:13:35 PM
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
                                        <h3>Danh Sách Nhà Cung Cấp</h3>
                                        <ul class="breadcrumbs flex items-center flex-wrap justify-start gap10">
                                            <li>
                                                <a href="homeadmin"><div class="text-tiny">Trang Chủ</div></a>
                                            </li>
                                            <li>
                                                <i class="icon-chevron-right"></i>
                                            </li>
                                            <li>
                                                <div class="text-tiny">Danh Sách Nhà Cung Cấp</div>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- product-list -->
                                    <div class="wg-box">
                                        <div class="title-box">
                                            <i class="icon-coffee"></i>
                                            <div class="body-text">Cách tìm: Nên tìm theo Số Điện Thoại hoặc Email nhà cung cấp mà bạn cần</div>
                                        </div>
                                        <div class="flex items-center justify-between gap10 flex-wrap">
                                            <div class="wg-filter flex-grow">
                                                <div class="show">
                                                    <div class="text-tiny">Hiển Thị</div>
                                                    
                                                    <div class="text-tiny">Người</div>
                                                </div>
                                                <form action="searchSuplier" method="post" class="form-search">
                                                    <fieldset class="name">
                                                        <input type="text"class="" name="name" tabindex="2" value="${query}" aria-required="true" required="" placeholder="${requestScope.error}">
                                                    </fieldset>
                                                    <div class="button-submit">
                                                        <button class="" type="submit"><i class="icon-search"></i></button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="wg-table table-product-list">
                                            <ul style="justify-content:flex-start" class="table-title flex gap20 mb-14">
                                                <li style="width:200px">
                                                    <div class="body-title">Tên</div>
                                                </li>    
                                                <li style="width:200px">
                                                    <div class="body-title">ID</div>
                                                </li>
                                                <li style="width:300px">
                                                    <div class="body-title">Phone</div>
                                                </li>
                                                <li style="width:200px">
                                                    <div class="body-title">Email</div>
                                                </li>
                                                
                                            </ul>

                                            <ul class="flex flex-column">
                                                <c:forEach items="${listSuplier}" var="l" >
                                                    <li class="product-item gap14">
                                                        <div style="justify-content:flex-start" class="flex items-center justify-between gap20 flex-grow">
                                                            <div style="width:200px" class="name">
                                                                <a class="body-title-2">${l.name}</a>
                                                            </div>
                                                            <div style="width:200px" class="body-text">${l.id}</div>
                                                            <div style="width:300px" class="body-text">${l.phone}</div>
                                                            <div style="width:200px" class="body-text">${l.email}</div>
                                                            
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <div class="divider"></div>
                                        <div class="flex items-center justify-between flex-wrap gap10">
                                            <div class="text-tiny">Showing ${recordsPerPage} entries</div>
                                            <ul class="wg-pagination">
                                                <c:if test="${totalPages > 1}">
                                                    <ul class="wg-pagination">
                                                        <c:if test="${currentPage > 1}">
                                                            <li>
                                                                <a href="listSuplier?page=${currentPage - 1}&supplierInPage=${recordsPerPage}"><i class="icon-chevron-left"></i></a>
                                                            </li>
                                                        </c:if>
                                                        <c:forEach begin="1" end="${totalPages}" var="i">
                                                            <li class="${i == currentPage ? 'active' : ''}">
                                                                <a href="listSuplier?page=${i}&supplierInPage=${recordsPerPage}">${i}</a>
                                                            </li>
                                                        </c:forEach>
                                                        <c:if test="${currentPage < totalPages}">
                                                            <li>
                                                                <a href="listSuplier?page=${currentPage + 1}&supplierInPage=${recordsPerPage}"><i class="icon-chevron-right"></i></a>
                                                            </li>
                                                        </c:if>
                                                    </ul>
                                                </c:if>
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
