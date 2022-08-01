CREATE DATABASE  IF NOT EXISTS `dbproject` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbproject`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbproject
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `accesslevel`
--

DROP TABLE IF EXISTS `accesslevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accesslevel` (
  `Acces_ID` int NOT NULL AUTO_INCREMENT,
  `Access_name` varchar(25) NOT NULL,
  PRIMARY KEY (`Acces_ID`),
  UNIQUE KEY `Access_name` (`Access_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesslevel`
--

LOCK TABLES `accesslevel` WRITE;
/*!40000 ALTER TABLE `accesslevel` DISABLE KEYS */;
INSERT INTO `accesslevel` VALUES (1,'Admin'),(2,'Creator'),(3,'Manager');
/*!40000 ALTER TABLE `accesslevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `belongsto`
--

DROP TABLE IF EXISTS `belongsto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `belongsto` (
  `questionID` int NOT NULL,
  `volumeID` int NOT NULL,
  PRIMARY KEY (`questionID`,`volumeID`),
  KEY `volumeID` (`volumeID`),
  CONSTRAINT `belongsto_ibfk_1` FOREIGN KEY (`questionID`) REFERENCES `question` (`questionID`) ON DELETE CASCADE,
  CONSTRAINT `belongsto_ibfk_2` FOREIGN KEY (`volumeID`) REFERENCES `volume` (`volumeID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `belongsto`
--

