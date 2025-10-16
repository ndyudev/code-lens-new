<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="admin-nav">
  <div class="admin-container">
    <c:url value="/Reporter" var="reporter" />
    <ul>
      <li><a href="${reporter}?page=dashboard">Dashboard</a></li>
      <li><a href="${reporter}?page=post">Đăng bài</a></li>
      <li><a href="${reporter}?page=change-password">Thay đổi mật khẩu</a></li>
      <li><a href="${reporter}?page=logout">Đăng xuất</a></li>
    </ul>
  </div>
</nav>

