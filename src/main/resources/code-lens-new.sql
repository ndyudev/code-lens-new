-- Tạo cơ sở dữ liệu (nếu chưa tồn tại)
CREATE DATABASE code_lens_new;
USE code_lens_new;
drop database code_lens_new
USE java3_servlet_jsp;


SELECT DB_NAME() AS CurrentDB;
GO
SELECT * FROM NEWS;

use QLDEAN

-- Bảng CATEGORIES (Loại tin)
CREATE TABLE CATEGORIES (
    Id VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL
);

-- Bảng USERS (Người dùng)
CREATE TABLE USERS (
    Id VARCHAR(20) PRIMARY KEY,
    Password VARCHAR(100) NOT NULL,
    Fullname VARCHAR(100) NOT NULL,
    Birthday DATE NOT NULL,
    Gender BIT NOT NULL DEFAULT 0, -- 0 cho nam, 1 cho nữ
    Mobile VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Role BIT NOT NULL DEFAULT 0 -- 0 cho phóng viên, 1 cho quản trị
);

-- Bảng NEWSLETTERS (Danh sách email nhận tin)
CREATE TABLE NEWSLETTERS (
    Email VARCHAR(100) PRIMARY KEY,
    Enabled BIT NOT NULL DEFAULT 1 -- 1 cho hiệu lực, 0 cho không hiệu lực
);

-- Bảng NEWS (Tin tức)
CREATE TABLE NEWS (
    Id VARCHAR(20) PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Content TEXT,
    Image VARCHAR(255),
    PostedDate DATE NOT NULL,
    Author VARCHAR(20) NOT NULL,
    ViewCount INT DEFAULT 0,
    CategoryId VARCHAR(20) NOT NULL,
    Home BIT DEFAULT 0, -- 0 cho không xuất hiện trang chủ, 1 cho xuất hiện
    FOREIGN KEY (Author) REFERENCES USERS(Id),
    FOREIGN KEY (CategoryId) REFERENCES CATEGORIES(Id)
);

INSERT INTO CATEGORIES (Id, Name) VALUES
('CAT001', 'Công nghệ'),
('CAT002', 'Tin tức'),
('CAT003', 'Giáo dục'),
('CAT004', 'Thể thao'),
('CAT005', 'Kinh tế'),
('CAT006', 'Giải trí'),
('CAT007', 'Môi trường'),
('CAT008', 'Sức khỏe'),
('CAT009', 'Du lịch'),
('CAT010', 'Khoa học');

INSERT INTO USERS (Id, Password, Fullname, Birthday, Gender, Mobile, Email, Role) VALUES
('PV001', 'pass123', 'Nguyen Van A', '1990-05-15', 0, '0901234567', 'nva@example.com', 0),
('PV002', 'pass456', 'Tran Thi B', '1992-08-20', 1, '0907654321', 'ttb@example.com', 0),
('PV003', 'pass789', 'Le Van C', '1988-03-10', 0, '0912345678', 'lvc@example.com', 0),
('PV004', 'pass101', 'Pham Thi D', '1995-11-25', 1, '0918765432', 'ptd@example.com', 0),
('PV005', 'pass202', 'Hoang Van E', '1986-07-30', 0, '0923456789', 'hve@example.com', 0),
('ADM001', 'admin123', 'Nguyen Van F', '1980-01-15', 0, '0934567890', 'nvf@example.com', 1),
('ADM002', 'admin456', 'Tran Thi G', '1983-04-20', 1, '0939876543', 'ttg@example.com', 1),
('PV006', 'pass303', 'Le Thi H', '1993-09-05', 1, '0945678901', 'lth@example.com', 0),
('PV007', 'pass404', 'Pham Van I', '1987-12-12', 0, '0956789012', 'pvi@example.com', 0),
('PV008', 'pass505', 'Hoang Thi K', '1991-06-18', 1, '0967890123', 'htk@example.com', 0);

INSERT INTO NEWSLETTERS (Email, Enabled) VALUES
('user1@example.com', 1),
('user2@example.com', 1),
('user3@example.com', 1),
('user4@example.com', 0),
('user5@example.com', 1),
('user6@example.com', 1),
('user7@example.com', 0),
('user8@example.com', 1),
('user9@example.com', 1),
('user10@example.com', 1);


INSERT INTO NEWS (Id, Title, Content, Image, PostedDate, Author, ViewCount, CategoryId, Home)
VALUES 
('NEWS001',
 N'Công nghệ AI đang thay đổi thế giới',
 N'AI ngày càng được ứng dụng rộng rãi trong nhiều lĩnh vực như y tế, giáo dục và tài chính.',
 'ai_world.jpg',
 '2025-01-10',
 'PV001',
 1200,
 'CAT001',
 1),
('NEWS002',
 N'Giáo dục trực tuyến sau đại dịch',
 N'Các nền tảng học trực tuyến phát triển mạnh mẽ sau đại dịch, giúp người học linh hoạt hơn.',
 'online_learning.jpg',
 '2025-02-14',
 'PV002',
 890,
 'CAT003',
 1),
('NEWS003',
 N'Kinh tế toàn cầu phục hồi mạnh mẽ',
 N'Sau giai đoạn khó khăn, nhiều nền kinh tế đang lấy lại đà tăng trưởng.',
 'global_economy.jpg',
 '2025-03-02',
 'PV003',
 1330,
 'CAT005',
 0),
('NEWS004',
 N'Đội tuyển Việt Nam giành chiến thắng lịch sử',
 N'Tuyển Việt Nam tạo nên cơn địa chấn khi thắng đội mạnh hàng đầu châu Á.',
 'vietnam_team.jpg',
 '2025-04-18',
 'PV004',
 2540,
 'CAT004',
 1),
('NEWS005',
 N'Cập nhật xu hướng công nghệ năm 2025',
 N'Những công nghệ nổi bật năm 2025 gồm AI, điện toán lượng tử và thực tế ảo.',
 'tech_trends_2025.jpg',
 '2025-05-06',
 'PV005',
 1450,
 'CAT001',
 1),
('NEWS006',
 N'Bí quyết cân bằng công việc và cuộc sống',
 N'Nhiều người trẻ chia sẻ cách duy trì năng lượng và sức khỏe tinh thần.',
 'work_life_balance.jpg',
 '2025-05-25',
 'PV006',
 720,
 'CAT008',
 0),
('NEWS007',
 N'Truyền thông số và xu hướng marketing mới',
 N'Marketing 5.0 tập trung vào cá nhân hóa trải nghiệm người dùng bằng AI.',
 'digital_marketing.jpg',
 '2025-06-11',
 'PV007',
 1130,
 'CAT002',
 1),
