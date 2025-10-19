package com.codelensnew.controller.admin;

import com.codelensnew.dao.CategoryDAO;
import com.codelensnew.dao.NewsDAO;
import com.codelensnew.dao.impl.CategoryDAOImpl;
import com.codelensnew.dao.impl.NewsDAOImpl;
import com.codelensnew.entity.Category;
import com.codelensnew.entity.News;

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
                newsDAO.approveNews(newsId);
                message = "✅ Đã duyệt bài viết thành công!";
            } catch (SQLException e) {
                e.printStackTrace();
                message = "❌ Lỗi: " + e.getMessage();
            }
        } else if (path.contains("reject")) {
            String newsId = request.getPathInfo().substring(1);
            try {
                newsDAO.rejectNews(newsId);
                message = "✅ Đã từ chối bài viết!";
            } catch (SQLException e) {
                e.printStackTrace();
                message = "❌ Lỗi: " + e.getMessage();
            }
        } else if (path.contains("delete")) {
            String newsId = request.getPathInfo().substring(1);
            try {
                newsDAO.delete(newsId);
                message = "✅ Đã xóa bài viết thành công!";
            } catch (SQLException e) {
                e.printStackTrace();
                message = "❌ Lỗi: " + e.getMessage();
            }
        }
        
        // Load categories để hiển thị trong navigation
        try {
            List<Category> categories = categoryDAO.findAll();
            request.setAttribute("categories", categories);
        } catch (SQLException e) {
            e.printStackTrace();
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
            e.printStackTrace();
            message = "❌ Lỗi khi tải danh sách bài viết: " + e.getMessage();
        }
        
        // Set dữ liệu vào request
        request.setAttribute("page", "news-management");
        request.setAttribute("message", message);

        // Forward đến layout admin
        request.getRequestDispatcher("/views/layouts/admin/layoutAdmin.jsp").forward(request, response);
    }
}
