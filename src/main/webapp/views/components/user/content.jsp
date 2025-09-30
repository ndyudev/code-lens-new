<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="tab" value="${empty param.tab ? 'home' : param.tab}" />
<div style="flex:1;">
  <jsp:include page="/views/pages/user/${tab}.jsp" />
</div>