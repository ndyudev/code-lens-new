<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/f4e3fc99b3.js" crossorigin="anonymous"></script>
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainUser.css">
<meta charset="UTF-8">
<title>Code Lens New</title>
</head>
<body>
  <!-- Gọi header -->
  <jsp:include page="/views/components/user/header.jsp"></jsp:include>
  
  <!-- Gọi content và aside -->
  <div class="main-content">
    <jsp:include page="/views/components/user/content.jsp"></jsp:include>
    <jsp:include page="/views/components/user/aside.jsp"></jsp:include>
  </div>
  
  <!-- Gọi footer -->
  <jsp:include page="/views/components/user/footer.jsp"></jsp:include>
</body>
</html>
