-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 테이블 springp.admin 구조 내보내기
CREATE TABLE IF NOT EXISTS `admin` (
  `adminId` varchar(10) NOT NULL,
  `adminPw` varchar(100) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springp.admin:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`adminId`, `adminPw`) VALUES
	('', '$2a$10$WpCyaKL92NxHTj/BTP.w/eNOYA/dlAwuhwPLjjj7PenN0JIKC/aFe'),
	('admin', '$2a$10$EDQW.V7hjAojdUIgJw5t6Ocnf8yFH8ODTG1xnponsQsDLzN9jeoXi'),
	('dd', '$2a$10$daDELVOZP5/Sdz8UbZ/dqOvFeNyiC/Yi1Kii5E4pjItEmlfcv1VUq'),
	('ss', '$2a$10$/32Bl0LGBXNDyWXV30vSQe2kVqOz/A/LZpAboGYtT3CVCB5NSMzm2');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- 테이블 springp.category 구조 내보내기
CREATE TABLE IF NOT EXISTS `category` (
  `catId` int(2) NOT NULL,
  `catName` varchar(10) NOT NULL,
  PRIMARY KEY (`catId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springp.category:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`catId`, `catName`) VALUES
	(1, '커피'),
	(2, '차'),
	(3, '스무디');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- 테이블 springp.cat_optcl 구조 내보내기
CREATE TABLE IF NOT EXISTS `cat_optcl` (
  `catId` int(2) NOT NULL,
  `opclId` int(5) NOT NULL,
  PRIMARY KEY (`catId`,`opclId`),
  KEY `FK_option_class_TO_cat_optCl_1` (`opclId`),
  CONSTRAINT `FK_category_TO_cat_optCl_1` FOREIGN KEY (`catId`) REFERENCES `category` (`catId`),
  CONSTRAINT `FK_option_class_TO_cat_optCl_1` FOREIGN KEY (`opclId`) REFERENCES `option_class` (`opclId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springp.cat_optcl:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `cat_optcl` DISABLE KEYS */;
INSERT INTO `cat_optcl` (`catId`, `opclId`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(2, 1),
	(3, 1),
	(3, 3);
/*!40000 ALTER TABLE `cat_optcl` ENABLE KEYS */;

-- 테이블 springp.ingredient 구조 내보내기
CREATE TABLE IF NOT EXISTS `ingredient` (
  `ingId` int(11) NOT NULL,
  `ingName` varchar(20) NOT NULL,
  `ingUnit` varchar(5) DEFAULT NULL,
  `ingQuantity` int(5) DEFAULT 0,
  PRIMARY KEY (`ingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springp.ingredient:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` (`ingId`, `ingName`, `ingUnit`, `ingQuantity`) VALUES
	(1, '원두', '5000', 50),
	(2, '우유', '400', 7000),
	(3, '휘핑', '70', 7000);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;

-- 테이블 springp.item 구조 내보내기
CREATE TABLE IF NOT EXISTS `item` (
  `itemId` int(10) NOT NULL AUTO_INCREMENT,
  `catId` int(2) NOT NULL,
  `itemName` varchar(30) DEFAULT NULL,
  `itemPrice` int(5) DEFAULT NULL,
  `itemImg` varchar(255) NOT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `itemSequence` int(8) DEFAULT NULL,
  PRIMARY KEY (`itemId`),
  KEY `FK_item_category` (`catId`),
  CONSTRAINT `FK_item_category` FOREIGN KEY (`catId`) REFERENCES `category` (`catId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springp.item:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`itemId`, `catId`, `itemName`, `itemPrice`, `itemImg`, `visible`, `itemSequence`) VALUES
	(0, 1, '아메리카노', 11600, 'C:\\Users\\bon320-40\\Documents\\workspace-spring-tool-suite-4-4.11.1.RELEASE\\kimal\\src\\main\\webapp\\1638598357958images.jpg', 1, 1),
	(1, 2, '녹차', 2205, 'C:\\Users\\bon320-40\\Documents\\workspace-spring-tool-suite-4-4.11.1.RELEASE\\kimal\\src\\main\\webapp\\1638598371751hqdefault.jpg', 1, 2),
	(2, 2, '말차', 5020, 'C:\\Users\\bon320-40\\Documents\\workspace-spring-tool-suite-4-4.11.1.RELEASE\\kimal\\src\\main\\webapp\\1638598381576거없.jpg', 1, 3),
	(3, 2, '시나몬 티', 40000, 'C:\\Users\\bon320-40\\Documents\\workspace-spring-tool-suite-4-4.11.1.RELEASE\\kimal\\src\\main\\webapp\\163860059820220210805072828.1607654.jpg', 1, 33),
	(4, 3, '블루베리 스무디', 60000, 'C:\\Users\\bon320-40\\Documents\\workspace-spring-tool-suite-4-4.11.1.RELEASE\\kimal\\src\\main\\webapp\\1638600515137bf2e3a87f1934dc291764fef6c6eae18.jpg', 1, 44);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

-- 테이블 springp.item_ing 구조 내보내기
CREATE TABLE IF NOT EXISTS `item_ing` (
  `itemId` int(10) NOT NULL,
  `ingId` int(11) NOT NULL,
  PRIMARY KEY (`itemId`,`ingId`),
  KEY `FK_ingredient_TO_item_ing_1` (`ingId`),
  CONSTRAINT `FK_ingredient_TO_item_ing_1` FOREIGN KEY (`ingId`) REFERENCES `ingredient` (`ingId`),
  CONSTRAINT `FK_item_TO_item_ing_1` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springp.item_ing:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `item_ing` DISABLE KEYS */;
INSERT INTO `item_ing` (`itemId`, `ingId`) VALUES
	(33, 1),
	(33, 2),
	(33, 3);
/*!40000 ALTER TABLE `item_ing` ENABLE KEYS */;

-- 테이블 springp.item_order 구조 내보내기
CREATE TABLE IF NOT EXISTS `item_order` (
  `itemOrderId` int(5) NOT NULL AUTO_INCREMENT,
  `orderPrice` int(7) DEFAULT NULL,
  `itemQuantity` int(5) DEFAULT NULL,
  `itemId` int(10) NOT NULL,
  `ordNumber` int(10) NOT NULL,
  PRIMARY KEY (`itemOrderId`),
  KEY `FK_item_order_order` (`ordNumber`),
  CONSTRAINT `FK_item_order_order` FOREIGN KEY (`ordNumber`) REFERENCES `order` (`ordNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springp.item_order:~36 rows (대략적) 내보내기
/*!40000 ALTER TABLE `item_order` DISABLE KEYS */;
INSERT INTO `item_order` (`itemOrderId`, `orderPrice`, `itemQuantity`, `itemId`, `ordNumber`) VALUES
	(96, NULL, 1, 1, 101),
	(97, NULL, 1, 3, 101),
	(98, NULL, 1, 0, 102),
	(99, NULL, 1, 4, 102),
	(100, NULL, 1, 0, 103),
	(101, NULL, 1, 4, 103),
	(102, NULL, 1, 0, 104),
	(103, NULL, 1, 4, 104),
	(104, NULL, 1, 0, 105),
	(105, NULL, 1, 2, 105),
	(106, NULL, 1, 1, 105),
	(107, NULL, 1, 0, 106),
	(108, NULL, 1, 4, 106),
	(109, NULL, 1, 3, 106),
	(110, NULL, 1, 0, 107),
	(111, NULL, 1, 3, 107),
	(112, NULL, 1, 2, 107),
	(113, NULL, 1, 0, 108),
	(114, NULL, 1, 3, 108),
	(115, NULL, 1, 0, 109),
	(116, NULL, 1, 3, 109),
	(117, NULL, 1, 0, 110),
	(118, NULL, 1, 3, 110),
	(119, NULL, 1, 4, 111),
	(120, NULL, 1, 2, 111),
	(121, NULL, 1, 0, 112),
	(122, NULL, 1, 4, 112),
	(123, NULL, 1, 0, 113),
	(124, NULL, 1, 3, 113),
	(125, NULL, 1, 0, 114),
	(126, NULL, 1, 0, 115),
	(127, NULL, 1, 0, 115),
	(128, NULL, 1, 0, 116),
	(129, NULL, 1, 0, 117),
	(130, NULL, 1, 4, 117),
	(131, NULL, 1, 3, 117),
	(132, NULL, 1, 0, 118),
	(133, NULL, 1, 2, 118),
	(134, NULL, 1, 1, 118),
	(135, NULL, 1, 0, 119),
	(136, NULL, 1, 3, 119),
	(137, NULL, 1, 0, 120),
	(138, NULL, 1, 3, 120),
	(139, NULL, 1, 2, 120),
	(140, NULL, 1, 0, 121),
	(141, NULL, 1, 0, 122),
	(142, 40000, 1, 3, 123),
	(143, 5020, 1, 2, 123),
	(144, 2205, 1, 1, 123),
	(145, 11600, 1, 0, 124),
	(146, 40000, 1, 3, 124),
	(147, 5020, 1, 2, 124),
	(148, 11600, 1, 0, 125),
	(149, 40000, 1, 3, 125),
	(150, 5020, 1, 2, 125),
	(151, 11600, 1, 0, 126),
	(152, 40000, 1, 3, 126),
	(153, 5020, 1, 2, 126),
	(154, 11600, 1, 0, 127),
	(155, 40000, 1, 3, 127),
	(156, 5020, 1, 2, 127),
	(157, 11600, 1, 0, 128),
	(158, 40000, 1, 3, 128),
	(159, 5020, 1, 2, 128),
	(160, 11600, 1, 0, 129),
	(161, 40000, 1, 3, 129),
	(162, 5020, 1, 2, 129),
	(163, 11600, 1, 0, 130),
	(164, 40000, 1, 3, 130),
	(165, 5020, 1, 2, 130),
	(166, 11600, 1, 0, 131),
	(167, 40000, 1, 3, 131),
	(168, 5020, 1, 2, 131),
	(169, 11600, 1, 0, 132),
	(170, 40000, 1, 3, 132),
	(171, 5020, 1, 2, 132),
	(172, 11600, 1, 0, 133),
	(173, 40000, 1, 3, 133),
	(174, 5020, 1, 2, 133),
	(175, 11600, 1, 0, 134),
	(176, 40000, 1, 3, 134),
	(177, 5020, 1, 2, 134),
	(178, 11600, 1, 0, 135),
	(179, 40000, 1, 3, 135),
	(180, 5020, 1, 2, 135),
	(181, 40000, 1, 3, 136),
	(182, 5020, 1, 2, 136),
	(183, 11600, 1, 0, 136),
	(184, 60000, 1, 4, 137),
	(185, 5020, 1, 2, 137),
	(186, 2205, 1, 1, 137),
	(187, 11600, 1, 0, 138),
	(188, 40000, 1, 3, 138),
	(189, 11600, 1, 0, 139),
	(190, 11600, 1, 0, 140),
	(191, 5020, 1, 2, 140),
	(192, 11600, 1, 0, 141),
	(193, 11600, 1, 0, 142),
	(194, 13800, 1, 0, 143),
	(195, 13800, 1, 0, 144),
	(196, 41000, 1, 3, 145),
	(197, 42000, 1, 3, 145),
	(198, 5205, 1, 1, 145),
	(199, 3205, 1, 1, 146),
	(200, 4205, 1, 1, 146),
	(201, 3205, 1, 1, 147),
	(202, 4205, 1, 1, 147),
	(203, 3205, 1, 1, 148),
	(204, 7020, 1, 2, 148),
	(205, 3205, 1, 1, 149),
	(206, 4205, 1, 1, 149),
	(207, 5205, 1, 1, 149),
	(208, 3205, 1, 1, 150),
	(209, 3205, 1, 1, 150),
	(210, 3205, 1, 1, 151),
	(211, 3205, 1, 1, 151),
	(212, 3205, 1, 1, 151),
	(213, 3205, 1, 1, 152),
	(214, 6020, 1, 2, 152),
	(215, 3205, 1, 1, 152);
/*!40000 ALTER TABLE `item_order` ENABLE KEYS */;

-- 테이블 springp.option 구조 내보내기
CREATE TABLE IF NOT EXISTS `option` (
  `optId` int(2) NOT NULL,
  `opclId` int(5) NOT NULL,
  `optName` varchar(10) NOT NULL,
  `optPrice` int(5) DEFAULT NULL,
  PRIMARY KEY (`optId`),
  KEY `optcl_fk` (`opclId`),
  CONSTRAINT `optcl_fk` FOREIGN KEY (`opclId`) REFERENCES `option_class` (`opclId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springp.option:~12 rows (대략적) 내보내기
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
INSERT INTO `option` (`optId`, `opclId`, `optName`, `optPrice`) VALUES
	(0, 1, '기본 사이즈', 0),
	(1, 1, '빅 사이즈', 1000),
	(2, 2, '샷 추가 없음', 0),
	(3, 2, '1샷 추가', 300),
	(4, 2, '2샷 추가', 600),
	(5, 2, '3샷 추가', 900),
	(6, 2, '4샷 추가', 1200),
	(7, 3, '아이스', 0),
	(8, 3, '핫', 0),
	(9, 4, '시럽 추가 없음', 0),
	(10, 4, '시럽 1번 추가', 0),
	(11, 4, '시럽 2번 추가', 0);
/*!40000 ALTER TABLE `option` ENABLE KEYS */;

-- 테이블 springp.option_class 구조 내보내기
CREATE TABLE IF NOT EXISTS `option_class` (
  `opclId` int(5) NOT NULL,
  `opclName` varchar(10) NOT NULL,
  PRIMARY KEY (`opclId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springp.option_class:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `option_class` DISABLE KEYS */;
INSERT INTO `option_class` (`opclId`, `opclName`) VALUES
	(1, '사이즈'),
	(2, '샷'),
	(3, '온도'),
	(4, '시럽');
/*!40000 ALTER TABLE `option_class` ENABLE KEYS */;

-- 테이블 springp.order 구조 내보내기
CREATE TABLE IF NOT EXISTS `order` (
  `ordNumber` int(10) NOT NULL AUTO_INCREMENT,
  `totalPrice` int(7) DEFAULT NULL,
  PRIMARY KEY (`ordNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springp.order:~17 rows (대략적) 내보내기
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`ordNumber`, `totalPrice`) VALUES
	(101, NULL),
	(102, NULL),
	(103, NULL),
	(104, NULL),
	(105, NULL),
	(106, NULL),
	(107, NULL),
	(108, NULL),
	(109, NULL),
	(110, NULL),
	(111, NULL),
	(112, NULL),
	(113, NULL),
	(114, NULL),
	(115, NULL),
	(116, NULL),
	(117, NULL),
	(118, NULL),
	(119, NULL),
	(120, NULL),
	(121, NULL),
	(122, NULL),
	(123, NULL),
	(124, NULL),
	(125, NULL),
	(126, NULL),
	(127, NULL),
	(128, NULL),
	(129, NULL),
	(130, NULL),
	(131, NULL),
	(132, NULL),
	(133, NULL),
	(134, NULL),
	(135, NULL),
	(136, NULL),
	(137, NULL),
	(138, NULL),
	(139, NULL),
	(140, NULL),
	(141, NULL),
	(142, NULL),
	(143, NULL),
	(144, NULL),
	(145, NULL),
	(146, NULL),
	(147, NULL),
	(148, NULL),
	(149, NULL),
	(150, NULL),
	(151, NULL),
	(152, 12430);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

-- 테이블 springp.order_option 구조 내보내기
CREATE TABLE IF NOT EXISTS `order_option` (
  `itemOrderId` int(5) NOT NULL,
  `optId` int(2) NOT NULL,
  PRIMARY KEY (`optId`,`itemOrderId`),
  KEY `FK_item_order_TO_order_option_1` (`itemOrderId`),
  CONSTRAINT `FK_option_TO_order_option_1` FOREIGN KEY (`optId`) REFERENCES `option` (`optId`),
  CONSTRAINT `FK_order_option_item_order` FOREIGN KEY (`itemOrderId`) REFERENCES `item_order` (`itemOrderId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springp.order_option:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `order_option` DISABLE KEYS */;
INSERT INTO `order_option` (`itemOrderId`, `optId`) VALUES
	(129, 0),
	(130, 0),
	(131, 0),
	(132, 0),
	(133, 0),
	(134, 0),
	(135, 0),
	(136, 0),
	(137, 0),
	(138, 0),
	(139, 0),
	(140, 0),
	(141, 0),
	(142, 0),
	(143, 0),
	(144, 0),
	(145, 0),
	(146, 0),
	(147, 0),
	(148, 0),
	(149, 0),
	(150, 0),
	(151, 0),
	(152, 0),
	(153, 0),
	(154, 0),
	(155, 0),
	(156, 0),
	(157, 0),
	(158, 0),
	(159, 0),
	(160, 0),
	(161, 0),
	(162, 0),
	(163, 0),
	(164, 0),
	(165, 0),
	(166, 0),
	(167, 0),
	(168, 0),
	(169, 0),
	(170, 0),
	(171, 0),
	(172, 0),
	(173, 0),
	(174, 0),
	(175, 0),
	(176, 0),
	(177, 0),
	(178, 0),
	(179, 0),
	(180, 0),
	(181, 0),
	(182, 0),
	(183, 0),
	(184, 0),
	(185, 0),
	(186, 0),
	(187, 0),
	(188, 0),
	(189, 0),
	(190, 0),
	(191, 0),
	(192, 0),
	(193, 0),
	(194, 1),
	(195, 1),
	(196, 1),
	(197, 1),
	(198, 1),
	(199, 1),
	(200, 1),
	(201, 1),
	(202, 1),
	(203, 1),
	(204, 1),
	(205, 1),
	(206, 1),
	(207, 1),
	(208, 1),
	(209, 1),
	(210, 1),
	(211, 1),
	(212, 1),
	(213, 1),
	(214, 1),
	(215, 1),
	(129, 2),
	(132, 2),
	(135, 2),
	(137, 2),
	(140, 2),
	(141, 2),
	(145, 2),
	(148, 2),
	(151, 2),
	(154, 2),
	(157, 2),
	(160, 2),
	(163, 2),
	(166, 2),
	(169, 2),
	(172, 2),
	(175, 2),
	(178, 2),
	(183, 2),
	(187, 2),
	(189, 2),
	(190, 2),
	(192, 2),
	(193, 2),
	(194, 6),
	(195, 6),
	(129, 7),
	(130, 7),
	(132, 7),
	(135, 7),
	(137, 7),
	(140, 7),
	(141, 7),
	(145, 7),
	(148, 7),
	(151, 7),
	(154, 7),
	(157, 7),
	(160, 7),
	(163, 7),
	(166, 7),
	(169, 7),
	(172, 7),
	(175, 7),
	(178, 7),
	(183, 7),
	(184, 7),
	(187, 7),
	(189, 7),
	(190, 7),
	(192, 7),
	(193, 7),
	(194, 7),
	(195, 7),
	(129, 9),
	(132, 9),
	(135, 9),
	(137, 9),
	(140, 9),
	(141, 9),
	(145, 9),
	(148, 9),
	(151, 9),
	(154, 9),
	(157, 9),
	(160, 9),
	(163, 9),
	(166, 9),
	(169, 9),
	(172, 9),
	(175, 9),
	(178, 9),
	(183, 9),
	(187, 9),
	(189, 9),
	(190, 9),
	(192, 9),
	(193, 9),
	(194, 9),
	(195, 9);
/*!40000 ALTER TABLE `order_option` ENABLE KEYS */;

-- 테이블 springp.payment 구조 내보내기
CREATE TABLE IF NOT EXISTS `payment` (
  `payId` int(10) NOT NULL AUTO_INCREMENT,
  `payPrice` int(10) DEFAULT NULL,
  `payTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ordNumber` int(10) NOT NULL,
  PRIMARY KEY (`payId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springp.payment:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` (`payId`, `payPrice`, `payTime`, `ordNumber`) VALUES
	(1, 5000, '2021-12-04 11:56:43', 2),
	(2, 2050, '2021-12-04 15:09:27', 2),
	(3, 4000, '2021-12-04 15:09:43', 3);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
