package com.codelensnew.controller.admin;

import com.codelensnew.dao.CategoryDAO;
import com.codelensnew.dao.NewsDAO;
import com.codelensnew.dao.NewsletterDAO;
import com.codelensnew.dao.impl.CategoryDAOImpl;
import com.codelensnew.dao.impl.NewsDAOImpl;
import com.codelensnew.dao.impl.NewsletterDAOImpl;
import com.codelensnew.entity.Category;
import com.codelensnew.entity.News;
import com.codelensnew.entity.Newsletter;
import com.codelensnew.utils.Mailer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet({ 
    "/admin/news-management", 
    "/admin/news-management/approve/*",
    "/admin/news-management/reject/*",
    "/admin/news-management/delete/*"
})
public class NewsManagementServlet extends HttpServlet {
    private NewsDAO newsDAO = new NewsDAOImpl();
    private CategoryDAO categoryDAO = new CategoryDAOImpl();
    private NewsletterDAO newsletterDAO = new NewsletterDAOImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set encoding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String path = request.getServletPath();
        String message = "";
        
        // Xử lý approve/reject/delete
        if (path.contains("approve")) {
            String newsId = request.getPathInfo().substring(1);
            try {
                // Duyệt bài viết
                newsDAO.approveNews(newsId);
                
                // Lấy thông tin bài viết để gửi email
                News approvedNews = newsDAO.findById(newsId);
                if (approvedNews != null) {
                    // Gửi email thông báo cho tất cả subscribers
                    sendNewsletterEmail(approvedNews);
                }
                
                message = "✅ Đã duyệt bài viết thành công và gửi email thông báo!";
            } catch (SQLException e) {
                // Silent fail
                message = "❌ Lỗi: " + e.getMessage();
            }
        } else if (path.contains("reject")) {
            String newsId = request.getPathInfo().substring(1);
            try {
                newsDAO.rejectNews(newsId);
                message = "✅ Đã từ chối bài viết!";
            } catch (SQLException e) {
                // Silent fail
                message = "❌ Lỗi: " + e.getMessage();
            }
        } else if (path.contains("delete")) {
            String newsId = request.getPathInfo().substring(1);
            try {
                newsDAO.delete(newsId);
                message = "✅ Đã xóa bài viết thành công!";
            } catch (SQLException e) {
                // Silent fail
                message = "❌ Lỗi: " + e.getMessage();
            }
        }
        
        // Load categories để hiển thị trong navigation
        try {
            List<Category> categories = categoryDAO.findAll();
            request.setAttribute("categories", categories);
        } catch (SQLException e) {
            // Silent fail
        }

        // Load và filter news
        try {
            List<News> allNews = newsDAO.findAll();
            
            // Lọc theo parameters
            String statusFilter = request.getParameter("statusFilter");
            String authorFilter = request.getParameter("authorFilter");
            String categoryFilter = request.getParameter("categoryFilter");
            
            List<News> filteredNews = new ArrayList<>();
            for (News news : allNews) {
                boolean include = true;
                
                // Filter by status
                if (statusFilter != null && !statusFilter.equals("all")) {
                    if (statusFilter.equals("approved") && !news.isHome()) {
                        include = false;
                    } else if (statusFilter.equals("pending") && news.isHome()) {
                        include = false;
                    }
                }
                
                // Filter by author
                if (authorFilter != null && !authorFilter.equals("all") && !authorFilter.equals(news.getAuthor())) {
                    include = false;
                }
                
                // Filter by category
                if (categoryFilter != null && !categoryFilter.equals("all") && !categoryFilter.equals(news.getCategoryId())) {
                    include = false;
                }
                
                if (include) {
                    filteredNews.add(news);
                }
            }
            
            request.setAttribute("allNews", filteredNews);
            
            // Load danh sách tác giả unique
            Set<String> authors = new HashSet<>();
            for (News news : allNews) {
                if (news.getAuthor() != null && !news.getAuthor().trim().isEmpty()) {
                    authors.add(news.getAuthor());
                }
            }
            request.setAttribute("authors", new ArrayList<>(authors));
        } catch (SQLException e) {
            // Silent fail
            message = "❌ Lỗi khi tải danh sách bài viết: " + e.getMessage();
        }
        
        // Set dữ liệu vào request
        request.setAttribute("page", "news-management");
        request.setAttribute("message", message);

