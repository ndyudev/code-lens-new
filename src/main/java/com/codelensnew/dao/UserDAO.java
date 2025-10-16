package com.codelensnew.dao;

import java.util.Optional;

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
     * @return Optional chứa User nếu đúng thông tin, rỗng nếu sai
     */
    Optional<User> checkLogin(String username, String password);
}