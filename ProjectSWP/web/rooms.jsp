<!DOCTYPE html>
<html lang="en">
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">  

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style_rooms.css" rel="stylesheet">

        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
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
                color: #0099ff;
            }

            .price-tag {
                top: 195px;
                left: 10px;

            }

            .custom-space {
                margin-left: 5px; /* Äiá»u chá»nh khoáº£ng cÃ¡ch nÃ y theo Ã½ báº¡n */
            }



            .filter-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                max-width: 400px;
                margin: auto;
            }

            .filter-container h2 {
                margin-top: 0;
                font-size: 24px;
                color: #333;
            }

            .filter-section {
                margin-bottom: 20px;
            }

            .filter-box {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .filter-box label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
                color: #555;
            }

            .price-range {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
            }

            .price-range input {
                width: 48%;
                padding: 8px;
                border-radius: 4px;
                border: 1px solid #ccc;
            }

            #price-range {
                width: 100%;
            }

            .star-rating {
                display: flex;
                flex-direction: column;
            }

            .star-rating label {
                background-color: #f9f9f9;
                padding: 15px;
                border: 1px solid #ddd;
                border-radius: 4px;
                display: flex;
                align-items: center;
                cursor: pointer;
                margin-bottom: 5px;
                transition: background-color 0.3s;
                font-size: 18px;
            }

            .star-rating input {
                margin-right: 10px;
                transform: scale(1.5);
            }

            .amenities input {
                margin-right: 10px;
                transform: scale(1.5);
            }

            .star-rating label i {
                margin-right: 5px;
                color: #FFD700;
            }

            .amenities label i {
                margin-right: 5px;
                color: #FFD700;
            }

            .star-rating label:hover {
                background-color: #eef;
            }

            .amenities label:hover {
                background-color: #eef;
            }

            .amenities {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
            }

            .amenities label {
                flex: 1 calc(100% - 10px);

                background-color: #f9f9f9;
                padding: 15px;
                border: 1px solid #ddd;
                border-radius: 4px;
                display: flex;
                align-items: center;
                cursor: pointer;
                font-size: 15px;
            }

            .amenities input {
                margin-right: 10px;
                transform: scale(1.5);
            }

            .apply-filters {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 15px;
                border-radius: 4px;
                cursor: pointer;
                font-size: 18px;
                width: 100%;
                transition: background-color 0.3s ease;
            }

            .apply-filters:hover {
                background-color: #0056b3;
            }

            .room-item {
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .room-item:hover {
                transform: scale(1.05);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            }

            .rating-label {
                display: inline-block;
                background-color:  #0dcaf0;
                color:  #0b5ed7;
                padding: 5px 10px;
                border-radius: 12px;
                font-size: 16px;
                font-weight: bold;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                transition: background-color 0.3s ease;
            }
            .img-fluid {
                width: 100%;
                height: 250px;
                object-fit: cover;
            }

        </style>
    </head>

    <body>
        <div class="container-xxl bg-white p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->

            <!-- Header Start -->
            <header>
                <div class="navbar">
                    <div class="logo">
                        <a href="home">Travelocket</a>
                    </div>
                    <nav>
                        <ul>
                            <li><a href="home">Trang chủ</a></li>
                            <li><a href="#">Khách sạn</a></li>
                                <c:if test="${sessionScope.account != null}">
                                <li><a href="updateprofile">Hồ sơ</a></li>
                                <li><a href="cart1">Hàng chờ</a></li>
                                </c:if>                           
                        </ul>
                    </nav>
                    <div class="user-options">
                        <c:if test="${sessionScope.account == null}">
                            <a href="login">Đăng nhập</a>
                            <a href="register">Đăng ký</a>
                        </c:if>
                        <c:if test="${sessionScope.account != null}">
                            <a href="logout">Đăng xuất</a>
                        </c:if>
                    </div>
                </div>
            </header>
            <!-- Header End -->


            <!-- Page Header Start -->
            <div class="container-fluid page-header mb-5 p-0" style="background-image: url(img/carousel-1.jpg);">
                <div class="container-fluid page-header-inner py-5">
                    <!-- CÃ THá» CHÃN GÃ ÄÃ VÃO ÄÃY -->
                </div>
            </div>
            <!-- Page Header End -->


            <!-- Booking Start -->
            <div class="container-fluid booking pb-5 wow fadeIn" data-wow-delay="0.1s">
                <div class="container">
                    <div class="bg-white shadow" style="padding: 35px;">
                        <form action="search" method="post">
                            <div class="row g-2">
                                <div class="col-md-10">
                                    <div class="row g-2">
                                        <div class="col-md-4"> 
                                            <c:if test="${query == null}">
                                            <input type="search" name="query" value="${requestScope.getCity.city}" class="form-control" placeholder="Điểm đến" /> 
                                            </c:if>
                                            <c:if test="${query != null}">
                                            <input type="search" name="query" value="${requestScope.query}" class="form-control" placeholder="Điểm đến" /> 
                                            </c:if>
                                        </div>
                                        <div class="col-md-4">
                                            <input type="date" name="checkin" class="form-control" placeholder="Check in" value="${sessionScope.checkin}"/>
                                        </div>
                                        <div class="col-md-4">
                                            <input type="date" name="checkout" class="form-control" placeholder="Check out" value="${sessionScope.checkout}"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <button type="submit" class="btn btn-primary w-100">Tìm</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Booking End -->


            <!-- Room Start -->


            <div class="row">

                <div class="col-lg-3">

                    <div class="filter-container">
                        <h2>Bộ lọc</h2>
                        <form id="filter-form" action="hotellocation?locationId=${location_id}" method="post">
                            <div class="filter-section">
                                <div class="filter-section">

                                    <div class="filter-box">
                                        <label>Giá mỗi đêm(VND):</label>
                                        <div class="price-range">
                                            <input type="number" name="minPrice" id="min-price" placeholder="Min Price" min="0" max="1000000" value="${param.minPrice != null ? param.minPrice : 0}" onchange="submitForm()">
                                            <input type="number" name="maxPrice" id="max-price" placeholder="Max Price" min="0" max="1000000" value="${param.maxPrice != null ? param.maxPrice : 1000000}" onchange="submitForm()">
                                        </div>
                                        <div class="sliders">
                                            <input type="range" name="minPrice" id="min-price-slider" min="0" max="1000000" step="50000" value="${param.minPrice != null ? param.minPrice : 0}" onchange="submitForm()">
                                            <input type="range" name="maxPrice" id="max-price-slider" min="0" max="1000000" step="50000" value="${param.maxPrice != null ? param.maxPrice : 1000000}" onchange="submitForm()">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="filter-section">
                                <div class="filter-box">
                                    <h5 style="color: red">${requestScope.mess}</h5>
                                    <label>Đánh giá của khách:</label>
                                    <div class="star-rating">
                                        <label><input type="checkbox" name="rating" value="9" ${param.rating != null && param.rating.contains('9') ? 'checked' : ''} onchange="handleRatingChange(this)"> 9+ <h6 style="margin: auto; margin-left: 10px">Trên cả tuyệt vời</h6></label>
                                        <label><input type="checkbox" name="rating" value="8" ${param.rating != null && param.rating.contains('8') ? 'checked' : ''} onchange="handleRatingChange(this)"> 8+ <h6 style="margin: auto; margin-left: 10px">Tuyệt vời</h6></label>
                                        <label><input type="checkbox" name="rating" value="7" ${param.rating != null && param.rating.contains('7') ? 'checked' : ''} onchange="handleRatingChange(this)"> 7+ <h6 style="margin: auto; margin-left: 10px">Tốt</h6></label>
                                        <label><input type="checkbox" name="rating" value="6" ${param.rating != null && param.rating.contains('6') ? 'checked' : ''} onchange="handleRatingChange(this)"> 6+ <h6 style="margin: auto; margin-left: 10px">Hài lòng</h6></label>
                                    </div>
                                </div>
                            </div>
                            <div class="filter-section">
                                <div class="filter-box">
                                    <label>Tiện nghi:</label>
                                    <div class="amenities">
                                        <label><input type="checkbox" name="amenities" value="Bãi để xe" onchange="handleAmenitiesChange()"> <i class="fas fa-parking"></i> Bãi để xe</label>
                                        <label><input type="checkbox" name="amenities" value="Hút thuốc" onchange="handleAmenitiesChange()"> <i class="fas fa-smoking"></i> Khu vực hút thuốc</label>
                                        <label><input type="checkbox" name="amenities" value="Thú cưng" onchange="handleAmenitiesChange()"><i class="fas fa-paw"></i> Được phép mang thú cưng</label>
                                        <label><input type="checkbox" name="amenities" value="Buffet" onchange="handleAmenitiesChange()"><i class="fas fa-utensils"></i> Buffet sáng</label>
                                        <label><input type="checkbox" name="amenities" value="Gym" onchange="handleAmenitiesChange()"> <i class="fas fa-dumbbell"></i> Phòng gym</label>
                                        <label><input type="checkbox" name="amenities" value="Hồ bơi" onchange="handleAmenitiesChange()"> <i class="fas fa-swimming-pool"></i> Hồ Bơi</label>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>


                <div class="col-lg-9">
                    <h5 style="color: #007bff; text-align: center">${requestScope.size} kết quả được tìm thấy</h5>
                    <div class="container-xxl py-5">
                        <div class="container">
                            <div class="row g-4">
                                <c:forEach items="${requestScope.listbyLocation}" var="o">
                                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                                        <a href="detailhotel?id=${o.id}">
                                            <div class="room-item shadow rounded overflow-hidden" style="margin-top: 20px;">

                                                <div class="position-relative">
                                                    <img class="img-fluid" src="${o.imagemain}" alt="">

                                                </div>
                                        </a>
                                        <div class="p-4 mt-2">
                                            <div class="d-flex justify-content-between mb-3">
                                                <h6 class="mb-0" style="font-weight: bold;">${o.name}</h6>
                                                <div class="ps-2">
                                                    <h6 class="rating-label">${o.rating}</h6>               
                                                </div>
                                            </div>
<!--                                            <div class="d-flex mb-3">
                                                <small class="border-end me-3 pe-3">
                                                    <i class="fa fa-bed text-primary me-2"></i>
                                                    <span class="custom-space">3 Bed</span>
                                                </small>
                                                <span class="mx-2">|</span>
                                                <small class="border-end me-3 pe-3">
                                                    <i class="fa fa-bath text-primary me-2"></i>
                                                    <span class="custom-space">2 Bath</span>
                                                </small>
                                                <span class="mx-2">|</span>
                                                <small>
                                                    <i class="fa fa-wifi text-primary me-2"></i>
                                                    <span class="custom-space">Wifi</span>
                                                </small>
                                            </div>       -->
                                            <p class="mb-3">${o.address}</p> 

                                            <div class="d-flex justify-content-between">

                                                <a class="btn btn-sm btn-primary rounded py-2 px-4" href="detailhotel?id=${o.id}">Xem Chi tiết</a>
                                                <h4 style="color: tomato ">${o.price} VND</h4> 
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>

            </div>

        </div>






        <!-- Room End -->


        <div class="container-xxl testimonial mt-5 py-5 bg-dark wow zoomIn" data-wow-delay="0.1s" style="margin-bottom: 90px;">

            <c:set var="page" value="${requestScope.page}"/>
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center mb-3">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>

                    <c:forEach begin="1" end="${requestScope.num}" var="i">
                        <li class="page-item ${i==page?"active":""}">
                            <c:if test="${query == null}">                           
                            <a class="page-link" href="hotellocation?page=${i}&locationId=${requestScope.location_id}">${i}</a>
                            </c:if>
                            <c:if test="${query != null}">                           
                            <a class="page-link" href="search?page=${i}&query=${requestScope.query}&checkin=${checkin}&checkout=${checkout}">${i}</a>
                            </c:if>
                        </li>
                    </c:forEach>

                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </ul>
            </nav>

        </div>


        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light footer wow fadeIn" data-wow-delay="0.1s">
            <div class="container pb-5">
                <div class="row g-5">
                    <div class="col-md-6 col-lg-4">
                        <div class="bg-primary rounded p-4">
                            <a href="hometung.jsp"><h1 class="text-white text-uppercase mb-3">Travelocket</h1></a>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <h6 class="section-title text-start text-primary text-uppercase mb-4">Contact</h6>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-12">
                        <div class="row gy-5 g-4">
                            <div class="col-md-6">
                                <h6 class="section-title text-start text-primary text-uppercase mb-4">Company</h6>
                                <a class="btn btn-link" href="">About Us</a>
                                <a class="btn btn-link" href="">Contact Us</a>
                                <a class="btn btn-link" href="">Privacy Policy</a>
                                <a class="btn btn-link" href="">Terms & Condition</a>
                                <a class="btn btn-link" href="">Support</a>
                            </div>
                            <div class="col-md-6">
                                <h6 class="section-title text-start text-primary text-uppercase mb-4">Services</h6>
                                <a class="btn btn-link" href="">Food & Restaurant</a>
                                <a class="btn btn-link" href="">Spa & Fitness</a>
                                <a class="btn btn-link" href="">Sports & Gaming</a>
                                <a class="btn btn-link" href="">Event & Party</a>
                                <a class="btn btn-link" href="">GYM & Yoga</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">Your Site Name</a>, All Right Reserved. 
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="">Home</a>
                                <a href="">Cookies</a>
                                <a href="">Help</a>
                                <a href="">FQAs</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!--    <script>
            const minPriceInput = document.getElementById('min-price');
            const maxPriceInput = document.getElementById('max-price');
            const minPriceSlider = document.getElementById('min-price-slider');
            const maxPriceSlider = document.getElementById('max-price-slider');
            // Đặt giá trị mặc định cho các ô nhập liệu và thanh trượt
            minPriceInput.value = minPriceSlider.min;
            maxPriceInput.value = maxPriceSlider.max;
            minPriceSlider.value = minPriceSlider.min;
            maxPriceSlider.value = maxPriceSlider.max;
            // Cập nhật giá trị của các thanh trượt khi người dùng thay đổi giá trị trong các ô nhập liệu
            minPriceInput.addEventListener('input', updateSlidersFromInputs);
            maxPriceInput.addEventListener('input', updateSlidersFromInputs);
            // Cập nhật giá trị của các ô nhập liệu khi người dùng kéo các thanh trượt
            minPriceSlider.addEventListener('input', updateInputsFromSliders);
            maxPriceSlider.addEventListener('input', updateInputsFromSliders);
            function updateSlidersFromInputs() {
            let minPrice = parseFloat(minPriceInput.value) || 0;
            let maxPrice = parseFloat(maxPriceInput.value) || 0;
            if (minPrice > maxPrice) {
            [minPrice, maxPrice] = [maxPrice, minPrice];
            }
    
            minPriceSlider.value = minPrice;
            maxPriceSlider.value = maxPrice;
            }
    
            function updateInputsFromSliders() {
            let minPrice = parseFloat(minPriceSlider.value) || 0;
            let maxPrice = parseFloat(maxPriceSlider.value) || 0;
            if (minPrice > maxPrice) {
            minPriceSlider.value = maxPrice;
            minPrice = maxPrice;
            }
    
            minPriceInput.value = minPrice;
            maxPriceInput.value = maxPrice;
            }
        </script>
    
        <script>
            const minPriceInput = document.getElementById('min-price');
            const maxPriceInput = document.getElementById('max-price');
            const minPriceSlider = document.getElementById('min-price-slider');
            const maxPriceSlider = document.getElementById('max-price-slider');
            function syncMinPrice() {
            let minValue = parseInt(minPriceSlider.value);
            let maxValue = parseInt(maxPriceSlider.value);
            if (minValue > maxValue) {
            minValue = maxValue;
            minPriceSlider.value = minValue;
            }
    
            minPriceInput.value = minValue;
            maxPriceSlider.min = minValue;
            }
    
            function syncMaxPrice() {
            let minValue = parseInt(minPriceSlider.value);
            let maxValue = parseInt(maxPriceSlider.value);
            if (maxValue < minValue) {
            maxValue = minValue;
            maxPriceSlider.value = maxValue;
            }
    
            maxPriceInput.value = maxValue;
            minPriceSlider.max = maxValue;
            }
    
            function updateMinSlider() {
            let minValue = parseInt(minPriceInput.value);
            let maxValue = parseInt(maxPriceInput.value);
            if (minValue > maxValue) {
            minValue = maxValue;
            minPriceInput.value = minValue;
            }
    
            minPriceSlider.value = minValue;
            maxPriceSlider.min = minValue;
            }
    
            function updateMaxSlider() {
            let minValue = parseInt(minPriceInput.value);
            let maxValue = parseInt(maxPriceInput.value);
            if (maxValue < minValue) {
            maxValue = minValue;
            maxPriceInput.value = maxValue;
            }
    
            maxPriceSlider.value = maxValue;
            minPriceSlider.max = maxValue;
            }
    
            minPriceSlider.addEventListener('input', syncMinPrice);
            maxPriceSlider.addEventListener('input', syncMaxPrice);
            minPriceInput.addEventListener('input', updateMinSlider);
            maxPriceInput.addEventListener('input', updateMaxSlider);
        </script>-->

    <script>
        const minPriceInput = document.getElementById('min-price');
        const maxPriceInput = document.getElementById('max-price');
        const minPriceSlider = document.getElementById('min-price-slider');
        const maxPriceSlider = document.getElementById('max-price-slider');

        // Ensure initial synchronization
        minPriceSlider.value = minPriceInput.value || minPriceSlider.min;
        maxPriceSlider.value = maxPriceInput.value || maxPriceSlider.max;

        minPriceInput.addEventListener('input', updateSlidersFromInputs);
        maxPriceInput.addEventListener('input', updateSlidersFromInputs);
        minPriceSlider.addEventListener('input', updateInputsFromSliders);
        maxPriceSlider.addEventListener('input', updateInputsFromSliders);

        function updateSlidersFromInputs() {
            let minPrice = parseFloat(minPriceInput.value) || 0;
            let maxPrice = parseFloat(maxPriceInput.value) || 0;
            if (minPrice > maxPrice) {
                [minPrice, maxPrice] = [maxPrice, minPrice];
            }

            minPriceSlider.value = minPrice;
            maxPriceSlider.value = maxPrice;
        }

        function updateInputsFromSliders() {
            let minPrice = parseFloat(minPriceSlider.value) || 0;
            let maxPrice = parseFloat(maxPriceSlider.value) || 0;
            if (minPrice > maxPrice) {
                minPriceSlider.value = maxPrice;
                minPrice = maxPrice;
            }

            minPriceInput.value = minPrice;
            maxPriceInput.value = maxPrice;
        }

    </script>

    <script>
        document.querySelectorAll('input[name="rating"]').forEach((checkbox) => {
            checkbox.addEventListener('change', function () {
                if (this.checked) {
                    document.querySelectorAll('input[name="rating"]').forEach((cb) => {
                        if (cb !== this)
                            cb.checked = false;
                    });
                }
            });
        });
    </script>

    <script>
        function handleRatingChange(changedCheckbox) {
            const checkboxes = document.querySelectorAll('input[name="rating"]');
            checkboxes.forEach(checkbox => {
                if (checkbox !== changedCheckbox) {
                    checkbox.checked = false;
                }
            });
            document.getElementById('filter-form').submit();
        }
    </script>

    <script>
        function submitForm() {
            document.getElementById('filter-form').submit();
        }
        // Function to handle amenities checkbox change
        function handleAmenitiesChange() {
            const checkboxes = document.querySelectorAll('input[name="amenities"]');
            let selectedAmenities = [];
            checkboxes.forEach(cb => {
                if (cb.checked) {
                    selectedAmenities.push(cb.value);
                }
            });
            sessionStorage.setItem('selectedAmenities', JSON.stringify(selectedAmenities));
            submitForm(); // Submit form after selecting amenities
        }

        // On page load, restore amenities checkbox states from sessionStorage
        document.addEventListener('DOMContentLoaded', function () {
            let savedAmenities = sessionStorage.getItem('selectedAmenities');
            if (savedAmenities) {
                savedAmenities = JSON.parse(savedAmenities);
                savedAmenities.forEach(amenity => {
                    let checkbox = document.querySelector('input[name="amenities"][value="' + amenity + '"]');
                    if (checkbox) {
                        checkbox.checked = true;
                    }
                });
            }

            // Clear sessionStorage after restoring data
            sessionStorage.removeItem('selectedAmenities');
        });</script>





    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>