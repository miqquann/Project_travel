<%-- 
    Document   : travelmoney
    Created on : Jun 19, 2024, 11:16:09 PM
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
            body{
                background-color: #f5f5f5;
            }

            .contain{
                display: flex;
            }
            aside{
                width: 20%;
            }

            aside .sub{
                margin-left: 100px;
                margin-top: 20px;
            }

            aside .sub a{
                text-decoration: none;
            }

            .sub {
                margin-bottom: 15px;
            }

            .sub a {
                display: block;
                text-decoration: none;
                font-family: Arial, sans-serif;
                color: #333;
                background-color: #fff;
                padding: 10px 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            .sub a:hover {
                background-color: #0099ff;
                color: white;
            }

            nav {
                width: 100%;
                background-color: #d8cbf5;

            }

            nav .header{
                display: flex;
                /*                justify-content: space-evenly;*/
            }

            nav li{
                list-style: none;
                padding: 30px 20px;
                justify-content: center;
            }

            nav li a{
                color: black;
                padding: 30px 20px;
                text-decoration: none;
            }

            nav li a:hover {
                background-color: white;
            }

            main{
                width: 50%;
                margin-left: 30px;
            }

            .card{
                border-radius: 10px;
                background-color: #fff;
                display: flex;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .card .card-image{
                width: 60%;
            }

            .card .card-image img{
                border-radius: 10px;
                border: 2px solid hsl(0, 0%, 90%); /* Light gray border */
                margin: 40px;
            }

            .card-details {
                margin-top: 50px;
            }

            .card-details .detail{
                margin-top: 20px;
            }

            /*            .xxx {
                            padding: 10px;
                            background-color: #99ccff;
                            text-align: center;
                        }*/

            .xxx input[type="button"]{
                width: 100%;
                color: black;
                padding: 20px 10px;
                background-color: #99ccff;
            }

            .xxx input[type="button"]:hover{
                background-color: #33ccff;
            }

            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.7);
                display: none;
                align-items: center;
                justify-content: center;
            }

            .overlay div {
                background-color: #fff;
                padding: 30px;
                border-radius: 10px;
                width: 90%;
                max-width: 500px;
                /*                text-align: center;*/
            }

            .overlay h2 {
                margin-bottom: 20px;
                font-size: 24px;
            }

            .overlay input[type="button"] {
                background-color: #dc3545;
                color: #fff;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-top: 10px;
            }

            .overlay input[type="button"]:hover {
                background-color: #c82333;
            }

            /* Display overlay when active */
            .overlay.active {
                display: flex;
            }

            input[type="submit"]{
                background-color: #99ccff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                margin-top: 10px;
            }

        </style>
    </head>
    <body>
        <nav>
            <ul class="header">
                <c:if test="${(sessionScope.account.getRoleID() == 3)}">
                    <li> <a href="home">Trang chủ</a></li>
                </c:if>
                <c:if test="${(sessionScope.account.getRoleID() == 2)}">
                    <li> <a href="homehotelier">Trang chủ</a></li>
                </c:if>
                <c:if test="${(sessionScope.account.getRoleID() == 2 || sessionScope.account.getRoleID() == 3 )}">
                    <li> <a href="#">Hồ sơ của tôi</a></li>
                </c:if>
                <li> <a href="logout">Đăng xuất</a></li>               
            </ul>
        </nav>

        <div class="contain">
            <aside>
                <c:if test="${sessionScope.account.roleID == 3}">
                    <div class="sub">
                        <a href="vieworder">Đơn đặt phòng</a>
                    </div>
                    <div class="sub">
                        <a href="hotelreview">Đánh giá khách sạn</a>
                    </div>
                    <div class="sub">
                        <a href="listhotelfavorite">Khách sạn yêu thích</a>
                    </div>
                    <div class="sub">
                        <a href="#">Travelmoney</a>
                    </div>
                </c:if>

            </aside>
            <main>
                <div class="card">
                    <div class="card-image">
                        <img src="img/agoda-gift-card-centered-thailand.png" width="80%" height="auto">
                    </div>
                    <div class="card-details">
                        <div class="detail">
                            <span class="label">Tổng số dư hiện tại:</span>
                            <span class="value">${sessionScope.account.travelmoney}</span>  đ(1đ = 1VNĐ)
                        </div>
                        <hr>
                        <div class="xxx">
                            <input type="button" onclick="Action1(event)" name="" value="Nạp thêm tiền vào ví" />
                        </div>
                    </div>
                </div>
            </main>
        </div>
        <div class="overlay" id="overlay">
            <div>
                <h2>Nạp ví travelmoney</h2>
                <form action="vnpayajax" id="frmCreateOrder" method="post" >
                    <label>nhập số tiền muốn nạp (1đ = 1VNĐ)</label><br/>
                    <input type="number" name="amount" value="" min="10000" step="10000" style="height: 30px"/>
                    <input type="hidden" name="bankCode" value="NCB" />
                    <input type="hidden" name="language" value="vn" /><br/>
                    <input type="hidden" name="travelmoney" value="tm" /><br/>
                    <input type="submit" name="" value="Nạp" />
                    <input type="button" onclick="Action2(event)" value="Hủy" />
                </form>
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
                    function Action1(event) {
                        event.preventDefault();
                        document.getElementById('overlay').style.display = 'flex';
                    }
                    function Action2(event) {
                        event.preventDefault();
                        document.getElementById('overlay').style.display = 'none';
                    }
        </script>
    </body>
</html>
