-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2025 at 06:45 AM
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
-- Database: `samfan_final`
--

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
(1, 'main_banner', '{\"id\":\"1\",\"section_title\":\"Company Information Test\",\"title\":\"Mission & Values\",\"text\":\"Our commitment is to operate responsibly as a leading global company.\"}', '2025-05-09 02:03:50'),
(2, 'about_desc', '{\"text\":\"Samfan believes in creating innovative products that enhance people\'s lives. Our commitment to excellence drives everything we do.\"}', '2025-05-08 14:23:42'),
(3, 'banner2', '{\"title\":\"Samfan\'s Vision\",\"text\":\"To inspire the world with innovative technologies, products and design that enrich people\'s lives and contribute to social prosperity.\"}', '2025-05-08 14:23:42'),
(4, 'banner3', '{\"title\":\"Samfan\'s Core Values\",\"text\":\"Samfan believes that living by strong values is the key to good business. That\'s why these core values, together with a strict code of conduct, are at the heart of every decision the company makes.\"}', '2025-05-08 14:23:42'),
(5, 'banner4', '{\"title\":\"Samfan Business Principles\",\"text\":\"Our business principles serve as the foundation for our actions and strategies. We are committed to ethical business practices, environmental sustainability, and making a positive impact on society.\"}', '2025-05-08 14:23:42'),
(6, 'ceo_info', '{\"id\":\"6\",\"name\":\"John Smithe\",\"title\":\"Chief Executive Officer\",\"details\":\"Joined Samfan in 2010\\nPreviously CEO of Tech Innovations Inc\\nHolds an MBA from Harvard Business School\\nLed the company through digital transformation\",\"image\":\"\\/images\\/ceo\\/ceo_1746756245_profile.jpg\"}', '2025-05-09 02:04:07');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `status` enum('pending','processing','completed','canceled') NOT NULL DEFAULT 'pending',
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `user_id`, `product_id`, `quantity`, `status`, `added_at`) VALUES
(2, 12, 1, 1, 'pending', '2025-05-08 04:58:06'),
(3, 12, 8, 1, 'processing', '2025-05-08 04:58:37');

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

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `product_id`, `user_id`, `comment`, `created_at`) VALUES
(1, 1, 2, 'This product works really well, exceeded my expectations!', '2025-05-09 03:15:00'),
(2, 2, 3, 'Shipping was fast and the item was exactly as described.', '2025-05-09 03:30:00'),
(3, 3, 1, 'Had some issues initially, but customer support helped a lot.', '2025-05-09 04:00:00'),
(4, 4, 5, 'Good value for money. Would definitely recommend.', '2025-05-09 04:30:00'),
(5, 5, 4, 'Battery life could be better, but overall it’s a solid choice.', '2025-05-09 05:00:00');

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
(1, 'What is SamFan about?', 'SamFan is a fictional community platform for fans of Samsung products, providing the latest news, tips, and discussions.'),
(2, 'How do I reset my password?', 'To reset your password, go to the login page and click on \"Forgot Password\". Follow the instructions sent to your email.'),
(3, 'Where can I find firmware updates?', 'Firmware updates are usually available on the official Samsung support website or through the device\'s Settings > Software Update menu.'),
(4, 'How do I contact support?', 'You can contact our support team via the Contact Us page, available at the bottom of the website, or email us at support@samfan.com.'),
(5, 'Is SamFan affiliated with Samsung?', 'No, SamFan is an independent fan community and is not officially affiliated with Samsung Electronics.'),
(6, 'Can I contribute to the FAQ section?', 'Yes, registered users can suggest edits or additions to the FAQ by using the feedback form located on the FAQ page.'),
(7, 'What devices are supported?', 'We provide support and discussions for a wide range of Samsung devices, including smartphones, tablets, smartwatches, and smart TVs.'),
(9, 'What payment methods are accepted on SamFan?', 'SamFan accepts credit cards, PayPal, and direct bank transfers for all premium services.'),
(10, 'Is my payment information secure?', 'Yes, all payment data is encrypted using industry-standard SSL technology.'),
(11, 'How do I track my shipping order?', 'After your order is shipped, you will receive a tracking number via email.'),
(12, 'Can I cancel my order after payment?', 'Orders can be canceled within 2 hours of payment confirmation by contacting support.'),
(13, 'How does SamFan handle failed transactions?', 'If a transaction fails, the amount is not deducted. If deducted, it is automatically refunded within 5-7 business days.'),
(14, 'Is warranty available for all products?', 'Yes, all products featured through SamFan partner stores come with a manufacturer\'s warranty.'),
(15, 'How long does shipping usually take?', 'Shipping typically takes 3-5 business days, depending on your location.'),
(16, 'Does SamFan ship internationally?', 'Currently, SamFan supports domestic shipping only. International options are coming soon.'),
(17, 'Can I get an invoice for my transaction?', 'Yes, invoices are available in your account dashboard under the \"Transactions\" section.'),
(18, 'How do I apply for product warranty service?', 'Contact support with your order ID and product details to initiate the warranty process.'),
(19, 'Are there any shipping fees?', 'Shipping is free on all orders over $50. A standard shipping fee applies otherwise.'),
(20, 'What should I do if I entered the wrong shipping address?', 'Please contact support immediately to update your shipping address.'),
(21, 'Is SamFan responsible for product warranties?', 'SamFan helps facilitate warranty claims but the responsibility lies with the product manufacturer.'),
(22, 'How can I check the status of my payment?', 'Log in to your account and visit the \"Payments\" section to see the latest status.'),
(23, 'Can I use multiple payment methods for one order?', 'Currently, only one payment method can be used per transaction.'),
(24, 'What happens if my shipment is delayed?', 'We’ll notify you via email with updated delivery estimates and options for cancellation or refund.'),
(25, 'Do I need to register to make a payment?', 'Yes, a SamFan account is required to access and use payment features.'),
(26, 'Are shipping updates sent via email?', 'Yes, you will receive email updates when your order is packed, shipped, and delivered.'),
(27, 'What is the cancellation policy?', 'Orders can be canceled before shipping begins. Once shipped, cancellation is not possible.'),
(28, 'Can I cancel my subscription to SamFan Premium?', 'Yes, you can cancel anytime from your account settings.'),
(29, 'Are transactions processed immediately?', 'Most transactions are processed instantly, but some may take up to 24 hours.'),
(30, 'How long is the warranty period?', 'Most products come with a 1-year manufacturer’s warranty.'),
(31, 'How can I change my payment method?', 'Go to your account settings and update your payment preferences.'),
(32, 'Is payment in installments available?', 'Installment options may be available depending on your region and payment provider.'),
(33, 'What should I do if I receive a damaged product?', 'Report the issue within 48 hours to initiate a return or replacement.'),
(34, 'Can I expedite my shipping?', 'Yes, expedited shipping is available at an additional cost.'),
(35, 'Does SamFan store payment details?', 'No, SamFan does not store any sensitive payment information on its servers.'),
(36, 'Will I be notified before my subscription renews?', 'Yes, email reminders are sent 7 days before your renewal date.'),
(37, 'What carriers does SamFan use for shipping?', 'We use trusted carriers like FedEx, UPS, and USPS for all deliveries.'),
(38, 'Can I view my past transactions?', 'Yes, all past transactions are available under the \"Transaction History\" tab in your account.'),
(39, 'Is there a warranty on digital products?', 'Digital products typically do not come with a warranty, but exceptions may apply.'),
(40, 'Can I return an item after cancellation?', 'If your item has already shipped, a return must be initiated instead of a cancellation.'),
(41, 'Why was my transaction declined?', 'Your transaction may have been declined due to bank restrictions or incorrect payment details.'),
(42, 'Is there a restocking fee for returns?', 'Some items may be subject to a restocking fee. Please check the return policy for details.'),
(43, 'Can I use promo codes during payment?', 'Yes, enter valid promo codes at checkout to receive discounts.'),
(44, 'Will I be charged tax on my purchase?', 'Yes, applicable taxes are calculated based on your shipping address.'),
(45, 'Can I contact SamFan about a transaction issue?', 'Yes, reach out via our support page or email support@samfan.com.'),
(46, 'Does SamFan offer payment receipts?', 'Yes, receipts are emailed immediately after successful payment.'),
(47, 'What documents are needed for warranty claims?', 'A valid receipt and product serial number are usually required.'),
(48, 'Can I schedule my delivery time?', 'Scheduling is available in select locations. Check during checkout for availability.');

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
(1, 'Galaxy S25 Ultra', 37490000.00, 'Blue', '512GB', '12GB', 'galaxy_s25_ultra.avif'),
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
(1, 'john_doe', '$2y$10$kxXSSbSCzZDJzGZK9BbqpeRu09D/ulQOx6LgZNRg5TfqZcYbnPj6e', 'John Doe', 'john@example.com', '0901234567', '123 Main St', NULL, 'active'),
(2, 'jane_smith', '$2y$10$RSPUHaAsmxew0HxJabT0Uu2ewXLp72Qe5.7eBGkOmVdCrV6SzQ6FO', 'Jane Smith', 'jane@example.com', '0902345678', '456 Oak St', NULL, 'active'),
(3, 'bob_nguyen', '$2y$10$Ro9iKw.y7myVtNqIFAd9je.bWzR6sRXfhHy9TqlAnMu8qTGbvYZmS', 'Nguyen Van Bob', 'bob@example.com', '0903456789', '789 Pine St', NULL, 'active'),
(4, 'alice_lee', '$2y$10$GHdJb5HtiybkBhEKAYCVj.mMmyc2yBpApTx4vDEI.X3ZOh/NVD0Hq', 'Alice Lee', 'alice@example.com', '0904567890', '321 Elm St', NULL, 'active'),
(5, 'charlie_k', '$2y$10$Ex7xSlQeImuR2uM6i19wQOdyoxDRmKxpyzzrQIBWIZmUCUcI1nd6S', 'Charlie Kim', 'charlie@example.com', '0905678901', '654 Maple St', NULL, 'active'),
(6, 'david_tran', '$2y$10$6Hi3fSw8myftbi6k9DwYvO.1smO3KYlHP2z9K8xCKbfKiVceD1TiK', 'Tran Minh David', 'david@example.com', '0906789012', '987 Cedar St', NULL, 'active'),
(7, 'emma_wat', '$2y$10$uXsU6PIeXo.lCGCu6vXU4uJwEGHktdEqz7QIQ9jzOblBQz1hJ6y1y', 'Emma Watson', 'emma@example.com', '0907890123', '159 Birch St', NULL, 'active'),
(8, 'lucas_ho', '$2y$10$HvSADfqSgQ7nDwERo4/dquL/oK2KTRpm96nygS0.LRnVZx0pI0CkC', 'Ho Quang Lucas', 'lucas@example.com', '0908901234', '753 Spruce St', NULL, 'active'),
(9, 'sophie_phan', '$2y$10$kY8CFm3W44V/fKYUqj8DbOagKKpJecpD7EqcngcuLCIxeKJOsUMzu', 'Phan Thi Sophie', 'sophie@example.com', '0909012345', '357 Ash St', NULL, 'active'),
(10, 'michael_t', '$2y$10$Ahm6OpkZz1KYOwUDo3vwROaVrWSWPEFFeP.SmUOpLEdTm2Yc1qzPi', 'Michael Truong', 'michael@example.com', '0910123456', '951 Walnut St', NULL, 'active'),
(11, 'Hehe123', '$2y$10$QFpkR5kTX6V5UfogrGZovuBq.kZtgbl.By6sXtg5gXdLZgqhSeERC', 'Huynh Loc', 'debug@account.com', '0123456789', 'Debug debu', '/images/profiles/11_1746731789_pexels-mayday-1545743.jpg', 'active'),
(12, 'debug', '$2y$10$3yd8cnrJnsRct23o0Zlnf.nU7E4/rVsnnZL.bC38aossGJ7yGPu0u', 'Nguyen Van A', 'debug@test.com', '0974752693', 'Debug St. Louis LA', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1dzAY9vxSYgd7Zz6Aji9j2-LaG3-BF5iw5w&s', 'active'),
(13, 'demoaccount', '$2y$10$Z62NG2rjRA0X50XlmW5PeuN59DGrDRYCR8cgLZyEF/DJBzmZHhUUe', 'Demo ', 'debug@demo.com', '0111111111', 'Demo ', '/images/profiles/13_1746738841_vue-logo.png', 'active'),
(14, 'TestAccount', '$2y$10$ZQIMvUjBVc1uhfyeBnn1Ceko2mmqcE1fbXdz5GT440E48wK9adoYu', 'Tester', 'lochehe@gmail.com', '0345627431', 'Bach Khoa', '/images/profiles/14_1746751076_woman_pfp.jpg', 'active'),
(15, 'demo456', '$2y$10$x69YOb6d5I8F2FohKDPYYuVUsWPDIBWB4HFS1o0T9QmlC9L9NAIue', 'Demo 456', 'demo@bruh.com', '0123456789', 'dassssssssss222', '/images/profiles/15_1746755506_woman_pfp.jpg', 'active'),
(16, 'demo123', '$2y$10$eVjm66c9C52Rp5prpd/8n.EdbplECRPAkbTNpL46PU8enEvolsMjW', 'Demo Account ', 'demodemo@gmail.com', '0123456789', 'Demo Demo', '', 'active'),
(17, 'jonathan123', '$2y$10$KVtK06oQFTxW7FQae/jfneF.VouT3FMxLtNvoLoGzNl9Hd4LZXuHe', 'Joseph Joestar', 'jojo@gmail.com', '0765435643', 'Los Angeles', '/images/profiles/17_1746759727_woman_pfp.jpg', 'active');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
