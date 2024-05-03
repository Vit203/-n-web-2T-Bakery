-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 03, 2024 lúc 08:02 PM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `2tbakery`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `remember_token` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `role` varchar(50) DEFAULT 'customer',
  `status` tinyint(1) DEFAULT 1 COMMENT '1 là ok, 0 bị khóa',
  `created_at` date DEFAULT current_timestamp(),
  `updated_at` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `fname`, `lname`, `email`, `phone`, `password`, `remember_token`, `province`, `address`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Duong Van', 'Tai', 'admin2@example.com', '0964461742', '25d55ad283aa400af464c76d713c07ad', '', 'Hà Nội', '235 Hoang Quoc Viet', 'admin', 1, '2024-04-30', '2024-05-01'),
(11, 'Duong Duc', 'Toan', 'ddt2182003@gmail.com', '0397920226', '6e8f5f1a2efd944f1410359a41737332', '', 'Hà Nội', 'Hà Nội', 'admin', 1, '2024-05-02', '2024-05-02'),
(12, 'Nguyen Ngoc', 'Bich', 'bxd220903@gmail.com', '0344567891', 'c7a34a9b89201d946ceb5b8187d7268a', '', 'Hà Nội', '222 Hoang Quoc Viet', 'customer', 1, '2024-05-03', '2024-05-03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `site` varchar(255) DEFAULT 'home',
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1 COMMENT '1 là hiển thị, 0 ẩn',
  `priority` tinyint(4) DEFAULT 1,
  `created_at` date DEFAULT current_timestamp(),
  `updated_at` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banner`
--

INSERT INTO `banner` (`id`, `name`, `image`, `site`, `description`, `status`, `priority`, `created_at`, `updated_at`) VALUES
(2, 'Cookie banner', 'cookie-banner.png', 'Home', 'Small home banner ', 1, 2, '2024-04-30', '2024-05-01'),
(5, 'Product detail banner', 'banner-6.png', 'Product Detail', 'Product detail banner', 1, 1, '2024-04-30', '2024-05-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog`
--

CREATE TABLE `blog` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1 COMMENT '1 là hiển thị, 0 ẩn',
  `account_id` int(11) NOT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `updated_at` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(1) DEFAULT 1 COMMENT '1 là hiển thị, 0 ẩn',
  `priority` tinyint(4) DEFAULT 1,
  `created_at` date DEFAULT current_timestamp(),
  `updated_at` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `status`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'Bread', 1, 1, '2024-04-30', '2024-05-01'),
