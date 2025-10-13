<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="admin-nav">
  <div class="admin-container">
  	<c:url value="/ReporterServlet" var="reporter-url"/>
    <ul>
      <li><a href="${pageContext.request.contextPath}/ReporterServlet?page=dashboard">Dashboard</a></li>
      <li><a href="${pageContext.request.contextPath}/ReporterServlet?page=news">Đăng bài</a></li>
      <li><a href="${pageContext.request.contextPath}/ReporterServlet?page=news">Đăng xuất</a></li>
    </ul>
  </div>
  </nav>
