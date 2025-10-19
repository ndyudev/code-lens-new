package com.codelensnew.dao.impl;

import com.codelensnew.dao.NewsletterDAO;
import com.codelensnew.entity.Newsletter;
import com.codelensnew.utils.JdbcHelper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NewsletterDAOImpl implements NewsletterDAO {

    // SQL Queries
    private static final String SELECT_ALL = "SELECT * FROM NEWSLETTERS ORDER BY Email";
    private static final String SELECT_BY_ID = "SELECT * FROM NEWSLETTERS WHERE Email = ?";
    private static final String INSERT = "INSERT INTO NEWSLETTERS (Email, Enabled) VALUES (?, ?)";
    private static final String UPDATE = "UPDATE NEWSLETTERS SET Enabled = ? WHERE Email = ?";
    private static final String DELETE = "DELETE FROM NEWSLETTERS WHERE Email = ?";
    private static final String EXISTS_BY_ID = "SELECT COUNT(*) FROM NEWSLETTERS WHERE Email = ?";
    private static final String FIND_ACTIVE_NEWSLETTERS = "SELECT * FROM NEWSLETTERS WHERE Enabled = 1 ORDER BY Email";

    @Override
    public List<Newsletter> findAll() throws SQLException {
        return selectBySQL(SELECT_ALL);
    }

    @Override
    public Newsletter findById(String email) throws SQLException {
        List<Newsletter> list = selectBySQL(SELECT_BY_ID, email);
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public int insert(Newsletter newsletter) throws SQLException {
        return JdbcHelper.executeUpdate(INSERT, 
            newsletter.getEmail(),
            newsletter.isEnabled()
        );
    }

    @Override
    public int update(Newsletter newsletter) throws SQLException {
        return JdbcHelper.executeUpdate(UPDATE,
            newsletter.isEnabled(),
            newsletter.getEmail()
        );
    }

    @Override
    public int delete(String email) throws SQLException {
        return JdbcHelper.executeUpdate(DELETE, email);
    }

    @Override
    public boolean exists(String email) throws SQLException {
        try (Connection conn = JdbcHelper.getConnection();
             PreparedStatement ps = conn.prepareStatement(EXISTS_BY_ID)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    @Override
    public Newsletter findByEmail(String email) throws SQLException {
        return findById(email);
    }

    @Override
    public List<Newsletter> findActiveNewsletters() throws SQLException {
        return selectBySQL(FIND_ACTIVE_NEWSLETTERS);
    }

    private List<Newsletter> selectBySQL(String sql, Object... args) throws SQLException {
        List<Newsletter> list = new ArrayList<>();
        try (Connection conn = JdbcHelper.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            for (int i = 0; i < args.length; i++) {
                ps.setObject(i + 1, args[i]);
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Newsletter newsletter = new Newsletter();
                    newsletter.setEmail(rs.getString("Email"));
                    newsletter.setEnabled(rs.getBoolean("Enabled"));
                    list.add(newsletter);
                }
            }
        }
        return list;
    }
}
