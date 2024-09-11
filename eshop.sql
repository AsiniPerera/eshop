-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.32 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for eshop0
CREATE DATABASE IF NOT EXISTS `eshop`; /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */
USE `eshop`;
SHOW DATABASES;
-- Dumping structure for table eshop0.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `email` varchar(100) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `verification_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.admin: ~0 rows (approximately)
INSERT INTO `admin` (`email`, `fname`, `lname`, `verification_code`) VALUES
	('sadeepthalakindu18@gmail.com', 'sadeeptha', 'lakindu', '657965a91c363');

-- Dumping structure for table eshop0.brand
CREATE TABLE IF NOT EXISTS `brand` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_brand_category1_idx` (`category_id`),
  CONSTRAINT `fk_brand_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.brand: ~3 rows (approximately)
INSERT INTO `brand` (`id`, `name`, `category_id`) VALUES
	(1, 'apple', 1),
	(2, 'htc', 1),
	(3, 'samsung', 1);

-- Dumping structure for table eshop0.brand_has_modle
CREATE TABLE IF NOT EXISTS `brand_has_modle` (
  `brand_id` int NOT NULL,
  `modle_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_brand_has_modle_modle1_idx` (`modle_id`),
  KEY `fk_brand_has_modle_brand1_idx` (`brand_id`),
  CONSTRAINT `fk_brand_has_modle_brand1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  CONSTRAINT `fk_brand_has_modle_modle1` FOREIGN KEY (`modle_id`) REFERENCES `modle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.brand_has_modle: ~3 rows (approximately)
INSERT INTO `brand_has_modle` (`brand_id`, `modle_id`, `id`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3);

-- Dumping structure for table eshop0.cart
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qty` int DEFAULT NULL,
  `product_id` int NOT NULL,
  `user_email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cart_product1_idx` (`product_id`),
  KEY `fk_cart_user1_idx` (`user_email`),
  CONSTRAINT `fk_cart_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_cart_user1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.cart: ~2 rows (approximately)
INSERT INTO `cart` (`id`, `qty`, `product_id`, `user_email`) VALUES
	(81, 3, 56, 'sadeepthalakindu18@gmail.com'),
	(83, 1, 1, 'sadeepthalakindu18@gmail.com');

-- Dumping structure for table eshop0.category
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.category: ~8 rows (approximately)
INSERT INTO `category` (`id`, `name`) VALUES
	(1, 'Cellphone & Accessories'),
	(2, 'Computer and Cables'),
	(3, 'Camera'),
	(4, 'Computer component'),
	(5, 'Electronic Items'),
	(6, 'camera drones'),
	(7, 'batteries'),
	(9, 'ax');

-- Dumping structure for table eshop0.chat
CREATE TABLE IF NOT EXISTS `chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text,
  `date_time` datetime DEFAULT NULL,
  `status` int DEFAULT NULL,
  `from` varchar(100) NOT NULL,
  `to` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_chat_user1_idx` (`from`),
  KEY `fk_chat_user2_idx` (`to`),
  CONSTRAINT `fk_chat_user1` FOREIGN KEY (`from`) REFERENCES `user` (`email`),
  CONSTRAINT `fk_chat_user2` FOREIGN KEY (`to`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.chat: ~12 rows (approximately)
INSERT INTO `chat` (`id`, `content`, `date_time`, `status`, `from`, `to`) VALUES
	(1, 'hello', '2022-11-12 01:44:34', 0, 'sadeepthalakindu18@gmail.com', 'sadeepthalakindu19@gmail.com'),
	(17, 'hello', '2022-11-12 02:14:45', 0, 'sadeepthalakindu19@gmail.com', 'sadeepthalakindu18@gmail.com'),
	(18, 'how can i help you', '2022-11-12 02:22:35', 0, 'sadeepthalakindu19@gmail.com', 'sadeepthalakindu18@gmail.com'),
	(19, 'can you give me your delevery details?', '2022-11-12 02:23:01', 0, 'sadeepthalakindu18@gmail.com', 'sadeepthalakindu19@gmail.com'),
	(20, 'okay i will send you ', '2022-11-12 02:23:10', 0, 'sadeepthalakindu19@gmail.com', 'sadeepthalakindu18@gmail.com'),
	(25, 'okay thank you', '2022-11-12 02:48:46', 0, 'sadeepthalakindu18@gmail.com', 'sadeepthalakindu19@gmail.com'),
	(26, 'hello', '2022-11-12 03:12:43', 0, 'sadeepthalakindu18@gmail.com', 'sadeepthalakindu19@gmail.com'),
	(36, 'd', '2022-11-12 21:21:51', 0, 'sadeepthalakindu19@gmail.com', 'sadeepthalakindu18@gmail.com'),
	(37, 'd', '2022-11-12 21:21:53', 0, 'sadeepthalakindu19@gmail.com', 'sadeepthalakindu18@gmail.com'),
	(38, 's', '2022-11-12 21:22:38', 0, 'sadeepthalakindu19@gmail.com', 'sadeepthalakindu18@gmail.com'),
	(39, 'sfg', '2022-11-12 21:26:58', 0, 'sadeepthalakindu19@gmail.com', 'sadeepthalakindu18@gmail.com'),
	(40, 'sfg', '2022-11-12 21:28:07', 0, 'sadeepthalakindu19@gmail.com', 'sadeepthalakindu18@gmail.com');

-- Dumping structure for table eshop0.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int NOT NULL,
  `city_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `district_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_city_district1_idx` (`district_id`),
  CONSTRAINT `fk_city_district1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.city: ~0 rows (approximately)
INSERT INTO `city` (`id`, `city_name`, `district_id`) VALUES
	(1, 'kottawa', 5);

-- Dumping structure for table eshop0.colour
CREATE TABLE IF NOT EXISTS `colour` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.colour: ~3 rows (approximately)
INSERT INTO `colour` (`id`, `name`) VALUES
	(1, 'black'),
	(2, 'gold'),
	(3, 'silver');

-- Dumping structure for table eshop0.condition
CREATE TABLE IF NOT EXISTS `condition` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.condition: ~2 rows (approximately)
INSERT INTO `condition` (`id`, `name`) VALUES
	(1, 'new'),
	(2, 'used');

-- Dumping structure for table eshop0.district
CREATE TABLE IF NOT EXISTS `district` (
  `id` int NOT NULL AUTO_INCREMENT,
  `district_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `province_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_district_province1_idx` (`province_id`),
  CONSTRAINT `fk_district_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.district: ~0 rows (approximately)
INSERT INTO `district` (`id`, `district_name`, `province_id`) VALUES
	(5, 'colombo', 1);

-- Dumping structure for table eshop0.feedback
CREATE TABLE IF NOT EXISTS `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int DEFAULT NULL,
  `feedback` text,
  `date` datetime DEFAULT NULL,
  `product_id` int NOT NULL,
  `user_email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_feedback_product1_idx` (`product_id`),
  KEY `fk_feedback_user1_idx` (`user_email`),
  CONSTRAINT `fk_feedback_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_feedback_user1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.feedback: ~20 rows (approximately)
INSERT INTO `feedback` (`id`, `type`, `feedback`, `date`, `product_id`, `user_email`) VALUES
	(5, 1, 'good iteam', '2022-11-12 00:20:49', 1, 'sadeepthalakindu18@gmail.com'),
	(6, 1, 'good item', '2022-11-12 00:22:20', 1, 'sadeepthalakindu18@gmail.com'),
	(7, 2, 'so nice', '2022-11-12 01:06:39', 1, 'sadeepthalakindu18@gmail.com'),
	(8, 1, 'gewwa ganata labaii', '2022-11-12 01:08:04', 1, 'sadeepthalakindu18@gmail.com'),
	(9, 1, 'sddd', '2022-11-12 01:09:07', 1, 'sadeepthalakindu18@gmail.com'),
	(10, 1, 'szsss', '2022-11-12 01:10:39', 1, 'sadeepthalakindu18@gmail.com'),
	(11, 1, 'szsss', '2022-11-12 01:10:51', 1, 'sadeepthalakindu18@gmail.com'),
	(12, 1, 'szsss', '2022-11-12 01:10:54', 1, 'sadeepthalakindu18@gmail.com'),
	(13, 1, 'sddwc', '2022-11-12 01:11:20', 1, 'sadeepthalakindu18@gmail.com'),
	(14, 1, 'sddwc', '2022-11-12 01:11:26', 1, 'sadeepthalakindu18@gmail.com'),
	(15, 1, 'xzsdxc', '2022-11-12 01:12:36', 1, 'sadeepthalakindu18@gmail.com'),
	(16, 1, 'thn', '2022-11-12 01:12:52', 1, 'sadeepthalakindu18@gmail.com'),
	(17, 1, 'cvdf', '2022-11-12 01:13:48', 1, 'sadeepthalakindu18@gmail.com'),
	(18, 1, 'dfr', '2022-11-12 01:14:43', 1, 'sadeepthalakindu18@gmail.com'),
	(19, 1, 'elakiri ', '2022-11-12 01:15:43', 1, 'sadeepthalakindu18@gmail.com'),
	(20, 1, 'elakiri ', '2022-11-12 01:16:07', 1, 'sadeepthalakindu18@gmail.com'),
	(21, 1, 'frr3', '2022-11-12 01:16:17', 1, 'sadeepthalakindu18@gmail.com'),
	(22, 1, 'rf', '2022-11-12 01:16:40', 1, 'sadeepthalakindu18@gmail.com'),
	(23, 1, 'good product', '2022-11-12 01:30:10', 1, 'sadeepthalakindu18@gmail.com'),
	(24, 1, 'good product 123', '2022-11-12 01:31:27', 1, 'sadeepthalakindu18@gmail.com'),
	(25, 1, '\r\nghjyhghhjg', '2023-11-21 19:07:54', 1, 'sadeepthalakindu18@gmail.com');

-- Dumping structure for table eshop0.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gender_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.gender: ~2 rows (approximately)
INSERT INTO `gender` (`id`, `gender_name`) VALUES
	(1, 'male'),
	(2, 'female');

-- Dumping structure for table eshop0.images
CREATE TABLE IF NOT EXISTS `images` (
  `code` varchar(100) NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`code`),
  KEY `fk_images_product1_idx` (`product_id`),
  CONSTRAINT `fk_images_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.images: ~4 rows (approximately)
