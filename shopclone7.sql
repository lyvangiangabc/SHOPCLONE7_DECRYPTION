-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 26, 2025 lúc 07:30 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shopclone7`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role`
--

CREATE TABLE `admin_role` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `role` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role`
--

INSERT INTO `admin_role` (`id`, `name`, `role`, `create_gettime`, `update_gettime`) VALUES
(1, 'Super Admin', '[\"view_license\",\"view_statistical\",\"view_recent_transactions\",\"view_logs\",\"view_transactions\",\"view_block_ip\",\"edit_block_ip\",\"view_automations\",\"edit_automations\",\"view_user\",\"edit_user\",\"login_user\",\"view_role\",\"edit_role\",\"view_recharge\",\"edit_recharge\",\"view_affiliate\",\"view_withdraw_affiliate\",\"edit_withdraw_affiliate\",\"edit_affiliate\",\"view_email_campaigns\",\"edit_email_campaigns\",\"view_coupon\",\"edit_coupon\",\"view_promotion\",\"edit_promotion\",\"view_blog\",\"edit_blog\",\"view_product\",\"edit_product\",\"edit_stock_product\",\"view_orders_product\",\"refund_orders_product\",\"view_order_product\",\"delete_order_product\",\"manager_suppliers\",\"view_suppliers\",\"view_sold_product\",\"view_menu\",\"edit_menu\",\"view_lang\",\"edit_lang\",\"view_currency\",\"edit_currency\",\"edit_theme\",\"edit_setting\"]', '2023-11-16 20:28:54', '2025-03-19 21:33:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `aff_log`
--

CREATE TABLE `aff_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `reason` text DEFAULT NULL,
  `sotientruoc` float NOT NULL DEFAULT 0,
  `sotienthaydoi` float NOT NULL DEFAULT 0,
  `sotienhientai` float NOT NULL DEFAULT 0,
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `aff_withdraw`
--

