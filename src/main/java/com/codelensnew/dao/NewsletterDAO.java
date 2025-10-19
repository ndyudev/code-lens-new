package com.codelensnew.dao;

import com.codelensnew.common.dao.BaseDAO;
import com.codelensnew.entity.Newsletter;
import java.sql.SQLException;
import java.util.List;

public interface NewsletterDAO extends BaseDAO<Newsletter, String> {
    /**
     * Tìm newsletter theo email
     * @param email email cần tìm
     * @return Newsletter nếu tìm thấy, null nếu không
     * @throws SQLException
     */
    Newsletter findByEmail(String email) throws SQLException;
    
    /**
     * Lấy danh sách newsletter đang hoạt động
     * @return List<Newsletter> danh sách newsletter enabled = true
     * @throws SQLException
     */
    List<Newsletter> findActiveNewsletters() throws SQLException;
    
}
