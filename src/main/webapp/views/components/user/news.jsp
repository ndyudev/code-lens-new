<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="news-feed">
  <h2>Bài Viết Nổi Bật</h2>

  <!-- Bài viết 1 -->
  <div class="article">
    <a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=1">
      <div class="article-img">
        <img src="${pageContext.request.contextPath}/images/new-img/CNghe_1.jpg" alt="AI bùng nổ">
      </div>
      <div class="article-body">
        <h3 class="article-title">🔥 AI bùng nổ toàn cầu</h3>
        <p class="article-desc">
          Trí tuệ nhân tạo đang làm thay đổi mọi lĩnh vực — từ công nghệ, giáo dục đến sáng tạo nghệ thuật...
        </p>
        <div class="article-meta">
          <span><i class="fa-regular fa-calendar"></i> 10/10/2025</span>
          <span><i class="fa-regular fa-eye"></i> 1.5k lượt xem</span>
          <span><i class="fa-regular fa-user"></i> PV001</span>
          <span class="tag">#AI</span>
        </div>
      </div>
    </a>
  </div>

  <!-- Bài viết 2 -->
  <div class="article">
    <a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=2">
      <div class="article-img">
        <img src="${pageContext.request.contextPath}/images/new-img/CNghe_2.jpg" alt="Y tế thông minh">
      </div>
      <div class="article-body">
        <h3 class="article-title">🧬 Phát minh y tế thông minh cứu sống hàng triệu người</h3>
        <p class="article-desc">
          Một thiết bị y tế ứng dụng AI giúp chẩn đoán sớm bệnh nan y chỉ trong vài phút...
        </p>
        <div class="article-meta">
          <span><i class="fa-regular fa-calendar"></i> 09/10/2025</span>
          <span><i class="fa-regular fa-eye"></i> 1.2k lượt xem</span>
          <span><i class="fa-regular fa-user"></i> PV002</span>
          <span class="tag">#Health</span>
        </div>
      </div>
    </a>
  </div>

  <!-- Bài viết 3 -->
  <div class="article">
    <a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=3">
      <div class="article-img">
        <img src="${pageContext.request.contextPath}/images/new-img/CNghe_3.jpg" alt="Công nghệ 5G">
      </div>
      <div class="article-body">
        <h3 class="article-title">⚡ Công nghệ 5G bùng nổ khắp thế giới</h3>
        <p class="article-desc">
          Mạng 5G đang thay đổi cách con người kết nối, mang lại tốc độ cực nhanh và trải nghiệm Internet mượt mà hơn bao giờ hết...
        </p>
        <div class="article-meta">
          <span><i class="fa-regular fa-calendar"></i> 08/10/2025</span>
          <span><i class="fa-regular fa-eye"></i> 980 lượt xem</span>
          <span><i class="fa-regular fa-user"></i> PV003</span>
          <span class="tag">#Technology</span>
        </div>
      </div>
    </a>
  </div>
  
  <!-- Bài viết 4 -->
  <div class="article">
    <a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=4">
      <div class="article-img">
        <img src="${pageContext.request.contextPath}/images/new-img/CNghe_4.jpg" alt="Blockchain">
      </div>
      <div class="article-body">
        <h3 class="article-title">🔗 Blockchain thay đổi tương lai tài chính</h3>
        <p class="article-desc">
          Công nghệ blockchain đang cách mạng hóa ngành tài chính với các ứng dụng DeFi và NFT...
        </p>
        <div class="article-meta">
          <span><i class="fa-regular fa-calendar"></i> 07/10/2025</span>
          <span><i class="fa-regular fa-eye"></i> 1.1k lượt xem</span>
          <span><i class="fa-regular fa-user"></i> PV004</span>
          <span class="tag">#Blockchain</span>
        </div>
      </div>
    </a>
  </div>
</div>
