-- =============================================
-- Script tạo cơ sở dữ liệu CodeLensNew
-- Tác giả: Chau Nhat Duy
-- Ngày tạo: 2025
-- =============================================

-- Tạo cơ sở dữ liệu (nếu chưa tồn tại)
CREATE DATABASE code_lens_new;
GO

USE code_lens_new;
GO


-- =============================================
-- BẢNG CATEGORIES (Loại tin)
-- =============================================
CREATE TABLE CATEGORIES (
    Id VARCHAR(20) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL
);
GO

-- =============================================
-- BẢNG USERS (Người dùng)
-- =============================================
CREATE TABLE USERS (
    Id VARCHAR(20) PRIMARY KEY,
    Password VARCHAR(100) NOT NULL,
    Fullname NVARCHAR(100) NOT NULL,
    Birthday DATE NOT NULL,
    Gender BIT NOT NULL DEFAULT 0, -- 0 cho nam, 1 cho nữ
    Mobile VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Role BIT NOT NULL DEFAULT 0 -- 0 cho phóng viên, 1 cho quản trị
);
GO

-- =============================================
-- BẢNG NEWSLETTERS (Danh sách email nhận tin)
-- =============================================
CREATE TABLE NEWSLETTERS (
    Email VARCHAR(100) PRIMARY KEY,
    Enabled BIT NOT NULL DEFAULT 1 -- 1 cho hiệu lực, 0 cho không hiệu lực
);
GO

-- =============================================
-- BẢNG NEWS (Tin tức)
-- =============================================
CREATE TABLE NEWS (
    Id VARCHAR(20) PRIMARY KEY,
    Title NVARCHAR(200) NOT NULL,
    Content NVARCHAR(MAX),
    Image VARCHAR(255),
    PostedDate DATE NOT NULL,
    Author VARCHAR(20) NOT NULL,
    ViewCount INT DEFAULT 0,
    CategoryId VARCHAR(20) NOT NULL,
    Home BIT DEFAULT 0, -- 0 cho không xuất hiện trang chủ, 1 cho xuất hiện
    FOREIGN KEY (Author) REFERENCES USERS(Id),
    FOREIGN KEY (CategoryId) REFERENCES CATEGORIES(Id)
);
GO

