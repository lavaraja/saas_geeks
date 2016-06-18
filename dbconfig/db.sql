-- --------------------------------------------------------

-- Host:                         localhost

-- Server version:               5.6.28-0ubuntu0.15.04.1 - (Ubuntu)

-- Server OS:                    debian-linux-gnu

-- HeidiSQL Version:             9.3.0.4984

-- --------------------------------------------------------



/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;

/*!40101 SET NAMES utf8mb4 */;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;



-- Dumping database structure for BTSDB

CREATE DATABASE IF NOT EXISTS `BTSDB` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `BTSDB`;





-- Dumping structure for table BTSDB.BUSINFO

CREATE TABLE IF NOT EXISTS `BUSINFO` (

  `bus_no` varchar(10) NOT NULL,

  `st_loc` varchar(45) DEFAULT NULL,

  `end_loc` varchar(45) DEFAULT NULL,

  `return time` varchar(45) DEFAULT NULL,

  `tot_trips` varchar(45) DEFAULT NULL,

  `bus_cur_loc` varchar(45) DEFAULT NULL,

  `bus_id` varchar(45) NOT NULL,

  `tripduration` varchar(45) DEFAULT NULL,

  PRIMARY KEY (`bus_no`,`bus_id`),

  KEY `sec` (`bus_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Dumping data for table BTSDB.BUSINFO: ~0 rows (approximately)

/*!40000 ALTER TABLE `BUSINFO` DISABLE KEYS */;

/*!40000 ALTER TABLE `BUSINFO` ENABLE KEYS */;





-- Dumping structure for table BTSDB.bus_info

CREATE TABLE IF NOT EXISTS `bus_info` (

  `bus_id` varchar(5) DEFAULT NULL,

  `location` varchar(45) DEFAULT NULL,

  `order` varchar(45) DEFAULT NULL,

  `max` varchar(45) DEFAULT NULL,

  `route_id` varchar(45) DEFAULT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Dumping data for table BTSDB.bus_info: ~0 rows (approximately)

/*!40000 ALTER TABLE `bus_info` DISABLE KEYS */;

/*!40000 ALTER TABLE `bus_info` ENABLE KEYS */;





-- Dumping structure for table BTSDB.BUS_ROUTES

CREATE TABLE IF NOT EXISTS `BUS_ROUTES` (

  `bus_id` varchar(45) NOT NULL,

  `route_id` varchar(45) DEFAULT NULL,

  `routes` varchar(100) DEFAULT NULL,

  KEY `bus_id` (`bus_id`),

  CONSTRAINT `BUS_ROUTES_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `BUSINFO` (`bus_id`) ON DELETE NO ACTION ON UPDATE NO ACTION

) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Dumping data for table BTSDB.BUS_ROUTES: ~0 rows (approximately)

/*!40000 ALTER TABLE `BUS_ROUTES` DISABLE KEYS */;

/*!40000 ALTER TABLE `BUS_ROUTES` ENABLE KEYS */;





-- Dumping structure for table BTSDB.USER_REQ_LOG

CREATE TABLE IF NOT EXISTS `USER_REQ_LOG` (

  `req_id` varchar(15) NOT NULL,

  `bus_no` varchar(45) DEFAULT NULL,

  `start_loc` varchar(45) DEFAULT NULL,

  `dest_loc` varchar(45) DEFAULT NULL,

  `date` timestamp NULL DEFAULT NULL,

  PRIMARY KEY (`req_id`),

  KEY `fk_user_req_log_1_idx` (`bus_no`),

  CONSTRAINT `fk_user_req_log_1` FOREIGN KEY (`bus_no`) REFERENCES `BUSINFO` (`bus_no`) ON DELETE NO ACTION ON UPDATE NO ACTION

) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- Dumping data for table BTSDB.USER_REQ_LOG: ~0 rows (approximately)

/*!40000 ALTER TABLE `USER_REQ_LOG` DISABLE KEYS */;

/*!40000 ALTER TABLE `USER_REQ_LOG` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;

/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

