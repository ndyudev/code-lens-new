<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="news-feed">
  <h2>Bài Viết Mới Nhất</h2>

  <c:choose>
    <c:when test="${not empty newsList}">
      <c:forEach var="news" items="${newsList}">
        <div class="article">
          <a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=${news.id}">
            <div class="article-img">
              <c:choose>
                <c:when test="${not empty news.image}">
                  <img src="${pageContext.request.contextPath}/images/${news.image}" 
                       alt="${news.title}" 
                       onerror="this.src='${pageContext.request.contextPath}/images/new-img/CNghe_1.jpg'">
                </c:when>
                <c:otherwise>
                  <img src="${pageContext.request.contextPath}/images/new-img/CNghe_1.jpg" 
                       alt="${news.title}">
                </c:otherwise>
              </c:choose>
            </div>
            <div class="article-body">
              <h3 class="article-title">
                <c:choose>
                  <c:when test="${fn:length(news.title) > 60}">
                    ${fn:substring(news.title, 0, 60)}...
                  </c:when>
                  <c:otherwise>
                    ${news.title}
                  </c:otherwise>
                </c:choose>
              </h3>
              <p class="article-desc">
                <c:choose>
                  <c:when test="${fn:length(news.content) > 150}">
                    ${fn:substring(news.content, 0, 150)}...
                  </c:when>
                  <c:otherwise>
                    ${news.content}
                  </c:otherwise>
                </c:choose>
              </p>
              <div class="article-meta">
                <span><i class="fa-regular fa-calendar"></i> <fmt:formatDate value="${news.postedDate}" pattern="dd/MM/yyyy"/></span>
                <span><i class="fa-regular fa-eye"></i> ${news.viewCount} lượt xem</span>
                <span><i class="fa-regular fa-user"></i> ${news.author}</span>
                <c:forEach var="category" items="${categories}">
                  <c:if test="${category.id == news.categoryId}">
                    <span class="tag">#${category.name}</span>
                  </c:if>
                </c:forEach>
              </div>
            </div>
          </a>
        </div>
      </c:forEach>
    </c:when>
    <c:otherwise>
      <div class="no-news">
        <p><i class="fa-solid fa-newspaper"></i> Chưa có bài viết nào</p>
      </div>
    </c:otherwise>
  </c:choose>
</div>
