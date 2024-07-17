<%-- 
    Document   : testMainSuplier
    Created on : Jun 13, 2024, 5:53:47 PM
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Order" %>
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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
    </head>

    <body class="body">

        <!-- #wrapper -->
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
                                    <h3>Nhà Cung Cấp</h3>
                                </div>
                                <div class="header-grid">

                                    <div class="header-item button-dark-light">
                                        <i class="icon-moon"></i>
                                    </div>

                                    <div class="popup-wrap user type-header">
                                        <div class="dropdown">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton3" data-bs-toggle="dropdown" aria-expanded="false">
                                                <span class="header-user wg-user">
                                                    <span class="image">
                                                        <img src="img/avatar/user-1.png" alt="">
                                                    </span>
                                                    <span class="flex flex-column">
                                                        <span class="body-title mb-2">Travelocket</span>
                                                        <span class="text-tiny">Supplier</span>
                                                    </span>
                                                </span>
                                            </button>

                                            <ul class="dropdown-menu dropdown-menu-end has-content" aria-labelledby="dropdownMenuButton3" >
                                                <li>
                                                    <a href="logout" class="user-item">
                                                        <div class="icon">
                                                            <i class="icon-log-out"></i>
                                                        </div>
                                                        <div class="body-title-2">Log out</div>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
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
                                    <div class="tf-section-4 mb-30">
                                        <!-- chart-default -->
                                        <div class="wg-chart-default">
                                            <div class="flex items-center justify-between">
                                                <div class="flex items-center gap14">
                                                    <div class="image type-white">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="52" viewBox="0 0 48 52" fill="none">
                                                        <path d="M19.1094 2.12943C22.2034 0.343099 26.0154 0.343099 29.1094 2.12943L42.4921 9.85592C45.5861 11.6423 47.4921 14.9435 47.4921 18.5162V33.9692C47.4921 37.5418 45.5861 40.8431 42.4921 42.6294L29.1094 50.3559C26.0154 52.1423 22.2034 52.1423 19.1094 50.3559L5.72669 42.6294C2.63268 40.8431 0.726688 37.5418 0.726688 33.9692V18.5162C0.726688 14.9435 2.63268 11.6423 5.72669 9.85592L19.1094 2.12943Z" fill="#22C55E"/>
                                                        </svg>
                                                        <i class="icon-file"></i>
                                                    </div>
                                                    <div>
                                                        <div style="font-size: 11px;" class="body-text mb-2">Tổng Số khách sạn</div>
                                                        <h5>${requestScope.list.size()}</h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /chart-default -->
                                        <!-- chart-default -->
                                        <div class="wg-chart-default">
                                            <div class="flex items-center justify-between">
                                                <div class="flex items-center gap14">
                                                    <div class="image type-white">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="52" viewBox="0 0 48 52" fill="none">
                                                        <path d="M19.1094 2.12943C22.2034 0.343099 26.0154 0.343099 29.1094 2.12943L42.4921 9.85592C45.5861 11.6423 47.4921 14.9435 47.4921 18.5162V33.9692C47.4921 37.5418 45.5861 40.8431 42.4921 42.6294L29.1094 50.3559C26.0154 52.1423 22.2034 52.1423 19.1094 50.3559L5.72669 42.6294C2.63268 40.8431 0.726688 37.5418 0.726688 33.9692V18.5162C0.726688 14.9435 2.63268 11.6423 5.72669 9.85592L19.1094 2.12943Z" fill="#FF5200"/>
                                                        </svg>
                                                        <i class="icon-users"></i>
                                                    </div>
                                                    <div>
                                                        <div style="font-size: 11px;" class="body-text mb-2">Số lượt đặt phòng</div>
                                                        <h5>${requestScope.totalbooking}</h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /chart-default -->
                                        <!-- chart-default -->
                                        <div class="wg-chart-default">
                                            <div class="flex items-center justify-between">
                                                <div class="flex items-center gap14">
                                                    <div class="image type-white">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="52" viewBox="0 0 48 52" fill="none">
                                                        <path d="M19.1094 2.12943C22.2034 0.343099 26.0154 0.343099 29.1094 2.12943L42.4921 9.85592C45.5861 11.6423 47.4921 14.9435 47.4921 18.5162V33.9692C47.4921 37.5418 45.5861 40.8431 42.4921 42.6294L29.1094 50.3559C26.0154 52.1423 22.2034 52.1423 19.1094 50.3559L5.72669 42.6294C2.63268 40.8431 0.726688 37.5418 0.726688 33.9692V18.5162C0.726688 14.9435 2.63268 11.6423 5.72669 9.85592L19.1094 2.12943Z" fill="#CBD5E1"/>
                                                        </svg>
                                                        <i class="icon-users"></i>
                                                    </div>
                                                    <div>
                                                        <div style="font-size: 11px;" class="body-text mb-2">Số lượt đánh giá</div>
                                                        <h5>${requestScope.totalreview}</h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /chart-default -->
                                        <!-- chart-default -->
                                        <div class="wg-chart-default">
                                            <div class="flex items-center justify-between">
                                                <div class="flex items-center gap14">
                                                    <div class="image type-white">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="48" height="52" viewBox="0 0 48 52" fill="none">
                                                        <path d="M19.1094 2.12943C22.2034 0.343099 26.0154 0.343099 29.1094 2.12943L42.4921 9.85592C45.5861 11.6423 47.4921 14.9435 47.4921 18.5162V33.9692C47.4921 37.5418 45.5861 40.8431 42.4921 42.6294L29.1094 50.3559C26.0154 52.1423 22.2034 52.1423 19.1094 50.3559L5.72669 42.6294C2.63268 40.8431 0.726688 37.5418 0.726688 33.9692V18.5162C0.726688 14.9435 2.63268 11.6423 5.72669 9.85592L19.1094 2.12943Z" fill="#2377FC"/>
                                                        </svg>
                                                        <i class="icon-dollar-sign"></i>
                                                    </div>
                                                    <div>
                                                        <div style="font-size: 11px;" class="body-text mb-2">Tổng Doanh Thu</div>
                                                        <h5 style="font-size: 15px">${requestScope.totalmoney}</h5>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- /chart-default -->
                                    </div>
