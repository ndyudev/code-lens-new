package com.codelensnew.dao;


import java.util.List;

import com.codelensnew.common.dao.BaseDAO;
import com.codelensnew.entity.News;

/**
 * Giao diện DAO cho bảng News, mở rộng từ BaseDAO để dùng chung CRUD
 */
public interface NewsDAO extends BaseDAO<News, String> {

    /**
     * Lấy danh sách tin hiển thị ngoài trang chủ (home = 1).
     *
     * @return danh sách tin hiển thị ngoài trang chủ
     */
    List<News> getAllNewsByHome();

    /**
     * Lấy top 5 bài viết có lượt xem cao nhất.
     *
     * @return danh sách 5 bài viết được xem nhiều nhất
     */
    List<News> getTop5ViewsCount();

    /**
     * Lấy top 5 bài viết mới nhất.
     *
     * @return danh sách 5 bài viết mới nhất
     */
    List<News> getTop5NewsLatest();

    /**
     * Lấy top 5 bài viết được xem nhiều nhất trong danh sách đã cho.
     *
     * @param ids danh sách ID bài viết
     * @return danh sách top 5 trong số đó có lượt xem cao nhất
     */
    List<News> getTop5NewsViewed(List<String> ids);

    /**
     * Lấy tất cả bài viết thuộc một danh mục cụ thể.
     *
     * @param categoryId ID danh mục
     * @return danh sách bài viết theo danh mục
     */
    List<News> getNewsByCategory(String categoryId);

    /**
     * Cập nhật số lượt xem (viewCount + 1) cho bài viết.
     *
     * @param id ID bài viết
     * @return true nếu cập nhật thành công
     */
    boolean updateViewCount(String id);

    /**
     * Lấy tất cả bài viết theo tác giả.
     *
     * @param author tên người viết
     * @return danh sách bài viết của tác giả đó
     */
    List<News> getNewsByAuthor(String author);

    /**
     * Kiểm tra xem có bài viết nào thuộc danh mục này không.
     *
     * @param categoryId ID danh mục
     * @return true nếu có bài viết thuộc danh mục, false nếu không
     */
    boolean existsByCategoryId(String categoryId);

    /**
     * Kiểm tra xem tác giả có bài viết nào không.
     *
     * @param author tên tác giả
     * @return true nếu có bài viết của tác giả, false nếu không
     */
    boolean existsByAuthorId(String author);
}
