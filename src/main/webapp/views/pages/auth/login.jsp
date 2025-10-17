<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập - CodeLens News</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/codelensnew-logo.svg" type="image/svg+xml">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mainUser.css">
    <style>
        /* CSS bổ sung để đẩy footer xuống mép dưới */
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }
        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }
        .auth-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }
        /* Đảm bảo footer luôn ở dưới cùng */
        footer {
            width: 100%;
            background-color: #f8f9fa; /* Có thể thay đổi theo style của footer.jsp */
        }
    </style>
    <script src="https://kit.fontawesome.com/f4e3fc99b3.js" crossorigin="anonymous"></script>
</head>
<body>
    <!-- Header -->
    <jsp:include page="/views/components/user/header.jsp"></jsp:include>

    <!-- Main Content -->
    <main>
        <div class="auth-container">
            <div class="auth-card">
                <div class="auth-header">
                    <img src="${pageContext.request.contextPath}/images/codelensnew-logo.svg" alt="CodeLens News Logo" class="auth-logo">
                    <h1>Đăng nhập</h1>
                    <p>Vui lòng nhập thông tin để tiếp tục</p>
                </div>
                <form class="auth-form" action="${pageContext.request.contextPath}/login" method="post">
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
                            <input type="checkbox" name="remember"> Nhớ mật khẩu
                        </label>
                        <a href="#" class="forgot-link">Quên mật khẩu?</a>
                    </div>
                    <button type="submit" class="auth-btn">Đăng nhập</button>
                </form>
                <div class="auth-footer">
                    <p>Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký ngay</a></p>
                </div>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <jsp:include page="/views/components/user/footer.jsp"></jsp:include>
</body>
</html>