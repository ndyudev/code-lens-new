<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel - CodeLens News</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/variables.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainAdmin.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/navigation.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/news-management.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user-management.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/category-management.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/newsletter-management.css">
<link rel="icon" href="${pageContext.request.contextPath}/images/codelensnew-logo.svg">
<script src="https://kit.fontawesome.com/f4e3fc99b3.js" crossorigin="anonymous"></script>
</head>
<body>
  <div class="admin-wrapper">
    <jsp:include page="/views/components/admin/header.jsp" />
    <jsp:include page="/views/components/admin/nav.jsp" />
    <div class="admin-container admin-content">
      <c:set var="pageParam" value="${empty page ? 'dashboard' : page}" />
      <jsp:include page="/views/pages/admin/${pageParam}.jsp" />
    </div>
    <jsp:include page="/views/components/admin/footer.jsp" />
  </div>
</body>
</html>
