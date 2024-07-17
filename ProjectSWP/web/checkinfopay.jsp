<%-- 
    Document   : checkinfopay
    Created on : Jun 20, 2024, 3:39:11 PM
    Author     : thait
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                background-color: #cccccc;
            }

            header {
                background-color: #2c3e50;
                padding: 30px 0;
            }

            .navbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 90%;
                margin: 0 auto;
            }

            .logo a {
                color: white;
                text-decoration: none;
                font-size: 22px;
                font-weight: bold;
            }

            nav ul {
                list-style: none;
                display: flex;
                margin: 0;
                padding: 0;
            }

            nav ul li {
                margin-left: 15px;
            }

            nav ul li a {
                color: white;
                text-decoration: none;
                font-size: 16px;
                margin: 0px 10px;
            }

            nav ul li a:hover {
                color: #0099ff;
            }

            .user-options a {
                color: white;
                margin-left: 15px;
                text-decoration: none;
                font-size: 16px;
            }

            .user-options a:hover {
                color: #0099ff;
            }

            .container {
                display: flex;
                justify-content: space-between;
                margin: 30px auto;
                width: 90%;
                max-width: 1400px;
            }

            .left, .right {
                background-color: white;
                border-radius: 10px;
                box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.1);
                padding: 15px;
                box-sizing: border-box;
            }

            .left {
                width: 65%;
                margin-right: 2%;
            }

            .right {
                width: 35%;
            }

            .info {
                margin-bottom: 15px;
                padding: 15px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                flex-wrap: wrap;
                border-bottom: 1px solid #e0e0e0;
            }

            .info img {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                margin-right: 15px;
            }

            .info h3, .info h4, .info p {
                margin: 5px 0;
                font-size: 14px;
            }

            .payment {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%;
                margin-bottom: 10px;
            }

            .contact {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 10px;
            }

            .contact .details, .contact .note {
                flex: 1;
            }

            .contact .details a {
                display: inline-block;
                margin-top: 5px;
                text-decoration: none;
                color: #007bff;
                font-size: 14px;
            }

            .contact .details a:hover {
                text-decoration: underline;
            }

            .checkout form input[type="submit"], .deposit {
                background-color: #66ccff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                font-size: 14px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                text-decoration: none;
            }

            .checkout form input[type="submit"]:hover, .deposit:hover {
                background-color: #6699ff;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
                font-size: 14px;
            }

            th {
                background-color: #f2f2f2;
                color: #333;
            }

            tr:hover {
                background-color: #f1f1f1;
            }

            .price {
                font-weight: bold;
                color: #e67e22;
            }
        </style>
    </style>
