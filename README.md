# 📰 Code Lens News - Hệ Thống Quản Lý Tin Tức

[![Java](https://img.shields.io/badge/Java-17-orange.svg)](https://openjdk.java.net/)
[![Maven](https://img.shields.io/badge/Maven-3.6+-blue.svg)](https://maven.apache.org/)
[![SQL Server](https://img.shields.io/badge/SQL%20Server-2019+-red.svg)](https://www.microsoft.com/en-us/sql-server)
[![Jakarta Servlet](https://img.shields.io/badge/Jakarta%20Servlet-6.1.0-green.svg)](https://jakarta.ee/specifications/servlet/)

## 🎯 Giới Thiệu

**Code Lens News** là một hệ thống quản lý tin tức hiện đại được xây dựng bằng Java Servlet/JSP, cung cấp đầy đủ chức năng cho việc xuất bản, quản lý và chia sẻ tin tức. Hệ thống hỗ trợ 3 vai trò người dùng: **Admin**, **Reporter** và **User** với các quyền hạn khác nhau.

## ✨ Tính Năng Chính

### 🔐 Hệ Thống Phân Quyền
- **Admin**: Quản lý toàn bộ hệ thống, duyệt tin, quản lý người dùng
- **Reporter**: Viết bài, quản lý tin của mình
- **User**: Xem tin tức, đăng ký nhận tin

### 📰 Quản Lý Tin Tức
- ✅ **Tạo/Sửa/Xóa** bài viết
- ✅ **Duyệt tin** (Admin)
- ✅ **Phân loại** theo danh mục
- ✅ **Upload hình ảnh**
- ✅ **Tìm kiếm** và lọc tin
- ✅ **Thống kê** lượt xem

### 📧 Hệ Thống Email
- ✅ **Newsletter** tự động
- ✅ **Thông báo** tin mới
- ✅ **Gửi email** khi duyệt tin
- ✅ **Quản lý** danh sách đăng ký

### 🎨 Giao Diện Người Dùng
- ✅ **Responsive** design
- ✅ **Modern UI** với CSS Variables
- ✅ **Dark/Light** theme
- ✅ **Mobile-friendly**

## 🏗️ Kiến Trúc Hệ Thống

### 📁 Cấu Trúc Project
```
code-lens-new/
├── src/main/java/com/codelensnew/
│   ├── controller/          # Controllers (MVC)
│   │   ├── admin/          # Admin controllers
│   │   ├── reporter/       # Reporter controllers
│   │   ├── user/           # User controllers
│   │   └── auth/           # Authentication
│   ├── dao/                # Data Access Objects
│   │   ├── impl/           # DAO implementations
│   │   └── *.java          # DAO interfaces
│   ├── entity/              # Entity classes
│   ├── utils/               # Utility classes
│   └── filter/              # Servlet filters
├── src/main/webapp/
│   ├── views/               # JSP pages
│   │   ├── layouts/         # Layout templates
│   │   ├── components/      # Reusable components
│   │   └── pages/           # Page templates
│   ├── css/                 # Stylesheets
│   ├── images/              # Static images
│   └── WEB-INF/             # Web configuration
└── src/main/resources/      # Resources & SQL scripts
```

### 🗄️ Cơ Sở Dữ Liệu
- **SQL Server** với 4 bảng chính:
  - `USERS` - Thông tin người dùng
  - `CATEGORIES` - Danh mục tin tức
  - `NEWS` - Bài viết tin tức
  - `NEWSLETTERS` - Danh sách đăng ký nhận tin

## 🚀 Cài Đặt & Chạy

### 📋 Yêu Cầu Hệ Thống
- **Java 17+**
- **Maven 3.6+**
- **SQL Server 2019+**
- **Tomcat 10+** (hoặc servlet container tương đương)

### ⚙️ Cấu Hình

#### 1. **Database Setup**
```sql
-- Tạo database
CREATE DATABASE CodeLensNew;

-- Chạy các script SQL trong thư mục src/main/resources/
-- V1__init_schema.sql
-- V2__insert_categories.sql
-- V3__insert_users.sql
-- V4__insert_data_table_news.sql
-- V5__insert_newsletter_data.sql
-- V6__insert_sample_news.sql
```

#### 2. **Cấu Hình Database**
Sửa file `src/main/java/com/codelensnew/utils/JdbcHelper.java`:
```java
private static final String URL = "jdbc:sqlserver://localhost:1433;databaseName=CodeLensNew;...";
private static final String USERNAME = "your_username";
private static final String PASSWORD = "your_password";
```

#### 3. **Cấu Hình Email**
Sửa file `src/main/java/com/codelensnew/utils/Mailer.java`:
```java
String username = "your_email@gmail.com";
String password = "your_app_password";
```

### 🏃‍♂️ Chạy Ứng Dụng

#### **Cách 1: Maven**
```bash
# Build project
mvn clean package

# Deploy WAR file vào Tomcat
# Copy target/code-lens-new.war vào webapps/
```

#### **Cách 2: IDE (Eclipse/IntelliJ)**
1. Import project vào IDE
2. Cấu hình Tomcat server
3. Run on Server

### 🌐 Truy Cập
- **Trang chủ**: `http://localhost:8080/code-lens-new/`
- **Admin**: `http://localhost:8080/code-lens-new/admin/`
- **Reporter**: `http://localhost:8080/code-lens-new/reporter/`

## 👥 Tài Khoản Mặc Định

### 🔑 Admin
- **Username**: `admin`
- **Password**: `admin123`

### 📝 Reporter
- **Username**: `reporter1`
- **Password**: `reporter123`

### 👤 User
- **Username**: `user1`
- **Password**: `user123`

## 🎨 Giao Diện

### 🖥️ Desktop
- **Layout**: 2 cột (Content + Sidebar)
- **Responsive**: Tự động điều chỉnh
- **Theme**: Modern với CSS Variables

### 📱 Mobile
- **Responsive**: Tối ưu cho mobile
- **Touch-friendly**: Dễ sử dụng trên thiết bị cảm ứng

## 🔧 Công Nghệ Sử Dụng

### **Backend**
- **Java 17** - Ngôn ngữ lập trình
- **Jakarta Servlet 6.1.0** - Web framework
- **Jakarta JSP** - View technology
- **Jakarta JSTL** - JSP Standard Tag Library
- **JDBC** - Database connectivity
- **Jakarta Mail 2.0.1** - Email functionality

### **Frontend**
- **HTML5** - Markup language
- **CSS3** - Styling với Variables
- **JavaScript** - Client-side logic
- **Font Awesome** - Icons
- **Google Fonts** - Typography

### **Database**
- **SQL Server** - Database management
- **JDBC Driver** - Database connectivity

### **Build Tools**
- **Maven** - Dependency management
- **Maven Compiler Plugin** - Java compilation
- **Maven War Plugin** - Web application packaging

## 📊 Chức Năng Chi Tiết

### 🔐 **Authentication & Authorization**
- **Login/Logout** với session management
- **Role-based access control** (Admin/Reporter/User)
- **Password change** cho Reporter
- **Session timeout** handling

### 📰 **News Management**
- **CRUD operations** cho tin tức
- **Image upload** và quản lý
- **Category management** với phân loại
- **Approval workflow** (Admin duyệt tin)
- **View count tracking** và thống kê
- **Search & filter** functionality

### 📧 **Email System**
- **Newsletter subscription** tự động
- **Email validation** với regex
- **Bulk email sending** với BCC
- **Auto-disable** invalid emails
- **HTML email templates** với styling

### 🎨 **User Experience**
- **Recent news tracking** theo session
- **Dynamic sidebar** với dữ liệu real-time
- **Breadcrumb navigation** cho UX tốt
- **Responsive design** cho mọi thiết bị
- **Loading states** và error handling

## 🛠️ Development

### 📝 **Code Style**
- **MVC Pattern** - Tách biệt logic
- **DAO Pattern** - Data access abstraction
- **Service Layer** - Business logic
- **Exception Handling** - Robust error management

### 🧪 **Testing**
- **Unit Testing** - Test individual components
- **Integration Testing** - Test database connections
- **Manual Testing** - User interface testing

### 📦 **Deployment**
- **WAR packaging** - Standard web application
- **Tomcat deployment** - Production ready
- **Database migration** - Version control cho DB

## 🤝 Contributing

### 📋 **Guidelines**
1. **Fork** repository
2. **Create** feature branch
3. **Commit** changes với clear messages
4. **Push** to branch
5. **Create** Pull Request

### 🔍 **Code Review**
- **Clean code** principles
- **Documentation** cho complex logic
- **Error handling** comprehensive
- **Security** best practices

## 📄 License

**MIT License** - Xem file `LICENSE` để biết thêm chi tiết.

## 📞 Support

### 🐛 **Bug Reports**
- Tạo issue với description chi tiết
- Include steps to reproduce
- Attach screenshots nếu cần

### 💡 **Feature Requests**
- Mô tả tính năng mong muốn
- Explain use case
- Provide mockups nếu có

### 📧 **Contact**
- **Email**: chauunhatduyyit@gmail.com
- **GitHub**: https://github.com/ndyudev

---

## 🎉 **Kết Luận**

**Code Lens News** là một hệ thống quản lý tin tức hoàn chỉnh với đầy đủ tính năng hiện đại. Với kiến trúc MVC rõ ràng, giao diện responsive và hệ thống email tự động, project này phù hợp cho việc học tập và phát triển thực tế.

**Happy Coding! 🚀**