('NEWS008',
 N'Thể thao điện tử bùng nổ tại Việt Nam',
 N'Esports đang thu hút đông đảo giới trẻ và trở thành ngành công nghiệp tỷ đô.',
 'esports_vn.jpg',
 '2025-06-30',
 'PV008',
 1670,
 'CAT004',
 1),
('NEWS009',
 N'Cách mạng năng lượng xanh',
 N'Năng lượng tái tạo giúp giảm phát thải carbon và bảo vệ môi trường.',
 'green_energy.jpg',
 '2025-07-05',
 'PV002',
 950,
 'CAT007',
 0),
('NEWS010',
 N'Sức khỏe tinh thần trong xã hội hiện đại',
 N'Chuyên gia khuyến nghị nên tập thể dục và thiền định mỗi ngày.',
 'mental_health.jpg',
 '2025-07-10',
 'PV003',
 1340,
 'CAT008',
 1),
('NEWS011',
 N'Blockchain vượt ra ngoài lĩnh vực tài chính',
 N'Công nghệ blockchain được ứng dụng trong chuỗi cung ứng và bầu cử điện tử.',
 'blockchain_future.jpg',
 '2025-07-18',
 'PV001',
 890,
 'CAT001',
 0),
('NEWS012',
 N'Kỳ nghỉ xanh: Du lịch bền vững lên ngôi',
 N'Du lịch thân thiện môi trường giúp bảo tồn thiên nhiên và giảm rác thải nhựa.',
 'eco_tourism.jpg',
 '2025-07-25',
 'PV004',
 1640,
 'CAT009',
 1),
('NEWS013',
 N'Giải trí kỹ thuật số thống trị màn ảnh nhỏ',
 N'Nội dung video ngắn và nền tảng streaming đang chiếm lĩnh thị trường.',
 'digital_entertainment.jpg',
 '2025-08-01',
 'PV005',
 2100,
 'CAT006',
 1),
('NEWS014',
 N'Khoa học dữ liệu – nghề hot của tương lai',
 N'Nhu cầu nhân lực data science tăng mạnh trong các công ty công nghệ.',
 'data_science.jpg',
 '2025-08-09',
 'PV006',
 1920,
 'CAT010',
 0),
('NEWS015',
 N'Việt Nam đạt thành tích cao tại Olympic Toán học',
 N'Học sinh Việt Nam tiếp tục ghi dấu ấn trên đấu trường quốc tế.',
 'math_olympic.jpg',
 '2025-08-17',
 'PV007',
 870,
 'CAT003',
 1),
('NEWS016',
 N'Các ngân hàng đẩy mạnh chuyển đổi số',
 N'Công nghệ giúp giao dịch nhanh chóng, giảm chi phí vận hành và tăng bảo mật.',
 'digital_banking.jpg',
 '2025-08-25',
 'PV008',
 990,
 'CAT005',
 1),
('NEWS017',
 N'Công nghệ VR thay đổi cách học ngoại ngữ',
 N'Học viên có thể tương tác thực tế trong môi trường ảo để luyện nói.',
 'vr_learning.jpg',
 '2025-09-02',
 'PV001',
 760,
 'CAT003',
 0),
('NEWS018',
 N'Thời tiết cực đoan gia tăng do biến đổi khí hậu',
 N'Nhiều khu vực ghi nhận mức nhiệt cao kỷ lục và bão dữ dội hơn.',
 'climate_change.jpg',
 '2025-09-10',
 'PV002',
 1190,
 'CAT007',
 1),
('NEWS019',
 N'Những xu hướng thể thao mới năm 2025',
 N'Người trẻ chuộng các môn thể thao ngoài trời và thể hình công nghệ.',
 'sports_trends.jpg',
 '2025-09-18',
 'PV003',
 1520,
 'CAT004',
 0),
('NEWS020',
 N'AI trong sáng tạo nghệ thuật',
 N'Nghệ sĩ và AI hợp tác tạo nên các tác phẩm độc đáo, gây nhiều tranh cãi.',
 'ai_art.jpg',
 '2025-09-25',
 'PV004',
 1780,
 'CAT006',
 1),
('NEWS021',
 N'Sam Altman - chênh vênh giữa người hùng và kẻ phản diện',
 N'Tốc độ hành động nhanh chóng của Sam Altman, nhà đồng sáng lập và CEO OpenAI, khiến các lãnh đạo công nghệ vừa tán dương vừa lo ngại.
Vài tuần qua, Sam Altman khiến giới công nghệ "choáng váng" trước những bước đi dồn dập như ký thỏa thuận điện toán quy mô lớn với AMD và Nvidia, ra mắt Sora 2 - ứng dụng tạo video AI thu hút một triệu người dùng sau 5 ngày. CEO OpenAI cũng giới thiệu Instant Checkout, tính năng mua sắm trực tiếp trong ChatGPT, và bộ công cụ AI hỗ trợ công việc nội bộ - dấu hiệu cho thấy công ty có thể lấn sân sang mảng phần mềm doanh nghiệp.
Aaron Levie, CEO công ty lưu trữ đám mây Box, nhận xét Altman "là một trong những nhà sáng lập tham vọng nhất hiện nay", đồng thời so sánh làn sóng AI với thời kỳ Internet và điện toán di động bắt đầu bùng nổ.
Levie và nhiều lãnh đạo công nghệ khác nhận định thành công trong kinh doanh đòi hỏi động lực liên tục. Nhưng kể cả khi xét trên tiêu chuẩn khởi nghiệp, tốc độ của Altman vẫn rất ấn tượng. Joel Milne, CEO AutoUnify, startup chuyên phát triển ứng dụng thương mại AI, nói với Business Insider: "Tôi không thể tưởng tượng nổi việc di chuyển với tốc độ của họ. Chuyện này chưa từng có tiền lệ".',
 'CNghe_21.jpg',
 '2025-10-13',
 'PV001',
 2000,
 'CAT001',
 1),
