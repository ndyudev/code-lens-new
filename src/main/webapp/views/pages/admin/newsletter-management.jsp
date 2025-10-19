<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<main class="nl-wrapper">
    <header class="nl-header">
        <h1><i class="fa-solid fa-envelope-open-text"></i> Newsletter Subscriptions</h1>
        <p>Quản lý danh sách email nhận tin mới nhất 💌</p>
        
        <c:if test="${not empty message}">
            <div class="message" style="background: #d4edda; color: #155724; padding: 10px; border-radius: 5px; margin: 10px 0; border: 1px solid #c3e6cb;">
                ${message}
            </div>
        </c:if>
    </header>

    <section class="nl-form">
        <h2><i class="fa-solid fa-plus-circle"></i> Thêm / Cập nhật Email</h2>
        
        
        <!-- Form thêm mới -->
        <form method="post" action="${pageContext.request.contextPath}/admin/newsletter/create">
            <div class="nl-grid">
                <div class="nl-group">
                    <label><i class="fa-solid fa-at"></i> Email</label>
                    <input type="email" name="email" value="${editingNewsletter.email}" placeholder="example@gmail.com" required>
                </div>
                <div class="nl-group">
                    <label><i class="fa-solid fa-toggle-on"></i> Trạng thái</label>
                    <select name="enabled" required>
                        <option value="1" ${editingNewsletter.enabled ? 'selected' : ''}>Hiệu lực</option>
                        <option value="0" ${!editingNewsletter.enabled ? 'selected' : ''}>Không hiệu lực</option>
                    </select>
                </div>
            </div>
            <div class="nl-actions">
                <button class="btn add" type="submit"><i class="fa-solid fa-plus"></i> Thêm</button>
                <button class="btn update" type="submit" formaction="${pageContext.request.contextPath}/admin/newsletter/update"><i class="fa-solid fa-save"></i> Cập nhật</button>
                <button class="btn clear" type="reset"><i class="fa-solid fa-eraser"></i> Clear</button>
            </div>
        </form>
        
    </section>

    <section class="nl-table">
        <h2><i class="fa-solid fa-list"></i> Danh sách đăng ký</h2>
        <table>
            <thead>
                <tr>
                    <th>Email</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty newsletters}">
                        <c:forEach var="newsletter" items="${newsletters}">
                            <tr>
                                <td>${newsletter.email}</td>
                                <td>
                                    <span class="badge ${newsletter.enabled ? 'active' : 'inactive'}">
                                        ${newsletter.enabled ? 'Hiệu lực' : 'Không hiệu lực'}
                                    </span>
                                </td>
                                <td class="tbl-action">
                                    <a href="${pageContext.request.contextPath}/admin/newsletter/edit/${newsletter.email}" 
                                       class="tbl-btn edit" 
                                       title="Sửa">
                                        <i class="fa-solid fa-pen"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/newsletter/delete/${newsletter.email}" 
                                       class="tbl-btn delete" 
                                       title="Xóa">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="3" class="empty-state">
                                <i class="fa-solid fa-inbox"></i>
                                <p>Chưa có email nào đăng ký nhận tin</p>
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </section>
</main>

<style>
.tbl-action a {
    display: inline-block;
    margin: 0 2px;
    text-decoration: none;
}

.tbl-btn {
    padding: 6px 8px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 12px;
    transition: all 0.3s ease;
}

.tbl-btn.edit {
    background-color: #007bff;
    color: white;
}

.tbl-btn.edit:hover {
    background-color: #0056b3;
}

.tbl-btn.delete {
    background-color: #dc3545;
    color: white;
}

.tbl-btn.delete:hover {
    background-color: #c82333;
}

.nl-actions .btn {
    flex: 1;
    padding: 10px 0;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 0.9rem;
    font-weight: 500;
    color: #fff;
    transition: background-color 0.3s ease;
    margin: 0 5px;
}

.nl-actions .btn.add {
    background: #28a745;
}

.nl-actions .btn.add:hover {
    background: #218838;
}

.nl-actions .btn.update {
    background: #007bff;
}

.nl-actions .btn.update:hover {
    background: #0056b3;
}

.nl-actions .btn.clear {
    background: #6c757d;
}

.nl-actions .btn.clear:hover {
    background: #5a6268;
}
</style>
