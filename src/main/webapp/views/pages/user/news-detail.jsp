<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="news-detail-container">
	<!-- Breadcrumb -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/news-detail.css">
	<nav class="breadcrumb">
		<a href="${pageContext.request.contextPath}/CodeLensNew" class="breadcrumb-link">
			<i class="fas fa-home"></i> Trang chủ
		</a>
		<span class="breadcrumb-separator">/</span>
		<span class="breadcrumb-current">Chi tiết tin tức</span>
	</nav>

	<!-- Main Content -->
	<article class="news-article">
		<!-- Article Header -->
		<header class="article-header">
		<div class="article-category">
			<i class="fas fa-microchip"></i>
			<span>
				<c:choose>
					<c:when test="${not empty news}">
						<c:forEach var="category" items="${categories}">
							<c:if test="${category.id == news.categoryId}">
								${category.name}
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>Công nghệ</c:otherwise>
				</c:choose>
			</span>
		</div>
			
			<h1 class="article-title">
				<c:choose>
					<c:when test="${not empty news}">
						${news.title}
					</c:when>
					<c:otherwise>
						🔥 AI bùng nổ toàn cầu - Cuộc cách mạng công nghệ mới
					</c:otherwise>
				</c:choose>
			</h1>
			
			<div class="article-meta">
				<div class="meta-group">
		<div class="meta-item">
						<i class="fas fa-calendar-alt"></i>
						<span>
							<c:choose>
								<c:when test="${not empty news}">
									<fmt:formatDate value="${news.postedDate}" pattern="dd/MM/yyyy"/>
								</c:when>
								<c:otherwise>15/10/2025</c:otherwise>
							</c:choose>
						</span>
		</div>
		<div class="meta-item">
						<i class="fas fa-eye"></i>
						<span>
							<c:choose>
								<c:when test="${not empty news}">
									<fmt:formatNumber value="${news.viewCount}" type="number"/> lượt xem
								</c:when>
								<c:otherwise>2.5k lượt xem</c:otherwise>
							</c:choose>
						</span>
		</div>
		<div class="meta-item">
						<i class="fas fa-user-edit"></i>
						<span>
							<c:choose>
								<c:when test="${not empty news}">
									${news.author}
								</c:when>
								<c:otherwise>Phóng viên: PV001</c:otherwise>
							</c:choose>
						</span>
					</div>
				</div>
				
				<div class="article-actions">
					<button class="action-btn share-btn" onclick="shareArticle()">
						<i class="fas fa-share-alt"></i>
						<span>Chia sẻ</span>
					</button>
					<button class="action-btn bookmark-btn" onclick="bookmarkArticle()">
						<i class="far fa-bookmark"></i>
						<span>Lưu</span>
					</button>
				</div>
			</div>
		</header>

		<!-- Featured Image -->
		<div class="article-image">
			<c:choose>
				<c:when test="${not empty news && not empty news.image}">
					<img src="${pageContext.request.contextPath}/images/${news.image}" 
						 alt="${news.title}" 
						 class="featured-image"
						 onerror="this.src='${pageContext.request.contextPath}/images/new-img/CNghe_1.jpg'">
				</c:when>
				<c:otherwise>
					<img src="${pageContext.request.contextPath}/images/new-img/CNghe_1.jpg" 
						 alt="Default image" 
						 class="featured-image">
				</c:otherwise>
			</c:choose>
			<div class="image-overlay">
				<div class="image-caption">
					<c:choose>
						<c:when test="${not empty news}">
							${news.title}
						</c:when>
						<c:otherwise>
							Trí tuệ nhân tạo đang thay đổi cách chúng ta sống và làm việc
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>

		<!-- Article Content -->
		<div class="article-content">
			<div class="content-wrapper">
				<!-- Article Body -->
				<div class="article-body">
					<div class="article-text">
						<c:choose>
							<c:when test="${not empty news}">
								${news.content}
							</c:when>
							<c:otherwise>
								<p>
									Các tập đoàn lớn như Google, OpenAI, Meta hay Amazon đều đang đua nhau phát triển 
									các mô hình AI ngày càng mạnh mẽ và thông minh hơn. Không chỉ dừng lại ở chatbot 
									hay nhận diện hình ảnh, AI còn được ứng dụng trong y học, tài chính, giao thông, 
									giúp tiết kiệm thời gian và giảm thiểu sai sót của con người.
								</p>
								<p>
									Theo báo cáo từ McKinsey, AI có thể đóng góp thêm 13 nghìn tỷ USD vào GDP toàn cầu 
									đến năm 2030. Các lĩnh vực như y tế, tài chính và sản xuất đang chứng kiến sự chuyển 
									mình mạnh mẽ nhờ công nghệ này.
								</p>
								<p>
									Mặc dù mang lại nhiều lợi ích, AI cũng đặt ra những lo ngại về việc mất việc làm 
									và sự bất bình đẳng. Tuy nhiên, với sự đầu tư đúng đắn, nó có thể tạo ra hàng triệu 
									việc làm mới trong các lĩnh vực liên quan đến công nghệ.
								</p>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>
	</div>

		<!-- Article Footer -->
		<footer class="article-footer">
			<div class="footer-actions">
				<button class="btn btn-primary" onclick="goBack()">
					<i class="fas fa-arrow-left"></i>
					Quay lại danh sách
				</button>
				<button class="btn btn-secondary" onclick="printArticle()">
					<i class="fas fa-print"></i>
					In bài viết
				</button>
	</div>
		</footer>
	</article>
</div>

<script>
function shareArticle() {
	if (navigator.share) {
		navigator.share({
			title: document.querySelector('.article-title').textContent,
			url: window.location.href
		});
	} else {
		// Fallback: copy to clipboard
		navigator.clipboard.writeText(window.location.href);
		alert('Link đã được sao chép!');
	}
}

function bookmarkArticle() {
	const btn = document.querySelector('.bookmark-btn');
	const icon = btn.querySelector('i');
	
	if (icon.classList.contains('far')) {
		icon.classList.remove('far');
		icon.classList.add('fas');
		btn.querySelector('span').textContent = 'Đã lưu';
		btn.classList.add('bookmarked');
	} else {
		icon.classList.remove('fas');
		icon.classList.add('far');
		btn.querySelector('span').textContent = 'Lưu';
		btn.classList.remove('bookmarked');
	}
}

function goBack() {
	window.history.back();
}

function printArticle() {
	window.print();
}
</script>
