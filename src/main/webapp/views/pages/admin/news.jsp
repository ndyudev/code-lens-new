<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<main class="nm-wrapper">
    <header class="nm-header">
        <h1><i class="fa-solid fa-newspaper"></i> Quản Lý Tin Tức</h1>
        <p>Quản lý danh sách bài viết mới nhất 📰</p>
    </header>

    <!-- Hiển thị thông báo -->
    <c:if test="${not empty message}">
        <div class="alert ${message.contains('thành công') ? 'alert-success' : 'alert-error'}">
            ${message}
        </div>
    </c:if>

    <!-- Filter Section -->
    <section class="nm-filter-section">
        <h2><i class="fa-solid fa-filter"></i> Lọc bài viết</h2>
        <form method="get" action="${pageContext.request.contextPath}/AdminServlet">
            <input type="hidden" name="page" value="news-management">
            <div class="nm-filter-controls">
                <div class="nm-group">
                    <label><i class="fa-solid fa-check-circle"></i> Trạng thái</label>
                    <select name="statusFilter">
                        <option value="all" ${param.statusFilter == 'all' ? 'selected' : ''}>Tất cả</option>
                        <option value="approved" ${param.statusFilter == 'approved' ? 'selected' : ''}>Đã duyệt</option>
                        <option value="pending" ${param.statusFilter == 'pending' ? 'selected' : ''}>Chờ duyệt</option>
                    </select>
                </div>
                <div class="nm-group">
                    <label><i class="fa-solid fa-user"></i> Tác giả</label>
                    <select name="authorFilter">
                        <option value="all" ${param.authorFilter == 'all' ? 'selected' : ''}>Tất cả</option>
                        <c:forEach var="author" items="${authors}">
                            <option value="${author}" ${param.authorFilter == author ? 'selected' : ''}>${author}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="nm-group">
                    <label><i class="fa-solid fa-folder"></i> Danh mục</label>
                    <select name="categoryFilter">
                        <option value="all" ${param.categoryFilter == 'all' ? 'selected' : ''}>Tất cả</option>
                        <c:forEach var="category" items="${categories}">
                            <option value="${category.id}" ${param.categoryFilter == category.id ? 'selected' : ''}>${category.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="nm-group">
                    <button type="submit" class="btn filter"><i class="fa-solid fa-search"></i> Lọc</button>
                    <a href="${pageContext.request.contextPath}/admin/news-management" class="btn clear">
                        <i class="fa-solid fa-eraser"></i> Xóa bộ lọc
                    </a>
                </div>
            </div>
        </form>
    </section>

    <!-- Table Section -->
    <section class="nm-table-section">
        <h2><i class="fa-solid fa-list"></i> Danh sách bài viết</h2>
        <table class="nm-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tiêu đề</th>
                    <th>Tác giả</th>
                    <th>Danh mục</th>
                    <th>Ngày tạo</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty allNews}">
                        <c:forEach var="news" items="${allNews}">
                            <tr>
                                <td>${news.id}</td>
                                <td class="title-cell" title="${news.title}">
                                    ${fn:length(news.title) > 50 ? fn:substring(news.title, 0, 50) : news.title}${fn:length(news.title) > 50 ? '...' : ''}
                                </td>
                                <td>${news.author}</td>
                                <td>
                                    <c:forEach var="category" items="${categories}">
                                        <c:if test="${category.id == news.categoryId}">${category.name}</c:if>
                                    </c:forEach>
                                </td>
                                <td><fmt:formatDate value="${news.createdDate}" pattern="dd/MM/yyyy"/></td>
                                <td>
                                    <span class="status ${news.home ? 'approved' : 'pending'}">
                                        ${news.home ? 'Đã duyệt' : 'Chờ duyệt'}
                                    </span>
                                </td>
                                <td class="tbl-action">
                                    <c:if test="${!news.home}">
                                        <a href="${pageContext.request.contextPath}/admin/news-management/approve/${news.id}" 
                                           class="tbl-btn approve" title="Duyệt bài">
                                            <i class="fa-solid fa-check"></i>
                                        </a>
                                    </c:if>
                                    <a href="${pageContext.request.contextPath}/admin/news-management/delete/${news.id}" 
                                       class="tbl-btn delete" title="Xóa bài">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="7" style="text-align: center; padding: 40px; color: #666;">
                                <i class="fa-solid fa-inbox" style="font-size: 2rem; margin-bottom: 10px; display: block;"></i>
                                Chưa có bài viết nào
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </section>
</main>