INSERT INTO `images` (`code`, `product_id`) VALUES
	('resource//mobile_images//fgghh_0_6369e147c1049.jpeg', 60),
	('resource//mobile_images//fgghh_0_6369e150ef17c.jpeg', 61),
	('resource//mobile_images//thsrf_0_6369e22c79231.jpeg', 62);

-- Dumping structure for table eshop0.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `total` double DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `product_id` int NOT NULL,
  `user_email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_product1_idx` (`product_id`),
  KEY `fk_invoice_user1_idx` (`user_email`),
  CONSTRAINT `fk_invoice_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_invoice_user1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.invoice: ~6 rows (approximately)
INSERT INTO `invoice` (`id`, `order_id`, `date`, `total`, `qty`, `status`, `product_id`, `user_email`) VALUES
	(1, '6368dc8feeac2', '2022-11-07 15:54:43', 8250, 1, 4, 1, 'sadeepthalakindu18@gmail.com'),
	(2, '636a72d000e5d', '2022-11-08 20:48:17', 8250, 1, 4, 1, 'sadeepthalakindu18@gmail.com'),
	(3, '636e126c3e6aa', '2022-11-11 14:46:20', 5050, 1, 4, 56, 'sadeepthalakindu18@gmail.com'),
	(8, '636e905cbde6e', '2022-11-11 23:43:12', 8250, 1, 4, 1, 'sadeepthalakindu18@gmail.com'),
	(9, '65191d19b9d54', '2023-10-01 12:48:57', 5050, 1, 0, 56, 'sadeepthalakindu18@gmail.com'),
	(10, '6519360371e70', '2023-10-01 14:34:35', 5050, 1, 0, 56, 'sadeepthalakindu18@gmail.com'),
	(11, '655ca7afc698e', '2023-11-21 18:21:38', 5050, 1, 0, 56, 'sadeepthalakindu18@gmail.com');

-- Dumping structure for table eshop0.modle
CREATE TABLE IF NOT EXISTS `modle` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.modle: ~3 rows (approximately)
INSERT INTO `modle` (`id`, `name`) VALUES
	(1, 'iphpne x'),
	(2, 'x5'),
	(3, 't6');

-- Dumping structure for table eshop0.product
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `brand_has_modle_id` int NOT NULL,
  `colour_id` int NOT NULL,
  `price` double DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `description` text,
  `title` varchar(100) DEFAULT NULL,
  `condition_id` int NOT NULL,
  `status_id` int NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `datetime_added` datetime DEFAULT NULL,
  `delivery_fee_colombo` double DEFAULT NULL,
  `delivery_fee_other` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category1_idx` (`category_id`),
  KEY `fk_product_colour1_idx` (`colour_id`),
  KEY `fk_product_condition1_idx` (`condition_id`),
  KEY `fk_product_status1_idx` (`status_id`),
  KEY `fk_product_user1_idx` (`user_email`),
  KEY `fk_product_brand_has_modle1_idx` (`brand_has_modle_id`),
  CONSTRAINT `fk_product_brand_has_modle1` FOREIGN KEY (`brand_has_modle_id`) REFERENCES `brand_has_modle` (`id`),
  CONSTRAINT `fk_product_category1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `fk_product_colour1` FOREIGN KEY (`colour_id`) REFERENCES `colour` (`id`),
  CONSTRAINT `fk_product_condition1` FOREIGN KEY (`condition_id`) REFERENCES `condition` (`id`),
  CONSTRAINT `fk_product_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `fk_product_user1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.product: ~8 rows (approximately)
INSERT INTO `product` (`id`, `category_id`, `brand_has_modle_id`, `colour_id`, `price`, `qty`, `description`, `title`, `condition_id`, `status_id`, `user_email`, `datetime_added`, `delivery_fee_colombo`, `delivery_fee_other`) VALUES
	(1, 1, 1, 1, 7500, 7, 'good product', 'iphone', 1, 1, 'sadeepthalakindu18@gmail.com', '2022-11-07 15:21:58', 500, 750),
	(56, 1, 1, 2, 4500, 1, 'gfrghgdhgd', 'def', 1, 1, 'sadeepthalakindu18@gmail.com', '2022-11-08 10:18:38', 450, 550),
	(57, 2, 1, 3, 2000, 6, 'sasdddwfgegeg', 'ggh', 1, 1, 'sadeepthalakindu18@gmail.com', '2022-11-08 10:23:46', 500, 750),
	(58, 3, 3, 1, 1000, 6, 'ghehydujkjk', 'fgghh', 2, 1, 'sadeepthalakindu18@gmail.com', '2022-11-08 10:24:47', 500, 750),
	(59, 3, 3, 1, 1000, 6, 'ghehydujkjk', 'fgghh', 2, 1, 'sadeepthalakindu18@gmail.com', '2022-11-08 10:25:21', 500, 750),
	(60, 3, 3, 1, 1000, 6, 'ghehydujkjk', 'fgghh', 2, 1, 'sadeepthalakindu18@gmail.com', '2022-11-08 10:25:35', 500, 750),
	(61, 3, 3, 1, 1000, 6, 'ghehydujkjk', 'fgghh', 2, 1, 'sadeepthalakindu18@gmail.com', '2022-11-08 10:25:44', 500, 750),
	(62, 5, 2, 2, 45620, 9, 'aqfrweyhtjuyhikyuhikuyjh', 'thsrf', 2, 1, 'sadeepthalakindu18@gmail.com', '2022-11-08 10:27:51', 555, 550);

-- Dumping structure for table eshop0.profile_image
CREATE TABLE IF NOT EXISTS `profile_image` (
  `path` varchar(50) NOT NULL,
  `user_email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`path`),
  KEY `fk_profile_image_user1_idx` (`user_email`),
  CONSTRAINT `fk_profile_image_user1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.profile_image: ~0 rows (approximately)

-- Dumping structure for table eshop0.province
CREATE TABLE IF NOT EXISTS `province` (
  `id` int NOT NULL AUTO_INCREMENT,
  `province_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.province: ~0 rows (approximately)