('NEWS022',
 N'Robot hình người có thể chịu mọi điều kiện thời tiết',
 N'Interesting Engineering hôm 10/10 đưa tin công ty công nghệ Deep Robotics có trụ sở ở Hàng Châu, Trung Quốc, giới thiệu robot hình người DR02, một robot công nghiệp được thiết kế để hoạt động trong mọi điều kiện thời tiết.
Phần lớn robot trên thị trường gặp khó khăn khi hoạt động trong điều kiện thực tế với biến động nhiệt độ dẫn tới hạn chế ứng dụng thực tiễn. DEEP Robotics hướng tới giải quyết thách thức lớn này khi thiết kế DR02. Khác với những đối thủ cạnh tranh như Agibot, Unitree Robotics, và UBTech, DR02 là robot hình người đầu tiên trên thế giới đạt tiêu chuẩn bảo vệ của quốc tế IP66, có thể chống bụi và mưa.
DR02 cao 175 cm và nặng khoảng 65 kg, tập trung vào vận hành bền bỉ ngoài trời, có thể hoạt động trong khoảng từ -20 đến 55 độ C, chịu độ ẩm, mưa và bụi. Robot này có tốc độ đi bộ 1,5 m/s và có thể nâng tối đa 10 kg. Các kỹ sư có thể thay đổi nhanh những bộ phận chính của nó như tay và chân để giảm thiểu thời gian bảo dưỡng khi cần.
Theo Deep Robotics, DR02 có sức mạnh tính toán 275 TOPS (tức 275 nghìn tỷ phép tính mỗi giây) và trang bị bộ cảm biến cao cấp bao gồm LiDAR, cảm biến độ sâu và camera góc rộng. Hệ thống tích hợp này cho phép robot phát hiện chướng ngại vật, tạo ra bản đồ chi tiết và chủ động điều chỉnh cử động theo thời gian thực. Kết hợp sức mạnh, độ nhanh nhẹn, khả năng nhận thức và độ bền trong môi trường, DR02 được chế tạo để triển khai trong những lĩnh vực yêu cầu cao như tuần tra an ninh, giám sát công nghiệp và hoạt động logistic.
Trước đó, Deep Robotics đạt bước tiến lớn với robot 4 chân Jueying dùng cho giám sát công nghiệp. Theo Li Chang-bo, giám đốc bán hàng tại thị trường Hàn Quốc, sản phẩm của Deep Robotics rẻ hơn trung bình 20-30% so với đối thủ với công nghệ không khác biệt nhiều.
Việc công ty ra mắt robot DR02 lấp đầy khoảng trống về hoạt động của robot hình người trong môi trường ngoài trời phức tạp, cung cấp giải pháp mới cho nhiều ngành công nghiệp như vận hành nhà máy.',
 'CNghe_22.jpg',
 '2025-10-13',
 'PV001',
 2280,
 'CAT001',
 0),
('NEWS023',
 N'Xu hướng lập trình Vibe Coding tại Việt Nam',
 N'Nhiều người dùng, gồm cả lập trình viên nhiều năm kinh nghiệm, bắt đầu sử dụng AI trong lập trình (Vibe Coding) dù chưa mạo hiểm tin tưởng hoàn toàn.
Vibe Coding là thuật ngữ có từ lâu để chỉ phong cách "viết code theo cảm tính", không chú trọng cấu trúc hay chi tiết, miễn sản phẩm hoạt động được. Trong bối cảnh trí tuệ nhân tạo bùng nổ, Vibe Coding hiện được dùng để chỉ việc tạo phần mềm với sự trợ giúp của AI. Trong đó, người dùng sử dụng ngôn ngữ tự nhiên để mô tả chức năng của phần mềm, thay vì gõ từng dòng code cụ thể. AI sẽ tạo mã nguồn dựa trên mô tả đó và chỉnh sửa theo yêu cầu cho đến khi đạt kết quả mong muốn. Trong nhiều trường hợp, người dùng không cần hiểu chi tiết về code, chỉ quan tâm phần mềm có hoạt động được hay không, giao diện hoặc trải nghiệm tổng thể đã ổn chưa.
Hoàng Long, lập trình viên tại một tập đoàn công nghệ ở TP HCM, cho biết đã ứng dụng Vibe Coding khoảng ba tháng qua. Anh sử dụng song song các công cụ Claude của Anthropic cho tác vụ chuyên sâu, Google Gemini Pro cho ứng dụng liên quan đến Google hay ChatGPT của OpenAI để gỡ lỗi. Thỉnh thoảng, anh thử một số công cụ nguồn mở và sản phẩm trong nước, như LunaBase hay Bizino AI.
"Thay vì gõ từng dòng code như trước, việc áp dụng AI giúp tôi giảm một nửa, thậm chí 2/3 thời gian thực hiện công việc được giao", anh nói. "Tôi cũng làm các dự án đơn giản bên ngoài nhanh hơn, nhiều khi -viết là ăn ngay-, thường là game hoặc phần mềm tiện ích nhỏ gọn để đưa lên App Store hoặc Play Store".',
 'CNghe_23.jpg',
 '2025-10-13',
 'PV001',
 1128,
 'CAT001',
 1),
('NEWS024',
 N'Robot AI học cách tạo ra con người',
 N'Công nghệ thụ tinh ống nghiệm (IVF) tự động hóa bằng robot AI mang đến hy vọng cho người hiếm muộn nhờ khả năng sàng lọc, đo lường chính xác.
Tháng 6, Alin Quintana, 34 tuổi, bước vào Hope IVF, phòng khám thụ tinh ống nghiệm (IVF) ở Mexico City, với tâm lý đây sẽ là lần cuối cùng sau 8 năm thất bại với 96 chu kỳ hy vọng rồi lại tuyệt vọng. Nhưng khác trước, lần này, robot AI sẽ giúp cô tạo ra em bé.
Kể từ khi IVF xuất hiện cuối thập niên 1970, hơn 13 triệu em bé đã chào đời nhờ công nghệ này. Tuy nhiên, quy trình phụ thuộc nhiều vào thao tác thủ công của chuyên gia y tế, từ hút những nang trứng tí hon, chọn tinh trùng tốt nhất đang bơi trong đĩa petri với kính hiển vi công suất cao đến dùng dụng cụ giống kim tiêm siêu nhỏ và điều chỉnh lực chính xác để đẩy tinh trùng vào giữa quả trứng nhỏ hơn hạt gạo nhiều lần. Toàn bộ quá trình rất tinh vi và khó thực hiện, khiến tỷ lệ thành công của IVF chỉ khoảng 50%, kể cả trong những điều kiện tốt nhất.
Giờ đây, robot và trí tuệ nhân tạo đang thay đổi điều đó. Trong ba năm qua, ít nhất 20 em bé đã chào đời thông qua những thử nghiệm lâm sàng liên quan đến tự động hóa với rất ít hoặc không có sự can thiệp của con người. Phần mềm thị giác máy tính tương tự loại dùng cho xe tự lái có thể lập tức chọn ra những "ứng viên khỏe nhất" trong hàng trăm nghìn tinh trùng chỉ bằng một phần nhỏ sợi tóc. Khả năng này vượt xa bất cứ con mắt nào của nhà phôi học được đào tạo. Cánh tay robot có thể thu thập tinh trùng được chọn, trộn các hóa chất cần thiết để trứng khỏe mạnh, sau đó nhẹ nhàng thụ tinh cho trứng, khởi đầu cho sự thụ thai.',
 'CNghe_24.jpg',
 '2025-10-12',
 'PV001',
 1635,
 'CAT001',
 0),
