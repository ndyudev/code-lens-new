<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- ASIDE -->
<div class="aside-user">
  <div class="aside-user__container">

    <!-- Search -->
    <div class="aside-user__search-box">
      <input type="text" class="aside-user__search-input" placeholder="Tìm kiếm...">
      <button class="aside-user__search-btn">
        <i class="fas fa-search"></i>
      </button>
    </div>

    <!-- Chuyên mục nổi bật -->
    <h3 class="aside-user__title">Chuyên Mục Nổi Bật</h3>
    <ul class="aside-user__list">
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=technology">Công nghệ</a></li>
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=programming">Lập trình</a></li>
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=ai">AI & Machine Learning</a></li>
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=blockchain">Blockchain</a></li>
    </ul>

    <!-- Được xem nhiều nhất -->
    <h3 class="aside-user__title">Được xem nhiều nhất</h3>
    <ul class="aside-user__list">
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=1">AI bùng nổ toàn cầu</a></li>
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=2">Phát minh y tế thông minh</a></li>
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=3">Công nghệ 5G bùng nổ</a></li>
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=4">Blockchain thay đổi tương lai</a></li>
    </ul>

    <!-- Bản tin mới nhất -->
    <h3 class="aside-user__title">Bản tin mới nhất</h3>
    <ul class="aside-user__list">
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=1">🔥 AI bùng nổ toàn cầu</a></li>
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=2">🧬 Phát minh y tế thông minh</a></li>
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=3">⚡ Công nghệ 5G bùng nổ</a></li>
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=4">🔗 Blockchain thay đổi tương lai</a></li>
    </ul>

    <!-- Bài viết gần đây -->
    <h3 class="aside-user__title">Bài Viết Gần Đây</h3>
    <ul class="aside-user__list">
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=1">AI bùng nổ toàn cầu</a></li>
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=2">Phát minh y tế thông minh</a></li>
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=3">Công nghệ 5G bùng nổ</a></li>
      <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=4">Blockchain thay đổi tương lai</a></li>
    </ul>
  </div>
</div>
