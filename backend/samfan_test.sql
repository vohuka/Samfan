-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2025 at 04:53 PM
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
-- Database: `samfan_test`
--

DROP DATABASE IF EXISTS samfan_test;
CREATE DATABASE samfan_test;
USE samfan_test;

-- --------------------------------------------------------

--
-- Table structure for table `about_content`
--

CREATE TABLE `about_content` (
  `id` int(11) NOT NULL,
  `section` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about_content`
--

INSERT INTO `about_content` (`id`, `section`, `content`, `last_updated`) VALUES
(1, 'main_banner', '{\"section_title\":\"Company Information\",\"title\":\"Mission & Values\",\"text\":\"Our commitment is to operate responsibly as a leading global company.\"}', '2025-05-08 14:51:22'),
(2, 'about_desc', '{\"text\":\"Samfan believes in creating innovative products that enhance people\'s lives. Our commitment to excellence drives everything we do.\"}', '2025-05-08 14:23:42'),
(3, 'banner2', '{\"title\":\"Samfan\'s Vision\",\"text\":\"To inspire the world with innovative technologies, products and design that enrich people\'s lives and contribute to social prosperity.\"}', '2025-05-08 14:23:42'),
(4, 'banner3', '{\"title\":\"Samfan\'s Core Values\",\"text\":\"Samfan believes that living by strong values is the key to good business. That\'s why these core values, together with a strict code of conduct, are at the heart of every decision the company makes.\"}', '2025-05-08 14:23:42'),
(5, 'banner4', '{\"title\":\"Samfan Business Principles\",\"text\":\"Our business principles serve as the foundation for our actions and strategies. We are committed to ethical business practices, environmental sustainability, and making a positive impact on society.\"}', '2025-05-08 14:23:42'),
(6, 'ceo_info', '{\"name\":\"John Smith\",\"title\":\"Chief Executive Officer\",\"details\":\"Joined Samfan in 2010\\nPreviously CEO of Tech Innovations Inc\\nHolds an MBA from Harvard Business School\\nLed the company through digital transformation\",\"image\":\"..\\/assets\\/ceo.jpg\"}', '2025-05-08 14:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `user_id`, `product_id`, `quantity`, `added_at`) VALUES
(1, 11, 1, 1, '2025-05-08 03:42:59'),
(2, 12, 1, 1, '2025-05-08 04:58:06'),
(3, 12, 8, 1, '2025-05-08 04:58:37');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `price` decimal(10,2) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `memory` varchar(50) DEFAULT NULL,
  `ram` varchar(50) DEFAULT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `color`, `memory`, `ram`, `image`) VALUES
(1, 'Galaxy S25 Ultra', 37490000.00, 'Black', '512GB', '12GB', 'galaxy_s25_ultra.avif'),
(2, 'Galaxy Z Fold5 (Special)', 86500000.00, 'Special', '512GB', '12GB', 'galaxy_zflop5.avif'),
(3, 'Galaxy Z Fold6', 39900000.00, 'Gray', '256GB', '12GB', 'galaxy_z_fold6.avif'),
(4, 'Galaxy Z Flip6', 22900000.00, 'Black', '512GB', '12GB', 'galaxy_z_flip6.avif'),
(5, 'Galaxy S25+', 30490000.00, 'Blue', '256GB', '8GB', 'galaxy_s25+.avif'),
(6, 'Galaxy S25', 24990000.00, 'Blue', '128GB', '8GB', 'galaxy_s25.avif'),
(7, 'Galaxy S24 FE', 16990000.00, 'Graphite', '256GB', '8GB', 'galaxy_s24_fe.avif'),
(8, 'Galaxy S24 Ultra', 35990000.00, 'Titanium Gray', '512GB', '12GB', 'galaxy_s24_ultra.webp'),
(9, 'Galaxy A26', 6390000.00, 'Navy Blue', '128GB', '6GB', 'galaxy_a26.webp'),
(10, 'Galaxy A56', 9490000.00, 'Silver', '128GB', '6GB', 'galaxy_a56.webp'),
(11, 'dasd', 12321.00, 'Black', '512GB', '12GB', 'galaxy_s25_ultra.avif');

-- --------------------------------------------------------

--
-- Table structure for table `product_specs`
--

CREATE TABLE `product_specs` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `spec_key` varchar(255) NOT NULL,
  `spec_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_specs`
--

INSERT INTO `product_specs` (`id`, `product_id`, `category`, `spec_key`, `spec_value`) VALUES
(1, 1, 'processor', 'CPU Speed', '4.47GHz, 3.5GHz'),
(2, 1, 'processor', 'CPU Type', '8 cores'),
(3, 1, 'display', 'Size (Main Display)', '174.2mm (6.9\" full rectangle) / 172.2mm (6.8\" rounded corners)'),
(4, 1, 'display', 'Display Technology (Main Display)', 'Dynamic AMOLED 2X'),
(5, 1, 'display', 'Display Refresh Rate (Main Display)', '120Hz'),
(6, 1, 'display', 'Resolution (Main Display)', '3120 x 1440 (Quad HD+)'),
(7, 1, 'display', 'Color Depth (Main Display)', '16M'),
(8, 1, 'display', 'S Pen Support', 'Yes'),
(9, 1, 'camera', 'Main Camera', '200.0MP + 50.0MP + 50.0MP + 10.0MP'),
(10, 1, 'camera', 'Aperture (Main Camera)', 'F1.7, F3.4, F1.9, F2.4'),
(12, 1, 'camera', 'Zoom (Rear Camera)', 'Optical Zoom 3x and 5x, Optical Quality Zoom 2x and 10x (Enabled by Adaptive Pixel Sensor), Digital Zoom up to 100x'),
(13, 1, 'camera', 'Aperture (Front Camera)', 'F2.23'),
(15, 1, 'camera', 'Slow Motion', '240fps @FHD, 120fps @FHD, 120fps @UHD'),
(17, 1, 'camera', 'Resolution (Front Camera)', '12.0MP'),
(19, 1, 'camera', 'Video Recording Resolution', 'UHD 8K (7680 x 4320) @ 30fps'),
(20, 1, 'storage', 'RAM', '12GB'),
(21, 1, 'storage', 'Storage (ROM)', '256GB'),
(22, 1, 'storage', 'Available Storage', '222.7GB'),
(23, 1, 'connectivity', 'USB Interface', 'USB Type-C'),
(24, 1, 'connectivity', 'Earjack', 'USB Type-C'),
(25, 1, 'network', 'Number of SIMs', 'Dual SIM (SIM 1 + SIM 2 / SIM 1 + eSIM / Dual eSIM)'),
(26, 1, 'physical', 'Dimensions (HxWxD)', '162.8 x 77.6 x 8.2 mm'),
(27, 1, 'physical', 'Weight', '218g'),
(28, 2, 'processor', 'CPU Speed', '3.36GHz, 2.8GHz'),
(29, 2, 'processor', 'CPU Type', '8 cores'),
(30, 2, 'display', 'Size (Main Display)', '191.9mm (7.6\" full rectangle) / 189.9mm (7.5\" rounded corners)'),
(31, 2, 'display', 'Display Technology (Main Display)', 'Dynamic AMOLED 2X'),
(32, 2, 'display', 'Display Refresh Rate (Main Display)', '120Hz'),
(33, 2, 'display', 'Resolution (Main Display)', '2176 x 1812 (QXGA+)'),
(34, 2, 'display', 'Color Depth (Main Display)', '16M'),
(35, 2, 'display', 'S Pen Support', 'Yes'),
(36, 2, 'camera', 'Main Camera', '50.0MP + 12.0MP + 10.0MP'),
(37, 2, 'camera', 'Aperture (Main Camera)', 'F1.8, F2.2, F2.4'),
(39, 2, 'camera', 'Zoom (Rear Camera)', 'Optical Zoom 3x, Digital Zoom up to 30x'),
(40, 2, 'camera', 'Aperture (Front Camera)', 'F2.2'),
(42, 2, 'camera', 'Slow Motion', '240fps @FHD, 120fps @UHD'),
(44, 2, 'camera', 'Resolution (Front Camera)', '10.0MP'),
(46, 2, 'camera', 'Video Recording Resolution', 'UHD 8K (7680 x 4320) @ 30fps'),
(47, 2, 'storage', 'RAM', '12GB'),
(48, 2, 'storage', 'Storage (ROM)', '512GB'),
(49, 2, 'storage', 'Available Storage', '480GB'),
(50, 2, 'connectivity', 'USB Interface', 'USB Type-C'),
(51, 2, 'connectivity', 'Earjack', 'USB Type-C'),
(52, 2, 'network', 'Number of SIMs', 'Dual SIM (SIM 1 + SIM 2 / SIM 1 + eSIM)'),
(53, 2, 'physical', 'Dimensions (HxWxD)', '154.9 x 129.9 x 6.1 mm (unfolded)'),
(54, 2, 'physical', 'Weight', '253g'),
(55, 3, 'processor', 'CPU Speed', '3.4GHz, 2.9GHz'),
(56, 3, 'processor', 'CPU Type', '8 cores'),
(57, 3, 'display', 'Size (Main Display)', '191.9mm (7.6\" full rectangle) / 189.9mm (7.5\" rounded corners)'),
(58, 3, 'display', 'Display Technology (Main Display)', 'Dynamic AMOLED 2X'),
(59, 3, 'display', 'Display Refresh Rate (Main Display)', '120Hz'),
(60, 3, 'display', 'Resolution (Main Display)', '2176 x 1812 (QXGA+)'),
(61, 3, 'display', 'Color Depth (Main Display)', '16M'),
(62, 3, 'display', 'S Pen Support', 'Yes'),
(63, 3, 'camera', 'Main Camera', '50.0MP + 12.0MP + 10.0MP'),
(64, 3, 'camera', 'Aperture (Main Camera)', 'F1.8, F2.2, F2.4'),
(66, 3, 'camera', 'Zoom (Rear Camera)', 'Optical Zoom 3x, Digital Zoom up to 30x'),
(67, 3, 'camera', 'Aperture (Front Camera)', 'F2.2'),
(69, 3, 'camera', 'Slow Motion', '240fps @FHD, 120fps @UHD'),
(71, 3, 'camera', 'Resolution (Front Camera)', '10.0MP'),
(73, 3, 'camera', 'Video Recording Resolution', 'UHD 8K (7680 x 4320) @ 30fps'),
(74, 3, 'storage', 'RAM', '12GB'),
(75, 3, 'storage', 'Storage (ROM)', '256GB'),
(76, 3, 'storage', 'Available Storage', '230GB'),
(77, 3, 'connectivity', 'USB Interface', 'USB Type-C'),
(78, 3, 'connectivity', 'Earjack', 'USB Type-C'),
(79, 3, 'network', 'Number of SIMs', 'Dual SIM (SIM 1 + SIM 2 / SIM 1 + eSIM)'),
(80, 3, 'physical', 'Dimensions (HxWxD)', '153.5 x 132.6 x 5.6 mm (unfolded)'),
(81, 3, 'physical', 'Weight', '239g'),
(82, 4, 'processor', 'CPU Speed', '3.2GHz, 2.7GHz'),
(83, 4, 'processor', 'CPU Type', '8 cores'),
(84, 4, 'display', 'Size (Main Display)', '170.3mm (6.7\" full rectangle) / 168.3mm (6.6\" rounded corners)'),
(85, 4, 'display', 'Display Technology (Main Display)', 'Dynamic AMOLED 2X'),
(86, 4, 'display', 'Display Refresh Rate (Main Display)', '120Hz'),
(87, 4, 'display', 'Resolution (Main Display)', '2640 x 1080 (FHD+)'),
(88, 4, 'display', 'Color Depth (Main Display)', '16M'),
(89, 4, 'display', 'S Pen Support', 'No'),
(90, 4, 'camera', 'Main Camera', '50.0MP + 12.0MP'),
(91, 4, 'camera', 'Aperture (Main Camera)', 'F1.8, F2.2'),
(93, 4, 'camera', 'Zoom (Rear Camera)', 'Digital Zoom up to 10x'),
(94, 4, 'camera', 'Aperture (Front Camera)', 'F2.4'),
(96, 4, 'camera', 'Slow Motion', '240fps @FHD'),
(98, 4, 'camera', 'Resolution (Front Camera)', '10.0MP'),
(100, 4, 'camera', 'Video Recording Resolution', 'UHD 4K (3840 x 2160) @ 60fps'),
(101, 4, 'storage', 'RAM', '12GB'),
(102, 4, 'storage', 'Storage (ROM)', '512GB'),
(103, 4, 'storage', 'Available Storage', '480GB'),
(104, 4, 'connectivity', 'USB Interface', 'USB Type-C'),
(105, 4, 'connectivity', 'Earjack', 'USB Type-C'),
(106, 4, 'network', 'Number of SIMs', 'Dual SIM (SIM 1 + eSIM)'),
(107, 4, 'physical', 'Dimensions (HxWxD)', '165.2 x 71.9 x 6.9 mm (unfolded)'),
(108, 4, 'physical', 'Weight', '187g'),
(109, 5, 'processor', 'CPU Speed', '4.2GHz, 3.2GHz'),
(110, 5, 'processor', 'CPU Type', '8 cores'),
(111, 5, 'display', 'Size (Main Display)', '169.5mm (6.7\" full rectangle) / 167.5mm (6.6\" rounded corners)'),
(112, 5, 'display', 'Display Technology (Main Display)', 'Dynamic AMOLED 2X'),
(113, 5, 'display', 'Display Refresh Rate (Main Display)', '120Hz'),
(114, 5, 'display', 'Resolution (Main Display)', '3120 x 1440 (Quad HD+)'),
(115, 5, 'display', 'Color Depth (Main Display)', '16M'),
(116, 5, 'display', 'S Pen Support', 'No'),
(117, 5, 'camera', 'Main Camera', '50.0MP + 12.0MP + 10.0MP'),
(118, 5, 'camera', 'Aperture (Main Camera)', 'F1.8, F2.2, F2.4'),
(120, 5, 'camera', 'Zoom (Rear Camera)', 'Optical Zoom 3x, Digital Zoom up to 30x'),
(121, 5, 'camera', 'Aperture (Front Camera)', 'F2.2'),
(123, 5, 'camera', 'Slow Motion', '240fps @FHD, 120fps @UHD'),
(125, 5, 'camera', 'Resolution (Front Camera)', '12.0MP'),
(127, 5, 'camera', 'Video Recording Resolution', 'UHD 8K (7680 x 4320) @ 30fps'),
(128, 5, 'storage', 'RAM', '8GB'),
(129, 5, 'storage', 'Storage (ROM)', '256GB'),
(130, 5, 'storage', 'Available Storage', '230GB'),
(131, 5, 'connectivity', 'USB Interface', 'USB Type-C'),
(132, 5, 'connectivity', 'Earjack', 'USB Type-C'),
(133, 5, 'network', 'Number of SIMs', 'Dual SIM (SIM 1 + SIM 2 / SIM 1 + eSIM)'),
(134, 5, 'physical', 'Dimensions (HxWxD)', '158.5 x 75.9 x 7.7 mm'),
(135, 5, 'physical', 'Weight', '198g'),
(136, 6, 'processor', 'CPU Speed', '4.0GHz, 3.0GHz'),
(137, 6, 'processor', 'CPU Type', '8 cores'),
(138, 6, 'display', 'Size (Main Display)', '158.2mm (6.2\" full rectangle) / 156.2mm (6.1\" rounded corners)'),
(139, 6, 'display', 'Display Technology (Main Display)', 'Dynamic AMOLED 2X'),
(140, 6, 'display', 'Display Refresh Rate (Main Display)', '120Hz'),
(141, 6, 'display', 'Resolution (Main Display)', '2340 x 1080 (FHD+)'),
(142, 6, 'display', 'Color Depth (Main Display)', '16M'),
(143, 6, 'display', 'S Pen Support', 'No'),
(144, 6, 'camera', 'Main Camera', '50.0MP + 12.0MP + 10.0MP'),
(145, 6, 'camera', 'Aperture (Main Camera)', 'F1.8, F2.2, F2.4'),
(147, 6, 'camera', 'Zoom (Rear Camera)', 'Optical Zoom 3x, Digital Zoom up to 30x'),
(148, 6, 'camera', 'Aperture (Front Camera)', 'F2.2'),
(150, 6, 'camera', 'Slow Motion', '240fps @FHD, 120fps @UHD'),
(152, 6, 'camera', 'Resolution (Front Camera)', '12.0MP'),
(154, 6, 'camera', 'Video Recording Resolution', 'UHD 8K (7680 x 4320) @ 30fps'),
(155, 6, 'storage', 'RAM', '8GB'),
(156, 6, 'storage', 'Storage (ROM)', '128GB'),
(157, 6, 'storage', 'Available Storage', '110GB'),
(158, 6, 'connectivity', 'USB Interface', 'USB Type-C'),
(159, 6, 'connectivity', 'Earjack', 'USB Type-C'),
(160, 6, 'network', 'Number of SIMs', 'Dual SIM (SIM 1 + SIM 2 / SIM 1 + eSIM)'),
(161, 6, 'physical', 'Dimensions (HxWxD)', '146.5 x 70.9 x 7.6 mm'),
(162, 6, 'physical', 'Weight', '168g'),
(163, 7, 'processor', 'CPU Speed', '2.8GHz, 2.4GHz'),
(164, 7, 'processor', 'CPU Type', '8 cores'),
(165, 7, 'display', 'Size (Main Display)', '165.1mm (6.5\" full rectangle) / 163.1mm (6.4\" rounded corners)'),
(166, 7, 'display', 'Display Technology (Main Display)', 'Super AMOLED'),
(167, 7, 'display', 'Display Refresh Rate (Main Display)', '120Hz'),
(168, 7, 'display', 'Resolution (Main Display)', '2340 x 1080 (FHD+)'),
(169, 7, 'display', 'Color Depth (Main Display)', '16M'),
(170, 7, 'display', 'S Pen Support', 'No'),
(171, 7, 'camera', 'Main Camera', '50.0MP + 12.0MP + 8.0MP'),
(172, 7, 'camera', 'Aperture (Main Camera)', 'F1.8, F2.2, F2.4'),
(174, 7, 'camera', 'Zoom (Rear Camera)', 'Optical Zoom 3x, Digital Zoom up to 30x'),
(175, 7, 'camera', 'Aperture (Front Camera)', 'F2.4'),
(177, 7, 'camera', 'Slow Motion', '240fps @FHD'),
(179, 7, 'camera', 'Resolution (Front Camera)', '10.0MP'),
(181, 7, 'camera', 'Video Recording Resolution', 'UHD 4K (3840 x 2160) @ 60fps'),
(182, 7, 'storage', 'RAM', '8GB'),
(183, 7, 'storage', 'Storage (ROM)', '256GB'),
(184, 7, 'storage', 'Available Storage', '230GB'),
(185, 7, 'connectivity', 'USB Interface', 'USB Type-C'),
(186, 7, 'connectivity', 'Earjack', 'USB Type-C'),
(187, 7, 'network', 'Number of SIMs', 'Dual SIM (SIM 1 + SIM 2 / SIM 1 + eSIM)'),
(188, 7, 'physical', 'Dimensions (HxWxD)', '162.0 x 77.3 x 8.2 mm'),
(189, 7, 'physical', 'Weight', '209g'),
(190, 8, 'processor', 'CPU Speed', '4.3GHz, 3.4GHz'),
(191, 8, 'processor', 'CPU Type', '8 cores'),
(192, 8, 'display', 'Size (Main Display)', '172.2mm (6.8\" full rectangle) / 170.2mm (6.7\" rounded corners)'),
(193, 8, 'display', 'Display Technology (Main Display)', 'Dynamic AMOLED 2X'),
(194, 8, 'display', 'Display Refresh Rate (Main Display)', '120Hz'),
(195, 8, 'display', 'Resolution (Main Display)', '3120 x 1440 (Quad HD+)'),
(196, 8, 'display', 'Color Depth (Main Display)', '16M'),
(197, 8, 'display', 'S Pen Support', 'Yes'),
(198, 8, 'camera', 'Main Camera', '200.0MP + 50.0MP + 12.0MP + 10.0MP'),
(199, 8, 'camera', 'Aperture (Main Camera)', 'F1.7, F3.4, F2.2, F2.4'),
(201, 8, 'camera', 'Zoom (Rear Camera)', 'Optical Zoom 3x and 5x, Digital Zoom up to 100x'),
(202, 8, 'camera', 'Aperture (Front Camera)', 'F2.2'),
(204, 8, 'camera', 'Slow Motion', '240fps @FHD, 120fps @UHD'),
(206, 8, 'camera', 'Resolution (Front Camera)', '12.0MP'),
(208, 8, 'camera', 'Video Recording Resolution', 'UHD 8K (7680 x 4320) @ 30fps'),
(209, 8, 'storage', 'RAM', '12GB'),
(210, 8, 'storage', 'Storage (ROM)', '512GB'),
(211, 8, 'storage', 'Available Storage', '480GB'),
(212, 8, 'connectivity', 'USB Interface', 'USB Type-C'),
(213, 8, 'connectivity', 'Earjack', 'USB Type-C'),
(214, 8, 'network', 'Number of SIMs', 'Dual SIM (SIM 1 + SIM 2 / SIM 1 + eSIM)'),
(215, 8, 'physical', 'Dimensions (HxWxD)', '163.4 x 78.1 x 8.9 mm'),
(216, 8, 'physical', 'Weight', '233g'),
(217, 9, 'processor', 'CPU Speed', '2.4GHz, 2.0GHz'),
(218, 9, 'processor', 'CPU Type', '8 cores'),
(219, 9, 'display', 'Size (Main Display)', '165.1mm (6.5\" full rectangle) / 163.1mm (6.4\" rounded corners)'),
(220, 9, 'display', 'Display Technology (Main Display)', 'PLS LCD'),
(221, 9, 'display', 'Display Refresh Rate (Main Display)', '90Hz'),
(222, 9, 'display', 'Resolution (Main Display)', '1600 x 720 (HD+)'),
(223, 9, 'display', 'Color Depth (Main Display)', '16M'),
(224, 9, 'display', 'S Pen Support', 'No'),
(225, 9, 'camera', 'Main Camera', '50.0MP + 5.0MP + 2.0MP'),
(226, 9, 'camera', 'Aperture (Main Camera)', 'F1.8, F2.2, F2.4'),
(228, 9, 'camera', 'Zoom (Rear Camera)', 'Digital Zoom up to 10x'),
(229, 9, 'camera', 'Aperture (Front Camera)', 'F2.2'),
(231, 9, 'camera', 'Slow Motion', '120fps @HD'),
(233, 9, 'camera', 'Resolution (Front Camera)', '8.0MP'),
(235, 9, 'camera', 'Video Recording Resolution', 'FHD (1920 x 1080) @ 30fps'),
(236, 9, 'storage', 'RAM', '6GB'),
(237, 9, 'storage', 'Storage (ROM)', '128GB'),
(238, 9, 'storage', 'Available Storage', '105GB'),
(239, 9, 'connectivity', 'USB Interface', 'USB Type-C'),
(240, 9, 'connectivity', 'Earjack', '3.5mm Stereo'),
(241, 9, 'network', 'Number of SIMs', 'Dual SIM (SIM 1 + SIM 2)'),
(242, 9, 'physical', 'Dimensions (HxWxD)', '164.5 x 76.5 x 8.4 mm'),
(243, 9, 'physical', 'Weight', '195g'),
(244, 10, 'processor', 'CPU Speed', '2.7GHz, 2.2GHz'),
(245, 10, 'processor', 'CPU Type', '8 cores'),
(246, 10, 'display', 'Size (Main Display)', '165.1mm (6.5\" full rectangle) / 163.1mm (6.4\" rounded corners)'),
(247, 10, 'display', 'Display Technology (Main Display)', 'Super AMOLED'),
(248, 10, 'display', 'Display Refresh Rate (Main Display)', '120Hz'),
(249, 10, 'display', 'Resolution (Main Display)', '2340 x 1080 (FHD+)'),
(250, 10, 'display', 'Color Depth (Main Display)', '16M'),
(251, 10, 'display', 'S Pen Support', 'No'),
(252, 10, 'camera', 'Main Camera', '64.0MP + 12.0MP + 5.0MP'),
(253, 10, 'camera', 'Aperture (Main Camera)', 'F1.8, F2.2, F2.4'),
(255, 10, 'camera', 'Zoom (Rear Camera)', 'Digital Zoom up to 10x'),
(256, 10, 'camera', 'Aperture (Front Camera)', 'F2.2'),
(258, 10, 'camera', 'Slow Motion', '240fps @FHD'),
(260, 10, 'camera', 'Resolution (Front Camera)', '32.0MP'),
(262, 10, 'camera', 'Video Recording Resolution', 'UHD 4K (3840 x 2160) @ 30fps'),
(263, 10, 'storage', 'RAM', '6GB'),
(264, 10, 'storage', 'Storage (ROM)', '128GB'),
(265, 10, 'storage', 'Available Storage', '105GB'),
(266, 10, 'connectivity', 'USB Interface', 'USB Type-C'),
(267, 10, 'connectivity', 'Earjack', 'USB Type-C'),
(268, 10, 'network', 'Number of SIMs', 'Dual SIM (SIM 1 + SIM 2)'),
(269, 10, 'physical', 'Dimensions (HxWxD)', '159.9 x 74.5 x 8.1 mm'),
(270, 10, 'physical', 'Weight', '189g'),
(271, 1, 'storage', 'TestStorage', '69.9 LP ');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `product_id`, `user_id`, `rating`, `created_at`) VALUES
(1, 1, 1, 5, '2025-05-07 03:00:00'),
(2, 1, 2, 5, '2025-05-07 03:00:00'),
(3, 1, 3, 5, '2025-05-07 03:00:00'),
(4, 1, 4, 5, '2025-05-07 03:00:00'),
(5, 1, 5, 4, '2025-05-07 03:00:00'),
(6, 2, 1, 5, '2025-05-07 03:00:00'),
(7, 2, 2, 5, '2025-05-07 03:00:00'),
(8, 2, 3, 5, '2025-05-07 03:00:00'),
(9, 2, 4, 4, '2025-05-07 03:00:00'),
(10, 2, 5, 5, '2025-05-07 03:00:00'),
(11, 3, 1, 5, '2025-05-07 03:00:00'),
(12, 3, 2, 5, '2025-05-07 03:00:00'),
(13, 3, 3, 4, '2025-05-07 03:00:00'),
(14, 3, 4, 5, '2025-05-07 03:00:00'),
(15, 3, 5, 4, '2025-05-07 03:00:00'),
(16, 4, 1, 5, '2025-05-07 03:00:00'),
(17, 4, 2, 4, '2025-05-07 03:00:00'),
(18, 4, 3, 5, '2025-05-07 03:00:00'),
(19, 4, 4, 4, '2025-05-07 03:00:00'),
(20, 4, 5, 5, '2025-05-07 03:00:00'),
(21, 5, 1, 5, '2025-05-07 03:00:00'),
(22, 5, 2, 4, '2025-05-07 03:00:00'),
(23, 5, 3, 5, '2025-05-07 03:00:00'),
(24, 5, 4, 4, '2025-05-07 03:00:00'),
(25, 5, 5, 5, '2025-05-07 03:00:00'),
(26, 6, 1, 4, '2025-05-07 03:00:00'),
(27, 6, 2, 5, '2025-05-07 03:00:00'),
(28, 6, 3, 4, '2025-05-07 03:00:00'),
(29, 6, 4, 4, '2025-05-07 03:00:00'),
(30, 6, 5, 4, '2025-05-07 03:00:00'),
(31, 7, 1, 5, '2025-05-07 03:00:00'),
(32, 7, 2, 5, '2025-05-07 03:00:00'),
(33, 7, 3, 5, '2025-05-07 03:00:00'),
(34, 7, 4, 5, '2025-05-07 03:00:00'),
(35, 7, 5, 5, '2025-05-07 03:00:00'),
(36, 8, 1, 5, '2025-05-07 03:00:00'),
(37, 8, 2, 5, '2025-05-07 03:00:00'),
(38, 8, 3, 4, '2025-05-07 03:00:00'),
(39, 8, 4, 5, '2025-05-07 03:00:00'),
(40, 8, 5, 5, '2025-05-07 03:00:00'),
(41, 9, 1, 4, '2025-05-07 03:00:00'),
(42, 9, 2, 4, '2025-05-07 03:00:00'),
(43, 9, 3, 5, '2025-05-07 03:00:00'),
(44, 9, 4, 4, '2025-05-07 03:00:00'),
(45, 9, 5, 4, '2025-05-07 03:00:00'),
(46, 10, 1, 4, '2025-05-07 03:00:00'),
(47, 10, 2, 5, '2025-05-07 03:00:00'),
(48, 10, 3, 4, '2025-05-07 03:00:00'),
(49, 10, 4, 4, '2025-05-07 03:00:00'),
(50, 10, 5, 4, '2025-05-07 03:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `full_name`, `email`, `phone`, `address`, `image_url`, `status`) VALUES
(1, 'john_doe', '123456', 'John Doe', 'john@example.com', '0901234567', '123 Main St', NULL, 'active'),
(2, 'jane_smith', 'password', 'Jane Smith', 'jane@example.com', '0902345678', '456 Oak St', NULL, 'active'),
(3, 'bob_nguyen', 'abc123', 'Nguyen Van Bob', 'bob@example.com', '0903456789', '789 Pine St', NULL, 'active'),
(4, 'alice_lee', 'alicelee', 'Alice Lee', 'alice@example.com', '0904567890', '321 Elm St', NULL, 'active'),
(5, 'charlie_k', 'charlie1', 'Charlie Kim', 'charlie@example.com', '0905678901', '654 Maple St', NULL, 'active'),
(6, 'david_tran', 'davidtran', 'Tran Minh David', 'david@example.com', '0906789012', '987 Cedar St', NULL, 'active'),
(7, 'emma_wat', 'emma123', 'Emma Watson', 'emma@example.com', '0907890123', '159 Birch St', NULL, 'active'),
(8, 'lucas_ho', 'lucasho', 'Ho Quang Lucas', 'lucas@example.com', '0908901234', '753 Spruce St', NULL, 'active'),
(9, 'sophie_phan', 'sophiep', 'Phan Thi Sophie', 'sophie@example.com', '0909012345', '357 Ash St', NULL, 'active'),
(10, 'michael_t', 'michael1', 'Michael Truong', 'michael@example.com', '0910123456', '951 Walnut St', NULL, 'active'),
(11, 'Hehe123', '$2y$10$QFpkR5kTX6V5UfogrGZovuBq.kZtgbl.By6sXtg5gXdLZgqhSeERC', 'Huynh Loc', 'debug@account.com', '0123456789', 'Debug debu', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1dzAY9vxSYgd7Zz6Aji9j2-LaG3-BF5iw5w&s', 'active'),
(12, 'debug', '$2y$10$3yd8cnrJnsRct23o0Zlnf.nU7E4/rVsnnZL.bC38aossGJ7yGPu0u', 'Nguyen Van A', 'debug@test.com', '0974752693', 'Debug St. Louis LA', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1dzAY9vxSYgd7Zz6Aji9j2-LaG3-BF5iw5w&s', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_content`
--
ALTER TABLE `about_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `section` (`section`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

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
-- Indexes for table `product_specs`
--
ALTER TABLE `product_specs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_content`
--
ALTER TABLE `about_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_specs`
--
ALTER TABLE `product_specs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=272;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_specs`
--
ALTER TABLE `product_specs`
  ADD CONSTRAINT `product_specs_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
