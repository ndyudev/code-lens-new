package com.codelensnew.dao;

import java.sql.SQLException;

import com.codelensnew.common.dao.BaseDAO;
import com.codelensnew.entity.User;

/**
 * Giao diện DAO cho bảng User.
 * Kế thừa BaseDAO để dùng sẵn các thao tác CRUD cơ bản.
 */
public interface UserDAO extends BaseDAO<User, String> {

    /**
     * Kiểm tra đăng nhập bằng username và password.
     *
     * @param username tên đăng nhập
     * @param password mật khẩu
     * @return User nếu đúng thông tin, null nếu sai
     * @throws SQLException nếu có lỗi database
     */
    User findByUsernameAndPassword(String username, String password) throws SQLException;

    /**
     * Cập nhật mật khẩu cho user.
     *
     * @param userId ID của user
     * @param newPassword mật khẩu mới
     * @return true nếu cập nhật thành công, false nếu thất bại
     * @throws SQLException nếu có lỗi database
     */
    boolean updatePassword(String userId, String newPassword) throws SQLException;
}