-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gram_panchayat_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `certification_application`
--

DROP TABLE IF EXISTS `certification_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certification_application` (
  `application_id` int NOT NULL,
  `citizen_id` int NOT NULL,
  `certificate_name` varchar(200) DEFAULT NULL,
  `application_date` date NOT NULL,
  `purpose` varchar(100) DEFAULT NULL,
  `application_status` varchar(20) NOT NULL,
  `fee_paid` decimal(8,2) NOT NULL,
  `reference_number` varchar(30) NOT NULL,
  `issued_date` varchar(20) NOT NULL,
  PRIMARY KEY (`application_id`),
  UNIQUE KEY `reference_number` (`reference_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certification_application`
--

LOCK TABLES `certification_application` WRITE;
/*!40000 ALTER TABLE `certification_application` DISABLE KEYS */;
INSERT INTO `certification_application` VALUES (1001,101,'residance certificate','2026-07-01','bank account documentation','under_review',30.00,'GP20260001',''),(1002,102,'family member','2026-07-02','welfare scheme','appproved',40.00,'GP20260002',''),(1003,103,'property','2026-07-03','property documentation','submitted',50.00,'GP2026003',''),(1004,104,'residance','2026-07-04','college admission','apporved',30.00,'GP20264004',''),(1005,105,'no due','2026-07-09','local service requirement','under review',25.00,'GP2026009','');
/*!40000 ALTER TABLE `certification_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certification_type`
--

DROP TABLE IF EXISTS `certification_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certification_type` (
  `certificate_id` int NOT NULL,
  `certification_name` varchar(200) DEFAULT NULL,
  `discription` varchar(100) NOT NULL,
  `processing_days` int NOT NULL,
  `application_fee` decimal(8,2) NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  PRIMARY KEY (`certificate_id`),
  UNIQUE KEY `certification_id` (`certification_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certification_type`
--

LOCK TABLES `certification_type` WRITE;
/*!40000 ALTER TABLE `certification_type` DISABLE KEYS */;
INSERT INTO `certification_type` VALUES (1,'residance','certifices the declared place of residence',7,30.00,1),(2,'birth','request for a locally maintained birth record',5,20.00,1),(3,'death','request for a locally maintained death record',5,20.00,1),(4,'family','records declared family-mem',10,40.00,1),(5,'property','CErticate related tp locally maintained properly records',12,50.00,1),(6,'no dues','indicatess applicable local dues status',7,25.00,1),(9,'income','income of a household certification',7,20.00,1);
/*!40000 ALTER TABLE `certification_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `citizen`
--

DROP TABLE IF EXISTS `citizen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `citizen` (
  `citizen_id` int NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `mobile_number` varchar(15) NOT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `village_name` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `address` varchar(20) NOT NULL,
  PRIMARY KEY (`citizen_id`),
  UNIQUE KEY `mobile_number` (`mobile_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citizen`
--

LOCK TABLES `citizen` WRITE;
/*!40000 ALTER TABLE `citizen` DISABLE KEYS */;
INSERT INTO `citizen` VALUES (101,'shareef','2007-01-31','male','9014258722','student','kornepadu',1,''),(102,'suneel','2008-06-12','male','6302909534','student','kaamakuru',1,''),(103,'jagadeesh','2006-01-29','male','8142706612','student','mundadugu',0,''),(104,'anjali rao','2000-03-05','female','901425678','electrician','setaputam',1,''),(105,'kumar kiran','2001-01-03','male','8790142579','electrical technician','guntur',0,''),(106,'raghu','2006-08-30','male','8903452380','ias','kaavali',1,'');
/*!40000 ALTER TABLE `citizen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panchayat_office`
--

DROP TABLE IF EXISTS `panchayat_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `panchayat_office` (
  `office_id` int NOT NULL,
  `office_name` varchar(20) NOT NULL,
  `village_name` varchar(20) NOT NULL,
  `pincode` varchar(6) NOT NULL,
  `contact_number` varchar(10) DEFAULT NULL,
  `office_email` varchar(20) DEFAULT NULL,
  `opening_time` time NOT NULL,
  `is_operational` tinyint(1) NOT NULL,
  `closing_time` time NOT NULL,
  PRIMARY KEY (`office_id`),
  UNIQUE KEY `contact_number` (`contact_number`),
  UNIQUE KEY `office_email` (`office_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panchayat_office`
--

LOCK TABLES `panchayat_office` WRITE;
/*!40000 ALTER TABLE `panchayat_office` DISABLE KEYS */;
INSERT INTO `panchayat_office` VALUES (1,'ramapuram','ramapuram','520101','67908767','ramapuram@gamil','09:00:00',1,'00:00:00'),(2,'seethampeta','seethampeta','520103','98765','seethampeta@gamil','09:03:00',1,'00:00:00'),(3,'laksimpuram','laksmipuram','521013','5678909','laksmi@gmail','09:04:00',1,'00:00:00'),(4,'venkatapuram','vekatapuraM','521078','3456789','VENKAPURAM@gmail','09:00:05',1,'00:00:00');
/*!40000 ALTER TABLE `panchayat_office` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-21 15:08:13
