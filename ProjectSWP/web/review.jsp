<%-- 
    Document   : review
    Created on : Jun 17, 2024, 9:41:24 PM
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
                                        <h3>Danh Sách Phản Hồi Về Khách Sạn</h3>
                                        <ul class="breadcrumbs flex items-center flex-wrap justify-start gap10">
                                            <li>
                                                <a href="homeadmin"><div class="text-tiny">Trang Chủ</div></a>
                                            </li>
                                            <li>
                                                <i class="icon-chevron-right"></i>
                                            </li>
                                            <li>
                                                <div class="text-tiny">Phản Hồi</div>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- product-list -->
                                    <div class="wg-box">
                                        <!--                                        <div class="title-box">
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
                                                                                </div>-->
                                        <div class="dropdown default">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <span class="icon-more"><i class="icon-more-horizontal"></i></span>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-end">
                                                <li>  
                                                    <a href="listReviewHome?isOrder=1">Điểm tăng dần</a>
                                                </li>
                                                <li>  
                                                    <a href="listReviewHome?isOrder=0">Điểm giảm dần</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="wg-table table-product-list">

                                            <ul class="table-title flex gap20 mb-14">
                                                <li style="width: 33%">
                                                    <div class="body-title">Tên Home</div>
                                                </li>    
                                                <li style="width: 20%">
                                                    <div class="body-title">Điểm</div>
                                                </li>
                                                <li style="width: 48%">
                                                    <div class="body-title">Comment</div>
                                                </li>
                                            </ul>

                                            <ul class="flex flex-column">
                                                <c:forEach items="${listReview}" var="h" >
                                                    <li class="product-item gap14">
                                                        <div  class="image no-bg">
                                                            <img src="${h.imagemain}" alt="">
                                                        </div>
                                                        <div class="flex items-center justify-between gap20 flex-grow">
                                                            <div style="width: 30%; "  class="name">
                                                                <a href="detailhotel?id=${h.id}" class="body-title-2">${h.name}</a>
                                                            </div>
                                                            <div style="width: 20%; color: #FB923C" style="width:180px" class="body-text">${h.avgOverallRating}</div>
                                                            <div style="width: 50%" class="body-text">${h.comment}</div>
                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <div class="divider"></div>

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
