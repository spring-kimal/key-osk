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


-- kimal 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `kimal` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `kimal`;

-- 테이블 kimal.item 구조 내보내기
CREATE TABLE IF NOT EXISTS `item` (
  `itemId` int(10) NOT NULL,
  `itemName` varchar(30) DEFAULT NULL,
  `itemQuantity` int(10) DEFAULT NULL,
  `itemPrice` int(10) DEFAULT NULL,
  `category` int(5) DEFAULT NULL,
  `img` mediumblob NOT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 kimal.item:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

-- 테이블 kimal.payment 구조 내보내기
CREATE TABLE IF NOT EXISTS `payment` (
  `payId` int(10) NOT NULL,
  `itemId` int(10) DEFAULT NULL,
  `Quantity` int(10) DEFAULT NULL,
  `payPrice` int(10) DEFAULT NULL,
  `payTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`payId`),
  KEY `FK_itemid` (`itemId`),
  CONSTRAINT `FK_itemid` FOREIGN KEY (`itemId`) REFERENCES `item` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 kimal.payment:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;

-- 테이블 kimal.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(10) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL DEFAULT '1111',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 kimal.user:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT IGNORE INTO `user` (`id`, `PASSWORD`) VALUES
	('admin', '$2a$10$hP0I0YFej6QbPRwZXbOEQuF/c1f1diKG7RlCE0uQkz/eHBxrSAXzK');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
