<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/asideUser.css">
<!-- Font Google -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
<!-- Aside -->
<div class="aside">
  <div class="container">
    <h3>Chuyên Mục Nổi Bật</h3>
    <ul class="category-list">
      <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=home">New Feed</a></li>
      <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=technology">Technical</a></li>
      <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=programming">CTDL & Giải Thuật</a></li>
      <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=technology">Công nghệ</a></li>
    </ul>

    <h3>Được xem nhiều nhất</h3>
    <ul class="recent-posts">
	   <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=programming">Top 5 năm ngôn ngữ lập trình 2025</a></li>
	   <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=programming">Lộ trình trở thành full stack</a></li>
	   <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=ai">Ứng dụng AI vào công việc</a></li>
	   <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=technology">Open AI tung ra model mới</a></li>
    </ul>
    <h3>Bản tin mới nhất</h3>
    <ul class="recent-posts">
	   <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=programming">Top 5 năm ngôn ngữ lập trình 2025</a></li>
	   <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=programming">Lộ trình trở thành full stack</a></li>
	   <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=ai">Ứng dụng AI vào công việc</a></li>
	   <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=technology">Open AI tung ra model mới</a></li>
    </ul>
    <h3>Bài Viết Gần Đây</h3>
    <ul class="recent-posts">
	   <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=programming">Top 5 năm ngôn ngữ lập trình 2025</a></li>
	   <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=programming">Lộ trình trở thành full stack</a></li>
	   <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=ai">Ứng dụng AI vào công việc</a></li>
	   <li><a href="${pageContext.request.contextPath}/views/layouts/user/layoutUser.jsp?tab=technology">Open AI tung ra model mới</a></li>
    </ul>
  </div>
</div>