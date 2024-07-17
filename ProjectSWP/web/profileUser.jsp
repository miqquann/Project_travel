<%-- 
    Document   : profileUser
    Created on : May 18, 2024, 10:13:22 AM
    Author     : thait
--%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>

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

            main{
                width: 60%;
                margin-left: 30px;
            }

            .cover{
                display: inline-flex;
                background-color: #ffffff;
                -webkit-box-shadow: 0 4px 10px 0 rgba(0, 0, 0, .1);
                margin: 10px ;
            }

            .Profile_name{
                display: flex;
                background-image: -webkit-gradient(linear, left top, right top, from(#bfaae8), to(#d8cbf5));
                -webkit-box-shadow: 0 4px 10px 0 rgba(0, 0, 0, .1);
                height: 100px;
                width: 800px;
            }

            .Profile_name .Profile_info{
                display: flex;
            }

            .Profile_info .img_name{
                align-content: center;
                margin: 0px 50px;
            }
            .Profile_info .detail_name{
                color: #5a5b5b;
                font-size: 13px;
            }

            .btn {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 120px;
                padding: 10px;
                background-color: #f0f0f0;
                border-radius: 5px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .btn a.change {
                text-decoration: none;
                font-family: mallory, Helvetica Neue, Helvetica, Arial, sans-serif;
                color: black;
                font-size: 1em;
                padding: 10px 15px;
                border: 2px solid black;
                border-radius: 5px;
                transition: background-color 0.3s ease, color 0.3s ease;
            }

            .btn a.change:hover {
                background-color: black;
                color: white;
            }


            #Edit,#Edit1,#Edit2{
                display: none;
                align-content: center;
            }

            #Edit input,#Edit1 input,#Edit2 input{
                width: 250px;
                height: 30px;
                margin: 10px;
                margin-left: 50px;
            }

            #Edit button,#Edit1 button,#Edit2 button{
                margin-left: 50px;
                padding: 5px 10px;
            }

            #Edit button:hover{
                background-color: #0099ff;
            }

            .Profile_email{
                background-color: #ffffff;
                height: 100px;
                -webkit-box-shadow: 0 4px 10px 0 rgba(0, 0, 0, .1);
                display: flex;
                width: 800px;
            }

            .Profile_email .email_content{
                align-content: center;
                margin: 0px 50px;
                color: #5a5b5b;
                font-size: 13px;
            }

            .Profile_phone{
                height: 100px;
                -webkit-box-shadow: 0 4px 10px 0 rgba(0, 0, 0, .1);
                display: flex;
                width: 800px;
            }

            .Profile_phone .phone_content{
                align-content: center;
                margin: 0px 50px;
                color: #5a5b5b;
                font-size: 13px;
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

            .password-form {
                display: flex;
                flex-wrap: wrap;
            }

            .password-form input {
                flex: 1;
                margin-right: 10px;
            }

            .password-form button {
                flex: 0 0 auto;
                margin-top: 7px;
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

            footer {
                margin-top: 30px;
                background-color: #2c3e50;
                color: white;
                text-align: center;
                padding: 20px 0;
            }

        </style>
    </head>
    <body>
        <header></header>
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
                        <a href="travelmoney">Travelmoney</a>
                    </div>
                    <div class="sub">
                        <a href="wallet">Mã giảm giá của tôi</a>
                    </div>
                </c:if>

            </aside>
            <main>
                <div class="cover">
                    <div  class = "Profile_name">
                        <div id="Profile_name" class="Profile_info">
                            <div  class="img_name">
                                <img src="img/user.jpg" alt="alt" width="70px" height="70px" style="border-radius:50%"/>
                            </div>           
                            <div  class="detail_name">
                                <h3>Họ & tên</h3>
                                <h4 style="color: black; font-size: 150%;">${requestScope.user.name}</h4>
                            </div>
                        </div>
                        <div id="Edit" >
                            <form action="updateprofile" method="post" >
                                <input type="text" name="name" value=""placeholder="nhập tên" /><br/>
                                <button type="submit">Lưu</button>
                            </form>              
                        </div>                  
                    </div>
                    <div class="btn">
                        <a href="#" onclick="Edit('Profile_name', 'Edit')" class="change">Chỉnh sửa</a>  
                    </div>
                </div>



                <div class="cover">
                    <div class = "Profile_email">
                        <div class="email_content">
                            <h3>Email</h3>
                            <h3 style="color: black">${requestScope.user.email}</h3> 
                        </div>
                    </div>
                </div>



                <div class="cover">
                    <div class = "Profile_phone">
                        <div id="phone_content">
                            <div  class="phone_content">
                                <h3>Số Điện Thoại</h3>
                                <h3 style="color: black">${requestScope.user.phone}</h3> 
                            </div>
                        </div>
                        <div id="Edit1" >
                            <form action="updateprofile" method="post" >
                                <input type="text" name="phone" value="" placeholder="nhập số điện thoại"/><br/>
                                <button type="submit">Lưu</button>
                            </form>              
                        </div>
                    </div>
                    <div class="btn">
                        <a style="text-decoration: none" href="#" onclick="Edit('phone_content', 'Edit1')" class="change">Chỉnh sửa</a>  
                    </div>
                </div>



                <div class="cover">
                    <div class="Profile_phone">
                        <div id="phone_content1">
                            <div class="phone_content">
                                <h3>Mật Khẩu</h3>
                                <h3 style="color: black">******</h3> 
                            </div> 
                        </div>
                        <div id="Edit2">
                            <form action="changepassword" method="post" class="password-form">
                                <input type="password" name="oldpass" value="" placeholder="nhập mật khẩu hiện tại"/>
                                <input type="password" name="newpass" value="" placeholder="nhập mật khẩu mới"/>
                                <input type="password" name="confirm" value="" placeholder="nhập lại mật khẩu mới"/>
                                <button style="background-color: #4CAF50; color: white; cursor: pointer; border-radius: 5px; display: inline-block;padding: 5px 10px;" type="submit">Xác nhận</button>
                            </form>              
                        </div>
                    </div>
                    <h6 style="color: red">${requestScope.err}</h6>
                    <div class="btn">
                        <a style="text-decoration: none" href="#" onclick="Edit('phone_content1', 'Edit2')" class="change">Chỉnh sửa</a>  
                    </div>
                </div>


            </main>
        </div>
        <footer>
            <p>&copy; 2024 Travelocket. All rights reserved.</p>
        </footer>


        <script>
            function Edit(a, b) {
                const edit = document.getElementById(a);
                const edit1 = document.getElementById(b);
                if (edit1.style.display === 'none') {
                    edit.style.display = 'none';
                    edit1.style.display = 'block';
                } else {
                    edit1.style.display = 'none';
                    edit.style.display = 'flex';
                }
            }
        </script>
    </body>
</html>
