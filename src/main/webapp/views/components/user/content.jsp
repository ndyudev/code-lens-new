<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/news.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/news-detail.css">

<div class="content">
  <div class="container">
    <div class="main-layout">
      <c:choose>
        <c:when test="${not empty param.id}">
          <jsp:include page="/views/pages/user/news-detail.jsp" />
        </c:when>
        <c:when test="${param.tab == 'login'}">
          <script>
            document.body.classList.add('login-page');
          </script>
          <jsp:include page="/views/components/user/login-form.jsp" />
        </c:when>
        <c:when test="${param.tab == 'technology'}">
          <jsp:include page="/views/pages/user/technology.jsp" />
        </c:when>
        <c:when test="${param.tab == 'programming'}">
          <jsp:include page="/views/pages/user/programming.jsp" />
        </c:when>
        <c:when test="${param.tab == 'ai'}">
          <jsp:include page="/views/pages/user/ai.jsp" />
        </c:when>
        <c:when test="${param.tab == 'blockchain'}">
          <jsp:include page="/views/pages/user/blockchain.jsp" />
        </c:when>
        <c:when test="${param.tab == 'mobile'}">
          <jsp:include page="/views/pages/user/mobile.jsp" />
        </c:when>
        <c:when test="${param.tab == 'startup'}">
          <jsp:include page="/views/pages/user/startup.jsp" />
        </c:when>
        <c:when test="${param.tab == 'security'}">
          <jsp:include page="/views/pages/user/security.jsp" />
        </c:when>
        <c:otherwise>
          <jsp:include page="/views/components/user/news.jsp" />
        </c:otherwise>
      </c:choose>
    </div>
  </div>
</div>
