-- Tạo cơ sở dữ liệu (nếu chưa tồn tại)
CREATE DATABASE code_lens_new;
USE code_lens_new;
drop database code_lens_new
USE PS44284_ChauNhatDuy_PolyCafe_ASM;


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