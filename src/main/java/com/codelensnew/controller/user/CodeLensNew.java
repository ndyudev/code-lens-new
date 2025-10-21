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
            
            // Bài viết gần đây sẽ được load sau khi xử lý detail
            
        } catch (Exception e) {
            // Silent fail
            // Set empty lists để tránh lỗi JSP
            request.setAttribute("categories", categories);
            request.setAttribute("featuredCategories", new ArrayList<>());
            request.setAttribute("mostViewedNews", mostViewedNews);
            request.setAttribute("latestNews", latestNews);
            request.setAttribute("recentNews", new ArrayList<>());
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
                    
                    // Thêm vào danh sách bài viết gần đây của user
                    addToUserRecentNews(request, newsId);
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
            // Silent fail
        }

        // Load bài viết gần đây sau khi đã xử lý detail (để có dữ liệu mới nhất)
        try {
            List<News> recentNews = getUserRecentNews(request);
            request.setAttribute("recentNews", recentNews);
        } catch (Exception e) {
            request.setAttribute("recentNews", new ArrayList<>());
        }

        // Set dữ liệu vào request
        request.setAttribute("tab", tab);

        // Forward đến layout user
        request.getRequestDispatcher("/views/layouts/user/layoutUser.jsp").forward(request, response);
    }
    
    /**
     * Lấy danh sách bài viết gần đây của user từ session
     */
    @SuppressWarnings("unchecked")
    private List<News> getUserRecentNews(HttpServletRequest request) {
        try {
            // Lấy danh sách ID bài viết đã xem từ session
            List<String> viewedNewsIds = (List<String>) request.getSession().getAttribute("viewedNewsIds");
            
            if (viewedNewsIds == null || viewedNewsIds.isEmpty()) {
                // Nếu chưa có, trả về 4 bài mới nhất
                return newsDAO.findLatestNews(4);
            }
            
            // Lấy tối đa 4 bài viết gần đây nhất đã xem
            List<News> recentNews = new ArrayList<>();
            int count = 0;
            
            // Lấy từ cuối danh sách (bài viết xem gần đây nhất)
            for (int i = viewedNewsIds.size() - 1; i >= 0 && count < 4; i--) {
                String newsId = viewedNewsIds.get(i);
                try {
                    News news = newsDAO.findById(newsId);
                    if (news != null) {
                        recentNews.add(news);
                        count++;
                    }
                } catch (Exception e) {
                    // Silent fail
                }
            }
            
            // Nếu không đủ 4 bài, bổ sung bằng bài mới nhất
            if (recentNews.size() < 4) {
                List<News> latestNews = newsDAO.findLatestNews(4);
                for (News news : latestNews) {
                    if (recentNews.size() >= 4) break;
                    
                    // Kiểm tra xem đã có trong danh sách chưa
                    boolean alreadyExists = false;
                    for (News existingNews : recentNews) {
                        if (existingNews.getId().equals(news.getId())) {
                            alreadyExists = true;
                            break;
                        }
                    }
                    
                    if (!alreadyExists) {
                        recentNews.add(news);
                    }
                }
            }
            
            return recentNews;
            
        } catch (Exception e) {
            // Silent fail
            // Fallback về 4 bài mới nhất
            try {
                return newsDAO.findLatestNews(4);
            } catch (Exception ex) {
                return new ArrayList<>();
            }
        }
    }
    
    /**
     * Thêm bài viết vào danh sách đã xem của user
     */
    @SuppressWarnings("unchecked")
    private void addToUserRecentNews(HttpServletRequest request, String newsId) {
        try {
            // Lấy danh sách hiện tại từ session
            List<String> viewedNewsIds = (List<String>) request.getSession().getAttribute("viewedNewsIds");
            
            if (viewedNewsIds == null) {
                viewedNewsIds = new ArrayList<>();
            }
            
            // Xóa ID cũ nếu đã tồn tại (để đưa lên đầu)
            viewedNewsIds.remove(newsId);
            
            // Thêm vào cuối danh sách
            viewedNewsIds.add(newsId);
            
            // Giới hạn tối đa 20 bài viết gần đây
            if (viewedNewsIds.size() > 20) {
                viewedNewsIds = viewedNewsIds.subList(viewedNewsIds.size() - 20, viewedNewsIds.size());
            }
            
            // Lưu lại vào session
            request.getSession().setAttribute("viewedNewsIds", viewedNewsIds);
            
        } catch (Exception e) {
            // Silent fail
        }
    }
}
