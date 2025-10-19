<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="about-page">
    <div class="container">
        <div class="about-header">
            <h1><i class="fas fa-info-circle"></i> Giới thiệu về CodeLens News</h1>
            <p>Trang tin tức công nghệ hàng đầu Việt Nam</p>
        </div>
        
        <div class="about-content">
            <div class="about-section">
                <h2><i class="fas fa-rocket"></i> Sứ mệnh</h2>
                <p>CodeLens News cam kết mang đến những tin tức công nghệ mới nhất, chính xác và hữu ích cho cộng đồng yêu công nghệ Việt Nam. Chúng tôi luôn cập nhật những xu hướng công nghệ mới nhất từ khắp nơi trên thế giới.</p>
            </div>
            
            <div class="about-section">
                <h2><i class="fas fa-eye"></i> Tầm nhìn</h2>
                <p>Trở thành nguồn tin tức công nghệ đáng tin cậy nhất tại Việt Nam, góp phần phát triển cộng đồng công nghệ và thúc đẩy sự đổi mới trong lĩnh vực công nghệ thông tin.</p>
            </div>
            
            <div class="about-section">
                <h2><i class="fas fa-users"></i> Đội ngũ</h2>
                <p>Chúng tôi có đội ngũ phóng viên và biên tập viên giàu kinh nghiệm, luôn tận tâm với nghề và có kiến thức sâu rộng về công nghệ. Mỗi bài viết đều được kiểm duyệt kỹ lưỡng trước khi xuất bản.</p>
            </div>
            
            <div class="about-section">
                <h2><i class="fas fa-star"></i> Giá trị cốt lõi</h2>
                <ul>
                    <li><i class="fas fa-check"></i> <strong>Chính xác:</strong> Thông tin được kiểm chứng và cập nhật liên tục</li>
                    <li><i class="fas fa-check"></i> <strong>Kịp thời:</strong> Tin tức nóng hổi được đăng tải nhanh chóng</li>
                    <li><i class="fas fa-check"></i> <strong>Hữu ích:</strong> Nội dung có giá trị thực tiễn cho độc giả</li>
                    <li><i class="fas fa-check"></i> <strong>Minh bạch:</strong> Nguồn tin rõ ràng và đáng tin cậy</li>
                </ul>
            </div>
        </div>
    </div>
</div>

<style>
.about-page {
    padding: 2rem 0;
    background: #f8f9fa;
    min-height: 60vh;
}

.about-page .container {
    max-width: 800px;
    margin: 0 auto;
    padding: 0 1rem;
}

.about-header {
    text-align: center;
    margin-bottom: 3rem;
    padding: 2rem;
    background: linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%);
    border-radius: 1rem;
    color: white;
}

.about-header h1 {
    font-size: 2.5rem;
    margin-bottom: 1rem;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 1rem;
}

.about-header p {
    font-size: 1.2rem;
    opacity: 0.9;
}

.about-content {
    display: grid;
    gap: 2rem;
}

.about-section {
    background: white;
    padding: 2rem;
    border-radius: 1rem;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border: 1px solid #e5e7eb;
}

.about-section h2 {
    color: #3b82f6;
    margin-bottom: 1rem;
    display: flex;
    align-items: center;
    gap: 0.75rem;
    font-size: 1.5rem;
}

.about-section p {
    line-height: 1.8;
    color: #4b5563;
    font-size: 1.1rem;
}

.about-section ul {
    list-style: none;
    padding: 0;
}

.about-section li {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    margin-bottom: 0.75rem;
    padding: 0.75rem;
    background: #f8fafc;
    border-radius: 0.5rem;
    border-left: 4px solid #3b82f6;
}

.about-section li i.fa-check {
    color: #10b981;
    font-size: 1.2rem;
}

@media (max-width: 768px) {
    .about-header h1 {
        font-size: 2rem;
        flex-direction: column;
        gap: 0.5rem;
    }
    
    .about-section {
        padding: 1.5rem;
    }
}
</style>
