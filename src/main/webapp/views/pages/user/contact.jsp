<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="contact-page">
    <div class="container">
        <div class="contact-header">
            <h1><i class="fas fa-envelope"></i> Liên hệ với chúng tôi</h1>
            <p>Chúng tôi luôn sẵn sàng lắng nghe và hỗ trợ bạn</p>
        </div>
        
        <div class="contact-content">
            <div class="contact-info">
                <div class="info-card">
                    <div class="info-icon">
                        <i class="fas fa-map-marker-alt"></i>
                    </div>
                    <div class="info-content">
                        <h3>Địa chỉ</h3>
                        <p>123 Đường ABC, Quận 1<br>TP. Hồ Chí Minh, Việt Nam</p>
                    </div>
                </div>
                
                <div class="info-card">
                    <div class="info-icon">
                        <i class="fas fa-phone"></i>
                    </div>
                    <div class="info-content">
                        <h3>Điện thoại</h3>
                        <p>+84 787 544 232<br>+84 28 1234 5678</p>
                    </div>
                </div>
                
                <div class="info-card">
                    <div class="info-icon">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <div class="info-content">
                        <h3>Email</h3>
                        <p>info@codelensnews.com<br>support@codelensnews.com</p>
                    </div>
                </div>
                
                <div class="info-card">
                    <div class="info-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div class="info-content">
                        <h3>Giờ làm việc</h3>
                        <p>Thứ 2 - Thứ 6: 8:00 - 17:30<br>Thứ 7: 8:00 - 12:00</p>
                    </div>
                </div>
            </div>
            
            <div class="contact-form">
                <h2><i class="fas fa-paper-plane"></i> Gửi tin nhắn</h2>
                <form>
                    <div class="form-group">
                        <label for="name">Họ và tên *</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email *</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="phone">Số điện thoại</label>
                        <input type="tel" id="phone" name="phone">
                    </div>
                    
                    <div class="form-group">
                        <label for="subject">Chủ đề *</label>
                        <select id="subject" name="subject" required>
                            <option value="">-- Chọn chủ đề --</option>
                            <option value="news">Tin tức</option>
                            <option value="advertising">Quảng cáo</option>
                            <option value="partnership">Hợp tác</option>
                            <option value="feedback">Góp ý</option>
                            <option value="other">Khác</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="message">Nội dung tin nhắn *</label>
                        <textarea id="message" name="message" rows="5" required placeholder="Nhập nội dung tin nhắn của bạn..."></textarea>
                    </div>
                    
                    <button type="submit" class="submit-btn">
                        <i class="fas fa-paper-plane"></i> Gửi tin nhắn
                    </button>
                </form>
            </div>
        </div>
        
        <div class="social-links">
            <h3><i class="fas fa-share-alt"></i> Theo dõi chúng tôi</h3>
            <div class="social-icons">
                <a href="#" class="social-link facebook">
                    <i class="fab fa-facebook-f"></i>
                    <span>Facebook</span>
                </a>
                <a href="#" class="social-link twitter">
                    <i class="fab fa-twitter"></i>
                    <span>Twitter</span>
                </a>
                <a href="#" class="social-link youtube">
                    <i class="fab fa-youtube"></i>
                    <span>YouTube</span>
                </a>
                <a href="#" class="social-link tiktok">
                    <i class="fab fa-tiktok"></i>
                    <span>TikTok</span>
                </a>
            </div>
        </div>
    </div>
</div>

<style>
.contact-page {
    padding: 2rem 0;
    background: #f8f9fa;
    min-height: 80vh;
}

.contact-page .container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1rem;
}

.contact-header {
    text-align: center;
    margin-bottom: 3rem;
    padding: 2rem;
    background: linear-gradient(135deg, #10b981 0%, #059669 100%);
    border-radius: 1rem;
    color: white;
}

.contact-header h1 {
    font-size: 2.5rem;
    margin-bottom: 1rem;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 1rem;
}

.contact-header p {
    font-size: 1.2rem;
    opacity: 0.9;
}

.contact-content {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 3rem;
    margin-bottom: 3rem;
}

.contact-info {
    display: grid;
    gap: 1.5rem;
}

.info-card {
    display: flex;
    align-items: flex-start;
    gap: 1rem;
    padding: 1.5rem;
    background: white;
    border-radius: 1rem;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border: 1px solid #e5e7eb;
    transition: transform 0.2s ease;
}

.info-card:hover {
    transform: translateY(-2px);
}

.info-icon {
    width: 3rem;
    height: 3rem;
    background: linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.2rem;
    flex-shrink: 0;
}

.info-content h3 {
    color: #3b82f6;
    margin-bottom: 0.5rem;
    font-size: 1.2rem;
}

.info-content p {
    color: #4b5563;
    line-height: 1.6;
}

.contact-form {
    background: white;
    padding: 2rem;
    border-radius: 1rem;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border: 1px solid #e5e7eb;
}

.contact-form h2 {
    color: #3b82f6;
    margin-bottom: 1.5rem;
    display: flex;
    align-items: center;
    gap: 0.75rem;
    font-size: 1.5rem;
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-group label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 500;
    color: #374151;
}

.form-group input,
.form-group select,
.form-group textarea {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 2px solid #e5e7eb;
    border-radius: 0.5rem;
    font-size: 1rem;
    transition: border-color 0.2s ease;
}

.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
    outline: none;
    border-color: #3b82f6;
    box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
}

.submit-btn {
    width: 100%;
    padding: 1rem;
    background: linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%);
    color: white;
    border: none;
    border-radius: 0.5rem;
    font-size: 1.1rem;
    font-weight: 500;
    cursor: pointer;
    transition: transform 0.2s ease;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
}

.submit-btn:hover {
    transform: translateY(-1px);
    box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
}

.social-links {
    text-align: center;
    background: white;
    padding: 2rem;
    border-radius: 1rem;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border: 1px solid #e5e7eb;
}

.social-links h3 {
    color: #3b82f6;
    margin-bottom: 1.5rem;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.75rem;
    font-size: 1.5rem;
}

.social-icons {
    display: flex;
    justify-content: center;
    gap: 1rem;
    flex-wrap: wrap;
}

.social-link {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.5rem;
    padding: 1rem;
    border-radius: 0.75rem;
    text-decoration: none;
    transition: transform 0.2s ease;
    min-width: 100px;
}

.social-link:hover {
    transform: translateY(-2px);
}

.social-link.facebook {
    background: #1877f2;
    color: white;
}

.social-link.twitter {
    background: #1da1f2;
    color: white;
}

.social-link.youtube {
    background: #ff0000;
    color: white;
}

.social-link.tiktok {
    background: #000000;
    color: white;
}

.social-link i {
    font-size: 1.5rem;
}

.social-link span {
    font-size: 0.875rem;
    font-weight: 500;
}

@media (max-width: 768px) {
    .contact-content {
        grid-template-columns: 1fr;
        gap: 2rem;
    }
    
    .contact-header h1 {
        font-size: 2rem;
        flex-direction: column;
        gap: 0.5rem;
    }
    
    .social-icons {
        gap: 0.5rem;
    }
    
    .social-link {
        min-width: 80px;
        padding: 0.75rem;
    }
}
</style>
