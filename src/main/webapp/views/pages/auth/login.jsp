<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - CodeLens News</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/codelensnew-logo.svg" type="image/svg+xml">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainUser.css">
    <script src="https://kit.fontawesome.com/f4e3fc99b3.js" crossorigin="anonymous"></script>
</head>
<body>
    <!-- Header -->
    <jsp:include page="/views/components/user/header.jsp"></jsp:include>

    <!-- Main Content -->
    <main class="auth-container">
        <div class="auth-card">
            <h1 class="auth-title">Đăng nhập</h1>
            <form class="auth-form" action="login" method="post">
                <div class="form-group">
                    <label for="username">Tên đăng nhập</label>
                    <input type="text" id="username" name="username" placeholder="Nhập tên đăng nhập" required>
                </div>

                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required>
                </div>

                <button type="submit" class="auth-btn">Đăng nhập</button>
            </form>
        </div>
    </main>

    <!-- Footer -->
    <jsp:include page="/views/components/user/footer.jsp"></jsp:include>
</body>
</html>