        // Forward đến layout admin
        request.getRequestDispatcher("/views/layouts/admin/layoutAdmin.jsp").forward(request, response);
    }
    
    /**
     * Gửi email thông báo tin mới cho tất cả subscribers
     */
    private void sendNewsletterEmail(News news) {
        try {
            // Lấy danh sách email subscribers đang hoạt động
            List<Newsletter> activeSubscribers = newsletterDAO.findActiveNewsletters();
            
            if (activeSubscribers.isEmpty()) {
                return;
            }
            
            // Tạo subject và body cho email
            String subject = "📰 Tin tức mới: " + news.getTitle();
            String body = createEmailBody(news);
            
            int successCount = 0;
            int failCount = 0;
            List<String> failedEmails = new ArrayList<>();
            
            // Gửi email từng cái một để xử lý lỗi riêng biệt
            for (Newsletter subscriber : activeSubscribers) {
                try {
                    String email = subscriber.getEmail();
                    
                    // Kiểm tra email có hợp lệ không
                    if (email == null || email.trim().isEmpty() || !isValidEmail(email)) {
                        failCount++;
                        failedEmails.add(email);
                        continue;
                    }
                    
                    // Gửi email đơn lẻ
                    int result = Mailer.send("chauunhatduyyit@gmail.com", email, subject, body);
                    
                    if (result == 1) {
                        successCount++;
                    } else {
                        failCount++;
                        failedEmails.add(email);
                        
                        // Tự động vô hiệu hóa email không tồn tại
                        try {
                            Newsletter failedNewsletter = newsletterDAO.findByEmail(email);
                            if (failedNewsletter != null) {
                                failedNewsletter.setEnabled(false);
                                newsletterDAO.update(failedNewsletter);
                            }
                        } catch (Exception e) {
                            // Silent fail
                        }
                    }
                    
                } catch (Exception e) {
                    failCount++;
                    failedEmails.add(subscriber.getEmail());
                    
                    // Tự động vô hiệu hóa email khi có lỗi
                    try {
                        Newsletter failedNewsletter = newsletterDAO.findByEmail(subscriber.getEmail());
                        if (failedNewsletter != null) {
                            failedNewsletter.setEnabled(false);
                            newsletterDAO.update(failedNewsletter);
                        }
                    } catch (Exception ex) {
                        // Silent fail
                    }
                }
            }
            
            // Silent operation - no console output
            
        } catch (Exception e) {
            // Silent fail
        }
    }
    
    /**
     * Kiểm tra email có hợp lệ không
     */
    private boolean isValidEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }
        
        // Kiểm tra format email cơ bản
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        return email.matches(emailRegex);
    }
    
    /**
     * Tạo nội dung email HTML
     */
    private String createEmailBody(News news) {
        StringBuilder html = new StringBuilder();
        html.append("<html><body style='font-family: Arial, sans-serif; line-height: 1.6; color: #333;'>");
        html.append("<div style='max-width: 600px; margin: 0 auto; padding: 20px;'>");
        
        // Header
        html.append("<div style='background: #007bff; color: white; padding: 20px; text-align: center; border-radius: 8px 8px 0 0;'>");
        html.append("<h1 style='margin: 0; font-size: 24px;'>📰 Code Lens News</h1>");
        html.append("<p style='margin: 10px 0 0 0; font-size: 16px;'>Tin tức mới nhất từ chúng tôi</p>");
        html.append("</div>");
        
        // Content
        html.append("<div style='background: #f8f9fa; padding: 30px; border-radius: 0 0 8px 8px;'>");
        html.append("<h2 style='color: #007bff; margin-top: 0;'>").append(news.getTitle()).append("</h2>");
        
        // Image if exists
        if (news.getImage() != null && !news.getImage().trim().isEmpty()) {
            html.append("<div style='text-align: center; margin: 20px 0;'>");
            html.append("<img src='http://localhost:8080/code-lens-new/images/").append(news.getImage())
                 .append("' alt='").append(news.getTitle())
                 .append("' style='max-width: 100%; height: auto; border-radius: 8px;'>");
            html.append("</div>");
        }
        
        // Content preview (first 200 characters)
        String contentPreview = news.getContent();
        if (contentPreview != null && contentPreview.length() > 200) {
            contentPreview = contentPreview.substring(0, 200) + "...";
        }
        html.append("<p style='font-size: 16px; line-height: 1.6;'>").append(contentPreview).append("</p>");
        
        // Read more button
        html.append("<div style='text-align: center; margin: 30px 0;'>");
        html.append("<a href='http://localhost:8080/code-lens-new/CodeLensNew?tab=news&id=").append(news.getId())
             .append("' style='background: #007bff; color: white; padding: 12px 30px; text-decoration: none; border-radius: 5px; font-weight: bold; display: inline-block;'>");
        html.append("📖 Đọc tiếp");
        html.append("</a>");
        html.append("</div>");
        
        // Footer
        html.append("<hr style='border: none; border-top: 1px solid #ddd; margin: 30px 0;'>");
        html.append("<p style='text-align: center; color: #666; font-size: 14px;'>");
        html.append("Bạn nhận được email này vì đã đăng ký nhận tin từ Code Lens News.<br>");
        html.append("Nếu không muốn nhận email này nữa, vui lòng liên hệ với chúng tôi.");
        html.append("</p>");
        
        html.append("</div>");
        html.append("</div>");
        html.append("</body></html>");
        
        return html.toString();
    }
}
