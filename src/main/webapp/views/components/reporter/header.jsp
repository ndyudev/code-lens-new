<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
      <li class="dropdown">
        <a href="#" class="dropdown-toggle">Danh mục <i class="fas fa-chevron-down"></i></a>
        <ul class="dropdown-menu">
          <c:choose>
            <c:when test="${not empty categories}">
              <c:forEach var="category" items="${categories}">
                <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=category&categoryId=${category.id}">${category.name}</a></li>
              </c:forEach>
            </c:when>
            <c:otherwise>
              <li><a href="${pageContext.request.contextPath}/CodeLensNew">Trang chủ</a></li>
            </c:otherwise>
          </c:choose>
        </ul>
      </li>
      <li><a href="#about">Giới thiệu</a></li>
      <li><a href="#contact">Liên hệ</a></li>
    </ul>

    <!-- Login/User Info -->
    <c:choose>
      <c:when test="${not empty sessionScope.user}">
        <span class="user-name"><i class="fas fa-user-circle"></i> ${sessionScope.user.id}</span>
      </c:when>
      <c:otherwise>
        <a href="${pageContext.request.contextPath}/login" class="login-btn"><i class="fas fa-user-circle"></i> Đăng nhập</a>
      </c:otherwise>
    </c:choose>
  </div>
</header>
