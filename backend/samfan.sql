-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2025 at 10:16 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `samfan`
--

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `ID` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`ID`, `question`, `answer`) VALUES
(1, 'What is SamFan?', 'SamFan is a fictional community platform for fans of Samsung products, providing the latest news, tips, and discussions.'),
(2, 'How do I reset my password?', 'To reset your password, go to the login page and click on \"Forgot Password\". Follow the instructions sent to your email.'),
(3, 'Where can I find firmware updates?', 'Firmware updates are usually available on the official Samsung support website or through the device\'s Settings > Software Update menu.'),
(4, 'How do I contact support?', 'You can contact our support team via the Contact Us page, available at the bottom of the website, or email us at support@samfan.com.'),
(5, 'Is SamFan affiliated with Samsung?', 'No, SamFan is an independent fan community and is not officially affiliated with Samsung Electronics.'),
(6, 'Can I contribute to the FAQ section?', 'Yes, registered users can suggest edits or additions to the FAQ by using the feedback form located on the FAQ page.'),
(7, 'What devices are supported?', 'We provide support and discussions for a wide range of Samsung devices, including smartphones, tablets, smartwatches, and smart TVs.'),
(8, 'How often is the FAQ updated?', 'The FAQ is reviewed and updated monthly to ensure the information is accurate and relevant.'),
(9, 'Làm thế nào để tạo tài khoản?', 'Bạn có thể tạo tài khoản bằng cách nhấn vào nút Đăng ký ở góc phải trên cùng.'),
(10, 'Tôi quên mật khẩu, làm sao để lấy lại?', 'Nhấn vào \"Quên mật khẩu\" trên trang đăng nhập và làm theo hướng dẫn.'),
(11, 'Làm sao để cập nhật thông tin cá nhân?', 'Vào trang hồ sơ cá nhân và nhấn nút \"Chỉnh sửa thông tin\".'),
(12, 'Có mất phí khi sử dụng dịch vụ không?', 'Phần lớn dịch vụ là miễn phí, nhưng một số tính năng cao cấp sẽ có phí.'),
(13, 'Tôi có thể thay đổi email đã đăng ký không?', 'Có, bạn có thể thay đổi email trong phần cài đặt tài khoản.'),
(14, 'Thời gian hỗ trợ khách hàng là khi nào?', 'Hỗ trợ hoạt động từ 8h đến 17h các ngày trong tuần.'),
(15, 'Làm thế nào để xóa tài khoản?', 'Liên hệ với bộ phận hỗ trợ để yêu cầu xóa tài khoản.'),
(16, 'Dữ liệu cá nhân của tôi có được bảo mật không?', 'Chúng tôi cam kết bảo mật thông tin theo chính sách bảo mật.'),
(17, 'Trang web hỗ trợ trình duyệt nào?', 'Trang web hỗ trợ Chrome, Firefox, Safari và Edge.'),
(18, 'Làm sao để gửi phản hồi hoặc góp ý?', 'Bạn có thể gửi phản hồi qua biểu mẫu liên hệ trên trang web.'),
(19, 'Tôi có thể sử dụng tài khoản của mình trên nhiều thiết bị không?', 'Có, bạn có thể đăng nhập trên nhiều thiết bị cùng lúc.');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rating` float DEFAULT 0,
  `price` decimal(10,2) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `memory` varchar(50) DEFAULT NULL,
  `ram` varchar(50) DEFAULT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `rating`, `price`, `color`, `memory`, `ram`, `image`) VALUES
(1, 'Galaxy S25 Ultra', 4.9, 37490000.00, 'Black', '512GB', '12GB', 'galaxy_s25_ultra.avif'),
(2, 'Galaxy Z Fold5 (Special)', 4.8, 86500000.00, 'Special', '512GB', '12GB', 'galaxy_zflop5.avif'),
(3, 'Galaxy Z Fold6', 4.6, 39900000.00, 'Gray', '256GB', '12GB', 'galaxy_z_fold6.avif'),
(4, 'Galaxy Z Flip6', 4.5, 22900000.00, 'Black', '512GB', '12GB', 'galaxy_z_flip6.avif'),
(5, 'Galaxy S25+', 4.5, 30490000.00, 'Blue', '256GB', '8GB', 'galaxy_s25+.avif'),
(6, 'Galaxy S25', 4.3, 24990000.00, 'Blue', '128GB', '8GB', 'galaxy_s25.avif'),
(7, 'Galaxy S24 FE', 5, 16990000.00, 'Graphite', '256GB', '8GB', 'galaxy_s24_fe.avif'),
(8, 'Galaxy S24 Ultra', 4.7, 35990000.00, 'Titanium Gray', '512GB', '12GB', 'galaxy_s24_ultra.webp'),
(9, 'Galaxy A26', 4.1, 6390000.00, 'Navy Blue', '128GB', '6GB', 'galaxy_a26.webp'),
(10, 'Galaxy A56', 4.2, 9490000.00, 'Silver', '128GB', '6GB', 'galaxy_a56.webp'),
(11, 'Galaxy Bruh', 4.2, 9490000.00, 'Silver', '128GB', '6GB', 'galaxy_a56.webp');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
