<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<main class="post-container">
        <!-- Header -->
        <header class="header">
            <h1><i class="fa-solid fa-newspaper"></i> Quản Lý Bài Viết</h1>
            <p>Đăng tải và quản lý bài viết của bạn <i class="fa-solid fa-edit"></i></p>
        </header>

        <!-- Thông báo -->
        <c:if test="${not empty message}">
            <div class="alert ${message.startsWith('✅') ? 'success' : 'error'}">
                <i class="fa-solid ${message.startsWith('✅') ? 'fa-check-circle' : 'fa-exclamation-circle'}"></i>
                ${message}
            </div>
        </c:if>

        <!-- Form đăng bài -->
        <div class="form-section">
            <h2><i class="fa-solid fa-pen-to-square"></i> Thông tin bài viết</h2>
            <form method="post" action="${pageContext.request.contextPath}/reporter/news/create" enctype="multipart/form-data" class="news-form">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="id"><i class="fa-solid fa-hashtag"></i> ID Bài viết</label>
                        <input type="text" id="id" name="id" value="${item.id}" placeholder="Nhập ID bài viết (ví dụ: NEWS001)" required oninput="this.value = this.value.toUpperCase()">
                    </div>
                    
                    <div class="form-group full-width">
                        <label for="title"><i class="fa-solid fa-heading"></i> Tiêu đề</label>
                        <input type="text" id="title" name="title" value="${item.title}" placeholder="Nhập tiêu đề bài viết" required>
                    </div>
                    
                    <div class="form-group full-width">
                        <label for="content"><i class="fa-solid fa-align-left"></i> Nội dung</label>
                        <textarea id="content" name="content" placeholder="Nhập nội dung bài viết" required>${item.content}</textarea>
                    </div>
                    
                    <div class="form-group">
                        <label for="categoryId"><i class="fa-solid fa-tags"></i> Danh mục</label>
                        <select id="categoryId" name="categoryId" required>
                            <option value="">-- Chọn danh mục --</option>
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.id}" ${item.categoryId == category.id ? 'selected' : ''}>
                                    ${category.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="postedDate"><i class="fa-solid fa-calendar"></i> Ngày đăng</label>
                        <input type="date" id="postedDate" name="postedDate" value="<fmt:formatDate value='${item.postedDate}' pattern='yyyy-MM-dd'/>" required>
                    </div>
                    
                    <div class="form-group full-width">
                        <label for="imageFile"><i class="fa-solid fa-image"></i> Hình ảnh</label>
                        <input type="file" id="imageFile" name="imageFile" accept="image/*" onchange="previewImage(this)" required>
                        <input type="hidden" name="image" value="${item.image}">
                        
                        <small class="form-text">Chọn file ảnh (JPG, PNG, GIF) - Tối đa 5MB</small>
                        
                        <c:if test="${not empty item.image}">
                            <div class="current-image">
                                <p><strong>Hình hiện tại:</strong> ${item.image}</p>
                                <img src="${pageContext.request.contextPath}/images/${item.image}" alt="Current image" style="max-width: 200px; max-height: 150px;">
                            </div>
                        </c:if>
                        
                        <div id="imagePreview" class="image-preview" style="display: none;">
                            <p><strong>Hình mới:</strong></p>
                            <img id="preview" alt="Preview" style="max-width: 200px; max-height: 150px;">
                        </div>
                    </div>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">
                        <i class="fa-solid fa-plus"></i> Đăng bài
                    </button>
                    <button type="submit" formaction="${pageContext.request.contextPath}/reporter/news/update" class="btn btn-secondary">
                        <i class="fa-solid fa-save"></i> Cập nhật
                    </button>
                    <button type="reset" class="btn btn-outline">
                        <i class="fa-solid fa-eraser"></i> Làm mới
                    </button>
                </div>
            </form>
        </div>

        <!-- Danh sách bài viết -->
        <div class="table-section">
            <h2><i class="fa-solid fa-list"></i> Danh sách bài viết</h2>
            
            <c:choose>
                <c:when test="${not empty list}">
                    <div class="table-responsive">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Tiêu đề</th>
                                    <th>Tác giả</th>
                                    <th>Ngày đăng</th>
                                    <th>Danh mục</th>
                                    <th>Lượt xem</th>
                                    <th>Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="news" items="${list}">
                                    <tr>
                                        <td>${news.id}</td>
                                        <td class="title-cell">${news.title}</td>
                                        <td>${news.author}</td>
                                        <td><fmt:formatDate value="${news.postedDate}" pattern="dd/MM/yyyy"/></td>
                                        <td>
                                            <c:forEach var="category" items="${categories}">
                                                <c:if test="${category.id == news.categoryId}">
                                                    ${category.name}
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>${news.viewCount}</td>
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
                                            <a href="${pageContext.request.contextPath}/reporter/news/edit/${news.id}" 
                                               class="tbl-btn edit" title="Sửa">
                                                <i class="fa-solid fa-pen"></i>
                                            </a>
                                            <a href="${pageContext.request.contextPath}/reporter/news/delete?id=${news.id}" 
                                               class="tbl-btn delete" title="Xóa">
                                                <i class="fa-solid fa-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <i class="fa-solid fa-inbox"></i>
                        <h3>Chưa có bài viết nào</h3>
                        <p>Hãy đăng bài viết đầu tiên của bạn!</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
</div>
</main>