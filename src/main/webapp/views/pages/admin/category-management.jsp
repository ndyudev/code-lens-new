<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý danh mục</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/category-management.css">
    <script src="https://kit.fontawesome.com/f4e3fc99b3.js" crossorigin="anonymous"></script>
</head>
<body>
    <main class="cm-wrapper">
        <header class="cm-header">
            <h1><i class="fa-solid fa-folder-open"></i> Quản Lý Danh Mục</h1>
            <p>Quản lý danh sách danh mục mới nhất 📂</p>
        </header>

        <section class="cm-form">
            <h2><i class="fa-solid fa-plus-circle"></i> Thêm / Cập nhật Danh mục</h2>
            <form method="post" action="submitCategory.jsp">
                <div class="cm-grid">
                    <div class="cm-group">
                        <label><i class="fa-solid fa-id-card"></i> Mã danh mục</label>
                        <input type="text" name="id" placeholder="VD: CAT001" required>
                    </div>
                    <div class="cm-group">
                        <label><i class="fa-solid fa-tag"></i> Tên danh mục</label>
                        <input type="text" name="name" placeholder="VD: Công nghệ" required>
                    </div>
                </div>
                <div class="cm-actions">
                    <button class="btn add" type="submit"><i class="fa-solid fa-plus"></i> Thêm</button>
                    <button class="btn update" formaction="updateCategory.jsp"><i class="fa-solid fa-save"></i> Cập nhật</button>
                    <button class="btn clear" type="reset"><i class="fa-solid fa-eraser"></i> Clear</button>
                </div>
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
                    <tr>
                        <td>CAT001</td>
                        <td>Công nghệ</td>
                        <td class="tbl-action">
                            <button class="tbl-btn edit"><i class="fa-solid fa-pen"></i></button>
                            <button class="tbl-btn delete"><i class="fa-solid fa-trash"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>CAT002</td>
                        <td>Giáo dục</td>
                        <td class="tbl-action">
                            <button class="tbl-btn edit"><i class="fa-solid fa-pen"></i></button>
                            <button class="tbl-btn delete"><i class="fa-solid fa-trash"></i></button>
                        </td>
                    </tr>
                    <tr>
                        <td>CAT003</td>
                        <td>Thể thao</td>
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