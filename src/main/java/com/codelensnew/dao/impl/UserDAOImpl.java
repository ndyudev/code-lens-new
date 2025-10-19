package com.codelensnew.dao.impl;

import com.codelensnew.dao.UserDAO;
import com.codelensnew.entity.User;
import com.codelensnew.utils.JdbcHelper;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {

    // SQL Queries
    private static final String SELECT_ALL = "SELECT * FROM USERS ORDER BY Id ASC";
    private static final String SELECT_BY_ID = "SELECT * FROM USERS WHERE Id = ?";
    private static final String INSERT = "INSERT INTO USERS (Id, Password, Fullname, Birthday, Gender, Mobile, Email, Role) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String UPDATE = "UPDATE USERS SET Password = ?, Fullname = ?, Birthday = ?, Gender = ?, Mobile = ?, Email = ?, Role = ? WHERE Id = ?";
    private static final String DELETE = "DELETE FROM USERS WHERE Id = ?";
    private static final String EXISTS_BY_ID = "SELECT COUNT(*) FROM USERS WHERE Id = ?";
    private static final String FIND_BY_USERNAME_PASSWORD = "SELECT * FROM USERS WHERE Id = ? AND Password = ?";
    private static final String UPDATE_PASSWORD = "UPDATE USERS SET Password = ? WHERE Id = ?";

    @Override
    public List<User> findAll() throws SQLException {
        return selectBySQL(SELECT_ALL);
    }

    @Override
    public User findById(String id) throws SQLException {
        List<User> list = selectBySQL(SELECT_BY_ID, id);
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public int insert(User entity) throws SQLException {
        return JdbcHelper.executeUpdate(INSERT, 
            entity.getId(),
            entity.getPassword(),
            entity.getFullname(),
            entity.getBirthday(),
            entity.isGender(),
            entity.getMobile(),
            entity.getEmail(),
            entity.isRole()
        );
    }

    @Override
    public int update(User entity) throws SQLException {
        return JdbcHelper.executeUpdate(UPDATE,
            entity.getPassword(),
            entity.getFullname(),
            entity.getBirthday(),
            entity.isGender(),
            entity.getMobile(),
            entity.getEmail(),
            entity.isRole(),
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
    public User findByUsernameAndPassword(String username, String password) throws SQLException {
        List<User> list = selectBySQL(FIND_BY_USERNAME_PASSWORD, username, password);
        return list.size() > 0 ? list.get(0) : null;
    }

    @Override
    public boolean updatePassword(String userId, String newPassword) throws SQLException {
        int result = JdbcHelper.executeUpdate(UPDATE_PASSWORD, newPassword, userId);
        return result > 0;
    }

    private List<User> selectBySQL(String sql, Object... args) throws SQLException {
        List<User> list = new ArrayList<>();
        try (Connection conn = JdbcHelper.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            for (int i = 0; i < args.length; i++) {
                ps.setObject(i + 1, args[i]);
            }
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    User user = new User();
                    user.setId(rs.getString("Id"));
                    user.setPassword(rs.getString("Password"));
                    user.setFullname(rs.getString("Fullname"));
                    user.setBirthday(rs.getDate("Birthday"));
                    user.setGender(rs.getBoolean("Gender"));
                    user.setMobile(rs.getString("Mobile"));
                    user.setEmail(rs.getString("Email"));
                    user.setRole(rs.getBoolean("Role"));
                    list.add(user);
                }
            }
        }
        return list;
    }
}
