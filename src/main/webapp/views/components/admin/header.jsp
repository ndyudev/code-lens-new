<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/headerUser.css">
<!-- Font Google -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

<!-- Topbar -->
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

<!-- Navbar -->
<header class="navbar">
  <div class="container">
    <!-- Logo trái -->
    <div class="logo">
      <img src="${pageContext.request.contextPath}/images/codelensnew-logo-chu-ngang.svg" alt="Logo">
    </div>

    <!-- Menu giữa -->
    <ul class="menu">
      <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=home">Trang chủ</a></li>
      <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=technology">Tin tức</a></li>
      <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=technology">Công nghệ</a></li>
      <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=programming">Lập trình</a></li>
      <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=ai">AI & ML</a></li>
      <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=blockchain">Blockchain</a></li>
    </ul>

    <!-- Tìm kiếm phải -->
    <div class="search-box">
      <input type="text" placeholder="Tìm kiếm...">
      <button><i class="fas fa-search"></i></button>
    </div>
  </div>
</header>
