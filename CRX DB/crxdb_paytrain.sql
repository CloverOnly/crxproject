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
-- Table structure for table `paytrain`
--

DROP TABLE IF EXISTS `paytrain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paytrain` (
  `apply_num` int NOT NULL,
  `reservno` int DEFAULT NULL,
  `paid_amount` int DEFAULT NULL,
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
  `approvalDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `refund` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`apply_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paytrain`
--

LOCK TABLES `paytrain` WRITE;
/*!40000 ALTER TABLE `paytrain` DISABLE KEYS */;
INSERT INTO `paytrain` VALUES (686038,305,100,10188,'10C','1호차','행신역','서울역','일반','2024-08-29','KTX',1,0,'405','06:00:00','06:17:00','0시간 17분',8400,0,8400,0,8400,'2024-08-29 17:29:48',NULL);
/*!40000 ALTER TABLE `paytrain` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-29 17:31:44
