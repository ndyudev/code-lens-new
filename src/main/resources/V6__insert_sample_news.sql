-- Thêm một số bài viết mẫu để test
INSERT INTO NEWS (Id, Title, Content, Image, PostedDate, Author, ViewCount, CategoryId, Home) VALUES
('NEWS001', N'AI ChatGPT-5 ra mắt với khả năng siêu việt', N'OpenAI vừa công bố phiên bản ChatGPT-5 với những cải tiến đáng kể về khả năng hiểu ngôn ngữ tự nhiên và xử lý thông tin. Phiên bản mới này có thể xử lý văn bản dài hơn, hiểu ngữ cảnh tốt hơn và đưa ra câu trả lời chính xác hơn. Các chuyên gia dự đoán ChatGPT-5 sẽ tạo ra cuộc cách mạng mới trong lĩnh vực trí tuệ nhân tạo.', 'chatgpt5.jpg', '2025-01-17', 'PV001', 1250, 'CAT001', 1),

('NEWS002', N'iPhone 16 Pro Max có camera 48MP siêu nét', N'Apple vừa ra mắt iPhone 16 Pro Max với camera chính 48MP, khả năng chụp ảnh trong điều kiện thiếu sáng được cải thiện đáng kể. Ngoài ra, máy còn được trang bị chip A18 Pro mạnh mẽ, màn hình 6.7 inch với tần số quét 120Hz. Giá bán từ 999 USD.', 'iphone16.jpg', '2025-01-16', 'PV002', 2100, 'CAT001', 1),

('NEWS003', N'Java 21 ra mắt với tính năng Virtual Threads', N'Oracle vừa phát hành Java 21 với tính năng Virtual Threads giúp cải thiện hiệu suất xử lý đa luồng. Tính năng này cho phép tạo hàng triệu thread mà không tốn nhiều tài nguyên hệ thống. Các developer Java có thể dễ dàng viết code bất đồng bộ mà không cần phức tạp hóa.', 'java21.jpg', '2025-01-15', 'PV003', 890, 'CAT002', 1),

('NEWS004', N'React 19 beta với Server Components', N'Meta vừa phát hành React 19 beta với tính năng Server Components cho phép render component trên server. Điều này giúp cải thiện hiệu suất và SEO của ứng dụng web. React 19 còn có nhiều tính năng mới như automatic batching và concurrent features.', 'react19.jpg', '2025-01-14', 'PV004', 1560, 'CAT002', 1),

('NEWS005', N'Bitcoin vượt mốc 100,000 USD', N'Giá Bitcoin đã vượt mốc 100,000 USD lần đầu tiên trong lịch sử, tạo ra sự phấn khích lớn trong cộng đồng crypto. Các chuyên gia dự đoán giá có thể tiếp tục tăng do nhu cầu đầu tư từ các tổ chức lớn và việc áp dụng rộng rãi công nghệ blockchain.', 'bitcoin100k.jpg', '2025-01-13', 'PV001', 3200, 'CAT003', 1),

('NEWS006', N'Google phát triển AI có thể viết code', N'Google vừa công bố dự án AI mới có khả năng viết code tự động dựa trên mô tả bằng ngôn ngữ tự nhiên. AI này có thể hiểu yêu cầu của developer và tạo ra code hoàn chỉnh cho nhiều ngôn ngữ lập trình khác nhau. Điều này có thể thay đổi cách chúng ta phát triển phần mềm.', 'google-ai-code.jpg', '2025-01-12', 'PV002', 1800, 'CAT001', 0),

('NEWS007', N'Microsoft mua lại GitHub với giá 7.5 tỷ USD', N'Microsoft đã hoàn tất việc mua lại GitHub với giá 7.5 tỷ USD, tạo ra sự chấn động trong cộng đồng developer. GitHub sẽ tiếp tục hoạt động độc lập nhưng sẽ được tích hợp sâu hơn với các dịch vụ của Microsoft như Azure và Visual Studio.', 'microsoft-github.jpg', '2025-01-11', 'PV003', 950, 'CAT002', 0);
