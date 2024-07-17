<%-- 
    Document   : viewpost
    Created on : Jun 21, 2024, 12:10:52 AM
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
                background-color: #cccccc;
            }

            main{
                width: 100%;
                display: flex;
            }

            .overlay ,.overlay1 {
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

            .overlay div,.overlay1 div {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                width: 100%;
                max-width: 620px;
                /*                text-align: center;*/
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
                font-size: 24px;
                font-weight: bold;
            }

            nav ul {
                list-style: none;
                display: flex;
                margin: 0;
                padding: 0;
            }

            nav ul li {
                margin-left: 20px;
            }

            nav ul li a {
                color: white;
                text-decoration: none;
                font-size: 18px;
                margin: 0px 10px;

            }

            nav ul li a:hover{
                color: #0099ff;
            }

            .user-options a {
                color: white;
                margin-left: 20px;
                text-decoration: none;
                font-size: 18px;
            }

            .user-options a:hover{
                color: #cccccc;
            }

            .contain-full{
                margin-top: 30px;
                overflow: auto;
                max-height: 550px;
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
            }

            .sub{
                width: 30%;
                margin-top: 30px;
                background-color: #ffffff;
                border-radius: 5px;
                margin-right: 30px;
            }

            .all{
                width: 60%; /* Adjusted width to 60% */
            }

            .post, .viewpost{
                width: 100%;
                background-color: #ffffff;
                border-radius: 10px;
                margin-top: 10px;
            }

            .post .img, .viewpost .img{
                width: 15%;
                border-radius: 10px;
                align-content: center;
                margin-left: 20px;
            }

            .post .btn{
                width: 85%;
                margin-left: 10px;
                align-content: center;
            }

            .post .btn input[type="button"]{
                width: 90%;
                background-color: #cccccc;
                border-radius: 40px;
                padding: 15px 10px;
            }

            .viewpost .info{
                display: flex;
            }

            .viewpost .img{
                width: 10%;
            }

            .viewpost .name{
                width: 50%;
            }

            .viewpost .edit{
                width: 40%
            }

            .viewpost .caption{
                margin: 0 10px;
            }

            .viewpost .imgpost{
                width: 100%;
                text-align: center;
            }

            .viewpost .imgpost img{
                width: 100%;
                height: 350px;
                object-fit: cover;
            }

            .viewpost .action-button{
                display: flex;
                justify-content: space-between;
            }

            .viewpost .action-button a{
                text-decoration: none;
                color: black;
                margin: 20px;
            }

            .sub1{
                margin: 30px;
                border-radius: 5px;
                padding: 5px;
            }

            .sub1:hover{
                background-color: #cccccc;
            }

            .sub1 a{
                text-decoration: none;
                color: black;
            }

            .destinations-container {
                display: flex;
                flex-wrap: wrap;
                width: 30%; /* Adjusted width to fit next to .all */
                position: sticky;
                top: 10px;
            }

            .destination-item {
                background-color: #ffffff;
                border: 1px solid #e0e0e0;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                width: 48%; /* Adjusted width to fit 2 per row */
                margin-bottom: 10px;
                transition: transform 0.3s ease;
            }

            .destination-item:hover {
                transform: translateY(-5px);
            }

            .destination-item img {
                width: 100%;
                height: 100px;
                object-fit: cover;
                border-bottom: 1px solid #e0e0e0;
            }

            .destination-item h3 {
                font-size: 1em;
                color: black;
            }
        </style>
    </style>
</head>
<body>
    <c:set value="${requestScope.listlike}" var="ll" />
    <header>
        <div class="navbar">
            <div class="logo">
                <a href="home">Travelocket</a>
            </div>
            <nav>
                <ul>
                    <li><a href="${(sessionScope.account.roleID == 3)?"home":"homehotelier"}">Trang Chủ</a></li>
                    <li><a href="newpost">Cộng đồng</a></li>
                    <li><a href="updateprofile">Hồ sơ</a></li>
                    <c:if  test="${sessionScope.account.roleID == 3}">
                    <li><a href="viewdiscount">Khuyến mại</a></li>
                    <li><a href="cart1">Hàng chờ</a></li>
                    </c:if>
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
    <main>
        <div class="sub">
            <div class="sub2" style="margin-top: 10px;">
                <form action="searchpost" method="post" >
                    <input style="width: 97%;border-radius: 20px;height: 30px" type="text" name="query" value="${requestScope.query}" placeholder="tìm kiếm trên travelocket" required="" onautocomplete="submit()"/>
                    <input type="hidden" name="email" value="${account.email}" />
                    <!--                        <input type="submit" name="" value="Tìm kiếm" />-->
                </form>
            </div>
            <div class="sub1">
                <a href="#" onclick="Action1(event)" >Đăng bài</a>
            </div>
            <div class="sub1">
                <a href="searchpost?email=${account.email}">Bài viết của tôi</a>
            </div>
            <div class="sub1">
                <a href="searchpost?email=${account.email}&hot=true">Bài viết nổi bật</a>
            </div>
        </div>
        <div class="contain-full">
            <div class="all">
                <div class="post" id="post" style="display: flex">
                    <div class="img">
                        <img src="img/user.jpg" width="100%" height="auto"/>
                    </div>
                    <div class="btn">
                        <input type="button" onclick="Action1(event)" name="" value="Hãy chia sẻ những chuyến du lịch của bạn" />
                    </div>
                </div>
                <c:forEach items="${requestScope.listpost}" var="lp" >
                    <div class="viewpost" id="${lp.id}">
                        <div class="info">
                            <div class="img">
                                <img src="img/user.jpg" width="100%" height="auto"/>
                            </div>
                            <div class="name">
                                <h4>${lp.name}</h4>
                                <p>${lp.date}</p>
                            </div>
                            <c:if test="${sessionScope.account.email.equals(lp.email)}">
                                <div class="edit" style="align-content: center;text-align: center">
                                    <a href="#" onclick="Action3(event, '${lp.id}')" style="margin-left: 50px;text-decoration: none;color: black;font-size: 20px">...</a>
                                    <a href="#" onclick="Action5(event, '${lp.id}')" style="margin-left: 50px;text-decoration: none;color: black;font-size: 20px">X</a>
                                </div>
                            </c:if>
                        </div>
                        <div class="caption">
                            <p>${lp.caption}</p>
                        </div>
                        <div class="imgpost">
                            <img src="${lp.img}" alt="alt" width="100%" height="350px" style="object-fit: cover"/>
                        </div>
                        <hr>
                        <h5 style="margin: 0;margin-left: 10px">${lp.totalLike} ❤</h5>
                        <hr>
                        <div class="action-button">
                            <a href="javascript:void(0);" onclick="toggleFavorite('${lp.id}', this)"  style="font-size: 20px;">
                                <div class="like" id="like_${lp.id}">❤</div>
                            </a>
                            <a href="commentpost?post_id=${lp.id}" >Bình luận</a>
                        </div>
                        <div class="overlay1" id="overlaydele${lp.id}">
                            <div style="text-align: center">

                                <h3>Bạn có chắc muốn xóa bài viết này</h3>
                                <p>Nếu bạn xóa bài đăng này tất cả bình luận và lượt thích sẽ bị xóa</p>
                                <a href="deletepost?post_id=${lp.id}" style="text-decoration: none;color: black;padding: 10px;background-color: #ff3333 ">Xóa bài đăng này</a>
                                <a href="#" onclick="Action55(event, '${lp.id}')" style="text-decoration: none;color: black;padding: 10px;background-color: #cccccc">Trở lại</a>
                            </div>
                        </div>
                        <div class="overlay1" id="overlay${lp.id}">
                            <div>
                                <div style="display: flex;justify-content: space-between;padding: 0px;align-content: center" >
                                    <p>Chỉnh sửa bài viết</p><a href="#" onclick="Action4(event, '${lp.id}')" style="align-content: center;text-decoration: none;color: black">X</a>
                                </div>
                                <hr>
                                <div style="display: flex;padding: 0px">
                                    <div class="post-img" style="width: 10%;padding: 0px;align-content: center">
                                        <img src="img/user.jpg" alt="alt" width="100%" height="auto"/>
                                    </div>
                                    <div class="post-name" style="width: 60%;padding: 0px;align-content: center">
                                        <h4>${lp.name}</h4>
                                    </div>
                                </div>
                                <form action="updatepost" method="post" enctype="multipart/form-data">                   
                                    <textarea id="id" name="caption" rows="5" cols="10" style="width: 100%">${lp.caption}</textarea><br>
                                    <input type="hidden" name="post_id" value="${lp.id}" />
                                    <img width="100%" height="280px" style="object-fit: cover"  src="${lp.img}" alt="" id="imagePreview1" onclick="triggerFileInput('uploadInput1')"/>
                                    <input type="file" style="width: 100%;display: none" name="imageFile" accept="image/*"  id="uploadInput1" onchange="uploadImage(event, 'imagePreview1')">
                                    <input type="hidden" value="${lp.img}" name="data">
                                    <input type="submit" name="" value="Chỉnh sửa" style="    margin-top: 20px;
                                           width: 100%;
                                           padding: 10px;"/>
                                </form>
                            </div>
                        </div>
                        <div class="overlay1" id="overlaycm${lp.id}" style="${(requestScope.postid == lp.id)?"display : flex":""}">
                            <div>
                                <div style="display: flex;justify-content: space-between;padding: 0px;align-content: center" >
                                    <p>Bài viết của ${lp.name}</p>
                                    <a href="newpost#${lp.id}" onclick="Action6(event, '${lp.id}')" style="align-content: center;text-decoration: none;color: black">X</a>
                                </div>
                                <hr>
                                <div style="display: flex;padding: 0px">
                                    <div class="post-img" style="width: 10%;padding: 0px;align-content: center">
                                        <img src="img/user.jpg" alt="alt" width="100%" height="auto"/>
                                    </div>
                                    <div class="post-name" style="width: 60%;padding: 0px;align-content: center">
                                        <h4>${lp.name}</h4>
                                    </div>
                                </div>
                                <img width="100%" height="220px" style="object-fit: cover"  src="${lp.img}" alt="" id="imagePreview1"/>
                                <hr>
                                <div class="comment" style="width: 95%;padding: 0px;overflow: auto ;max-height: 200px">
                                    <c:forEach items="${requestScope.listcm}" var="lcm" >
                                        <div  style="width: 100%;padding: 0px;display: flex">
                                            <div style="width: 10%;padding: 0px">
                                                <img src="img/user.jpg" alt="alt" width="100%" height="40px" style="object-fit: cover"/>
                                            </div >
                                            <div style="width: 80%;padding: 5px;background-color: #cccccc;border-radius: 5px;margin-bottom: 8px">
                                                <p style="margin: 0px;font-size: 12px">${lcm.name} - ${lcm.date}</p>
                                                <p style="margin: 0px;font-size: 14px">${lcm.commnet}</p>
                                            </div>
                                            <div style="width: 10%;padding: 5px;align-content: center">
                                                <c:if test="${sessionScope.account.email.equals(lcm.email)}">
                                                    <a href="deletecomment?c_id=${lcm.id}&post_id=${lp.id}" style="text-decoration: none;
                                                       color: black;">X</a>
                                                </c:if>

                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <hr>
                                <form action="commentpost" method="post">                   
                                    <input type="hidden" name="post_id" value="${lp.id}" />
                                    <input type="hidden" name="email" value="${account.email}" />
                                    <div style="width: 100%;padding: 0px;display: flex;height: 30px">
                                        <div style="width: 85%;padding: 0px">
                                            <input type="text" name="comment" value="" placeholder="Bình luận với vai trò ${lp.name}" style="width: 98%; height: 30px" required=""/>
                                        </div>
                                        <div style="width: 15%;padding: 0px">
                                            <input type="submit" name="" value="bình luận" style="height: 34px" />
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

<!--            <div class="destinations-container" >
                <c:forEach items="${requestScope.listd}" var="ld">
                    <div class="destination-item">
                        <a href="adddiscounttowallet?discount_id=${ld.discount_id}"><img src="${ld.img_discount}"></a>
                    </div>
                </c:forEach>               
            </div>-->

        </div>
    </main>
    <div class="overlay" id="overlay">
        <div>
            <div style="display: flex;justify-content: space-between;padding: 5px;align-content: center" >
                <p>Tạo bài viết</p><a href="#" onclick="Action2(event)" style="align-content: center;text-decoration: none;color: black">X</a>
            </div>
            <hr>
            <div style="display: flex;padding: 0px">
                <div class="post-img" style="width: 10%;padding: 0px;align-content: center">
                    <img src="img/user.jpg" alt="alt" width="100%" height="auto"/>
                </div>
                <div class="post-name" style="width: 60%;padding: 0px;align-content: center">
                    <h4>Hãy tạo thật nhiều khoảnh khắc cùng travelocket</h4>
                </div>
            </div>
            <form action="newpost" method="post" enctype="multipart/form-data">
                <textarea id="id" name="caption" rows="5" cols="10" style="width: 100%"></textarea><br>
                <input type="hidden" name="email" value="${sessionScope.account.email}" />
                <img width="100%" height="270px" style="object-fit: cover"  src="" alt="" id="imagePreview" onclick="triggerFileInput('uploadInput')"/>
                <input type="file" style="width: 100%;display: none" name="imageFile" accept="image/*"  id="uploadInput" onchange="uploadImage(event, 'imagePreview')">
                <input type="submit" name="" value="Đăng" style="    margin-top: 20px;
                       width: 100%;
                       padding: 10px;"/>
            </form>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>     
        function Action1(event) {
            event.preventDefault();
            document.getElementById('overlay').style.display = 'flex';
        }
        function Action2(event) {
            event.preventDefault();
            document.getElementById('overlay').style.display = 'none';
        }

        function Action3(event, x) {
            event.preventDefault();
            document.getElementById('overlay' + x).style.display = 'flex';
        }
        function Action4(event, x) {
            event.preventDefault();
            document.getElementById('overlay' + x).style.display = 'none';
        }

        function Action5(event, x) {
            event.preventDefault();
            document.getElementById('overlaydele' + x).style.display = 'flex';
        }

        function Action55(event, x) {
            event.preventDefault();
            document.getElementById('overlaydele' + x).style.display = 'none';
        }
        
        function Action6(event, x) {
            event.preventDefault();
            document.getElementById('overlaycm' + x).style.display = 'none';
        }

        function triggerFileInput(t) {
            document.getElementById(t).click();
        }

        // Hàm để xử lý sự kiện khi người dùng chọn file
        function uploadImage(event, t) {
            var input = event.target;
            var preview = document.getElementById(t);

            // Kiểm tra xem người dùng đã chọn file chưa
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    // Hiển thị ảnh đã chọn
                    preview.src = e.target.result;
                };

                // Đọc file ảnh
                reader.readAsDataURL(input.files[0]);
            }
        }
        
        ////////////////////  like
        function toggleFavorite(p_id, element) {
            $.ajax({
                url: "likepost",
                type: "GET",
                data: {
                    post_id: p_id 
                },
                success: function(response) {
                    if (response.status && response.status === "login") {
                        window.location.href = "login";
                    } else {
                         var isLike = response.isLike;
                        if (isLike) {
                            $(element).find('.like').css('color', 'blue');
                        } else {
                            $(element).find('.like').css('color', '');
                        }
                    }
                }
            });
        }

        $(document).ready(function() {
            var listlike = ${listlike};
            listlike.forEach(function(p_id) {
                $('#like_' + p_id).css('color', 'blue');
            });
        });
    </script>
</body>
</html>
