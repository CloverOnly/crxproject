-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 211.230.242.63    Database: crxdb
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservno` int NOT NULL AUTO_INCREMENT,
  `userid` int DEFAULT NULL,
  `selectedSeats` varchar(255) NOT NULL,
  `hocha` varchar(50) NOT NULL,
  `startname` varchar(100) NOT NULL,
  `endname` varchar(100) NOT NULL,
  `seatType` varchar(50) NOT NULL,
  `startdate` date NOT NULL,
  `trainType` varchar(50) NOT NULL,
  `personnelCount` int NOT NULL,
  `childCount` int NOT NULL,
  `trainno` varchar(50) NOT NULL,
  `depTime` time NOT NULL,
  `arrTime` time NOT NULL,
  `duration` varchar(50) NOT NULL,
  `totalAdultCharge` int DEFAULT NULL,
  `totalChildCharge` int DEFAULT NULL,
  `totalCharge` int DEFAULT NULL,
  `totalDiscount` int DEFAULT NULL,
  `endCharge` int DEFAULT NULL,
  `nowdate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reservno`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (295,10000,'7A','1호차','CRX010000','CRX014445','일반','2024-08-30','CRX',1,0,'1007','11:59:00','12:31:00','00:32:00',4800,0,4800,0,4800,'2024-08-29 16:22:36'),(296,10000,'7A','1호차','CRX010000','CRX014445','일반','2024-08-30','CRX',1,0,'1006','09:04:00','09:28:00','00:24:00',4800,0,4800,0,4800,'2024-08-29 16:26:27'),(297,10188,'5A,5B,6B','1호차','NAT110147','NAT010000','일반','2024-08-29','KTX',3,0,'211','12:26:00','12:43:00','0시간 17분',25200,0,25200,0,25200,'2024-08-29 16:26:32'),(298,10000,'8B,9B','1호차','CRX010000','CRX014445','일반','2024-08-30','CRX',2,0,'1006','09:04:00','09:28:00','00:24:00',9600,0,9600,0,9600,'2024-08-29 16:30:17'),(299,10188,'8A,8B,9A','4호차','NAT110147','NAT010000','일반','2024-08-29','KTX',3,0,'405','06:00:00','06:17:00','0시간 17분',25200,0,25200,0,25200,'2024-08-29 16:31:57'),(300,10188,'4A','1호차','NAT110147','NAT010000','일반','2024-08-29','KTX',1,0,'405','06:00:00','06:17:00','0시간 17분',8400,0,8400,0,8400,'2024-08-29 16:36:07'),(301,10188,'7A','1호차','NAT110147','NAT010000','일반','2024-08-29','KTX',1,0,'405','06:00:00','06:17:00','0시간 17분',8400,0,8400,0,8400,'2024-08-29 16:39:36'),(302,10000,'10D','1호차','CRX010000','CRX014445','일반','2024-08-30','CRX',1,0,'1006','09:04:00','09:28:00','00:24:00',4800,0,4800,0,4800,'2024-08-29 17:01:42'),(303,10188,'8B','1호차','NAT110147','NAT010000','일반','2024-08-29','KTX',1,0,'405','06:00:00','06:17:00','0시간 17분',8400,0,8400,0,8400,'2024-08-29 17:08:06'),(304,10188,'11B','1호차','NAT110147','NAT010000','일반','2024-08-29','KTX',1,0,'405','06:00:00','06:17:00','0시간 17분',8400,0,8400,0,8400,'2024-08-29 17:17:50');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-29 17:31:42
