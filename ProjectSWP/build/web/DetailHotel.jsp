<%-- 
    Document   : DetailHotel
    Created on : May 22, 2024, 12:58:59 PM
    Author     : thait
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                justify-content:center;
                opacity: 0;
                transition: opacity 0.5s ease-in-out;
            }

            body.loaded {
                opacity: 1;
            }
            .container{
                width: 95%;
                margin: 0 40px;
            }

            .img_header{
                /*                border-color: rgb(221, 223, 226);
                                border-style: solid;
                                border-width: 1px;
                                border-radius: 20px;*/
                display: flex;
                /*                border-style: solid;*/
            }

            .img_main{

                width: 33%;
                margin: 5px;
            }
            .more{

                display: flex;
                margin-top: 20px;
            }

            .info{
                font-size: 14px;
                line-height: 20px;
                font-weight: 300;
                padding: 10px 10px 0px 16px;
                border-color: rgb(221, 223, 226);
                border-style: solid;
                border-width: 1px;
                border-radius: 5px;
                width: 70%;
                border-style: solid;
            }

            .refund{
                font-size: 14px;
                line-height: 20px;
                font-weight: 300;
                padding: 0px 10px 0px 16px;
                border-color: rgb(221, 223, 226);
                border-width: 1px;
                border-radius: 5px;
                width: 10%;
                border-style: solid;
                margin-left: 20px;
                text-align: center;
                align-content: center;
            }

            .rating{
                font-size: 14px;
                line-height: 20px;
                font-weight: 300;
                border-color: rgb(221, 223, 226);
                padding: 0px 10px 0px 16px;
                border-width: 1px;
                border-radius: 5px;
                width: 20%;
                border-style: solid;
                margin-left: 30px;
                text-align: center;
                align-content: center;
            }

            ul.horizontal-list {
                list-style-type: none;
                padding: 0;
                margin-top: 5px;
                display: flex;
            }
            ul.horizontal-list li{
                margin-left: 35px;
            }
            .utilities{
                border-color: rgb(221, 223, 226);
                padding: 0px 10px 0px 16px;
                border-width: 1px;
                border-radius: 5px;
                width: 70%;
                border-style: solid;
            }
            .utilities h2 {
                font-size: 24px;
                margin-bottom: 10px;
            }

            .horizontal-list {
                list-style-type: none;
                padding: 0;
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
            }

            .horizontal-list li {
                display: flex;
                align-items: center;
                font-size: 16px;
                color: #333;
            }

            .horizontal-list li i {
                color: #28a745;
                margin-right: 10px;
            }
            .map{
                border-color: rgb(221, 223, 226);
                border-width: 1px;
                border-radius: 5px;
                width: 30%;
                border-style: solid;
                margin-left: 30px;
            }

            .room{
                border-color: rgb(221, 223, 226);
                padding: 0px 10px 0px 16px;
                border-width: 1px;
                border-radius: 5px;
                border-style: solid;
                margin-top: 20px;
                height: auto;
            }

            .room_main{
                display: flex;
            }

            .room .img{

                width: 20%;
            }

            .img_room{
                width: 100%;
                margin: 5px;
                text-align: center;
            }

            .room .describe{
                font-size: 14px;
                line-height: 20px;
                font-weight: 300;
                padding: 10px 10px 0px 16px;
                border-color: rgb(221, 223, 226);
                border-style: solid;
                border-width: 1px;
                border-radius: 5px;
                border-style: solid;
                width: 25%;
                margin-left: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .utilities1 {
                width: 17%;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 5px;
            }

            .utilities1 h5 {
                margin-bottom: 10px;
                color: #333;
            }

            .utilities1 hr {
                margin: 10px 0;
            }

            .utilities1 ul.ngon {
                list-style: none;
                padding: 0;
            }

            .utilities1 ul.ngon li {
                margin: 5px 0;
                font-size: 16px;
                color: #555;
                display: flex;
                align-items: center;
            }

            .utilities1 ul.ngon li i {
                color: #28a745;
                margin-right: 10px;
            }


            .room .quantity{
                width: 7%;
                margin-left: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                text-align: center;
            }

            .room .price{
                background-color: #f9f9f9;
                width: 15%;
                margin-left: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                text-align: center;
            }

            .room .action{
                width: 10%;
                margin-left: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                align-content: center;
                text-align: center;
                display: grid;
            }

            .action a{
                padding: 30px 20px;
                text-decoration: none;
                color: white;
                background-color: #000000;
                margin-bottom: 20px;
            }

            .action a {
                padding: 10px 20px;
                text-decoration: none;
                color: white;
                background-color: #007bff;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .action a:hover {
                background-color: #0056b3;
            }


            .ngon li{
                margin: 4px;
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


            .favorite{
                position: absolute;
                margin-top: 15px;
                margin-left: 15px;
                font-size: 50px;
                text-decoration: none;
                color: black;
            }

            .favorite:hover{
                color: #ff99ff;
            }

            input{
                padding: 5px;
                border-radius: 5px;
            }

            input:hover{
                background-color: #00ccff;
            }

            .hover-expand {
                transition: transform 0.3s ease;
            }

            .hover-expand:hover {
                transform: scale(1.1);
            }

            .img_room, .img_main {
                overflow: hidden;
            }

            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                padding-top: 60px;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.9);
            }

            .modal-content {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 700px;
            }

            #caption {
                margin: auto;
                display: block;
                width: 80%;
                max-width: 700px;
                text-align: center;
                color: #ccc;
                padding: 10px 0;
                height: 150px;
            }

            .modal-content, #caption {
                animation-name: zoom;
                animation-duration: 0.6s;
            }

            @keyframes zoom {
                from {
                    transform: scale(0);
                }
                to {
                    transform: scale(1);
                }
            }

            .close {
                position: absolute;
                top: 15px;
                right: 35px;
                color: #f1f1f1;
                font-size: 40px;
                font-weight: bold;
                transition: 0.3s;
            }

            .close:hover,
            .close:focus {
                color: #bbb;
                text-decoration: none;
                cursor: pointer;
            }

            .img_main_top {
                border-radius: 20px;
                border-top-right-radius:0;
                border-bottom-right-radius:0;
            }

            .img_main_top1 {
                border-radius: 20px;
                border-top-left-radius:0;
                border-bottom-left-radius:0;
            }

            .date{
                background-color: #2c3e50;
                padding: 20px ;
                position: fixed;
                right: 0;
                top: 0;
                border-radius: 10px;
                display: block; /* Hiển thị phần tử .date mặc định */
            }

            .date form{
                display: flex;
                justify-content: center;
                gap: 10px;
            }

            .test{
                position: fixed;
                border-radius: 10px;
                background-color: #cccccc;
                padding: 20px ;
                display: block;
                right: 0;
                bottom: 0;
                margin-top: 40px;
            }

            .review-container{
                width: 95%;
                margin: 0 40px;
            }

            .review{
                width: 100%;
                display: flex;
            }

            .review form{
                width: 100%;
                display: flex;
            }

            .review .review-rating{
                width: 40%;
            }

            .review .review-comment{
                width: 50%
            }

            rating {
                font-family: Arial, sans-serif;
                display: flex;
                flex-direction: column;
                padding: 20px;
            }

            .rating-bar {
                display: flex;
                align-items: center;
                width: 100%;
                max-width: 400px;
                margin-bottom: 10px;
            }

            .label {
                flex: 1;
                text-align: left;
            }

            .bar {
                position: relative;
                flex: 2;
                height: 10px;
                background-color: #e0e0e0;
                border-radius: 5px;
                margin: 0 10px;
            }

            .fill {
                height: 100%;
                background-color: #76c7c0;
                border-radius: 5px;
            }

            .score {
                flex: 0.5;
                text-align: right;
            }

            .pagination-item {
                display: inline-block;
                margin: 0 5px;
            }

            .pagination-link {
                text-decoration: none;
                color: #007bff;
                padding: 8px 16px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }

            .pagination-link:hover {
                background-color: #ddd;
            }

            .pagination-item.active .pagination-link {
                background-color: #007bff;
                color: white;
            }

            footer {
                margin-top: 30px;
                background-color: #2c3e50;
                color: white;
                text-align: center;
                padding: 20px 0;
            }

            .review-comment textarea {
                width: calc(100% - 20px);
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 10px;
                margin-bottom: 20px;
                resize: vertical;
                background-color: #f1f1f1;
            }

            /*TEST*/
            .review {
                border: 1px solid #ddd;
                border-radius: 8px;
                padding: 20px;
                margin: 10px 0;
                background-color: #f9f9f9;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            /*            .review-rating {
                            display: flex;
                            align-items: center;
                            justify-content: space-between;
                            margin-bottom: 10px;
                        }*/

            .review-rating h2 {
                font-size: 24px;
                color: #007bff;
                margin: 0;
            }

            /*            .review-rating h4 {
                            font-size: 14px;
                            color: #777;
                            margin: 0;
                        }*/

            .review-comment {
                padding: 10px;
                border-top: 1px solid #eee;
                background-color: #f1f1f1;
                border-radius: 10px;
                padding: 30px 30px 30px 30px;
            }

            .review-comment p {
                margin: 5px 0;
                color: #333;
                font-size: 16px;
                line-height: 1.5;

            }

            /*            .review-comment p:last-of-type {
                            font-size: 14px;
                            color: #999;
                            margin-top: 10px;
                        }*/

            .tour{
                width: 100%;
                margin: 0 40px;
                display: flex;
            }

            .tour .item{
                height: 250px;
                border-radius: 10px;
            }

            .tour .itemt{
                height: 250px;
                border-radius: 10px;
                margin-left: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                border-style: solid ;
            }
        </style>
    </head>
    <body>
        <c:set var="hotel" value="${requestScope.hotel}" />
        <c:set var="rating" value="${requestScope.rating}" />
        <nav>
            <ul class="header">
                <c:if test="${(sessionScope.account.getRoleID() == 3 || sessionScope.account.getRoleID() == null)}">
                    <li> <a href="home">Trang chủ</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() == 2)}">
                    <li> <a href="homehotelier">Trang chủ</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() == 1 )}">
                    <li> <a href="homeadmin">Trang chủ</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() == 2)}">
                    <li> <a href="addhotel">Thêm khách sạn</a></li>
                    <li> <a href="edithotel?id=${hotel.id}">Chỉnh sửa khách sạn</a></li>
                    <li> <a href="addroom?id=${hotel.id}">Thêm Phòng</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() == 2 || sessionScope.account.getRoleID() == 3 )}">
                    <li> <a href="updateprofile">Hồ sơ của tôi</a></li>
                    </c:if>
                    <c:if test="${(sessionScope.account.getRoleID() != null)}">
                    <li><a href="logout">Đăng xuất</a></li>
                    </c:if>          
                    <c:if test="${(sessionScope.account.getRoleID() == null)}">
                    <li><a href="login">Đăng nhập</a></li>
                    <li><a href="register">Đăng kí</a></li>
                    </c:if>  
            </ul>
        </nav>
        <c:if test="${(sessionScope.account.getRoleID() == 3 || sessionScope.account.getRoleID() == null)}">
            <div class="date">
                <form action="updatedate">
                    <input type="date" name="checkin" placeholder="Ngày đến" value="${sessionScope.checkin}" min="${sessionScope.min}" onchange="submit()" required>
                    <input type="date" name="checkout" placeholder="Ngày đi" value="${sessionScope.checkout}" min="${sessionScope.max}" onchange="submit()" required><br/>             
                    <input type="hidden" name="url"  value="detailhotel?id=${hotel.id}#room" ><br/>             
                </form>
                <c:if test="${requestScope.mess != null}">
                    <div class="test" id="addcart">
                        <h4>đã thêm vào hàng chờ</h4>
                    </div>
                </c:if>
            </div>
        </c:if>
        <div class="container">
            <div class="img_header">
                <div  class="img_main">
                    <img  class="hover-expand  img_main_top" width="100%" height="210px" style="object-fit: cover" src="${hotel.imagemain}" alt="alt"/>
                </div>
                <div class="img_main">
                    <img class="hover-expand" width="100%" height="210px" style="object-fit: cover" src="${hotel.imagesub}" alt="alt"/>
                </div>
                <div class="img_main">
                    <img class="hover-expand  img_main_top1" width="100%" height="210px" style="object-fit: cover" src="${hotel.imagesub1}" alt="alt"/>
                </div>
            </div>
            <div class="more">
                <div class="info">
                    <h2 style="display: inline; font-size: 26px;font-weight: 700;">Khách sạn ${hotel.name}</h2>                  
                    <p><strong>Địa chỉ:  </strong>${hotel.address}</p>
                    <p>${hotel.describe}</p>
                    <p >nhận phòng: ${hotel.checkin}</p>
                    <p >trả phòng: ${hotel.checkout}</p>
                </div>
                <div class="refund">
                    <h4>Chính sách hủy</h4>
                    <p><strong>${(hotel.refund)?"Hủy 2 ngày trước khi nhận phòng (hoàn 100%)":"Hủy sẽ mất toàn bộ chi phí"}</strong></p>
                </div>
                <div class="rating">
                    <h2>${rating.r1} - ${rating.quantity} bài đánh giá</h2>
                    <div class="rating-bar">
                        <span class="label">Vị Trí</span>
                        <span class="score">${rating.r2}</span>
                    </div>
                    <div class="rating-bar">
                        <span class="label">Tiện nghi</span>
                        <span class="score">${rating.r3}</span>
                    </div>
                    <div class="rating-bar">
                        <span class="label">Dịch vụ</span>
                        <span class="score">${rating.r4}</span>
                    </div>
                    <div class="rating-bar">
                        <span class="label">Độ sạch sẽ</span>
                        <span class="score">${rating.r5}</span>
                    </div>
                </div>
            </div>
            <div class="more">
                <div class="utilities">
                    <h2>Tiện ích</h2>
                    <ul class="horizontal-list">
                        <c:forEach items="${requestScope.uh}" var="uh">
                            <li><i class="fas fa-check"></i>${uh}</li>
                            </c:forEach>
                    </ul>
                </div>
                <div class="map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.5062169040166!2d105.52271427471399!3d21.012421688340613!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abc60e7d3f19%3A0x2be9d7d0b5abcbf4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgSMOgIE7hu5lp!5e0!3m2!1svi!2s!4v1716360179215!5m2!1svi!2s" width="100%" height="auto" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
            <div id="room">
                <c:forEach items="${requestScope.room}" var="r">
                    <div class="room" id="${r.id}">
                        <div class="room_header">
                        </div>
                        <div class="room_main">
                            <div class="img">
                                <div class="img_room">
                                    <img class="hover-expand" width="100%" height="150px" style="object-fit: cover" src="${r.img1}" alt="alt"/>
                                </div>
                                <div class="img_room">
                                    <img class="hover-expand" width="49%" height="75px" style="object-fit: cover" src="${r.img2}" alt="alt"/>
                                    <img class="hover-expand" width="49%" height="75px" style="object-fit: cover" src="${r.img3}" alt="alt"/>
                                    <img class="hover-expand" width="49%" height="75px" style="object-fit: cover" src="${r.img4}" alt="alt"/>
                                    <img class="hover-expand" width="49%" height="75px" style="object-fit: cover" src="${r.img5}" alt="alt"/>
                                </div>
                            </div>

                            <div class="describe">
                                <h5 style="font-size: 17px;">Mô tả:</h5>
                                <hr>
                                <p><strong>Phòng: ${r.name}</strong></p>
                                <p style="margin: 3px">${r.describe}</p>

                            </div >

                            <div class="utilities1">
                                <h5 style="font-size: 20px;">Tiện ích:</h5>
                                <hr>
                                <ul class="ngon">
                                    <c:forEach items="${r.listutilities}" var="lu">
                                        <li><i class="fas fa-check"></i> ${lu}</li>
                                        </c:forEach>
                                </ul>
                            </div>

                            <div class="quantity">
                                <h5 style="font-size: 18px; margin-bottom: 37px;">Sức chứa:</h5>
                                <hr>
                                <h3 style=" margin-top:20px; color: #34ce57">${r.nop}</h3>
                            </div>

                            <div class="price">
                                <h5 style="font-size: 20px;">Giá:</h5>
                                <hr>
                                <h3 style="color: orangered">${r.price} VND</h3>
                            </div>

                            <div class="action">
                                <c:if test="${(sessionScope.account.getRoleID() == 2)}">
                                    <a href="editroom?id=${r.id}&hotel_id=${hotel.id}">Chỉnh sửa phòng</a>
                                    <h4>SL: ${r.quantity}</h4>
                                </c:if>
                                <c:if test="${((r.quantity - r.quantityRoomEmpty != 0) && (sessionScope.account.getRoleID() != 2) && (sessionScope.account.getRoleID() != 1) ) }">
                                    <form action="addtocart" method="post" enctype="multipart/form-data" id="booking">       
                                        <input type="hidden" name="hotel_id" value="${hotel.id}" />  
                                        <input type="hidden" name="room_id" value="${r.id}" />  
                                        <input type="hidden" name="name_hotel" value="${hotel.name}" />  
                                        <input type="hidden" name="name_room" value="${r.name}" />  
                                        <input type="hidden" name="quatity" value="1" /> 
                                        <input type="hidden" name="price" value="${r.price}" />
                                        <input type="hidden" name="checkin" value="${sessionScope.checkin}" />
                                        <input type="hidden" name="checkout" value="${sessionScope.checkout}" />                       
                                        <input style="padding: 5px; border-radius: 5px;" type="submit" name="" value="Đặt ngay" />
                                    </form>
                                    <h4>Còn ${r.quantity - r.quantityRoomEmpty} phòng</h4>
                                </c:if>  
                                <c:if test="${(r.quantity - r.quantityRoomEmpty) == 0}">
                                    <div style="border-style: solid; color: red;padding: 20px 0px">
                                        Hết phòng
                                    </div>
                                </c:if>
                            </div>

                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <c:if test="${requestScope.listt.size() > 0}">
            <h3 style="margin-left: 40px">Các hoạt động ở quanh ${hotel.address}</h3>
            <div class="tour" id="tour">     
                <div class="item" style="width: 7%">
                    <img src="https://cdn6.agoda.net/images/TripSaving/activity-carousel-view-all-2x.jpg?s=116x" width="100%" height="250px" style="object-fit: cover;border-radius: 10px" alt="alt"/>
                </div>
                <c:forEach items="${requestScope.listt}" var="tour">

                    <div class="itemt" style="width: 13%">
                        <a href="tour?tour_id=${tour.tour_id}" style="text-decoration: none;color: black">
                            <div>
                                <img src="${tour.tour_img}" width="100%" height="130px" style="object-fit: cover;border-radius: 10px" alt="alt"/>
                            </div>
                            <div>
                                <h4>${tour.tour_name}</h4>
                                <h4>${tour.price} VNĐ</h4>
                            </div>
                        </a>
                    </div>
                </c:forEach>

            </div>      
        </c:if>
            <c:if test= "${requestScope.listreview.size() > 0}" >
            <div class="review-container" id="review">
                <h3>Bài đánh giá của ${hotel.name}</h3>
                <hr>
                <c:forEach items="${requestScope.listreview}" var="lr">
                    <div class="review">
                        <div class="review-rating">
                            <h2>${lr.hotel_rating} - Trên cả tuyệt vời</h2>
                            <h4>${lr.username}</h4>
                        </div>
                        <div class="review-comment">
                            <b>${lr.comment}</b>
                            <p style="color: grey">Đã nhận xét vào ngày ${lr.date}</p>
                        </div>
                    </div>
                    <hr>
                </c:forEach>
                <c:forEach begin="1" end="${requestScope.num}" var="i">
                    <li class="pagination-item" data-page="${i}">
                        <a class="pagination-link" href="detailhotel?id=${hotel.id}&page=${i}#review">${i}</a>
                    </li>
                </c:forEach>
                <c:if test="${sessionScope.account.getRoleID() == 3}">
                    <c:if test="${sessionScope.review == hotel.id}">
                        <div class="review">
                            <form action="review" method="post">
                                <div class="review-rating">
                                    <h5>Vị trí</h5>
                                    <input type="radio" name="rating1" value="9" />9 rất tốt
                                    <input type="radio" name="rating1" value="8" />8 tốt
                                    <input type="radio" name="rating1" value="7" checked=""/>7 ổn 
                                    <input type="radio" name="rating1" value="6" />6 không như kỳ vọng
                                    <input type="radio" name="rating1" value="5" /><5 tệ
                                    <h5>Dịch vụ</h5>
                                    <input type="radio" name="rating2" value="9" />9 rất tốt
                                    <input type="radio" name="rating2" value="8" />8 tốt
                                    <input type="radio" name="rating2" value="7" checked=""/>7 ổn 
                                    <input type="radio" name="rating2" value="6" />6 không như kỳ vọng
                                    <input type="radio" name="rating2" value="5" /><5 tệ
                                    <h5>Tiện nghi</h5>
                                    <input type="radio" name="rating3" value="9" />9 rất tốt
                                    <input type="radio" name="rating3" value="8" />8 tốt
                                    <input type="radio" name="rating3" value="7" checked=""/>7 ổn 
                                    <input type="radio" name="rating3" value="6" />6 không như kỳ vọng
                                    <input type="radio" name="rating3" value="5" /><5 tệ
                                    <h5>Độ sạch sẽ</h5>
                                    <input type="radio" name="rating4" value="9" />9 rất tốt
                                    <input type="radio" name="rating4" value="8" />8 tốt
                                    <input type="radio" name="rating4" value="7" checked=""/>7 ổn 
                                    <input type="radio" name="rating4" value="6" />6 không như kỳ vọng
                                    <input type="radio" name="rating4" value="5" /><5 tệ
                                </div>
                                <div class="review-comment">
                                    <h5>NHẬN XÉT VỀ KHÁCH SẠN</h5>
                                    <textarea id="id" name="comment" rows="15" cols="110"></textarea>
                                    <input type="hidden" name="hotel_id" value="${hotel.id}" /> 
                                    <input type="submit" value="Đánh giá" />
                                </div>
                            </form>
                        </div>
                    </c:if>
                </c:if>
            </div>
        </c:if>


        <div id="imageModal" class="modal">
            <span class="close">&times;</span>
            <img class="modal-content" id="img01">
            <div id="caption"></div>
        </div>


        <footer>
            <p>&copy; 2024 Travelocket. All rights reserved.</p>
        </footer>
        <script>
            //////// mở ảnh
            var modal = document.getElementById("imageModal");
            var images = document.querySelectorAll('.img_room img,.img_header img');
            var modalImg = document.getElementById("img01");
            var captionText = document.getElementById("caption");

            images.forEach(image => {
                image.onclick = function () {
                    modal.style.display = "block";
                    modalImg.src = this.src;
                    captionText.innerHTML = this.alt;
                };
            });

            var span = document.getElementsByClassName("close")[0];
            span.onclick = function () {
                modal.style.display = "none";
            };

            /////////// phân trang
            document.addEventListener('DOMContentLoaded', function () {
                const urlParams = new URLSearchParams(window.location.search);
                const currentPage = urlParams.get('page') || '1';

                document.querySelectorAll('.pagination-item').forEach(item => {
                    if (item.getAttribute('data-page') === currentPage) {
                        item.classList.add('active');
                    }
                });
            });

            ////////// thông báo thêm vào giỏ hàng
            function changeDivContent() {
                var x = document.getElementById("addcart");
                x.style.display = 'none';
            }

            window.onload = function () {
                setTimeout(changeDivContent, 2000); // Thay đổi nội dung sau 2 giây
            };
            ////////// chuyen trang
            document.addEventListener("DOMContentLoaded", function () {
                document.body.classList.add('loaded');
            });

            window.addEventListener("beforeunload", function () {
                document.body.classList.remove('loaded');
            });

        </script>
    </body>
</html>