('NEWS025',
 N'Hành trình từ bỏ -giấc mơ Mỹ-, trở về Trung Quốc của nhà khoa học AI',
 N'Từng coi Mỹ là thánh đường khoa học, Song-Chun Zhu, Giám đốc sáng lập Viện Trí tuệ nhân tạo Tổng quát Bắc Kinh (BigAI), đặt vé một chiều về Trung Quốc để nhận sự hỗ trợ nghiên cứu mà Mỹ không thể cung cấp.
Song-Chun Zhu sinh năm 1968 tại vùng nông thôn ở Ngạc Châu, tỉnh Hồ Bắc. Lớn lên trong cửa hàng tạp hóa của cha, ông được nghe vô số câu chuyện về cảnh nghèo đói và khổ cực xung quanh. "Thật sự rất khó khăn", Zhu chia sẻ với Guardian. "Mọi người đều rất nghèo".
Một ngày, khi tình cờ tìm thấy sổ gia phả của gia đình, Zhu hỏi tại sao chỉ ghi ngày sinh và ngày mất của tổ tiên mà không ghi gì về cuộc đời họ. Người giữ sổ bình thản nói họ là nông dân và không có gì đáng ghi chép. Câu trả lời khiến Zhu hoảng sợ và quyết tâm rằng số phận của mình sẽ khác.
Zhu là học sinh top đầu tại trường trung học địa phương và đậu một trong những đại học tốt nhất cả nước, Đại học Khoa học và Công nghệ Trung Quốc (USTC) ở thành phố Hợp Phì, chuyên ngành khoa học máy tính. Năm 1986, quan hệ Mỹ - Trung đã bình thường hóa. Một số giáo sư của trường được nhà nước tài trợ sang Mỹ và mang về nhiều sách để dịch. "Thời đó, chúng tôi coi Mỹ như một ngọn hải đăng, một thánh đường khoa học", ông nói.',
 'CNghe_25.jpg',
 '2025-10-12',
 'PV001',
 1131,
 'CAT001',
 1),
('NEWS026',
 N'Meta tiếp tục lôi kéo các nhà sáng lập startup AI',
 N'Startup Thinking Machines Lab xác nhận nhà đồng sáng lập Andrew Tulloch đã rời công ty để quay về công ty cũ Meta.
"Andrew Tulloch quyết định theo đuổi một con đường khác với lý do cá nhân", phát ngôn viên của Thinking Machines Lab cho biết, thêm rằng những đóng góp của Tulloch là nền tảng đưa công ty đến vị thế hôm nay.
Tulloch là nhà nghiên cứu hàng đầu trong lĩnh vực AI, từng làm tại Meta 11 năm. Ông rời đi năm 2023 để gia nhập OpenAI, sau đó lập Thinking Machines Lab cùng với cựu CTO Mira Murati đầu năm nay.
Theo Economic Times, Thinking Machines Lab là startup AI hoạt động vì lợi ích cộng đồng, hướng đến xây dựng hệ thống AI đa năng, dễ tiếp cận và có đạo đức. Công ty có khoảng 30 kỹ sư và nhà nghiên cứu, gần 2/3 trong số đó là cựu nhân viên OpenAI.
Hồi tháng 8, WSJ đưa tin Mark Zuckerberg, CEO Meta, đề nghị mua lại Thinking Machines Lab. Dù thất bại, Zuckerberg cố gắng chiêu mộ Tulloch bằng gói đãi ngộ được cho là 1,5 tỷ USD trong ít nhất 6 năm. Tuy nhiên, một phát ngôn viên Meta khi đó cho biết thông tin này không chính xác.
Những tháng qua, Meta nỗ lực thu hút nhân tài AI. Tháng 6, công ty chi 14,3 tỷ USD mua 49% cổ phần của Scale AI và chiêu mộ thành công nhà sáng lập kiêm CEO Alexandr Wang. Họ cũng chi mạnh để lôi kéo Nat Friedman - cựu CEO GitHub, Daniel Gross - nhà đồng sáng lập Safe Superintelligence và nhiều nhà nghiên cứu từ OpenAI, DeepMind, Anthropic.
Báo cáo tháng 8 của SignalFire, tập trung chủ yếu vào nhân tài kỹ thuật, cho thấy Meta đã ráo riết tuyển dụng với tốc độ gấp đôi so với tốc độ nhân tài rời đi. Zuckerberg được cho là đã tuyển dụng ít nhất 18 nhà nghiên cứu từ OpenAI, đồng thời cố gắng giành lại những người để mất trước đó như cựu giám đốc kỹ thuật cấp cao Joel Pobar và kỹ sư nghiên cứu Anton Bakhtin, từng chuyển đến Anthropic năm 2023.
Trong nỗ lực thu hút nhân tài, Zuckerberg tung ra những mức đãi ngộ khổng lồ. Theo WSJ, có ít nhất hai lần CEO Meta đưa ra gói lương trị giá hơn một tỷ USD, trả trong nhiều năm.',
 'CNghe_26.jpg',
 '2025-10-12',
 'PV004',
 1159,
 'CAT001',
 0),
