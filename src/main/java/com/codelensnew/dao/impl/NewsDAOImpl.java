package com.codelensnew.dao.impl;

import com.codelensnew.dao.NewsDAO;
import com.codelensnew.entity.News;
import com.codelensnew.utils.JdbcHelper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NewsDAOImpl implements NewsDAO {

    // SQL Queries
    private static final String SELECT_ALL = "SELECT * FROM NEWS ORDER BY PostedDate DESC";
    private static final String SELECT_BY_ID = "SELECT * FROM NEWS WHERE Id = ?";
    private static final String INSERT = "INSERT INTO NEWS (Id, Title, Content, Image, PostedDate, Author, ViewCount, CategoryId, Home) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE = "UPDATE NEWS SET Title = ?, Content = ?, Image = ?, PostedDate = ?, Author = ?, ViewCount = ?, CategoryId = ?, Home = ? WHERE Id = ?";
    private static final String DELETE = "DELETE FROM NEWS WHERE Id = ?";
    private static final String EXISTS_BY_ID = "SELECT COUNT(*) FROM NEWS WHERE Id = ?";
    private static final String FIND_BY_CATEGORY = "SELECT * FROM NEWS WHERE CategoryId = ? ORDER BY PostedDate DESC";
    private static final String FIND_BY_AUTHOR = "SELECT * FROM NEWS WHERE Author = ? ORDER BY PostedDate DESC";
    private static final String FIND_HOME_NEWS = "SELECT * FROM NEWS WHERE Home = 1 ORDER BY PostedDate DESC";
    private static final String SEARCH_BY_TITLE = "SELECT * FROM NEWS WHERE Title LIKE ? ORDER BY PostedDate DESC";
    private static final String FIND_LATEST = "SELECT * FROM NEWS ORDER BY PostedDate DESC";
    private static final String FIND_MOST_VIEWED = "SELECT * FROM NEWS ORDER BY ViewCount DESC";
    private static final String INCREMENT_VIEW = "UPDATE NEWS SET ViewCount = ViewCount + 1 WHERE Id = ?";
    private static final String APPROVE_NEWS = "UPDATE NEWS SET Home = 1 WHERE Id = ?";
    private static final String REJECT_NEWS = "UPDATE NEWS SET Home = 0 WHERE Id = ?";
    private static final String FIND_PENDING_NEWS = "SELECT * FROM NEWS WHERE Home = 0 ORDER BY PostedDate DESC";
    private static final String FIND_BY_CATEGORY_APPROVED = "SELECT * FROM NEWS WHERE CategoryId = ? AND Home = 1 ORDER BY PostedDate DESC";

    @Override
    public List<News> findAll() throws SQLException {
        return selectBySQL(SELECT_ALL);
    }

    @Override
    public News findById(String id) throws SQLException {
        List<News> list = selectBySQL(SELECT_BY_ID, id);
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public int insert(News entity) throws SQLException {
        return JdbcHelper.executeUpdate(INSERT,
            entity.getId(),
            entity.getTitle(),
            entity.getContent(),
            entity.getImage(),
            entity.getPostedDate(),
            entity.getAuthor(),
            entity.getViewCount(),
            entity.getCategoryId(),
            entity.isHome()
        );
    }

    @Override
    public int update(News entity) throws SQLException {
        return JdbcHelper.executeUpdate(UPDATE,
            entity.getTitle(),
            entity.getContent(),
            entity.getImage(),
            entity.getPostedDate(),
            entity.getAuthor(),
            entity.getViewCount(),
            entity.getCategoryId(),
            entity.isHome(),
            entity.getId()
        );
    }

    @Override
    public int delete(String id) throws SQLException {
        return JdbcHelper.executeUpdate(DELETE, id);
    }

    @Override
    public boolean exists(String id) throws SQLException {
        try (Connection conn = JdbcHelper.getConnection();
             PreparedStatement ps = conn.prepareStatement(EXISTS_BY_ID)) {
            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    @Override
    public List<News> findByCategoryId(String categoryId) throws SQLException {
        return selectBySQL(FIND_BY_CATEGORY, categoryId);
    }

    @Override
    public List<News> findByAuthor(String author) throws SQLException {
        return selectBySQL(FIND_BY_AUTHOR, author);
    }

    @Override
    public List<News> findHomeNews() throws SQLException {
        return selectBySQL(FIND_HOME_NEWS);
    }

    @Override
    public List<News> searchByTitle(String keyword) throws SQLException {
        return selectBySQL(SEARCH_BY_TITLE, "%" + keyword + "%");
    }

    @Override
    public List<News> findLatestNews(int limit) throws SQLException {
        List<News> allNews = selectBySQL(FIND_LATEST);
        return allNews.size() > limit ? allNews.subList(0, limit) : allNews;
    }

    @Override
    public List<News> findMostViewedNews(int limit) throws SQLException {
        List<News> allNews = selectBySQL(FIND_MOST_VIEWED);
        return allNews.size() > limit ? allNews.subList(0, limit) : allNews;
    }

    @Override
    public int incrementViewCount(String newsId) throws SQLException {
        return JdbcHelper.executeUpdate(INCREMENT_VIEW, newsId);
    }

    @Override
    public int approveNews(String newsId) throws SQLException {
        return JdbcHelper.executeUpdate(APPROVE_NEWS, newsId);
    }

    @Override
    public int rejectNews(String newsId) throws SQLException {
        return JdbcHelper.executeUpdate(REJECT_NEWS, newsId);
    }

    @Override
    public List<News> findPendingNews() throws SQLException {
        return selectBySQL(FIND_PENDING_NEWS);
    }

    @Override
    public List<News> findByCategoryIdAndApproved(String categoryId) throws SQLException {
        return selectBySQL(FIND_BY_CATEGORY_APPROVED, categoryId);
    }

    private List<News> selectBySQL(String sql, Object... args) throws SQLException {
        List<News> list = new ArrayList<>();
        try (Connection conn = JdbcHelper.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            for (int i = 0; i < args.length; i++) {
                ps.setObject(i + 1, args[i]);
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    News news = new News();
                    news.setId(rs.getString("Id"));
                    news.setTitle(rs.getString("Title"));
                    news.setContent(rs.getString("Content"));
                    news.setImage(rs.getString("Image"));
                    news.setPostedDate(rs.getDate("PostedDate"));
                    news.setAuthor(rs.getString("Author"));
                    news.setViewCount(rs.getInt("ViewCount"));
                    news.setCategoryId(rs.getString("CategoryId"));
                    news.setHome(rs.getBoolean("Home"));
                    list.add(news);
                }
            }
        }
        return list;
    }
}
