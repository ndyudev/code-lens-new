package com.codelensnew.controller.reporter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

import com.codelensnew.dao.CategoryDAO;
import com.codelensnew.dao.NewsDAO;
import com.codelensnew.dao.impl.CategoryDAOImpl;
import com.codelensnew.dao.impl.NewsDAOImpl;
import com.codelensnew.entity.Category;
import com.codelensnew.entity.News;
import com.codelensnew.entity.User;

@MultipartConfig // servlet xử lý file phải có annotation này
@WebServlet({ 
    "/reporter/news", 
    "/reporter/news/edit/*", 
    "/reporter/news/create", 
    "/reporter/news/update",
    "/reporter/news/delete", 
    "/reporter/news/reset" 
})
public class NewsServlet extends HttpServlet {
    private NewsDAO newsDAO = new NewsDAOImpl();
    private CategoryDAO categoryDAO = new CategoryDAOImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Lấy thông tin trên form lưu vào biến form
        News form = new News();
        String message = "";
        String path = request.getServletPath();
        
        // Xử lý GET request cho edit và delete trước
        if (path.contains("edit")) {
            String id = request.getPathInfo().substring(1);
            try {
                form = newsDAO.findById(id);
                if (form == null) {
                    message = "❌ Không tìm thấy bài viết";
                    form = new News();
                }
            } catch (SQLException e) {
                message = "❌ Lỗi: " + e.getMessage();
                form = new News();
            }
        } else if (path.contains("delete")) {
            String id = request.getParameter("id");
            try {
                newsDAO.delete(id);
                message = "✅ Xóa bài viết thành công!";
                form = new News();
            } catch (SQLException e) {
                // Silent fail
                message = "❌ Lỗi: " + e.getMessage();
            }
        } else if (path.contains("create") || path.contains("update")) {
            // Chỉ populate form cho POST request (create/update)
            try {
                // Cấu hình DateConverter
                DateConverter dateConverter = new DateConverter();
                dateConverter.setPattern("yyyy-MM-dd"); // format giống input HTML
                ConvertUtils.register(dateConverter, java.util.Date.class);
                
                // Populate form với BeanUtils
                BeanUtils.populate(form, request.getParameterMap());
                
                // Xử lý các trường đặc biệt - Mặc định chưa duyệt
                form.setHome(false); // Reporter không thể tự duyệt bài viết
                
                // Set postedDate mặc định nếu chưa có
                if (form.getPostedDate() == null) {
                    form.setPostedDate(new Date());
                }
                
                // Set viewCount mặc định
                if (form.getViewCount() == 0) {
                    form.setViewCount(0);
                }
                
                // Lấy user từ session để set author
                User currentUser = (User) request.getSession().getAttribute("user");
                if (currentUser != null) {
                    form.setAuthor(currentUser.getId());
                }
                
                // Xử lý upload file
                Part part = request.getPart("imageFile");
                if (part != null && part.getSize() > 0) {
                    try {
                        // Lấy đường dẫn vật lý của thư mục images trong project đã deploy
                        String uploadPath = request.getServletContext().getRealPath("images");
                        
                        // Tạo thư mục images nếu chưa có
                        File dir = new File(uploadPath);
                        if (!dir.exists()) {
                            dir.mkdirs();
                        }
                        
                        // Lấy tên file và tạo tên file unique
                        String originalFilename = part.getSubmittedFileName();
                        if (originalFilename != null && !originalFilename.isEmpty()) {
                            // Tạo tên file unique với timestamp
                            String extension = "";
                            int lastDotIndex = originalFilename.lastIndexOf('.');
                            if (lastDotIndex > 0) {
                                extension = originalFilename.substring(lastDotIndex);
                            }
                            String filename = System.currentTimeMillis() + extension;
                            
                            // Ghi file vào thư mục images
                            String fullPath = uploadPath + File.separator + filename;
                            part.write(fullPath);
                            
                            // Set tên file vào form
                            form.setImage(filename);
                        }
                        
                    } catch (Exception e) {
                        // Silent fail
                        message = "❌ Lỗi upload ảnh: " + e.getMessage();
                    }
                }
                
            } catch (IllegalAccessException | InvocationTargetException e) {
                // Silent fail
            }
        }
        
        // Xử lý POST request cho create và update
        if (path.contains("create")) {
            try {
                // Kiểm tra ID có được nhập không
                if (form.getId() == null || form.getId().trim().isEmpty()) {
                    message = "❌ Vui lòng nhập ID bài viết!";
                } else {
                    // Kiểm tra ID đã tồn tại chưa
                    if (newsDAO.exists(form.getId())) {
                        message = "❌ ID bài viết đã tồn tại! Vui lòng chọn ID khác.";
                    } else {
                        newsDAO.insert(form);
                        message = "✅ Thêm bài viết thành công!";
                        form = new News();
                    }
                }
            } catch (SQLException e) {
                // Silent fail
                message = "❌ Lỗi: " + e.getMessage();
            }
        } else if (path.contains("update")) {
            try {
                newsDAO.update(form);
                message = "✅ Cập nhật bài viết thành công!";
                form = new News();
            } catch (SQLException e) {
                // Silent fail
                message = "❌ Lỗi: " + e.getMessage();
            }
        } else if (!path.contains("edit") && !path.contains("delete")) {
            form = new News();
        }
        
        // Set dữ liệu vào request
        request.setAttribute("item", form);
        
        // Load danh sách bài viết của reporter hiện tại
        List<News> list = null;
        try {
            User currentUser = (User) request.getSession().getAttribute("user");
            if (currentUser != null) {
                list = newsDAO.findByAuthor(currentUser.getId());
            } else {
                list = new ArrayList<>(); // Empty list nếu chưa đăng nhập
            }
        } catch (SQLException e) {
                        // Silent fail
            message = "❌ Lỗi khi tải danh sách bài viết: " + e.getMessage();
        }
        request.setAttribute("list", list);
        
        // Load danh sách categories
        List<Category> categories = null;
        try {
            categories = categoryDAO.findAll();
        } catch (SQLException e) {
                        // Silent fail
        }
        request.setAttribute("categories", categories);
        
        request.setAttribute("message", message);
        request.setAttribute("page", "post");
        
        request.getRequestDispatcher("/views/layouts/reporter/layoutReporter.jsp").forward(request, response);
    }
}
