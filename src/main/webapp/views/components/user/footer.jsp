<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footerUser.css">
<!-- Font Google -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
<footer class="footer">
  <div class="footer-container">
    
    <!-- Cột 1 -->
    <div class="footer-col">
      <div class="logo">
        <a href="${pageContext.request.contextPath}/CodeLensNew">
          <img src="${pageContext.request.contextPath}/images/codelensnew-logo-chu-ngang.svg" alt="Logo">
        </a>
      </div>
      <p><i class="fa-solid fa-location-dot"></i> TP. Hồ Chí Minh</p>
      <p><i class="fa-solid fa-phone"></i> 0787.544.232</p>
      <p><i class="fa-solid fa-envelope"></i> codelensnew.work@gmail.com</p>
      
      <h4>Mạng xã hội</h4>
      <div class="social-icons">
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-tiktok"></i></a>
        <a href="#"><i class="fab fa-youtube"></i></a>
      </div>
    </div>

    <!-- Cột 2 -->
    <div class="footer-col">
      <h3>Chủ Đề</h3>
      <ul>
        <li><a href="${pageContext.request.contextPath}/CodeLensNew">Trang chủ</a></li>
        <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=technology">Công nghệ</a></li>
        <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=programming">Lập trình</a></li>
        <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=ai">AI & Machine Learning</a></li>
        <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=blockchain">Blockchain</a></li>
        <li><a href="${pageContext.request.contextPath}/CodeLensNew?tab=startup">Startup</a></li>
      </ul>
    </div>

    <!-- Cột 3 -->
    <div class="footer-col">
      
      <h3>Đăng ký nhận tin</h3>
      <p>Nhận thông tin mới nhất từ chúng tôi</p>
      <form class="newsletter-form" action="${pageContext.request.contextPath}/admin/newsletter/subscribe" method="post">
        <div class="input-group">
          <input type="email" name="email" placeholder="Nhập email của bạn" required>
          <button type="submit"><i class="fas fa-paper-plane"></i></button>
        </div>
      </form>
    </div>

    <!-- Cột 4 -->
    <div class="footer-col">
	  <h3>Bản đồ</h3>
	  <iframe 
	      src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.502607179073!2d106.70042331533478!3d10.776889962166698!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f3e3f0df2a1%3A0x7b8d1ddc3c9bde55!2zUFAuSC4gQ2jhu5EgTWluaCBLaMOhY2ggSMOyYSBN4bqhbmc!5e0!3m2!1svi!2s!4v1634029185232!5m2!1svi!2s" 
	      width="100%" 
	      height="200" 
	      style="border:0;">
	  </iframe>
	</div>
  </div>
</footer>
