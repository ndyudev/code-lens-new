package com.codelensnew.dao;

import com.codelensnew.common.dao.BaseDAO;
import com.codelensnew.entity.Category;

import java.sql.SQLException;
import java.util.List;

public interface CategoryDAO extends BaseDAO<Category, String> {
    
    /**
     * Kiểm tra category name đã tồn tại chưa
     * @param categoryName
     * @return boolean
     * @throws SQLException 
     */
    boolean existsByCategoryName(String categoryName) throws SQLException;
    
    /**
     * Kiểm tra category name đã tồn tại chưa (trừ category hiện tại)
     * @param categoryName
     * @param categoryId
     * @return boolean
     * @throws SQLException 
     */
    boolean existsByCategoryNameExcludeId(String categoryName, String categoryId) throws SQLException;
    
    /**
     * Kiểm tra category có đang được sử dụng trong bảng NEWS không
     * @param categoryId
     * @return boolean
     * @throws SQLException 
     */
    boolean isCategoryInUse(String categoryId) throws SQLException;
    
    /**
     * Lấy danh sách danh mục nổi bật (4 danh mục có nhiều tin tức nhất)
     * @param limit số lượng danh mục cần lấy
     * @return List<Category>
     * @throws SQLException 
     */
    List<Category> findFeaturedCategories(int limit) throws SQLException;
}