(2, 'Cake', 1, 1, '2024-04-30', '2024-05-01'),
(4, 'Baking ingredients', 1, 1, '2024-04-30', '2024-05-01'),
(15, 'Cupcake', 1, 1, '2024-04-30', '2024-05-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `content` text DEFAULT NULL,
  `blog_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `updated_at` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`id`, `message`, `name`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'I would like to book in avanced your catering service', 'Duong Duc Toan', 'admin2@example.com', '0345573088', '2024-05-01', '2024-05-01'),
(2, 'I would like to order a birthday cake for my aughter', 'Duong Van Tai', 'dvt2468@gmail.com', '0526478951', '2024-05-01', '2024-05-01'),
(3, 'nho nguoi yeu quaaaaa', 'Duong Duc Toan', 'admin2@example.com', '0345573088', '2024-05-03', '2024-05-03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupon`
--

CREATE TABLE `coupon` (
  `id` varchar(100) NOT NULL,
  `coupon_value` float(9,3) NOT NULL DEFAULT 0.000,
  `used_times` mediumint(8) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 is active, 0 is expired',
  `created_at` date DEFAULT current_timestamp(),
  `updated_at` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupon`
--

INSERT INTO `coupon` (`id`, `coupon_value`, `used_times`, `status`, `created_at`, `updated_at`) VALUES
('BEAUTIFUL', 0.100, 100, 1, '2024-05-01', '2024-05-01'),
('HAPPY', 0.250, 98, 1, '2024-05-01', '0000-00-00'),
('WELCOME', 0.300, 92, 1, '2024-05-01', '0000-00-00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `province` varchar(100) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `delivery` varchar(100) NOT NULL,
  `payment` varchar(100) NOT NULL,
  `status` tinyint(1) DEFAULT 1 COMMENT '1 là pending, 0 delivered,2 la delivering, 3 la canceled',
  `account_id` int(11) NOT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `updated_at` date DEFAULT current_timestamp(),
  `coupon` float(9,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `fname`, `lname`, `email`, `phone`, `province`, `address`, `note`, `delivery`, `payment`, `status`, `account_id`, `created_at`, `updated_at`, `coupon`) VALUES
(1, 'Duong Duc', 'Toan', 'admin2@example.com', '0345573088', 'Hà Nội', '235 Hoang Quoc Viet', NULL, 'Giaohangtietkiem', 'Cash on delivery', 0, 1, '2024-05-01', '2024-05-03', NULL),
(155, 'Duong Duc', 'Toan', 'admin2@example.com', '0345573088', 'Hà Nội', '235 Hoang Quoc Viet', '', 'Giaohangtietkiem', 'Cash on delivery', 1, 1, '2024-05-03', '2024-05-03', 0.300),
(157, 'Nguyen Ngoc', 'Bich', 'bxd220903@gmail.com', '0344567891', 'Hà Nội', '222 Hoang Quoc Viet', '', 'Giaohangtietkiem', 'Cash on delivery', 2, 12, '2024-05-03', '2024-05-03', 0.000),
(159, 'Duong Van', 'Tai', 'ddt2182003@gmail.com', '0397920226', 'Hà Nội', 'Hà Nội', '', 'Giaohangtietkiem', 'Cash on delivery', 1, 11, '2024-05-03', '2024-05-03', 0.000);


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 8, 1, 6),
(1, 11, 1, 2.9),
(1, 13, 1, 11.45),
(157, 14, 1, 5),
(1, 9, 1, 20);


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `image` varchar(200) NOT NULL,
  `price` float(9,3) NOT NULL,
  `sale_price` float(9,3) DEFAULT 0.000,
  `description` text DEFAULT NULL,
  `origin` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `status` tinyint(1) DEFAULT 1 COMMENT '1 là hiển thị, 0 ẩn',
  `category_id` int(11) NOT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `updated_at` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `price`, `sale_price`, `description`, `origin`, `quantity`, `status`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'Baguette', 'bread-9.png', 20.000, 15.000, 'Freshly baked every day !', 'vn', 2, 1, 1, '2024-04-30', '2024-05-01'),
(3, 'Brown Bread', 'bread-2.jpg', 5.000, 4.000, 'Healthy for those who are dieting !', 'usa', 1, 1, 1, '2024-04-30', '2024-05-01'),
(4, 'Strawberry Cake', 'strawberrycake.png', 35.000, 32.000, 'Soft, fragrant sponge cake, accompanied by creamy vanilla frosting, and fresh strawberries', 'vn', 5, 1, 2, '2024-04-30', '2024-05-01'),
(5, 'Pavlova', 'pavlova.png', 15.000, 14.000, 'Australian traditional cake with crispy meringue', 'vn', 2, 1, 2, '2024-04-30', '2024-05-01'),
(6, 'Wheat flour', 'bread-3.jpg', 6.000, 0.000, 'Wheat flour makes your cakes fluffy and scrumptious !!!', 'usa', 20, 1, 4, '2024-04-30', '2024-05-01'),
(7, 'Rye flour', 'bread-6.jpg', 7.000, 6.000, 'Delight your taste with unique texture and flavor', 'usa', 14, 1, 4, '2024-04-30', '2024-05-01'),
(8, 'French toast', 'bread-8.jpg', 6.000, 2.000, 'Crunchy crust - a companion for a hot bowl of soup', 'vn', 87, 1, 1, '2024-04-30', '2024-05-01'),
(9, 'Blueberry cake', 'blueberrycake.jpg', 20.000, 0.000, 'Scrumptious blueberry filling covered by creamy  buttercream frosting', 'vn', 15, 1, 2, '2024-04-30', '2024-05-01'),
(10, 'Matcha Cupcake', 'cupcake3.png', 6.000, 0.000, 'This cupcake is full of matcha flavour !! Ready to ve devoured', 'vn', 20, 1, 15, '2024-04-30', '2024-05-01'),
(11, 'Coffee bread', 'offer.png', 8.750, 2.900, 'Explode your palate with fragrant coffee odour anf booming flavour', 'usa', 100, 1, 1, '2024-04-30', '2024-05-01'),
(12, 'Chocolate Pudding', 'bread-11.png', 12.000, 11.000, 'I would definitely recommend this pastry to anyone looking for a delicious .', 'vn', 100, 1, 1, '2024-05-03', '2024-05-03'),
(13, 'The Cupcake Club', 'dish2.jpg', 13.000, 11.450, 'Considering all these factors, a perfect cupcake would score a solid 10!', 'usa', 50, 1, 2, '2024-05-03', '2024-05-03'),
(14, 'Yummy Cupcakes', 'dish3.jpg', 10.000, 2.000, 'This cake looks absolutely stunning! The decoration is so intricate and elegant.', 'vn', 77, 1, 15, '2024-05-03', '2024-05-03'),
(15, 'Cuppy Cake Factory', 'dish8.jpg', 12.000, 0.000, 'I would definitely recommend this pastry to anyone looking for a delicious.', 'usa', 20, 1, 15, '2024-05-03', '2024-05-03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `review`
--

CREATE TABLE `review` (
  `id` int(11) NOT NULL,
  `rating` tinyint(4) DEFAULT 5,
  `content` text DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `created_at` date DEFAULT current_timestamp(),
  `updated_at` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `review`
--

INSERT INTO `review` (`id`, `rating`, `content`, `product_id`, `account_id`, `created_at`, `updated_at`) VALUES
(1, 5, 'Est ad fugiat dolor commodo. Sunt dolore qui proident incididunt in laboris adipisicing eu ea mollit.Dolor elit reprehenderit minim id laboris consequat cillum. Ut laboris incididunt deserunt sint.', 7, 1, '2024-04-30', '2024-04-30'),
(32, 4, 'cung tam tam', 11, 1, '2024-05-03', '2024-05-03');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_id` (`blog_id`),
  ADD KEY `account_id` (`account_id`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `review_ibfk_2` (`account_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=162;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `review`
--
ALTER TABLE `review`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