('NEWS027',
 N'Cobot - cỗ máy giúp đẩy nhanh quá trình -hồi sinh- sản xuất Mỹ',
 N'Những mẫu robot cỡ nhỏ làm việc cùng con người, gọi là cobot, được đánh giá đang giúp đẩy nhanh quá trình phục hồi ngành sản xuất của Mỹ.
"Nói một cách đơn giản, tự động hóa chính là chìa khóa cho việc chuyển sản xuất về nước", Greg LeFevre, CEO kiêm Chủ tịch của Raymath, công ty thuộc lĩnh vực chế tạo máy móc có trụ sở tại Ohio, nói với WSJ.
Raymath có tuổi đời hơn 40 năm, chuyên về sản xuất máy móc thực phẩm, phụ tùng máy xúc đất, tủ máy chủ trung tâm dữ liệu... Nhưng trước khi LeFevre tiếp quản vị trí lãnh đạo vào năm 2019, công ty gần như không có hệ thống tự động hóa nào.
Hai năm sau, LeFevre bổ sung hệ thống đầu tiên cho nhà máy, nhưng không phải robot cỡ lớn. Thay vào đó, ông đưa vào vận hành cobot - loại robot được thiết kế để làm việc cùng con người trong không gian chung, không cần rào chắn an toàn lớn như robot công nghiệp truyền thống. Hiện Raymath có 13 cobot vận hành.
Kể từ khi sử dụng cobot, năng suất lao động của Raymath tăng vọt. Việc kết hợp máy móc với công nhân giúp sản lượng tăng gấp bốn lần và doanh thu gấp ba lần so với trước, cũng như cải thiện năng lực cạnh tranh của công ty trên thị trường.
Sự trợ giúp của máy móc không khiến nhân công của Raymath bị giảm đi. Trái lại, LeFevre tiếp tục mở rộng quy mô lực lượng lao động trung bình từ 130 lên 145 người trong mỗi bộ phận. Công nhân chuyển từ việc mài, hàn, vận hành máy móc và vận chuyển linh kiện sang giám sát, cộng tác với robot để tăng hiệu quả công việc.
Raymath sử dụng robot hàn từ THG Automation, có trụ sở tại Indianapolis. So với hệ thống robot phức tạp, cobot được đánh giá dễ sử dụng hơn. Người vận hành có thể lập trình đơn giản qua giao diện máy tính bảng hoặc điều khiển thực hiện các chuỗi hành động cụ thể. Trong khi đó, robot đời cũ phổ biến tại Mỹ từ những năm 1960 đến robot cỡ lớn đòi hỏi nhiều năm đào tạo.
Theo Josh Pawley, nhà đồng sáng lập Vectis Automation - công ty tại Colorado, hàng chục doanh nghiệp tại Mỹ đang sử dụng cobot chuyên dụng. Được thành lập năm 2019, Vectis Automation là một trong những công ty đầu tiên ở Mỹ lắp ráp cobot hàn và là đối thủ cạnh tranh của THG Automation.
Từng là loại máy móc xa xỉ dành riêng cho nhà máy lớn, cobot với đặc tính nhỏ gọn, thông minh, linh hoạt và chi phí vừa phải đang mang tự động hóa đến với mọi nhà sản xuất, bất kể quy mô. "Robot này không chỉ là một tiện ích. Sự phục hồi chậm chạp và mong manh của ngành sản xuất hàng hóa Mỹ sẽ không thể thực hiện nếu không có chúng", WSJ bình luận.
Dữ liệu do Federal Reserve Bank of St. Louis công bố hồi tháng 8 cho thấy số công ty Mỹ sản xuất hàng hóa vật chất đã chạm mức thấp nhất vào năm 2014 và chưa có dấu hiệu cải thiện. Trong khi đó, Mỹ đang "mắc kẹt" trong tình trạng thiếu hụt lao động, trong khi lao động lành nghề ngày một già hóa và ít phương án thay thế, dù nước này đang có chính sách thu hút đưa sản xuất quay lại Mỹ.
Giới chuyên gia đánh giá, cobot đang là một phần của xu hướng rộng hơn trong ngành robot. Chúng cộng sinh với con người, có thể thích ứng với nhiều biến động so với các loại robot công nghiệp trước đây. Loại này đóng vai trò thiết yếu cho sự phát triển của Amazon nhờ tốc độ xử lý đơn hàng siêu nhanh và đang được ứng dụng vào sản xuất tại Mỹ.
Cobot khác xa so với robot hình người. Robot hình người hiện vẫn thiếu sức mạnh, sự khéo léo và không có các bộ phận chuyên biệt, như tích hợp máy hàn hoặc máy mài. Trên lý thuyết, một ngày nào đó robot hình người có thể cầm máy hàn hay dụng cụ mài, nhưng khiến chúng đủ khéo léo vẫn là thách thức lớn. "Bàn tay, gồm cả cẳng tay, là phần khó khăn về mặt kỹ thuật của robot hình người", Elon Musk viết trên X tháng trước.
Theo Grand View Research, thị trường cobot Mỹ năm 2024 đạt khoảng 133,1 triệu USD, dự kiến tăng với tốc độ hàng năm 29,7% trong giai đoạn từ 2025 đến 2030. Chúng được ứng dụng trong ngành sản xuất như lắp ráp, kiểm tra chất lượng, gia công, hỗ trợ máy lớn; logistics như vận chuyển nội bộ, phân loại kiện hàng; lắp linh kiện điện tử và vi mạch; ứng dụng trong đóng gói, đóng hộp, kiểm tra ở lĩnh vực thực phẩm, dược phẩm.
Trung Quốc vẫn là quốc gia dẫn đầu về ứng dụng robot sản xuất ở nhiều mức độ khác nhau với đội quân hai triệu robot công nghiệp, theo báo cáo World Robotics 2025 của Liên đoàn Robot quốc tế (IFR) hồi tháng 9. Trong khi đó, lĩnh vực sản xuất Mỹ hiện chưa thể sánh kịp cả về khối lượng và chất lượng, thậm chí bị ví là "David đấu với Goliath". Tuy nhiên, các công ty Mỹ vẫn cạnh tranh bằng cách sử dụng tự động hóa để xử lý lô hàng nhỏ hơn trong thời hạn gấp rút.
Jack Callender, Chủ tịch của Caltech Manufacturing tại Pennsylvania, cho biết các khách hàng của công ty ưu tiên sản xuất trong nước dù giá đắt hơn. Công ty có 80 nhân viên, chủ yếu tạo ra bộ phận kim loại cho thiết bị y tế, xe, máy móc khoa học và công nghiệp. Việc bổ sung hệ thống tự động hóa giúp tăng năng suất, chẳng hạn máy cắt laser có thể tự nạp kim loại vào khay, tương tự máy in nạp giấy tự động. Theo Callender, năng suất trên mỗi công nhân tăng từ hai đến bốn lần.
Bên cạnh phần cứng, một số công ty Mỹ đẩy mạnh phát triển phần mềm. Dyna Robotics, có trụ sở tại California, xây dựng "mô hình nền tảng" cho robot sản xuất với khả năng học cách thực hiện nhiệm vụ thay vì lập trình sẵn. Tháng trước, công ty huy động được 120 triệu USD đầu tư, trong đó có Nvidia và Amazon.
Dù được xem là giải pháp tự động hóa linh hoạt, an toàn và phù hợp bối cảnh sản xuất tại Mỹ, cobot vẫn tồn tại một số hạn chế trong thực tế. Theo Interact Analysis, chi phí đầu tư ban đầu cho cobot, gồm phần cứng, lập trình và tích hợp vào dây chuyền hiện có, là rào cản lớn đối với doanh nghiệp nhỏ và vừa. Quá trình kết nối cobot với hệ thống quản lý sản xuất vẫn đòi hỏi chuyên môn kỹ thuật cao, khiến thời gian triển khai kéo dài và chi phí bảo trì tăng.
Một vấn đề khác là hiệu suất và độ tin cậy của cobot thấp hơn so với robot công nghiệp truyền thống trong các công việc nặng, tốc độ cao hoặc yêu cầu chính xác tuyệt đối. Theo Mordor Intelligence, doanh nghiệp Mỹ còn lo ngại về tiêu chuẩn an toàn, độ bền cơ học và rủi ro khi con người làm việc quá gần robot. Ngoài ra, thiếu hụt kỹ sư tự động hóa được đào tạo bài bản cũng khiến việc vận hành, cập nhật phần mềm và xử lý sự cố trở thành thách thức.',
 'CNghe_27.jpg',
 '2025-10-12',
 'PV005',
 2021,
 'CAT001',
 1),
