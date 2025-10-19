<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="admin-nav">
  <div class="admin-container">
    <ul>
      <li><a href="${pageContext.request.contextPath}/AdminServlet?page=dashboard"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/news-management"><i class="fas fa-newspaper"></i> Quản lý tin tức</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/category"><i class="fas fa-folder"></i> Danh mục</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/user"><i class="fas fa-users"></i> Người dùng</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/newsletter"><i class="fas fa-envelope"></i> Newsletter</a></li>
      <li><a href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
    </ul>
  </div>
  </nav>
