<%-- 
    Document   : dashboard
    Created on : Jun 5, 2024, 2:20:59 AM
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
                                    <h3>Trang chủ Admin</h3>
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
                                                        <span class="text-tiny">Admin</span>
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
                                                        <div style="font-size: 11px;" class="body-text mb-2">Tổng Home</div>
                                                        <h5>${totalHotels}</h5>

                                                    </div>
                                                </div>

                                            </div>
                                            <div class="box-icon-trending up">
                                                <i class="icon-trending-up"></i>
                                                <div class="body-title number">${hotelsAddedToday}</div>
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
                                                        <div style="font-size: 11px;" class="body-text mb-2">Tổng Khách Hàng</div>
                                                        <h5>${totalUserRegestered}</h5>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="box-icon-trending down">
                                                <i class="icon-trending-up"></i>
                                                <div class="body-title number">${userReAdderToday}</div>
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
                                                        <div style="font-size: 11px;" class="body-text mb-2">Tổng Nhà Cung Cấp</div>
                                                        <h5>${totalSupliers}</h5>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="box-icon-trending">
                                                <i class="icon-trending-up"></i>
                                                <div class="body-title number">${supliersAdderToday}</div>
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
                                                        <h5>${totalMonney}</h5>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="box-icon-trending up">
                                                <i class="icon-trending-up"></i>
                                                <div class="body-title number">${totalMonneyToday}</div>
                                            </div>
                                        </div>
                                        <!-- /chart-default -->
                                    </div>
                                    <div class="tf-section-7 mb-30">
                                        <!-- chart -->
                                        <div class="wg-box">
                                            <div class="flex items-center justify-between">
                                                <h5>Doanh Thu</h5>
                                            </div>
                                            <form action="homeadmin" method="GET">
                                                <div>
                                                    <p>Chọn Ngày: <input type="text" id="date-range" name="dateRange" class="date-picker" value="<%= request.getAttribute("dateRange") != null ? request.getAttribute("dateRange") : "" %>"></p>
                                                    <button style="background-color: #00ccff; font-size: 10px;" type="submit" id="filter-button">Lọc</button>
                                                </div>
                                            </form>
                                            <div id="bar-chart"></div>
                                        </div>
                                        <!-- /chart -->
                                        <!-- top-product -->
                                        <div class="wg-box">
                                            <div class="flex items-center justify-between">
                                                <h5>Home nổi bật (Top 8)</h5>
                                            </div>
                                            <div class="wg-table table-top-product">
                                                <ul class="flex flex-column gap14">
                                                    <c:forEach var="hotel" items="${topHotel}">
                                                        <li class="product-item">
                                                            <div class="image">
                                                                <img src="${hotel.imagemain}" alt="">
                                                            </div>
                                                            <div  style="justify-content: flex-start" class="flex items-center justify-between flex-grow">
                                                                <div class="name">
                                                                    <a href="detailhotel?id=${hotel.id}" class="body-title-2">${hotel.name}</a>
                                                                </div>
                                                                <div style="margin-left: 10px;color: #FB923C" class="body-text">${hotel.avgOverallRating}</div>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- /top-product -->

                                    </div>
                                    <div class="tf-section-10 mb-30">
                                        <!-- best-shop-sellers -->
                                        <div class="wg-box">
                                            <div class="flex items-center justify-between">
                                                <h5>Khách Hàng Nổi Bật (Top 20)</h5>
                                            </div>
                                            <div class="wg-table table-best-shop-sellers">
                                                <ul class="table-title flex gap18 mb-14">
                                                    <li style="width:20%">
                                                        <div class="body-title">Tên</div>
                                                    </li>    
                                                    <li style="width:20%">
                                                        <div class="body-title">Số Điện Thoại</div>
                                                    </li>
                                                    <li style="width:40%">
                                                        <div class="body-title">Email</div>
                                                    </li>
                                                    <li style="width:20%">
                                                        <div class="body-title">Chi Tiêu</div>
                                                    </li>
                                                </ul>
                                                <ul class="flex flex-column gap18">
                                                    <c:forEach var="u" items="${topUserMonney}">
                                                        <li class="shop-item">
                                                            <div class="flex-grow flex items-center justify-between gap20">
                                                                <div style="width:20%">
                                                                    <a  class="body-text name">${u.name}</a>
                                                                </div>
                                                                <div style="width:20%" class="body-text">${u.phone}</div>
                                                                <div style="width:40%" class="body-text">${u.email}</div>
                                                                <div style="width:20%" class="body-text">${u.getFormattedTotalPrice()}</div>
                                                            </div>
                                                        </li>
                                                    </c:forEach>

                                                </ul>
                                            </div>
                                        </div>

                                        <!-- Người tiêu nhiều tiền -->
                                    </div>



                                </div>
                                <!-- /main-content-wrap -->
                            </div>
                            <!-- /main-content-wrap -->
                            <!-- bottom-page -->

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

        <script>
            $(document).ready(function () {
                var orderData = [];

            <% 
        List<Order> orders = (List<Order>) request.getAttribute("orders");
        if (orders != null) {
            for (Order order : orders) {
            %>
                orderData.push({
                    date: '<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(order.getDate()) %>',
                    price: <%= order.getPrice() %>
                });
            <% 
            }
        }
            %>

                orderData.sort(function (a, b) {
                    return new Date(a.date) - new Date(b.date);
                });

                new Morris.Bar({
                    element: 'bar-chart',
                    data: orderData,
                    xkey: 'date',
                    ykeys: ['price'],
                    labels: ['Total Price'],
                    hideHover: 'auto',
                    resize: true
                });
            });
        </script>

    </body>


</html>