('NEWS028',
 N'Phòng phim tại gia 12 tỷ đồng tại P.H.E Show 2025',
 N'Triển lãm Thiết bị giải trí cá nhân và gia đình P.H.E. Show quy tụ nhiều phòng phim tiền tỷ, nổi bật là hệ thống phối ghép 13 tỷ đồng.
Trong lần thứ hai tổ chức, P.H.E. Show 2025 có quy mô lớn hơn năm ngoái với loạt hệ thống home cinema, phòng giải trí đa năng, thiết bị giải trí và giải pháp nghe nhạc cá nhân. Sự kiện quy tụ hơn 30 phòng nghe từ nhà phân phối trong nước, với các thương hiệu như JBL, Sennheiser, KEF, Lyngdorf Audio, Acoustic Energy, Ascendo, Bowers & Wilkins, Anthem...',
 'CNghe_28.jpg',
 '2025-10-12',
 'PV002',
 2025,
 'CAT001',
 0),
('NEWS029',
 N'Honor Magic V5 - smartphone gập siêu mỏng giá 45 triệu đồng',
 N'Magic V5, smartphone gập mỏng nhất thế giới của Honor, được nâng cấp về độ bền, dung lượng pin và bán tại Việt Nam với giá 45 triệu đồng.
 Honor Magic V5 lên kệ tại Việt Nam từ ngày 11/10. Mức giá của model này cao hơn 5 triệu đồng so với Magic V3, cạnh tranh với hai điện thoại gập ra mắt trước đó của Oppo và Samsung là Find N5 và Galaxy Z Fold 7. Honor vẫn kèm các phụ kiện sạc, cáp kết nối và case bảo vệ theo máy, thay vì cắt giảm như Samsung.
  Sản phẩm tại Việt Nam có 4 màu trắng, đen, vàng và nâu đỏ. Riêng bản màu trắng đạt độ mỏng 8,8 mm khi gập, 4,1 mm khi mở và nặng 217 gam, là smartphone gập mỏng nhất hiện nay vượt qua mức 8,9 mm của Oppo Find N5 và Galaxy Z Fold 7. Trong khi đó, các màu khác có số đo tương ứng 9 m, 4,2 mm và 222 gram. Trải nghiệm thực tế rất khó nhận biết được sự khác biệt về độ dày giữa các mẫu gập hiện nay khi mức chênh lệch chỉ 0,1 mm.
Trên Magic V5, phần khung sườn được làm vát phẳng thay vì bo tròn như trước, tuy nhiên phần màn hình và mặt lưng bo cong dạng 2.5D cho cảm giác cầm và trải nghiệm sử dụng màn hình ngoài tốt hơn thiết kế phẳng hoàn toàn. Cụm camera năm nay dày hơn trước, là điểm trừ trong thiết kế siêu mỏng của máy.
Hai màn hình được tăng kích thước thêm 0,2 inch lên mức lần lượt là 6,45 inch, độ phân giải Full HD+ và 7,95 inch, độ phân giải 2K. Honor cũng mở rộng kích thước bề ngang giúp cho tỷ lệ màn hình ngoài đạt 19.3:9 gần bằng với smartphone thông thường, cho trải nghiệm sử dụng màn hình ngoài tốt nhất hiện nay. Cả hai màn hình đều là tấm nền LTPO OLED tần số quét 120 Hz, độ sáng tối đa 5.000 nit giúp dễ xem nội dung hiển thị dưới trời nắng. Màn hình trong hỗ trợ bút cảm ứng, nhưng người dùng sẽ phài mua thêm phụ kiện này.',
 'CNghe_29.jpg',
 '2025-10-12',
 'PV006',
 2223,
 'CAT001',
 1),
('NEWS030',
 N'Robot giao đồ ăn - xu hướng mới ở đại học Mỹ',
 N'Từ món đồ lạ lẫm, robot giao hàng đang trở thành hình ảnh quen thuộc tại các trường đại học Mỹ.
Hồi mới là sinh viên năm nhất, Peyton Perry nghe tin robot giao hàng sắp xuất hiện trong khuôn viên Đại học Fairfield. Không lâu sau, cô bắt gặp robot đầu tiên ở cửa hàng Starbucks trong trường và háo hức đặt giao đồ.
Khi Perry học năm cuối, robot đã trở thành một phần quen thuộc của đời sống sinh viên. "Mỗi ngày tôi đều thấy các robot đi lại", cô nói với Business Insider, cho biết các nhân viên Starbucks và nhà ăn phải liên tục chất đồ ăn lên chúng.
Điều này không chỉ diễn ra ở Đại học Fairfield. Theo số liệu ba nhà cung cấp robot lớn chia sẻ với Business Insider, ít nhất 78 trường đại học Mỹ hiện đã triển khai robot giao hàng hoạt động.',
 'CNghe_30.jpg',
 '2025-10-13',
 'PV007',
 3128,
 'CAT001',
 0),
('NEWS031',
 N'Lý do giá nhiều tiền số trên Binance -về 0-',
 N'Cuối tuần qua, cú sập của thị trường khiến nhiều đồng tiền số mất giá mạnh, riêng trên sàn Binance có những đồng giảm gần toàn bộ giá trị.
Ngày 11/10, thị trường tiền số trải qua cú sập được đánh giá nghiêm trọng nhất kể từ sự sụp đổ sàn FTX năm 2020, với tổng vốn hóa giảm 850 tỷ USD trong vài giờ. Giá Bitcoin giảm 15% từ 124.000 USD còn 105.000 USD, nhưng altcoin (thuật ngữ chỉ các tiền số khác không phải Bitcoin) còn tệ hơn.',
 'CNghe_31.jpg',
 '2025-10-13',
 'PV008',
 1111,
 'CAT001',
 1),
