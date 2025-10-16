<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý người dùng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user-management.css">
    <script src="https://kit.fontawesome.com/f4e3fc99b3.js" crossorigin="anonymous"></script>
</head>
<body>
    <main class="um-wrapper">
        <header class="um-header">
            <h1><i class="fa-solid fa-users-gear"></i> Quản Lý Người Dùng</h1>
            <p>Quản lý danh sách người dùng mới nhất 👥</p>
        </header>

        <section class="um-form">
            <h2><i class="fa-solid fa-user-plus"></i> Thêm / Cập nhật Người Dùng</h2>
            <form method="post" action="submitUser.jsp">
                <div class="um-grid">
                    <div class="um-group">
                        <label><i class="fa-solid fa-id-card"></i> Mã người dùng</label>
                        <input type="text" name="id" placeholder="VD: USR001" required>
                    </div>
                    <div class="um-group">
                        <label><i class="fa-solid fa-user"></i> Họ và tên</label>
                        <input type="text" name="fullname" placeholder="Nguyen Van A" required>
                    </div>
                    <div class="um-group">
                        <label><i class="fa-solid fa-lock"></i> Mật khẩu</label>
                        <input type="password" name="password" placeholder="••••••••" required>
                    </div>
                    <div class="um-group">
                        <label><i class="fa-solid fa-calendar"></i> Ngày sinh</label>
                        <input type="date" name="birthday" required>
                    </div>
                    <div class="um-group">
                        <label><i class="fa-solid fa-venus-mars"></i> Giới tính</label>
                        <select name="gender" required>
                            <option value="0">Nam</option>
                            <option value="1">Nữ</option>
                        </select>
                    </div>
                    <div class="um-group">
                        <label><i class="fa-solid fa-phone"></i> Số điện thoại</label>
                        <input type="text" name="mobile" placeholder="090xxxxxxx" required>
                    </div>
                    <div class="um-group">
                        <label><i class="fa-solid fa-envelope"></i> Email</label>
                        <input type="email" name="email" placeholder="abc@gmail.com" required>
                    </div>
                    <div class="um-group">
                        <label><i class="fa-solid fa-shield-halved"></i> Vai trò</label>
                        <select name="role" required>
                            <option value="0">Phóng viên</option>
                            <option value="1">Quản trị viên</option>
                        </select>
                    </div>
                </div>
                <div class="um-actions">
                    <button class="btn add" type="submit"><i class="fa-solid fa-plus"></i> Thêm</button>
                    <button class="btn update" formaction="updateUser.jsp"><i class="fa-solid fa-save"></i> Cập nhật</button>
                    <button class="btn clear" type="reset"><i class="fa-solid fa-eraser"></i> Clear</button>
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
                    <tr>
                        <td>USR001</td>
                        <td>Nguyen Van A</td>
                        <td>2000-01-15</td>
                        <td>Nam</td>
                        <td>0901234567</td>
                        <td>vana@gmail.com</td>
                        <td>Phóng viên</td>
                        <td class="tbl-action">
                            <button class="tbl-btn edit"><i class="fa-solid fa-pen"></i></button>
                            <button class="tbl-btn delete"><i class="fa-solid fa-trash"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>USR002</td>
                        <td>Tran Thi B</td>
                        <td>1998-05-20</td>
                        <td>Nữ</td>
                        <td>0912345678</td>
                        <td>thib@gmail.com</td>
                        <td>Quản trị viên</td>
                        <td class="tbl-action">
                            <button class="tbl-btn edit"><i class="fa-solid fa-pen"></i></button>
                            <button class="tbl-btn delete"><i class="fa-solid fa-trash"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </section>
    </main>
</body>
</html>