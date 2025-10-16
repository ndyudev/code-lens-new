<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/headerUser.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/f4e3fc99b3.js" crossorigin="anonymous"></script>

<!-- 🔹 Topbar -->
<div class="topbar">
  <div class="container">
    <div class="left">
      <span><i class="fas fa-phone"></i> 0787.544.232</span>
      <span><i class="fas fa-map-marker-alt"></i> TP. Hồ Chí Minh</span>
    </div>
    <div class="right">
      <a href="#"><i class="fab fa-facebook-f"></i></a>
      <a href="#"><i class="fab fa-tiktok"></i></a>
      <a href="#"><i class="fab fa-youtube"></i></a>
    </div>
  </div>
</div>

<!-- 🔹 Navbar -->
<header class="navbar">
  <div class="container">
    <!-- Logo -->
    <div class="logo">
      <img src="${pageContext.request.contextPath}/images/codelensnew-logo-chu-ngang.svg" alt="Logo">
    </div>

    <!-- Menu chính -->
    <ul class="menu">
      <li><a href="#">Trang chủ</a></li>
      <li><a href="#">C</a></li>
      <li><a href="#">Blog</a></li>

      <!-- 🔽 Menu thả xuống -->
      <li class="dropdown">
        <a href="#" class="dropdown-toggle">Danh mục <i class="fas fa-chevron-down"></i></a>
        <ul class="dropdown-menu">
          <li><a href="#">Lập trình Back-End Java</a></li>
          <li><a href="#">Lập trình Back-End NodeJS</a></li>
          <li><a href="#">Lập trình Front-End</a></li>
          <li><a href="#">Lập trình C++ Cơ bản tới Nâng cao</a></li>
          <li><a href="#">Lập trình C++ Nâng cao</a></li>
          <li><a href="#">Cấu trúc dữ liệu và giải thuật</a></li>
          <li><a href="#">Lập trình C</a></li>
          <li><a href="#">Lập trình Java và SQL</a></li>
          <li><a href="#">Lập trình Python</a></li>
        </ul>
      </li>
    </ul>

    <!-- Login -->
    <a href="${pageContext.request.contextPath}/CodeLensNew?tab=login" class="login-btn"><i class="fas fa-user-circle"></i> Đăng nhập</a>
  </div>
</header>
