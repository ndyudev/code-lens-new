package com.codelensnew.controller.admin;

import com.codelensnew.dao.UserDAO;
import com.codelensnew.dao.impl.UserDAOImpl;
import com.codelensnew.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

@WebServlet({ 
    "/admin/user", 
    "/admin/user/edit/*", 
    "/admin/user/create",
    "/admin/user/update",
    "/admin/user/delete", 
    "/admin/user/reset" 
})
public class UserServlet extends HttpServlet {
    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set encoding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        // Lấy thông tin trên form lưu vào biến form
        User form = new User();
        String message = "";
        
        try {
            // Cấu hình DateConverter
            DateConverter dateConverter = new DateConverter();
            dateConverter.setPattern("yyyy-MM-dd");
            ConvertUtils.register(dateConverter, Date.class);
            
            // Populate form với BeanUtils
            BeanUtils.populate(form, request.getParameterMap());
        } catch (IllegalAccessException | InvocationTargetException e) {
            // Silent fail
        }
        
        // Tạo đối tượng truy cập table User
        UserDAO dao = new UserDAOImpl();
        
        String path = request.getServletPath();
        if (path.contains("edit")) {
            // Lấy ID từ URL path
            String userId = request.getPathInfo();
            if (userId != null && userId.length() > 1) {
                userId = userId.substring(1); // Bỏ dấu "/"
                try {
                    form = dao.findById(userId);
                } catch (Exception e) {
                    message = "Không tìm thấy người dùng";
                    form = new User();
                }
            }
        } else if (path.contains("create")) {
            try {
                dao.insert(form);
                message = "✅ Thêm người dùng thành công!";
                form = new User();
            } catch (Exception e) {
                message = "❌ Trùng khóa chính hoặc lỗi: " + e.getMessage();
            }
        } else if (path.contains("update")) {
            try {
                dao.update(form);
                message = "✅ Cập nhật người dùng thành công!";
                form = new User();
            } catch (Exception e) {
                message = "❌ Lỗi: " + e.getMessage();
            }
        } else if (path.contains("delete")) {
            try {
                String userId = request.getParameter("id");
                if (userId != null && !userId.isEmpty()) {
                    dao.delete(userId);
                    message = "✅ Xóa người dùng thành công!";
                } else {
                    message = "❌ Không tìm thấy ID người dùng";
                }
                form = new User();
            } catch (Exception e) {
                // Silent fail
                message = "❌ Lỗi: " + e.getMessage();
            }
        } else {
            form = new User();
        }
        
        // Set dữ liệu vào request
        request.setAttribute("item", form);
        request.setAttribute("editingUser", form);
        request.setAttribute("message", message);
        
        try {
            List<User> list = dao.findAll();
            request.setAttribute("allUsers", list);
        } catch (Exception e) {
            // Silent fail
            request.setAttribute("allUsers", new java.util.ArrayList<>());
        }
        
        // Forward đến trang JSP
        request.setAttribute("page", "user-management");
        request.getRequestDispatcher("/views/layouts/admin/layoutAdmin.jsp").forward(request, response);
    }
}
