<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="admin-nav">
  <div class="admin-container">
    <ul>
      <li><a href="${pageContext.request.contextPath}/AdminServlet?page=dashboard">Dashboard</a></li>
      <li><a href="${pageContext.request.contextPath}/AdminServlet?page=post">Đăng bài</a></li>
      <li><a href="${pageContext.request.contextPath}/AdminServlet?page=category-management">Danh mục</a></li>
      <li><a href="${pageContext.request.contextPath}/AdminServlet?page=user-management">Người dùng</a></li>
      <li><a href="${pageContext.request.contextPath}/AdminServlet?page=newsletter-management">Newsletter</a></li>
      <li><a href="${pageContext.request.contextPath}/AdminServlet?page=newsletter">Đăng xuất</a></li>
    </ul>
  </div>
  </nav>
