package com.codelensnew.controller.reporter;

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

@WebServlet({ 
    "/reporter", 
    "/reporter/dashboard"
})
public class ReporterServlet extends HttpServlet {
    private CategoryDAO categoryDAO = new CategoryDAOImpl();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set encoding UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        
        String path = request.getServletPath();
        String page = "dashboard"; // default
        
        // Xác định page từ URL path
        if (path.contains("dashboard")) {
            page = "dashboard";
        }

        // Load categories để hiển thị trong navigation
        try {
            List<Category> categories = categoryDAO.findAll();
            request.setAttribute("categories", categories);
        } catch (Exception e) {
            // Silent fail
        }

        // Set dữ liệu vào request
        request.setAttribute("page", page);

        // Forward đến layout chính của reporter
        request.getRequestDispatcher("/views/layouts/reporter/layoutReporter.jsp").forward(request, response);
    }
}