CREATE TABLE `aff_withdraw` (
  `id` int(11) NOT NULL,
  `trans_id` text DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `bank` text DEFAULT NULL,
  `stk` text DEFAULT NULL,
  `name` text DEFAULT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `status` varchar(25) NOT NULL DEFAULT 'pending',
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `automations`
--

CREATE TABLE `automations` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `type` varchar(55) DEFAULT NULL,
  `product_id` longtext DEFAULT NULL,
  `schedule` int(11) NOT NULL DEFAULT 0,
  `other` text DEFAULT NULL,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banks`
--

CREATE TABLE `banks` (
  `id` int(11) NOT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `accountName` text DEFAULT NULL,
  `accountNumber` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `token` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `block_ip`
--

CREATE TABLE `block_ip` (
  `id` int(11) NOT NULL,
  `ip` text DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `banned` int(11) NOT NULL DEFAULT 0,
  `reason` text DEFAULT NULL,
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `display` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) DEFAULT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cards`
--

CREATE TABLE `cards` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `trans_id` varchar(255) DEFAULT NULL,
  `telco` varchar(255) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `serial` text DEFAULT NULL,
  `pin` text DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `id_api` int(11) NOT NULL DEFAULT 0,
  `supplier_id` int(11) NOT NULL DEFAULT 0,
  `stt` int(11) NOT NULL DEFAULT 0,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `keywords` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `create_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `code` varchar(64) DEFAULT NULL,
  `product_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `used` int(11) NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `min` int(11) NOT NULL DEFAULT 1000,
  `max` int(11) NOT NULL DEFAULT 10000000
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupon_used`
--

CREATE TABLE `coupon_used` (
  `id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `trans_id` varchar(255) DEFAULT NULL,
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `rate` float NOT NULL DEFAULT 0,
  `symbol_left` text DEFAULT NULL,
  `symbol_right` text DEFAULT NULL,
  `seperator` text DEFAULT NULL,
  `display` int(11) NOT NULL DEFAULT 1,
  `default_currency` int(11) NOT NULL DEFAULT 0,
  `decimal_currency` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `deposit_log`
--

CREATE TABLE `deposit_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `received` float NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL,
  `is_virtual` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dongtien`
--

CREATE TABLE `dongtien` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `sotientruoc` float NOT NULL DEFAULT 0,
  `sotienthaydoi` float NOT NULL DEFAULT 0,
  `sotiensau` float NOT NULL DEFAULT 0,
  `thoigian` datetime NOT NULL,
  `noidung` text DEFAULT NULL,
  `transid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `email_campaigns`
--

CREATE TABLE `email_campaigns` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `subject` text DEFAULT NULL,
  `cc` text DEFAULT NULL,
  `bcc` text DEFAULT NULL,
  `content` longblob DEFAULT NULL,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `email_sending`
--

CREATE TABLE `email_sending` (
  `id` int(11) NOT NULL,
  `camp_id` int(11) DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `response` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_attempts`
--

CREATE TABLE `failed_attempts` (
  `id` int(11) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `create_gettime` datetime NOT NULL,
  `type` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `failed_attempts`
--

INSERT INTO `failed_attempts` (`id`, `ip_address`, `attempts`, `create_gettime`, `type`) VALUES
(1, '14.231.215.197', 1, '2025-03-19 21:26:11', 'Login'),
(2, '14.231.178.238', 1, '2025-03-22 09:40:45', 'Login');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `lang_default` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(255) DEFAULT NULL,
  `device` varchar(255) DEFAULT NULL,
  `createdate` datetime NOT NULL,
  `action` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `ip`, `device`, `createdate`, `action`) VALUES
(1, 1, '171.250.153.125', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-13 10:41:28', 'Create an account'),
(2, 1, '171.250.153.125', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-13 10:43:13', 'Thay đổi thông tin trong trang cài đặt'),
(3, 1, '171.250.153.125', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-13 10:48:44', 'Thay đổi thông tin trong trang cài đặt'),
(4, 1, '171.250.153.125', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-13 10:48:56', 'Thay đổi thông tin trong trang cài đặt'),
(5, 1, '171.250.153.125', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-13 10:51:47', 'Cấu hình nạp tiền Ngân Hàng'),
(6, 1, '171.250.153.125', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-13 10:51:56', 'Cấu hình nạp tiền Ngân Hàng'),
(7, 1, '171.250.153.125', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-13 11:06:59', 'Thay đổi thông tin trong trang cài đặt'),
(8, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:26:28', 'Create an account'),
(9, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:28:41', 'Thay đổi thông tin trong trang cài đặt'),
(10, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:29:57', 'Cấu hình nạp thẻ cào'),
(11, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:33:07', 'Edit Role (Super Admin).'),
(12, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:34:30', 'Add Category (Key Hub).'),
(13, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:35:29', 'Add Product (key mspaint).'),
(14, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:35:59', 'Add Category (Mspaint Key).'),
(15, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:37:26', 'Thay đổi thông tin trong trang cài đặt'),
(16, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:38:23', 'Import tài khoản vào kho hàng 67dad5fa48443'),
(17, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:38:35', 'Edit Product (key mspaint ID 1).'),
(18, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:39:10', 'Thay đổi thông tin trong trang cài đặt'),
(19, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:41:40', 'Thay đổi thông tin trong trang cài đặt'),
(20, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:41:57', 'Add Category (Tun).'),
(21, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:42:19', 'Add Category (DIscord Licho &amp; Cái Khác).'),
(22, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:43:45', 'Thay đổi thông tin trong trang cài đặt'),
(23, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:45:42', 'Add Product (nitro random).'),
(24, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:46:43', 'Edit Product (nitro random ID 2).'),
(25, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:47:01', 'Add Category (Nicho).'),
(26, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:49:38', 'Import tài khoản vào kho hàng 67dad8654748b'),
(27, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:49:47', 'Edit Product (nitro random ID 2).'),
(28, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:50:38', 'Thay đổi thông tin trong trang cài đặt'),
(29, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:51:10', 'Thay đổi thông tin trong trang cài đặt'),
(30, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:52:53', 'Cấu hình nạp tiền Crypto'),
(31, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:53:59', 'Cấu hình nạp tiền Ngân Hàng'),
(32, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:54:18', 'Thêm ngân hàng (TCB - 25431399999999).'),
(33, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:54:39', 'Cấu hình nạp MOMO'),
(34, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:55:30', 'Cấu hình nạp tiền PayPal'),
(35, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 21:55:44', 'Cấu hình nạp MOMO'),
(36, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 22:00:26', 'Thay đổi thông tin trong trang cài đặt'),
(37, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 22:01:40', 'Thay đổi thông tin trong trang cài đặt'),
(38, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-19 22:01:49', 'Thay đổi thông tin trong trang cài đặt'),
(39, 2, '14.231.215.197', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-20 16:19:56', 'Thay đổi thông tin trong trang cài đặt'),
(40, 2, '14.231.178.238', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '2025-03-20 22:05:57', '[Warning] Thực hiện đăng nhập vào website'),
(41, 2, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-21 20:53:33', 'Xoá tài khoản (admin ID 1)'),
(42, 1, '14.231.178.238', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36', '2025-03-22 06:13:37', 'Thay đổi thông tin trong trang cài đặt'),
(43, 1, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-22 09:33:35', '[Warning] Thực hiện đăng nhập vào website'),
(44, 1, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-22 09:38:20', 'Thay đổi thông tin trong trang cài đặt'),
(45, 1, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-22 09:38:33', 'Xoá ngân hàng (TCB ID 1)'),
(46, 1, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-22 09:38:43', 'Cấu hình nạp MOMO'),
(47, 1, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-22 09:38:52', 'Cấu hình nạp thẻ cào'),
(48, 1, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-22 09:39:01', 'Cấu hình nạp tiền Crypto'),
(49, 1, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-22 09:39:16', 'Cấu hình nạp tiền PayPal'),
(50, 1, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-22 09:39:37', 'Xoá sản phẩm (nitro random ID 2)'),
(51, 1, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-22 09:39:40', 'Xoá sản phẩm (key mspaint ID 1)'),
(52, 1, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-22 09:39:45', 'Xoá chuyên mục (Mspaint Key ID 2)'),
(53, 1, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-22 09:39:48', 'Xoá chuyên mục (Nicho ID 5)'),
(54, 1, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-22 09:39:52', 'Xoá chuyên mục (Key Hub ID 1)'),
(55, 1, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-22 09:39:56', 'Xoá chuyên mục (Tun ID 3)'),
(56, 1, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-22 09:39:59', 'Xoá chuyên mục (DIscord Licho &amp; Cái Khác ID 4)'),
(57, 3, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-22 09:41:09', 'Create an account'),
(58, 1, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-22 09:42:18', 'Thay đổi thông tin trong trang cài đặt'),
(59, 1, '14.231.178.238', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', '2025-03-22 09:42:37', 'Thay đổi thông tin trong trang cài đặt'),
(60, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0', '2025-03-22 23:04:57', '[Warning] Thực hiện đăng nhập vào website'),
(61, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0', '2025-03-26 13:23:25', 'Thay đổi thông tin trong trang cài đặt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `log_bank_auto`
--

CREATE TABLE `log_bank_auto` (
  `id` int(11) NOT NULL,
  `tid` varchar(55) DEFAULT NULL,
  `method` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` text DEFAULT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `log_ref`
--

CREATE TABLE `log_ref` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `reason` text DEFAULT NULL,
  `sotientruoc` float NOT NULL DEFAULT 0,
  `sotienthaydoi` float NOT NULL DEFAULT 0,
  `sotienhientai` float NOT NULL DEFAULT 0,
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `href` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `target` varchar(255) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 3,
  `content` longtext DEFAULT NULL,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `momo`
--

CREATE TABLE `momo` (
  `id` int(11) NOT NULL,
  `request_id` varchar(64) DEFAULT NULL,
  `tranId` varchar(255) DEFAULT NULL,
  `partnerId` text DEFAULT NULL,
  `partnerName` text DEFAULT NULL,
  `amount` text DEFAULT NULL,
  `received` int(11) NOT NULL DEFAULT 0,
  `comment` text DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT 0,
  `status` varchar(32) DEFAULT 'xuly'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_log`
--

CREATE TABLE `order_log` (
  `id` int(11) NOT NULL,
  `buyer` int(11) NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci DEFAULT NULL,
  `pay` float NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `create_time` int(11) NOT NULL,
  `is_virtual` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_bank`
--

CREATE TABLE `payment_bank` (
  `id` int(11) NOT NULL,
  `method` varchar(55) DEFAULT NULL,
  `tid` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` int(11) DEFAULT 0,
  `received` int(11) DEFAULT 0,
  `create_gettime` datetime DEFAULT NULL,
  `create_time` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT 0,
  `notication` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_crypto`
--

CREATE TABLE `payment_crypto` (
  `id` int(11) NOT NULL,
  `trans_id` varchar(55) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `request_id` varchar(55) DEFAULT NULL,
  `amount` decimal(18,4) NOT NULL DEFAULT 0.0000,
  `received` float NOT NULL DEFAULT 0,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'waiting',
  `msg` text DEFAULT NULL,
  `url_payment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_flutterwave`
--

CREATE TABLE `payment_flutterwave` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `tx_ref` varchar(55) DEFAULT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `price` float NOT NULL DEFAULT 0,
  `currency` text DEFAULT NULL,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_manual`
--

CREATE TABLE `payment_manual` (
  `id` int(11) NOT NULL,
  `icon` text DEFAULT NULL,
  `title` text DEFAULT NULL,
  `slug` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `display` int(11) NOT NULL DEFAULT 0,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_momo`
--

CREATE TABLE `payment_momo` (
  `id` int(11) NOT NULL,
  `tid` varchar(55) NOT NULL,
  `method` varchar(55) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` int(11) DEFAULT 0,
  `received` int(11) DEFAULT 0,
  `create_gettime` datetime DEFAULT NULL,
  `create_time` int(11) DEFAULT 0,
  `user_id` int(11) DEFAULT 0,
  `notication` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_paypal`
--

CREATE TABLE `payment_paypal` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `create_date` datetime NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_pm`
--

CREATE TABLE `payment_pm` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `payment_id` varchar(255) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `create_date` datetime NOT NULL,
  `create_time` int(11) NOT NULL DEFAULT 0,
  `update_date` datetime NOT NULL,
  `update_time` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_squadco`
--

CREATE TABLE `payment_squadco` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `transaction_ref` varchar(55) DEFAULT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `create_gettime` datetime NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment_toyyibpay`
--

CREATE TABLE `payment_toyyibpay` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `trans_id` varchar(50) DEFAULT NULL,
  `billName` text DEFAULT NULL,
  `amount` float NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `BillCode` varchar(50) DEFAULT NULL,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `reason` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `stt` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `title` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `view` int(11) NOT NULL DEFAULT 0,
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_category`
--

CREATE TABLE `post_category` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `slug` text NOT NULL,
  `content` longtext NOT NULL,
  `icon` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `stt` int(11) NOT NULL DEFAULT 0,
  `code` varchar(55) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `short_desc` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `note` text DEFAULT NULL,
  `price` float NOT NULL DEFAULT 0,
  `cost` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `min` int(11) NOT NULL DEFAULT 1,
  `max` int(11) NOT NULL DEFAULT 1000000,
  `flag` text DEFAULT NULL,
  `sold` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 1,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `check_live` varchar(55) DEFAULT 'None',
  `supplier_id` int(11) NOT NULL DEFAULT 0,
  `api_id` text DEFAULT NULL,
  `api_name` text DEFAULT NULL,
  `api_stock` int(11) NOT NULL DEFAULT 0,
  `api_time_update` int(11) NOT NULL DEFAULT 0,
  `text_txt` text DEFAULT NULL,
  `order_by` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_die`
--

CREATE TABLE `product_die` (
  `id` int(11) NOT NULL,
  `product_code` varchar(55) DEFAULT NULL,
  `seller` int(11) NOT NULL DEFAULT 0,
  `uid` text DEFAULT NULL,
  `account` text DEFAULT NULL,
  `create_gettime` datetime NOT NULL,
  `type` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_discount`
--

CREATE TABLE `product_discount` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `min` int(11) NOT NULL DEFAULT 0,
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_order`
--

CREATE TABLE `product_order` (
  `id` int(11) NOT NULL,
  `trans_id` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `supplier_id` int(11) NOT NULL DEFAULT 0,
  `product_name` text DEFAULT NULL,
  `buyer` int(11) NOT NULL DEFAULT 0,
  `seller` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0,
  `money` float NOT NULL DEFAULT 0,
  `pay` float NOT NULL DEFAULT 0,
  `cost` int(11) NOT NULL DEFAULT 0,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `trash` int(11) NOT NULL DEFAULT 0,
  `refund` int(11) NOT NULL DEFAULT 0,
  `ip` text DEFAULT NULL,
  `device` text DEFAULT NULL,
  `status_view_order` int(11) NOT NULL DEFAULT 0,
  `api_transid` text DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_sold`
--

CREATE TABLE `product_sold` (
  `id` int(11) NOT NULL,
  `product_code` varchar(55) DEFAULT NULL,
  `trans_id` text DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT 0,
  `buyer` int(11) NOT NULL DEFAULT 0,
  `seller` int(11) NOT NULL DEFAULT 0,
  `uid` text DEFAULT NULL,
  `account` text DEFAULT NULL,
  `create_gettime` datetime NOT NULL,
  `time_check_live` int(11) NOT NULL DEFAULT 0,
  `type` varchar(55) DEFAULT 'WEB'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_stock`
--

CREATE TABLE `product_stock` (
  `id` int(11) NOT NULL,
  `product_code` varchar(55) DEFAULT NULL,
  `seller` int(11) NOT NULL DEFAULT 0,
  `uid` varchar(55) DEFAULT NULL,
  `account` text DEFAULT NULL,
  `create_gettime` datetime NOT NULL,
  `type` varchar(55) DEFAULT 'WEB',
  `time_check_live` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_stock`
--

INSERT INTO `product_stock` (`id`, `product_code`, `seller`, `uid`, `account`, `create_gettime`, `type`, `time_check_live`) VALUES
(1, '67dad5fa48443', 2, 'https://www.mspaint.cc/purchase/completed?serial=L9GLQY', 'https://www.mspaint.cc/purchase/completed?serial=L9GLQYLBHYNOY9L7\r', '2025-03-19 21:38:23', 'WEB', 0),
(2, '67dad5fa48443', 2, 'https://www.mspaint.cc/purchase/completed?serial=U0N5WS', 'https://www.mspaint.cc/purchase/completed?serial=U0N5WSWXXNN443B1\r', '2025-03-19 21:38:23', 'WEB', 0),
(3, '67dad5fa48443', 2, 'https://www.mspaint.cc/purchase/completed?serial=VQ1EN5', 'https://www.mspaint.cc/purchase/completed?serial=VQ1EN5CU62T52J0N\r', '2025-03-19 21:38:23', 'WEB', 0),
(4, '67dad5fa48443', 2, 'https://www.mspaint.cc/purchase/completed?serial=VRILTS', 'https://www.mspaint.cc/purchase/completed?serial=VRILTS0BGQUZH0Z3\r', '2025-03-19 21:38:23', 'WEB', 0),
(5, '67dad5fa48443', 2, 'https://www.mspaint.cc/purchase/completed?serial=10A974', 'https://www.mspaint.cc/purchase/completed?serial=10A974130RDS31X2\r', '2025-03-19 21:38:23', 'WEB', 0),
(6, '67dad5fa48443', 2, 'https://www.mspaint.cc/purchase/completed?serial=CD5ZWJ', 'https://www.mspaint.cc/purchase/completed?serial=CD5ZWJ5PNGRM3ZFO\r', '2025-03-19 21:38:23', 'WEB', 0),
(7, '67dad5fa48443', 2, 'https://www.mspaint.cc/purchase/completed?serial=4SYEUH', 'https://www.mspaint.cc/purchase/completed?serial=4SYEUHSNXMDKIPI0\r', '2025-03-19 21:38:23', 'WEB', 0),
(8, '67dad5fa48443', 2, 'https://www.mspaint.cc/purchase/completed?serial=OEZYDT', 'https://www.mspaint.cc/purchase/completed?serial=OEZYDTTYVZ96O6LU\r', '2025-03-19 21:38:23', 'WEB', 0),
(9, '67dad5fa48443', 2, 'https://www.mspaint.cc/purchase/completed?serial=ZX7IG3', 'https://www.mspaint.cc/purchase/completed?serial=ZX7IG317UJKKZFVF\r', '2025-03-19 21:38:23', 'WEB', 0),
(10, '67dad5fa48443', 2, 'https://www.mspaint.cc/purchase/completed?serial=PKEZVK', 'https://www.mspaint.cc/purchase/completed?serial=PKEZVKD7B9BNF6ER', '2025-03-19 21:38:23', 'WEB', 0),
(11, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:37', 'WEB', 0),
(12, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:37', 'WEB', 0),
(13, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:37', 'WEB', 0),
(14, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:37', 'WEB', 0),
(15, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(16, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(17, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(18, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(19, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(20, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(21, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(22, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(23, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(24, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(25, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(26, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(27, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(28, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(29, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(30, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(31, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(32, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(33, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(34, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(35, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(36, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(37, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(38, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(39, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(40, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(41, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(42, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(43, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(44, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(45, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(46, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(47, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(48, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(49, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(50, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(51, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(52, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(53, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(54, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(55, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(56, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(57, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(58, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(59, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(60, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(61, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(62, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(63, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(64, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(65, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(66, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(67, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(68, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(69, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', 'Liên Hệ telegram id:@xtkmt để nhận hàng\r', '2025-03-19 21:49:38', 'WEB', 0),
(70, '67dad8654748b', 2, 'Liên Hệ telegram id:@xtkmt để nhận hàng', 'Liên Hệ telegram id:@xtkmt để nhận hàng', '2025-03-19 21:49:38', 'WEB', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promotions`
--

CREATE TABLE `promotions` (
  `id` int(11) NOT NULL,
  `min` float NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `create_gettime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(1, 'status_demo', '0'),
(2, 'type_password', 'bcrypt'),
(3, 'title', 'Mèo Mặt Căng'),
(4, 'description', 'Mèo Mặt Căng'),
(5, 'keywords', 'Mèo Mặt Căng'),
(6, 'author', 'Mèo Mặt Căng'),
(7, 'timezone', 'Asia/Ho_Chi_Minh'),
(8, 'email', 'contact@maihuybao.dev'),
(9, 'status', '1'),
(10, 'status_update', '0'),
(12, 'session_login', '10000000'),
(13, 'javascript_header', '<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\r\n<link href=\"https://fonts.googleapis.com/css2?family=Tilt+Neon&display=swap\" rel=\"stylesheet\">'),
(14, 'javascript_footer', '<div class=\"gtranslate_wrapper\"></div>\r\n<script>\r\nwindow.gtranslateSettings = {\r\n  \"default_language\": \"vi\",\r\n  \"detect_browser_language\": true,\r\n  \"languages\": [\"vi\", \"en\", \"ru\", \"th\", \"km\", \"lo\", \"id\", \"fr\", \"de\", \"ja\", \"pt\", \"ko\"],\r\n  \"wrapper_selector\": \".gtranslate_wrapper\"\r\n}\r\n</script>\r\n<script src=\"https://cdn.gtranslate.net/widgets/latest/float.js\" defer></script>'),
(16, 'logo_light', 'assets/storage/images/logo_light_E4K.png'),
(17, 'logo_dark', 'assets/storage/images/logo_dark_VBL.png'),
(18, 'favicon', 'assets/storage/images/favicon_40D.png'),
(19, 'image', 'assets/storage/images/image_GVQ.png'),
(20, 'bg_login', 'assets/storage/images/chimto.png'),
(21, 'bg_register', 'assets/storage/images/chimto.png'),
(26, 'telegram_token', ''),
(27, 'telegram_chat_id', ''),
(30, 'prefix_autobank', 'NAPTIEN'),
(35, 'bank_status', '1'),
(36, 'bank_notice', '<p><span style=\"color:#3498db\"><strong>Nạp Tối Thiểu 10.000đ. Vui l&ograve;ng ghi đ&uacute;ng nội dung để tự động cộng tiền</strong></span></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Sau 5 ph&uacute;t kh&ocirc;ng thấy cộng tiền vui l&ograve;ng inbox admin ở menu Li&ecirc;n Hệ, xin cảm ơn.</p>\r\n\r\n	<p><em><strong>BƯỚC 1: MỞ QU&Eacute;T M&Atilde; QR CỦA NG&Acirc;N H&Agrave;NG HOẶC MỞ CAMERA ĐIỆN THOẠI ĐỂ QU&Eacute;T</strong></em></p>\r\n\r\n	<p><em><strong>BƯỚC 2:&nbsp;NHẬP SỐ TIỀN CẦN NẠP</strong></em></p>\r\n\r\n	<p><em><strong>BƯỚC 3: ẤN HO&Agrave;N TH&Agrave;NH</strong></em></p>\r\n\r\n	<p><strong><em>Admin Sẽ Duyệt V&agrave;o Tối</em></strong></p>\r\n	</li>\r\n</ul>\r\n'),
(43, 'notice_home', '<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n'),
(44, 'font_family', 'font-family: \'Saira Semi Condensed\', sans-serif;'),
(59, 'popup_status', '1'),
(60, 'popup_noti', ''),
(64, 'license_key', '0S5LZTGidwX799ZQ'),
(69, 'home_page', 'home'),
(70, 'smtp_host', ''),
(71, 'smtp_encryption', ''),
(72, 'smtp_port', ''),
(73, 'smtp_email', ''),
(74, 'smtp_password', ''),
(76, 'default_product_image', 'assets/storage/images/default_product_image8IE.png'),
(77, 'status_captcha', '0'),
(78, 'crypto_note', '<p>1$=23000</p>\r\n'),
(79, 'crypto_address', ''),
(80, 'crypto_token', ''),
(81, 'crypto_min', '10'),
(82, 'crypto_max', '100000'),
(83, 'crypto_status', '1'),
(84, 'crypto_rate', '23000'),
(85, 'reCAPTCHA_site_key', ''),
(86, 'reCAPTCHA_secret_key', ''),
(87, 'reCAPTCHA_status', '0'),
(88, 'telegram_status', '1'),
(89, 'smtp_status', '1'),
(93, 'affiliate_ck', '5'),
(94, 'affiliate_status', '0'),
(95, 'affiliate_min', '10000'),
(96, 'affiliate_banks', 'Vietcombank\r\nMBBank\r\nTechcombank'),
(97, 'affiliate_note', ''),
(98, 'affiliate_chat_id_telegram', '1048444403'),
(99, 'check_time_cron_cron2', '0'),
(100, 'bank_min', '10000'),
(101, 'bank_max', '1000000000'),
(102, 'paypal_clientId', ''),
(103, 'paypal_clientSecret', ''),
(104, 'paypal_status', '1'),
(105, 'paypal_rate', '23000'),
(108, 'paypal_note', ''),
(109, 'noti_recharge', '[{time}] <b>{username}</b> vừa nạp {amount} vào {method} thực nhận {price}.'),
(110, 'noti_action', '[{time}] \r\n- <b>Username</b>: <code>{username}</code>\r\n- <b>Action</b>:  <code>{action}</code>\r\n- <b>IP</b>: <code>{ip}</code>'),
(111, 'theme_color', '#007ea8'),
(112, 'hotline', '0866064053'),
(113, 'type_notification', 'telegram'),
(114, 'perfectmoney_status', '0'),
(115, 'perfectmoney_account', ''),
(116, 'perfectmoney_pass', ''),
(117, 'perfectmoney_rate', '23000'),
(118, 'perfectmoney_units', ''),
(119, 'perfectmoney_notice', ''),
(120, 'fanpage', ''),
(121, 'address', ''),
(122, 'toyyibpay_status', '0'),
(123, 'toyyibpay_userSecretKey', ''),
(124, 'toyyibpay_categoryCode', ''),
(125, 'toyyibpay_min', '1'),
(126, 'toyyibpay_billChargeToCustomer', '0'),
(127, 'toyyibpay_rate', '5258'),
(128, 'toyyibpay_notice', ''),
(129, 'noti_affiliate_withdraw', '[{time}] \r\n- <b>Username</b>: <code>{username}</code>\r\n- <b>Action</b>:  <code>Tạo lệnh rút {amount} về ngân hàng {bank} | {account_number} | {account_name}</code>\r\n- <b>IP</b>: <code>{ip}</code>'),
(130, 'check_time_cron_sending_email', '1734505861'),
(131, 'squadco_status', '0'),
(132, 'squadco_Secret_Key', ''),
(133, 'squadco_Public_Key', ''),
(134, 'squadco_rate', '51'),
(135, 'squadco_currency_code', 'NGN'),
(136, 'squadco_notice', ''),
(137, 'theme_color1', '#1a5e75'),
(138, 'product_photo_display', '0'),
(139, 'product_rating_display', '0'),
(140, 'product_sold_display', '0'),
(141, 'banner_singer', 'assets/storage/images/banner_singerQKV.png'),
(142, 'image_empty_state', 'assets/storage/images/image_empty_stateNPV.png'),
(143, 'copyright_footer', 'Software By <a href=\"https://cmsnt.co\">CMSNT.CO</a>'),
(144, 'menu_category_right', '1'),
(145, 'crypto_trial', '5'),
(146, 'type_show_product', 'LIST'),
(147, 'check_time_cron_bank', '1734505863'),
(148, 'google_analytics_status', '0'),
(149, 'google_analytics_id', ''),
(150, 'card_status', '0'),
(151, 'card_partner_id', ''),
(152, 'card_partner_key', ''),
(153, 'card_ck', '20'),
(154, 'card_notice', ''),
(155, 'api_status', '1'),
(156, 'time_cron_suppliers_shopclone6', '1734505861'),
(157, 'time_cron_suppliers_api1', '1734505861'),
(158, 'language_type', 'gtranslate'),
(159, 'gtranslate_script', '<div class=\"gtranslate_wrapper\"></div>\r\n<script>window.gtranslateSettings = {\"default_language\":\"vi\",\"languages\":[\"vi\",\"fr\",\"de\",\"it\",\"es\",\"zh-CN\",\"ar\",\"tr\",\"ru\",\"uk\",\"km\",\"th\",\"en\"],\"wrapper_selector\":\".gtranslate_wrapper\"}</script>\r\n<script src=\"https://cdn.gtranslate.net/widgets/latest/dropdown.js\" defer></script>'),
(160, 'notice_top_left', ''),
(161, 'page_contact', ''),
(162, 'page_policy', '<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n'),
(163, 'page_faq', ''),
(164, 'page_block_ip', NULL),
(165, 'email_temp_content_warning_login', '<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"https://img.upanh.tv/2024/03/29/IMG_2099.gif\" style=\"height:150px; width:150px\" /></p>\r\n\r\n<h2 style=\"text-align:center\"><span style=\"color:#000000\"><strong>TH&Ocirc;NG B&Aacute;O ĐĂNG NHẬP</strong></span></h2>\r\n\r\n<p style=\"text-align:center\"><strong><img alt=\"\" src=\"https://img.upanh.tv/2024/03/29/lien-he-chu-dau-tu.gif.pagespeed.ce.9cZa7M_Wm6.gif\" style=\"height:40px; width:50px\" /></strong></p>\r\n\r\n<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><strong>CH&Uacute;NG T&Ocirc;I VỪA NHẬN THẤY THIẾT BỊ&nbsp;<span style=\"color:#e74c3c\">{device}</span> ĐĂNG NHẬP V&Agrave;O T&Agrave;I KHOẢN<span style=\"color:#000000\"> CỦA QU&Yacute; KH&Aacute;CH</span>&nbsp;V&Agrave;O L&Uacute;C&nbsp;<span style=\"color:#e74c3c\">{time}</span></strong></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"color:#000000\"><strong>IP THIẾT BỊ :</strong></span><span style=\"color:#e74c3c\"><strong>&nbsp;</strong></span><span style=\"color:#e74c3c\"><strong>{ip}</strong></span></p>\r\n\r\n<hr />\r\n<p style=\"text-align:center\"><span style=\"color:#e74c3c\"><strong>Lưu &yacute; :</strong></span></p>\r\n\r\n<p style=\"text-align:center\"><strong>NẾU Đ&Oacute; KH&Ocirc;NG PHẢI L&Agrave; BẠN ĐĂNG NHẬP TH&Igrave; VUI L&Ograve;NG V&Agrave;O T&Agrave;I KHOẢN ĐỂ THAY ĐỔI MẬT KHẨU V&Agrave; BẢO MẬT T&Agrave;I KHOẢN</strong></p>\r\n'),
(166, 'email_temp_subject_warning_login', 'Thông báo đăng nhập'),
(167, 'email_temp_content_otp_mail', '<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<p style=\"text-align:center\"><img alt=\"\" src=\"https://img.upanh.tv/2024/03/29/IMG_2099.gif\" style=\"height:150px; width:150px\" /></p>\r\n\r\n<h2 style=\"text-align:center\"><span style=\"color:#000000\"><strong>TH&Ocirc;NG B&Aacute;O M&Atilde; OTP ĐĂNG NHẬP TR&Ecirc;N <span style=\"background-color:#3498db\">FCLONE.NET</span></strong></span></h2>\r\n\r\n<p style=\"text-align:center\"><strong><img alt=\"\" src=\"https://img.upanh.tv/2024/03/29/lien-he-chu-dau-tu.gif.pagespeed.ce.9cZa7M_Wm6.gif\" style=\"height:40px; width:50px\" /></strong></p>\r\n\r\n<h1 style=\"text-align:center\"><span style=\"color:#000000\"><strong>M&Atilde; OTP :</strong></span><span style=\"color:#e74c3c\"><strong>&nbsp;</strong><strong>{otp}</strong></span></h1>\r\n'),
(168, 'email_temp_subject_otp_mail', 'OTP xác minh đăng nhập'),
(169, 'email_temp_content_forgot_password', '<p style=\"text-align:center\"><img alt=\"\" src=\"https://img.upanh.tv/2024/03/29/IMG_2099.gif\" style=\"height:150px; width:150px\" /></p>\r\n\r\n<h2 style=\"text-align:center\"><strong><span style=\"color:#000000\">X&Aacute;C NHẬN KH&Ocirc;I PHỤC MẬT KHẨU</span></strong></h2>\r\n\r\n<p style=\"text-align:center\"><strong>Nếu bạn y&ecirc;u cầu kh&ocirc;i kh&ocirc;i phục mật khẩu, Vui l&ograve;ng nhấn v&agrave;o li&ecirc;n kết b&ecirc;n dưới để đổi mật khẩu</strong></p>\r\n\r\n<p style=\"text-align:center\"><strong><img alt=\"\" src=\"https://img.upanh.tv/2024/03/29/lien-he-chu-dau-tu.gif.pagespeed.ce.9cZa7M_Wm6.gif\" style=\"height:40px; width:50px\" /></strong></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"color:#e74c3c\"><strong>{link}</strong></span></p>\r\n\r\n<hr />\r\n<p style=\"text-align:center\"><span style=\"color:#e74c3c\"><strong>Lưu &yacute; :</strong></span></p>\r\n\r\n<p style=\"text-align:center\"><strong>NẾU BẠN KH&Ocirc;NG Y&Ecirc;U CẦU KH&Ocirc;I PHỤC MẬT KHẨU TH&Igrave; VUI L&Ograve;NG BỎ QUA HỘP THƯ N&Agrave;Y</strong></p>\r\n'),
(170, 'email_temp_subject_forgot_password', 'Khôi phục mật khẩu'),
(171, 'time_cron_suppliers_api6', '1734505861'),
(172, 'time_cron_checklive_clone', '1734505863'),
(173, 'time_cron_checklive_hotmail', '1734505893'),
(174, 'product_hide_outstock', '0'),
(175, 'time_cron_suppliers_api14', '1734505861'),
(176, 'max_show_product_home', '5'),
(177, 'email_temp_content_buy_order', '<p style=\"text-align:center\">&nbsp;</p>\r\n\r\n<h2 style=\"text-align:center\"><span style=\"color:#e74c3c\"><strong>CẢM ƠN QU&Yacute; KH&Aacute;CH Đ&Atilde; SỬ DỤNG DỊCH VỤ&nbsp;CỦA CH&Uacute;NG T&Ocirc;I</strong></span></h2>\r\n\r\n<hr />\r\n<p style=\"text-align:center\"><strong><img alt=\"\" src=\"https://img.upanh.tv/2024/03/29/tich-xanh-icon.png\" style=\"height:20px; width:20px\" />CH&Uacute;NG T&Ocirc;I XIN TH&Ocirc;NG B&Aacute;O ĐƠN H&Agrave;NG&nbsp;{trans_id} Đ&Atilde; ĐƯỢC MUA TH&Agrave;NH C&Ocirc;NG</strong></p>\r\n\r\n<p style=\"text-align:center\"><span style=\"color:#e74c3c\"><strong>TH&Ocirc;NG TIN ĐƠN H&Agrave;NG :</strong></span></p>\r\n\r\n<p style=\"text-align:center\"><strong>T&Ecirc;N SẢN PHẨM :&nbsp;{product}&nbsp;</strong></p>\r\n\r\n<p style=\"text-align:center\"><strong>SỐ LƯỢNG Đ&Atilde; MUA :&nbsp;{amount}</strong></p>\r\n\r\n<p style=\"text-align:center\"><strong>M&Atilde; ĐƠN H&Agrave;NG :&nbsp;{trans_id}</strong></p>\r\n\r\n<p style=\"text-align:center\"><strong>SỐ TIỀN Đ&Atilde; THANH TO&Aacute;N : {pay}</strong></p>\r\n\r\n<hr />\r\n<p style=\"text-align:center\"><span style=\"color:#e74c3c\"><strong>Lưu &yacute; :</strong></span></p>\r\n\r\n<p style=\"text-align:center\"><strong>NẾU ĐƠN H&Agrave;NG KH&Ocirc;NG PHẢI DO BẠN MUA H&Atilde;Y ĐỔI MẬT KHẨU V&Agrave; BẢO MẬT T&Agrave;I KHOẢN&nbsp;</strong></p>\r\n'),
(178, 'email_temp_subject_buy_order', 'Thông tin đơn hàng'),
(179, 'time_cron_suppliers_shopclone7', '1734505861'),
(180, 'time_cron_suppliers_api18', '1734505861'),
(181, 'avatar', 'assets/storage/images/avatarYAU.png'),
(182, 'check_time_cron_momo', '1734505861'),
(183, 'momo_number', ''),
(184, 'momo_name', ''),
(185, 'momo_token', ''),
(186, 'momo_notice', '<p>AD SẼ DUYỆT V&Agrave;O TỐI</p>\r\n'),
(187, 'momo_status', '1'),
(188, 'script_footer_admin', '<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\r\n<link href=\"https://fonts.googleapis.com/css2?family=Tilt+Neon&display=swap\" rel=\"stylesheet\">'),
(189, 'time_cron_suppliers_api19', '1734505861'),
(190, 'cot_so_du_ben_phai', '1'),
(191, 'time_cron_suppliers_api4', '1734505861'),
(192, 'status_giao_dich_gan_day', '1'),
(193, 'content_gd_mua_gan_day', '<b style=\"color: green;\">...{username}</b> mua <b style=\"color: red;\">{amount}</b> <b>{product_name}</b> với giá <b style=\"color:blue;\">{price}</b>'),
(194, 'content_gd_nap_tien_gan_day', '<b style=\"color: green;\">...{username}</b> thực hiện nạp <b style=\"color:blue;\">{amount}</b> bằng <b style=\"color:red;\">{method}</b> thực nhận <b style=\"color:blue;\">{received}</b>'),
(195, 'status_tao_gd_ao', '1'),
(196, 'sl_mua_toi_thieu_gd_ao', '20'),
(197, 'sl_mua_toi_da_gd_ao', '1000'),
(198, 'toc_do_gd_mua_ao', '1000'),
(199, 'menh_gia_nap_ao_ngau_nhien', '10000\r\n20000\r\n40000\r\n50000\r\n60000\r\n70000\r\n100000\r\n200000\r\n300000\r\n500000\r\n400000\r\n40000\r\n15000\r\n25000\r\n35000\r\n45000\r\n55000\r\n65000\r\n45000\r\n100000\r\n1500000\r\n200000'),
(200, 'toc_do_gd_nap_ao', '1000'),
(201, 'method_nap_ao', 'MB'),
(202, 'tao_gd_ao_sp_het_hang', '0'),
(203, 'check_time_cron_cron', '1734505866'),
(204, 'blog_status', '0'),
(205, 'cong_tien_nguoi_ban', '0'),
(206, 'noti_buy_product', '[{time}] <b>{username}</b> vừa mua {amount} tài khoản {product} với giá {pay} - #{trans_id}'),
(207, 'check_time_cron_task', '1736740248'),
(208, 'thoi_gian_mua_cach_nhau', '5'),
(209, 'url_api_card', 'https://thesieure.com/chargingws/v2'),
(210, 'max_register_ip', '3'),
(211, 'time_cron_suppliers_api20', '1734505861'),
(212, 'status_menu_tools', '1'),
(213, 'debug_auto_bank', '0'),
(214, 'time_cron_suppliers_api9', '0'),
(215, 'debug_api_suppliers', '1'),
(216, 'order_by_product_home', '2'),
(217, 'token_webhook_web2m', ''),
(218, 'time_cron_suppliers_api21', '1734505861'),
(219, 'time_cron_suppliers_api17', '1734505861'),
(220, 'api_check_live_gmail', ''),
(221, 'api_key_check_live_gmail', ''),
(222, 'time_cron_checklive_gmail', '0'),
(223, 'time_limit_check_live_gmail', '1800'),
(224, 'widget_zalo1_status', '0'),
(225, 'widget_zalo1_sdt', '0347480009'),
(226, 'widget_phone1_status', '0'),
(227, 'widget_phone1_sdt', ''),
(228, 'flutterwave_status', '0'),
(229, 'flutterwave_rate', '16'),
(230, 'flutterwave_currency_code', 'NGN'),
(231, 'flutterwave_publicKey', ''),
(232, 'flutterwave_secretKey', ''),
(233, 'flutterwave_notice', ''),
(234, 'limit_block_ip_login', '5'),
(235, 'limit_block_client_login', '10'),
(236, 'limit_block_ip_api', '20'),
(237, 'limit_block_ip_admin_access', '5'),
(238, 'time_cron_suppliers_api22', '1734505861'),
(239, 'isPurchaseIpVerified', '0'),
(240, 'isPurchaseDeviceVerified', '0'),
(241, 'footer_card', '<div class=\"gtranslate_wrapper\"></div>\r\n<script>\r\nwindow.gtranslateSettings = {\r\n  \"default_language\": \"vi\",\r\n  \"detect_browser_language\": true,\r\n  \"languages\": [\"vi\", \"en\", \"ru\", \"th\", \"km\", \"lo\", \"id\", \"fr\", \"de\", \"ja\", \"pt\", \"ko\"],\r\n  \"wrapper_selector\": \".gtranslate_wrapper\"\r\n}\r\n</script>\r\n<script src=\"https://cdn.gtranslate.net/widgets/latest/float.js\" defer></script>'),
(242, 'notice_orders', ''),
(243, 'widget_fbzalo2_status', '0'),
(244, 'widget_fbzalo2_zalo', 'https://zalo.me/0347480009'),
(245, 'widget_fbzalo2_fb', 'https://facebook.com/ntv04112009'),
(246, 'time_cron_suppliers_api23', '0'),
(247, 'show_btn_category_home', '1'),
(248, 'time_cron_suppliers_api24', '0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` text DEFAULT NULL,
  `domain` text DEFAULT NULL,
  `username` text DEFAULT NULL,
  `password` text DEFAULT NULL,
  `api_key` text DEFAULT NULL,
  `token` text DEFAULT NULL,
  `coupon` text DEFAULT NULL,
  `price` text DEFAULT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `update_name` text DEFAULT NULL,
  `sync_category` varchar(55) NOT NULL DEFAULT 'OFF',
  `update_price` text DEFAULT NULL,
  `roundMoney` varchar(55) NOT NULL DEFAULT 'ON',
  `status` int(11) NOT NULL DEFAULT 1,
  `create_gettime` datetime NOT NULL,
  `update_gettime` datetime NOT NULL,
  `check_string_api` varchar(55) NOT NULL DEFAULT 'ON'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `translate`
--

CREATE TABLE `translate` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL DEFAULT 0,
  `name` longtext DEFAULT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `translate`
--

INSERT INTO `translate` (`id`, `lang_id`, `name`, `value`) VALUES
(1, 1, 'Vui lòng nhập username', 'Vui lòng nhập username'),
(2, 2, 'Vui lòng nhập username', 'Please enter username'),
(3, 1, 'Vui lòng nhập mật khẩu', 'Vui lòng nhập mật khẩu'),
(4, 2, 'Vui lòng nhập mật khẩu', 'Please enter a password'),
(5, 1, 'Vui lòng xác minh Captcha', 'Vui lòng xác minh Captcha'),
(6, 2, 'Vui lòng xác minh Captcha', 'Please verify Captcha'),
(7, 1, 'Thông tin đăng nhập không chính xác', 'Thông tin đăng nhập không chính xác'),
(8, 2, 'Thông tin đăng nhập không chính xác', 'Login information is incorrect'),
(9, 1, 'Vui lòng nhập địa chỉ Email', 'Vui lòng nhập địa chỉ Email'),
(10, 2, 'Vui lòng nhập địa chỉ Email', 'Please enter your email address'),
(11, 1, 'Vui lòng nhập lại mật khẩu', 'Vui lòng nhập lại mật khẩu'),
(12, 2, 'Vui lòng nhập lại mật khẩu', 'Please re-enter your password'),
(13, 1, 'Xác minh mật khẩu không chính xác', 'Xác minh mật khẩu không chính xác'),
(14, 2, 'Xác minh mật khẩu không chính xác', 'Verify password is incorrect'),
(15, 1, 'Tên đăng nhập đã tồn tại trong hệ thống', 'Tên đăng nhập đã tồn tại trong hệ thống'),
(16, 2, 'Tên đăng nhập đã tồn tại trong hệ thống', 'Username already exists in the system'),
(17, 1, 'Địa chỉ email đã tồn tại trong hệ thống', 'Địa chỉ email đã tồn tại trong hệ thống'),
(18, 2, 'Địa chỉ email đã tồn tại trong hệ thống', 'Email address already exists in the system'),
(19, 1, 'IP của bạn đã đạt đến giới hạn tạo tài khoản cho phép', 'IP của bạn đã đạt đến giới hạn tạo tài khoản cho phép'),
(20, 2, 'IP của bạn đã đạt đến giới hạn tạo tài khoản cho phép', 'Your IP has reached the allowable account creation limit'),
(21, 1, 'Đăng ký thành công!', 'Đăng ký thành công!'),
(22, 2, 'Đăng ký thành công!', 'Sign Up Success!'),
(23, 1, 'Tạo tài khoản không thành công, vui lòng thử lại', 'Tạo tài khoản không thành công, vui lòng thử lại'),
(24, 2, 'Tạo tài khoản không thành công, vui lòng thử lại', 'Account creation failed, please try again'),
(25, 1, 'Vui lòng đăng nhập', 'Vui lòng đăng nhập'),
(26, 2, 'Vui lòng đăng nhập', 'please log in'),
(27, 1, 'Lưu thành công', 'Lưu thành công'),
(28, 2, 'Lưu thành công', 'Save successfully'),
(29, 1, 'Lưu thất bại', 'Lưu thất bại'),
(30, 2, 'Lưu thất bại', 'Save failed'),
(31, 1, 'Vui lòng nhập mật khẩu hiện tại', 'Vui lòng nhập mật khẩu hiện tại'),
(32, 2, 'Vui lòng nhập mật khẩu hiện tại', 'Please enter your current password'),
(33, 1, 'Vui lòng nhập mật khẩu mới', 'Vui lòng nhập mật khẩu mới'),
(34, 2, 'Vui lòng nhập mật khẩu mới', 'Please enter a new password'),
(35, 1, 'Mật khẩu mới quá ngắn', 'Mật khẩu mới quá ngắn'),
(36, 2, 'Mật khẩu mới quá ngắn', 'New password is too short'),
(37, 1, 'Xác nhận mật khẩu không chính xác', 'Xác nhận mật khẩu không chính xác'),
(38, 2, 'Xác nhận mật khẩu không chính xác', 'Confirm password is incorrect'),
(39, 1, 'Mật khẩu hiện tại không đúng', 'Mật khẩu hiện tại không đúng'),
(40, 2, 'Mật khẩu hiện tại không đúng', 'Current password is incorrect'),
(41, 1, 'Địa chỉ Email này không tồn tại trong hệ thống', 'Địa chỉ Email này không tồn tại trong hệ thống'),
(42, 2, 'Địa chỉ Email này không tồn tại trong hệ thống', 'This email address does not exist in the system'),
(43, 1, 'Vui lòng thử lại trong ít phút', 'Vui lòng thử lại trong ít phút'),
(44, 2, 'Vui lòng thử lại trong ít phút', 'Please try again in a few minutes'),
(45, 1, 'Nếu bạn yêu cầu đặt lại mật khẩu, vui lòng nhấp vào liên kết bên dưới để xác minh.', 'Nếu bạn yêu cầu đặt lại mật khẩu, vui lòng nhấp vào liên kết bên dưới để xác minh.'),
(46, 2, 'Nếu bạn yêu cầu đặt lại mật khẩu, vui lòng nhấp vào liên kết bên dưới để xác minh.', 'If you require a password reset, please click the link below to verify.'),
(47, 1, 'Nếu không phải là bạn, vui lòng liên hệ ngay với Quản trị viên của bạn để được hỗ trợ về bảo mật.', 'Nếu không phải là bạn, vui lòng liên hệ ngay với Quản trị viên của bạn để được hỗ trợ về bảo mật.'),
(48, 2, 'Nếu không phải là bạn, vui lòng liên hệ ngay với Quản trị viên của bạn để được hỗ trợ về bảo mật.', 'If not you, please contact your Administrator immediately for security assistance.'),
(49, 1, 'Xác nhận tìm mật khẩu website', 'Xác nhận tìm mật khẩu website'),
(50, 2, 'Xác nhận tìm mật khẩu website', 'Confirm to find the website password'),
(51, 1, 'Xác nhận khôi phục mật khẩu', 'Xác nhận khôi phục mật khẩu'),
(52, 2, 'Xác nhận khôi phục mật khẩu', 'Confirm Password Recovery'),
(53, 1, 'Vui lòng kiểm tra Email của bạn để hoàn tất quá trình đặt lại mật khẩu', 'Vui lòng kiểm tra Email của bạn để hoàn tất quá trình đặt lại mật khẩu'),
(54, 2, 'Vui lòng kiểm tra Email của bạn để hoàn tất quá trình đặt lại mật khẩu', 'Please check your Email to complete the password reset process'),
(55, 1, 'Có lỗi hệ thống, vui lòng liên hệ Developer', 'Có lỗi hệ thống, vui lòng liên hệ Developer'),
(56, 2, 'Có lỗi hệ thống, vui lòng liên hệ Developer', 'There is a system error, please contact Developer'),
(57, 1, 'Liên kết không tồn tại', 'Liên kết không tồn tại'),
(58, 2, 'Liên kết không tồn tại', 'Link does not exist'),
(59, 1, 'Thay đổi mật khẩu thành công', 'Thay đổi mật khẩu thành công'),
(60, 2, 'Thay đổi mật khẩu thành công', 'Change password successfully'),
(61, 1, 'Thay đổi mật khẩu thất bại', 'Thay đổi mật khẩu thất bại'),
(62, 2, 'Thay đổi mật khẩu thất bại', 'Password change failed'),
(63, 1, 'Hồ sơ của bạn', 'Hồ sơ của bạn'),
(64, 2, 'Hồ sơ của bạn', 'Your Profile'),
(65, 1, 'Tên đăng nhập', 'Tên đăng nhập'),
(66, 2, 'Tên đăng nhập', 'Username'),
(67, 1, 'Địa chỉ Email', 'Địa chỉ Email'),
(68, 2, 'Địa chỉ Email', 'Email address'),
(69, 1, 'Số điện thoại', 'Số điện thoại'),
(70, 2, 'Số điện thoại', 'Phone number'),
(71, 1, 'Họ và Tên', 'Họ và Tên'),
(72, 2, 'Họ và Tên', 'Full name'),
(73, 1, 'Địa chỉ IP', 'Địa chỉ IP'),
(74, 2, 'Địa chỉ IP', 'IP address'),
(75, 1, 'Thiết bị', 'Thiết bị'),
(76, 2, 'Thiết bị', 'Device'),
(77, 1, 'Đăng ký vào lúc', 'Đăng ký vào lúc'),
(78, 2, 'Đăng ký vào lúc', 'Sign up at'),
(79, 1, 'Đăng nhập gần nhất', 'Đăng nhập gần nhất'),
(80, 2, 'Đăng nhập gần nhất', 'Last login'),
(81, 1, 'Chỉnh sửa thông tin', 'Chỉnh sửa thông tin'),
(82, 2, 'Chỉnh sửa thông tin', 'Edit information'),
(83, 1, 'Thay đổi mật khẩu', 'Thay đổi mật khẩu'),
(84, 2, 'Thay đổi mật khẩu', 'Change password'),
(85, 1, 'Thay đổi mật khẩu đăng nhập của bạn là một cách dễ dàng để giữ an toàn cho tài khoản của bạn.', 'Thay đổi mật khẩu đăng nhập của bạn là một cách dễ dàng để giữ an toàn cho tài khoản của bạn.'),
(86, 2, 'Thay đổi mật khẩu đăng nhập của bạn là một cách dễ dàng để giữ an toàn cho tài khoản của bạn.', 'Changing your login password is an easy way to keep your account secure.'),
(87, 1, 'Mật khẩu hiện tại', 'Mật khẩu hiện tại'),
(88, 2, 'Mật khẩu hiện tại', 'Current password'),
(89, 1, 'Mật khẩu mới', 'Mật khẩu mới'),
(90, 2, 'Mật khẩu mới', 'New password'),
(91, 1, 'Nhập lại mật khẩu mới', 'Nhập lại mật khẩu mới'),
(92, 2, 'Nhập lại mật khẩu mới', 'Re-verify new password'),
(93, 1, 'Cập Nhật', 'Cập Nhật'),
(94, 2, 'Cập Nhật', 'Update'),
(95, 1, 'Đăng Xuất', 'Đăng Xuất'),
(96, 2, 'Đăng Xuất', 'Logout'),
(97, 1, 'Bạn có chắc không?', 'Bạn có chắc không?'),
(98, 2, 'Bạn có chắc không?', 'Are you sure?'),
(99, 1, 'Bạn sẽ bị đăng xuất khỏi tài khoản khi nhấn Đồng Ý', 'Bạn sẽ bị đăng xuất khỏi tài khoản khi nhấn Đồng Ý'),
(100, 2, 'Bạn sẽ bị đăng xuất khỏi tài khoản khi nhấn Đồng Ý', 'You will be posted from the account when click Okey'),
(101, 1, 'Đồng ý', 'Đồng ý'),
(102, 2, 'Đồng ý', 'Okey'),
(103, 1, 'Huỷ bỏ', 'Huỷ bỏ'),
(104, 2, 'Huỷ bỏ', 'Cancel'),
(105, 1, 'Đăng Nhập', 'Đăng Nhập'),
(106, 2, 'Đăng Nhập', 'Sign In'),
(107, 1, 'Vui Lòng Đăng Nhập Để Tiếp Tục', 'Vui Lòng Đăng Nhập Để Tiếp Tục'),
(108, 2, 'Vui Lòng Đăng Nhập Để Tiếp Tục', 'Please Login To Continue'),
(109, 1, 'Quên mật khẩu', 'Quên mật khẩu'),
(110, 2, 'Quên mật khẩu', 'Forgot password'),
(111, 1, 'Bạn quên mật khẩu?', 'Bạn quên mật khẩu?'),
(112, 2, 'Bạn quên mật khẩu?', 'Forgot your password?'),
(113, 1, 'Vui lòng nhập thông tin vào ô dưới đây để xác minh', 'Vui lòng nhập thông tin vào ô dưới đây để xác minh'),
(114, 2, 'Vui lòng nhập thông tin vào ô dưới đây để xác minh', 'Please enter information in the box below to verify'),
(115, 1, 'Xác minh', 'Xác minh'),
(116, 2, 'Xác minh', 'Verification'),
(117, 1, 'Bạn đã có tài khoản?', 'Bạn đã có tài khoản?'),
(118, 2, 'Bạn đã có tài khoản?', 'Do you already have an account?'),
(119, 1, 'Ghi nhớ tôi', 'Ghi nhớ tôi'),
(120, 2, 'Ghi nhớ tôi', 'Remember'),
(121, 1, 'Quên mật khẩu?', 'Quên mật khẩu?'),
(122, 2, 'Quên mật khẩu?', 'Forgot password?'),
(123, 1, 'Bạn chưa có tài khoản?', 'Bạn chưa có tài khoản?'),
(124, 2, 'Bạn chưa có tài khoản?', 'Do not have an account?'),
(125, 1, 'Đăng Ký Ngay', 'Đăng Ký Ngay'),
(126, 2, 'Đăng Ký Ngay', 'Register'),
(127, 1, 'Nạp tiền', 'Nạp tiền'),
(128, 2, 'Nạp tiền', 'Recharge'),
(129, 1, 'Ngân hàng', 'Ngân hàng'),
(130, 2, 'Ngân hàng', 'Bank'),
(131, 1, 'Ví của tôi', 'Ví của tôi'),
(132, 2, 'Ví của tôi', 'My Wallet'),
(133, 1, 'Số dư hiện tại', 'Số dư hiện tại'),
(134, 2, 'Số dư hiện tại', 'Current balance'),
(135, 1, 'Tổng tiền nạp', 'Tổng tiền nạp'),
(136, 2, 'Tổng tiền nạp', 'Total Deposit'),
(137, 1, 'Số dư đã sử dụng', 'Số dư đã sử dụng'),
(138, 2, 'Số dư đã sử dụng', 'Used Balance'),
(139, 1, 'THANH TOÁN', 'Thanh toán'),
(141, 1, 'Lưu ý nạp tiền', 'Lưu ý nạp tiền'),
(142, 2, 'Lưu ý nạp tiền', 'Recharge note'),
(143, 1, 'Lịch sử nạp tiền', 'Lịch sử nạp tiền'),
(144, 2, 'Lịch sử nạp tiền', 'Recharge History'),
(145, 1, 'Số tài khoản:', 'Số tài khoản:'),
(146, 2, 'Số tài khoản:', 'Account number:'),
(147, 1, 'Chủ tài khoản:', 'Chủ tài khoản:'),
(148, 2, 'Chủ tài khoản:', 'Account name:'),
(149, 1, 'Ngân hàng:', 'Ngân hàng:'),
(150, 2, 'Ngân hàng:', 'Bank:'),
(151, 1, 'Nội dung chuyển khoản:', 'Nội dung chuyển khoản:'),
(152, 2, 'Nội dung chuyển khoản:', 'Transfer content:'),
(153, 1, 'Mã giao dịch', 'Mã giao dịch'),
(154, 2, 'Mã giao dịch', 'Transaction'),
(155, 1, 'Nội dung', 'Nội dung'),
(156, 2, 'Nội dung', 'Content'),
(157, 1, 'Số tiền nạp', 'Số tiền nạp'),
(158, 2, 'Số tiền nạp', 'Amount'),
(159, 1, 'Thực nhận', 'Thực nhận'),
(160, 2, 'Thực nhận', 'Received'),
(161, 1, 'Thời gian', 'Thời gian'),
(162, 2, 'Thời gian', 'Time'),
(163, 1, 'Trạng thái', 'Trạng thái'),
(164, 2, 'Trạng thái', 'Status'),
(165, 1, 'Đã thanh toán', 'Đã thanh toán'),
(166, 2, 'Đã thanh toán', 'Paid'),
(167, 1, 'Tất cả', 'Tất cả'),
(168, 2, 'Tất cả', 'ALL'),
(169, 1, 'Hôm nay', 'Hôm nay'),
(170, 2, 'Hôm nay', 'Today'),
(171, 1, 'Tuần này', 'Tuần này'),
(172, 2, 'Tuần này', 'This week'),
(173, 1, 'Tháng này', 'Tháng này'),
(174, 2, 'Tháng này', 'This month'),
(175, 1, 'Đã thanh toán:', 'Đã thanh toán:'),
(176, 2, 'Đã thanh toán:', 'Paid:'),
(177, 1, 'Thực nhận:', 'Thực nhận:'),
(178, 2, 'Thực nhận:', 'Received:'),
(179, 1, 'Thao tác', 'Thao tác'),
(180, 2, 'Thao tác', 'Action'),
(181, 1, 'Nhật ký hoạt động', 'Nhật ký hoạt động'),
(182, 2, 'Nhật ký hoạt động', 'Activity Log'),
(183, 1, 'Tìm kiếm', 'Tìm kiếm'),
(184, 2, 'Tìm kiếm', 'Search'),
(185, 1, 'Bỏ lọc', 'Bỏ lọc'),
(186, 2, 'Bỏ lọc', 'Clear Filter'),
(187, 1, 'Hiển thị', 'Hiển thị'),
(188, 2, 'Hiển thị', 'Show'),
(189, 1, 'Ẩn', 'Ẩn'),
(190, 2, 'Ẩn', 'Hide'),
(191, 1, 'Biến động số dư', 'Biến động số dư'),
(192, 2, 'Biến động số dư', 'Transactions'),
(193, 1, 'Số dư ban đầu', 'Số dư ban đầu'),
(194, 2, 'Số dư ban đầu', 'Initial balance'),
(195, 1, 'Số dư thay đổi', 'Số dư thay đổi'),
(196, 2, 'Số dư thay đổi', 'Balance change'),
(197, 1, 'Lý do', 'Lý do'),
(198, 2, 'Lý do', 'Reason'),
(199, 1, 'Chọn thời gian cần tìm', 'Chọn thời gian cần tìm'),
(200, 2, 'Chọn thời gian cần tìm', 'Choose a time to search'),
(203, 2, 'Hiển thị thêm', 'Show more'),
(204, 1, 'Hiển thị thêm', 'Hiển thị thêm'),
(205, 1, 'Ẩn bớt', 'Ẩn bớt'),
(206, 2, 'Ẩn bớt', 'Hide'),
(207, 1, 'Nội dung chuyển khoản', 'Nội dung chuyển khoản'),
(208, 2, 'Nội dung chuyển khoản', 'Transfer contents'),
(209, 1, 'Đăng nhập bằng Google', 'Đăng nhập bằng Google'),
(210, 2, 'Đăng nhập bằng Google', 'Login with Google'),
(211, 1, 'Đăng nhập bằng Facebook', 'Đăng nhập bằng Facebook'),
(212, 2, 'Đăng nhập bằng Facebook', 'Login with Google'),
(213, 1, 'Đăng ký tài khoản', 'Đăng ký tài khoản'),
(214, 2, 'Đăng ký tài khoản', 'Sign up for an account'),
(215, 1, 'Tài khoản đăng nhập', 'Tài khoản đăng nhập'),
(216, 2, 'Tài khoản đăng nhập', 'Username'),
(217, 1, 'Mật khẩu', 'Mật khẩu'),
(218, 2, 'Mật khẩu', 'Password'),
(219, 1, 'Nhập lại mật khẩu', 'Nhập lại mật khẩu'),
(220, 2, 'Nhập lại mật khẩu', 'Confirm password'),
(221, 1, 'Đăng Ký', 'Đăng Ký'),
(222, 2, 'Đăng Ký', 'Register'),
(223, 1, 'Vui lòng nhập thông tin đăng ký', 'Vui lòng nhập thông tin đăng ký'),
(224, 2, 'Vui lòng nhập thông tin đăng ký', 'Please enter registration information'),
(225, 1, 'Vui lòng nhập thông tin đăng nhập', 'Vui lòng nhập thông tin đăng nhập'),
(226, 2, 'Vui lòng nhập thông tin đăng nhập', 'Please enter login information'),
(227, 1, 'Thông tin cá nhân', 'Thông tin cá nhân'),
(228, 2, 'Thông tin cá nhân', 'Personal information'),
(229, 1, 'Cấu hình nạp tiền Crypto', 'Cấu hình nạp tiền Crypto'),
(230, 2, 'Cấu hình nạp tiền Crypto', 'Configuration Recharge Crypto'),
(231, 1, 'All Time', 'All Time'),
(232, 2, 'All Time', 'Toàn thời gian'),
(235, 1, 'Thống kê thanh toán tháng', 'Thống kê thanh toán tháng'),
(236, 2, 'Thống kê thanh toán tháng', 'Payment Statistics Month'),
(237, 1, 'Lịch sử nạp tiền Crypto', 'Lịch sử nạp tiền Crypto'),
(238, 2, 'Lịch sử nạp tiền Crypto', 'Crypto Deposit History'),
(239, 1, 'Thống kê', 'Thống kê'),
(240, 2, 'Thống kê', 'Statistical'),
(241, 1, 'Cấu hình', 'Cấu hình'),
(242, 2, 'Cấu hình', 'Configuration'),
(243, 1, 'Nạp tối đa', 'Nạp tối đa'),
(244, 2, 'Nạp tối đa', 'Maximum deposit amount'),
(245, 1, 'Nạp tối thiểu', 'Nạp tối thiểu'),
(246, 2, 'Nạp tối thiểu', 'Minimum deposit amount'),
(247, 1, 'Nạp tiền bằng Crypto', 'Nạp tiền bằng Crypto'),
(248, 2, 'Nạp tiền bằng Crypto', 'Deposit with Crypto'),
(249, 1, 'Lưu ý', 'Lưu ý'),
(250, 2, 'Lưu ý', 'Note'),
(251, 1, 'Lịch sử nạp Crypto', 'Lịch sử nạp Crypto'),
(252, 2, 'Lịch sử nạp Crypto', 'Crypto Deposit History'),
(253, 1, 'Số lượng', 'Số lượng'),
(254, 2, 'Số lượng', 'Amount'),
(255, 1, 'Thời gian tạo', 'Thời gian tạo'),
(256, 2, 'Thời gian tạo', 'Create date'),
(257, 1, 'Xem thêm', 'Xem thêm'),
(258, 2, 'Xem thêm', 'See more'),
(259, 1, 'The minimum deposit amount is:', 'The minimum deposit amount is:'),
(261, 1, 'Số tiền gửi tối đa là:', 'Số tiền gửi tối đa là:'),
(262, 2, 'Số tiền gửi tối đa là:', 'The maximum deposit amount is:'),
(263, 1, 'Số tiền gửi tối thiểu là:', 'Số tiền gửi tối thiểu là:'),
(264, 2, 'Số tiền gửi tối thiểu là:', 'The minimum deposit amount is:'),
(265, 1, 'Chức năng này đang được bảo trì', 'Chức năng này đang được bảo trì'),
(266, 2, 'Chức năng này đang được bảo trì', 'This function is under maintenance'),
(267, 1, 'Không thể tạo hóa đơn do lỗi API, vui lòng thử lại sau', 'Không thể tạo hóa đơn do lỗi API, vui lòng thử lại sau'),
(268, 2, 'Không thể tạo hóa đơn do lỗi API, vui lòng thử lại sau', 'Invoice could not be generated due to API error, please try again later'),
(269, 1, 'Tạo hoá đơn nạp tiền thành công', 'Tạo hoá đơn nạp tiền thành công'),
(270, 2, 'Tạo hoá đơn nạp tiền thành công', 'Deposit request created successfully'),
(271, 1, 'Nạp tiền bằng PayPal', 'Nạp tiền bằng PayPal'),
(272, 2, 'Nạp tiền bằng PayPal', 'Pay with PayPal'),
(273, 1, 'Lịch sử nạp PayPal', 'Lịch sử nạp PayPal'),
(274, 2, 'Lịch sử nạp PayPal', 'PayPal Recharge History'),
(275, 1, 'Số tiền gửi', 'Số tiền gửi'),
(276, 2, 'Số tiền gửi', 'Amount'),
(277, 1, 'Vui lòng nhập số tiền cần nạp', 'Vui lòng nhập số tiền cần nạp'),
(278, 2, 'Vui lòng nhập số tiền cần nạp', 'Please enter the amount to deposit'),
(279, 1, 'Mặc định', 'Mặc định'),
(280, 2, 'Mặc định', 'Default'),
(281, 1, 'Phổ biến', 'Phổ biến'),
(282, 2, 'Phổ biến', 'Popular'),
(283, 1, 'Tìm kiếm bài viết', 'Tìm kiếm bài viết'),
(284, 2, 'Tìm kiếm bài viết', 'Find Blogs'),
(285, 1, 'Bài viết phổ biến', 'Bài viết phổ biến'),
(286, 2, 'Bài viết phổ biến', 'Popular Feeds'),
(287, 1, 'Liên kết giới thiệu của bạn', 'Liên kết giới thiệu của bạn'),
(288, 2, 'Liên kết giới thiệu của bạn', 'Your referral link'),
(289, 1, 'Đã sao chép vào bộ nhớ tạm', 'Đã sao chép vào bộ nhớ tạm'),
(290, 2, 'Đã sao chép vào bộ nhớ tạm', 'Copied to clipboard'),
(291, 1, 'Số tài khoản', 'Số tài khoản'),
(292, 2, 'Số tài khoản', 'Account number'),
(293, 1, 'Tên chủ tài khoản', 'Tên chủ tài khoản'),
(294, 2, 'Tên chủ tài khoản', 'Account name'),
(295, 1, 'Số tiền cần rút', 'Số tiền cần rút'),
(296, 2, 'Số tiền cần rút', 'Amount to withdraw'),
(297, 1, 'Rút số dư hoa hồng', 'Rút số dư hoa hồng'),
(298, 2, 'Rút số dư hoa hồng', 'Affiliate Withdraw'),
(299, 1, 'Lịch sử rút tiền', 'Lịch sử rút tiền'),
(300, 2, 'Lịch sử rút tiền', 'Withdraw history'),
(301, 1, 'Rút tiền', 'Rút tiền'),
(302, 2, 'Rút tiền', 'Withdraw'),
(303, 1, 'Lịch sử', 'Lịch sử'),
(304, 2, 'Lịch sử', 'History'),
(305, 1, 'Thao tác quá nhanh, vui lòng chờ', 'Thao tác quá nhanh, vui lòng chờ'),
(306, 2, 'Thao tác quá nhanh, vui lòng chờ', 'You are working too fast, please wait'),
(307, 1, 'Vui lòng chọn ngân hàng cần rút', 'Vui lòng chọn ngân hàng cần rút'),
(308, 2, 'Vui lòng chọn ngân hàng cần rút', 'Please select the bank to withdraw'),
(309, 1, 'Vui lòng nhập số tài khoản cần rút', 'Vui lòng nhập số tài khoản cần rút'),
(310, 2, 'Vui lòng nhập số tài khoản cần rút', 'Please enter the account number to withdraw'),
(311, 1, 'Vui lòng nhập tên chủ tài khoản', 'Vui lòng nhập tên chủ tài khoản'),
(312, 2, 'Vui lòng nhập tên chủ tài khoản', 'Please enter the account name'),
(313, 1, 'Vui lòng nhập số tiền cần rút', 'Vui lòng nhập số tiền cần rút'),
(314, 2, 'Vui lòng nhập số tiền cần rút', 'Please enter the amount to withdraw'),
(315, 1, 'Số tiền rút tối thiểu phải là', 'Số tiền rút tối thiểu phải là'),
(316, 2, 'Số tiền rút tối thiểu phải là', 'Minimum withdrawal amount should be'),
(317, 1, 'Số dư hoa hồng khả dụng của bạn không đủ', 'Số dư hoa hồng khả dụng của bạn không đủ'),
(318, 2, 'Số dư hoa hồng khả dụng của bạn không đủ', 'Your available commission balance is not enough'),
(319, 1, 'Gian lận khi rút số dư hoa hồng', 'Gian lận khi rút số dư hoa hồng'),
(320, 2, 'Gian lận khi rút số dư hoa hồng', 'Fraud when withdrawing commission balance'),
(321, 1, 'Tài khoản của bạn đã bị khóa vì gian lận', 'Tài khoản của bạn đã bị khóa vì gian lận'),
(322, 2, 'Tài khoản của bạn đã bị khóa vì gian lận', 'Your account has been blocked for cheating'),
(323, 1, 'Yêu cầu rút tiền được tạo thành công, vui lòng đợi ADMIN xử lý', 'Yêu cầu rút tiền được tạo thành công, vui lòng đợi ADMIN xử lý'),
(324, 2, 'Yêu cầu rút tiền được tạo thành công, vui lòng đợi ADMIN xử lý', 'Withdrawal request created successfully, please wait for ADMIN to process'),
(325, 1, 'Số tiền rút', 'Số tiền rút'),
(326, 2, 'Số tiền rút', 'Withdrawal amount'),
(327, 1, 'Thông kê của bạn', 'Thông kê của bạn'),
(328, 2, 'Thông kê của bạn', 'Your stats'),
(329, 1, 'Số tiền hoa hồng khả dụng', 'Số tiền hoa hồng khả dụng'),
(330, 2, 'Số tiền hoa hồng khả dụng', 'Amount of available commission'),
(331, 1, 'Tổng số tiền hoa hồng đã nhận', 'Tổng số tiền hoa hồng đã nhận'),
(332, 2, 'Tổng số tiền hoa hồng đã nhận', 'Total commission received'),
(333, 1, 'Số lần nhấp vào liên kết', 'Số lần nhấp vào liên kết'),
(334, 2, 'Số lần nhấp vào liên kết', 'Clicks'),
(335, 1, 'Lịch sử hoa hồng', 'Lịch sử hoa hồng'),
(336, 2, 'Lịch sử hoa hồng', 'History commission'),
(337, 1, 'Hoa hồng ban đầu', 'Hoa hồng ban đầu'),
(338, 2, 'Hoa hồng ban đầu', 'Initial commission balance'),
(339, 1, 'Hoa hồng thay đổi', 'Hoa hồng thay đổi'),
(340, 2, 'Hoa hồng thay đổi', 'Change commission balance'),
(341, 1, 'Hoa hồng hiện tại', 'Hoa hồng hiện tại'),
(342, 2, 'Hoa hồng hiện tại', 'Current commission balance'),
(343, 1, 'Vui lòng nhập số lượng cần mua', 'Vui lòng nhập số lượng cần mua'),
(344, 2, 'Vui lòng nhập số lượng cần mua', 'Please enter the quantity'),
(345, 1, 'Tổng tiền thanh toán:', 'Tổng tiền thanh toán:'),
(346, 2, 'Tổng tiền thanh toán:', 'Total payment:'),
(347, 1, 'Số tiền giảm:', 'Số tiền giảm:'),
(348, 2, 'Số tiền giảm:', 'Discount:'),
(349, 1, 'Thành tiền:', 'Thành tiền:'),
(350, 2, 'Thành tiền:', 'Price:'),
(351, 1, 'Mã giảm giá:', 'Mã giảm giá:'),
(352, 2, 'Mã giảm giá:', 'Coupon:'),
(353, 1, 'Nhập mã giảm giá nếu có', 'Nhập mã giảm giá nếu có'),
(354, 2, 'Nhập mã giảm giá nếu có', 'Enter discount code if available'),
(355, 1, 'THÔNG TIN MUA HÀNG', 'THÔNG TIN MUA HÀNG'),
(356, 2, 'THÔNG TIN MUA HÀNG', 'PURCHASE INFORMATION'),
(357, 1, 'Số lượng cần mua:', 'Số lượng cần mua:'),
(358, 2, 'Số lượng cần mua:', 'Amount:'),
(359, 1, 'Chia sẻ:', 'Chia sẻ:'),
(360, 2, 'Chia sẻ:', 'Share:'),
(361, 1, 'Mua Ngay', 'Mua Ngay'),
(362, 2, 'Mua Ngay', 'Buy Now'),
(363, 1, 'Kho hàng:', 'Kho hàng:'),
(364, 2, 'Kho hàng:', 'Stock:'),
(365, 1, 'Đã bán:', 'Đã bán:'),
(366, 2, 'Đã bán:', 'Sold:'),
(367, 1, 'Yêu Thích', 'Yêu Thích'),
(368, 2, 'Yêu Thích', 'Add Favourite'),
(369, 1, 'Bỏ Thích', 'Bỏ Thích'),
(370, 2, 'Bỏ Thích', 'Remove Favourite'),
(371, 1, 'Danh sách sản phẩm yêu thích', 'Danh sách sản phẩm yêu thích'),
(372, 2, 'Danh sách sản phẩm yêu thích', 'Favorites'),
(373, 1, 'Sản phẩm', 'Sản phẩm'),
(374, 2, 'Sản phẩm', 'Product'),
(375, 1, 'Kho hàng', 'Kho hàng'),
(376, 2, 'Kho hàng', 'Stock'),
(377, 1, 'Giá', 'Giá'),
(378, 2, 'Giá', 'Price'),
(379, 1, 'Mua', 'Mua'),
(380, 2, 'Mua', 'Buy'),
(381, 1, 'Xem', 'Xem'),
(382, 2, 'Xem', 'View'),
(383, 1, 'Xóa', 'Xóa'),
(384, 2, 'Xóa', 'Delete'),
(385, 1, 'Hết hàng', 'Hết hàng'),
(386, 2, 'Hết hàng', 'Out of Stock'),
(387, 1, 'Thêm vào mục yêu thích', 'Thêm vào mục yêu thích'),
(388, 2, 'Thêm vào mục yêu thích', 'Add to Favorites'),
(389, 1, 'Đã thêm vào mục yêu thích', 'Đã thêm vào mục yêu thích'),
(390, 2, 'Đã thêm vào mục yêu thích', 'Added to Favorites'),
(393, 2, 'Lịch sử đơn hàng', 'Order History'),
(394, 1, 'Xóa đơn hàng', 'Xóa đơn hàng'),
(395, 2, 'Xóa đơn hàng', 'Delete Order'),
(396, 1, 'Xóa đơn hàng đã chọn khỏi lịch sử của bạn', 'Xóa đơn hàng đã chọn khỏi lịch sử của bạn'),
(397, 2, 'Xóa đơn hàng đã chọn khỏi lịch sử của bạn', 'Delete selected orders from your history'),
(398, 1, 'Mã đơn hàng', 'Mã đơn hàng'),
(399, 2, 'Mã đơn hàng', 'Transaction'),
(400, 2, 'Thanh toán', 'Pay'),
(401, 1, 'Xem chi tiết', 'Xem chi tiết'),
(402, 2, 'Xem chi tiết', 'See details'),
(403, 1, 'Tải về máy', 'Tải về máy'),
(404, 2, 'Tải về máy', 'Download'),
(405, 1, 'Xóa khỏi lịch sử', 'Xóa khỏi lịch sử'),
(406, 2, 'Xóa khỏi lịch sử', 'Delete from history'),
(407, 1, 'Liên hệ', 'Liên hệ'),
(408, 2, 'Liên hệ', 'Contact'),
(409, 1, 'Chính sách', 'Chính sách'),
(410, 2, 'Chính sách', 'Policy'),
(411, 1, 'Tài liệu API', 'Tài liệu API'),
(412, 2, 'Tài liệu API', 'API Document'),
(413, 1, 'Trang chủ', 'Trang chủ'),
(414, 2, 'Trang chủ', 'Home'),
(415, 1, 'Liên kết', 'Liên kết'),
(416, 2, 'Liên kết', 'Links'),
(417, 1, 'Câu hỏi thường gặp', 'Câu hỏi thường gặp'),
(418, 2, 'Câu hỏi thường gặp', 'FAQ'),
(419, 1, 'Liên hệ chúng tôi', 'Liên hệ chúng tôi'),
(420, 2, 'Liên hệ chúng tôi', 'Contact us'),
(421, 1, 'Sản phẩm:', 'Sản phẩm:'),
(422, 2, 'Sản phẩm:', 'Product:'),
(423, 1, 'Số lượng mua:', 'Số lượng mua:'),
(424, 2, 'Số lượng mua:', 'Quantity purchased:'),
(425, 1, 'Thanh toán:', 'Thanh toán:'),
(426, 2, 'Thanh toán:', 'Pay:'),
(427, 1, 'Mã đơn hàng:', 'Mã đơn hàng:'),
(428, 2, 'Mã đơn hàng:', 'Transaction:'),
(429, 1, 'Chi tiết đơn hàng', 'Chi tiết đơn hàng'),
(430, 2, 'Chi tiết đơn hàng', 'Order details'),
(431, 1, 'Tài khoản', 'Tài khoản'),
(432, 2, 'Tài khoản', 'Account'),
(433, 1, 'Lưu các tài khoản đã chọn vào tệp .txt', 'Lưu các tài khoản đã chọn vào tệp .txt'),
(434, 2, 'Lưu các tài khoản đã chọn vào tệp .txt', 'Save selected accounts to a .txt file'),
(435, 1, 'Sao chép các tài khoản đã chọn', 'Sao chép các tài khoản đã chọn'),
(436, 2, 'Sao chép các tài khoản đã chọn', 'Copy selected accounts'),
(437, 1, 'Chỉ sao chép UID các tài khoản đã chọn', 'Chỉ sao chép UID các tài khoản đã chọn'),
(438, 2, 'Chỉ sao chép UID các tài khoản đã chọn', 'Copy only the UID of the selected accounts'),
(439, 1, 'Số dư của tôi:', 'Số dư của tôi:'),
(440, 2, 'Số dư của tôi:', 'My balance:'),
(441, 1, 'Khuyến mãi', 'Khuyến mãi'),
(442, 2, 'Khuyến mãi', 'Promotion'),
(443, 1, 'Số tiền nạp lớn hơn hoặc bằng', 'Số tiền nạp lớn hơn hoặc bằng'),
(444, 2, 'Số tiền nạp lớn hơn hoặc bằng', 'The deposit amount is greater than or equal to'),
(445, 1, 'Khuyến mãi thêm', 'Khuyến mãi thêm'),
(446, 2, 'Khuyến mãi thêm', 'Extra'),
(447, 1, 'Thông tin chi tiết khách hàng', 'Thông tin chi tiết khách hàng'),
(448, 2, 'Thông tin chi tiết khách hàng', 'Customer details'),
(449, 1, 'Chia sẻ liên kết này lên mạng xã hội hoặc bạn bè của bạn.', 'Chia sẻ liên kết này lên mạng xã hội hoặc bạn bè của bạn.'),
(451, 1, 'Tài liệu tích hợp API', 'Tài liệu tích hợp API'),
(452, 2, 'Tài liệu tích hợp API', 'API integration documentation'),
(453, 1, 'Lấy thông tin tài khoản', 'Lấy thông tin tài khoản'),
(454, 2, 'Lấy thông tin tài khoản', 'Get account information'),
(455, 1, 'Lấy danh sách chuyên mục và sản phẩm', 'Lấy danh sách chuyên mục và sản phẩm'),
(456, 2, 'Lấy danh sách chuyên mục và sản phẩm', 'Get a list of categories and products'),
(457, 1, 'Mua hàng', 'Mua hàng'),
(458, 2, 'Mua hàng', 'Purchase'),
(459, 1, 'ID sản phẩm cần mua', 'ID sản phẩm cần mua'),
(460, 2, 'ID sản phẩm cần mua', 'Product ID to buy'),
(461, 1, 'Số lượng cần mua', 'Số lượng cần mua'),
(462, 2, 'Số lượng cần mua', 'Quantity to buy'),
(463, 1, 'Mã giảm giá nếu có', 'Mã giảm giá nếu có'),
(464, 2, 'Mã giảm giá nếu có', 'Discount code if available'),
(465, 1, 'Bảo mật', 'Bảo mật'),
(466, 2, 'Bảo mật', 'Security'),
(467, 1, 'Bảo mật tài khoản', 'Bảo mật tài khoản'),
(468, 2, 'Bảo mật tài khoản', 'Account security'),
(469, 1, 'Xác minh đăng nhập bằng', 'Xác minh đăng nhập bằng'),
(470, 2, 'Xác minh đăng nhập bằng', 'Verify login with'),
(471, 1, 'Gửi thông báo về mail khi đăng nhập thành công:', 'Gửi thông báo về mail khi đăng nhập thành công:'),
(472, 2, 'Gửi thông báo về mail khi đăng nhập thành công:', 'Send email notification upon successful login:'),
(473, 1, 'Đúng Trình Duyệt và IP mua hàng mới có thể xem đơn hàng:', 'Đúng Trình Duyệt và IP mua hàng mới có thể xem đơn hàng:'),
(474, 2, 'Đúng Trình Duyệt và IP mua hàng mới có thể xem đơn hàng:', 'Only the correct browser and purchase IP can view orders:'),
(475, 1, '- Sử dụng điện thoại tải App Google Authenticator sau đó quét mã QR để nhận mã xác minh.', '- Sử dụng điện thoại tải App Google Authenticator sau đó quét mã QR để nhận mã xác minh.'),
(476, 2, '- Sử dụng điện thoại tải App Google Authenticator sau đó quét mã QR để nhận mã xác minh.', '- Use your phone to download the Google Authenticator App then scan the QR code to receive the verification code.'),
(477, 1, '- Mã QR sẽ được thay đổi khi bạn tắt xác minh.', '- Mã QR sẽ được thay đổi khi bạn tắt xác minh.'),
(478, 2, '- Mã QR sẽ được thay đổi khi bạn tắt xác minh.', '- The QR code will be changed when you turn off verification.'),
(479, 1, '- Nếu bật Xác minh đăng nhập bằng OTP Mail thì không bật Google Authenticator và ngược lại.', '- Nếu bật Xác minh đăng nhập bằng OTP Mail thì không bật Google Authenticator và ngược lại.'),
(480, 2, '- Nếu bật Xác minh đăng nhập bằng OTP Mail thì không bật Google Authenticator và ngược lại.', '- If you enable Login Verification using OTP Mail, do not enable Google Authenticator and vice versa.'),
(481, 1, 'Lưu', 'Lưu'),
(482, 2, 'Lưu', 'Save'),
(483, 1, 'Nhập mã xác minh để lưu', 'Nhập mã xác minh để lưu'),
(484, 2, 'Nhập mã xác minh để lưu', 'Enter the verification code to save'),
(485, 1, 'Sản phẩm liên quan đến từ khóa', 'Sản phẩm liên quan đến từ khóa'),
(486, 2, 'Sản phẩm liên quan đến từ khóa', 'Products related to keyword'),
(487, 1, 'trong số', 'trong số'),
(488, 2, 'trong số', 'of'),
(489, 1, 'Quay lại', 'Quay lại'),
(490, 2, 'Quay lại', 'Back'),
(491, 1, 'Tải về đơn hàng', 'Tải về đơn hàng'),
(492, 2, 'Tải về đơn hàng', 'Download Order'),
(493, 1, 'Hệ thống sẽ tải về đơn hàng khi bạn nhấn đồng ý', 'Hệ thống sẽ tải về đơn hàng khi bạn nhấn đồng ý'),
(494, 2, 'Hệ thống sẽ tải về đơn hàng khi bạn nhấn đồng ý', 'The system will download the order when you click Okey'),
(495, 1, 'Hệ thống sẽ xóa đơn hàng khỏi lịch sử của bạn khi bạn nhấn đồng ý', 'Hệ thống sẽ xóa đơn hàng khỏi lịch sử của bạn khi bạn nhấn đồng ý'),
(496, 2, 'Hệ thống sẽ xóa đơn hàng khỏi lịch sử của bạn khi bạn nhấn đồng ý', 'The system will delete the order from your history when you click Okey'),
(497, 1, 'Đóng', 'Đóng'),
(498, 2, 'Đóng', 'Cancel'),
(499, 1, 'Xuất tất cả tài khoản ra tệp .txt', 'Xuất tất cả tài khoản ra tệp .txt'),
(500, 2, 'Xuất tất cả tài khoản ra tệp .txt', 'Export all accounts to a .txt file'),
(501, 1, 'Xóa đơn hàng này khỏi lịch sử của bạn', 'Xóa đơn hàng này khỏi lịch sử của bạn'),
(502, 2, 'Xóa đơn hàng này khỏi lịch sử của bạn', 'Delete this order from your history'),
(503, 1, 'Thành công !', 'Thành công !'),
(504, 2, 'Thành công !', 'Success !'),
(505, 1, 'Xem chi tiết đơn hàng', 'Xem chi tiết đơn hàng'),
(506, 2, 'Xem chi tiết đơn hàng', 'View order details'),
(507, 1, 'Mua thêm', 'Mua thêm'),
(508, 2, 'Mua thêm', 'Buy more'),
(509, 1, 'Tạo đơn hàng thành công !', 'Tạo đơn hàng thành công !'),
(510, 2, 'Tạo đơn hàng thành công !', 'Create order successfully!'),
(511, 1, 'Đang xử lý...', 'Đang xử lý...'),
(512, 2, 'Đang xử lý...', 'Processing...');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `admin` int(11) NOT NULL DEFAULT 0,
  `ctv` int(11) NOT NULL DEFAULT 0,
  `banned` int(11) NOT NULL DEFAULT 0,
  `create_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `time_session` int(11) DEFAULT 0,
  `time_request` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_2fa` varchar(255) DEFAULT NULL,
  `token_forgot_password` varchar(255) DEFAULT NULL,
  `time_forgot_password` int(11) NOT NULL DEFAULT 0,
  `money` float NOT NULL DEFAULT 0,
  `total_money` float NOT NULL DEFAULT 0,
  `debit` float NOT NULL DEFAULT 0,
  `gender` varchar(255) NOT NULL DEFAULT 'Male',
  `device` text DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `status_2fa` int(11) NOT NULL DEFAULT 0,
  `SecretKey_2fa` varchar(255) DEFAULT NULL,
  `limit_2fa` int(11) NOT NULL DEFAULT 0,
  `discount` float NOT NULL DEFAULT 0,
  `trial` int(11) NOT NULL DEFAULT 0,
  `ref_id` int(11) NOT NULL DEFAULT 0,
  `ref_ck` float NOT NULL DEFAULT 0,
  `ref_click` int(11) NOT NULL DEFAULT 0,
  `ref_amount` float NOT NULL DEFAULT 0,
  `ref_price` float NOT NULL DEFAULT 0,
  `ref_total_price` float NOT NULL DEFAULT 0,
  `telegram_chat_id` text DEFAULT NULL,
  `api_key` varchar(55) DEFAULT NULL,
  `login_attempts` int(11) NOT NULL DEFAULT 0,
  `status_otp_mail` int(11) NOT NULL DEFAULT 0,
  `otp_mail` varchar(55) DEFAULT NULL,
  `token_otp_mail` varchar(255) DEFAULT NULL,
  `limit_otp_mail` int(11) NOT NULL DEFAULT 0,
  `status_noti_login_to_mail` int(11) NOT NULL DEFAULT 0,
  `status_view_order` int(11) NOT NULL DEFAULT 0,
  `utm_source` varchar(55) NOT NULL DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `fullname`, `phone`, `admin`, `ctv`, `banned`, `create_date`, `update_date`, `time_session`, `time_request`, `ip`, `token`, `token_2fa`, `token_forgot_password`, `time_forgot_password`, `money`, `total_money`, `debit`, `gender`, `device`, `avatar`, `status_2fa`, `SecretKey_2fa`, `limit_2fa`, `discount`, `trial`, `ref_id`, `ref_ck`, `ref_click`, `ref_amount`, `ref_price`, `ref_total_price`, `telegram_chat_id`, `api_key`, `login_attempts`, `status_otp_mail`, `otp_mail`, `token_otp_mail`, `limit_otp_mail`, `status_noti_login_to_mail`, `status_view_order`, `utm_source`) VALUES
(1, 'admin', '$2y$10$jArj9nh/CWClrLYlpBqeE.cXeij/bibiStstfXKmTLtgVOQUbBzEu', 'admin@admin.com', NULL, NULL, 1, 0, 0, '2025-03-22 09:41:09', '2025-03-22 09:41:09', 1742970631, 1742659497, '::1', 'Gc0dRVxSKbI5foa7N9YOwXekrh1vzMujTUqgl6J8nAWp2syPCHZ3D4EBimtLQ1742611268e55010f777d74bf337f07620a54ae438', '', NULL, 0, 0, 0, 0, 'Male', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0', NULL, 0, 'F5ZUKZFJ477NHD3H', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 'a76d9b043f76f638c0832468bb3fa219', 0, 0, '', '', 0, 0, 0, 'camp_abc');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `aff_log`
--
ALTER TABLE `aff_log`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `aff_withdraw`
--
ALTER TABLE `aff_withdraw`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `automations`
--
ALTER TABLE `automations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `block_ip`
--
ALTER TABLE `block_ip`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cards`
--
ALTER TABLE `cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trans_id` (`trans_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `coupon_used`
--
ALTER TABLE `coupon_used`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `deposit_log`
--
ALTER TABLE `deposit_log`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `dongtien`
--
ALTER TABLE `dongtien`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transid` (`transid`);

--
-- Chỉ mục cho bảng `email_campaigns`
--
ALTER TABLE `email_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `email_sending`
--
ALTER TABLE `email_sending`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_attempts`
--
ALTER TABLE `failed_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `log_bank_auto`
--
ALTER TABLE `log_bank_auto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tid` (`tid`);

--
-- Chỉ mục cho bảng `log_ref`
--
ALTER TABLE `log_ref`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `momo`
--
ALTER TABLE `momo`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `tranId` (`tranId`);

--
-- Chỉ mục cho bảng `order_log`
--
ALTER TABLE `order_log`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_bank`
--
ALTER TABLE `payment_bank`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `tid` (`tid`);

--
-- Chỉ mục cho bảng `payment_crypto`
--
ALTER TABLE `payment_crypto`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_flutterwave`
--
ALTER TABLE `payment_flutterwave`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_manual`
--
ALTER TABLE `payment_manual`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_momo`
--
ALTER TABLE `payment_momo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tid` (`tid`);

--
-- Chỉ mục cho bảng `payment_paypal`
--
ALTER TABLE `payment_paypal`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_pm`
--
ALTER TABLE `payment_pm`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_squadco`
--
ALTER TABLE `payment_squadco`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `payment_toyyibpay`
--
ALTER TABLE `payment_toyyibpay`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trans_id` (`trans_id`),
  ADD UNIQUE KEY `BillCode` (`BillCode`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Chỉ mục cho bảng `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_die`
--
ALTER TABLE `product_die`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_discount`
--
ALTER TABLE `product_discount`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `trans_id` (`trans_id`);

--
-- Chỉ mục cho bảng `product_sold`
--
ALTER TABLE `product_sold`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_stock`
--
ALTER TABLE `product_stock`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `translate`
--
ALTER TABLE `translate`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_role`
--
ALTER TABLE `admin_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `aff_log`
--
ALTER TABLE `aff_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `aff_withdraw`
--
ALTER TABLE `aff_withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `automations`
--
ALTER TABLE `automations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `block_ip`
--
ALTER TABLE `block_ip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `cards`
--
ALTER TABLE `cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `coupon_used`
--
ALTER TABLE `coupon_used`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `deposit_log`
--
ALTER TABLE `deposit_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `dongtien`
--
ALTER TABLE `dongtien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `email_campaigns`
--
ALTER TABLE `email_campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `email_sending`
--
ALTER TABLE `email_sending`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_attempts`
--
ALTER TABLE `failed_attempts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT cho bảng `log_bank_auto`
--
ALTER TABLE `log_bank_auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `log_ref`
--
ALTER TABLE `log_ref`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `momo`
--
ALTER TABLE `momo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_log`
--
ALTER TABLE `order_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payment_bank`
--
ALTER TABLE `payment_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payment_crypto`
--
ALTER TABLE `payment_crypto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payment_flutterwave`
--
ALTER TABLE `payment_flutterwave`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payment_manual`
--
ALTER TABLE `payment_manual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payment_momo`
--
ALTER TABLE `payment_momo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payment_paypal`
--
ALTER TABLE `payment_paypal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payment_pm`
--
ALTER TABLE `payment_pm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payment_squadco`
--
ALTER TABLE `payment_squadco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `payment_toyyibpay`
--
ALTER TABLE `payment_toyyibpay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `post_category`
--
ALTER TABLE `post_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `product_die`
--
ALTER TABLE `product_die`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_discount`
--
ALTER TABLE `product_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_sold`
--
ALTER TABLE `product_sold`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product_stock`
--
ALTER TABLE `product_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT cho bảng `promotions`
--
ALTER TABLE `promotions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `translate`
--
ALTER TABLE `translate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=513;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