INSERT INTO `province` (`id`, `province_name`) VALUES
	(1, 'western');

-- Dumping structure for table eshop0.recent
CREATE TABLE IF NOT EXISTS `recent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_recent_product1_idx` (`product_id`),
  KEY `fk_recent_user1_idx` (`user_email`),
  CONSTRAINT `fk_recent_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_recent_user1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.recent: ~12 rows (approximately)
INSERT INTO `recent` (`id`, `product_id`, `user_email`) VALUES
	(26, 56, 'sadeepthalakindu18@gmail.com'),
	(27, 56, 'sadeepthalakindu18@gmail.com'),
	(28, 1, 'sadeepthalakindu18@gmail.com'),
	(29, 1, 'sadeepthalakindu18@gmail.com'),
	(30, 56, 'sadeepthalakindu18@gmail.com'),
	(31, 56, 'sadeepthalakindu18@gmail.com'),
	(32, 56, 'sadeepthalakindu18@gmail.com'),
	(33, 1, 'sadeepthalakindu18@gmail.com'),
	(34, 56, 'sadeepthalakindu18@gmail.com'),
	(35, 56, 'sadeepthalakindu18@gmail.com'),
	(36, 60, 'sadeepthalakindu18@gmail.com'),
	(37, 1, 'sadeepthalakindu18@gmail.com'),
	(38, 62, 'sadeepthalakindu18@gmail.com');

-- Dumping structure for table eshop0.status
CREATE TABLE IF NOT EXISTS `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.status: ~2 rows (approximately)
INSERT INTO `status` (`id`, `name`) VALUES
	(1, 'active'),
	(2, 'deactive');

