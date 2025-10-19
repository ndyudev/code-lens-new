<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/change-password.css" />
<script src="https://kit.fontawesome.com/f4e3fc99b3.js" crossorigin="anonymous"></script>

<div class="cp-container">
    <header class="cp-header">
      <h1><i class="fa-solid fa-lock"></i> Đổi mật khẩu</h1>
      <p>Vui lòng nhập mật khẩu cũ và đặt mật khẩu mới để bảo vệ tài khoản 🔐</p>
    </header>

    <section class="cp-form">
      <h2><i class="fa-solid fa-key"></i> Nhập thông tin</h2>
      <!-- Hiển thị thông báo -->
      <c:if test="${not empty message}">
          <div class="cp-alert ${message.startsWith('✅') ? 'success' : 'error'}">
              <i class="fa-solid ${message.startsWith('✅') ? 'fa-check-circle' : 'fa-exclamation-circle'}"></i>
              ${message}
          </div>
      </c:if>

      <form method="post" action="${pageContext.request.contextPath}/reporter/change-password">
        <div class="cp-grid">
          <div class="cp-group">
            <label><i class="fa-solid fa-key"></i> Mật khẩu cũ</label>
            <input type="password" name="oldPassword" placeholder="Nhập mật khẩu cũ" required />
          </div>
          <div class="cp-group">
            <label><i class="fa-solid fa-key"></i> Mật khẩu mới</label>
            <input type="password" name="newPassword" placeholder="Nhập mật khẩu mới" required />
          </div>
          <div class="cp-group">
            <label><i class="fa-solid fa-check"></i> Xác nhận mật khẩu mới</label>
            <input type="password" name="confirmPassword" placeholder="Nhập lại mật khẩu mới" required />
          </div>
        </div>

        <div class="cp-actions">
          <button class="btn update" type="submit"><i class="fa-solid fa-arrow-right"></i> Đổi mật khẩu</button>
          <button class="btn clear" type="reset"><i class="fa-solid fa-eraser"></i> Xóa</button>
        </div>
      </form>
    </section>
</div>
