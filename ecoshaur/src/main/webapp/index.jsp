<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>     

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>ECOSHAUR</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800" rel="stylesheet">
  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <!-- Template Main CSS File -->
  <link href="assets/libs/css/style2.css" rel="stylesheet">
  <!-- =======================================================
  * Template Name: Imperial - v3.0.0
  * Template URL: https://bootstrapmade.com/imperial-free-onepage-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body  oncontextmenu="return false" ondragstart="return false" onselectstart="return false">

  <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div class="hero-container">
      <div class="wow fadeIn">
        <h1>Welcome to ECOSHAUR</h1>
        <h2>우리는 <span class="typed" data-typed-items="사업자가 될 수 있습니다., 대여자가 될 수 있습니다., 렌탈러입니다."></span></h2>
        <div class="actions">
          <a href="Category.do?nowpage=1&col=&search=" class="btn-get-started">ECOSHAUR 시작하기</a>
        </div>
      </div>
    </div>
  </section>
  <!-- End Hero -->

  <!-- ======= Header ======= -->
  <header id="header">
    <div class="container d-flex align-items-center">

      <a href="index.do" class="logo mr-auto">ECOSHAUR</a>
      <!-- Uncomment below if you prefer to use a text logo -->
      <!-- <h1 class="logo mr-auto"><a href="index.html">Imperial</a></h1> -->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="index.do">Home</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#services">Services</a></li>
          <li><a href="#portfolio">RentalList</a></li>
          <li class="drop-down"><a href="">MyPage</a>
            <ul>
              	<c:choose>
					<c:when  test="${(grade eq 'U') || (grade eq 'S') || (grade eq 'P') || (grade eq 'M')}">
              			<li><a href="mypage.do">MyPage</a></li>
              		</c:when>
              		<c:otherwise>
                          <li><a href="login.do">SignIn/SignOut</a></li>
              		</c:otherwise>
              	</c:choose>
              	<c:choose>
					<c:when  test="${grade eq 'M'}">
              			<li><a href="admin/index.do">Admin</a></li>
              		</c:when>
              	</c:choose>
            </ul>
          </li>
        </ul>
      </nav>
      <!-- .nav-menu -->

    </div>
  </header>
  <!-- End Header -->

  <main id="main">

    <!-- ======= About Section ======= -->
    <section id="about">
      <div class="container wow fadeInUp">
        <div class="row">
          <div class="col-md-12">
            <h3 class="section-title">About Us</h3>
            <div class="section-title-divider"></div>
            <p class="section-description"></p>
          </div>
        </div>
      </div>
      <br><br>
      <div class="container about-container wow fadeInUp">
        <div class="row">
          <div class="col-lg-6 about-img">
            <img src="assets/images/logo/ㄹㅇ공룡.png" alt="">
          </div>
          <div class="col-md-6 about-content">
            <h2 class="about-title">ECOSHAUR에 오신 것을 환영합니다!</h2>
            <p class="about-text">
             	ECOSHAUR는 ECOnomy + SHare + dinosAUR의 합성어로 C2C방식의 전자기기 대여 플랫폼입니다.
            </p>
            <p class="about-text">
            	사고는 싶은데 비싼 가격에 매번 돌아서야만 하셨나요? 창고에 쌓여만 가는 애물단지들을 어떻게 처분할지 고민되셨나요? 그렇다면 ECOSHAUR를 이용해보세요. 
            </p>
            <p class="about-text">
            	번거로운 단계없이 편리하게 제품을 등록하고 다양한 카테고리로 원하는 제품을 찾을 수 있습니다.
            	사이트 이용자의 자유도를 위해 관리자의 개입을 최소화하고 있으며 커뮤니티를 통해 원활한 의사소통을 할 수 있습니다.
            </p>
          </div>
        </div>
      </div>
    </section>
    <!-- End About Section -->

    <!-- ======= Services Section ======= -->
    <section id="services">
      <div class="container wow fadeInUp">
        <div class="row">
          <div class="col-md-12">
            <h3 class="section-title">Our Services</h3>
            <div class="section-title-divider"></div>
            <p class="section-description"></p>
          </div>
        </div>

        <div class="row">
          <div class="col-md-4 service-item">
            <div class="service-icon"><i class="fa fa-bar-chart"></i></div>
            <h4 class="service-title"><a href="Category.do?nowpage=1&col=&search=">거래의 편리성</a></h4>
            <p class="service-description">다양한 카테고리와 쉬운 상품 게시를 통해 원하는 상품을 제공 및 대여할 수 있습니다.</p>
          </div>
          <div class="col-md-4 service-item">
            <div class="service-icon"><i class="fa fa-shopping-bag"></i></div>
            <h4 class="service-title"><a href="Point.do">투명한 신뢰성</a></h4>
            <p class="service-description">거래가 성공적으로 성사되면 쌓이는 포인트와 좋아요 순위로 회원들의 신뢰도를 확인할 수 있습니다.</p>
          </div>
          <div class="col-md-4 service-item">
            <div class="service-icon"><i class="fa fa-paper-plane"></i></div>
            <h4 class="service-title"><a href="Board.do?nowpage=1&col=&search=">사람과 사람 간의 연결성</a></h4>
            <p class="service-description">커뮤니티 공간을 통해 사용자들과의 원활한 소통을 할 수 있습니다. </p>
          </div>
        </div>
      </div>
    </section>
    <!-- End Services Section -->


    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio">
      <div class="container wow fadeInUp">
        <div class="row">
          <div class="col-md-12">
            <h3 class="section-title">Rental List</h3>
            <div class="section-title-divider"></div>
            <p class="section-description"></p>
          </div>
        </div>

        <div class="row portfolio-container">
        <c:forEach var="dto" items="${mainlist}">
          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <img src="category/storage/${dto.thmb_name}" class="img-fluid" width="300" height="300">
            <div class="portfolio-info">
              <a href="RentalRead.do?product_no=${dto.product_no}">
	              <h4>${dto.product_name}</h4>
	              <p>${dto.price_daily}원</p>
              </a>
              <a href="category/storage/${dto.thmb_name}" data-gall="portfolioGallery" class="venobox preview-link" title="App 1"><i class="fa fa-plus"></i></a>
              <a href="RentalRead.do?product_no=${dto.product_no}" class="details-link" title="More Details"><i class="fa fa-link fa-flip-horizontal"></i></a>
            </div>
          </div>
        </c:forEach>
        </div>
      </div>
    </section>
    <!-- End Portfolio Section -->
  </main>
  <!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="copyright">
          	개발자 : 김윤호, 송기환, 김유진, 황정하, 안재원, 최지호
          </div>
          <div class="credits">
            <!--
            All the links in the footer should remain intact.
            You can delete the links only if you purchased the pro version.
            Licensing information: https://bootstrapmade.com/license/
            Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Imperial
          -->
          	&copy; Copyright <strong>Imperial Theme</strong>. All Rights Reserved<br>
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/jquery/jquery.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/jquery-sticky/jquery.sticky.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="assets/vendor/venobox/venobox.min.js"></script>
  <script src="assets/vendor/typed.js/typed.min.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <!-- Template Main JS File -->
  <script src="assets/libs/js/main2.js"></script>

</body>
</html>