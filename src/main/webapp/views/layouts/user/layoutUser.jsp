<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/f4e3fc99b3.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainUser.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/asideUser.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/news-detail.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/navigation.css">
<link rel="icon" href="${pageContext.request.contextPath}/images/codelensnew-logo.svg">
<meta charset="UTF-8">
<title>Code Lens New</title>
</head>
<body>
    <!-- Header -->
    <jsp:include page="/views/components/user/header.jsp" />

    <!-- Newsletter Message -->
    <c:if test="${not empty newsletterMessage}">
        <div class="newsletter-message" style="background: #d4edda; color: #155724; padding: 10px; text-align: center; border: 1px solid #c3e6cb; margin: 10px 0;">
            ${newsletterMessage}
        </div>
    </c:if>

    <!-- Navigation cho Admin/Reporter đã đăng nhập -->
    <c:if test="${not empty sessionScope.user}">
        <c:choose>
            <c:when test="${sessionScope.currentUserRole == 'admin'}">
                <jsp:include page="/views/components/admin/nav.jsp" />
            </c:when>
            <c:when test="${sessionScope.currentUserRole == 'reporter'}">
                <jsp:include page="/views/components/reporter/nav.jsp" />
            </c:when>
        </c:choose>
    </c:if>

    <div class="main-content">

        <jsp:include page="/views/components/user/content.jsp" />


        <jsp:include page="/views/components/user/aside.jsp" />
    </div>

    <jsp:include page="/views/components/user/footer.jsp" />
</body>
</html>
