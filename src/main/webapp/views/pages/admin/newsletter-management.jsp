<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Newsletter Management</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/newsletter-management.css">
  <script src="https://kit.fontawesome.com/f4e3fc99b3.js" crossorigin="anonymous"></script>
</head>
<body>
  <main class="nl-wrapper">
    <header class="nl-header">
      <h1><i class="fa-solid fa-envelope-open-text"></i> Newsletter Subscriptions</h1>
      <p>Quản lý danh sách email nhận tin mới nhất 💌</p>
    </header>

    <section class="nl-form">
      <h2><i class="fa-solid fa-plus-circle"></i> Thêm / Cập nhật Email</h2>
      <form method="post" action="submitNewsletter.jsp">
        <div class="nl-grid">
          <div class="nl-group">
            <label><i class="fa-solid fa-at"></i> Email</label>
            <input type="email" name="email" placeholder="example@gmail.com" required>
          </div>
          <div class="nl-group">
            <label><i class="fa-solid fa-toggle-on"></i> Trạng thái</label>
            <select name="enabled" required>
              <option value="1">Hiệu lực</option>
              <option value="0">Không hiệu lực</option>
            </select>
          </div>
        </div>
        <div class="nl-actions">
          <button class="btn add" type="submit"><i class="fa-solid fa-plus"></i> Thêm</button>
          <button class="btn update" formaction="updateNewsletter.jsp"><i class="fa-solid fa-rotate"></i> Cập nhật</button>
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
          <tr>
            <td>user1@example.com</td>
            <td><span class="badge active">Hiệu lực</span></td>
            <td class="tbl-action">
              <button class="tbl-btn edit"><i class="fa-solid fa-pen"></i></button>
              <button class="tbl-btn delete"><i class="fa-solid fa-trash"></i></button>
            </td>
          </tr>
          <tr>
            <td>user2@example.com</td>
            <td><span class="badge inactive">Không hiệu lực</span></td>
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
