<%-- 
    Document   : listHome
    Created on : Jun 6, 2024, 12:57:17 AM
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
                                        <h3>Danh Sách Home(Bài Đăng)</h3>
                                        <ul class="breadcrumbs flex items-center flex-wrap justify-start gap10">
                                            <li>
                                                <a href="homeadmin"><div class="text-tiny">Trang Chủ</div></a>
                                            </li>
                                            <li>
                                                <i class="icon-chevron-right"></i>
                                            </li>
                                            <li>
                                                <div class="text-tiny">Danh Sách Home</div>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- product-list -->
                                    <div class="wg-box">
                                        <div class="title-box">
                                            <i class="icon-coffee"></i>
                                            <div class="body-text">Cách tìm: Nên tìm theo ID,Tên Home hoặc Email home bạn cần</div>
                                        </div>
                                        <div class="flex items-center justify-between gap10 flex-wrap">
                                            <div class="wg-filter flex-grow">
                                                <div class="show">
                                                    <div class="text-tiny">Hiển Thị</div>

                                                    <div class="text-tiny">home</div>
                                                </div>
                                                <form action="searchHomeOfAdmin" method="post" class="form-search">
                                                    <fieldset class="name">
                                                        <input type="text"  class="" name="name" tabindex="2" value="${requestScope.query}" aria-required="true" required="" placeholder="${requestScope.error}" >
                                                    </fieldset>
                                                    <div class="button-submit">
                                                        <button class="" type="submit"><i class="icon-search"></i></button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="wg-table table-product-list">
                                            <ul class="table-title flex gap20 mb-14">
                                                <li>
                                                    <div class="body-title">Tên Home</div>
                                                </li>    
                                                <li style="width:60px">
                                                    <div class="body-title">ID</div>
                                                </li>
                                                <li style="width:180px">
                                                    <div class="body-title">Địa Chỉ</div>
                                                </li>
                                                <li>
                                                    <div class="body-title">Email</div>
                                                </li>
                                                <li>
                                                    <div class="body-title">Action</div>
                                                </li>
                                            </ul>

                                            <ul class="flex flex-column">
                                                <c:forEach items="${listHotel}" var="h" >
                                                    <li class="product-item gap14">
                                                        <div class="image no-bg">
                                                            <img src="${h.imagemain}" alt="">
                                                        </div>
                                                        <div class="flex items-center justify-between gap20 flex-grow">
                                                            <div  class="name">
                                                                <a href="detailhotel?id=${h.id}" class="body-title-2">${h.name}</a>
                                                            </div>
                                                            <div style="width:60px" class="body-text">${h.id}</div>
                                                            <div style="width:180px" class="body-text">${h.address}</div>
                                                            <div class="body-text">${h.emailOwn}</div>
                                                            <div class="list-icon-function">
                                                                <form action="listHome" method="post" onsubmit="return confirmDelete();">
                                                                    <input type="hidden" name="id" value="${h.id}">
                                                                    <input type="hidden" name="action" value="delete">
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
                                            <div class="text-tiny">Showing ${recordsPerPage} entries</div>
                                            <ul class="wg-pagination">
                                                <c:if test="${currentPage > 1}">
                                                    <li>
                                                        <a href="listHome?page=${currentPage - 1}"><i class="icon-chevron-left"></i></a>
                                                    </li>
                                                </c:if>
                                                <c:forEach begin="1" end="${noOfPages}" var="i">
                                                    <li class="<c:if test='${i == currentPage}'>active</c:if>">
                                                        <a href="listHome?page=${i}">${i}</a>
                                                    </li>
                                                </c:forEach>
                                                <c:if test="${currentPage < noOfPages}">
                                                    <li>
                                                        <a href="listHome?page=${currentPage + 1}"><i class="icon-chevron-right"></i></a>
                                                    </li>
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
            <script>
                function confirmDelete() {
                    return confirm("Bạn muốn tắt trạng thái khách sạn này?");
                }
            </script>
            <script src="js/jquery.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/bootstrap-select.min.js"></script>
            <script src="js/zoom.js"></script>
            <script src="js/switcher.js"></script>
            <script src="js/theme-settings.js"></script>
            <script src="js/main_1.js"></script>

    </body>
</html>
