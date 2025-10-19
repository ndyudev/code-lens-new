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
      <c:choose>
        <c:when test="${not empty featuredCategories}">
          <c:forEach var="category" items="${featuredCategories}">
            <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=category&categoryId=${category.id}">${category.name}</a></li>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <li><a href="#">Công nghệ</a></li>
          <li><a href="#">Khoa học</a></li>
          <li><a href="#">Y tế</a></li>
          <li><a href="#">Giáo dục</a></li>
        </c:otherwise>
      </c:choose>
    </ul>

    <!-- Được xem nhiều nhất -->
    <h3 class="aside-user__title">Được xem nhiều nhất</h3>
    <ul class="aside-user__list">
      <c:choose>
        <c:when test="${not empty mostViewedNews}">
          <c:forEach var="news" items="${mostViewedNews}">
            <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=${news.id}">${news.title.length() > 30 ? news.title.substring(0, 30).concat('...') : news.title}</a></li>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <li><a href="#">AI bùng nổ toàn cầu</a></li>
          <li><a href="#">Phát minh y tế thông minh</a></li>
          <li><a href="#">Công nghệ 5G bùng nổ</a></li>
          <li><a href="#">Blockchain thay đổi tương lai</a></li>
        </c:otherwise>
      </c:choose>
    </ul>

    <!-- Bản tin mới nhất -->
    <h3 class="aside-user__title">Bản tin mới nhất</h3>
    <ul class="aside-user__list">
      <c:choose>
        <c:when test="${not empty latestNews}">
          <c:forEach var="news" items="${latestNews}">
            <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=${news.id}">${news.title.length() > 30 ? news.title.substring(0, 30).concat('...') : news.title}</a></li>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <li><a href="#">🔥 AI bùng nổ toàn cầu</a></li>
          <li><a href="#">🧬 Phát minh y tế thông minh</a></li>
          <li><a href="#">⚡ Công nghệ 5G bùng nổ</a></li>
          <li><a href="#">🔗 Blockchain thay đổi tương lai</a></li>
        </c:otherwise>
      </c:choose>
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
