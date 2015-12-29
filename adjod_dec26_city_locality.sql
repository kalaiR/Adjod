CREATE DATABASE  IF NOT EXISTS `adjod` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `adjod`;
-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: adjod
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advertisement_city`
--

DROP TABLE IF EXISTS `advertisement_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `country_code` varchar(10) NOT NULL,
  `country_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_city`
--

LOCK TABLES `advertisement_city` WRITE;
/*!40000 ALTER TABLE `advertisement_city` DISABLE KEYS */;
INSERT INTO `advertisement_city` VALUES (1,'Singapore','SG','Singapore');
/*!40000 ALTER TABLE `advertisement_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement_locality`
--

DROP TABLE IF EXISTS `advertisement_locality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement_locality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_refid_id` int(11) DEFAULT NULL,
  `locality` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `advertisement_locality_995f8b6a` (`city_refid_id`),
  CONSTRAINT `city_refid_id_refs_id_449ceb0f` FOREIGN KEY (`city_refid_id`) REFERENCES `advertisement_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_locality`
--

LOCK TABLES `advertisement_locality` WRITE;
/*!40000 ALTER TABLE `advertisement_locality` DISABLE KEYS */;
INSERT INTO `advertisement_locality` VALUES (1,1,'Ang mo kio'),(2,1,'Beach road'),(3,1,'Bishan'),(4,1,'Boon lay'),(5,1,'Bugis'),(6,1,'Bukit timah'),(7,1,'Chinatown'),(8,1,'City hall'),(9,1,'Choa chu kang'),(10,1,'Clementi'),(11,1,'Dempsey road'),(12,1,'Ghim moh'),(13,1,'Holland village'),(14,1,'Hougang'),(15,1,'Jurong west'),(16,1,'Marine parade'),(17,1,'Orchard'),(18,1,'Pasir ris'),(19,1,'Queenstown'),(20,1,'Rochor'),(21,1,'Sengkang'),(22,1,'Serangoon garden'),(23,1,'Sin ming'),(24,1,'Taman jurong'),(25,1,'Tampines'),(26,1,'Telok blangah'),(27,1,'Telok kurau'),(28,1,'Tiong bahru'),(29,1,'Toa payoh'),(30,1,'West coast'),(31,1,'Woodlands');
/*!40000 ALTER TABLE `advertisement_locality` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-26  9:22:05
