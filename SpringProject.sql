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


-- springproject 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `springproject` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `springproject`;

-- 테이블 springproject.admin 구조 내보내기
CREATE TABLE IF NOT EXISTS `admin` (
  `adminId` varchar(10) NOT NULL,
  `adminPw` varchar(100) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.admin:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`adminId`, `adminPw`) VALUES
	('admin', '$2a$10$Gu8BwFohbygVOhfXxJ1S1esJKqMFvjhjviZVlvJw9PwXttg0NP056');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- 테이블 springproject.category 구조 내보내기
CREATE TABLE IF NOT EXISTS `category` (
  `catId` int(2) NOT NULL,
  `catName` varchar(10) NOT NULL,
  PRIMARY KEY (`catId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.category:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`catId`, `catName`) VALUES
	(1, '커피'),
	(2, '스무디'),
	(3, '차');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;

-- 테이블 springproject.cat_optcl 구조 내보내기
CREATE TABLE IF NOT EXISTS `cat_optcl` (
  `catId` int(2) NOT NULL,
  `opclId` int(5) NOT NULL,
  PRIMARY KEY (`catId`,`opclId`),
  KEY `FK_option_class_TO_cat_optCl_1` (`opclId`),
  CONSTRAINT `FK_category_TO_cat_optCl_1` FOREIGN KEY (`catId`) REFERENCES `category` (`catId`),
  CONSTRAINT `FK_option_class_TO_cat_optCl_1` FOREIGN KEY (`opclId`) REFERENCES `option_class` (`opclId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.cat_optcl:~7 rows (대략적) 내보내기
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

-- 테이블 springproject.ingredient 구조 내보내기
CREATE TABLE IF NOT EXISTS `ingredient` (
  `Key` int(3) NOT NULL,
  `ingName` varchar(20) NOT NULL,
  `ingUnit` varchar(5) DEFAULT NULL,
  `ingQuantity` int(5) DEFAULT 0,
  PRIMARY KEY (`Key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.ingredient:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;

-- 테이블 springproject.item 구조 내보내기
CREATE TABLE IF NOT EXISTS `item` (
  `itemId` int(10) NOT NULL,
  `catId` int(2) NOT NULL,
  `itemName` varchar(30) DEFAULT NULL,
  `itemPrice` int(5) DEFAULT NULL,
  `itemImg` varchar(100) NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT 1,
  `itemSequence` int(8) DEFAULT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.item:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`itemId`, `catId`, `itemName`, `itemPrice`, `itemImg`, `visible`, `itemSequence`) VALUES
	(1, 1, '아메리카노', 1500, '1', 1, 1),
	(2, 2, '블루베리스무디', 3000, '2', 1, 2),
	(3, 1, '카페라떼', 2000, '2', 1, 3),
	(4, 3, '시나몬 티', 2300, '3', 1, 4);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

-- 테이블 springproject.item_ing 구조 내보내기
CREATE TABLE IF NOT EXISTS `item_ing` (
  `itemId` int(10) NOT NULL,
  `Key` int(3) NOT NULL,
  `UniyQuant` int(5) DEFAULT NULL,
  PRIMARY KEY (`itemId`,`Key`),
  KEY `FK_ingredient_TO_item_ing_1` (`Key`),
  CONSTRAINT `FK_ingredient_TO_item_ing_1` FOREIGN KEY (`Key`) REFERENCES `ingredient` (`Key`),
  CONSTRAINT `FK_item_TO_item_ing_1` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.item_ing:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `item_ing` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_ing` ENABLE KEYS */;

-- 테이블 springproject.item_order 구조 내보내기
CREATE TABLE IF NOT EXISTS `item_order` (
  `itemOrderId` int(5) NOT NULL,
  `orderPrice` int(7) DEFAULT NULL,
  `itemQuantity` int(5) DEFAULT NULL,
  `itemId` int(10) NOT NULL,
  `ordNumber` int(10) NOT NULL,
  PRIMARY KEY (`itemOrderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.item_order:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `item_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_order` ENABLE KEYS */;

-- 테이블 springproject.option 구조 내보내기
CREATE TABLE IF NOT EXISTS `option` (
  `optId` int(2) NOT NULL,
  `opclId` int(5) NOT NULL,
  `optName` varchar(10) NOT NULL,
  `optPrice` int(5) DEFAULT NULL,
  PRIMARY KEY (`optId`,`opclId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.option:~11 rows (대략적) 내보내기
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
INSERT INTO `option` (`optId`, `opclId`, `optName`, `optPrice`) VALUES
	(0, 1, '스몰', 0),
	(0, 2, '추가 없음', 0),
	(0, 3, '아이스', 0),
	(0, 4, '추가 없음', 0),
	(1, 1, '빅', 500),
	(1, 2, '1샷 추가 ', 300),
	(1, 3, '핫', 0),
	(1, 4, '1번', 0),
	(2, 2, '2샷 추가', 500),
	(2, 4, '2번', 0),
	(3, 2, '3샷 추가', 800);
/*!40000 ALTER TABLE `option` ENABLE KEYS */;

-- 테이블 springproject.option_class 구조 내보내기
CREATE TABLE IF NOT EXISTS `option_class` (
  `opclId` int(5) NOT NULL,
  `opclName` varchar(10) NOT NULL,
  PRIMARY KEY (`opclId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.option_class:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `option_class` DISABLE KEYS */;
INSERT INTO `option_class` (`opclId`, `opclName`) VALUES
	(1, '사이즈'),
	(2, '샷'),
	(3, '온도'),
	(4, '시럽');
/*!40000 ALTER TABLE `option_class` ENABLE KEYS */;

-- 테이블 springproject.order 구조 내보내기
CREATE TABLE IF NOT EXISTS `order` (
  `ordNumber` int(10) NOT NULL,
  `totalPrice` int(7) DEFAULT NULL,
  PRIMARY KEY (`ordNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.order:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

-- 테이블 springproject.order_option 구조 내보내기
CREATE TABLE IF NOT EXISTS `order_option` (
  `optId` int(2) NOT NULL,
  `itemOrderId` int(5) NOT NULL,
  PRIMARY KEY (`optId`,`itemOrderId`),
  KEY `FK_item_order_TO_order_option_1` (`itemOrderId`),
  CONSTRAINT `FK_item_order_TO_order_option_1` FOREIGN KEY (`itemOrderId`) REFERENCES `item_order` (`itemOrderId`),
  CONSTRAINT `FK_option_TO_order_option_1` FOREIGN KEY (`optId`) REFERENCES `option` (`optId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.order_option:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `order_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_option` ENABLE KEYS */;

-- 테이블 springproject.payment 구조 내보내기
CREATE TABLE IF NOT EXISTS `payment` (
  `payId` int(10) NOT NULL,
  `payPrice` int(10) DEFAULT NULL,
  `payTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ordNumber` int(10) NOT NULL,
  PRIMARY KEY (`payId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.payment:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
