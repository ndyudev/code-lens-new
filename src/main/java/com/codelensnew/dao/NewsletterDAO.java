package com.codelensnew.dao;

import java.util.List;

import com.codelensnew.common.dao.BaseDAO;
import com.codelensnew.entity.Newsletter;

/**
 * Giao diện DAO cho bảng Newsletter.
 * Kế thừa BaseDAO để dùng sẵn các thao tác CRUD cơ bản.
 */
public interface NewsletterDAO extends BaseDAO<Newsletter, String> {

    /**
     * Tìm bản ghi theo địa chỉ email.
     *
     * @param email địa chỉ email cần tìm
     * @return newsletter nếu tồn tại, ngược lại trả về null
     */
    Newsletter findByEmail(String email);

    /**
     * Kiểm tra địa chỉ email đã tồn tại trong hệ thống hay chưa.
     *
     * @param email địa chỉ email cần kiểm tra
     * @return true nếu đã tồn tại, false nếu chưa
     */
    boolean isEmailExists(String email);

    /**
     * Lấy danh sách newsletter đang hoạt động (enabled = true).
     *
     * @return danh sách newsletter đã bật
     */
    List<Newsletter> findAllEnabled();
}
