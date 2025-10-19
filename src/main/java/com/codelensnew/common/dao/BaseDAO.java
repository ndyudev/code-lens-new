package com.codelensnew.common.dao;

import java.sql.SQLException;
import java.util.List;

/**
 * Giao diện cơ sở dùng cho tất cả các DAO.
 *
 * @param <T>  Kiểu của thực thể (entity)
 * @param <ID> Kiểu của khóa chính (primary key)
 */
public interface BaseDAO<T, ID> {

    /**
     * Lấy toàn bộ bản ghi.
     *
     * @return danh sách đối tượng
     * @throws SQLException nếu có lỗi database
     */
    List<T> findAll() throws SQLException;

    /**
     * Tìm bản ghi theo ID.
     *
     * @param id ID cần tìm
     * @return đối tượng nếu tìm thấy, ngược lại trả về null
     * @throws SQLException nếu có lỗi database
     */
    T findById(ID id) throws SQLException;

    /**
     * Thêm một bản ghi mới.
     *
     * @param entity đối tượng cần thêm
     * @return số bản ghi bị ảnh hưởng (1 nếu thành công)
     * @throws SQLException nếu có lỗi database
     */
    int insert(T entity) throws SQLException;

    /**
     * Cập nhật bản ghi hiện có.
     *
     * @param entity đối tượng chứa thông tin cập nhật
     * @return số bản ghi bị ảnh hưởng (0 nếu không tìm thấy, 1 nếu thành công)
     * @throws SQLException nếu có lỗi database
     */
    int update(T entity) throws SQLException;

    /**
     * Xóa bản ghi theo ID.
     *
     * @param id ID bản ghi cần xóa
     * @return số bản ghi bị ảnh hưởng (0 nếu không tìm thấy, 1 nếu xóa thành công)
     * @throws SQLException nếu có lỗi database
     */
    int delete(ID id) throws SQLException;

    /**
     * Kiểm tra xem bản ghi có tồn tại hay không.
     *
     * @param id ID cần kiểm tra
     * @return true nếu tồn tại, false nếu không
     * @throws SQLException nếu có lỗi database
     */
    boolean exists(ID id) throws SQLException;
}