LOCK TABLES `belongsto` WRITE;
/*!40000 ALTER TABLE `belongsto` DISABLE KEYS */;
INSERT INTO `belongsto` VALUES (1,1),(4,1),(33,1),(47,1),(49,1),(2,2),(5,2),(34,2),(35,2),(36,2),(46,2),(48,2),(60,2),(3,3),(6,3),(16,3),(37,3),(41,3),(44,3),(45,3),(59,3),(8,4),(9,4),(11,4),(27,4),(28,4),(29,4),(42,4),(43,4),(56,4),(57,4),(58,4),(7,5),(10,5),(12,5),(20,5),(26,5),(30,5),(32,5),(50,5),(13,6),(14,6),(25,6),(31,6),(51,6),(55,6),(15,7),(17,7),(38,7),(52,7),(18,8),(19,8),(21,8),(39,8),(53,8),(54,8),(22,9),(23,9),(24,9),(40,9);
/*!40000 ALTER TABLE `belongsto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `CommentID` int NOT NULL AUTO_INCREMENT,
  `Comment_Text` text NOT NULL,
  `DateOfComment` date NOT NULL,
  `Up_Vote` int NOT NULL DEFAULT '0',
  `Down_Vote` int NOT NULL DEFAULT '0',
  `questionID` int NOT NULL,
  `personID` int DEFAULT NULL,
  PRIMARY KEY (`CommentID`),
  KEY `questionID` (`questionID`),
  KEY `personID` (`personID`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`questionID`) REFERENCES `question` (`questionID`) ON DELETE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`personID`) REFERENCES `user` (`personID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'COMMENT_TEXT','2022-06-10',0,0,1,18),(2,'COMMENT_TEXT','2022-03-19',0,3,1,17),(3,'COMMENT_TEXT','2022-02-02',9,5,1,23),(4,'COMMENT_TEXT','2022-03-24',6,4,1,28),(5,'COMMENT_TEXT','2022-12-01',2,1,2,19),(6,'COMMENT_TEXT','2022-04-10',4,5,2,33),(7,'COMMENT_TEXT','2022-06-09',6,2,2,12),(8,'COMMENT_TEXT','2022-05-26',7,1,2,25),(9,'COMMENT_TEXT','2022-11-26',9,0,3,15),(10,'COMMENT_TEXT','2022-02-07',3,3,3,23),(11,'COMMENT_TEXT','2022-08-11',11,2,3,22),(12,'COMMENT_TEXT','2022-05-12',10,4,4,30),(13,'COMMENT_TEXT','2022-06-05',10,0,4,11),(14,'COMMENT_TEXT','2022-05-27',7,5,4,26),(15,'COMMENT_TEXT','2022-02-01',13,2,4,37),(16,'COMMENT_TEXT','2022-05-21',11,2,4,37),(17,'COMMENT_TEXT','2022-03-11',3,5,5,33),(18,'COMMENT_TEXT','2022-11-04',1,4,5,26),(19,'COMMENT_TEXT','2022-04-20',7,5,5,28),(20,'COMMENT_TEXT','2022-04-01',2,3,5,34),(21,'COMMENT_TEXT','2022-03-06',11,5,6,36),(22,'COMMENT_TEXT','2022-08-05',13,1,7,27),(23,'COMMENT_TEXT','2022-07-01',4,3,7,37),(24,'COMMENT_TEXT','2022-08-14',7,1,7,27),(25,'COMMENT_TEXT','2022-12-18',14,5,8,21),(26,'COMMENT_TEXT','2022-01-17',3,1,8,35),(27,'COMMENT_TEXT','2022-10-06',3,2,8,11),(28,'COMMENT_TEXT','2022-02-05',12,0,8,30),(29,'COMMENT_TEXT','2022-11-14',7,1,9,18),(30,'COMMENT_TEXT','2022-05-28',7,0,10,19),(31,'COMMENT_TEXT','2022-05-05',13,0,11,34),(32,'COMMENT_TEXT','2022-06-27',10,2,11,29),(33,'COMMENT_TEXT','2022-01-01',10,3,11,25),(34,'COMMENT_TEXT','2022-03-20',12,5,12,17),(35,'COMMENT_TEXT','2022-04-16',13,5,12,18),(36,'COMMENT_TEXT','2022-06-14',0,4,12,13),(37,'COMMENT_TEXT','2022-11-22',11,0,12,36),(38,'COMMENT_TEXT','2022-10-26',13,2,13,25),(39,'COMMENT_TEXT','2022-04-28',11,3,13,36),(40,'COMMENT_TEXT','2022-02-12',0,2,13,32),(41,'COMMENT_TEXT','2022-09-28',3,1,13,22),(42,'COMMENT_TEXT','2022-12-06',6,1,13,13),(43,'COMMENT_TEXT','2022-03-14',8,2,13,32),(44,'COMMENT_TEXT','2022-05-08',14,4,14,17),(45,'COMMENT_TEXT','2022-09-27',11,2,14,21),(46,'COMMENT_TEXT','2022-08-02',7,2,14,31),(47,'COMMENT_TEXT','2022-05-23',14,3,14,29),(48,'COMMENT_TEXT','2022-11-12',2,5,14,24),(49,'COMMENT_TEXT','2022-04-23',1,5,15,12),(50,'COMMENT_TEXT','2022-04-28',0,1,16,22),(51,'COMMENT_TEXT','2022-11-28',2,0,16,13),(52,'COMMENT_TEXT','2022-09-20',1,4,16,36),(53,'COMMENT_TEXT','2022-05-05',10,5,16,20),(54,'COMMENT_TEXT','2022-11-15',13,0,17,33),(55,'COMMENT_TEXT','2022-04-15',3,5,18,11),(56,'COMMENT_TEXT','2022-02-22',4,4,18,28),(57,'COMMENT_TEXT','2022-07-22',5,5,18,37),(58,'COMMENT_TEXT','2022-08-04',1,4,18,20),(59,'COMMENT_TEXT','2022-01-14',10,5,18,22),(60,'COMMENT_TEXT','2022-07-17',8,5,18,31),(61,'COMMENT_TEXT','2022-04-05',13,1,19,35),(62,'COMMENT_TEXT','2022-03-18',9,2,19,17),(63,'COMMENT_TEXT','2022-03-02',4,1,19,37),(64,'COMMENT_TEXT','2022-06-06',8,0,20,31),(65,'COMMENT_TEXT','2022-08-12',9,2,20,23),(66,'COMMENT_TEXT','2022-07-23',2,3,20,12),(67,'COMMENT_TEXT','2022-05-01',13,0,20,24),(68,'COMMENT_TEXT','2022-01-26',3,3,20,25),(69,'COMMENT_TEXT','2022-11-11',14,1,21,16),(70,'COMMENT_TEXT','2022-09-03',1,1,21,19),(71,'COMMENT_TEXT','2022-04-02',6,4,21,30),(72,'COMMENT_TEXT','2022-12-21',9,2,22,31),(73,'COMMENT_TEXT','2022-11-20',11,1,23,31),(74,'COMMENT_TEXT','2022-02-19',5,5,23,23),(75,'COMMENT_TEXT','2022-12-07',13,3,24,13),(76,'COMMENT_TEXT','2022-10-20',8,1,24,25),(77,'COMMENT_TEXT','2022-11-10',3,0,25,36),(78,'COMMENT_TEXT','2022-05-13',1,2,25,26),(79,'COMMENT_TEXT','2022-10-24',13,2,25,23),(80,'COMMENT_TEXT','2022-04-18',0,1,25,30),(81,'COMMENT_TEXT','2022-03-27',14,1,25,35),(82,'COMMENT_TEXT','2022-08-27',11,5,25,26),(83,'COMMENT_TEXT','2022-11-16',9,1,26,36),(84,'COMMENT_TEXT','2022-01-01',1,5,27,18),(85,'COMMENT_TEXT','2022-03-24',6,4,28,31),(86,'COMMENT_TEXT','2022-11-03',0,2,28,19),(87,'COMMENT_TEXT','2022-05-25',13,0,28,37),(88,'COMMENT_TEXT','2022-03-21',8,0,28,36),(89,'COMMENT_TEXT','2022-01-07',13,3,28,21),(90,'COMMENT_TEXT','2022-08-15',9,5,28,23),(91,'COMMENT_TEXT','2022-04-07',7,0,29,28),(92,'COMMENT_TEXT','2022-06-13',5,5,29,18),(93,'COMMENT_TEXT','2022-01-03',12,1,29,17),(94,'COMMENT_TEXT','2022-07-20',4,2,29,35),(95,'COMMENT_TEXT','2022-02-18',11,3,30,11),(96,'COMMENT_TEXT','2022-03-18',5,0,31,17),(97,'COMMENT_TEXT','2022-10-10',8,2,31,16),(98,'COMMENT_TEXT','2022-07-07',1,4,31,30),(99,'COMMENT_TEXT','2022-10-08',2,1,31,26),(100,'COMMENT_TEXT','2022-09-18',13,0,31,31),(101,'COMMENT_TEXT','2022-12-21',7,0,31,34),(102,'COMMENT_TEXT','2022-08-22',1,3,32,26),(103,'COMMENT_TEXT','2022-11-16',12,0,32,31),(104,'COMMENT_TEXT','2022-05-25',10,5,32,26),(105,'COMMENT_TEXT','2022-08-15',12,2,32,18),(106,'COMMENT_TEXT','2022-07-14',13,4,32,17),(107,'COMMENT_TEXT','2022-06-13',0,1,33,33),(108,'COMMENT_TEXT','2022-11-10',10,3,33,18),(109,'COMMENT_TEXT','2022-08-16',12,5,33,25),(110,'COMMENT_TEXT','2022-02-08',0,2,34,21),(111,'COMMENT_TEXT','2022-01-04',10,0,34,23),(112,'COMMENT_TEXT','2022-05-07',8,4,34,12),(113,'COMMENT_TEXT','2022-05-18',10,4,35,33),(114,'COMMENT_TEXT','2022-07-04',6,0,35,32),(115,'COMMENT_TEXT','2022-10-03',6,3,35,34),(116,'COMMENT_TEXT','2022-01-13',14,1,35,36),(117,'COMMENT_TEXT','2022-01-10',9,2,35,31),(118,'COMMENT_TEXT','2022-11-06',9,3,35,34),(119,'COMMENT_TEXT','2022-02-10',11,4,36,17),(120,'COMMENT_TEXT','2022-02-08',14,4,36,14),(121,'COMMENT_TEXT','2022-09-09',8,4,36,28),(122,'COMMENT_TEXT','2022-09-17',6,5,36,36),(123,'COMMENT_TEXT','2022-08-26',6,2,36,14),(124,'COMMENT_TEXT','2022-10-19',8,1,36,33),(125,'COMMENT_TEXT','2022-04-19',1,0,37,34),(126,'COMMENT_TEXT','2022-06-13',2,4,37,31),(127,'COMMENT_TEXT','2022-08-03',0,3,37,28),(128,'COMMENT_TEXT','2022-02-06',8,4,37,24),(129,'COMMENT_TEXT','2022-09-11',11,0,37,14),(130,'COMMENT_TEXT','2022-08-19',8,3,37,25),(131,'COMMENT_TEXT','2022-06-09',4,0,38,19),(132,'COMMENT_TEXT','2022-03-24',3,4,38,12),(133,'COMMENT_TEXT','2022-06-16',13,5,38,35),(134,'COMMENT_TEXT','2022-08-09',11,2,38,30),(135,'COMMENT_TEXT','2022-08-15',1,2,39,18),(136,'COMMENT_TEXT','2022-08-23',8,3,39,20),(137,'COMMENT_TEXT','2022-06-27',8,3,40,19),(138,'COMMENT_TEXT','2022-02-14',11,5,40,32),(139,'COMMENT_TEXT','2022-12-18',14,4,40,22),(140,'COMMENT_TEXT','2022-06-26',6,0,40,35),(141,'COMMENT_TEXT','2022-05-09',7,2,40,16),(142,'COMMENT_TEXT','2022-08-02',12,0,41,17),(143,'COMMENT_TEXT','2022-01-10',14,0,41,30),(144,'COMMENT_TEXT','2022-02-23',3,3,42,25),(145,'COMMENT_TEXT','2022-05-01',0,1,42,20),(146,'COMMENT_TEXT','2022-01-20',10,3,42,19),(147,'COMMENT_TEXT','2022-07-06',12,2,42,20),(148,'COMMENT_TEXT','2022-04-21',9,0,42,19),(149,'COMMENT_TEXT','2022-05-21',14,4,42,23),(150,'COMMENT_TEXT','2022-02-05',0,0,43,12),(151,'COMMENT_TEXT','2022-04-19',8,0,43,17),(152,'COMMENT_TEXT','2022-08-23',3,4,43,25),(153,'COMMENT_TEXT','2022-04-22',3,2,44,34),(154,'COMMENT_TEXT','2022-01-18',4,4,44,31),(155,'COMMENT_TEXT','2022-07-26',14,4,44,27),(156,'COMMENT_TEXT','2022-09-01',10,5,44,19),(157,'COMMENT_TEXT','2022-10-01',10,0,45,23),(158,'COMMENT_TEXT','2022-05-26',10,0,45,18),(159,'COMMENT_TEXT','2022-10-03',5,2,45,11),(160,'COMMENT_TEXT','2022-03-04',1,3,45,36),(161,'COMMENT_TEXT','2022-10-10',4,2,45,27),(162,'COMMENT_TEXT','2022-09-05',8,3,45,11),(163,'COMMENT_TEXT','2022-03-16',9,1,46,18),(164,'COMMENT_TEXT','2022-02-02',4,1,47,30),(165,'COMMENT_TEXT','2022-12-11',7,2,47,15),(166,'COMMENT_TEXT','2022-07-16',9,3,47,18),(167,'COMMENT_TEXT','2022-04-26',14,5,47,27),(168,'COMMENT_TEXT','2022-01-24',1,0,47,37),(169,'COMMENT_TEXT','2022-12-21',9,3,47,17),(170,'COMMENT_TEXT','2022-05-23',2,4,48,16),(171,'COMMENT_TEXT','2022-06-02',2,4,49,20),(172,'COMMENT_TEXT','2022-01-06',14,1,50,17),(173,'COMMENT_TEXT','2022-08-02',2,5,50,14),(174,'COMMENT_TEXT','2022-07-23',9,0,50,36),(175,'COMMENT_TEXT','2022-04-09',4,3,50,31),(176,'COMMENT_TEXT','2022-10-05',14,5,50,34),(177,'COMMENT_TEXT','2022-11-02',14,5,50,30),(178,'COMMENT_TEXT','2022-12-13',9,3,51,22),(179,'COMMENT_TEXT','2022-02-01',8,4,51,13),(180,'COMMENT_TEXT','2022-02-11',10,0,52,26),(181,'COMMENT_TEXT','2022-07-06',14,1,52,19),(182,'COMMENT_TEXT','2022-10-14',14,4,52,22),(183,'COMMENT_TEXT','2022-09-28',1,4,53,18),(184,'COMMENT_TEXT','2022-09-14',10,4,53,22),(185,'COMMENT_TEXT','2022-12-08',9,4,53,32),(186,'COMMENT_TEXT','2022-04-07',1,3,54,14),(187,'COMMENT_TEXT','2022-09-15',11,4,54,16),(188,'COMMENT_TEXT','2022-01-11',8,4,54,31),(189,'COMMENT_TEXT','2022-04-05',14,1,54,11),(190,'COMMENT_TEXT','2022-04-17',14,3,55,25),(191,'COMMENT_TEXT','2022-02-16',1,2,55,23),(192,'COMMENT_TEXT','2022-10-19',8,5,55,31),(193,'COMMENT_TEXT','2022-07-01',10,2,55,29),(194,'COMMENT_TEXT','2022-02-02',6,1,56,18),(195,'COMMENT_TEXT','2022-09-11',6,3,56,34),(196,'COMMENT_TEXT','2022-02-25',1,3,56,25),(197,'COMMENT_TEXT','2022-02-27',2,2,57,35),(198,'COMMENT_TEXT','2022-09-23',0,0,57,33),(199,'COMMENT_TEXT','2022-12-23',4,0,57,22),(200,'COMMENT_TEXT','2022-03-21',2,1,58,11),(201,'COMMENT_TEXT','2022-12-10',13,1,58,24),(202,'COMMENT_TEXT','2022-06-26',5,0,59,15),(203,'COMMENT_TEXT','2022-08-14',1,1,59,16),(204,'COMMENT_TEXT','2022-02-19',6,0,59,14),(205,'COMMENT_TEXT','2022-01-15',10,3,59,14),(206,'COMMENT_TEXT','2022-09-16',4,3,59,28),(207,'COMMENT_TEXT','2022-06-07',13,4,60,30),(208,'COMMENT_TEXT','2022-03-10',11,1,60,28),(209,'COMMENT_TEXT','2022-01-24',4,0,60,22),(210,'COMMENT_TEXT','2022-08-09',5,4,60,16),(211,'COMMENT_TEXT','2022-07-05',5,5,60,13),(212,'COMMENT_TEXT','2022-07-27',11,0,60,12);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contains` (
  `questionID` int NOT NULL,
  `ContestID` int NOT NULL,
  PRIMARY KEY (`questionID`,`ContestID`),
  KEY `ContestID` (`ContestID`),
  CONSTRAINT `contains_ibfk_1` FOREIGN KEY (`questionID`) REFERENCES `question` (`questionID`) ON DELETE CASCADE,
  CONSTRAINT `contains_ibfk_2` FOREIGN KEY (`ContestID`) REFERENCES `contest` (`ContestID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contains`
--

LOCK TABLES `contains` WRITE;
/*!40000 ALTER TABLE `contains` DISABLE KEYS */;
INSERT INTO `contains` VALUES (1,1),(4,1),(9,1),(11,1),(15,1),(17,1),(21,1),(24,1),(37,1),(40,1),(42,1),(43,1),(47,1),(49,1),(59,1),(4,2),(7,2),(8,2),(9,2),(11,2),(17,2),(20,2),(21,2),(22,2),(30,2),(31,2),(34,2),(49,2),(51,2),(58,2),(7,3),(8,3),(10,3),(13,3),(18,3),(19,3),(21,3),(27,3),(29,3),(34,3),(45,3),(48,3),(51,3),(53,3),(58,3),(2,4),(7,4),(9,4),(11,4),(15,4),(29,4),(32,4),(38,4),(39,4),(40,4),(43,4),(44,4),(49,4),(55,4),(59,4);
/*!40000 ALTER TABLE `contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contest`
--

DROP TABLE IF EXISTS `contest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contest` (
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `ContestID` int NOT NULL AUTO_INCREMENT,
  `ContestDescription` text NOT NULL,
  PRIMARY KEY (`ContestID`),
  CONSTRAINT `contest_chk_1` CHECK ((`StartDate` < `EndDate`))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contest`
--

LOCK TABLES `contest` WRITE;
/*!40000 ALTER TABLE `contest` DISABLE KEYS */;
INSERT INTO `contest` VALUES ('2021-09-15','2022-10-17',1,'Smart Solutions'),('2021-10-01','2021-11-20',2,'Conquer Data Structures'),('2021-12-10','2021-12-20',3,'Fast coding challenge'),('2021-12-10','2022-12-15',4,'Capture the flag');
/*!40000 ALTER TABLE `contest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `errors_type`
--

DROP TABLE IF EXISTS `errors_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `errors_type` (
  `errorID` int NOT NULL AUTO_INCREMENT,
  `errorType` varchar(50) NOT NULL,
  PRIMARY KEY (`errorID`),
  UNIQUE KEY `errorType` (`errorType`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `errors_type`
--

LOCK TABLES `errors_type` WRITE;
/*!40000 ALTER TABLE `errors_type` DISABLE KEYS */;
INSERT INTO `errors_type` VALUES (4,'Compilation error'),(3,'Logic error'),(1,'Runtime error'),(5,'Space Limit reached error'),(2,'Syntax error'),(6,'Time Limit reached error');
/*!40000 ALTER TABLE `errors_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isof`
--

DROP TABLE IF EXISTS `isof`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `isof` (
  `languageID` int NOT NULL,
  `questionID` int NOT NULL,
  PRIMARY KEY (`languageID`,`questionID`),
  KEY `questionID` (`questionID`),
  CONSTRAINT `isof_ibfk_1` FOREIGN KEY (`languageID`) REFERENCES `programming_language` (`languageID`) ON DELETE CASCADE,
  CONSTRAINT `isof_ibfk_2` FOREIGN KEY (`questionID`) REFERENCES `question` (`questionID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isof`
--

LOCK TABLES `isof` WRITE;
/*!40000 ALTER TABLE `isof` DISABLE KEYS */;
INSERT INTO `isof` VALUES (5,1),(7,1),(5,2),(6,2),(6,3),(7,3),(7,4),(8,4),(4,5),(8,5),(4,6),(5,6),(3,7),(5,7),(3,8),(8,8),(4,9),(8,9),(5,10),(6,10),(3,11),(8,11),(4,12),(5,12),(3,13),(6,13),(5,14),(7,14),(1,15),(7,15),(4,16),(8,16),(1,17),(3,17),(4,18),(8,18),(1,19),(3,19),(5,20),(7,20),(1,21),(2,21),(2,22),(4,22),(5,23),(6,23),(1,24),(5,24),(4,25),(6,25),(4,26),(6,26),(4,27),(7,27),(7,28),(8,28),(2,29),(4,29),(3,30),(8,30),(2,31),(6,31),(1,32),(3,32),(2,33),(8,33),(1,34),(3,34),(1,35),(6,35),(2,36),(3,36),(3,37),(8,37),(1,38),(8,38),(2,39),(4,39),(2,40),(8,40),(3,41),(6,41),(2,42),(5,42),(6,43),(7,43),(1,44),(5,44),(3,45),(6,45),(1,46),(2,46),(1,47),(8,47),(4,48),(5,48),(2,49),(3,49),(5,50),(7,50),(6,51),(8,51),(3,52),(6,52),(3,53),(6,53),(3,54),(6,54),(3,55),(7,55),(1,56),(5,56),(2,57),(5,57),(4,58),(7,58),(3,59),(5,59),(8,59),(2,60),(7,60);
/*!40000 ALTER TABLE `isof` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `level` (
  `Title` varchar(50) NOT NULL,
  `LevelD` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`LevelD`),
  UNIQUE KEY `Title` (`Title`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES ('easy',1),('expert',4),('hard',3),('Intermediate',2);
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participatesin`
--

DROP TABLE IF EXISTS `participatesin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participatesin` (
  `ContestID` int NOT NULL,
  `personID` int NOT NULL,
  `StartTOCompetDate` date NOT NULL,
  PRIMARY KEY (`ContestID`,`personID`),
  KEY `personID` (`personID`),
  CONSTRAINT `participatesin_ibfk_1` FOREIGN KEY (`ContestID`) REFERENCES `contest` (`ContestID`) ON DELETE CASCADE,
  CONSTRAINT `participatesin_ibfk_2` FOREIGN KEY (`personID`) REFERENCES `user` (`personID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participatesin`
--

LOCK TABLES `participatesin` WRITE;
/*!40000 ALTER TABLE `participatesin` DISABLE KEYS */;
INSERT INTO `participatesin` VALUES (1,11,'2021-09-22'),(1,13,'2021-10-02'),(1,17,'2021-09-30'),(1,22,'2021-10-02'),(2,11,'2021-11-10'),(2,14,'2021-10-03'),(2,17,'2021-10-20'),(3,11,'2021-12-15'),(3,17,'2021-12-10'),(3,19,'2021-12-10'),(3,20,'2021-12-11'),(4,11,'2021-12-10'),(4,19,'2021-12-10'),(4,24,'2021-12-12'),(4,30,'2021-12-11');
/*!40000 ALTER TABLE `participatesin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password`
--

DROP TABLE IF EXISTS `password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password` (
  `Hash` varchar(64) NOT NULL,
  `Salt` varchar(16) NOT NULL,
  `personID` int NOT NULL,
  PRIMARY KEY (`personID`),
  CONSTRAINT `password_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password`
--

LOCK TABLES `password` WRITE;
/*!40000 ALTER TABLE `password` DISABLE KEYS */;
INSERT INTO `password` VALUES ('65CEAAB8D57F80D734E21814B0DEDB390CDE1C32063AFC88EA0298D4BA59F01E','VDgzzjkTdgAhZDcf',1),('12574DA7B292DB615A09A765332B57AD1BCF96B4E440CF7E778C7C815E5E74AA','h4x72d5JFqfeeBAQ',2),('EDEAAFF3F1774AD2888673770C6D64097E391BC362D7D6FB34982DDF0EFD18CB','96XsDVWsgAWG98l4',3),('24D4B96F58DA6D4A8512313BBD02A28EBF0CA95DEC6E4C86EF78CE7F01E788AC','10hV9jIxcVbM8eRm',4),('66105AACE95F66D503EF310D64D512F6B2C9C4B55525430B0885DAB8DA31F5C0','NvI51vNFodZHe7tq',5),('DF17D6D87D8ED3695FD9F77970E8E3657F649E439611D0E12B044BDFD255181A','d2Udm0JdqeAvJU1x',6),('6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B','Jn7hrC0zarfSjYi1',7),('6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B','W2vvMSGREUDQmHt5',8),('3C6EFB268BDE2923E4F7CBC086995F6158A606E66DF45E307829E6B28F7AAF0E','32SHxWPOhu7V5F62',9),('6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B','PJuMeU8Kg4m8wN07',10),('B3AD1249849EF065FFBA04CDC47100FDC6D11A0F9C92E932B7BAFF832ED95B52','UoutKXuVrnf1B7q0',11),('6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B','cBzBmvtJYkxEreKZ',12),('6343697FA9E855C124BF78BF61447036CE31E847745EEE1C5F4895839C426729','fU1L87vGyTag06hW',13),('6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B','uTOm7CUOPCf3xaZa',14),('6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B','wFXoSqH2HqPMjrPy',15),('6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B','EROWN2cUaprmBtWj',16),('6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B','DWCN9s4FnaKqPca2',17),('6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B','bzjjXQ72HuRWt7PC',18),('6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B','QU3n21ZZ3wGsILcN',19),('6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B','BqYzlZ9gqeqxHS29',20),('6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B','iuygF30lNCmuBa3W',21),('98FA4D59C08E5E3B611DA495C95FCD6473E3AB4D10314BDF3B084CF194DD41C3','ZzPpyi5FJ9blEIeF',22),('6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B','1sU9WcBXltgMlFLt',23),('BA26BB4AC5186376AACB07B162F514D0F1328E74E96FA67BB7EACE78F6E93061','GLOsJrwh6QLkjaUb',24),('F780F44E320A7ACF220274B7E5CFEDA21CEB043E31C4792C79F2FBA8A74E5FB8','jYNTEa34RCTzOL8m',25),('78DA4A596A88BC5114F071BA590793BF3B37329D761230F33129983A747F414E','2bHcvFPEqYdUn5xh',26),('F66CC33674EB9C7E13C5026866125BD0E734545479D197873C1A3EB40B43CF08','sWUJCohru48himLl',27),('046DBA443BF39DC2AB25A6BE2A224D20D7289A41BF192195B72B6E4D28558BB4','ZmcisUD9HLpUi94d',28),('6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B','w5jcHHrjFQETjo4n',29),('6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B','DQ0incMj2ESV8O7n',30),('5893E2EE9405A8118D09DC0841603FC12F75E2570CB49040947F38C77445BAB9','uXAJUwskNgH0hlIn',31),('6B8AFA3EA76EE20468CE80511799B88F1B73C89699D84F7496FF1E73006CF13B','A5MOg83UjTbpBr6x',32),('A7A996AC41C140C08CAE10543AB58F06124BFB966267852D4A7167530C3B31A2','C2uOSKcIStXNEOrO',33),('5A9E67380ADF22A6D0766B17FD607C4BE780A50333AEBEB2471538B464148E90','MWAR8lLUpi7dwWfL',34),('5FBF4735B690DCC73405392859EF01E9CF94405C2545F20FB270FD01A6A152C7','0I96oPIYzOR6l1c5',35),('5FBF4735B690DCC73405392859EF01E9CF94405C2545F20FB270FD01A6A152C7','ziBJwCExspkFfzvr',36),('5FBF4735B690DCC73405392859EF01E9CF94405C2545F20FB270FD01A6A152C7','LqsPcXUUHo1jDk7F',37);
/*!40000 ALTER TABLE `password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `personID` int NOT NULL AUTO_INCREMENT,
  `birthday` date NOT NULL,
  `fname` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(25) NOT NULL,
  `Gender` char(1) NOT NULL,
  `regionID` int NOT NULL,
  PRIMARY KEY (`personID`),
  UNIQUE KEY `username` (`username`),
  KEY `regionID` (`regionID`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`regionID`) REFERENCES `region` (`regionID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `person_chk_1` CHECK ((`Gender` in (_utf8mb4'M',_utf8mb4'F')))
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'2000-01-02','Kevin','Kollcaku','kkollcaku20@epoka.edu.al','KingKevin','M',1),(2,'2002-07-31','Joana','Jaupi','jjaupi20@epoka.edu.al','jjaupi20','F',1),(3,'2001-04-06','Jack','Sparrow','jackk@disney.com','captain21','M',3),(4,'2000-11-21','Rafaela','Gjoshe','rgjoshe20@epoka.edu.al','rgjoshe','F',1),(5,'1999-10-10','Bruno','Bajo','bbajo21@epoka.edu.al','b_bajo21','M',1),(6,'2002-01-21','Mirsada','Halili','mhalili21@epoka.edu.al','m.halili 21','F',1),(7,'1998-10-10','John','Doe','jdoe19@epoka.edu.al','jdoe','M',1),(8,'2000-07-06','Tomas','Wilson','TomeWilson@gmail.com','Tomas3','M',1),(9,'2001-04-06','Johnny','Depp','jdepp@disney.com','johny21','M',3),(10,'1999-07-13','Katerina','Grauber','kgrauber@gmail.com','kate1','F',12),(11,'1980-04-06','Amber','Heard','aHeard@gmail.com','Liar','F',10),(12,'1979-01-31','James','Steward','jSt@yahoo.com','James','M',20),(13,'2001-04-06','Robert','Pattinson','rpat12@gmail.com','rPatt','M',21),(14,'2000-05-06','Michael','Smith','msmith@gmail.com','michael_1','M',22),(15,'2001-07-06','Mattew','Miller','mmiller@gmail.com','miller.m','M',4),(16,'2001-02-03','Chars','Thomas','cthomas1@gmail.com','chars.s','M',5),(17,'2001-01-01','Mary','Lee','leem12@gmail.com','lee_mary','F',6),(18,'2001-01-03','Linda','Harrison','lindah15@gmail.com','lindah1','F',7),(19,'1976-08-05','Susan','Smith','ssmith1976@gmail.com','susans.s','F',8),(20,'1999-10-11','Jessica','Jones','jjones@gmail.com','jessica.j','F',8),(21,'2000-11-12','Jessica','Taylor','taylorj@gmail.com','taylor.j','F',8),(22,'2006-11-22','Emily','Johnson','emilyj6@gmail.com','emily.12','F',19),(23,'1999-04-15','Melisa','White','melisaw@gmail.com','melisaw.9','F',20),(24,'2000-09-18','Melisa','Rodrigues','rmelisa@gmail.com','melissa_rodrigues','F',1),(25,'2002-03-03','Melisa','Harris','harrism1@gmail.com','harrismelisa_m','F',1),(26,'2001-04-20','Laura','Depp','ldepp8@gmail.com','laurad2','F',4),(27,'1998-06-13','Emma','Brown','emma1brown@gmail.com','emmaB.2','F',4),(28,'2003-05-27','Helen','Evans','hevans@gmail.com','helene','F',1),(29,'2002-01-15','Diane','Robinson','dianer9@gmail.com','diane.robinson','F',10),(30,'2001-03-11','Diane','Green','green7@gmail.com','green_diane','F',12),(31,'1999-07-03','Diane','Lewis','lewisd23@gmail.com','lewisd','F',20),(32,'2003-02-18','Julie','Jackson','julie4j@gmail.com','juliej4','F',20),(33,'2001-02-14','Kyle','Clarke','kylec2@gmail.com','kylec15','F',21),(34,'1998-11-19','Robert','Wood','woodr0@gmail.com','robert.w','F',12),(35,'1999-09-25','John','Hughes','jhughes@gmail.com','johnh8','M',5),(36,'2001-10-18','Michael','Walker','walkerm21@gmail.com','walkermichael','F',6),(37,'2000-01-31','Robert','Depp','robertd31@gmail.com','roberto.d31','F',5);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programming_language`
--

DROP TABLE IF EXISTS `programming_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programming_language` (
  `languageID` int NOT NULL AUTO_INCREMENT,
  `languageName` varchar(50) NOT NULL,
  PRIMARY KEY (`languageID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programming_language`
--

LOCK TABLES `programming_language` WRITE;
/*!40000 ALTER TABLE `programming_language` DISABLE KEYS */;
INSERT INTO `programming_language` VALUES (1,'Python'),(2,'Java'),(3,'C++'),(4,'C'),(5,'C#'),(6,'Kotlin'),(7,'JavaScript'),(8,'Swift');
/*!40000 ALTER TABLE `programming_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `QuestionTitle` varchar(256) NOT NULL,
  `QuestionDescription` text NOT NULL,
  `questionID` int NOT NULL AUTO_INCREMENT,
  `Number_of_views` int NOT NULL DEFAULT '0',
  `DateOfQuestionWritten` date NOT NULL,
  `LevelD` int DEFAULT NULL,
  `personID` int DEFAULT NULL,
  PRIMARY KEY (`questionID`),
  KEY `LevelD` (`LevelD`),
  KEY `personID` (`personID`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`LevelD`) REFERENCES `level` (`LevelD`) ON DELETE SET NULL,
  CONSTRAINT `question_ibfk_2` FOREIGN KEY (`personID`) REFERENCES `staff` (`personID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('Biggest Value ','FInd biggest value in the list of integers',1,10,'2020-10-07',1,2),('Ascending Order','Order the given list in ascending order',2,30,'2022-01-07',1,8),('Hot Potato ','Hot potato question ',3,20,'2021-12-12',2,2),('Capture the flag','Capture the flag',4,30,'2021-04-20',3,8),('Traverse','Traverse Binary Tree',5,40,'2020-07-01',2,8),('Median of Two Sorted Arrays','Find the Median of Two Sorted Arrays',6,70,'2020-04-18',2,8),('REGEX','Regular Expression Matching',7,24,'2020-03-18',3,1),('Remove a node','Remove Nth Node From End of List',8,36,'2020-11-21',4,2),('Parenthesis','Generate Parentheses',9,100,'2020-07-13',3,3),('Merge Sorted','Merge k Sorted Lists',10,41,'2020-12-21',4,4),('Division','Divide Two Integers',11,62,'2020-07-01',1,1),('Searching','Search in Rotated Sorted Array',12,18,'2020-04-17',3,8),('Palindromic Substring','Find the Longest Palindromic Substring',13,49,'2020-08-02',1,8),('Addition','Add Two Numbers',14,150,'2020-07-02',1,3),('Conversion from Roman','Convert roman to Integer',15,69,'2020-06-01',1,4),('Post-Fix','Read a post fix expression and find the result.',16,33,'2020-09-04',3,8),('Donors','Show the list of the top N donors.',17,40,'2020-07-01',3,1),('Balanced parentheses','Check if the parenthesis in an expression is balanced or not',18,20,'2020-04-12',4,1),('Ticket Time','Calculate the min. total time for all the people to buy tickets',19,48,'2020-01-29',3,2),('Most Sold Items','Read the stock information and, show the most sold top m items.',20,62,'2020-07-30',2,8),('Sum of Leaf Nodes','Calculate the sum of the leaf node values of a BST',21,31,'2020-08-01',4,3),('Weighted average','Calculate the weighted average of the grades',22,74,'2020-07-22',1,5),('N letter','Print out a big N letter made of N characters',23,103,'2020-11-11',1,5),('Remove Duplicates','Remove Duplicates from Sorted Array',24,59,'2020-04-07',2,5),('Decimal form of numbers','Convert the given number in decimal form',25,41,'2020-12-15',1,5),(' Numbers from m to n','Write a program that shows the numbers from m to n with the steps k',26,60,'2020-07-05',3,1),('Summator','Calculate sum of the numbers from a to b with the steps of k.',27,150,'2020-03-01',2,8),('Show odd numbers between n and m.','giving the range form 4 to 100, print all the odd number.',28,91,'2020-07-01',3,4),('Area finder','Given the dimensions, find the sum of areas',29,70,'2020-01-02',2,8),('Divisible numbers','Show numbers divisible from 1 to N.',30,23,'2020-02-16',1,8),('Square drawer','Draw a square with size N with stars (*).',31,16,'2020-07-11',1,7),('Calculate the mass of a molecule','Given the number of protons, electrons and neutrons and also their respective mass calculate the mass of the atom',32,40,'2020-03-11',2,7),('Profit evaluation','Choose the most profitable share according to equity values',33,20,'2020-08-09',4,6),('AVL tree','Write the methods for AVL tree rotation',34,30,'2020-05-01',4,6),('Payed amount of a product.','Read nr of passengers and price. Show the amount payed total',35,36,'2020-02-22',2,3),('Calculator','Create a caluclator program. Given N operations output their result.',36,34,'2020-07-17',4,6),('Pythagorean triplets','Show the number of pythagorean triplets up to N.',37,42,'2020-02-14',4,9),('highest and lowest salary','Show the employees who have received the highest and lowest salaries',38,60,'2020-07-17',3,9),('nth digit','Show nth digit of a given number.',39,24,'2020-04-29',3,10),('space occupied','Show the total space occupied.',40,50,'2020-01-12',2,10),('Euclidean Distance','Show the max euclidean distance between 2 islands.',41,19,'2020-09-27',4,6),('Divisible by 11','Show if given num is divisible by 11 checking sum of digits',42,30,'2020-11-07',2,10),('comet stay/go','Determine if the comet should stay or go',43,29,'2020-01-27',4,7),('0s Border','Create a border with 0s around a matrix.',44,20,'2020-12-25',2,9),('Multiplier','Multiply a number with 1-10. Show counter of num with all digits different',45,36,'2020-06-01',3,8),('bitonic sequence','Compute the length of the longest bitonic sequence.',46,50,'2020-05-30',4,5),('Encryption ','Encrypt a password entered by a user',47,50,'2020-07-01',4,6),('Pizzashop','Calculate the daily balance for a pizza shop',48,40,'2020-10-10',1,9),('Decryption','Decrypt the given text.',49,48,'2020-10-21',4,10),('Pascal triangle','Show n-th row, r-th element of pascal triangle',50,46,'2020-07-01',2,6),('Number of floors','Calculate the total number of floors that the elevator has traveled',51,13,'2020-07-01',3,8),('Numbers with closest difference ','Print the two numbers whose difference is the closest',52,62,'2020-07-01',1,5),('KMap letter finder','Find which letter A,B,C or D is different in Modified Karnaugh-Map',53,32,'2020-07-01',4,7),('Wait time for a client','Calculate the waiting time for a new client',54,28,'2020-07-01',1,7),('From Dec to Binary','Convert the number into binary form',55,24,'2020-07-01',3,9),('Inner Product','Find the inner product of the given sequence',56,16,'2020-07-01',4,4),('Word Location','Given a grid of letters, find the location of the words',57,29,'2020-07-01',4,2),('Censor 4 letter word','Censor all the 4-letter words',58,61,'2020-07-01',2,1),('Find the sum of k-th diagonal','Given a matrix. Find the sum of the k-th diagonal',59,45,'2020-07-09',2,1),('Parallel Line','Show the number of parallel line segments ',60,11,'2020-08-09',4,7);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranks`
--

DROP TABLE IF EXISTS `ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ranks` (
  `rankID` int NOT NULL AUTO_INCREMENT,
  `rankName` varchar(25) NOT NULL DEFAULT 'Default',
  PRIMARY KEY (`rankID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranks`
--

LOCK TABLES `ranks` WRITE;
/*!40000 ALTER TABLE `ranks` DISABLE KEYS */;
INSERT INTO `ranks` VALUES (1,'Beginner Programmer'),(2,'Novice Programmer'),(3,'Junior Programmer'),(4,'Assistant Programmer'),(5,'Programmer'),(6,'Advanced Programmer'),(7,'Senior Programmer');
/*!40000 ALTER TABLE `ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `regionID` int NOT NULL AUTO_INCREMENT,
  `regionName` varchar(50) NOT NULL DEFAULT 'Unspecified',
  PRIMARY KEY (`regionID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'Albania'),(2,'Austria'),(3,'Belgium'),(4,'Brazil'),(5,'Bangladesh'),(6,'Bulgaria'),(7,'China'),(8,'Croatia'),(10,'Denmark'),(11,'Egypt'),(12,'Ethiopia'),(13,'Finland'),(14,'France'),(15,'Germany'),(16,'Greece'),(17,'Hungary'),(18,'India'),(19,'Indonesia'),(20,'Iran'),(21,'Iraq'),(22,'Israel'),(23,'Italy'),(24,'Japan'),(25,'Jamaica'),(26,'Kenya');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `Institution` varchar(50) NOT NULL,
  `personID` int NOT NULL,
  `Acces_ID` int DEFAULT NULL,
  PRIMARY KEY (`personID`),
  KEY `Acces_ID` (`Acces_ID`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`) ON DELETE CASCADE,
  CONSTRAINT `staff_ibfk_2` FOREIGN KEY (`Acces_ID`) REFERENCES `accesslevel` (`Acces_ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('EPOKA',1,1),('EPOKA',2,1),('EPOKA',3,1),('EPOKA',4,1),('EPOKA',5,2),('EPOKA',6,2),('EPOKA',7,2),('EPOKA',8,3),('EPOKA',9,3),('EPOKA',10,3);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submission`
--

DROP TABLE IF EXISTS `submission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submission` (
  `dateOfSubmission` date NOT NULL,
  `userAnswer` text NOT NULL,
  `successOrNot` tinyint(1) NOT NULL,
  `questionID` int NOT NULL,
  `errorID` int DEFAULT NULL,
  `personID` int NOT NULL,
  `languageID` int DEFAULT NULL,
  PRIMARY KEY (`questionID`,`personID`,`dateOfSubmission`),
  KEY `errorID` (`errorID`),
  KEY `personID` (`personID`),
  KEY `languageID` (`languageID`),
  CONSTRAINT `submission_ibfk_1` FOREIGN KEY (`questionID`) REFERENCES `question` (`questionID`) ON DELETE CASCADE,
  CONSTRAINT `submission_ibfk_2` FOREIGN KEY (`errorID`) REFERENCES `errors_type` (`errorID`),
  CONSTRAINT `submission_ibfk_3` FOREIGN KEY (`personID`) REFERENCES `user` (`personID`) ON DELETE CASCADE,
  CONSTRAINT `submission_ibfk_4` FOREIGN KEY (`languageID`) REFERENCES `programming_language` (`languageID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submission`
--

LOCK TABLES `submission` WRITE;
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
INSERT INTO `submission` VALUES ('2022-06-11','USER_RESPONSE',0,1,1,28,5),('2022-10-23','USER_RESPONSE',0,2,3,27,6),('2022-01-01','USER_RESPONSE',0,2,2,32,3),('2022-01-19','USER_RESPONSE',1,3,NULL,12,2),('2022-01-02','USER_RESPONSE',1,4,NULL,11,1),('2022-10-08','USER_RESPONSE',1,4,NULL,14,2),('2022-09-02','USER_RESPONSE',0,4,1,27,8),('2022-02-24','USER_RESPONSE',1,5,NULL,14,1),('2022-09-10','USER_RESPONSE',0,5,3,35,4),('2022-03-05','USER_RESPONSE',0,6,4,13,4),('2022-04-12','USER_RESPONSE',1,6,NULL,22,1),('2022-02-17','USER_RESPONSE',1,6,NULL,36,7),('2022-05-04','USER_RESPONSE',0,7,2,15,5),('2022-03-25','USER_RESPONSE',1,7,NULL,22,2),('2022-06-22','USER_RESPONSE',1,7,NULL,31,5),('2022-03-16','USER_RESPONSE',0,7,4,34,4),('2022-03-26','USER_RESPONSE',1,8,NULL,11,7),('2022-02-18','USER_RESPONSE',0,8,3,12,6),('2022-05-04','USER_RESPONSE',0,8,3,18,2),('2022-11-06','USER_RESPONSE',0,8,1,23,4),('2022-12-23','USER_RESPONSE',0,9,6,18,3),('2022-11-26','USER_RESPONSE',1,9,NULL,22,2),('2022-06-21','USER_RESPONSE',0,9,2,23,4),('2022-05-10','USER_RESPONSE',1,10,NULL,11,5),('2022-09-11','USER_RESPONSE',0,10,6,14,4),('2022-08-21','USER_RESPONSE',0,10,1,18,7),('2022-03-17','USER_RESPONSE',0,10,5,22,5),('2022-04-15','USER_RESPONSE',1,10,NULL,25,8),('2022-03-12','USER_RESPONSE',1,11,NULL,23,1),('2022-08-19','USER_RESPONSE',1,11,NULL,24,3),('2022-05-02','USER_RESPONSE',0,12,3,11,6),('2022-01-21','USER_RESPONSE',0,12,6,17,1),('2022-06-03','USER_RESPONSE',0,12,5,19,2),('2022-03-09','USER_RESPONSE',1,12,NULL,20,3),('2022-05-05','USER_RESPONSE',0,12,6,37,1),('2022-06-03','USER_RESPONSE',0,13,6,11,5),('2022-03-27','USER_RESPONSE',0,13,1,31,1),('2022-11-27','USER_RESPONSE',1,13,NULL,31,4),('2022-10-05','USER_RESPONSE',0,14,1,32,6),('2022-06-18','USER_RESPONSE',0,15,3,21,5),('2022-02-22','USER_RESPONSE',1,15,NULL,24,2),('2022-02-11','USER_RESPONSE',1,15,NULL,26,4),('2022-12-28','USER_RESPONSE',1,15,NULL,33,6),('2022-02-16','USER_RESPONSE',0,16,4,13,4),('2022-09-27','USER_RESPONSE',1,17,NULL,26,3),('2022-09-01','USER_RESPONSE',0,17,3,36,2),('2022-07-03','USER_RESPONSE',0,18,2,20,6),('2022-09-08','USER_RESPONSE',0,18,3,22,1),('2022-08-28','USER_RESPONSE',1,18,NULL,28,2),('2022-07-15','USER_RESPONSE',0,18,3,31,8),('2022-02-18','USER_RESPONSE',1,18,NULL,37,3),('2022-08-15','USER_RESPONSE',0,19,2,24,3),('2022-07-24','USER_RESPONSE',1,20,NULL,21,5),('2022-12-17','USER_RESPONSE',0,20,2,21,7),('2022-01-17','USER_RESPONSE',1,20,NULL,29,5),('2022-08-12','USER_RESPONSE',0,20,1,29,3),('2022-03-11','USER_RESPONSE',1,21,NULL,14,2),('2022-07-15','USER_RESPONSE',1,22,NULL,16,3),('2022-04-23','USER_RESPONSE',1,22,NULL,25,1),('2022-12-16','USER_RESPONSE',1,22,NULL,34,3),('2022-03-01','USER_RESPONSE',1,23,NULL,20,2),('2022-11-26','USER_RESPONSE',1,24,NULL,26,3),('2022-10-23','USER_RESPONSE',1,25,NULL,12,8),('2022-06-22','USER_RESPONSE',1,25,NULL,16,5),('2022-07-03','USER_RESPONSE',0,25,4,24,2),('2022-05-14','USER_RESPONSE',0,25,3,37,6),('2022-05-12','USER_RESPONSE',1,26,NULL,14,7),('2022-03-06','USER_RESPONSE',0,26,2,16,5),('2022-05-17','USER_RESPONSE',1,26,NULL,20,6),('2022-11-18','USER_RESPONSE',1,26,NULL,28,6),('2022-03-13','USER_RESPONSE',0,27,4,14,2),('2022-05-09','USER_RESPONSE',0,27,3,14,1),('2022-03-19','USER_RESPONSE',0,28,4,21,6),('2022-04-01','USER_RESPONSE',1,29,NULL,12,1),('2022-01-20','USER_RESPONSE',0,30,1,16,5),('2022-02-01','USER_RESPONSE',0,30,3,27,3),('2022-10-16','USER_RESPONSE',0,30,4,31,3),('2022-08-22','USER_RESPONSE',1,30,NULL,32,6),('2022-11-27','USER_RESPONSE',1,31,NULL,22,6),('2022-01-17','USER_RESPONSE',0,31,1,28,7),('2022-11-18','USER_RESPONSE',1,32,NULL,13,8),('2022-12-21','USER_RESPONSE',1,32,NULL,19,5),('2022-05-02','USER_RESPONSE',1,32,NULL,33,2),('2022-02-20','USER_RESPONSE',1,33,NULL,18,1),('2022-02-02','USER_RESPONSE',1,33,NULL,19,6),('2022-04-10','USER_RESPONSE',0,34,5,19,6),('2022-04-25','USER_RESPONSE',1,34,NULL,25,5),('2022-09-07','USER_RESPONSE',1,34,NULL,34,5),('2022-04-18','USER_RESPONSE',1,34,NULL,35,4),('2022-02-10','USER_RESPONSE',1,34,NULL,37,1),('2022-12-01','USER_RESPONSE',1,35,NULL,15,3),('2022-04-18','USER_RESPONSE',1,36,NULL,17,2),('2022-03-03','USER_RESPONSE',1,36,NULL,21,4),('2022-11-06','USER_RESPONSE',1,36,NULL,26,3),('2022-07-25','USER_RESPONSE',1,36,NULL,33,1),('2022-05-05','USER_RESPONSE',1,38,NULL,21,1),('2022-04-22','USER_RESPONSE',1,38,NULL,25,6),('2022-10-10','USER_RESPONSE',0,38,2,30,1),('2022-03-14','USER_RESPONSE',1,38,NULL,37,6),('2022-12-02','USER_RESPONSE',1,39,NULL,22,3),('2022-01-05','USER_RESPONSE',0,39,5,29,4),('2022-06-08','USER_RESPONSE',0,39,3,31,4),('2022-03-22','USER_RESPONSE',0,40,1,14,3),('2022-10-17','USER_RESPONSE',1,40,NULL,31,6),('2022-05-13','USER_RESPONSE',1,40,NULL,37,2),('2022-04-03','USER_RESPONSE',0,41,3,15,2),('2022-04-11','USER_RESPONSE',0,41,6,30,8),('2022-04-07','USER_RESPONSE',0,42,6,29,2),('2022-07-26','USER_RESPONSE',0,43,6,23,8),('2022-05-23','USER_RESPONSE',1,43,NULL,29,6),('2022-03-24','USER_RESPONSE',1,43,NULL,34,1),('2022-07-12','USER_RESPONSE',1,44,NULL,14,1),('2022-07-27','USER_RESPONSE',0,44,5,14,8),('2022-10-12','USER_RESPONSE',0,44,6,15,6),('2022-09-20','USER_RESPONSE',1,45,NULL,11,2),('2022-07-08','USER_RESPONSE',1,45,NULL,19,3),('2022-01-02','USER_RESPONSE',1,45,NULL,20,1),('2022-01-28','USER_RESPONSE',1,45,NULL,25,3),('2022-05-02','USER_RESPONSE',0,45,1,28,7),('2022-11-20','USER_RESPONSE',1,45,NULL,35,1),('2022-06-23','USER_RESPONSE',0,47,1,11,8),('2022-06-16','USER_RESPONSE',0,47,2,30,3),('2022-12-27','USER_RESPONSE',1,47,NULL,31,7),('2022-01-04','USER_RESPONSE',1,50,NULL,14,3),('2022-01-02','USER_RESPONSE',0,50,4,16,8),('2022-12-16','USER_RESPONSE',0,50,6,23,6),('2022-12-22','USER_RESPONSE',1,51,NULL,13,2),('2022-08-15','USER_RESPONSE',0,51,5,19,4),('2022-07-05','USER_RESPONSE',1,51,NULL,25,2),('2022-11-27','USER_RESPONSE',0,53,2,24,5),('2022-12-01','USER_RESPONSE',0,53,4,28,4),('2022-07-13','USER_RESPONSE',1,54,NULL,24,3),('2022-12-17','USER_RESPONSE',1,54,NULL,28,1),('2022-06-16','USER_RESPONSE',1,55,NULL,15,2),('2022-06-27','USER_RESPONSE',0,55,1,20,4),('2022-08-25','USER_RESPONSE',1,55,NULL,28,6),('2022-01-12','USER_RESPONSE',0,55,6,32,1),('2022-06-04','USER_RESPONSE',0,56,5,35,7),('2022-12-19','USER_RESPONSE',1,57,NULL,12,2),('2022-05-27','USER_RESPONSE',1,57,NULL,14,5),('2022-08-16','USER_RESPONSE',1,57,NULL,23,5),('2022-03-11','USER_RESPONSE',1,57,NULL,24,4),('2022-01-22','USER_RESPONSE',0,57,4,36,2),('2022-03-12','USER_RESPONSE',0,58,2,20,5),('2022-11-02','USER_RESPONSE',1,58,NULL,23,4),('2022-04-08','USER_RESPONSE',0,58,6,25,8),('2022-05-18','USER_RESPONSE',1,58,NULL,32,8),('2022-05-16','USER_RESPONSE',1,59,NULL,20,3),('2022-07-14','USER_RESPONSE',1,59,NULL,22,5),('2022-01-06','USER_RESPONSE',0,60,1,33,1);
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `success_points_per_country`
--

DROP TABLE IF EXISTS `success_points_per_country`;
/*!50001 DROP VIEW IF EXISTS `success_points_per_country`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `success_points_per_country` AS SELECT 
 1 AS `regionname`,
 1 AS `successful_submissions`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `successful_submission_to_questions`
--

DROP TABLE IF EXISTS `successful_submission_to_questions`;
/*!50001 DROP VIEW IF EXISTS `successful_submission_to_questions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `successful_submission_to_questions` AS SELECT 
 1 AS `QuestionTitle`,
 1 AS `successful_submissions`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `test_case`
--

DROP TABLE IF EXISTS `test_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_case` (
  `case_input` text NOT NULL,
  `case_output` text NOT NULL,
  `case_ID` int NOT NULL AUTO_INCREMENT,
  `questionID` int NOT NULL,
  PRIMARY KEY (`case_ID`),
  KEY `questionID` (`questionID`),
  CONSTRAINT `test_case_ibfk_1` FOREIGN KEY (`questionID`) REFERENCES `question` (`questionID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_case`
--

LOCK TABLES `test_case` WRITE;
/*!40000 ALTER TABLE `test_case` DISABLE KEYS */;
INSERT INTO `test_case` VALUES ('90','70',1,1),('64','48',2,1),('68','38',3,2),('22','27',4,2),('29','8',5,2),('53','44',6,3),('79','90',7,3),('77','56',8,3),('21','95',9,4),('52','47',10,4),('23','89',11,4),('55','7',12,5),('66','42',13,5),('26','96',14,5),('37','77',15,6),('57','17',16,6),('53','78',17,6),('5','87',18,7),('63','63',19,7),('42','73',20,7),('23','89',21,8),('36','42',22,8),('85','30',23,8),('65','76',24,9),('20','27',25,9),('14','89',26,9),('61','53',27,10),('100','81',28,10),('32','79',29,10),('69','92',30,11),('52','79',31,11),('7','87',32,11),('54','68',33,12),('20','23',34,12),('12','99',35,12),('36','22',36,13),('37','87',37,13),('69','31',38,13),('87','30',39,14),('64','5',40,14),('98','44',41,14),('39','95',42,15),('66','97',43,15),('21','46',44,15),('40','84',45,16),('40','67',46,16),('30','99',47,16),('44','89',48,17),('30','96',49,17),('44','66',50,17),('31','40',51,18),('70','81',52,18),('18','18',53,18),('7','53',54,19),('19','83',55,19),('55','57',56,19),('59','71',57,20),('28','26',58,20),('25','42',59,20),('95','77',60,21),('41','88',61,21),('94','12',62,21),('39','71',63,22),('50','41',64,22),('88','96',65,22),('8','95',66,23),('10','23',67,23),('11','45',68,23),('53','8',69,24),('78','82',70,24),('39','61',71,24),('19','10',72,25),('30','76',73,25),('11','58',74,25),('97','36',75,26),('28','41',76,26),('48','88',77,26),('22','41',78,27),('48','65',79,27),('14','37',80,27),('50','72',81,28),('9','33',82,28),('26','68',83,28),('33','43',84,29),('16','59',85,29),('91','76',86,29),('84','82',87,30),('57','94',88,30),('25','79',89,30),('28','15',90,31),('77','7',91,31),('36','62',92,31),('78','11',93,32),('10','72',94,32),('73','81',95,32),('66','5',96,33),('88','20',97,33),('8','67',98,33),('15','29',99,34),('77','53',100,34),('12','23',101,34),('11','53',102,35),('28','36',103,35),('54','93',104,35),('5','89',105,36),('37','69',106,36),('37','14',107,36),('46','54',108,37),('31','89',109,37),('74','7',110,37),('57','73',111,38),('59','58',112,38),('24','69',113,38),('43','13',114,39),('42','47',115,39),('24','29',116,39),('75','83',117,40),('82','92',118,40),('51','91',119,40),('48','88',120,41),('65','58',121,41),('46','38',122,41),('38','41',123,42),('57','43',124,42),('76','9',125,42),('95','38',126,43),('64','76',127,43),('44','8',128,43),('11','66',129,44),('75','66',130,44),('23','68',131,44),('68','38',132,45),('81','14',133,45),('100','76',134,45),('84','74',135,46),('32','84',136,46),('62','64',137,46),('62','34',138,47),('48','99',139,47),('57','37',140,47),('93','6',141,48),('68','13',142,48),('17','89',143,48),('86','59',144,49),('78','55',145,49),('60','20',146,49),('37','60',147,50),('69','49',148,50),('68','95',149,50),('66','26',150,51),('27','30',151,51),('83','37',152,51),('43','24',153,52),('78','95',154,52),('82','75',155,52),('54','14',156,53),('6','61',157,53),('95','76',158,53),('30','59',159,54),('20','78',160,54),('90','5',161,54),('31','67',162,55),('6','59',163,55),('76','27',164,55),('9','30',165,56),('86','85',166,56),('13','31',167,56),('23','6',168,57),('19','20',169,57),('77','20',170,57),('81','75',171,58),('34','28',172,58),('49','81',173,58),('5','79',174,59),('6','95',175,59),('86','46',176,59),('8','49',177,60),('23','63',178,60),('54','46',179,60);
/*!40000 ALTER TABLE `test_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `top_players2`
--

DROP TABLE IF EXISTS `top_players2`;
/*!50001 DROP VIEW IF EXISTS `top_players2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_players2` AS SELECT 
 1 AS `username`,
 1 AS `regionName`,
 1 AS `cnt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `total_submission_by_country`
--

DROP TABLE IF EXISTS `total_submission_by_country`;
/*!50001 DROP VIEW IF EXISTS `total_submission_by_country`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_submission_by_country` AS SELECT 
 1 AS `regionName`,
 1 AS `total_submissions`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `total_submission_to_questions`
--

DROP TABLE IF EXISTS `total_submission_to_questions`;
/*!50001 DROP VIEW IF EXISTS `total_submission_to_questions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `total_submission_to_questions` AS SELECT 
 1 AS `QuestionTitle`,
 1 AS `total_submissions`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `Date_Created` date NOT NULL,
  `personID` int NOT NULL,
  `rankID` int DEFAULT NULL,
  PRIMARY KEY (`personID`),
  KEY `rankID` (`rankID`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`) ON DELETE CASCADE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`rankID`) REFERENCES `ranks` (`rankID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('2021-08-04',11,7),('2021-01-07',12,1),('2021-02-05',13,2),('2021-03-07',14,7),('2021-08-18',15,2),('2021-04-05',16,3),('2021-12-18',17,5),('2021-05-11',18,2),('2021-01-03',19,4),('2021-12-13',20,5),('2021-01-04',21,7),('2021-06-10',22,6),('2021-05-03',23,3),('2021-12-12',24,5),('2021-10-16',25,1),('2021-12-16',26,3),('2021-03-13',27,4),('2021-12-12',28,2),('2021-09-15',29,2),('2021-04-05',30,4),('2021-11-18',31,6),('2021-02-19',32,2),('2021-11-19',33,6),('2021-11-15',34,6),('2021-10-20',35,1),('2021-07-01',36,5),('2021-01-06',37,5);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volume`
--

DROP TABLE IF EXISTS `volume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volume` (
  `volumeID` int NOT NULL AUTO_INCREMENT,
  `volumeTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`volumeID`),
  UNIQUE KEY `volumeTitle` (`volumeTitle`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volume`
--

LOCK TABLES `volume` WRITE;
/*!40000 ALTER TABLE `volume` DISABLE KEYS */;
INSERT INTO `volume` VALUES (1,'Arrays'),(3,'AVL Trees'),(2,'Binary Search Trees'),(9,'Competitive Programing'),(6,'Functions'),(5,'Matrices'),(7,'Object Oriented Programming'),(4,'Recursion'),(8,'Sorting Problems');
/*!40000 ALTER TABLE `volume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `success_points_per_country`
--

/*!50001 DROP VIEW IF EXISTS `success_points_per_country`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `success_points_per_country` AS select `r`.`regionName` AS `regionname`,count(0) AS `successful_submissions` from (((`region` `r` join `submission` `s`) join `person` `p`) join `user` `u`) where ((`r`.`regionID` = `p`.`regionID`) and (`s`.`personID` = `u`.`personID`) and (`p`.`personID` = `u`.`personID`) and (`s`.`successOrNot` = 1)) group by `r`.`regionID` order by count(0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `successful_submission_to_questions`
--

/*!50001 DROP VIEW IF EXISTS `successful_submission_to_questions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `successful_submission_to_questions` AS select `q`.`QuestionTitle` AS `QuestionTitle`,count(0) AS `successful_submissions` from (`question` `q` join `submission` `s` on((`q`.`questionID` = `s`.`questionID`))) where (`s`.`successOrNot` = 1) group by `q`.`questionID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_players2`
--

/*!50001 DROP VIEW IF EXISTS `top_players2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_players2` AS select `p`.`username` AS `username`,`r`.`regionName` AS `regionName`,count(0) AS `cnt` from (((`person` `p` join `region` `r`) join `submission` `s`) join `user` `u`) where ((`s`.`successOrNot` = 1) and (`p`.`regionID` = `r`.`regionID`) and (`u`.`personID` = `p`.`personID`) and (`u`.`personID` = `s`.`personID`)) group by `u`.`personID` order by count(0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_submission_by_country`
--

/*!50001 DROP VIEW IF EXISTS `total_submission_by_country`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_submission_by_country` AS select `r`.`regionName` AS `regionName`,count(0) AS `total_submissions` from (((`person` `p` join `region` `r` on((`r`.`regionID` = `p`.`regionID`))) join `user` `u` on((`p`.`personID` = `u`.`personID`))) join `submission` `s` on((`s`.`personID` = `u`.`personID`))) group by `r`.`regionID` order by count(0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total_submission_to_questions`
--

/*!50001 DROP VIEW IF EXISTS `total_submission_to_questions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total_submission_to_questions` AS select `q`.`QuestionTitle` AS `QuestionTitle`,count(0) AS `total_submissions` from (`question` `q` join `submission` `s` on((`q`.`questionID` = `s`.`questionID`))) group by `q`.`questionID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-12 22:21:22
