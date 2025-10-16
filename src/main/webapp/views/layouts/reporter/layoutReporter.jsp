<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reporter Panel - CodeLens News</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainAdmin.css">
<link rel="icon" href="${pageContext.request.contextPath}/images/codelensnew-logo.svg">
<script src="https://kit.fontawesome.com/f4e3fc99b3.js" crossorigin="anonymous"></script>
</head>
<body>
  <div class="admin-wrapper">
    <jsp:include page="/views/components/reporter/header.jsp" />
    <jsp:include page="/views/components/reporter/nav.jsp" />
    <div class="admin-container admin-content">
      <c:set var="pageParam" value="${empty page ? 'dashboard' : page}" />
      <jsp:include page="/views/pages/reporter/${pageParam}.jsp" />
    </div>
    <jsp:include page="/views/components/reporter/footer.jsp" />
  </div>
</body>
</html>
