package com.codelensnew.controller.auth;

import com.codelensnew.dao.UserDAO;
import com.codelensnew.dao.impl.UserDAOImpl;
import com.codelensnew.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Base64;

@WebServlet({ 
    "/login", 
    "/login/authenticate",
    "/login/guest"
})
public class LoginServlet extends HttpServlet {
    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        this.userDAO = new UserDAOImpl();
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set encoding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String path = request.getServletPath();
        
        // Xử lý guest login
        if (path.contains("guest")) {
            response.sendRedirect(request.getContextPath() + "/CodeLensNew");
            return;
        }
        
        // Xử lý POST request (đăng nhập)
        if (path.contains("authenticate") && "POST".equals(request.getMethod())) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String remember = request.getParameter("remember");

            try {
                User user = userDAO.findByUsernameAndPassword(username, password);
                
                if (user != null) {
                request.setAttribute("message", "Đăng nhập thành công!");

                // Lưu thông tin user vào session
                request.getSession().setAttribute("user", user);

                // Lưu role vào session để phân quyền nav
                String role = user.isRole() ? "admin" : "reporter";
                request.getSession().setAttribute("currentUserRole", role);

                // Xử lý remember me
                if (remember != null) {
                    byte[] bytes = (username + "," + password).getBytes();
                    String userInfo = Base64.getEncoder().encodeToString(bytes);
                    Cookie cookie = new Cookie("user", userInfo);
                    cookie.setMaxAge(30 * 24 * 60 * 60); // hiệu lực 30 ngày
                    cookie.setPath("/"); // hiệu lực toàn ứng dụng
                    response.addCookie(cookie);
                } else { 
                    // Xóa Cookie nếu không tích vào remember me
                    Cookie[] cookies = request.getCookies();
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if (cookie.getName().equals("user")) {
                                cookie.setMaxAge(0); // xóa cookie
                                cookie.setPath("/");
                                response.addCookie(cookie);
                                break;
                            }
                        }
                    }
                }
                
                // Phân quyền phóng viên và admin khi đăng nhập
                if (user.isRole()) {
                    response.sendRedirect(request.getContextPath() + "/AdminServlet");
                } else {
                    response.sendRedirect(request.getContextPath() + "/reporter");
                }
                return;
                } else {
                    // Forward message về CodeLensNew với tab=login
                    request.setAttribute("message", "Tài khoản hoặc mật khẩu không đúng!");
                    request.getRequestDispatcher("/CodeLensNew?tab=login").forward(request, response);
                    return;
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("message", "Lỗi hệ thống, vui lòng thử lại!");
                request.getRequestDispatcher("/CodeLensNew?tab=login").forward(request, response);
                return;
            }
        }
        
        // Xử lý GET request (redirect về CodeLensNew với tab=login)
        response.sendRedirect(request.getContextPath() + "/CodeLensNew?tab=login");
    }
}
