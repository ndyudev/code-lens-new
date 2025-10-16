<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/news-detail.css">
<div class="news-detail">
  <div class="news-detail__container">

    <!-- Ảnh bìa -->
    <div class="news-detail__cover">
      <img src="https://picsum.photos/1000/400?random=10" alt="Ảnh bài viết">
    </div>

    <!-- Tiêu đề & Meta -->
    <h1 class="news-detail__title">AI đang thay đổi thế giới như thế nào?</h1>
    <div class="news-detail__meta">
      <span><i class="fa-regular fa-calendar"></i> 10/10/2025</span>
      <span><i class="fa-regular fa-user"></i> PV001</span>
      <span><i class="fa-regular fa-eye"></i> 2.3k lượt xem</span>
      <span class="tag">#AI</span>
    </div>

    <!-- Nội dung bài viết -->
    <div class="news-detail__content">
      <p>
        Trí tuệ nhân tạo (AI) đang trở thành một phần không thể thiếu trong đời sống hiện đại. 
        Từ việc tối ưu hóa công việc, hỗ trợ học tập cho đến thay đổi toàn bộ cách vận hành của các doanh nghiệp.
      </p>

      <p>
        Các hệ thống AI tiên tiến như ChatGPT, Gemini hay Claude đang định hình lại cách con người tiếp cận thông tin. 
        Trong lĩnh vực y tế, AI giúp phát hiện bệnh sớm và đưa ra chẩn đoán chính xác hơn.
      </p>

      <blockquote>
        “AI không thay thế con người — nhưng những người biết sử dụng AI sẽ thay thế những người không biết.”
      </blockquote>

      <p>
        Tuy nhiên, sự phát triển nhanh chóng này cũng đặt ra nhiều thách thức về đạo đức, quyền riêng tư 
        và tác động đến việc làm. Các chuyên gia cho rằng việc học cách làm việc cùng AI 
        là kỹ năng bắt buộc trong kỷ nguyên số.
      </p>

      <img src="https://picsum.photos/800/400?random=12" alt="AI Future">

      <p>
        Tương lai, AI có thể đóng vai trò như một “trợ lý ảo” toàn năng giúp con người đạt được năng suất tối đa. 
        Song, điều quan trọng nhất vẫn là sự kiểm soát và định hướng đúng đắn của con người trong việc sử dụng công nghệ.
      </p>
    </div>

    <!-- Tag và chia sẻ -->
    <div class="news-detail__footer">
      <div class="news-detail__tags">
        <strong>Tags:</strong>
        <a href="#">#AI</a>
        <a href="#">#CôngNghệ</a>
        <a href="#">#TươngLai</a>
      </div>

      <div class="news-detail__share">
        <strong>Chia sẻ:</strong>
        <a href="#"><i class="fa-brands fa-facebook"></i></a>
        <a href="#"><i class="fa-brands fa-x-twitter"></i></a>
        <a href="#"><i class="fa-brands fa-linkedin"></i></a>
      </div>
    </div>
  </div>
</div>
