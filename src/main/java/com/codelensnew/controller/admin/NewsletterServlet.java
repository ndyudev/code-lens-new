package com.codelensnew.controller.admin;

import com.codelensnew.dao.NewsletterDAO;
import com.codelensnew.dao.impl.NewsletterDAOImpl;
import com.codelensnew.entity.Newsletter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet({
    "/admin/newsletter",
    "/admin/newsletter/subscribe",
    "/admin/newsletter/delete/*",
    "/admin/newsletter/edit/*",
    "/admin/newsletter/update",
    "/admin/newsletter/create"
})
public class NewsletterServlet extends HttpServlet {
    private NewsletterDAO newsletterDAO;

    @Override
    public void init() throws ServletException {
        this.newsletterDAO = new NewsletterDAOImpl();
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String path = request.getServletPath();
        String message = "";

        // Xử lý subscribe từ footer
        if (path.contains("subscribe") && "POST".equals(request.getMethod())) {
            String email = request.getParameter("email");
            
            if (email != null && !email.trim().isEmpty()) {
                try {
                    // Kiểm tra email đã tồn tại chưa
                    Newsletter existingNewsletter = newsletterDAO.findByEmail(email);
                    
                    if (existingNewsletter != null) {
                        // Nếu đã tồn tại nhưng bị disabled, enable lại
                        if (!existingNewsletter.isEnabled()) {
                            Newsletter updatedNewsletter = new Newsletter(email, true);
                            newsletterDAO.update(updatedNewsletter);
                            message = "✅ Đã kích hoạt lại đăng ký nhận tin cho email: " + email;
                        } else {
                            message = "ℹ️ Email này đã đăng ký nhận tin rồi!";
                        }
                    } else {
                        // Tạo mới
                        Newsletter newsletter = new Newsletter(email, true);
                        newsletterDAO.insert(newsletter);
                        message = "✅ Đăng ký nhận tin thành công cho email: " + email;
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    message = "❌ Lỗi hệ thống, vui lòng thử lại sau!";
                }
            } else {
                message = "❌ Vui lòng nhập email hợp lệ!";
            }
            
            // Redirect về trang chủ với message
            request.getSession().setAttribute("newsletterMessage", message);
            response.sendRedirect(request.getContextPath() + "/CodeLensNew");
            return;
        }

        // Xử lý delete
        if (path.contains("delete") && request.getPathInfo() != null) {
            String email = request.getPathInfo().substring(1);
            try {
                newsletterDAO.delete(email);
                message = "✅ Đã xóa email: " + email;
            } catch (SQLException e) {
                e.printStackTrace();
                message = "❌ Lỗi khi xóa email: " + e.getMessage();
            }
        }

        // Xử lý create newsletter
        if (path.contains("create") && "POST".equals(request.getMethod())) {
            String email = request.getParameter("email");
            String enabledStr = request.getParameter("enabled");
            
            if (email != null && !email.trim().isEmpty() && enabledStr != null) {
                try {
                    boolean enabled = "1".equals(enabledStr);
                    
                    // Kiểm tra email đã tồn tại chưa
                    Newsletter existingNewsletter = newsletterDAO.findByEmail(email);
                    if (existingNewsletter != null) {
                        message = "❌ Email này đã tồn tại trong hệ thống!";
                    } else {
                        Newsletter newsletter = new Newsletter(email, enabled);
                        int result = newsletterDAO.insert(newsletter);
                        
                        if (result > 0) {
                            message = "✅ Thêm newsletter thành công!";
                        } else {
                            message = "❌ Thêm newsletter thất bại!";
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    message = "❌ Lỗi khi thêm: " + e.getMessage();
                }
            } else {
                message = "❌ Vui lòng nhập đầy đủ thông tin!";
            }
        }

        // Xử lý update newsletter
        if (path.contains("update") && "POST".equals(request.getMethod())) {
            String email = request.getParameter("email");
            String enabledStr = request.getParameter("enabled");
            
            if (email != null && !email.trim().isEmpty() && enabledStr != null) {
                try {
                    boolean enabled = "1".equals(enabledStr);
                    Newsletter newsletter = new Newsletter(email, enabled);
                    int result = newsletterDAO.update(newsletter);
                    
                    if (result > 0) {
                        message = "✅ Cập nhật newsletter thành công!";
                    } else {
                        message = "❌ Cập nhật newsletter thất bại!";
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    message = "❌ Lỗi khi cập nhật: " + e.getMessage();
                }
            } else {
                message = "❌ Vui lòng nhập đầy đủ thông tin!";
            }
        }

        // Xử lý edit - load newsletter để edit
        Newsletter editingNewsletter = null;
        if (path.contains("edit") && request.getPathInfo() != null) {
            String email = request.getPathInfo().substring(1);
            try {
                editingNewsletter = newsletterDAO.findByEmail(email);
                if (editingNewsletter == null) {
                    message = "❌ Không tìm thấy email: " + email;
                }
            } catch (SQLException e) {
                e.printStackTrace();
                message = "❌ Lỗi khi tải thông tin email: " + e.getMessage();
            }
        }

        // Load danh sách newsletter
        List<Newsletter> newsletters = null;
        try {
            newsletters = newsletterDAO.findAll();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("newsletters", newsletters);
        request.setAttribute("editingNewsletter", editingNewsletter);
        request.setAttribute("message", message);
        request.setAttribute("page", "newsletter-management");
        request.getRequestDispatcher("/views/layouts/admin/layoutAdmin.jsp").forward(request, response);
    }
}
