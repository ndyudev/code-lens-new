<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="content">
  <div class="container">
    <div class="main-layout">
      <div class="news-feed">
        <h2>Bài Viết Nổi Bật</h2>

		<!-- Bài viết 1 -->
		<div class="article">
		  <a href="news-detail.jsp?id=1"> <!-- Thêm link ở đây -->
		    <div class="article-img">
		      <img src="https://picsum.photos/500/320?random=1" alt="AI bùng nổ">
		    </div>
		    <div class="article-body">
		      <h3 class="article-title">🔥 AI bùng nổ toàn cầu</h3>
		      <p class="article-desc">
		        Trí tuệ nhân tạo đang làm thay đổi mọi lĩnh vực — từ công nghệ, giáo dục đến sáng tạo nghệ thuật.
		        Đây là bước ngoặt lớn trong kỷ nguyên số, mở ra nhiều cơ hội và thách thức mới...
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
          <div class="article-img">
            <img src="https://picsum.photos/500/320?random=2" alt="Y tế thông minh">
          </div>
          <div class="article-body">
            <h3 class="article-title">🧬 Phát minh y tế thông minh cứu sống hàng triệu người</h3>
            <p class="article-desc">
              Một thiết bị y tế ứng dụng AI giúp chẩn đoán sớm bệnh nan y chỉ trong vài phút,
              mang đến hy vọng mới cho y học hiện đại và cộng đồng toàn cầu...
            </p>
            <div class="article-meta">
              <span><i class="fa-regular fa-calendar"></i> 09/10/2025</span>
              <span><i class="fa-regular fa-eye"></i> 1.2k lượt xem</span>
              <span><i class="fa-regular fa-user"></i> PV002</span>
              <span class="tag">#Health</span>
            </div>
          </div>
        </div>

        <!-- Bài viết 3 -->
        <div class="article">
          <div class="article-img">
            <img src="https://picsum.photos/500/320?random=3" alt="Công nghệ 5G">
          </div>
          <div class="article-body">
            <h3 class="article-title">⚡ Công nghệ 5G bùng nổ khắp thế giới</h3>
            <p class="article-desc">
              Mạng 5G đang thay đổi cách con người kết nối, mang lại tốc độ cực nhanh
              và trải nghiệm Internet mượt mà hơn bao giờ hết...
            </p>
            <div class="article-meta">
              <span><i class="fa-regular fa-calendar"></i> 08/10/2025</span>
              <span><i class="fa-regular fa-eye"></i> 980 lượt xem</span>
              <span><i class="fa-regular fa-user"></i> PV003</span>
              <span class="tag">#Technology</span>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>
