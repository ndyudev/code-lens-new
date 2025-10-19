package com.codelensnew.controller.user;

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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CodeLensNew")
public class CodeLensNew extends HttpServlet {
    private CategoryDAO categoryDAO = new CategoryDAOImpl();
    private NewsDAO newsDAO = new NewsDAOImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Lấy tab từ parameter, mặc định là 'home'
        String tab = request.getParameter("tab");
        if (tab == null || tab.isEmpty()) {
            tab = "home";
        }

        // Load categories và dữ liệu cho aside
        List<Category> categories = new ArrayList<>();
        List<News> mostViewedNews = new ArrayList<>();
        List<News> latestNews = new ArrayList<>();
        
        try {
            categories = categoryDAO.findAll();
            request.setAttribute("categories", categories);
            
            // Chuyên mục nổi bật - 4 mục có nhiều tin tức nhất
            List<Category> featuredCategories = categoryDAO.findFeaturedCategories(4);
            request.setAttribute("featuredCategories", featuredCategories);
            
            // Được xem nhiều nhất - 4 bài có view cao nhất
            mostViewedNews = newsDAO.findMostViewedNews(4);
            request.setAttribute("mostViewedNews", mostViewedNews);
            
            // Bản tin mới nhất - 4 bài mới nhất
            latestNews = newsDAO.findLatestNews(4);
            request.setAttribute("latestNews", latestNews);
            
        } catch (Exception e) {
            System.err.println("Lỗi khi load dữ liệu: " + e.getMessage());
            e.printStackTrace();
            // Set empty lists để tránh lỗi JSP
            request.setAttribute("categories", categories);
            request.setAttribute("featuredCategories", new ArrayList<>());
            request.setAttribute("mostViewedNews", mostViewedNews);
            request.setAttribute("latestNews", latestNews);
        }
        
        // Load newsletter message nếu có
        String newsletterMessage = (String) request.getSession().getAttribute("newsletterMessage");
        if (newsletterMessage != null) {
            request.setAttribute("newsletterMessage", newsletterMessage);
            request.getSession().removeAttribute("newsletterMessage"); // Xóa sau khi đã lấy
        }
        
        // Load news theo tab
        try {
            String newsId = request.getParameter("id");
            String categoryId = request.getParameter("categoryId");
            
            if ("login".equals(tab)) {
                // Tab login - không cần load news
                // Chỉ cần forward đến layout với tab=login
            } else if ("news".equals(tab) && newsId != null && !newsId.isEmpty()) {
                // Hiển thị chi tiết bài viết
                News news = newsDAO.findById(newsId);
                if (news != null) {
                    // Tăng lượt xem
                    newsDAO.incrementViewCount(newsId);
                    news.setViewCount(news.getViewCount() + 1);
                    request.setAttribute("news", news);
                }
            } else if ("category".equals(tab) && categoryId != null && !categoryId.isEmpty()) {
                // Hiển thị tin tức theo danh mục (chỉ bài đã duyệt)
                List<News> newsList = newsDAO.findByCategoryIdAndApproved(categoryId);
                request.setAttribute("newsList", newsList);
            } else {
                // Hiển thị chỉ tin tức đã duyệt (Home = true)
                List<News> newsList = newsDAO.findHomeNews();
                request.setAttribute("newsList", newsList);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set dữ liệu vào request
        request.setAttribute("tab", tab);

        // Forward đến layout user
        request.getRequestDispatcher("/views/layouts/user/layoutUser.jsp").forward(request, response);
    }
}
