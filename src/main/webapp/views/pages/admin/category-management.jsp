<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/category-management.css">
<script src="https://kit.fontawesome.com/f4e3fc99b3.js" crossorigin="anonymous"></script>

<main class="cm-wrapper">
    <header class="cm-header">
        <h1><i class="fa-solid fa-folder-open"></i> Quản Lý Danh Mục</h1>
        <p>Quản lý danh sách danh mục mới nhất <i class="fa-solid fa-folder"></i></p>
    </header>

    <!-- Hiển thị thông báo -->
    <c:if test="${not empty message}">
        <div class="alert ${message.contains('thành công') ? 'alert-success' : 'alert-error'}">
            ${message}
        </div>
    </c:if>

    <section class="cm-form">
        <h2><i class="fa-solid fa-plus-circle"></i> Thêm / Cập nhật Danh mục</h2>
        <form method="post" action="${pageContext.request.contextPath}/admin/category/create">
            <div class="cm-grid">
                <div class="cm-group">
                    <label><i class="fa-solid fa-id-card"></i> Mã danh mục</label>
                    <input type="text" name="id" value="${editingCategory.id}" placeholder="VD: CAT001" required>
                </div>
                <div class="cm-group">
                    <label><i class="fa-solid fa-tag"></i> Tên danh mục</label>
                    <input type="text" name="name" value="${editingCategory.name}" placeholder="VD: Công nghệ" required>
                </div>
            </div>
            <div class="cm-actions">
                <button class="btn btn-primary" type="submit">
                    <i class="fa-solid fa-plus"></i> Thêm
                </button>
                <button class="btn btn-secondary" type="button" onclick="updateCategory()">
                    <i class="fa-solid fa-save"></i> Cập nhật
                </button>
                <button class="btn btn-outline" type="button" onclick="resetForm()">
                    <i class="fa-solid fa-eraser"></i> Clear
                </button>
            </div>
        </form>
        
        <!-- Form ẩn cho update -->
        <form id="updateForm" method="post" action="${pageContext.request.contextPath}/admin/category/update" style="display: none;">
            <input type="hidden" name="id" id="updateId">
            <input type="hidden" name="name" id="updateName">
        </form>
    </section>

    <section class="cm-table-section">
        <h2><i class="fa-solid fa-list"></i> Danh sách danh mục</h2>
        <table class="cm-table">
            <thead>
                <tr>
                    <th>Mã danh mục</th>
                    <th>Tên danh mục</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty categories}">
                        <c:forEach var="category" items="${categories}">
                            <tr>
                                <td>${category.id}</td>
                                <td>${category.name}</td>
                                <td class="tbl-action">
                                    <a href="${pageContext.request.contextPath}/admin/category/edit/${category.id}" 
                                       class="tbl-btn edit" title="Sửa">
                                        <i class="fa-solid fa-pen"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/category/delete?id=${category.id}" 
                                       class="tbl-btn delete" title="Xóa">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="3" style="text-align: center; padding: 20px; color: #666;">
                                <i class="fa-solid fa-inbox"></i> Chưa có danh mục nào
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </section>
</main>

<style>
.alert {
    padding: 12px 16px;
    margin: 16px 0;
    border-radius: 4px;
    font-weight: 500;
}

.alert-success {
    background-color: #d4edda;
    color: #155724;
    border: 1px solid #c3e6cb;
}

.alert-error {
    background-color: #f8d7da;
    color: #721c24;
    border: 1px solid #f5c6cb;
}

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

.cm-actions {
    display: flex;
    gap: 10px;
    justify-content: center;
}

.cm-actions .btn {
    flex: 1;
    padding: 10px 0;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    font-size: 0.9rem;
    font-weight: 500;
    color: #fff;
    transition: background-color 0.3s ease;
}

.cm-actions .btn.add {
    background: #28a745;
}

.cm-actions .btn.add:hover {
    background: #218838;
}

.cm-actions .btn.update {
    background: #007bff;
}

.cm-actions .btn.update:hover {
    background: #0056b3;
}

.cm-actions .btn.clear {
    background: #6c757d;
}

.cm-actions .btn.clear:hover {
    background: #5a6268;
}
</style>

<script>
function updateCategory() {
    const id = document.querySelector('input[name="id"]').value;
    const name = document.querySelector('input[name="name"]').value;
    
    if (!id || !name) {
        alert('Vui lòng nhập đầy đủ thông tin!');
        return;
    }
    
    document.getElementById('updateId').value = id;
    document.getElementById('updateName').value = name;
    document.getElementById('updateForm').submit();
}

function resetForm() {
    document.querySelector('input[name="id"]').value = '';
    document.querySelector('input[name="name"]').value = '';
}
</script>