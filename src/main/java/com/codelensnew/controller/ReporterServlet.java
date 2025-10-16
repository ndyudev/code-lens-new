package com.codelensnew.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Reporter")
public class ReporterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ReporterServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nhận tham số ?page=
        String page = request.getParameter("page");
        if (page == null || page.isEmpty()) {
            page = "dashboard";
        }

        // Truyền page xuống JSP
        request.setAttribute("page", page);

        // Forward đến layout chính của reporter
        request.getRequestDispatcher("/views/layouts/reporter/layoutReporter.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
