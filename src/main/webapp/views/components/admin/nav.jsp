<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="admin-nav">
  <div class="admin-container">
    <ul>
      <li><a href="${pageContext.request.contextPath}/AdminServlet?page=dashboard">Dashboard</a></li>
      <li><a href="${pageContext.request.contextPath}/AdminServlet?page=news">Tin tức</a></li>
      <li><a href="${pageContext.request.contextPath}/AdminServlet?page=categories">Danh mục</a></li>
      <li><a href="${pageContext.request.contextPath}/AdminServlet?page=users">Người dùng</a></li>
      <li><a href="${pageContext.request.contextPath}/AdminServlet?page=reports">Báo cáo</a></li>
      <li><a href="${pageContext.request.contextPath}/AdminServlet?page=account">Quản lý tài khoản</a></li>
      <li><a href="${pageContext.request.contextPath}/AdminServlet?page=newsletter">Newsletter</a></li>
    </ul>
  </div>
  </nav>
