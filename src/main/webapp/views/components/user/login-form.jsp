<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="login-container">
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

<style>
/* Login Form Styles */
.login-container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 50vh;
    padding: 20px;
    width: 100%;
    position: relative;
    z-index: 10;
}

.auth-card {
    background: white;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    padding: 40px;
    width: 100%;
    max-width: 450px;
    text-align: center;
    margin: 0 auto;
}

.auth-header {
    margin-bottom: 25px;
}

.auth-logo {
    width: 70px;
    height: 70px;
    margin-bottom: 15px;
}

.auth-header h1 {
    color: #2c3e50;
    font-size: 1.8em;
    margin-bottom: 8px;
    font-weight: 700;
}

.auth-header p {
    color: #7f8c8d;
    font-size: 1em;
    margin: 0;
}

.auth-form {
    text-align: left;
}

.form-group {
    margin-bottom: 18px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    color: #2c3e50;
    font-weight: 600;
}

.form-group input {
    width: 100%;
    padding: 12px 15px;
    border: 2px solid #ecf0f1;
    border-radius: 8px;
    font-size: 1em;
    transition: border-color 0.3s ease;
    box-sizing: border-box;
}

.form-group input:focus {
    outline: none;
    border-color: #3498db;
}

.form-options {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.checkbox-label {
    display: flex;
    align-items: center;
    gap: 8px;
    color: #7f8c8d;
    font-size: 0.9em;
    cursor: pointer;
}

.checkbox-label input[type="checkbox"] {
    width: auto;
    margin: 0;
}

.forgot-link {
    color: #3498db;
    text-decoration: none;
    font-size: 0.9em;
}

.forgot-link:hover {
    text-decoration: underline;
}

.auth-btn {
    width: 100%;
    padding: 12px;
    background-color: #3498db;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 1.1em;
    font-weight: 600;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.auth-btn:hover {
    background-color: #2980b9;
}

.auth-footer {
    margin-top: 20px;
    padding-top: 15px;
    border-top: 1px solid #ecf0f1;
}

.auth-footer p {
    color: #7f8c8d;
    font-size: 0.9em;
    margin: 0;
}

.auth-footer a {
    color: #3498db;
    text-decoration: none;
    font-weight: 600;
}

.auth-footer a:hover {
    text-decoration: underline;
}

/* Override layout for login page */
body.login-page .main-content {
    display: block !important;
}

body.login-page .aside-user {
    display: none !important;
}

body.login-page .content {
    width: 100% !important;
    max-width: none !important;
}

body.login-page .main-layout {
    width: 100% !important;
    max-width: none !important;
}

.login-container {
    width: 100% !important;
    max-width: none !important;
}

/* Responsive */
@media (max-width: 768px) {
    .login-container {
        min-height: 45vh;
        padding: 15px 10px;
    }
    
    .auth-card {
        padding: 30px 25px;
        max-width: 100%;
    }
}

@media (max-width: 480px) {
    .login-container {
        min-height: 40vh;
        padding: 10px 5px;
    }
    
    .auth-card {
        padding: 25px 15px;
        margin: 0 5px;
    }
    
    .auth-header h1 {
        font-size: 1.5em;
    }
    
    .auth-logo {
        width: 60px;
        height: 60px;
        margin-bottom: 10px;
    }
    
    .form-options {
        flex-direction: column;
        gap: 8px;
        align-items: flex-start;
    }
}
</style>
