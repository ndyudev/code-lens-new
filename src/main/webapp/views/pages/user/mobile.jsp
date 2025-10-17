<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="category-page">
    <div class="page-header">
        <h1>📱 Mobile</h1>
        <p>Tin tức về công nghệ di động và ứng dụng</p>
    </div>
    
    <div class="news-grid">
        <div class="news-item">
            <a href="${pageContext.request.contextPath}/CodeLensNew?tab=news&id=3">
                <div class="news-image">
                    <img src="${pageContext.request.contextPath}/images/new-img/CNghe_3.jpg" alt="5G">
                </div>
                <div class="news-content">
                    <h3>⚡ Công nghệ 5G bùng nổ</h3>
                    <p>Mạng 5G đang thay đổi cách chúng ta kết nối và sử dụng internet với tốc độ siêu nhanh...</p>
                    <div class="news-meta">
                        <span><i class="fas fa-calendar"></i> 13/10/2025</span>
                        <span><i class="fas fa-eye"></i> 980</span>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>

<style>
.category-page {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.page-header {
    text-align: center;
    margin-bottom: 40px;
    padding: 40px 0;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    border-radius: 12px;
}

.page-header h1 {
    font-size: 3em;
    margin-bottom: 10px;
    font-weight: 700;
}

.page-header p {
    font-size: 1.2em;
    opacity: 0.9;
}

.news-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 30px;
}

.news-item a {
    display: block;
    text-decoration: none;
    color: inherit;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    transition: transform 0.3s ease;
}

.news-item a:hover {
    transform: translateY(-5px);
}

.news-image {
    height: 200px;
}

.news-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.news-content {
    padding: 25px;
}

.news-content h3 {
    font-size: 1.3em;
    margin-bottom: 15px;
    color: #2c3e50;
}

.news-content p {
    color: #7f8c8d;
    line-height: 1.6;
    margin-bottom: 20px;
}

.news-meta {
    display: flex;
    gap: 20px;
    font-size: 0.9em;
    color: #95a5a6;
}

.news-meta i {
    margin-right: 5px;
}
</style>
