package com.codelensnew.controller.admin;

import com.codelensnew.dao.CategoryDAO;
import com.codelensnew.dao.impl.CategoryDAOImpl;
import com.codelensnew.entity.Category;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

@WebServlet({ 
    "/admin/category", 
    "/admin/category/edit/*", 
    "/admin/category/create",
    "/admin/category/update",
    "/admin/category/delete", 
    "/admin/category/reset" 
})
public class CategoryServlet extends HttpServlet {
    private CategoryDAO categoryDAO = new CategoryDAOImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set encoding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        // Lấy thông tin trên form lưu vào biến form
        Category form = new Category();
        String message = "";
        String path = request.getServletPath();
        
        // Populate form với BeanUtils (giống UserServlet và NewsServlet)
        try {
            BeanUtils.populate(form, request.getParameterMap());
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // Xử lý GET request cho edit và delete trước
        if (path.contains("edit")) {
            String id = request.getPathInfo().substring(1);
            try {
                form = categoryDAO.findById(id);
                if (form == null) {
                    message = "❌ Không tìm thấy danh mục";
                    form = new Category();
                }
            } catch (Exception e) {
                message = "❌ Lỗi: " + e.getMessage();
                form = new Category();
            }
        } else if (path.contains("delete")) {
            String id = request.getParameter("id");
            try {
                int result = categoryDAO.delete(id);
                if (result > 0) {
                    message = "✅ Xóa danh mục thành công!";
                } else {
                    message = "❌ Xóa danh mục thất bại!";
                }
                form = new Category();
            } catch (Exception e) {
                message = "❌ Lỗi: " + e.getMessage();
            }
        }
        
        // Xử lý POST request cho create và update
        if (path.contains("create")) {
            try {
                // Kiểm tra ID có được nhập không
                if (form.getId() == null || form.getId().trim().isEmpty()) {
                    message = "❌ Vui lòng nhập ID danh mục!";
                } else {
                    // Kiểm tra ID đã tồn tại chưa
                    if (categoryDAO.exists(form.getId())) {
                        message = "❌ ID danh mục đã tồn tại! Vui lòng chọn ID khác.";
                    } else {
                        int result = categoryDAO.insert(form);
                        if (result > 0) {
                            message = "✅ Thêm danh mục thành công!";
                            form = new Category();
                        } else {
                            message = "❌ Thêm danh mục thất bại!";
                        }
                    }
                }
            } catch (Exception e) {
                message = "❌ Lỗi: " + e.getMessage();
            }
        } else if (path.contains("update")) {
            try {
                int result = categoryDAO.update(form);
                if (result > 0) {
                    message = "✅ Cập nhật danh mục thành công!";
                    form = new Category();
                } else {
                    message = "❌ Cập nhật danh mục thất bại!";
                }
            } catch (Exception e) {
                message = "❌ Lỗi: " + e.getMessage();
            }
        } else if (!path.contains("edit") && !path.contains("delete")) {
            form = new Category();
        }
        
        // Set dữ liệu vào request
        request.setAttribute("item", form);
        request.setAttribute("editingCategory", form);
        request.setAttribute("message", message);
        
        // Load danh sách categories
        try {
            List<Category> categories = categoryDAO.findAll();
            request.setAttribute("categories", categories);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        // Forward đến AdminServlet với page=category-management
        request.setAttribute("page", "category-management");
        request.getRequestDispatcher("/views/layouts/admin/layoutAdmin.jsp").forward(request, response);
    }
}