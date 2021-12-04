-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.4-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 테이블 springproject.admin 구조 내보내기
CREATE TABLE IF NOT EXISTS `admin` (
  `adminId` varchar(10) NOT NULL,
  `adminPw` varchar(100) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.admin:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`adminId`, `adminPw`) VALUES
	('', '$2a$10$WpCyaKL92NxHTj/BTP.w/eNOYA/dlAwuhwPLjjj7PenN0JIKC/aFe'),
	('admin', '$2a$10$EDQW.V7hjAojdUIgJw5t6Ocnf8yFH8ODTG1xnponsQsDLzN9jeoXi'),
	('dd', '$2a$10$daDELVOZP5/Sdz8UbZ/dqOvFeNyiC/Yi1Kii5E4pjItEmlfcv1VUq'),
	('ss', '$2a$10$/32Bl0LGBXNDyWXV30vSQe2kVqOz/A/LZpAboGYtT3CVCB5NSMzm2');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

-- 테이블 springproject.category 구조 내보내기
CREATE TABLE IF NOT EXISTS `category` (
  `catId` int(2) NOT NULL,
  `catName` varchar(10) NOT NULL,
  PRIMARY KEY (`catId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.category:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`catId`, `catName`) VALUES
	(1, '커피'),
	(2, '음료');
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

-- 테이블 데이터 springproject.cat_optcl:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `cat_optcl` DISABLE KEYS */;
/*!40000 ALTER TABLE `cat_optcl` ENABLE KEYS */;

-- 테이블 springproject.ingredient 구조 내보내기
CREATE TABLE IF NOT EXISTS `ingredient` (
  `ingId` int(11) NOT NULL,
  `ingName` varchar(20) NOT NULL,
  `ingUnit` varchar(5) DEFAULT NULL,
  `ingQuantity` int(5) DEFAULT 0,
  PRIMARY KEY (`ingId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.ingredient:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` (`ingId`, `ingName`, `ingUnit`, `ingQuantity`) VALUES
	(1, '원두', '5000', 50),
	(2, '우유', '400', 7000),
	(3, '휘핑', '70', 7000);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;

-- 테이블 springproject.item 구조 내보내기
CREATE TABLE IF NOT EXISTS `item` (
  `itemId` int(10) NOT NULL,
  `catId` int(2) NOT NULL,
  `itemName` varchar(30) DEFAULT NULL,
  `itemPrice` int(5) DEFAULT NULL,
  `itemImg` varchar(255) NOT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  `itemSequence` int(8) DEFAULT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.item:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`itemId`, `catId`, `itemName`, `itemPrice`, `itemImg`, `visible`, `itemSequence`) VALUES
	(1, 1, '1', 1, 'C:\\Users\\bon320-40\\Documents\\workspace-spring-tool-suite-4-4.11.1.RELEASE\\kimal\\src\\main\\webapp\\1638598357958images.jpg', 1, 1),
	(2, 2, '2', 2, 'C:\\Users\\bon320-40\\Documents\\workspace-spring-tool-suite-4-4.11.1.RELEASE\\kimal\\src\\main\\webapp\\1638598371751hqdefault.jpg', 1, 2),
	(3, 2, '3', 3, 'C:\\Users\\bon320-40\\Documents\\workspace-spring-tool-suite-4-4.11.1.RELEASE\\kimal\\src\\main\\webapp\\1638598381576거없.jpg', 1, 3),
	(33, 2, '33', 33, 'C:\\Users\\bon320-40\\Documents\\workspace-spring-tool-suite-4-4.11.1.RELEASE\\kimal\\src\\main\\webapp\\163860059820220210805072828.1607654.jpg', 1, 33),
	(55, 2, '44', 4, 'C:\\Users\\bon320-40\\Documents\\workspace-spring-tool-suite-4-4.11.1.RELEASE\\kimal\\src\\main\\webapp\\1638600515137bf2e3a87f1934dc291764fef6c6eae18.jpg', 1, 44);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

-- 테이블 springproject.item_ing 구조 내보내기
CREATE TABLE IF NOT EXISTS `item_ing` (
  `itemId` int(10) NOT NULL,
  `ingId` int(11) NOT NULL,
  PRIMARY KEY (`itemId`,`ingId`),
  KEY `FK_ingredient_TO_item_ing_1` (`ingId`),
  CONSTRAINT `FK_ingredient_TO_item_ing_1` FOREIGN KEY (`ingId`) REFERENCES `ingredient` (`ingId`),
  CONSTRAINT `FK_item_TO_item_ing_1` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.item_ing:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `item_ing` DISABLE KEYS */;
INSERT INTO `item_ing` (`itemId`, `ingId`) VALUES
	(33, 1),
	(33, 2),
	(33, 3);
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
  PRIMARY KEY (`optId`),
  KEY `optcl_fk` (`opclId`),
  CONSTRAINT `optcl_fk` FOREIGN KEY (`opclId`) REFERENCES `option_class` (`opclId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.option:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `option` DISABLE KEYS */;
INSERT INTO `option` (`optId`, `opclId`, `optName`, `optPrice`) VALUES
	(0, 1, '11', 0),
	(3, 2, '아이스', 500);
/*!40000 ALTER TABLE `option` ENABLE KEYS */;

-- 테이블 springproject.option_class 구조 내보내기
CREATE TABLE IF NOT EXISTS `option_class` (
  `opclId` int(5) NOT NULL,
  `opclName` varchar(10) NOT NULL,
  PRIMARY KEY (`opclId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.option_class:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `option_class` DISABLE KEYS */;
INSERT INTO `option_class` (`opclId`, `opclName`) VALUES
	(1, '커피'),
	(2, '음료');
/*!40000 ALTER TABLE `option_class` ENABLE KEYS */;

-- 테이블 springproject.order 구조 내보내기
CREATE TABLE IF NOT EXISTS `order` (
  `ordNumber` int(10) NOT NULL,
  `totalPrice` int(7) DEFAULT NULL,
  PRIMARY KEY (`ordNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 springproject.order:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` (`ordNumber`, `totalPrice`) VALUES
	(1, 20),
	(2, NULL);
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

-- 테이블 데이터 springproject.payment:~3 rows (대략적) 내보내기
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
