package com.codelensnew.controller.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet({ 
    "/logout", 
    "/logout/confirm"
})
public class LogoutServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set encoding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String path = request.getServletPath();
        
        // Xử lý logout
        if (path.contains("confirm") || path.contains("logout")) {
            // 1. Xóa session hiện tại
            HttpSession session = request.getSession(false); // false = không tạo mới nếu chưa có
            if (session != null) {
                session.invalidate(); // Hủy session
            }

            // 2. Xóa cookie 'user' nếu có (ghi nhớ đăng nhập)
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if ("user".equals(cookie.getName())) {
                        cookie.setMaxAge(0); // Đặt thời gian hủy cookie
                        cookie.setPath("/"); // Đảm bảo đúng path để ghi đè cookie
                        response.addCookie(cookie);
                        break;
                    }
                }
            }

            // 3. Chuyển về trang login
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
