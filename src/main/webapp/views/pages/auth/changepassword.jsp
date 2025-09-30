<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Change Password</title>
	<!-- Link 1 file CSS chung -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainUser.css">
	<script src="https://kit.fontawesome.com/f4e3fc99b3.js" crossorigin="anonymous"></script>
</head>
<body>
	<!-- Header -->
	<jsp:include page="/views/components/user/header.jsp"></jsp:include>

	<!-- Nội dung chính -->
	<main class="main-container">
		<section class="content">
			<h2>Đổi mật khẩu</h2>
			<form class="change-password-form">
				<label>Mật khẩu cũ</label>
				<input type="password" placeholder="Nhập mật khẩu cũ">

				<label>Mật khẩu mới</label>
				<input type="password" placeholder="Nhập mật khẩu mới">

				<label>Xác nhận mật khẩu mới</label>
				<input type="password" placeholder="Nhập lại mật khẩu mới">

				<button type="submit">Đổi mật khẩu</button>
			</form>
		</section>
	</main>

	<!-- Footer -->
	<jsp:include page="/views/components/user/footer.jsp"></jsp:include>
</body>
</html>
