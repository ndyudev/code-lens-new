package com.codelensnew.dao;

import com.codelensnew.common.dao.BaseDAO;
import com.codelensnew.entity.News;

import java.sql.SQLException;
import java.util.List;

public interface NewsDAO extends BaseDAO<News, String> {
    
    /**
     * Tìm tin tức theo category
     * @param categoryId
     * @return List<News>
     */
    List<News> findByCategoryId(String categoryId) throws SQLException;
    
    /**
     * Tìm tin tức theo tác giả
     * @param author
     * @return List<News>
     */
    List<News> findByAuthor(String author) throws SQLException;
    
    /**
     * Tìm tin tức hiển thị trên trang chủ
     * @return List<News>
     */
    List<News> findHomeNews() throws SQLException;
    
    /**
     * Tìm tin tức theo từ khóa trong title
     * @param keyword
     * @return List<News>
     */
    List<News> searchByTitle(String keyword) throws SQLException;
    
    /**
     * Lấy tin tức mới nhất
     * @param limit
     * @return List<News>
     */
    List<News> findLatestNews(int limit) throws SQLException;
    
    /**
     * Lấy tin tức được xem nhiều nhất
     * @param limit
     * @return List<News>
     */
    List<News> findMostViewedNews(int limit) throws SQLException;
    
    /**
     * Tăng view count
     * @param newsId
     * @return int
     */
    int incrementViewCount(String newsId) throws SQLException;
    
    /**
     * Duyệt bài viết (set Home = true)
     * @param newsId
     * @return int
     */
    int approveNews(String newsId) throws SQLException;
    
    /**
     * Từ chối bài viết (set Home = false)
     * @param newsId
     * @return int
     */
    int rejectNews(String newsId) throws SQLException;
    
    /**
     * Lấy tất cả bài viết chờ duyệt (Home = false)
     * @return List<News>
     */
    List<News> findPendingNews() throws SQLException;
    
    /**
     * Tìm tin tức theo category và đã duyệt (Home = true)
     * @param categoryId
     * @return List<News>
     */
    List<News> findByCategoryIdAndApproved(String categoryId) throws SQLException;
}