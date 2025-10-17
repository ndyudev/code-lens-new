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
      <a href="${pageContext.request.contextPath}/CodeLensNew">
        <img src="${pageContext.request.contextPath}/images/codelensnew-logo-chu-ngang.svg" alt="Logo">
      </a>
    </div>

    <!-- Menu chính -->
    <ul class="menu">
      <li><a href="${pageContext.request.contextPath}/CodeLensNew">Trang chủ</a></li>
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=technology">Công nghệ</a></li>
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=programming">Lập trình</a></li>
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=ai">AI & ML</a></li>

      <!-- 🔽 Menu thả xuống -->
      <li class="dropdown">
        <a href="#" class="dropdown-toggle">Danh mục <i class="fas fa-chevron-down"></i></a>
        <ul class="dropdown-menu">
          <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=technology">Công nghệ</a></li>
          <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=programming">Lập trình</a></li>
          <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=ai">AI & Machine Learning</a></li>
          <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=blockchain">Blockchain</a></li>
          <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=mobile">Mobile</a></li>
          <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=startup">Startup</a></li>
          <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=security">Bảo mật</a></li>
        </ul>
      </li>
    </ul>

    <!-- Login -->
    <a href="${pageContext.request.contextPath}/CodeLensNew?tab=login" class="login-btn"><i class="fas fa-user-circle"></i> Đăng nhập</a>
  </div>
</header>
