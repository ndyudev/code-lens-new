package com.codelensnew.controller.reporter;

import com.codelensnew.dao.UserDAO;
import com.codelensnew.dao.impl.UserDAOImpl;
import com.codelensnew.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet({ 
    "/reporter/change-password", 
    "/reporter/change-password/update"
})
public class ChangePasswordServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set encoding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String message = "";
        String path = request.getServletPath();
        
        // Xử lý POST request (đổi mật khẩu)
        if (path.contains("update") && "POST".equals(request.getMethod())) {
            try {
                // Lấy thông tin từ form
                String oldPassword = request.getParameter("oldPassword");
                String newPassword = request.getParameter("newPassword");
                String confirmPassword = request.getParameter("confirmPassword");
                
                // Validation
                if (oldPassword == null || oldPassword.trim().isEmpty()) {
                    message = "❌ Vui lòng nhập mật khẩu cũ!";
                } else if (newPassword == null || newPassword.trim().isEmpty()) {
                    message = "❌ Vui lòng nhập mật khẩu mới!";
                } else if (confirmPassword == null || confirmPassword.trim().isEmpty()) {
                    message = "❌ Vui lòng xác nhận mật khẩu mới!";
                } else if (!newPassword.equals(confirmPassword)) {
                    message = "❌ Mật khẩu mới và xác nhận không khớp!";
                } else if (newPassword.length() < 6) {
                    message = "❌ Mật khẩu mới phải có ít nhất 6 ký tự!";
                } else {
                    // Lấy user từ session
                    HttpSession session = request.getSession();
                    User currentUser = (User) session.getAttribute("user");
                    
                    if (currentUser == null) {
                        message = "❌ Bạn cần đăng nhập để thay đổi mật khẩu!";
                    } else {
                        // Kiểm tra mật khẩu cũ
                        User user = userDAO.findByUsernameAndPassword(currentUser.getId(), oldPassword);
                        if (user == null) {
                            message = "❌ Mật khẩu cũ không đúng!";
                        } else {
                            // Cập nhật mật khẩu mới
                            boolean updated = userDAO.updatePassword(user.getId(), newPassword);
                            
                            if (updated) {
                                message = "✅ Đổi mật khẩu thành công!";
                            } else {
                                message = "❌ Có lỗi xảy ra khi cập nhật mật khẩu!";
                            }
                        }
                    }
                }
                
            } catch (Exception e) {
                // Silent fail
                message = "❌ Có lỗi xảy ra: " + e.getMessage();
            }
        }
        
        // Set dữ liệu vào request
        request.setAttribute("message", message);
        request.setAttribute("page", "change-password");

        // Forward đến layout reporter
        request.getRequestDispatcher("/views/layouts/reporter/layoutReporter.jsp").forward(request, response);
    }
}