('NEWS032',
 N'Trái Đất đang trở nên tối hơn',
 N'Các nhà nghiên cứu NASA phát hiện cả hai bán cầu của Trái Đất đều đang tối đi nhưng Bắc bán cầu tối đi nhanh hơn.
  Yahoo hôm 11/10 đưa tin một nghiên cứu mới dựa trên dữ liệu từ 24 năm khảo sát vệ tinh của NASA phát hiện Trái Đất đang trở nên tối hơn với sự khác biệt rõ rệt giữa Bắc bán cầu và Nam bán cầu. Nhóm chuyên gia đứng đầu là Norman G. Loeb ở Trung tâm nghiên cứu Langley của NASA, xem xét dữ liệu thu thập bởi dự án Hệ thống năng lượng bức xạ của mây và Trái Đất (CERES), bắt đầu giai đoạn đầu tiên năm 1997.
Theo NASA giải thích, khí hậu được kiểm soát bởi lượng ánh sáng Mặt Trời mà Trái Đất hấp thụ và lượng năng lượng hồng ngoại phát vào không gian. Những đại lượng này tạo thành ngân sách bức xạ của Trái Đất (ERB), tức sự cân bằng giữa năng lượng bức xạ Mặt Trời mà Trái Đất nhận được và năng lượng bức xạ mà Trái Đất phát ra không gian.
Dự án CERES cung cấp quan sát vệ tinh về ERB và mây, sử dụng kết quả đo lường từ các thiết bị bay trên nhiều vệ tinh cùng dữ liệu từ nguồn khác để tạo ra tập hợp thông tin toàn diện cho nghiên cứu khí hậu, thời tiết và khoa học ứng dụng. ERB là yếu tố quan trọng thúc đẩy lưu thông đại dương và khí quyển, do đó việc xác định chính xác nơi Trái Đất đang nhận và mất năng lượng rất quan trọng trong tình hình khủng hoảng khí hậu ngày càng tồi tệ. Khi đi sâu phân tích dữ liệu, nhóm nghiên cứu phát hiện suất phản chiếu của Trái Đất (lượng bức xạ Mặt Trời mà nó phản xạ trở lại không gian) đang thay đổi.
Theo nhóm nghiên cứu, lưu thông của hệ thống khí quyển - đại dương liên quan chặt chẽ tới sự phân bố năng lượng bức xạ trong hệ thống khí hậu. Sử dụng quan sát từ vệ tinh, các nhà nghiên cứu nhận thấy trong khi cả hai bán cầu đều đang tối đi, Bắc bán cầu tối đi với tốc độ nhanh hơn do hấp thụ nhiều bức xạ Mặt Trời hơn Nam bán cầu nhưng phát ra lượng bức xạ sóng dài cao hơn. Một loạt yếu tố khác như mây, tuyết phủ và hơi nước trong khí quyển đều góp phần vào hiệu ứng này.
Các nghiên cứu trước đây chỉ ra có thể bù đắp sự mất cân bằng giữa hai bán cầu bằng lưu thông của đại dương và khí quyển, nhưng nghiên cứu mới công bố trên tạp chí PNAS cho thấy điều đó không thể bù đắp cho những khác biệt chủ chốt. Tình trạng tối đi của Bắc bán cầu so với Nam bán cầu là do thay đổi của một số đặc điểm như tương tác bức xạ - aerosol, suất phản chiếu bề mặt, hơi nước vốn không thể bù đắp bằng lượng mây, chứng tỏ có một giới hạn đối với vai trò của mây trong việc duy trì cân xứng suất phản chiếu giữa hai bán cầu.
Theo Yahoo, nhóm nghiên cứu cũng phát hiện Bắc bán cầu đang ấm lên nhiều hơn so với Nam bán cầu và vùng nhiệt đới của khu vực này trở nên ẩm ướt hơn, hé lộ thay đổi trong lưu thông khí quyển quy mô lớn trên hành tinh. Trái Đất có ít bề mặt sáng hơn kéo theo hiện tượng ấm lên mạnh hơn, khiến băng tan chảy dẫn tới diện tích bề mặt sáng càng ít hơn và chu kỳ cứ thế lặp lại. Kết quả nghiên cứu cho thấy Bắc bán cầu có thể tiếp tục ấm lên nhanh hơn Nam bán cầu và mây đóng vai trò ít đi trong phân phối lại nhiệt quanh hành tinh.',
 'CNghe_32.jpg',
 '2025-10-13',
 'PV004',
 2356,
 'CAT001',
 0),
('NEWS033',
 N'Việt Nam xây dựng cổng dữ liệu mở về khoa học và công nghệ',
 N'Bộ Khoa học và Công nghệ phê duyệt Chiến lược, đặt mục tiêu đến năm 2030 đưa vào sử dụng Cổng dữ liệu mở, với 5.000 bộ dữ liệu về khoa học công nghệ, đổi mới sáng tạo và chuyển đổi số.
Chiến lược dữ liệu của Bộ Khoa học và Công nghệ đến năm 2030 được Bộ trưởng Nguyễn Mạnh Hùng ký ban hành ngày 12/10. Mục tiêu đến năm 2030, đưa Việt Nam trở thành trung tâm dữ liệu khoa học, công nghệ, đổi mới sáng tạo và chuyển đổi số hàng đầu trong khu vực Đông Nam Á.
Chiến lược xác định, dữ liệu là hạ tầng đóng vai trò then chốt trong đột phá phát triển khoa học, công nghệ, đổi mới sáng tạo và chuyển đổi số quốc gia. Hệ thống dữ liệu của ngành phải trở thành nền tảng dẫn dắt hoạt động nghiên cứu khoa học, phát triển công nghệ và hoạch định chính sách, đồng thời hỗ trợ quản lý nhà nước, tăng hiệu quả đầu tư và điều phối nguồn lực.',
 'CNghe_33.jpg',
 '2025-10-13',
 'PV001',
 1125,
 'CAT001',
 1),
('NEWS034',
 N'Những mẫu máy bay điện tiên tiến nhất thế giới',
 N'Thế hệ máy bay điện mới hiện thực hóa mục tiêu không thải khí, yên tĩnh và hiệu quả thông qua ứng dụng công nghệ pin tiên tiến, vật liệu nhẹ và hệ thống động cơ lai.',
 'CNghe_34.jpg',
 '2025-10-11',
 'PV002',
 1113,
 'CAT001',
 0),
('NEWS035',
 N'Viettel tổ chức hội thảo trí tuệ nhân tạo tại Hà Nội và TP HCM',
 N'Viettel AI Race 2025 khởi động chuỗi hội thảo tại Hà Nội và TP HCM, chia sẻ tri thức và ứng dụng thực tiễn của AI trong đời sống.
Trong bối cảnh AI trở thành nền tảng của nhiều ngành nghề, cuộc thi Viettel AI Race 2025 hướng đến mục tiêu xây dựng một sân chơi học thuật kết hợp trải nghiệm thực tế cho cộng đồng trẻ yêu công nghệ. Chuỗi hội thảo do Viettel tổ chức tại hai thành phố lớn được kỳ vọng mang lại cơ hội tiếp cận tri thức mới, thông qua mô hình: gặp gỡ người thật - nghe chuyện thật - học từ thực tiễn.',
 'CNghe_35.jpg',
 '2025-10-11',
 'PV003',
 1414,
 'CAT001',
 1),
