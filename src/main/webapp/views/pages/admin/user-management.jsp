<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="https://kit.fontawesome.com/f4e3fc99b3.js" crossorigin="anonymous"></script>

<main class="um-wrapper">
    <header class="um-header">
        <h1><i class="fa-solid fa-users-gear"></i> Quản Lý Người Dùng</h1>
        <p>Quản lý danh sách người dùng mới nhất <i class="fa-solid fa-users"></i></p>
    </header>

    <!-- Hiển thị thông báo -->
    <c:if test="${not empty message}">
        <div class="alert ${message.contains('thành công') ? 'alert-success' : 'alert-error'}">
            ${message}
        </div>
    </c:if>

    <section class="um-form">
        <h2><i class="fa-solid fa-user-plus"></i> Thêm / Cập nhật Người Dùng</h2>
        <form method="post" action="${pageContext.request.contextPath}/admin/user/create">
            <div class="um-grid">
                <div class="um-group">
                    <label><i class="fa-solid fa-id-card"></i> Mã người dùng</label>
                    <input type="text" name="id" value="${editingUser.id}" placeholder="VD: USR001" required>
                </div>
                <div class="um-group">
                    <label><i class="fa-solid fa-user"></i> Họ và tên</label>
                    <input type="text" name="fullname" value="${editingUser.fullname}" placeholder="Nguyen Van A" required>
                </div>
                <div class="um-group">
                    <label><i class="fa-solid fa-lock"></i> Mật khẩu</label>
                    <input type="password" name="password" value="${editingUser.password}" placeholder="••••••••" required>
                </div>
                <div class="um-group">
                    <label><i class="fa-solid fa-calendar"></i> Ngày sinh</label>
                    <input type="date" name="birthday" value="${editingUser.birthday}" required>
                </div>
                <div class="um-group">
                    <label><i class="fa-solid fa-venus-mars"></i> Giới tính</label>
                    <select name="gender" required>
                        <option value="0" ${editingUser.gender == false ? 'selected' : ''}>Nam</option>
                        <option value="1" ${editingUser.gender == true ? 'selected' : ''}>Nữ</option>
                    </select>
                </div>
                <div class="um-group">
                    <label><i class="fa-solid fa-phone"></i> Số điện thoại</label>
                    <input type="text" name="mobile" value="${editingUser.mobile}" placeholder="090xxxxxxx" required>
                </div>
                <div class="um-group">
                    <label><i class="fa-solid fa-envelope"></i> Email</label>
                    <input type="email" name="email" value="${editingUser.email}" placeholder="abc@gmail.com" required>
                </div>
                <div class="um-group">
                    <label><i class="fa-solid fa-shield-halved"></i> Vai trò</label>
                    <select name="role" required>
                        <option value="0" ${editingUser.role == false ? 'selected' : ''}>Phóng viên</option>
                        <option value="1" ${editingUser.role == true ? 'selected' : ''}>Quản trị viên</option>
                    </select>
                </div>
            </div>
            <div class="um-actions">
                <button class="btn add" type="submit" formaction="${pageContext.request.contextPath}/admin/user/create">
                    <i class="fa-solid fa-plus"></i> Thêm
                </button>
                <button class="btn update" type="submit" formaction="${pageContext.request.contextPath}/admin/user/update">
                    <i class="fa-solid fa-save"></i> Cập nhật
                </button>
                <button class="btn clear" type="submit" formaction="${pageContext.request.contextPath}/admin/user/reset">
                    <i class="fa-solid fa-eraser"></i> Clear
                </button>
            </div>
            </form>
        </section>

    <section class="um-table-section">
        <h2><i class="fa-solid fa-list"></i> Danh sách người dùng</h2>
        <table class="um-table">
            <thead>
                <tr>
                    <th>Mã</th>
                    <th>Họ tên</th>
                    <th>Ngày sinh</th>
                    <th>Giới tính</th>
                    <th>Điện thoại</th>
                    <th>Email</th>
                    <th>Vai trò</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty allUsers}">
                        <c:forEach var="user" items="${allUsers}">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.fullname}</td>
                                <td><fmt:formatDate value="${user.birthday}" pattern="dd/MM/yyyy"/></td>
                                <td>${user.gender ? 'Nữ' : 'Nam'}</td>
                                <td>${user.mobile}</td>
                                <td>${user.email}</td>
                                <td>
                                    <span class="role-badge ${user.role ? 'admin' : 'reporter'}">
                                        ${user.role ? 'Quản trị viên' : 'Phóng viên'}
                                    </span>
                                </td>
                                <td class="tbl-action">
                                    <a href="${pageContext.request.contextPath}/admin/user/edit/${user.id}" 
                                       class="tbl-btn edit" title="Sửa">
                                        <i class="fa-solid fa-pen"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/admin/user/delete?id=${user.id}" 
                                       class="tbl-btn delete" title="Xóa">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="8" style="text-align: center; padding: 40px; color: #666;">
                                <i class="fa-solid fa-inbox" style="font-size: 2rem; margin-bottom: 10px; display: block;"></i>
                                Chưa có người dùng nào
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </section>
</main>