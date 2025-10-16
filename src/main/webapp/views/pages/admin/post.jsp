<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý bài viết</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/post-management.css">
    <script src="https://kit.fontawesome.com/f4e3fc99b3.js" crossorigin="anonymous"></script>
</head>
<body>
    <main class="pm-wrapper">
        <header class="pm-header">
            <h1><i class="fa-solid fa-newspaper"></i> Quản Lý Bài Viết</h1>
            <p>Quản lý và đăng tải bài viết mới nhất 📰</p>
        </header>

        <section class="pm-form-section">
            <h2><i class="fa-solid fa-pen"></i> Thêm / Cập nhật Bài Viết</h2>
            <form method="post" action="submitPost.jsp" enctype="multipart/form-data">
                <div class="pm-grid">
                    <div class="pm-group">
                        <label><i class="fa-solid fa-heading"></i> Tiêu đề</label>
                        <input type="text" name="title" placeholder="Nhập tiêu đề bài viết" required>
                    </div>
                    <div class="pm-group">
                        <label><i class="fa-solid fa-align-left"></i> Nội dung</label>
                        <textarea name="content" placeholder="Nhập nội dung bài viết" required></textarea>
                    </div>
                    <div class="pm-group">
                        <label><i class="fa-solid fa-image"></i> Hình ảnh</label>
                        <input type="file" name="image" accept="image/*">
                    </div>
                    <div class="pm-group">
                        <label><i class="fa-solid fa-calendar"></i> Ngày đăng</label>
                        <input type="date" name="postedDate" value="<%= new java.sql.Date(System.currentTimeMillis()) %>" required>
                    </div>
                    <div class="pm-group">
                        <label><i class="fa-solid fa-user"></i> Tác giả</label>
                        <select name="author" required>
                            <option value="PV001">Nguyen Van A</option>
                            <option value="PV002">Tran Thi B</option>
                            <option value="PV003">Le Van C</option>
                            <option value="PV004">Pham Thi D</option>
                        </select>
                    </div>
                    <div class="pm-group">
                        <label><i class="fa-solid fa-folder"></i> Danh mục</label>
                        <select name="categoryId" required>
                            <option value="CAT001">Công nghệ</option>
                            <option value="CAT002">Tin tức</option>
                            <option value="CAT003">Giáo dục</option>
                            <option value="CAT004">Thể thao</option>
                        </select>
                    </div>
                    <div class="pm-group pm-check">
                        <label><i class="fa-solid fa-home"></i> Xuất hiện trang chủ</label>
                        <input type="checkbox" name="home" value="1">
                    </div>
                </div>
                <div class="pm-actions">
                    <button class="btn add" type="submit"><i class="fa-solid fa-plus"></i> Đăng bài</button>
                    <button class="btn update" formaction="updatePost.jsp"><i class="fa-solid fa-save"></i> Cập nhật</button>
                    <button class="btn clear" type="reset"><i class="fa-solid fa-eraser"></i> Clear</button>
                </div>
            </form>
        </section>

        <section class="pm-table-section">
            <h2><i class="fa-solid fa-list"></i> Danh sách bài viết</h2>
            <table class="pm-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tiêu đề</th>
                        <th>Tác giả</th>
                        <th>Ngày đăng</th>
                        <th>Danh mục</th>
                        <th>Trang chủ</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>NEWS001</td>
                        <td>Bản tin công nghệ mới nhất</td>
                        <td>Nguyen Van A</td>
                        <td>2025-10-15</td>
                        <td>Công nghệ</td>
                        <td>✅</td>
                        <td class="tbl-action">
                            <button class="tbl-btn edit"><i class="fa-solid fa-pen"></i></button>
                            <button class="tbl-btn delete"><i class="fa-solid fa-trash"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>NEWS002</td>
                        <td>Bóng đá Việt Nam thăng hạng</td>
                        <td>Tran Thi B</td>
                        <td>2025-10-10</td>
                        <td>Thể thao</td>
                        <td>❌</td>
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