</head>
<body>
    <header>
        <div class="navbar">
            <div class="logo">
                <a href="home">Travelocket</a>
            </div>
            <nav>
                <ul>
                    <li><a href="home">Trang Chủ</a></li>
                    <li><a href="#">Khách Sạn</a></li>
                    <li><a href="updateprofile">Hồ sơ</a></li>
                    <li><a href="cart1">Hàng chờ</a></li>
                </ul>
            </nav>
            <div class="user-options">
                <c:if test="${sessionScope.account == null}">
                    <a href="login">Đăng Nhập</a>
                    <a href="register">Đăng Ký</a>
                </c:if>
                <c:if test="${sessionScope.account != null}">
                    <a href="logout">Đăng xuất</a>
                </c:if>
            </div>
        </div>
    </header>
    <div class="container">
        <div class="left">
            <div style="justify-content: flex-start;" class="info">
                <div class="img">
                    <img src="img/user.jpg" alt="alt" width="100%"/>
                </div>
                <div class="content">
                    <h3>Xin chào ${requestScope.user.name}</h3>
                </div>
            </div>
            <div class="info">
                <div>
                    <h3>Cách thức thanh toán:</h3>
                    <h3>Tổng hóa đơn:</h3>
                    <c:if test="${requestScope.pay == 1}">
                        <h3>Số dư trong ví travelmoney:</h3>
                    </c:if>
                </div>
                <hr>
                <div style="margin-right: 20px">
                    <h4>${(requestScope.pay == 0)?"Thanh toán qua vnpay":"Thanh toán bằng travelmoney"}</h4>
                    <h4>${requestScope.amount -requestScope.discountprice}  VNĐ</h4>
                    <c:if test="${requestScope.pay == 1}">
                        <h4>${sessionScope.account.travelmoney}  đ</h4>
                        <h4 style="color: #ff0000">${(sessionScope.account.travelmoney < requestScope.amount - requestScope.discountprice)?"(số dư trong ví không đủ để thanh toán)":""}</h4>                            
                    </c:if>
                </div>
            </div>
            <div class="info">
                <div class="i1" style="width: 20%">
                    <h3>Thông tin liên lạc:</h3>
                </div>
                <hr>
                <div class="i2" style="margin-left: 30px;width: 30%">
                    <h4>Tên: ${requestScope.user.name}</h4>
                    <h4>Email: ${requestScope.user.email}</h4>
                    <h4>Số điện thoại: ${requestScope.user.phone}</h4>
                    <a href="updateprofile">Thay đổi thông tin</a>
                </div>
                <hr>
                <div class="i3" style="margin-left: 10px;width: 40%">
                    <p>Thông tin đặt phòng, mã nhận phòng sẽ sớm được gửi qua email
                        hãy kiểm tra kỹ thông tin và phản ánh nếu có gì sai xót!</p>
                </div>
            </div>
            <c:if test="${requestScope.listcart != null}">
                <div class="info">
                    <table border="1" style="width: 100%">
                        <thead>
                            <tr>
                                <th>Tên khách sạn</th>
                                <th>Phòng</th>
                                <th>SL</th>
                                <th>Checkin</th>
                                <th>Checkout</th>
                                <th>Giá</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.listcart}" var ="c">
                                <tr>
                                    <td>${c.name_hotel}</td>
                                    <td>${c.name_room}</td>
                                    <td>${c.quantity}</td>
                                    <td>${c.checkin}</td>
                                    <td>${c.checkout}</td>
                                    <td>${c.price * c.quantity}VNĐ</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div> 
            </c:if>
            <c:if test="${requestScope.listct != null}">

                <div class="info">
                    <table border="1" style="width: 100%">
                        <thead>
                            <tr>
                                <th>Tên Tour</th>
                                <th>SL</th>
                                <th>Ngày đi</th>
                                <th>Giá</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.listct}" var ="ct">
                                <tr>
                                    <td>${ct.tour_name}</td>
                                    <td>${ct.quantity}</td>
                                    <td>${ct.tour_date}</td>
                                    <td>${ct.price} VNĐ</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
            <c:if test="${requestScope.pay == 0}">
                <div class="checkout">
                    <form action="vnpayajax" id="frmCreateOrder" method="post" >
                        <input type="hidden" name="amount" value="${requestScope.amount - requestScope.discountprice}" />
                        <input type="hidden" name="bankCode" value="NCB" />
                        <input type="hidden" name="language" value="vn" />
                        <input type="hidden" name="hotel_id" value="${requestScope.hotel_id}" />
                        <input type="hidden" name="discount_id" value="${requestScope.discount.discount_id}" />
                        <input type="submit" name="" value="Thanh toán" />
                    </form>
                </div>
            </c:if>
            <c:if test="${requestScope.pay == 1 && sessionScope.account.travelmoney >= requestScope.amount - requestScope.discountprice}">
                <div class="checkout">
                    <form action="paybytravelmoney" method="get" >
                        <input type="hidden" name="amount" value="${requestScope.amount - requestScope.discountprice}" />
                        <input type="hidden" name="hotel_id" value="${requestScope.hotel_id}" />
                        <input type="hidden" name="discount_id" value="${requestScope.discount.discount_id}" />
                        <input type="submit" name="" value="Thanh toán bằng travelmoney" />
                    </form>
                </div>
            </c:if>
            <c:if test="${requestScope.pay == 1 && sessionScope.account.travelmoney < requestScope.amount - requestScope.discountprice}">
                <div class="checkout">
                    <a href="travelmoney" class="deposit">nạp thêm tiền vào travelmoney</a>
                </div>
            </c:if>
        </div>
        <c:set value="${requestScope.hotel}" var="h"/>
        <c:set value="${requestScope.rating}" var="r"/>
        <div class="right" style="margin-left: 50px">
            <c:if test="${requestScope.hotel != null}">
                <div class="info">
                    <a href="detailhotel?id=${h.id}" style="text-decoration: none;color: black">
                        <div class="hotel" style="display: flex;width: 100%"> 
                            <div class="hotel-img" style="width: 60%">
                                <img src="${h.imagemain}" alt="alt" style="width: 100%;height: 130px;object-fit: cover;border-radius: 10px"/>
                            </div>
                            <div class="hotel-info" style="margin-left: 20px">
                                <p>${r.r1} điểm - ${r.quantity} bài đánh giá</p>
                                <p>${h.name}</p>
                                <p>${h.address}</p>
                            </div>
                        </div>
                    </a>
                </div>
            </c:if>
            <c:if test="${requestScope.discount != null}">
                <div class="info">
                    <div class="hotel" style="display: flex;width: 100%">
                        <div class="hotel-img" style="width: 50%">
                            <img src="${requestScope.discount.img_discount}" alt="alt" style="width: 100%;height: 100px;object-fit: cover;border-radius: 10px"/>
                        </div>
                        <c:if test="${requestScope.listcart != null}">
                            <div class="hotel-info" style="margin-left: 20px">
                                <p>Mã giảm giá:  ${requestScope.discount.discount_id}</p>
                                <form action="checkinfopay" method="get">
                                    <input type="hidden" name="amount" value="${requestScope.amount}" />
                                    <input type="hidden" name="hotel_id" value="${requestScope.hotel_id}" />
                                    <input type="hidden" name="pay" value="${requestScope.pay}" />
                                    <input type="submit" name="" value="thay đổi mã" />
                                </form>
                            </div>
                        </c:if>
                        <c:if test="${requestScope.listct != null}">
                            <div class="hotel-info" style="margin-left: 20px">
                                <p>Mã giảm giá:  ${requestScope.discount.discount_id}</p>
                                <form action="checkinfopaytour" method="get">
                                    <input type="hidden" name="amount" value="${requestScope.amount}" />
                                    <input type="hidden" name="pay" value="${requestScope.pay}" />
                                    <input type="submit" name="" value="thay đổi mã" />
                                </form>
                            </div>
                        </c:if>
                    </div>
                </div>
            </c:if>
            <c:if test="${requestScope.listd != null}">

                <div class="info">
                    <div class="g" style="overflow: auto;max-height: 300px">
                        <c:forEach items="${requestScope.listd}" var="d">
                            <div class="hotel" style="display: flex;width: 100%">
                                <div class="hotel-img" style="width: 50%">
                                    <img src="${d.img_discount}" alt="alt" style="width: 100%;height: 100px;object-fit: cover;border-radius: 10px"/>
                                </div>
                                <c:if test="${requestScope.listcart != null}">
                                    <div class="hotel-info" style="margin-left: 20px">
                                        <p>Mã giảm giá:  ${d.discount_id}</p>
                                        <h5 style="margin: 2px">giảm ${d.percent} ${(d.type_percent == 1) ? "%" : "VND"}</h5>
                                        <form action="checkinfopay" method="post">
                                            <input type="hidden" name="amount" value="${requestScope.amount}" />
                                            <input type="hidden" name="hotel_id" value="${requestScope.hotel_id}" />
                                            <input type="hidden" name="pay" value="${requestScope.pay}" />
                                            <input type="hidden" name="discount_id" value="${d.discount_id}" />
                                            <input type="submit" name="" value="áp dụng" />
                                        </form>
                                    </div>
                                </c:if>
                                <c:if test="${requestScope.listct != null}">
                                    <div class="hotel-info" style="margin-left: 20px">
                                        <p>Mã giảm giá:  ${d.discount_id}</p>
                                        <h5 style="margin: 2px">giảm ${d.percent} ${(d.type_percent == 1) ? "%" : "VND"}</h5>
                                        <form action="checkinfopaytour" method="post">
                                            <input type="hidden" name="amount" value="${requestScope.amount}" />
                                            <input type="hidden" name="pay" value="${requestScope.pay}" />
                                            <input type="hidden" name="discount_id" value="${d.discount_id}" />
                                            <input type="submit" name="" value="áp dụng" />
                                        </form>
                                    </div>
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </c:if>

        </div>
    </div>
    <script src="assets/jquery-1.11.3.min.js"></script>
    <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
    <script>
        $("#frmCreateOrder").submit(function () {
            var postData = $("#frmCreateOrder").serialize();
            var submitUrl = $("#frmCreateOrder").attr("action");
            $.ajax({
                type: "POST",
                url: submitUrl,
                data: postData,
                dataType: 'JSON',
                success: function (x) {
                    if (x.code === '00') {
                        if (window.vnpay) {
                            vnpay.open({width: 768, height: 600, url: x.data});
                        } else {
                            location.href = x.data;
                        }
                        return false;
                    } else {
                        alert(x.Message);
                    }
                }
            });
            return false;
        });
    </script>
</body>
</html>