<!--                                    <div class="tf-section-5 mb-30">-->
                                        <!-- chart -->
                                        <div class="wg-box" style="margin: 10px 0">
                                            <h5>Khách sạn nhận phòng hôm nay</h5>
                                            <div class="wg-table table-top-product">
                                                <table border="1">
                                                    <thead>
                                                        <tr>
                                                            <th>Mã nhận phòng</th>
                                                            <th>Tên khách</th>
                                                            <th>Số điện thoại</th>
                                                            <th>Tên khách sạn</th>
                                                            <th>Phòng</th>
                                                            <th>Số lượng</th>
                                                            <th>checkin</th>
                                                            <th>checkout</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${requestScope.listorder}" var="lod">
                                                        <tr>
                                                            <td>${lod.order_id}</td>
                                                            <td>${lod.username}</td>
                                                            <td>${lod.phone}</td>
                                                            <td>${lod.hotel_name}</td>
                                                            <td>${lod.room_name}</td>
                                                            <td>${lod.quantity}</td>
                                                            <td>${lod.checkin}</td>
                                                            <td>${lod.checkout}</td>
                                                        </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>

                                            </div>
                                            <div id="bar-chart"></div>

                                        </div>
                                        <!-- /chart -->
                                        <!-- top-product -->
                                        <div class="wg-box" style="margin: 10px 0">
                                            <div class="flex items-center justify-between">
                                                <h5>Khách sạn của tôi</h5>
                 
                                            </div>
                                            <div class="wg-table table-top-product">
                                                <ul class="flex flex-column gap14">
                                                    <c:forEach items="${requestScope.list}" var="l">
                                                    <li class="product-item">
                                                        <div class="image" style="width: 5%">
                                                            <img src="${l.imagemain}" alt="">
                                                        </div>
                                                        <div class="flex items-center justify-between flex-grow">
                                                            <div class="name" style="width: 30%">
                                                                <a href="detailhotel?id=${l.id}" class="body-title-2">${l.name}</a>
                                                                <div class="text-tiny mt-3">${l.poststatus ? "Hoạt động" : "Chưa hoạt động"}</div>
                                                            </div>
                                                            <div style="width: 40%">
                                                                <div class="text-tiny mb-3">${l.address}</div>
                                                                <div class="body-text"></div>
                                                            </div>
      
                                                            <div style="width: 20%">
                                                                <div class="body-title-2 mb-3">chế độ hoàn</div>
                                                                <div class="text-tiny">${l.refund ? "O" : "X"}</div>
                                                            </div>
                                                        </div>
                                                    </li>
                                                    </c:forEach>
                       
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- /top-product -->
                                        <!-- top-countries -->
                                        <div class="wg-box">
                                            <div class="flex items-center justify-between">
                                                <h5>Các đánh giá mới nhất</h5>

                                            </div>

                                            <ul class="flex flex-column justify-between gap10 h-full">
                                                <c:forEach items="${requestScope.listreview}" var="lr">
                                                    <li class="country-item">

                                                        <div class="flex-grow flex items-center justify-between" style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);padding: 10px;width: 100%">
                                                            <p style="width: 20%">${lr.email}</p>
                                                            <p style="width: 40%">${lr.comment}</p>
                                                            <p style="width: 10%">${lr.hotel_rating}</p>
                                                            <p style="width: 10%">${lr.date}</p>


                                                        </div>
                                                    </li>
                                                </c:forEach>

                                            </ul>
                                        </div>                                     
                                        <!-- /top-countries -->
<!--                                    </div>-->


                                </div>
                                <!-- /main-content-wrap -->
                            </div>
                            <!-- /main-content-wrap -->
                            <!-- bottom-page -->
                            <div class="bottom-page">
                                <div class="body-text">Copyright © 2024 Remos. Design with</div>
                                <i class="icon-heart"></i>
                                <div class="body-text">by <a href="https://themeforest.net/user/themesflat/portfolio">Themesflat</a> All rights reserved.</div>
                            </div>
                            <!-- /bottom-page -->
                        </div>
                        <!-- /main-content -->
                    </div>
                    <!-- /section-content-right -->
                </div>
                <!-- /layout-wrap -->
            </div>
            <!-- /#page -->
        </div>
        <!-- /#wrapper -->

        <!-- Javascript -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootstrap-select.min.js"></script>
        <script src="js/zoom.js"></script>
        <script src="js/apexcharts/apexcharts.js"></script>
        <script src="js/apexcharts/line-chart-1.js"></script>
        <script src="js/apexcharts/line-chart-2.js"></script>
        <script src="js/apexcharts/line-chart-3.js"></script>
        <script src="js/apexcharts/line-chart-4.js"></script>
        <script src="js/apexcharts/line-chart-5.js"></script>
        <script src="js/apexcharts/line-chart-6.js"></script>
        <script src="js/switcher.js"></script>
        <script src="js/theme-settings.js"></script>
        <script src="js/main_1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <script src="js/datepicker.js"></script>


    </body>


</html>
