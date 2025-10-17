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
<link rel="icon" href="${pageContext.request.contextPath}/images/codelensnew-logo.svg">
<meta charset="UTF-8">
<title>Code Lens New</title>
</head>
<body>
    <!-- Header -->
    <jsp:include page="/views/components/user/header.jsp" />

    <div class="main-content">

        <jsp:include page="/views/components/user/content.jsp" />


        <jsp:include page="/views/components/user/aside.jsp" />
    </div>

    <jsp:include page="/views/components/user/footer.jsp" />
</body>
</html>