-- Dumping structure for table eshop0.user
CREATE TABLE IF NOT EXISTS `user` (
  `email` varchar(100) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `joined_date` datetime DEFAULT NULL,
  `verification_code` varchar(20) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `gender_id` int NOT NULL,
  PRIMARY KEY (`email`),
  KEY `fk_user_gender1_idx` (`gender_id`),
  KEY `FK_user_status` (`status`),
  CONSTRAINT `fk_user_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  CONSTRAINT `FK_user_status` FOREIGN KEY (`status`) REFERENCES `status` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.user: ~2 rows (approximately)
INSERT INTO `user` (`email`, `fname`, `lname`, `password`, `mobile`, `joined_date`, `verification_code`, `status`, `gender_id`) VALUES
	('sadeepthalakindu18@gmail.com', 'sadeeptha', 'lakindu', '123456', 'watchlist', '2022-11-07 12:59:48', '651c0b8373673', 1, 1),
	('sadeepthalakindu19@gmail.com', 'sadee', 'lak', '123456', '0757607831', '2022-11-09 20:19:56', NULL, 1, 1);

-- Dumping structure for table eshop0.user_has_address
CREATE TABLE IF NOT EXISTS `user_has_address` (
  `user_email` varchar(100) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `line1` text,
  `line2` text,
  `postal_code` varchar(5) DEFAULT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_has_address_user1_idx` (`user_email`),
  KEY `fk_user_has_address_city1_idx` (`city_id`),
  CONSTRAINT `fk_user_has_city_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `fk_user_has_city_user1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.user_has_address: ~0 rows (approximately)
INSERT INTO `user_has_address` (`user_email`, `id`, `line1`, `line2`, `postal_code`, `city_id`) VALUES
	('sadeepthalakindu18@gmail.com', 1, '200/1/k jaqyagath mawatha ', 'brahamanagama pannipitiya', '10232', 1);

-- Dumping structure for table eshop0.watchlist
CREATE TABLE IF NOT EXISTS `watchlist` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `user_email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_watchlist_product1_idx` (`product_id`),
  KEY `fk_watchlist_user1_idx` (`user_email`),
  CONSTRAINT `fk_watchlist_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_watchlist_user1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table eshop0.watchlist: ~0 rows (approximately)
INSERT INTO `watchlist` (`id`, `product_id`, `user_email`) VALUES
	(57, 1, 'sadeepthalakindu18@gmail.com');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
