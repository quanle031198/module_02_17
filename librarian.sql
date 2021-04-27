-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th4 27, 2021 lúc 09:50 PM
-- Phiên bản máy phục vụ: 10.3.25-MariaDB-0ubuntu0.20.04.1
-- Phiên bản PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `librarian`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `book_name` varchar(30) NOT NULL,
  `book_publisher` varchar(30) NOT NULL,
  `book_author` varchar(30) NOT NULL,
  `year_publication` date NOT NULL,
  `number_published` int(10) NOT NULL,
  `price` float NOT NULL,
  `image` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `borroworders`
--

CREATE TABLE `borroworders` (
  `id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `required_date` date NOT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `borroworder_details`
--

CREATE TABLE `borroworder_details` (
  `order_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `quantity_ordered` int(10) NOT NULL,
  `price_each` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categorys`
--

CREATE TABLE `categorys` (
  `id` int(11) NOT NULL,
  `category_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `students`
--

CREATE TABLE `students` (
  `id` int(10) NOT NULL,
  `student_name` varchar(30) NOT NULL,
  `first_name` varchar(10) NOT NULL,
  `last_name` varchar(10) NOT NULL,
  `birthday_student` date NOT NULL,
  `address` varchar(30) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `image` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Chỉ mục cho bảng `borroworders`
--
ALTER TABLE `borroworders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`);

--
-- Chỉ mục cho bảng `borroworder_details`
--
ALTER TABLE `borroworder_details`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Chỉ mục cho bảng `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `borroworders`
--
ALTER TABLE `borroworders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categorys` (`id`);

--
-- Các ràng buộc cho bảng `borroworders`
--
ALTER TABLE `borroworders`
  ADD CONSTRAINT `borroworders_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Các ràng buộc cho bảng `borroworder_details`
--
ALTER TABLE `borroworder_details`
  ADD CONSTRAINT `borroworder_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `borroworders` (`id`),
  ADD CONSTRAINT `borroworder_details_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