('NEWS036',
 N'Công ty phần mềm Việt đặt mục tiêu kỳ lân công nghệ',
 N'Rikkeisoft, nhà cung cấp dịch vụ phần mềm thuê ngoài (outsourcing), chuyển hướng sang cung cấp giải pháp, đầu tư vào AI với mục tiêu trở thành kỳ lân công nghệ.
Thông điệp được ông Tạ Sơn Tùng, nhà đồng sáng lập kiêm Chủ tịch Rikkeisoft, chia sẻ tại sự kiện Rikkei Global Summit 2025, sáng 10/10. Thành lập năm 2012, công ty hiện là một trong những đơn vị cung cấp dịch vụ công nghệ số lớn tại Việt Nam với hơn 2.200 nhân sự, hoạt động tại 5 thị trường, nổi bật với dịch vụ phần mềm outsourcing và Nhật Bản là thị trường lớn nhất.
Trong bối cảnh ngành phần mềm toàn cầu chuyển mình mạnh mẽ trước tác động của AI, ông Tùng cho biết sẽ đầu tư mạnh vào AI và coi là động lực tăng trưởng cốt lõi. Công ty cũng phát triển nguồn nhân lực thông qua hợp tác với các trường đại học, đồng thời mở rộng thị trường toàn cầu, chuyển từ outsourcing sang cung cấp giải pháp tư vấn công nghệ. Cuối cùng, Rikkeisoft sẽ thực hiện IPO, hướng tới trở thành "unicorn công nghệ" Việt Nam.
"Unicorn" là thuật ngữ chỉ công ty khởi nghiệp có giá trị vốn hóa một tỷ USD. Việt Nam có bốn unicorn gồm VNG, VNLife, MoMo và Sky Mavis. "Để làm được điều này, chúng tôi đặt mục tiêu tăng trưởng 50% mỗi năm", ông Tùng nói.',
 'CNghe_36.jpg',
 '2025-10-11',
 'PV005',
 2020,
 'CAT001',
 0),
('NEWS037',
 N'AI đang thay đổi văn hóa doanh nghiệp',
 N'Nhiều lãnh đạo doanh nghiệp thừa nhận trí tuệ nhân tạo (AI) không chỉ buộc tổ chức của họ phải đổi mới công nghệ, mà còn tái định hình văn hóa trong một không gian giữa người và máy.
Thông tin được đại diện doanh nghiệp chia sẻ tại Diễn đàn Nhân sự & Công nghệ Việt Nam tổ chức ngày 10/10, về đổi mới quản trị nhân lực trong thời đại số.
Theo bà Nguyễn Thị Thu Giang, Phó Chủ tịch kiêm Tổng Thư ký Hiệp hội Phần mềm và Dịch vụ CNTT Việt Nam (VINASA), khi toàn cầu bước vào giai đoạn tăng tốc của chuyển đổi số và AI, mọi doanh nghiệp, dù ở quy mô nào, đều phải trả lời một câu hỏi chung: "Làm thế nào để phát triển con người, xây dựng tổ chức có khả năng thích ứng, sáng tạo và bứt phá trong kỷ nguyên mới?".',
 'CNghe_37.jpg',
 '2025-10-10',
 'PV007',
 2022,
 'CAT001',
 1),
('NEWS038',
 N'Cách AMD thành "thế lực" trong cuộc chiến chip AI',
 N'Chiến lược chuyển hướng nhanh từ card đồ họa cho người dùng máy tính sang chip cho trung tâm dữ liệu và AI được đánh giá giúp AMD bứt phá.
Khi Lisa Su tiếp quản vị trí CEO năm 2014, vốn hóa thị trường của AMD dưới 3 tỷ USD. Sau hơn 10 năm, con số này tăng hơn trăm lần. Thỏa thuận hợp tác với OpenAI ngày 6/10 khiến giá cổ phiếu tăng 24%, đưa giá trị của AMD lên 343 tỷ USD.',
 'CNghe_38.jpg',
 '2025-10-9',
 'PV006',
 2589,
 'CAT001',
 0),
('NEWS039',
 N'"AI cần neo với giá trị con người trong trải nghiệm khách hàng"',
 N'Theo giới chuyên gia, dù AI được ứng dụng càng nhiều trong các dịch vụ trải nghiệm khách hàng (CX), doanh nghiệp vẫn phải ưu tiên yếu tố con người.
"Qua từng giai đoạn phát triển của loài người, khả năng hợp tác, nhu cầu cơ bản về sinh tồn và kết nối, cùng đặc điểm cố hữu như suy nghĩ và cảm xúc là những yếu tố không bao giờ thay đổi. Trong thời đại AI, trải nghiệm khách hàng cũng cần phải neo vào yếu tố này", ông Bruce Temkin, được coi là người thúc đẩy ngành CX, phát biểu tại hội nghị VCXP Global Summit 2025 ngày 7/10 tại TP HCM qua hình thức trực tuyến. Sự kiện do Filum.ai và Hiệp hội Trải nghiệm Khách hàng Toàn cầu (CXPA) tổ chức, quy tụ hơn 250 nhà lãnh đạo, chuyên gia ở lĩnh vực trải nghiệm khách hàng.',
 'CNghe_39.jpg',
 '2025-10-9',
 'PV004',
 2222,
 'CAT001',
 1),
('NEWS040',
 N'Kỹ sư IT lập bản đồ thông tin cứu hộ vùng bão lũ',
 N'Hai kỹ sư trẻ phát triển bản đồ cứu hộ theo thời gian thực, giúp người dân ở tìm kiếm sự trợ giúp nhanh hơn trong bão lũ.
Trong bốn tiếng từ 23h ngày 7/10 đến 3h ngày 8/10, lập trình viên Từ Tất Huân và chuyên gia phát triển sản phẩm AI Nguyễn Thị Mai Anh đã hoàn thành website thongtincuuho.org - bản đồ cứu hộ trực tuyến giúp người dân tiếp cận hỗ trợ nhanh hơn.
Trang web thu thập và hiển thị các điểm cần cứu hộ theo thời gian thực, dựa trên dữ liệu người dân đăng tải trên mạng xã hội. "Mọi người chỉ cần bình luận ở bất kỳ bài viết nào có liên quan đến cứu hộ trên tài khoản mạng xã hội của dự án, hệ thống sẽ tự động tìm, kéo về, phân loại và hiển thị lên bản đồ", Huân lý giải nguyên lý hoạt động của trang.',
 'CNghe_40.jpg',
 '2025-10-8',
 'PV005',
 2121,
 'CAT001',
 0);
