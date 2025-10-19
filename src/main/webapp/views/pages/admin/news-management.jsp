<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="https://kit.fontawesome.com/f4e3fc99b3.js" crossorigin="anonymous"></script>

<main class="nm-wrapper">
    <!-- Header -->
    <header class="nm-header">
        <h1><i class="fa-solid fa-newspaper"></i> Quản Lý Tin Tức</h1>
        <p>Duyệt và quản lý tất cả bài viết <i class="fa-solid fa-list-check"></i></p>
    </header>

    <!-- Filter Section -->
    <div class="nm-filter-section">
        <form method="get" action="${pageContext.request.contextPath}/admin/news-management">
            <div class="nm-filter-controls">
                <div class="nm-group">
                    <label for="statusFilter">
                        <i class="fa-solid fa-filter"></i> Trạng thái:
                    </label>
                    <select id="statusFilter" name="statusFilter">
                        <option value="all" ${param.statusFilter == 'all' ? 'selected' : ''}>
                            Tất cả bài viết
                        </option>
                        <option value="pending" ${param.statusFilter == 'pending' ? 'selected' : ''}>
                            Chờ duyệt
                        </option>
                        <option value="approved" ${param.statusFilter == 'approved' ? 'selected' : ''}>
                            Đã duyệt
                        </option>
                    </select>
                </div>
                
                <div class="nm-group">
                    <label for="authorFilter">
                        <i class="fa-solid fa-user"></i> Tác giả:
                    </label>
                    <select id="authorFilter" name="authorFilter">
                        <option value="all" ${param.authorFilter == 'all' ? 'selected' : ''}>
                            Tất cả tác giả
                        </option>
                        <c:forEach var="author" items="${authors}">
                            <option value="${author}" ${param.authorFilter == author ? 'selected' : ''}>
                                ${author}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="nm-group">
                    <label for="categoryFilter">
                        <i class="fa-solid fa-tags"></i> Danh mục:
                    </label>
                    <select id="categoryFilter" name="categoryFilter">
                        <option value="all" ${param.categoryFilter == 'all' ? 'selected' : ''}>
                            Tất cả danh mục
                        </option>
                        <c:forEach var="category" items="${categories}">
                            <option value="${category.id}" ${param.categoryFilter == category.id ? 'selected' : ''}>
                                ${category.name}
                            </option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="nm-group">
                    <button type="submit" class="btn filter" title="Lọc bài viết">
                        <i class="fa-solid fa-search"></i>
                    </button>
                    <a href="${pageContext.request.contextPath}/admin/news-management" 
                       class="btn clear" title="Xóa bộ lọc">
                        <i class="fa-solid fa-times"></i>
                    </a>
                </div>
            </div>
        </form>
    </div>

    <!-- Hiển thị thông báo -->
    <c:if test="${not empty message}">
        <div class="alert ${message.startsWith('✅') ? 'success' : 'error'}">
            ${message}
        </div>
    </c:if>

    <!-- Table Section -->
    <div class="nm-table-section">
        <h2><i class="fa-solid fa-list"></i> Danh sách Bài viết</h2>
        <table class="nm-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tiêu đề</th>
                    <th>Tác giả</th>
                    <th>Ngày đăng</th>
                    <th>Danh mục</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody id="newsTableBody">
                <c:choose>
                    <c:when test="${not empty allNews}">
                        <c:forEach var="news" items="${allNews}">
                            <tr>
                                <td>${news.id}</td>
                                <td class="title-cell">
                                    <strong>${news.title}</strong>
                                </td>
                                <td>${news.author}</td>
                                <td>
                                    <fmt:formatDate value="${news.postedDate}" pattern="dd/MM/yyyy"/>
                                </td>
                                <td>
                                    <c:set var="categoryName" value="N/A"/>
                                    <c:forEach var="cat" items="${categories}">
                                        <c:if test="${cat.id == news.categoryId}">
                                            <c:set var="categoryName" value="${cat.name}"/>
                                        </c:if>
                                    </c:forEach>
                                    <span class="category-tag">${categoryName}</span>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${news.home}">
                                            <span class="status approved">
                                                <i class="fa-solid fa-check-circle"></i> Đã duyệt
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="status pending">
                                                <i class="fa-solid fa-clock"></i> Chờ duyệt
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="tbl-action">
                                    <a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=${news.id}" 
                                       class="tbl-btn view" title="Xem chi tiết" target="_blank">
                                        <i class="fa-solid fa-eye"></i>
                                    </a>
                                    <c:choose>
                                        <c:when test="${!news.home}">
                                            <a href="${pageContext.request.contextPath}/admin/news-management/approve/${news.id}" 
                                               class="tbl-btn approve" title="Duyệt bài">
                                                <i class="fa-solid fa-check"></i>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${pageContext.request.contextPath}/admin/news-management/reject/${news.id}" 
                                               class="tbl-btn reject" title="Hủy duyệt">
                                                <i class="fa-solid fa-undo"></i>
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                    <a href="${pageContext.request.contextPath}/admin/news-management/delete/${news.id}" 
                                       class="tbl-btn delete" title="Xóa bài viết">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="7" class="empty-state">
                                <i class="fa-solid fa-inbox"></i> Không có bài viết nào!
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</main>