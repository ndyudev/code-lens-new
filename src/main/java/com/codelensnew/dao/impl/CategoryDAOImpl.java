package com.codelensnew.dao.impl;

import com.codelensnew.dao.CategoryDAO;
import com.codelensnew.entity.Category;
import com.codelensnew.utils.JdbcHelper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAOImpl implements CategoryDAO {

    // SQL Queries
    private static final String SELECT_ALL = "SELECT * FROM CATEGORIES ORDER BY Id ASC";
    private static final String SELECT_BY_ID = "SELECT * FROM CATEGORIES WHERE Id = ?";
    private static final String INSERT = "INSERT INTO CATEGORIES (Id, Name) VALUES (?, ?)";
    private static final String UPDATE = "UPDATE CATEGORIES SET Name = ? WHERE Id = ?";
    private static final String DELETE = "DELETE FROM CATEGORIES WHERE Id = ?";
    private static final String EXISTS_BY_ID = "SELECT COUNT(*) FROM CATEGORIES WHERE Id = ?";
    private static final String EXISTS_BY_NAME = "SELECT COUNT(*) FROM CATEGORIES WHERE Name = ?";
    private static final String EXISTS_BY_NAME_EXCLUDE_ID = "SELECT COUNT(*) FROM CATEGORIES WHERE Name = ? AND Id != ?";
    private static final String IS_CATEGORY_IN_USE = "SELECT COUNT(*) FROM NEWS WHERE CategoryId = ?";
    private static final String FIND_FEATURED_CATEGORIES = "SELECT c.Id, c.Name, COUNT(n.Id) as news_count " +
            "FROM CATEGORIES c " +
            "LEFT JOIN NEWS n ON c.Id = n.CategoryId AND n.Home = 1 " +
            "GROUP BY c.Id, c.Name " +
            "ORDER BY news_count DESC, c.Name ASC";

    @Override
    public List<Category> findAll() throws SQLException {
        return selectBySQL(SELECT_ALL);
    }

    @Override
    public Category findById(String id) throws SQLException {
        List<Category> list = selectBySQL(SELECT_BY_ID, id);
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public int insert(Category entity) throws SQLException {
        return JdbcHelper.executeUpdate(INSERT, 
            entity.getId(),
            entity.getName()
        );
    }

    @Override
    public int update(Category entity) throws SQLException {
        return JdbcHelper.executeUpdate(UPDATE,
            entity.getName(),
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
    public boolean existsByCategoryName(String categoryName) throws SQLException {
        try (Connection conn = JdbcHelper.getConnection();
             PreparedStatement ps = conn.prepareStatement(EXISTS_BY_NAME)) {
            ps.setString(1, categoryName);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    @Override
    public boolean existsByCategoryNameExcludeId(String categoryName, String categoryId) throws SQLException {
        try (Connection conn = JdbcHelper.getConnection();
             PreparedStatement ps = conn.prepareStatement(EXISTS_BY_NAME_EXCLUDE_ID)) {
            ps.setString(1, categoryName);
            ps.setString(2, categoryId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    @Override
    public boolean isCategoryInUse(String categoryId) throws SQLException {
        try (Connection conn = JdbcHelper.getConnection();
             PreparedStatement ps = conn.prepareStatement(IS_CATEGORY_IN_USE)) {
            ps.setString(1, categoryId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    @Override
    public List<Category> findFeaturedCategories(int limit) throws SQLException {
        List<Category> list = new ArrayList<>();
        try (Connection conn = JdbcHelper.getConnection();
             PreparedStatement ps = conn.prepareStatement(FIND_FEATURED_CATEGORIES)) {
            try (ResultSet rs = ps.executeQuery()) {
                int count = 0;
                while (rs.next() && count < limit) {
                    Category category = new Category();
                    category.setId(rs.getString("Id"));
                    category.setName(rs.getString("Name"));
                    list.add(category);
                    count++;
                }
            }
        }
        return list;
    }

    private List<Category> selectBySQL(String sql, Object... args) throws SQLException {
        List<Category> list = new ArrayList<>();
        try (Connection conn = JdbcHelper.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            for (int i = 0; i < args.length; i++) {
                ps.setObject(i + 1, args[i]);
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Category category = new Category();
                    category.setId(rs.getString("Id"));
                    category.setName(rs.getString("Name"));
                    list.add(category);
                }
            }
        }
        return list;
    }
}
