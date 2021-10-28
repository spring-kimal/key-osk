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
  `itemindex` int(5) NOT NULL,
  `category` varchar(10) NOT NULL,
  `img` mediumblob NOT NULL,
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 내보낼 데이터가 선택되어 있지 않습니다.

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

-- 내보낼 데이터가 선택되어 있지 않습니다.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
