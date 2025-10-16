package com.codelensnew.dao;

import java.util.List;

import com.codelensnew.common.dao.BaseDAO;
import com.codelensnew.entity.Category;

/**
 * DAO cho bảng Category, kế thừa từ BaseDAO
 */
public interface CategoryDAO extends BaseDAO<Category, String> {

    /**
     * Tìm danh sách Category theo tên (ví dụ mở rộng thêm).
     *
     * @param keyword từ khóa tên cần tìm
     * @return danh sách category thỏa điều kiện
     */
    List<Category> searchByName(String keyword);

    // Bạn có thể thêm các phương thức đặc thù ở đây nếu cần
}
