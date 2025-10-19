package com.codelensnew.controller.admin;

import com.codelensnew.dao.CategoryDAO;
import com.codelensnew.dao.NewsDAO;
import com.codelensnew.dao.UserDAO;
import com.codelensnew.dao.impl.CategoryDAOImpl;
import com.codelensnew.dao.impl.NewsDAOImpl;
import com.codelensnew.dao.impl.UserDAOImpl;
import com.codelensnew.entity.Category;
import com.codelensnew.entity.News;
import com.codelensnew.entity.User;

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

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private CategoryDAO categoryDAO = new CategoryDAOImpl();
    private NewsDAO newsDAO = new NewsDAOImpl();
    private UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set encoding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String page = request.getParameter("page");
        String action = request.getParameter("action");
        String newsId = request.getParameter("newsId");
        String userId = request.getParameter("userId");
        String message = "";
        
        if (page == null || page.isEmpty()) {
            page = "dashboard";
        }

        // Xử lý approve/reject/delete cho news-management
        if ("news-management".equals(page) && action != null && newsId != null) {
            try {
                if ("approve".equals(action)) {
                    newsDAO.approveNews(newsId);
                    message = "✅ Đã duyệt bài viết thành công!";
                } else if ("reject".equals(action)) {
                    newsDAO.rejectNews(newsId);
                    message = "✅ Đã từ chối bài viết!";
                } else if ("delete".equals(action)) {
                    newsDAO.delete(newsId);
                    message = "✅ Đã xóa bài viết thành công!";
                }
            } catch (SQLException e) {
                e.printStackTrace();
                message = "❌ Lỗi: " + e.getMessage();
            }
        }
        
        // Xử lý delete cho user-management
        if ("user-management".equals(page) && "delete".equals(action) && userId != null) {
            try {
                userDAO.delete(userId);
                message = "✅ Đã xóa người dùng thành công!";
            } catch (SQLException e) {
                e.printStackTrace();
                message = "❌ Lỗi khi xóa người dùng: " + e.getMessage();
            }
        }

        // Load categories để hiển thị trong navigation
        try {
            List<Category> categories = categoryDAO.findAll();
            request.setAttribute("categories", categories);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Xử lý logic cho news-management
        if ("news-management".equals(page)) {
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
        }
        
        // Xử lý logic cho user-management
        if ("user-management".equals(page)) {
            try {
                List<User> allUsers = userDAO.findAll();
                request.setAttribute("allUsers", allUsers);
            } catch (SQLException e) {
                e.printStackTrace();
                message = "❌ Lỗi khi tải danh sách người dùng: " + e.getMessage();
            }
        }
        
        // Xử lý logic cho category-management
        if ("category-management".equals(page)) {
            try {
                List<Category> categories = categoryDAO.findAll();
                request.setAttribute("categories", categories);
            } catch (SQLException e) {
                e.printStackTrace();
                message = "❌ Lỗi khi tải danh sách danh mục: " + e.getMessage();
            }
        }
        

        // Set dữ liệu vào request
        request.setAttribute("page", page);
        request.setAttribute("message", message);

        // Forward đến layout admin
        request.getRequestDispatcher("/views/layouts/admin/layoutAdmin.jsp").forward(request, response);
    }
}