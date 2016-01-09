CREATE DATABASE  IF NOT EXISTS `adjod` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `adjod`;
-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: adjod
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

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
-- Table structure for table `banner_postbanner`
--

DROP TABLE IF EXISTS `banner_postbanner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner_postbanner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `banner` varchar(100) NOT NULL,
  `link` varchar(200) DEFAULT NULL,
  `bannerplan_id` int(11) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `admin_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `banner_postbanner_fbfc09f1` (`user_id`),
  KEY `banner_postbanner_d231ba9` (`bannerplan_id`),
  CONSTRAINT `bannerplan_id_refs_id_f4481752` FOREIGN KEY (`bannerplan_id`) REFERENCES `banner_bannerplan` (`id`),
  CONSTRAINT `user_id_refs_user_ptr_id_241f0e0d` FOREIGN KEY (`user_id`) REFERENCES `adjod_userprofile` (`user_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_postbanner`
--

LOCK TABLES `banner_postbanner` WRITE;
/*!40000 ALTER TABLE `banner_postbanner` DISABLE KEYS */;
INSERT INTO `banner_postbanner` VALUES (1,2,'banners/banner4_1_1_1.jpeg','www.google.com',2,'2016-01-08 13:15:01','2016-02-07 13:15:01',1),(2,2,'banners/banner3_1.jpg','www.google.com',1,'2016-01-08 13:15:01','2016-02-07 13:15:01',1),(3,2,'banners/hp_ad_1.png','www.google.com',3,'2016-01-08 13:50:42','2016-02-07 13:50:42',1),(6,4,'banners/car_banner_1_1.jpg','www.google.com',6,'2016-01-08 14:28:28','2016-02-07 14:28:28',1),(7,6,'banners/ac_banner_1_1.png','www.google.com',7,'2016-01-08 14:28:28','2016-02-07 14:28:28',1),(8,6,'banners/banner4_1_2.jpeg','www.google.com',8,'2016-01-08 14:28:28','2016-02-07 14:28:28',1),(9,6,'banners/banner4_2.jpeg','www.google.com',9,'2016-01-08 14:28:28','2016-02-07 14:28:28',1),(10,6,'banners/banner4_1.png','www.google.com',10,'2016-01-08 14:28:28','2016-02-07 14:28:28',1),(11,6,'banners/banner_1_1.png','www.google.com',11,'2016-01-08 14:28:28','2016-02-07 14:28:28',1);
/*!40000 ALTER TABLE `banner_postbanner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_bannerplan`
--

DROP TABLE IF EXISTS `banner_bannerplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner_bannerplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `price` double DEFAULT NULL,
  `plan_duration` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page` (`page`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_bannerplan`
--

LOCK TABLES `banner_bannerplan` WRITE;
/*!40000 ALTER TABLE `banner_bannerplan` DISABLE KEYS */;
INSERT INTO `banner_bannerplan` VALUES (1,'Home page','Left',1000,30),(2,'Home page','Right',1000,30),(3,'Home page','Bottom',1000,30),(6,'Details page','Right_top',1000,30),(7,'Details page','Right_bottom',500,30),(8,'Listing page','Left',1000,30),(9,'Listing page','Right',500,30),(10,'Listing page','Bottom',1000,30),(11,'Details page','Bottom',1000,30);
/*!40000 ALTER TABLE `banner_bannerplan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-08 20:17:16
