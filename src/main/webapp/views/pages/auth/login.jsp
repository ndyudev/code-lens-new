<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - CodeLens News</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/codelensnew-logo.svg" type="image/svg+xml">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth.css">
</head>
<body>
    <div class="auth-container">
        <div class="auth-card">
            <div class="auth-header">
                <img src="${pageContext.request.contextPath}/images/codelensnew-logo-chu-ngang.svg" alt="CodeLens News" class="auth-logo">
                <h1>Đăng nhập</h1>
                <p>Chào mừng bạn quay trở lại!</p>
            </div>

            <form class="auth-form" action="login" method="post">
                <div class="form-group">
                    <label for="username">Tên đăng nhập</label>
                    <input type="text" id="username" name="username" placeholder="Nhập tên đăng nhập" required>
                </div>

                <div class="form-group">
                    <label for="password">Mật khẩu</label>
                    <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required>
                </div>

                <div class="form-options">
                    <label class="checkbox-label">
                        <input type="checkbox" name="remember">
                        <span class="checkmark"></span>
                        Ghi nhớ đăng nhập
                    </label>
                    <a href="#" class="forgot-link">Quên mật khẩu?</a>
                </div>

                <button type="submit" class="auth-btn">Đăng nhập</button>
            </form>

            <div class="auth-footer">
                <p>Chưa có tài khoản? <a href="#">Đăng ký ngay</a></p>
                <div class="demo-accounts">
                    <h3>Tài khoản demo:</h3>
                    <div class="demo-item">
                        <strong>Admin:</strong> admin / admin123
                    </div>
                    <div class="demo-item">
                        <strong>Reporter:</strong> reporter1 / reporter123
                    </div>
                    <div class="demo-item">
                        <strong>User:</strong> user1 / user123
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>