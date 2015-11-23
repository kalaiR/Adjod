CREATE DATABASE  IF NOT EXISTS `adjod` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `adjod`;
-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: adjod
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
-- Table structure for table `adjod_userprofile`
--

DROP TABLE IF EXISTS `adjod_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjod_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `confirmation_code` varchar(500) NOT NULL,
  `is_subscribed` tinyint(1) DEFAULT NULL,
  `language` varchar(5) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `age_status` tinyint(1) DEFAULT NULL,
  `is_emailverified` tinyint(1) DEFAULT NULL,
  `ad_count` int(5) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `city_id_idx` (`city_id`),
  CONSTRAINT `city_id` FOREIGN KEY (`city_id`) REFERENCES `advertisement_city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id_refs_id_3eff55ca` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjod_userprofile`
--

LOCK TABLES `adjod_userprofile` WRITE;
/*!40000 ALTER TABLE `adjod_userprofile` DISABLE KEYS */;
INSERT INTO `adjod_userprofile` VALUES (1,1,'7200300448','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,49,'7200300448','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,53,'7200300448','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,55,'7200300448','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,57,'7200300448','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,59,'7200300448','',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,60,'7200300448','wobFvW6bjrbjnPUuh0W5o7QRBIDJh5nUK',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,61,'7200300448','lU1urINroxRqhVNAuC8JOVpMcEH8HqodD',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,62,'7200300448','t53YuxT4CRRDXdWJZhWdynvsfzoZcWy9f',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,63,'7200300448','lIEkDO6AIz7iI9ExrmCkVEWB0vZBUqqDt',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,64,'7200300448','iyC0Bo5cR58yFI5191tbmrOLpZYi7syqq',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,65,'7200300448','vurLO8gQKZguLLJoVCKr8jXS6mNLHah8y',1,NULL,NULL,NULL,1,0,NULL),(18,66,'7200300448','QqPFalOIZvXec5xV61yKhHZ5QDOD3Z3zj',0,NULL,NULL,NULL,NULL,NULL,NULL),(19,73,'9876543210','5HLeUbemkXGRjp9d4sgKNKgNO4UcRzG9K',0,NULL,NULL,NULL,NULL,NULL,NULL),(20,74,'9876543210','AON502abmw2In3ygwuqxENflfGAaEY088',0,NULL,NULL,NULL,NULL,NULL,NULL),(21,75,'9876543210','48vHoMnAfkQFnZwwgcay7hmAYqP0uQJdb',0,NULL,NULL,NULL,NULL,NULL,NULL),(22,76,'9876543210','AjiEEXDMs785g8LLcQLGO5prsj4Ux82zf',0,NULL,NULL,NULL,NULL,NULL,NULL),(23,77,'9876543210','ruYMpe1dbrbWNckHYVvhMrbWI1UaQGSfU',0,NULL,NULL,NULL,NULL,NULL,NULL),(24,78,'9876543210','4YUiTxVMKMTkiPC5i6yAdfCm660cx3A4K',0,NULL,NULL,NULL,NULL,NULL,NULL),(25,80,'9876543210','Bi8kpb7qkkkxJuPtOW1QM30slVCWel6ac',0,NULL,NULL,NULL,NULL,NULL,NULL),(26,81,'9876543210','8gWsR5pMm8l1Vk3AZqdmSUMoY0t7RTxcc',0,NULL,NULL,NULL,NULL,NULL,NULL),(27,82,'9876543210','kxPUh0UOHrCJgtJJeqhKAUgMFVwnhqnFL',0,NULL,NULL,NULL,NULL,NULL,NULL),(28,83,'9876543210','vWbJW4RvthM3EXjOXUwZ0rvjaZxdTLkhp',0,NULL,NULL,NULL,NULL,NULL,NULL),(29,84,'9876543210','9IS2VS8A0qJMuqbPZDTPfpToICGn6P7FD',0,'en',NULL,NULL,NULL,NULL,NULL),(30,90,'34343','mHCEH6vgrjugKLsnwWLepLcpdcqfsLDFt',0,'en',NULL,NULL,NULL,NULL,NULL),(31,92,'3434','232323',0,'',NULL,NULL,NULL,NULL,NULL),(32,93,'34343','asfasdf',0,'',NULL,NULL,NULL,NULL,NULL),(33,112,'34343','umcwrkoaiQwZHkHBICg2fNIxMwFVh5ajp',0,'en',NULL,NULL,NULL,NULL,NULL),(34,113,'3434','knuE1va2mKezvoErYk7SLzDh19CI8f3Ui',0,'en',NULL,NULL,NULL,NULL,NULL),(35,114,'123456789','UYW9yQSYJcEGXcIyicNSNJavTjIdMLlhW',0,'en',NULL,NULL,NULL,NULL,NULL),(36,115,'9876543210','S4sMgxNhKg88NmCN7WGlBxPdh3mBvWTtg',0,'en',NULL,NULL,NULL,NULL,NULL),(37,116,'8344670740','KGGdHTdPslH0KkvvY8FDa1LbD6fOGQkbE',0,'en',NULL,NULL,NULL,NULL,NULL),(38,117,'8344670740','xBHO0VOom5GlSmSqE4Uaba3qyBqigsft2',0,'en',NULL,NULL,NULL,NULL,NULL),(39,123,'9876543210','7notCGui0TD2Ek1jFNKSZwloD5L7bZ0JZ',0,'en',NULL,NULL,NULL,NULL,NULL),(40,124,'','ByosjVCPj1oLKEtPmxd3cvSxNi0BIGhR2',0,'en',NULL,NULL,NULL,NULL,NULL),(41,125,'','YLRFssr5Ue4FUVdmm4dwYkP5Sbukb2dUd',0,'en',NULL,NULL,NULL,NULL,NULL),(42,127,'','YGqpNdLQOOB0uSxpVRpcO5BoiLn8vBtbW',0,'en',NULL,NULL,NULL,NULL,NULL),(43,128,'3434343434','rgBvRdKLf8DPaODVmVNJZRp122uMX781K',0,'en',NULL,NULL,NULL,NULL,NULL),(47,132,'','JPUS5qhPvMRsUFyrMYYJGJVw7wDv8mC7P',0,'en',NULL,NULL,NULL,NULL,NULL),(48,133,'','RWnH1rgstlb55FtXL4s09r8fFXxK5rN5u',0,'en',NULL,NULL,NULL,NULL,NULL),(49,134,'','p0k7ikMM0Axw3ylbinv9SVTqdvCLv6URO',0,'en',NULL,NULL,NULL,NULL,NULL),(50,135,'','ixdlmos0K5wtyJJF37X1ARPitTZVp2Syf',0,'en',NULL,NULL,NULL,NULL,NULL),(51,136,'','VY7Uc0vwJwjRUjQpalp1gO12CPlsiNM87',0,'en',NULL,NULL,NULL,NULL,NULL),(52,137,'','9rFOOy7AVWAVI28IjdrA0Xhv72ecCwdEV',0,'en',NULL,NULL,NULL,NULL,NULL),(53,138,'9876543210','s2jpBEaq3JnbBnw3vRocIcuWNlR9rIgHZ',0,'en',NULL,1,NULL,NULL,NULL),(54,139,'','YvlkZW8lq8FxdXJZjewvMmjOfPPFLRrt2',0,'en',NULL,1,NULL,NULL,NULL),(55,140,'','LVICYR5Qod8bG5ExfuqAhkhiSeRdUI83P',0,'en',NULL,1,NULL,NULL,NULL),(56,141,'7845729671','YkZcitflx7OWqRmQ2Okgjglq2y3MUI82p',0,'en',NULL,1,NULL,NULL,NULL),(57,143,'9876543210','lbHKJDWRYGKm9lzQSN5zsIECzjtpdZZZz',0,'en',NULL,1,0,NULL,NULL),(58,144,'147852390','gFoQImNvzJ14evawtgAkBMIrMU7PKQEbg',0,'de',NULL,1,0,NULL,NULL),(59,145,'4563210789','4wctGd6lAKp1Nz71DoOnFXaJOE30l7zyV',0,'de',NULL,1,0,NULL,NULL),(60,146,'789541023','F5kurP7X7aMe6vsYL6M2wGxk7zwuxUe5w',0,'de',NULL,1,0,NULL,NULL),(61,147,'9876543210','PWh6dYz2SQhE8Wxf3nUnnFlaRfKX54TwQ',0,'de',NULL,1,1,4,NULL),(62,148,'','WTHhkEStM9PlrcmH3NNewZJQ7j2vlaSgN',0,'de',NULL,1,0,NULL,NULL),(63,150,'','EWkkE6EuQpM4NQKnyiQDutwvDZYPKaTQI',0,'en',1,1,0,NULL,''),(64,151,'98765 43210','zNPFJfdULDMvcmxBZK9zJA7qCklOvxNVy',0,'en',1,1,0,NULL,'');
/*!40000 ALTER TABLE `adjod_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement_category`
--

DROP TABLE IF EXISTS `advertisement_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL,
  `category_type` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_category`
--

LOCK TABLES `advertisement_category` WRITE;
/*!40000 ALTER TABLE `advertisement_category` DISABLE KEYS */;
INSERT INTO `advertisement_category` VALUES (1,'static/img/photos/car.png','Cars & Bikes','Suzuki,Audi,BMW'),(2,'static/img/photos/mobile.png','Mobiles & Tablets','Macbooks,Asus laptops'),(3,'static/img/photos/plug.png','Electronic & Appliance','Cordless,Electric cooker,Fridge'),(4,'static/img/photos/home.png','Real estate','Flats for sale,Space for rent'),(5,'static/img/photos/case.png','Jobs','Part timer,Freelancer'),(6,'static/img/photos/tree.png','Home & Lifestyle','Light lamps,Luggage'),(7,'static/img/photos/tool.png','Services','Architecture,advertising'),(8,'static/img/photos/prize.png','Education & Learning','Tuition classes,Online coaching'),(9,'static/img/photos/paw.png','Pets & Pet care','SPet Adoption,Pet care'),(10,'static/img/photos/game.png','Entertainment','Gaming,Cameramen'),(11,'static/img/photos/gift.png','Community & Events','Party, Event, Charity'),(12,'static/img/photos/heart.png','Matrimonial','Grooms,bride,planner');
/*!40000 ALTER TABLE `advertisement_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement_city`
--

DROP TABLE IF EXISTS `advertisement_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `country_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_city`
--

LOCK TABLES `advertisement_city` WRITE;
/*!40000 ALTER TABLE `advertisement_city` DISABLE KEYS */;
INSERT INTO `advertisement_city` VALUES (1,'Pondicherry','IN','India'),(2,'Chennai','IN','India'),(3,'Bangalore','IN','India'),(4,'Aljunied','SG','Singapore'),(5,'Ang Mo Kio','SG','Singapore'),(6,'Balestier Road','SG','Singapore'),(7,'Singapore','SG','Singapore');
/*!40000 ALTER TABLE `advertisement_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement_country`
--

DROP TABLE IF EXISTS `advertisement_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_country`
--

LOCK TABLES `advertisement_country` WRITE;
/*!40000 ALTER TABLE `advertisement_country` DISABLE KEYS */;
INSERT INTO `advertisement_country` VALUES (1,'IN','India'),(2,'SG','Singapore');
/*!40000 ALTER TABLE `advertisement_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement_dropdown`
--

DROP TABLE IF EXISTS `advertisement_dropdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement_dropdown` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_dropdown`
--

LOCK TABLES `advertisement_dropdown` WRITE;
/*!40000 ALTER TABLE `advertisement_dropdown` DISABLE KEYS */;
INSERT INTO `advertisement_dropdown` VALUES (1,'Tata'),(2,'Nokia'),(3,'Micromax'),(4,'Maruti Suzuki'),(5,'Mahindra'),(6,'Kinetic Motors'),(7,'Hyundai'),(8,'Honda'),(9,'Hero Honda'),(10,'Hero'),(11,'HCL');
/*!40000 ALTER TABLE `advertisement_dropdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement_dropdown_subcat`
--

DROP TABLE IF EXISTS `advertisement_dropdown_subcat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement_dropdown_subcat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dropdown_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dropdown_id` (`dropdown_id`,`subcategory_id`),
  KEY `advertisement_dropdown_subcat_e4b139c7` (`dropdown_id`),
  KEY `advertisement_dropdown_subcat_913b3835` (`subcategory_id`),
  CONSTRAINT `dropdown_id_refs_id_cda49e79` FOREIGN KEY (`dropdown_id`) REFERENCES `advertisement_dropdown` (`id`),
  CONSTRAINT `subcategory_id_refs_id_a29aac9b` FOREIGN KEY (`subcategory_id`) REFERENCES `advertisement_subcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_dropdown_subcat`
--

LOCK TABLES `advertisement_dropdown_subcat` WRITE;
/*!40000 ALTER TABLE `advertisement_dropdown_subcat` DISABLE KEYS */;
INSERT INTO `advertisement_dropdown_subcat` VALUES (1,1,1),(2,2,8),(3,3,8),(4,4,1),(5,5,1),(6,6,2),(7,7,1),(8,8,1),(9,8,3),(10,9,2),(11,10,2),(12,10,3),(13,11,9);
/*!40000 ALTER TABLE `advertisement_dropdown_subcat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement_freealert`
--

DROP TABLE IF EXISTS `advertisement_freealert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement_freealert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alert_user_id` int(11) NOT NULL,
  `alert_category_id` int(11) NOT NULL,
  `alert_subcategory_id` int(11) NOT NULL,
  `alert_brand_id` int(11) NOT NULL,
  `alert_city_id` int(11) DEFAULT NULL,
  `alert_email` varchar(30) NOT NULL,
  `alert_mobile` varchar(30) NOT NULL,
  `mail_is_sent` tinyint(1) DEFAULT NULL,
  `last_email_sent` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `advertisement_freealert_b68fb4ee` (`alert_user_id`),
  KEY `advertisement_freealert_f7275d65` (`alert_category_id`),
  KEY `advertisement_freealert_e462e990` (`alert_subcategory_id`),
  KEY `advertisement_freealert_35295a9` (`alert_brand_id`),
  KEY `advertisement_freealert_5018a84e` (`alert_city_id`),
  CONSTRAINT `alert_brand_id_refs_id_af8e1c95` FOREIGN KEY (`alert_brand_id`) REFERENCES `advertisement_dropdown` (`id`),
  CONSTRAINT `alert_category_id_refs_id_918c49e` FOREIGN KEY (`alert_category_id`) REFERENCES `advertisement_category` (`id`),
  CONSTRAINT `alert_city_id_refs_id_e4001ba5` FOREIGN KEY (`alert_city_id`) REFERENCES `advertisement_city` (`id`),
  CONSTRAINT `alert_subcategory_id_refs_id_3f91be57` FOREIGN KEY (`alert_subcategory_id`) REFERENCES `advertisement_subcategory` (`id`),
  CONSTRAINT `alert_user_id_refs_id_d3569bb8` FOREIGN KEY (`alert_user_id`) REFERENCES `adjod_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_freealert`
--

LOCK TABLES `advertisement_freealert` WRITE;
/*!40000 ALTER TABLE `advertisement_freealert` DISABLE KEYS */;
INSERT INTO `advertisement_freealert` VALUES (1,17,1,2,9,2,'kalaimca.gs@gmail.com','7200300448',1,'2015-05-27 07:36:32'),(2,17,2,8,3,2,'kalaimca.gs@gmail.com','7200300448',1,'2015-05-27 07:36:32'),(3,17,2,8,11,NULL,'kalai.rkv91@gmail.com','954545',0,NULL),(4,17,1,2,9,2,'kalai.rkv91@gmail.com','73345454',0,NULL),(5,38,1,1,5,2,'nethradhasaratharaj@gmail.com','8344670740',0,NULL),(6,32,2,8,3,1,'ramya@gmail.com','9875612398',0,NULL),(7,31,1,2,9,2,'Your email','Your mobile number',0,NULL);
/*!40000 ALTER TABLE `advertisement_freealert` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_locality`
--

LOCK TABLES `advertisement_locality` WRITE;
/*!40000 ALTER TABLE `advertisement_locality` DISABLE KEYS */;
INSERT INTO `advertisement_locality` VALUES (1,1,'Muthialpet'),(2,1,'Lawspet'),(3,1,'Muthaliarpet'),(4,2,'Adayar'),(5,2,'Paris'),(6,4,'Geylang Serai'),(7,4,'Kampong Kembangan'),(8,5,'Hokkien'),(9,6,'Kampong Ladang');
/*!40000 ALTER TABLE `advertisement_locality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement_premiumpriceinfo`
--

DROP TABLE IF EXISTS `advertisement_premiumpriceinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement_premiumpriceinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `premium_price` double DEFAULT NULL,
  `purpose` varchar(30) NOT NULL,
  `month` int(11) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_premiumpriceinfo`
--

LOCK TABLES `advertisement_premiumpriceinfo` WRITE;
/*!40000 ALTER TABLE `advertisement_premiumpriceinfo` DISABLE KEYS */;
INSERT INTO `advertisement_premiumpriceinfo` VALUES (1,9.99,'Urgent Ads',1,'SGD'),(2,14.99,'Top of Ads',1,'SGD'),(3,19.99,'Top of Ads + Urgent Ads',1,'SGD');
/*!40000 ALTER TABLE `advertisement_premiumpriceinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement_product`
--

DROP TABLE IF EXISTS `advertisement_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `adtype` varchar(10) NOT NULL,
  `title` varchar(250) NOT NULL,
  `photos` varchar(500) DEFAULT NULL,
  `thumbnail` varchar(500) DEFAULT NULL,
  `imagecount` int(11) DEFAULT NULL,
  `condition` varchar(10) NOT NULL,
  `price` double DEFAULT NULL,
  `ad_brand_id` int(11) NOT NULL,
  `ad_year` varchar(10) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `locality_id` int(11) DEFAULT NULL,
  `description` longtext NOT NULL,
  `you_are` varchar(20) NOT NULL,
  `you_name` varchar(20) DEFAULT NULL,
  `you_email` varchar(30) NOT NULL,
  `you_phone` varchar(12) DEFAULT NULL,
  `created_date` date NOT NULL,
  `expired_date` date DEFAULT NULL,
  `modified_date` date NOT NULL,
  `isregistered_user` tinyint(1) DEFAULT NULL,
  `ispremium` varchar(12) DEFAULT NULL,
  `premium_plan_id` int(11) DEFAULT NULL,
  `status_isactive` tinyint(1) NOT NULL,
  `post_terms` tinyint(1) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `video` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `advertisement_product_1be3128f` (`userprofile_id`),
  KEY `advertisement_product_42dc49bc` (`category_id`),
  KEY `advertisement_product_913b3835` (`subcategory_id`),
  KEY `advertisement_product_c06c66db` (`ad_brand_id`),
  KEY `advertisement_product_586a73b5` (`city_id`),
  KEY `advertisement_product_df6acbd9` (`locality_id`),
  KEY `advertisement_product_ibfk_1` (`premium_plan_id`),
  CONSTRAINT `advertisement_product_ibfk_1` FOREIGN KEY (`premium_plan_id`) REFERENCES `advertisement_premiumpriceinfo` (`id`),
  CONSTRAINT `ad_brand_id_refs_id_53d1ee6c` FOREIGN KEY (`ad_brand_id`) REFERENCES `advertisement_dropdown` (`id`),
  CONSTRAINT `category_id_refs_id_d73d417d` FOREIGN KEY (`category_id`) REFERENCES `advertisement_category` (`id`),
  CONSTRAINT `city_id_refs_id_5f1fd95a` FOREIGN KEY (`city_id`) REFERENCES `advertisement_city` (`id`),
  CONSTRAINT `locality_id_refs_id_56128078` FOREIGN KEY (`locality_id`) REFERENCES `advertisement_locality` (`id`),
  CONSTRAINT `subcategory_id_refs_id_fbdf449e` FOREIGN KEY (`subcategory_id`) REFERENCES `advertisement_subcategory` (`id`),
  CONSTRAINT `userprofile_id_refs_id_5e2de78f` FOREIGN KEY (`userprofile_id`) REFERENCES `adjod_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_product`
--

LOCK TABLES `advertisement_product` WRITE;
/*!40000 ALTER TABLE `advertisement_product` DISABLE KEYS */;
INSERT INTO `advertisement_product` VALUES (1,32,2,8,'buy','samsung mobile','static/img/photos/cute-girl-2.png,static/img/photos/girl.jpg,static/img/photos/Screenshot from 2015-03-11 18_24_53.png','static/img/thumbs/Screenshot_from_2015-03-11_182453_thumbnail_21.png',1,'used',5000,3,'2012',2,5,'asafdasf','individual','kalai','kalaimca.gs@gmail.com','7200300448','2015-05-28','2015-06-25','2015-05-04',NULL,'1',1,1,NULL,NULL,NULL),(2,3,2,8,'sell','samsung mobile 500 series','static/img/photos/girl.jpg,static/img/photos/Screenshot from 2015-03-11 18_24_53.png','static/img/thumbs/girl_thumbnail_29.png,static/img/thumbs/Screenshot_from_2015-03-11_182453_thumbnail_22.png',2,'used',30000,3,'2000',2,5,'afasfd','individual','kk','kalaimca.gs@gmail.com','7200300448','2015-05-28','2015-06-25','2015-05-04',NULL,'1',2,1,NULL,NULL,NULL),(3,5,1,1,'buy','saproro car cerrarra','static/img/photos/cute-girl-2.png,static/img/photos/girl.jpg,static/img/photos/car.png','static/img/thumbs/cute-girl-2_thumbnail_22.png',1,'used',34342,1,'2012',2,5,'asfasfd','individual','kalai','kalaimca.gs@gmail.com','7200300448','2015-05-28','2015-07-07','2015-05-04',NULL,'1',3,1,NULL,NULL,NULL),(4,3,1,1,'buy','Odysee car model','static/img/photos/cute-girl-2.png,static/img/photos/girl.jpg,static/img/photos/car.png','static/img/thumbs/cute-girl-2_thumbnail_23.png',1,'used',8000,1,'2012',2,5,'asfasfd','individual','kalai','kalaimca.gs@gmail.com','7200300448','2015-05-28','2015-07-07','2015-05-04',NULL,'1',1,0,NULL,NULL,NULL),(5,1,1,1,'buy','Audi car high speed','static/img/photos/cute-girl-2.png','static/img/thumbs/cute-girl-2_thumbnail_24.png',1,'used',12000,1,'2012',2,5,'asfasfd','individual','kalai','kalaimca.gs@gmail.com','7200300448','2015-05-28','2015-07-07','2015-05-04',NULL,'1',2,0,NULL,NULL,NULL),(6,3,1,1,'buy','Qualis car new model','static/img/photos/cute-girl-2.png','static/img/thumbs/cute-girl-2_thumbnail_25.png',1,'used',5000,1,'2012',2,5,'asfasfd','individual','kalai','kalaimca.gs@gmail.com','7200300448','2015-05-28','2015-07-07','2015-05-04',NULL,'1',3,0,NULL,NULL,NULL),(7,5,1,1,'buy','bmw car','static/img/photos/cute-girl-2.png','static/img/thumbs/cute-girl-2_thumbnail_26.png',1,'used',15000,1,'2012',2,5,'asfasfd','individual','kalai','kalaimca.gs@gmail.com','7200300448','2015-05-28','2015-07-07','2015-05-04',NULL,'1',1,0,NULL,NULL,NULL),(8,7,1,1,'buy','maruthi car','static/img/photos/cute-girl-2.png','static/img/thumbs/cute-girl-2_thumbnail_27.png',1,'used',10000,1,'2012',2,5,'asfasfd','individual','kalai','kalaimca.gs@gmail.com','7200300448','2015-05-28','2015-07-07','2015-05-04',NULL,'0',NULL,1,NULL,NULL,NULL),(9,1,1,2,'buy','tata motorcycle','static/img/photos/cute-girl-2.png','static/img/thumbs/cute-girl-2_thumbnail_28.png',1,'used',30000,9,'2012',2,5,'asfasfd','individual','kalai','kalaimca.gs@gmail.com','7200300448','2015-05-28','2015-07-07','2015-05-04',NULL,'0',NULL,1,NULL,NULL,NULL),(10,7,2,8,'buy','nokia mobile','static/img/photos/Screenshot from 2015-03-11 18:24:53.png','static/img/thumbs/Screenshot_from_2015-03-11_182453_thumbnail_23.png',1,'used',342,3,'2012',2,5,'adfasdf','individual','kalai','kalaimca.gs@gmail.com','7200300448','2015-05-28','2015-07-07','2015-05-04',NULL,'0',NULL,0,NULL,NULL,NULL),(12,1,2,8,'sell','nokia mobile new series','static/img/photos/logo.jpg,static/img/photos/car.png','static/img/thumbs/logo_thumbnail_1.png,static/img/thumbs/car_thumbnail_4.png',2,'used',12000,2,'2015',2,5,'nokia mobile new model','individual','kalai','kalaimca.gs@gmail.com','7200300448','2015-05-28','2015-07-07','2015-05-22',NULL,'0',NULL,0,NULL,NULL,NULL),(14,NULL,1,2,'sell','kinetic motors','static/img/photos/banner_bg.png,static/img/photos/background.png','static/img/thumbs/banner_bg_thumbnail_2.png,static/img/thumbs/background_thumbnail.png',2,'used',10000,6,'2013',2,5,'kinetic motors','individual','kalai','kalaimca.gs@gmail.com','7200300448','2015-05-28','2015-07-07','2015-05-22',NULL,'0',NULL,0,NULL,NULL,NULL),(15,3,2,8,'buy','samsung mobile1','static/img/photos/Screenshot from 2015-03-11 18:24:53.png','static/img/thumbs/Screenshot_from_2015-03-11_182453_thumbnail_21.png',1,'used',5000,3,'2012',2,5,'asafdasf','individual','kalai','kalaimca.gs@gmail.com','7200300448','2015-05-28','2015-07-07','2015-05-04',NULL,'0',NULL,0,NULL,NULL,NULL),(18,17,2,8,'buy','nokia mobile new','static/img/photos/cute-girl-2.png','static/img/thumbs/cute-girl-2_thumbnail_31.png',1,'used',7000,2,'2015',2,5,'nokia mobile new','individual','kalai','kalaimca.gs@gmail.com','7200300448','2015-05-28','2015-07-07','2015-05-28',1,'0',NULL,1,NULL,NULL,NULL),(19,NULL,2,9,'buy','hcl tablets large','static/img/photos/background.png','static/img/thumbs/background_thumbnail_1.png',1,'used',18000,11,'2014',2,5,'hcl tablets large','individual','kalai','kalaimca.gs@gmail.com','9876543210','2015-05-28','2015-07-07','2015-05-28',0,'0',NULL,0,NULL,NULL,NULL),(20,32,2,8,'buy','micromax','static/img/photos/cute-girl-2.png,static/img/photos/girl.jpg,static/img/photos/Screenshot from 2015-06-23 15:59:18.png','static/img/thumbs/car1_thumbnail_1.png',1,'used',7000,3,'',2,5,'dasfasdf','individual','kalai','kalaimca.gs@gmail.com','9876543210','2015-05-29','2015-06-27','2015-05-29',0,'1',2,1,NULL,NULL,NULL),(21,NULL,2,8,'sell','hcl large tablets','static/img/photos/logo.jpg,static/img/photos/car.png','static/img/thumbs/cute-girl-2_thumbnail_28.png',1,'used',343,2,'2013',2,5,'sdfafasdf','individual','kalai','kalaiadf2@gmail.com','23232','2015-06-01','2015-07-01','2015-06-01',0,'1',3,1,NULL,NULL,NULL),(22,NULL,1,1,'buy','fdfdf','','',1,'used',343,4,'234',2,5,'ddfdf','dealer','kalai','kala343.gs@gmail.com','9876512323','2015-06-20','2015-07-20','2015-06-20',0,'',NULL,1,NULL,NULL,NULL),(23,NULL,1,2,'sell','hero two wheeler is available for sale','static/img/photos/perky-purple.png','static/img/thumbs/perky-purple_thumbnail.png',1,'used',30000,10,'2013',1,2,'i was about to sell my two wheeler','individual','pradeepa','rpradeepa812@gmail.com','9789761928','2015-06-25','2015-07-25','2015-06-25',0,'',NULL,1,NULL,NULL,NULL),(24,NULL,2,8,'buy','micromax mobile large screen','static/img/photos/imgo.jpeg,static/img/photos/Screenshot from 2015-06-23 15:59:18.png','static/img/thumbs/imgo_thumbnail.png,static/img/thumbs/Screenshot_from_2015-06-23_155918_thumbnail.png',2,'used',343,3,'2015',2,5,'asdfasdfasdf','individual','kalai','klkk@gmail.com','9876543210','2015-07-01','2015-07-31','2015-07-01',0,'',NULL,1,NULL,NULL,NULL),(25,36,2,8,'sell','micromax 2015','static/img/photos/close.jpg','static/img/thumbs/close_thumbnail.png',1,'used',500,3,'2010',1,2,'super fast mobile','individual','priya','priya@globalensolutions.com','9626107867','2015-07-01','2015-07-31','2015-07-01',1,'',NULL,1,NULL,NULL,NULL),(26,32,2,8,'sell','mobile','static/img/photos/product4.png','static/img/thumbs/product4_thumbnail.png',1,'used',3000,3,'2015',1,2,'new mobile','individual','neethu venba','ramya@globalensolutions.com','1234567890','2015-07-01','2015-07-31','2015-07-01',1,'',NULL,1,NULL,NULL,NULL),(27,NULL,1,2,'sell','hero honda','static/img/photos/game.png','static/img/thumbs/game_thumbnail.png',1,'used',15000,9,'2015',2,5,'hero honda','individual','kalai','kalai123@gmail.com','9876543210','2015-07-01','2015-07-31','2015-07-01',0,'',NULL,1,NULL,NULL,NULL),(28,NULL,1,2,'sell','hero honda','static/img/photos/game.png','static/img/thumbs/game_thumbnail_1.png',1,'used',15000,9,'2015',2,5,'hero honda','individual','kalai','kalai123@gmail.com','9876543210','2015-07-01','2015-07-31','2015-07-01',0,'',NULL,1,NULL,NULL,NULL),(29,NULL,1,2,'buy','hero honda','static/img/photos/electronics.png','static/img/thumbs/electronics_thumbnail_1.png',1,'used',15000,9,'2015',2,5,'hero honda','individual','kalai','kalai123@gmail.com','9876543210','2015-07-01','2015-07-31','2015-07-01',0,'',NULL,1,NULL,NULL,NULL),(30,32,1,1,'sell','Maruti suzuki','static/img/photos/c.jpeg','static/img/thumbs/c_thumbnail.png',1,'used',500000,4,'2015',1,2,'new car','individual','ramya','ramya@globalensolutions.com','3458942458','2015-07-01','2015-07-31','2015-07-01',1,'',NULL,1,NULL,NULL,NULL),(31,NULL,1,1,'buy','sdsd','static/img/photos/imgo.jpeg','static/img/thumbs/imgo_thumbnail_1.png',1,'used',3434,1,'',2,5,'asfdasdf','individual','kalai','dsfdf3d@gmail.com','','2015-07-08','2015-08-07','2015-07-08',0,'',NULL,1,NULL,NULL,NULL),(32,NULL,1,2,'sell','dsfasdf','static/img/photos/imgo.jpeg','static/img/thumbs/imgo_thumbnail_2.png',1,'used',343,6,'3434',2,5,'asdfasdf','individual','kalai','kalai123asdfasd@gmail.com','34324','2015-07-08','2015-08-07','2015-07-08',0,'',NULL,1,NULL,NULL,NULL),(33,NULL,1,1,'buy','sdfasdf','static/img/photos/Screenshot from 2015-06-23 15:59:18.png','static/img/thumbs/Screenshot_from_2015-06-23_155918_thumbnail_1.png',1,'used',3434,1,'343',1,2,'asdfasdf','individual','k','asfasdfasaf@gmail.com','3434','2015-07-08','2015-08-07','2015-07-08',0,'',NULL,1,NULL,NULL,NULL),(34,NULL,1,1,'buy','sdfasdf','static/img/photos/Screenshot from 2015-06-23 15:59:18.png','static/img/thumbs/Screenshot_from_2015-06-23_155918_thumbnail_2.png',1,'used',3434,1,'343',1,2,'asdfasdf','individual','k','asfasdfasaf@gmail.com','3434','2015-07-08','2015-08-07','2015-07-08',0,'',NULL,1,NULL,NULL,NULL),(35,38,2,8,'sell','micromax doodle3','','',1,'used',11000,3,'2014',2,5,'ghfytu','individual','nethra','nethradhasaratharaj@gmail.com','8344670740','2015-07-10','2015-08-09','2015-07-10',1,'',NULL,1,NULL,NULL,NULL),(36,NULL,1,2,'buy','kinetic motors','','',1,'used',1.57,6,'2015',2,5,'asdfasdf','individual','kalaiarasi','bsdfdf@gmail.com','9987454545','2015-07-23','2015-08-22','2015-07-23',0,'',NULL,1,NULL,NULL,NULL),(37,17,2,8,'sell','dfdasdf','','',1,'used',68.26,2,'2343',2,4,'asdfasdfasdf','individual','kalaiarasi','','343434','2015-07-25',NULL,'2015-07-25',1,'',NULL,1,NULL,NULL,NULL),(38,17,2,8,'sell','dfdasdf','','',1,'used',68.26,2,'2343',2,4,'asdfasdfasdf','individual','kalaiarasi','','343434','2015-07-25',NULL,'2015-07-25',1,'',NULL,1,NULL,NULL,NULL),(39,17,2,8,'sell','dfdasdf','','',1,'used',68.26,2,'2343',2,4,'asdfasdfasdf','individual','kalaiarasi','','343434','2015-07-25',NULL,'2015-07-25',1,'',NULL,1,NULL,NULL,NULL),(40,17,2,8,'sell','dfdasdf','','',1,'used',68.26,2,'2343',2,4,'asdfasdfasdf','individual','kalaiarasi','','343434','2015-07-25',NULL,'2015-07-25',1,'',NULL,1,NULL,NULL,NULL),(41,17,2,8,'buy','asdfasdf','','',1,'used',53.97,2,'2015',2,4,'asdfasdf','individual','kalaiarasi','','98743443','2015-07-25',NULL,'2015-07-25',1,'',NULL,1,NULL,NULL,NULL),(42,NULL,1,1,'sell','tata motor cycle','static/img/photos/imgo.jpeg','static/img/thumbs/imgo_thumbnail_3.png',1,'used',0.31,1,'2015',1,1,'tata motor cycle','individual','kalaiarasi','','9876543210','2015-08-05','2015-08-15','2015-08-05',0,'',NULL,1,NULL,NULL,NULL),(43,NULL,2,8,'sell','my new nokia phone','','',1,'used',0.53,2,'2015',2,4,'nokia phone with high quality pixel','individual','kalaiarasi','','9876543210','2015-08-05','2015-08-15','2015-08-05',0,'',NULL,1,NULL,NULL,NULL),(44,17,2,9,'sell','nok','','',1,'used',0.31,2,'2015',1,1,'asdfasd','individual','','','9876543210','2015-08-12',NULL,'2015-08-12',1,'',NULL,1,NULL,NULL,NULL),(45,17,1,1,'sell','tata motors','','',1,'used',3.65,1,'2015',2,4,'asdfasdf','individual','','','','2015-08-12',NULL,'2015-08-12',1,'',NULL,1,NULL,NULL,NULL),(46,NULL,1,2,'sell','kinetic motors','','',1,'used',255,6,'2013',2,5,'kinetic motors','individual','','','','2015-10-27',NULL,'2015-10-27',1,'',NULL,1,NULL,'',NULL),(47,NULL,1,2,'sell','kinetic motors','','',1,'used',255,6,'2013',2,5,'kinetic motors','individual','','','','2015-10-27',NULL,'2015-10-27',1,'',NULL,1,NULL,'',NULL),(48,NULL,1,2,'buy','hero honda new model','','',1,'used',123,10,'2015',1,1,'asdfasd','individual','','','','2015-10-27',NULL,'2015-10-27',1,'',NULL,1,NULL,'',NULL),(49,NULL,2,9,'sell','hcl test data','static/img/photos/bg-img.png,static/img/photos/1425038083_social_linkedin_button_blue_thumbnail_1.png','static/img/thumbs/bg-img_thumbnail.png,static/img/thumbs/1425038083_social_linkedin_button_blue_thumbnail_1_thumbnail.png',2,'used',4000,11,'2015',1,1,'hcl test data','individual','kalai','','','2015-11-03','2015-11-13','2015-11-03',0,'',NULL,1,NULL,'',''),(50,NULL,1,3,'sell','hero scooty','','',1,'used',20000,10,'2015',1,1,'hero scooty new model','individual','','','','2015-11-22',NULL,'2015-11-22',1,'',NULL,1,NULL,'',''),(51,NULL,2,9,'sell','hcl','static/img/photos/264826-1428079147_thumbnail_2.png','static/img/thumbs/264826-1428079147_thumbnail_2_thumbnail.png',1,'used',10000,11,'2014',2,4,'asfdasd','individual','','','','2015-11-22',NULL,'2015-11-22',1,'',NULL,1,NULL,'','asfasdf'),(52,NULL,2,8,'sell','nokia 52','static/img/photos/1425038083_social_linkedin_button_blue_thumbnail_2.png','static/img/thumbs/1425038083_social_linkedin_button_blue_thumbnail_2_thumbnail.png',1,'used',20000,2,'2014',1,2,'asdfasdf','individual','kalai','','','2015-11-22','2015-12-02','2015-11-22',0,'',NULL,1,NULL,'',''),(53,NULL,2,9,'sell','hcl test data for checking video','','',1,'used',20150,11,'2000',2,4,'hcl','individual','kalai','','','2015-11-22','2015-12-02','2015-11-22',0,'',NULL,1,NULL,'',''),(54,NULL,2,9,'sell','hcl test data for checking video1','static/img/photos/banner_bg_thumbnail_1.png','static/img/thumbs/banner_bg_thumbnail_1_thumbnail.png',1,'used',20000,11,'2015',2,5,'hcl test data for checking video1','dealer','kalai','','','2015-11-22','2015-12-02','2015-11-22',0,'',NULL,1,NULL,'','https://www.youtube.com/watch?v=OcreAU8UIdQ');
/*!40000 ALTER TABLE `advertisement_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement_subcategory`
--

DROP TABLE IF EXISTS `advertisement_subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement_subcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `advertisement_subcategory_42dc49bc` (`category_id`),
  CONSTRAINT `category_id_refs_id_538dded2` FOREIGN KEY (`category_id`) REFERENCES `advertisement_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_subcategory`
--

LOCK TABLES `advertisement_subcategory` WRITE;
/*!40000 ALTER TABLE `advertisement_subcategory` DISABLE KEYS */;
INSERT INTO `advertisement_subcategory` VALUES (1,1,'Cars'),(2,1,'Motorcycles'),(3,1,'Scooters'),(4,1,'Spare Parts - Accessories'),(5,1,'Bicycles'),(6,1,'Buses - Trucks - Commercial Vehicles'),(7,1,'Construction Vehicles'),(8,2,'Mobile Phones'),(9,2,'Mobiles & Tablets'),(10,2,'Accessories'),(11,3,' Home - Kitchen Appliances'),(12,3,' Laptops - Computers'),(13,3,' Computer Peripherals'),(14,3,'  TV - DVD - Multimedia'),(15,3,'Tools - Machinery - Industrial'),(16,3,'   Video Games - Consoles'),(17,3,' Cameras - Digicams'),(18,3,'  Music Systems - Home Theatre'),(19,3,' Inverters, UPS & Generators'),(20,3,'  Security Equipment - Products'),(21,3,'  Fax, EPABX, Office Equipment'),(22,3,' Camera Accessories'),(23,4,'Houses - Apartments for Rent'),(24,4,'Houses - Apartments for Sale'),(25,4,'Land - Plot For Sale'),(26,4,'Commercial Property for Rent'),(27,4,'Paying Guest - Hostel'),(28,4,'Villas/Bungalows for Sale'),(29,4,'Commercial Property for Sale'),(30,4,'Villas/Bungalows for Rent'),(31,4,'Flatmates'),(32,4,'Vacation Rentals - Timeshare'),(33,4,'Service Apartments'),(34,6,'Home - Office Furniture'),(35,6,'Clothing - Garments'),(36,6,'Health - Beauty Products'),(37,6,'Sport - Fitness Equipment'),(38,6,'Home Decor - Furnishings'),(39,6,'Household'),(40,6,'Fashion Accessories'),(41,6,'Watches'),(42,6,'Coins - Stamps     '),(43,6,'Musical Instruments'),(44,6,'Wholesale - Bulk'),(45,6,'Baby - Infant Products'),(46,5,'Full Time Jobs'),(47,5,'Work From Home'),(48,5,'Part Time Jobs'),(49,5,'Placement - Recruitment Agencies'),(50,5,'Freelancers'),(51,5,'Non-Profit NGOs'),(52,5,'Summer Trainees - Interns'),(53,5,'Other Jobs'),(54,7,'Advertising - Design'),(55,7,'Airline - Train - Bus Tickets'),(56,7,'Architect'),(57,7,'Astrology - Numerology'),(58,7,'Baby Sitters - Nanny'),(59,7,'Business Offers'),(60,7,'Carpenters - Furniture Work'),(61,7,'Catering -Tiffin Services'),(62,7,'Computer Repair and Service'),(63,7,'Cooks'),(64,7,'Courier Services'),(65,7,'Doctors'),(66,10,'Acting - Modeling Roles'),(67,10,'Modeling Agencies'),(68,10,'Photographers - Cameraman'),(69,10,'Musicians'),(70,10,'Acting Schools'),(71,10,'Script Writers'),(72,10,'Actor - Model Portfolios'),(73,10,'Make Up - Hair'),(74,10,'Art Directors - Editors'),(75,10,'Studios - Locations for hire'),(76,10,'Fashion Designers - Stylists'),(77,10,'Sound Engineers');
/*!40000 ALTER TABLE `advertisement_subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisement_transaction`
--

DROP TABLE IF EXISTS `advertisement_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisement_transaction` (
  `transaction_id` int(11) NOT NULL,
  `reference` varchar(128) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(8) DEFAULT NULL,
  `payment_method` varchar(128) DEFAULT NULL,
  `payment_reference` varchar(128) DEFAULT NULL,
  `payment_message` varchar(256) DEFAULT NULL,
  `UserIp` varchar(100) DEFAULT NULL,
  `admin_note_created` datetime DEFAULT NULL,
  `admin_note_modified` datetime DEFAULT NULL,
  `admin_note_user` varchar(24) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `transaction_date` datetime DEFAULT NULL,
  `base_amount` decimal(10,2) NOT NULL,
  `base_currency` varchar(6) NOT NULL,
  `base_exchange_rate` decimal(10,4) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`reference`),
  KEY `advertisement_transaction_1be3128f` (`userprofile_id`),
  CONSTRAINT `userprofile_id_refs_id_af104196` FOREIGN KEY (`userprofile_id`) REFERENCES `adjod_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_transaction`
--

LOCK TABLES `advertisement_transaction` WRITE;
/*!40000 ALTER TABLE `advertisement_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertisement_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add user profile',8,'add_userprofile'),(23,'Can change user profile',8,'change_userprofile'),(24,'Can delete user profile',8,'delete_userprofile'),(25,'Can add category',9,'add_category'),(26,'Can change category',9,'change_category'),(27,'Can delete category',9,'delete_category'),(28,'Can add sub category',10,'add_subcategory'),(29,'Can change sub category',10,'change_subcategory'),(30,'Can delete sub category',10,'delete_subcategory'),(34,'Can add product',12,'add_product'),(35,'Can change product',12,'change_product'),(36,'Can delete product',12,'delete_product'),(58,'Can add city',20,'add_city'),(59,'Can change city',20,'change_city'),(60,'Can delete city',20,'delete_city'),(61,'Can add locality',21,'add_locality'),(62,'Can change locality',21,'change_locality'),(63,'Can delete locality',21,'delete_locality'),(139,'Can add source',47,'add_source'),(140,'Can change source',47,'change_source'),(141,'Can delete source',47,'delete_source'),(142,'Can add thumbnail',48,'add_thumbnail'),(143,'Can change thumbnail',48,'change_thumbnail'),(144,'Can delete thumbnail',48,'delete_thumbnail'),(145,'Can add thumbnail dimensions',49,'add_thumbnaildimensions'),(146,'Can change thumbnail dimensions',49,'change_thumbnaildimensions'),(147,'Can delete thumbnail dimensions',49,'delete_thumbnaildimensions'),(148,'Can add send sms',50,'add_sendsms'),(149,'Can change send sms',50,'change_sendsms'),(150,'Can delete send sms',50,'delete_sendsms'),(151,'Can add my metadata (Path)',51,'add_mymetadatapath'),(152,'Can change my metadata (Path)',51,'change_mymetadatapath'),(153,'Can delete my metadata (Path)',51,'delete_mymetadatapath'),(154,'Can add my metadata (Model Instance)',52,'add_mymetadatamodelinstance'),(155,'Can change my metadata (Model Instance)',52,'change_mymetadatamodelinstance'),(156,'Can delete my metadata (Model Instance)',52,'delete_mymetadatamodelinstance'),(157,'Can add my metadata (Model)',53,'add_mymetadatamodel'),(158,'Can change my metadata (Model)',53,'change_mymetadatamodel'),(159,'Can delete my metadata (Model)',53,'delete_mymetadatamodel'),(160,'Can add my metadata (View)',54,'add_mymetadataview'),(161,'Can change my metadata (View)',54,'change_mymetadataview'),(162,'Can delete my metadata (View)',54,'delete_mymetadataview'),(163,'Can add PayPal IPN',55,'add_paypalipn'),(164,'Can change PayPal IPN',55,'change_paypalipn'),(165,'Can delete PayPal IPN',55,'delete_paypalipn'),(187,'Can add cat',63,'add_cat'),(188,'Can change cat',63,'change_cat'),(189,'Can delete cat',63,'delete_cat'),(190,'Can add sub cat',64,'add_subcat'),(191,'Can change sub cat',64,'change_subcat'),(192,'Can delete sub cat',64,'delete_subcat'),(196,'Can add dropdown',66,'add_dropdown'),(197,'Can change dropdown',66,'change_dropdown'),(198,'Can delete dropdown',66,'delete_dropdown'),(202,'Can add message',68,'add_message'),(203,'Can change message',68,'change_message'),(204,'Can delete message',68,'delete_message'),(205,'Can add action',69,'add_action'),(206,'Can change action',69,'change_action'),(207,'Can delete action',69,'delete_action'),(208,'Can add client',70,'add_client'),(209,'Can change client',70,'change_client'),(210,'Can delete client',70,'delete_client'),(214,'Can add dropdown',72,'add_dropdown'),(215,'Can change dropdown',72,'change_dropdown'),(216,'Can delete dropdown',72,'delete_dropdown'),(217,'Can add free alert',73,'add_freealert'),(218,'Can change free alert',73,'change_freealert'),(219,'Can delete free alert',73,'delete_freealert'),(223,'Can add section',75,'add_section'),(224,'Can change section',75,'change_section'),(225,'Can delete section',75,'delete_section'),(226,'Can add size',76,'add_size'),(227,'Can change size',76,'change_size'),(228,'Can delete size',76,'delete_size'),(229,'Can add placement',77,'add_placement'),(230,'Can change placement',77,'change_placement'),(231,'Can delete placement',77,'delete_placement'),(232,'Can add Client',78,'add_client'),(233,'Can change Client',78,'change_client'),(234,'Can delete Client',78,'delete_client'),(235,'Can add Campaign',79,'add_campaign'),(236,'Can change Campaign',79,'change_campaign'),(237,'Can delete Campaign',79,'delete_campaign'),(238,'Can add Attribute',80,'add_attribute'),(239,'Can change Attribute',80,'change_attribute'),(240,'Can delete Attribute',80,'delete_attribute'),(241,'Can add Dimension',81,'add_dimension'),(242,'Can change Dimension',81,'change_dimension'),(243,'Can delete Dimension',81,'delete_dimension'),(244,'Can add Banner',82,'add_banner'),(245,'Can change Banner',82,'change_banner'),(246,'Can delete Banner',82,'delete_banner'),(247,'Can add Version',83,'add_version'),(248,'Can change Version',83,'change_version'),(249,'Can delete Version',83,'delete_version'),(250,'Can add worker',84,'add_worker'),(251,'Can change worker',84,'change_worker'),(252,'Can delete worker',84,'delete_worker'),(253,'Can add worker task',85,'add_workertask'),(254,'Can change worker task',85,'change_workertask'),(255,'Can delete worker task',85,'delete_workertask'),(259,'Can add user tracking',87,'add_usertracking'),(260,'Can change user tracking',87,'change_usertracking'),(261,'Can delete user tracking',87,'delete_usertracking'),(262,'Can add site banner',88,'add_sitebanner'),(263,'Can change site banner',88,'change_sitebanner'),(264,'Can delete site banner',88,'delete_sitebanner'),(277,'Can add worker notice email task',93,'add_workernoticeemailtask'),(278,'Can change worker notice email task',93,'change_workernoticeemailtask'),(279,'Can delete worker notice email task',93,'delete_workernoticeemailtask'),(280,'Can add premium price info',94,'add_premiumpriceinfo'),(281,'Can change premium price info',94,'change_premiumpriceinfo'),(282,'Can delete premium price info',94,'delete_premiumpriceinfo'),(283,'Can add product expired ad tracking',95,'add_productexpiredadtracking'),(284,'Can change product expired ad tracking',95,'change_productexpiredadtracking'),(285,'Can delete product expired ad tracking',95,'delete_productexpiredadtracking'),(295,'Can add chat message',99,'add_chatmessage'),(296,'Can change chat message',99,'change_chatmessage'),(297,'Can delete chat message',99,'delete_chatmessage'),(298,'Can add last active',100,'add_lastactive'),(299,'Can change last active',100,'change_lastactive'),(300,'Can delete last active',100,'delete_lastactive'),(301,'Can add rate source',101,'add_ratesource'),(302,'Can change rate source',101,'change_ratesource'),(303,'Can delete rate source',101,'delete_ratesource'),(304,'Can add rate',102,'add_rate'),(305,'Can change rate',102,'change_rate'),(306,'Can delete rate',102,'delete_rate'),(307,'Can add transaction',103,'add_transaction'),(308,'Can change transaction',103,'change_transaction'),(309,'Can delete transaction',103,'delete_transaction');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','admin','','admin@gmail.com','pbkdf2_sha256$10000$Ypa8aL1o88zP$KO7o+nwocNv32Z+jP/q8OToNJs/cpzhhD9XxT5NJrUc=',1,1,1,'2015-11-04 03:31:15','2015-01-07 04:38:20'),(25,'geetha','geetha','','kalaimca.gs1@gmail.com','pbkdf2_sha256$10000$iMrYrVMD4LAO$0iWE5vxQawCJZAM7sewS3NIgdtofXzPCJWuQQ9/AFYM=',0,1,0,'2015-04-13 07:28:06','2015-02-07 09:13:02'),(41,'kalai1','kalai1','','kalaimca.gs2@gmail.com','pbkdf2_sha256$10000$aZI2a9kQUaeT$VcD1iMHeCaX8vSD//vN3esKU2Ft4lFzCeS/72B2Kuck=',0,1,0,'2015-03-03 09:42:01','2015-02-07 10:31:01'),(42,'kalai2','kalai2','','kalaimca.g3@gmail.com','pbkdf2_sha256$10000$qZjWGpx07j2u$fBWo+9U1OZcoqM8KUsN+MbUf0jIVNbkB7qwHNEVZJIM=',0,1,0,'2015-02-20 05:52:54','2015-02-09 06:24:59'),(43,'kalai8','kalai8','','kalaimca.gs4@gmail.com','pbkdf2_sha256$10000$qcqQEMI2zT3i$VqteSpzm0gvbin7yQrFz8T3urFxjeLErdi2hlFz5AbM=',0,1,0,'2015-02-16 04:45:47','2015-02-16 04:45:11'),(44,'kalai4','kalai4','','admin@gmail.com','pbkdf2_sha256$10000$aR5yQuMR6B3u$NkdT7EALpu0sySOPUX51fxWs3unjWNtZYlEOk1z33Hc=',1,1,1,'2015-04-13 07:26:46','2015-02-26 04:21:59'),(45,'kalai5','kalai5','','kalaimca.gs5@gmail.com','pbkdf2_sha256$10000$5zr6ktv6PfhJ$Sujs6ArGOSb8Gc+r1h06ASPrCoGQ6S3uD8E3dPQSXN8=',0,1,0,'2015-07-10 05:12:45','2015-03-06 06:28:36'),(46,'kalai6','kalai6','','kalai111@gmail.com','pbkdf2_sha256$10000$MTOmog0Nz8gH$Qp/xfJvDM6eyFfYm3W/DrJy+wJz+MkBxa4C6ZWTQVWI=',0,0,0,'2015-04-15 09:49:29','2015-04-15 09:49:29'),(49,'kalai7','kalai7','','kalai2222@gmail.com','pbkdf2_sha256$10000$LT8B8LjYlkfi$tS2dBgLVNm521APtGB+V9sORHbUQg6XyFNFujUfpyAM=',0,0,0,'2015-04-15 09:51:02','2015-04-15 09:51:02'),(53,'kalai1@gmail.com','kalai12','','kalai1@gmail.com','kalai',0,0,0,'2015-04-15 09:56:39','2015-04-15 09:56:39'),(55,'kalai2@gmail.com','kalai21','','kalai2@gmail.com','kalai',0,0,0,'2015-04-15 09:58:26','2015-04-15 09:58:26'),(57,'kalai3@gmail.com','kalai31','','kalai3@gmail.com','kalai3',0,0,0,'2015-04-15 09:58:59','2015-04-15 09:58:59'),(59,'kalai4@gmail.com','kalai41','','kalai4@gmail.com','kalai',0,0,0,'2015-04-15 10:01:26','2015-04-15 10:01:26'),(60,'kalai5@gmail.com','kalai51','','kalai5@gmail.com','kalai',0,0,0,'2015-04-15 10:02:01','2015-04-15 10:02:01'),(61,'kalai6@gmail.com','kalai61','','kalai6@gmail.com','kalai',0,0,0,'2015-04-15 10:04:50','2015-04-15 10:04:50'),(62,'kalai7@gmail.com','kalai71','','kalai7@gmail.com','kalai',0,0,0,'2015-04-15 10:29:41','2015-04-15 10:29:41'),(63,'kalai8@gmail.com','kalai81','','kalai8@gmail.com','kalai',0,0,0,'2015-04-15 10:31:08','2015-04-15 10:31:08'),(64,'kalai9@gmail.com','kalai91','','kalai9@gmail.com','pbkdf2_sha256$10000$hb9gaoB43Vn9$D/LDcal/OFzpHnx/2PupksBtTvzdJ4Y8T0seFSYfNEY=',0,0,0,'2015-04-15 10:52:10','2015-04-15 10:52:10'),(65,'kalai','kalai','','kalaimca.gs@gmail.com','pbkdf2_sha256$10000$ITVAic1LV9kJ$Fksx7zcoPwGo+aJCsrLqtkbc8cRGm93yB232wxjWTQw=',0,1,0,'2015-11-23 03:12:36','2015-04-15 10:53:26'),(66,'vanimca92@gmail.com','vani','','vanimca92@gmail.com','pbkdf2_sha256$10000$Ruu9i3zE5ib9$nksjG3WxCyKzyYNP5ZfeFIn3TB7qqXiOeqC4suO1CIg=',0,0,0,'2015-04-21 11:58:57','2015-04-21 11:58:57'),(67,'kalaimca1.gs@gmail.com','kalaimca1','','kalaimca1.gs@gmail.com','pbkdf2_sha256$10000$uWcECZiZpd0g$BpnwrFYZx4AOQ0AJuLmy1qFxv/g/MAvIDMH/Rdc/NjQ=',0,0,0,'2015-06-12 11:43:23','2015-06-12 11:43:23'),(71,'kalaimca2.gs@gmail.com','kalaimca2','','kalaimca2.gs@gmail.com','pbkdf2_sha256$10000$O27ZAjX9YZOo$MWR8WwB4EywW0FT2Fn8JPQV1sSnQyX39JjmzQztDr6I=',0,0,0,'2015-06-12 11:46:46','2015-06-12 11:46:46'),(73,'kalaimca3.gs@gmail.com','kalaimca3','','kalaimca3.gs@gmail.com','pbkdf2_sha256$10000$4wvzCCWVCp7C$S7Q3/gkxweS3bJc922JDlWKQ9vqsj+J6vOB3KV52dt0=',0,0,0,'2015-06-12 12:10:47','2015-06-12 12:10:47'),(74,'kalaimca4.gs@gmail.com','kalaimca4','','kalaimca4.gs@gmail.com','pbkdf2_sha256$10000$biB1ZAk6tOew$ovGC5ztkq+o5BFHnCIW09DdpIIJrwUsMlci3kPBCRw0=',0,0,0,'2015-06-12 12:13:29','2015-06-12 12:13:29'),(75,'kalaimca5.gs@gmail.com','kalaimca5','','kalaimca5.gs@gmail.com','pbkdf2_sha256$10000$UmqRMo022tYQ$6RnHkgcRJI1kbWkRY9zwMGjUFtk3XxyVHstjftKo+qY=',0,0,0,'2015-06-12 12:16:24','2015-06-12 12:16:24'),(76,'kalaimca6.gs@gmail.com','kalaimca6','','kalaimca6.gs@gmail.com','pbkdf2_sha256$10000$Gm8dIPcX6rg6$hbUdn1cG2edfUsyYl9VIlW0sUhU+9FWmiCqQSLMQ0iQ=',0,0,0,'2015-06-12 12:54:01','2015-06-12 12:54:01'),(77,'kalaimca8.gs@gmail.com','kalaimca8','','kalaimca8.gs@gmail.com','pbkdf2_sha256$10000$X3pxJw80LChx$3rdw/J9Hh4ZgTer9qHVKiwvwMLzFx5Jq/wAuAkdrHRY=',0,0,0,'2015-06-12 12:59:03','2015-06-12 12:59:03'),(78,'kalaimca9.gs@gmail.com','kalaimca9','','kalaimca9.gs@gmail.com','pbkdf2_sha256$10000$HPe38A0YQiM6$vW9jAuMW+zK2Aj5v6NdZpcb0KpBAgQ8PWuOXyjMBdcg=',0,0,0,'2015-06-12 13:03:13','2015-06-12 13:03:13'),(80,'kalaim.gs@gmail.com','kalaim','','kalaim.gs@gmail.com','pbkdf2_sha256$10000$eLII8Yih1Fah$xj9egygTunR5IGlDqtr2hQGLpU/ho0peY187bfn8q+4=',0,0,0,'2015-06-12 13:05:46','2015-06-12 13:05:46'),(81,'kalaimca.gasdsfs@gmail.com','kalaimcags','','kalaimca.gasdsfs@gmail.com','pbkdf2_sha256$10000$5ED6rieAaP5u$S2okTX+Vf9S2PUuOyFXLjW7Vb4AMp72hcEV5iPCkM/c=',0,0,0,'2015-06-12 13:10:50','2015-06-12 13:10:50'),(82,'kalaimca11.gs@gmail.com','kalaimca11','','kalaimca11.gs@gmail.com','pbkdf2_sha256$10000$EEU7yypxAYk2$0AvBCjy99Wz3ABp6UKO3eejxy9Jtrv+IDI6OT5k8k0Y=',0,0,0,'2015-06-12 14:31:11','2015-06-12 14:31:11'),(83,'kalaidfdf@gmail.com','kalaivijaya','','kalaidfdf@gmail.com','pbkdf2_sha256$10000$1QYtIU7lKwJS$MFum5Zi5Fd6MWZ0ZLEdVf2waE6c5NnhkkZKBP8LO1/Q=',0,0,0,'2015-06-13 04:52:10','2015-06-13 04:52:10'),(84,'sdfd@gmail.com','sdfd','','sdfd@gmail.com','pbkdf2_sha256$10000$BERpqDI1ArT2$wrv3FmsM7/zGAbVj7UaDyzhwtloH/PCCQ3UzeYdIjBU=',0,0,0,'2015-06-13 04:55:36','2015-06-13 04:55:36'),(85,'kalaimcasdfsdfa.gs@gmail.com','kalaimc','','kalaimcasdfsdfa.gs@gmail.com','pbkdf2_sha256$10000$TWRBulwEasZ4$24J58b6s6RViNIykmKRT5ysDQF2Awc+1n+Z39WRoRgM=',0,0,0,'2015-06-13 06:03:05','2015-06-13 06:03:05'),(88,'rrer@gmail.com','rrer','','rrer@gmail.com','pbkdf2_sha256$10000$zIjAqEAmqYS2$2LRYB+5SVCfONyDYFrq4DNJuZr5nh3YWJFSKSqMuQF0=',0,0,0,'2015-06-13 06:04:56','2015-06-13 06:04:56'),(89,'ddfdf@gmail.com','ddfdf','','ddfdf@gmail.com','pbkdf2_sha256$10000$cjW0sTU0RJfI$1IMpvRyksqhwhERiJ1A5S2q36gKMKqnY88klr9KruTU=',0,0,0,'2015-06-13 06:07:19','2015-06-13 06:07:19'),(90,'asdf@gmail.com','asdf','','asdf@gmail.com','pbkdf2_sha256$10000$PNhEp0xif5bK$1nZ/bY9fujKuDANK5JipGQ66QnjKNb8TMbuD9utud+c=',0,0,0,'2015-06-13 06:24:22','2015-06-13 06:24:22'),(92,'priya1','priya','','','pbkdf2_sha256$10000$28xgij73sWxA$CfFqqxt4X5AjMUOAJS78AiXsdBfDm23ekzG0ZInbBJk=',0,1,0,'2015-07-21 13:46:14','2015-06-24 13:13:37'),(93,'ramya','ramya','','ramya@globalensolutions.com','pbkdf2_sha256$10000$DyvCtNn60qno$LBy1cPRL/E1G4jC2FGWnWIrl0k9Akg0sCAPEzwqbhQw=',0,1,0,'2015-11-22 19:57:21','2015-06-24 13:14:34'),(94,'ladoo@gmail.com','ladoo','','ladoo@gmail.com','!',0,0,0,'2015-06-25 09:49:47','2015-06-25 09:49:47'),(99,'rpradeepa812@gmail.com','pradeepa','','rpradeepa812@gmail.com','pbkdf2_sha256$10000$y5MtCUaxTzbz$BRiLY2EtjcXs0WG1cqB7EEvu6JvXwwhRLE1WVt+CVtY=',0,0,0,'2015-06-25 09:52:40','2015-06-25 09:52:40'),(102,'ladooo@gmail.com','laddooo','','ladooo@gmail.com','pbkdf2_sha256$10000$z0QzvTUFhiP9$FbGCIH9TgH6S882mAT2hceFCJAJ7bDLEhy58MbTAv/U=',0,0,0,'2015-06-25 09:57:34','2015-06-25 09:57:34'),(103,'kk','kk','','kk','pbkdf2_sha256$10000$ke4hZx1HE8GZ$INdfBHCWzgK1nASroNcJwlXPkifQdZeCMQy8to0f3Wo=',0,0,0,'2015-06-25 10:07:16','2015-06-25 10:07:16'),(104,'fdfd','fdfd','','fdfd','pbkdf2_sha256$10000$I4rbe3mAYuN2$DE3f0S0oDzuvP/2GVU70JrvszBIdLF4esrc3MuO0jw0=',0,0,0,'2015-06-25 10:23:45','2015-06-25 10:23:45'),(105,'kal34@gmail.com','kal34','','kal34@gmail.com','pbkdf2_sha256$10000$wa6BRFtfCTmD$v12bvHKaayay3FiuBZNTvKz8FwBQeZzKNJtMM1TgNh4=',0,0,0,'2015-06-25 10:32:58','2015-06-25 10:32:58'),(107,'ere@gmail.com','ere','','ere@gmail.com','pbkdf2_sha256$10000$juTYTx4KfRNK$6G6wyEwEjq7VmV6Qpv9bDXTsZTkp0svC2Anlqq703y0=',0,0,0,'2015-06-25 10:35:21','2015-06-25 10:35:21'),(110,'dff@gmail.com','dff','','dff@gmail.com','pbkdf2_sha256$10000$98VVtdVSbKtm$ajzTT7neVKf7eXtb/9oR7l1VpwvMsjesfS8DjEi+XKQ=',0,0,0,'2015-06-25 10:36:28','2015-06-25 10:36:28'),(112,'rere@gmail.com','rere','','rere@gmail.com','pbkdf2_sha256$10000$QomCJPl3T4tk$m6EcM3UrjjHOssSZ46u54k8OQxgKNA8d9xJl2Lp0I7M=',0,0,0,'2015-06-25 10:37:28','2015-06-25 10:37:28'),(113,'kalai@gmail.com','kalaigmail','','kalai@gmail.com','pbkdf2_sha256$10000$J7grbnC2YsQm$Cb2LBrW/b96cvOwHCVca3F6rX+frw+osJfk/wBK7Ofc=',0,0,0,'2015-06-25 10:40:25','2015-06-25 10:40:25'),(114,'cheerpeeps5@gmail.com','cheerpradeepa','','cheerpeeps5@gmail.com','pbkdf2_sha256$10000$xH1R6bYRW6Dq$dwTiRgx5teu8Mq1dRcLcODKV/SVMYNMQR7K42BStl+k=',0,0,0,'2015-06-25 10:57:52','2015-06-25 10:57:52'),(115,'priya','priyaglobal','','priya@globalensolutions.com','pbkdf2_sha256$10000$zhMSqJGp8NZx$C3t45L2zR9nBFqWXr5abA/1/uJXu0ksKvsmRC9AMBr8=',0,1,0,'2015-08-12 05:07:42','2015-06-26 05:54:16'),(116,'nethragowridevi@gmail.com','nethragowri','','nethragowridevi@gmail.com','pbkdf2_sha256$10000$MFjS2V7zJ8ik$QPrfrv1smD7LxqmjdW/+puAB+Ke52EMint3gMXtIlNY=',0,0,0,'2015-06-29 06:36:04','2015-06-29 06:36:04'),(117,'nethradhasaratharaj@gmail.com','nethra','','nethradhasaratharaj@gmail.com','pbkdf2_sha256$10000$Nd6KxvdRVrVw$p0wVqIOaQ8ggRNHO5w88UkAZDqPuZ+BxCRLeBQiXJVQ=',0,1,0,'2015-07-10 07:57:07','2015-06-29 06:37:40'),(118,'','','','','!',0,0,0,'2015-07-03 10:37:45','2015-07-03 10:37:45'),(123,'dharshini','dharshini','','dharshini@gmail.com','pbkdf2_sha256$10000$QRkjsx91tEYF$4REeXvPE2MDxlhgyjj66JvFZRiIwo8FKLEbG8go6KfY=',0,0,0,'2015-07-04 06:06:42','2015-07-04 06:06:42'),(124,'fd','fd','','easdf@gmail.com','pbkdf2_sha256$10000$DN35vC8oESMU$zNnd0SuFK9IFnx64k1+cffPIyIN0UkMikxcwi/4zUB0=',0,0,0,'2015-07-04 09:47:15','2015-07-04 09:47:15'),(125,'ereasd','ereasd','','kalaiafadsfasdf@gmail.com','pbkdf2_sha256$10000$NtENd8UtnCjn$MTy4g3UKeeXJRmedRHbeYju19OaQD5xqE6NNAL60eIU=',0,0,0,'2015-07-04 09:51:16','2015-07-04 09:51:16'),(127,'k','k','','kalaimca.gssaas@gmail.com','pbkdf2_sha256$10000$rr2fVDYSrU2q$9GYbgOiIvfckPaeXY8mIXyNKR/c1XvbSxbis0gOwY4M=',0,0,0,'2015-07-04 09:56:43','2015-07-04 09:56:43'),(128,'sastha','sastha','','sastha@globalensolutions.com','pbkdf2_sha256$10000$IYJXdpXTAVw5$h9kJ0zWp2mbRCg4he04sRVAkVJWZ2kD55QuEnZqGs9M=',0,0,0,'2015-07-07 05:44:29','2015-07-07 05:44:29'),(132,'a@gmail.com','a@gmail.com','','a@gmail.com','pbkdf2_sha256$10000$pPClH5S94eme$U7dlhG/7lrr3Rn0NMBwm/ZdJoP1ukYVcEuSR49V9XWc=',0,0,0,'2015-07-07 10:04:52','2015-07-07 10:04:52'),(133,'b','b','','b@gmail.com','pbkdf2_sha256$10000$V6oxBn5DZX6H$OM9i5j0V6sZu6HEdEyzy4qumwXdqI1VQu20c+nc07ck=',0,0,0,'2015-07-07 10:07:56','2015-07-07 10:07:56'),(134,'c','c','','c@gmail.com','pbkdf2_sha256$10000$DiHlXvCeH8d5$YWd2XCbMtR3p3CKIWqD4du5jF5dybKnqfg04gpI4KQM=',0,0,0,'2015-07-07 10:11:34','2015-07-07 10:11:34'),(135,'d','d','','d@gmail.com','pbkdf2_sha256$10000$usf0pSMzJJQz$hquyJ/f/FAbeIM8cAW5hKSloc6Iv0xZvMh9uIeiS5V4=',0,0,0,'2015-07-07 10:15:39','2015-07-07 10:15:39'),(136,'f','f','','f@gmail.com','pbkdf2_sha256$10000$eAH1WBUXFMvm$dtiBJ5XC74eLpSv2ZFTRSnWhKo2mcOGWV5a0g3Bjj6U=',0,0,0,'2015-07-07 10:28:52','2015-07-07 10:28:52'),(137,'g','g','','g@gmail.com','pbkdf2_sha256$10000$JyjlGY2iYWsX$s6qHZo3hpQTjp2EU75KYk3U/NUCwaCAdFNMrUJdFbs8=',0,0,0,'2015-07-07 10:30:53','2015-07-07 10:30:15'),(138,'testmail123sample@gmail.com','testmail123sample@gmail.com','','testmail123sample@gmail.com','pbkdf2_sha256$10000$Fidehdlwe6DB$wobzCYJEuvhNPJlij0z0McvcURuc2wOaPUY0ETDzEg4=',0,0,0,'2015-07-08 05:32:30','2015-07-08 05:30:52'),(139,'dfdfdf','dfdfdf','','dfdf2323@gmail.com','pbkdf2_sha256$10000$ovLGRfQqeCc2$CkfMG3Oh1v8fOdeYybpKvyqe0R4QMVFnH/oNe8K5/6s=',0,0,0,'2015-07-08 05:36:01','2015-07-08 05:35:36'),(140,'fdf','fdf','','dfd@gmail.com','pbkdf2_sha256$10000$OA65453epOmD$ga4wYjdSRLihDTI8b7by/jsHHqKSt/hQxJoAAVaIsts=',0,0,0,'2015-07-08 05:42:50','2015-07-08 05:36:29'),(141,'spmuthu21','spmuthu21','','spmuthu21@gmail.com','pbkdf2_sha256$10000$XNxMwDYYrR2K$ANDwmzj0S3/mq8VA/ZtH7YibbGRnxsuRoaxK67SpkVM=',0,0,0,'2015-07-09 07:18:56','2015-07-09 06:54:18'),(142,'kalaijune26','kalaijune26','','kalai_june26@yahoo.com','pbkdf2_sha256$10000$aI6E8mE9p6RL$Oy7zDI0FBzv/U2DoI4/LaQ/Ya3vU+zBRRE2CYJsZDQw=',0,1,0,'2015-07-21 16:29:20','2015-07-21 16:29:20'),(143,'abcxyz','abcxyz','','abcxyz@gmail.com','pbkdf2_sha256$10000$OOzv5ZZoxP8b$jSC442QE5QtAn6BEWDqsdgrZ+4f5TvNEG+pR5a3VPUc=',0,1,0,'2015-07-24 11:16:16','2015-07-24 11:12:50'),(144,'sp','sp','','a@a.com','pbkdf2_sha256$10000$AUcHRXZEjUjF$6R13wpN8J21K0WEmgXfpCT0YD0XUuSlxdjaSFGHq8EM=',0,1,0,'2015-08-04 06:45:48','2015-08-04 06:45:35'),(145,'spbala','spbala','','a1@a.com','pbkdf2_sha256$10000$Z2NXu9CQLtAY$YCbTNSOKmkQe3HNuSpr65kVC6iFjmHGZmLvbfcN6ZRc=',0,1,0,'2015-08-04 06:52:12','2015-08-04 06:46:56'),(146,'spbala1','spbala1','','avbmail93@gmail.com','pbkdf2_sha256$10000$yBLNIX5qRBMd$RlAwyClv0op88HnOFgDwuEeRk8nJpiM0CesguXlp04A=',0,1,0,'2015-08-04 06:53:41','2015-08-04 06:52:38'),(147,'kalaiarasi1','kalaiarasi1','','kalai.rkv9@gmail.com','pbkdf2_sha256$10000$4RpizMG3xjDa$YuK0x5o7ojyM7sNvEDr2bIUXM9V9vze0YV1DpLqGeB8=',0,1,0,'2015-08-07 07:29:16','2015-08-04 07:47:56'),(148,'kalaiarasi','kalaiarasi','','kalai.rkv91@gmail.com','pbkdf2_sha256$10000$suZEYS1ILDBd$VtU7roipbqqL3qZECSj4BrdWLs2mRrBzwwapbhNHx9o=',0,1,0,'2015-08-05 05:32:13','2015-08-05 05:31:02'),(149,'sss','sss','','sss@gmail.com','pbkdf2_sha256$10000$MTOUXIWAi8ii$ycShUDZLZka7B8TTs8iFUZ0IXWkLPf3d8ZCnX94abew=',0,1,0,'2015-10-27 07:51:19','2015-10-27 07:51:19'),(150,'vvv','vvv','','vvv@gmail.com','pbkdf2_sha256$10000$OD9b12vWSlI5$OXmD0j0wutw7H5vUqbn9JWj5RUZH428syZPXdudzdO8=',0,1,0,'2015-10-27 07:53:54','2015-10-27 07:53:42'),(151,'rkv','rkv','','rkv@gmail.com','pbkdf2_sha256$10000$69Q1afXWXR2d$0Pr1NaCEMPDjLn6MAPccoXoXedH0QY/D4pNURHFNTsw=',0,1,0,'2015-11-04 02:18:37','2015-11-04 02:16:45');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_sitebanner`
--

DROP TABLE IF EXISTS `banner_sitebanner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner_sitebanner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `banner` varchar(100) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `pageurl` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_sitebanner`
--

LOCK TABLES `banner_sitebanner` WRITE;
/*!40000 ALTER TABLE `banner_sitebanner` DISABLE KEYS */;
INSERT INTO `banner_sitebanner` VALUES (1,'static/banners/banner4.png','http://www.google.com','/','bottom'),(2,'static/banners/banner5..gif','http://www.gmail.com','/','bottom'),(3,'static/banners/banner1','http://google.com','/','bleft'),(4,'static/banners/banner4.jpeg','http://google.com','/','bleft'),(5,'static/banners/banner3.jpg','http://google.com','/','bright'),(6,'static/banners/banner4_1.jpeg','http://google.com','/','bright');
/*!40000 ALTER TABLE `banner_sitebanner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_chatmessage`
--

DROP TABLE IF EXISTS `chat_chatmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_chatmessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender` varchar(50) NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `product_id` int(11) NOT NULL,
  `message` varchar(200) NOT NULL,
  `received_at` datetime NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_chatmessage_bb420c12` (`product_id`),
  CONSTRAINT `product_id_refs_id_d0f5b2dd` FOREIGN KEY (`product_id`) REFERENCES `advertisement_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_chatmessage`
--

LOCK TABLES `chat_chatmessage` WRITE;
/*!40000 ALTER TABLE `chat_chatmessage` DISABLE KEYS */;
INSERT INTO `chat_chatmessage` VALUES (1,'kalai','ramya',26,'hello','2015-10-07 04:52:08',0,'2015-10-07 04:52:08'),(2,'ramya','kalai',26,'hi','2015-10-07 04:52:13',0,'2015-10-07 04:52:13'),(3,'kalai','ramya',26,'nice','2015-10-07 04:52:26',0,'2015-10-07 04:52:26'),(4,'kalai','ramya',26,'good','2015-10-07 04:54:49',0,'2015-10-07 04:54:49'),(5,'ramya','kalai',26,'sss','2015-10-07 04:54:55',0,'2015-10-07 04:54:55'),(6,'ramya','kalai',44,'hello nokia user','2015-10-07 04:55:31',0,'2015-10-07 04:55:31'),(7,'kalai','ramya',44,'ssss','2015-10-07 04:55:42',0,'2015-10-07 04:55:42'),(8,'ramya','kalai',44,'super','2015-10-07 04:55:48',0,'2015-10-07 04:55:48'),(9,'ramya','kalai',40,'dfdasdf','2015-10-07 04:57:56',0,'2015-10-07 04:57:56'),(318,'kalai','ramya',26,'aaaaaaaaa','2015-10-27 04:53:59',0,'2015-10-27 04:53:59'),(319,'kalai','ramya',26,'bbbbbbbbbbbbbbbb','2015-10-27 04:58:21',0,'2015-10-27 04:58:21'),(320,'kalai','ramya',26,'ccccccccccccccc','2015-10-27 05:00:21',0,'2015-10-27 05:00:21'),(321,'kalai','ramya',26,'ddddddddd','2015-10-27 05:01:31',0,'2015-10-27 05:01:31'),(322,'kalai','ramya',26,'eeeeeeeee','2015-10-27 05:02:28',0,'2015-10-27 05:02:28'),(323,'kalai','ramya',26,'ffffffffff','2015-10-27 05:06:30',0,'2015-10-27 05:06:30'),(324,'ramya','kalai',26,'gggggggggggggg','2015-10-27 05:06:35',0,'2015-10-27 05:06:35'),(325,'kalai','ramya',26,'hhhhhhhhhhhhhh','2015-10-27 05:06:38',0,'2015-10-27 05:06:38'),(326,'kalai','ramya',26,'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii','2015-10-27 05:09:02',0,'2015-10-27 05:09:02'),(327,'kalai','ramya',26,'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj','2015-10-27 05:10:02',0,'2015-10-27 05:10:02'),(328,'kalai','ramya',26,'kkkkkkkkkkkkkkkkk','2015-10-27 05:11:04',0,'2015-10-27 05:11:04'),(329,'kalai','ramya',26,'llllllllllllllll','2015-10-27 05:16:06',0,'2015-10-27 05:16:06'),(330,'kalai','ramya',26,'mmmmmmmmmmmm','2015-10-27 05:22:54',0,'2015-10-27 05:22:54'),(331,'kalai','kalai',26,'nnnnnnnnnnnnnnn','2015-10-27 05:24:54',0,'2015-10-27 05:24:54'),(332,'kalai','kalai',26,'oooooooooooooo','2015-10-27 05:25:05',0,'2015-10-27 05:25:05'),(333,'kalai','ramya',26,'pppppppppppp','2015-10-27 05:54:07',0,'2015-10-27 05:54:07'),(334,'kalai','ramya',26,'qqqqqqqqqqqqqqqqqq','2015-10-27 05:54:14',0,'2015-10-27 05:54:14'),(335,'ramya','kalai',26,'rrrrrrrrrrrrrrrrrrrrrrr','2015-10-27 05:54:17',0,'2015-10-27 05:54:17'),(336,'kalai','ramya',26,'fasdfasd','2015-10-27 05:54:31',0,'2015-10-27 05:54:31'),(337,'ramya','kalai',26,'asdfda','2015-10-27 05:54:33',0,'2015-10-27 05:54:33'),(338,'kalai','ramya',26,'asfdasdf','2015-10-27 05:54:37',0,'2015-10-27 05:54:37'),(339,'kalai','ramya',26,'aaaaaaaaaaa','2015-10-27 06:03:28',0,'2015-10-27 06:03:28'),(340,'kalai','ramya',26,'bbbbbbbbbbb','2015-10-27 06:03:43',0,'2015-10-27 06:03:43'),(341,'ramya','kalai',26,'ccccccccccccc','2015-10-27 06:03:56',0,'2015-10-27 06:03:56'),(342,'kalai','ramya',26,'ddddd','2015-10-27 06:11:47',0,'2015-10-27 06:11:47'),(343,'kalai','ramya',26,'eeeeeeeeeeee','2015-10-27 06:27:05',0,'2015-10-27 06:27:05'),(344,'ramya','kalai',26,'fffffffffffffffff','2015-10-27 06:27:09',0,'2015-10-27 06:27:09'),(345,'kalai','ramya',26,'gggggggggggggggg','2015-10-27 06:27:12',0,'2015-10-27 06:27:12'),(346,'ramya','kalai',26,'hhhhhhhhhhhhh','2015-10-27 06:27:15',0,'2015-10-27 06:27:15'),(347,'kalai','ramya',26,'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii','2015-10-27 07:10:20',0,'2015-10-27 07:10:20'),(348,'ramya','kalai',26,'jjjjjjjjjjjjjjjjjjjjjjjjjjj','2015-10-27 07:10:24',0,'2015-10-27 07:10:24'),(349,'kalai','ramya',26,'kkkkkkkkkkkkkkkkkkkk','2015-10-27 07:10:27',0,'2015-10-27 07:10:27'),(350,'ramya','kalai',26,'llllllllllllllllllllllllllllllll','2015-10-27 07:10:31',0,'2015-10-27 07:10:31'),(351,'kalai','ramya',26,'mmmmmmmmmmmmm','2015-10-27 07:12:40',0,'2015-10-27 07:12:40'),(352,'ramya','kalai',26,'nnnnnnnnnnnnn','2015-10-27 07:12:43',0,'2015-10-27 07:12:43'),(353,'kalai','ramya',26,'ooooooooooooo','2015-10-27 07:12:47',0,'2015-10-27 07:12:47'),(354,'ramya','kalai',26,'ppppppppppppppp','2015-10-27 07:12:51',0,'2015-10-27 07:12:51'),(355,'kalai','ramya',26,'qqqqqqqqqqqqqqq','2015-10-27 07:13:15',0,'2015-10-27 07:13:15'),(356,'ramya','kalai',26,'rrrrrrrrrrrrrrrrrrrrrrrrrrrr','2015-10-27 07:13:20',0,'2015-10-27 07:13:20'),(357,'kalai','ramya',26,'sssssssssssssssssss','2015-10-27 07:13:23',0,'2015-10-27 07:13:23'),(358,'ramya','kalai',26,'tttttttttttttttttttttttttttttttt','2015-10-27 07:13:28',0,'2015-10-27 07:13:28'),(359,'kalai','ramya',26,'uuuuuuuuuuuuuuuuu','2015-10-27 07:13:31',0,'2015-10-27 07:13:31'),(360,'ramya','kalai',26,'vvvvvvvvvvvvvvvvvvv','2015-10-27 07:13:35',0,'2015-10-27 07:13:35'),(361,'kalai','ramya',1,'hello','2015-11-22 15:32:04',0,'2015-11-22 15:32:04'),(362,'kalai','ramya',1,'hi','2015-11-22 19:56:30',0,'2015-11-22 19:56:30'),(363,'kalai','ramya',1,'hello','2015-11-22 19:57:12',0,'2015-11-22 19:57:12');
/*!40000 ALTER TABLE `chat_chatmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_lastactive`
--

DROP TABLE IF EXISTS `chat_lastactive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_lastactive` (
  `user_id` int(11) NOT NULL,
  `received_at` datetime NOT NULL,
  `session_id` varchar(40) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_lastactive`
--

LOCK TABLES `chat_lastactive` WRITE;
/*!40000 ALTER TABLE `chat_lastactive` DISABLE KEYS */;
INSERT INTO `chat_lastactive` VALUES (17,'2015-11-23 03:12:33','d5f4627fadda9c547db3b9b916c9d7ac'),(32,'2015-11-22 19:55:15','5e0190c51c192980366a1ccd5a9d446f'),(36,'2015-08-12 04:57:39','bda95f35151a5f38b0d58e6a2916a9f3');
/*!40000 ALTER TABLE `chat_lastactive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communication_sendsms`
--

DROP TABLE IF EXISTS `communication_sendsms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communication_sendsms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_number` varchar(30) NOT NULL,
  `from_number` varchar(30) NOT NULL,
  `sms_sid` varchar(34) NOT NULL,
  `account_sid` varchar(34) NOT NULL,
  `created_at` datetime NOT NULL,
  `sent_at` datetime DEFAULT NULL,
  `delivered_at` datetime DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communication_sendsms`
--

LOCK TABLES `communication_sendsms` WRITE;
/*!40000 ALTER TABLE `communication_sendsms` DISABLE KEYS */;
/*!40000 ALTER TABLE `communication_sendsms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=520 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (2,'2015-01-08 06:09:07',1,12,'1','sadfasdf',1,''),(8,'2015-01-08 06:48:48',1,12,'1','1asdfasd',1,''),(9,'2015-01-08 06:49:13',1,12,'2','asdf',1,''),(10,'2015-01-08 06:50:05',1,12,'3','dsfasdf',1,''),(11,'2015-01-08 09:36:10',1,10,'7','Laptops',3,''),(12,'2015-01-08 09:36:10',1,10,'6','Computers',3,''),(13,'2015-01-08 09:36:10',1,10,'5','Electronics',3,''),(14,'2015-01-08 09:36:10',1,10,'4','Tablets',3,''),(15,'2015-01-08 09:36:10',1,10,'2','Mobiles',3,''),(16,'2015-01-08 09:36:10',1,10,'1','Cars',3,''),(17,'2015-01-08 09:36:27',1,10,'3','Bikes',3,''),(18,'2015-01-08 09:36:53',1,9,'3','Electronics & Appliances',2,'Changed name.'),(19,'2015-01-08 09:37:15',1,9,'4','Real Estate',1,''),(20,'2015-01-08 09:37:35',1,9,'5','Home & Lifestyle',1,''),(21,'2015-01-08 09:37:50',1,9,'6','Entertainment',1,''),(22,'2015-01-08 09:38:08',1,9,'7','Pets & Pet Care',1,''),(23,'2015-01-08 09:38:22',1,10,'8','Cars',1,''),(24,'2015-01-08 09:38:43',1,10,'9','Motorcycles',1,''),(25,'2015-01-08 09:39:18',1,10,'10','Scooters',1,''),(26,'2015-01-08 09:39:30',1,10,'11','Bicycles',1,''),(27,'2015-01-08 09:39:45',1,10,'12','Spare Parts - Accessories',1,''),(28,'2015-01-08 09:40:03',1,10,'13','Buses - Trucks - Commercial Vehicles',1,''),(29,'2015-01-08 09:42:18',1,10,'14','Construction Vehicles',1,''),(30,'2015-01-08 09:42:34',1,10,'15','Other Vehicles',1,''),(31,'2015-01-08 09:42:49',1,10,'16','Mobile Phones',1,''),(32,'2015-01-08 09:43:05',1,10,'17','Tablets',1,''),(33,'2015-01-08 09:43:24',1,10,'18','Accessories',1,''),(34,'2015-01-08 13:08:21',1,12,'2','asdfasdf',1,''),(35,'2015-01-09 05:48:53',1,12,'1','sadfasd',1,''),(36,'2015-01-09 05:55:11',1,12,'2','safdasdf',1,''),(37,'2015-01-09 07:04:21',1,12,'2','safdasdf',2,'No fields changed.'),(39,'2015-01-09 07:06:48',1,12,'1','asdfasdf',1,''),(40,'2015-01-09 07:07:40',1,12,'2','asdfasdf',1,''),(42,'2015-01-09 07:10:00',1,12,'3','sdfgsdf',1,''),(44,'2015-01-09 12:48:08',1,12,'9','asdfasdf',1,''),(46,'2015-01-09 12:50:16',1,12,'10','asdfasdf',1,''),(48,'2015-01-09 12:50:54',1,12,'11','asfasdf',1,''),(50,'2015-01-09 12:51:39',1,12,'12','asfasdf',1,''),(52,'2015-01-09 12:53:38',1,12,'13','asdfasdf',1,''),(54,'2015-01-09 12:54:37',1,12,'14','asfdasdf',1,''),(56,'2015-01-09 12:56:06',1,12,'15','asfasdf',1,''),(58,'2015-01-09 12:57:03',1,12,'16','safasdf',1,''),(69,'2015-02-06 05:03:01',1,12,'32','bicycle',1,''),(71,'2015-02-06 05:19:18',1,12,'33','mobiles',1,''),(73,'2015-02-06 05:21:13',1,12,'34','mobiles',1,''),(75,'2015-02-06 05:56:51',1,12,'35','mobiles',1,''),(77,'2015-02-07 04:37:50',1,12,'46','cars',1,''),(79,'2015-02-07 04:40:30',1,12,'47','bikes',1,''),(80,'2015-02-19 06:25:35',1,54,'1','',1,''),(81,'2015-02-19 06:26:28',1,51,'1','kalai',1,''),(82,'2015-02-19 07:05:18',1,51,'2','/elasticsearch/',1,''),(83,'2015-02-19 12:21:43',1,6,'2','localhost',1,''),(84,'2015-02-19 12:23:00',1,51,'1','/elasticsearch/',1,''),(85,'2015-02-19 12:24:45',1,54,'1','post_ad',1,''),(87,'2015-02-19 12:27:13',1,12,'5','car',1,''),(88,'2015-02-19 12:30:53',1,51,'2','/postad/',1,''),(90,'2015-02-19 12:32:16',1,12,'6','bike',1,''),(91,'2015-02-19 12:36:51',1,53,'1','cars',1,''),(93,'2015-02-19 12:37:44',1,12,'7','cars',1,''),(95,'2015-02-19 12:48:30',1,12,'8','mobiles',1,''),(97,'2015-02-26 04:23:34',44,12,'9','mobilee',1,''),(98,'2015-02-26 04:24:12',44,12,'10','car1',1,''),(99,'2015-02-26 05:03:14',44,9,'1','Cars & Bikes',1,''),(100,'2015-02-26 05:03:41',44,9,'2','Mobiles & Tablets',1,''),(101,'2015-02-26 05:04:10',44,9,'3','Electronic & Appliance',1,''),(102,'2015-02-26 05:04:32',44,9,'4','Real estate',1,''),(103,'2015-02-26 05:04:55',44,9,'5','Jobs',1,''),(104,'2015-02-26 05:05:19',44,9,'6','Home & Lifestyle',1,''),(105,'2015-02-26 05:05:46',44,9,'7','Services',1,''),(106,'2015-02-26 05:06:29',44,9,'8','Education & Learning',1,''),(107,'2015-02-26 05:06:52',44,9,'9','Pets & Pet care',1,''),(108,'2015-02-26 05:07:08',44,9,'10','Entertainment',1,''),(109,'2015-02-26 05:07:56',44,9,'11','Community & Events',1,''),(110,'2015-02-26 05:08:17',44,9,'12','Matrimonial',1,''),(111,'2015-02-26 05:09:38',44,10,'1','Cars',1,''),(112,'2015-02-26 05:09:47',44,10,'2','Motorcycles',1,''),(113,'2015-02-26 05:09:57',44,10,'3','Scooters',1,''),(114,'2015-02-26 05:10:07',44,10,'4','Spare Parts - Accessories',1,''),(115,'2015-02-26 05:10:18',44,10,'5','Bicycles',1,''),(116,'2015-02-26 05:10:27',44,10,'6','Buses - Trucks - Commercial Vehicles',1,''),(117,'2015-02-26 05:10:40',44,10,'7','Construction Vehicles',1,''),(118,'2015-02-26 05:10:51',44,10,'8','Mobile Phones',1,''),(119,'2015-02-26 05:10:59',44,10,'9','Accessories',1,''),(120,'2015-02-26 05:11:13',44,10,'10','Tablets',1,''),(121,'2015-02-26 06:09:50',44,9,'1','Cars & Bikes',1,''),(122,'2015-02-26 06:10:06',44,9,'2','Mobiles & Tablets',1,''),(123,'2015-02-26 06:10:44',44,10,'1','Cars',1,''),(124,'2015-02-26 06:10:50',44,10,'2','Motorcycles',1,''),(125,'2015-02-26 06:27:28',44,9,'3','Electronics & Appliances',1,''),(126,'2015-02-26 06:29:55',44,9,'4','Real estate',1,''),(127,'2015-02-26 06:37:13',44,9,'1','Cars & Bikes',1,''),(128,'2015-02-26 06:37:40',44,10,'1','Cars',1,''),(129,'2015-02-26 06:38:09',44,9,'1','Cars & Bikes',2,'Changed category_type.'),(130,'2015-02-28 11:10:32',44,10,'2','Motorcycles',1,''),(131,'2015-02-28 11:11:44',44,10,'3','Scooters',1,''),(132,'2015-02-28 11:11:56',44,10,'4','Spare Parts - Accessories',1,''),(133,'2015-02-28 11:12:14',44,10,'5','Bicycles',1,''),(134,'2015-02-28 11:12:26',44,10,'6','Buses - Trucks - Commercial Vehicles',1,''),(135,'2015-02-28 11:12:42',44,10,'7','Construction Vehicles',1,''),(136,'2015-02-28 11:13:00',44,10,'8','Mobile Phones',1,''),(137,'2015-02-28 11:13:13',44,10,'9','Mobiles & Tablets',1,''),(138,'2015-02-28 11:13:21',44,10,'10','Accessories',1,''),(140,'2015-02-28 11:23:08',44,12,'15','iphone mobile',1,''),(144,'2015-03-10 11:22:11',44,63,'2','Cars & Bikes',1,''),(145,'2015-03-10 11:22:31',44,63,'3','Mobiles & Tablets',1,''),(146,'2015-03-10 11:23:08',44,64,'1','Cars',1,''),(147,'2015-03-10 11:23:16',44,64,'2','Motorcycles',1,''),(148,'2015-03-10 11:23:23',44,64,'3','Mobile Phones',1,''),(149,'2015-03-10 11:24:13',44,66,'1','Dropdown object',1,''),(150,'2015-03-10 11:26:32',44,66,'2','Dropdown object',1,''),(151,'2015-03-10 12:08:00',44,66,'3','Dropdown object',1,''),(152,'2015-03-10 12:26:55',44,66,'4','Dropdown object',1,''),(153,'2015-03-10 12:28:30',44,66,'5','Dropdown object',1,''),(154,'2015-03-11 04:07:06',44,66,'6','Dropdown object',1,''),(155,'2015-03-11 04:30:17',44,66,'10','Apple',1,''),(156,'2015-03-11 04:30:52',44,66,'11','',1,''),(157,'2015-03-11 04:37:49',44,66,'12','Blackberry',1,''),(158,'2015-03-11 04:38:03',44,66,'13','',1,''),(159,'2015-03-11 04:39:02',44,66,'14','Micromax',1,''),(160,'2015-03-11 04:39:22',44,66,'15','',1,''),(161,'2015-03-11 05:23:58',44,66,'16','',1,''),(162,'2015-03-11 05:24:08',44,66,'17','',1,''),(163,'2015-03-11 05:25:09',44,66,'18','',1,''),(164,'2015-03-11 05:26:00',44,66,'19','',1,''),(282,'2015-04-13 06:00:44',44,69,'productlist-list','Absent list',3,''),(283,'2015-04-13 06:01:19',44,69,'productlist-list','Product list',1,''),(284,'2015-04-13 06:06:41',44,70,'1','test-geetha',2,'Changed actions.'),(285,'2015-04-13 07:27:17',44,69,'productlist-list','Product list',2,'Changed action_path.'),(303,'2015-04-21 07:36:43',1,72,'1','Tata',1,''),(304,'2015-04-21 07:36:53',1,72,'2','Nokia',1,''),(305,'2015-04-21 07:37:10',1,72,'3','Micromax',1,''),(306,'2015-04-21 07:37:25',1,72,'4','Maruti Suzuki',1,''),(307,'2015-04-21 07:37:35',1,72,'5','Mahindra',1,''),(308,'2015-04-21 07:37:44',1,72,'6','Kinetic Motors',1,''),(309,'2015-04-21 07:37:52',1,72,'7','Hyundai',1,''),(310,'2015-04-21 07:38:06',1,72,'8','Honda',1,''),(311,'2015-04-21 07:38:20',1,72,'9','Hero Honda',1,''),(312,'2015-04-21 07:38:29',1,72,'10','Hero',1,''),(313,'2015-04-21 07:39:04',1,72,'11','HCL',1,''),(314,'2015-05-04 07:36:24',1,73,'1','nokia mobile',1,''),(318,'2015-05-05 11:03:39',1,78,'1','banner1',1,''),(319,'2015-05-05 11:03:54',1,79,'1','banner1',1,''),(320,'2015-05-05 11:04:11',1,81,'1','500x200',1,''),(321,'2015-05-05 11:04:27',1,80,'1','banner1',1,''),(322,'2015-05-05 11:04:54',1,82,'1','500x200 - banner1',1,''),(330,'2015-05-21 04:49:48',1,84,'freealert_notice_email','freealert_notice_email',1,''),(331,'2015-05-21 04:54:34',1,84,'freealert_notice_email','freealert_notice_email',1,''),(332,'2015-05-21 10:28:24',1,73,'2','kalaimca.gs@gmail.com',1,''),(333,'2015-05-22 05:06:07',1,88,'1','http://www.google.com',1,''),(334,'2015-05-22 05:06:38',1,88,'2','http://www.gmail.com',1,''),(335,'2015-05-22 06:51:14',1,12,'9','tata motorcycle',2,'Changed title and condition.'),(336,'2015-05-22 06:51:30',1,12,'8','maruthi car',2,'Changed title and condition.'),(337,'2015-05-22 06:51:45',1,12,'7','bmw car',2,'Changed title and condition.'),(338,'2015-05-22 06:52:32',1,12,'6','Qualis car new model',2,'Changed title and condition.'),(339,'2015-05-22 06:53:39',1,12,'5','Audi car high speed',2,'Changed title and condition.'),(340,'2015-05-22 06:54:01',1,12,'4','Odysee car model',2,'Changed title and condition.'),(341,'2015-05-22 06:54:42',1,12,'3','saproro car cerrarra',2,'Changed title and condition.'),(342,'2015-05-22 06:55:04',1,12,'2','samsung mobile 500',2,'Changed title and condition.'),(343,'2015-05-22 06:55:11',1,12,'2','samsung mobile 500 series',2,'Changed title.'),(344,'2015-05-22 06:55:26',1,12,'1','samsung mobile',2,'Changed title and condition.'),(345,'2015-05-22 08:54:22',1,12,'9','tata motorcycle',2,'Changed price.'),(346,'2015-05-22 08:54:32',1,12,'8','maruthi car',2,'Changed price.'),(347,'2015-05-22 08:54:39',1,12,'7','bmw car',2,'Changed price.'),(348,'2015-05-22 08:54:51',1,12,'6','Qualis car new model',2,'Changed price.'),(349,'2015-05-22 08:55:03',1,12,'5','Audi car high speed',2,'Changed price.'),(350,'2015-05-22 08:55:17',1,12,'4','Odysee car model',2,'Changed price.'),(351,'2015-05-22 08:55:27',1,12,'2','samsung mobile 500 series',2,'Changed price.'),(352,'2015-05-22 08:55:35',1,12,'1','samsung mobile',2,'Changed price.'),(353,'2015-05-25 09:41:02',1,84,'freealert_notice_email','freealert_notice_email',2,'Changed wait_for_approval.'),(354,'2015-05-25 09:41:19',1,84,'freealert_notice_email','freealert_notice_email',2,'Changed interval.'),(356,'2015-05-25 09:57:31',1,85,'1','WorkerTask object',1,''),(358,'2015-05-25 10:33:23',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(359,'2015-05-25 10:35:52',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(360,'2015-05-25 10:36:36',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(361,'2015-05-25 10:57:08',1,85,'1','WorkerTask object',2,'Changed status, scheduled, started and completed.'),(362,'2015-05-25 10:59:10',1,85,'1','WorkerTask object',2,'Changed status, scheduled, started and completed.'),(363,'2015-05-25 11:01:37',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(364,'2015-05-25 11:13:38',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(365,'2015-05-25 11:17:20',1,85,'1','WorkerTask object',2,'Changed notes.'),(366,'2015-05-25 11:18:23',1,85,'1','WorkerTask object',2,'Changed status.'),(367,'2015-05-25 11:19:11',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(368,'2015-05-26 04:50:05',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(369,'2015-05-26 05:10:08',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(370,'2015-05-26 05:48:00',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(371,'2015-05-26 05:49:19',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(372,'2015-05-26 05:57:54',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(373,'2015-05-26 05:59:26',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(374,'2015-05-26 06:01:00',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(375,'2015-05-26 06:02:08',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(376,'2015-05-26 06:03:09',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(377,'2015-05-26 06:03:56',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(378,'2015-05-26 06:08:48',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(379,'2015-05-26 06:09:53',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(380,'2015-05-26 06:12:33',1,85,'1','WorkerTask object',2,'Changed status.'),(381,'2015-05-26 06:14:29',1,85,'1','WorkerTask object',2,'Changed status.'),(382,'2015-05-26 06:20:48',1,85,'1','WorkerTask object',2,'Changed status.'),(383,'2015-05-26 06:24:37',1,85,'1','WorkerTask object',2,'Changed status.'),(384,'2015-05-26 06:26:17',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(385,'2015-05-26 06:27:15',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(386,'2015-05-26 06:29:23',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(387,'2015-05-26 06:30:26',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(388,'2015-05-26 06:35:31',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(389,'2015-05-26 06:39:05',1,85,'1','WorkerTask object',2,'Changed status.'),(390,'2015-05-26 06:44:33',1,85,'1','WorkerTask object',2,'Changed status.'),(391,'2015-05-26 06:45:23',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(392,'2015-05-26 06:45:36',1,85,'1','WorkerTask object',2,'Changed notes.'),(393,'2015-05-26 06:50:01',1,85,'1','WorkerTask object',2,'Changed status.'),(394,'2015-05-26 07:06:13',1,84,'freealert_notice_email','freealert_notice_email',2,'Changed active.'),(395,'2015-05-26 07:06:17',1,84,'freealert_notice_email','freealert_notice_email',2,'Changed active.'),(396,'2015-05-26 09:08:37',1,85,'1','WorkerTask object',2,'Changed status.'),(397,'2015-05-26 09:15:44',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(398,'2015-05-26 09:18:21',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(399,'2015-05-26 09:29:32',1,85,'1','WorkerTask object',2,'Changed status.'),(400,'2015-05-26 09:42:19',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(401,'2015-05-26 10:34:59',1,85,'3','WorkerTask object',3,''),(402,'2015-05-26 10:34:59',1,85,'2','WorkerTask object',3,''),(403,'2015-05-26 11:24:10',1,93,'1','',1,''),(404,'2015-05-26 11:24:24',1,93,'1','',3,''),(405,'2015-05-26 11:24:40',1,93,'2','123123',1,''),(406,'2015-05-26 12:04:47',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(407,'2015-05-26 13:31:42',1,93,'4','123123',1,''),(408,'2015-05-27 04:21:52',1,85,'1','WorkerTask object',2,'Changed notes and status.'),(409,'2015-05-27 05:14:11',1,84,'freealert_notice_email','freealert_notice_email',2,'Changed interval.'),(410,'2015-05-27 05:14:27',1,84,'freealert_notice_email','freealert_notice_email',2,'Changed interval.'),(411,'2015-05-27 05:30:22',1,85,'1','WorkerTask object',2,'No fields changed.'),(412,'2015-05-27 05:30:47',1,84,'freealert_notice_email','freealert_notice_email',2,'Changed interval.'),(413,'2015-05-27 05:46:08',1,93,'2','2',2,'Changed product.'),(414,'2015-05-27 07:16:33',1,85,'1','WorkerTask object',2,'Changed notes.'),(415,'2015-05-28 10:58:53',1,94,'1','Urgent Ads',1,''),(416,'2015-05-28 10:59:15',1,94,'2','Top of Ads',1,''),(417,'2015-05-28 10:59:41',1,94,'3','Top of Ads + Urgent Ads',1,''),(418,'2015-05-28 11:08:53',1,94,'3','Top of Ads + Urgent Ads',2,'Changed currency.'),(419,'2015-05-28 11:09:00',1,94,'2','Top of Ads',2,'Changed currency.'),(420,'2015-05-28 11:09:06',1,94,'1','Urgent Ads',2,'Changed currency.'),(421,'2015-05-29 06:11:44',1,84,'email_expiredads','email_expiredads',1,''),(422,'2015-05-29 06:12:02',1,84,'freealert_notice_email','freealert_notice_email',2,'Changed interval.'),(423,'2015-05-29 06:12:59',1,84,'email_expiredads','email_expiredads',2,'Changed interval.'),(426,'2015-06-05 09:48:30',1,20,'1','Pondicherry',2,'Changed country.'),(427,'2015-06-05 09:48:36',1,20,'3','Bangalore',2,'Changed country.'),(428,'2015-06-05 09:55:14',1,20,'1','Pondicherry',2,'Changed country.'),(429,'2015-06-05 09:55:19',1,20,'2','Chennai',2,'Changed country.'),(430,'2015-06-20 06:07:52',1,88,'3','http://google.com',1,''),(431,'2015-06-20 06:08:12',1,88,'4','http://google.com',1,''),(432,'2015-06-20 06:08:40',1,88,'5','http://google.com',1,''),(433,'2015-06-20 06:08:53',1,88,'6','http://google.com',1,''),(434,'2015-06-24 13:09:36',1,3,'46','kalai6',2,'Changed password.'),(435,'2015-06-24 13:09:49',1,3,'49','kalai7',2,'Changed password.'),(436,'2015-06-24 13:13:37',1,3,'92','priya',1,''),(437,'2015-06-24 13:13:43',1,3,'92','priya',2,'Changed password.'),(438,'2015-06-24 13:14:12',1,8,'31','priya',1,''),(439,'2015-06-24 13:14:34',1,3,'93','ramya',1,''),(440,'2015-06-24 13:14:38',1,3,'93','ramya',2,'Changed password.'),(441,'2015-06-24 13:14:54',1,8,'32','ramya',1,''),(442,'2015-07-04 05:11:01',1,6,'1','example.com',3,''),(443,'2015-07-04 05:11:01',1,6,'2','localhost',3,''),(444,'2015-07-09 07:18:10',1,3,'141','spmuthu21',2,'Changed password and is_active.'),(445,'2015-07-13 09:29:08',1,10,'11',' Home - Kitchen Appliances',1,''),(446,'2015-07-13 09:29:37',1,10,'12',' Laptops - Computers',1,''),(447,'2015-07-13 09:31:05',1,10,'13',' Computer Peripherals',1,''),(448,'2015-07-13 09:31:45',1,10,'14','  TV - DVD - Multimedia',1,''),(449,'2015-07-13 09:32:10',1,10,'15','Tools - Machinery - Industrial',1,''),(450,'2015-07-23 13:44:30',1,6,'1','192.168.1.45:8000',2,'Changed domain and name.'),(451,'2015-08-07 09:43:58',1,10,'16','   Video Games - Consoles',1,''),(452,'2015-08-07 09:48:19',1,10,'17',' Cameras - Digicams',1,''),(453,'2015-08-07 09:49:07',1,10,'18','  Music Systems - Home Theatre',1,''),(454,'2015-08-07 09:49:49',1,10,'19',' Inverters, UPS & Generators',1,''),(455,'2015-08-07 09:50:21',1,10,'20','  Security Equipment - Products',1,''),(456,'2015-08-07 09:51:10',1,10,'21','  Fax, EPABX, Office Equipment',1,''),(457,'2015-08-07 09:52:09',1,10,'22',' Camera Accessories',1,''),(458,'2015-08-07 09:55:56',1,10,'23','Houses - Apartments for Rent',1,''),(459,'2015-08-07 09:57:27',1,10,'24','Houses - Apartments for Sale',1,''),(460,'2015-08-07 09:58:29',1,10,'25','Land - Plot For Sale',1,''),(461,'2015-08-07 10:02:11',1,10,'26','Commercial Property for Rent',1,''),(462,'2015-08-07 10:04:07',1,10,'27','Paying Guest - Hostel',1,''),(463,'2015-08-07 10:05:02',1,10,'28','Villas/Bungalows for Sale',1,''),(464,'2015-08-07 10:06:01',1,10,'29','Commercial Property for Sale',1,''),(465,'2015-08-07 10:06:43',1,10,'30','Villas/Bungalows for Rent',1,''),(466,'2015-08-07 10:07:29',1,10,'31','Flatmates',1,''),(467,'2015-08-07 10:08:33',1,10,'32','Vacation Rentals - Timeshare',1,''),(468,'2015-08-07 10:09:42',1,10,'33','Service Apartments',1,''),(469,'2015-08-07 10:15:07',1,10,'34','Home - Office Furniture',1,''),(470,'2015-08-07 10:16:20',1,10,'35','Clothing - Garments',1,''),(471,'2015-08-07 10:16:57',1,10,'36','Health - Beauty Products',1,''),(472,'2015-08-07 10:18:00',1,10,'37','Sport - Fitness Equipment',1,''),(473,'2015-08-07 10:18:45',1,10,'38','Home Decor - Furnishings',1,''),(474,'2015-08-07 10:19:33',1,10,'39','Household',1,''),(475,'2015-08-07 10:21:54',1,10,'40','Fashion Accessories',1,''),(476,'2015-08-07 10:23:25',1,10,'41','Watches',1,''),(477,'2015-08-07 10:24:57',1,10,'42','Coins - Stamps     ',1,''),(478,'2015-08-07 10:25:49',1,10,'43','Musical Instruments',1,''),(479,'2015-08-07 10:26:40',1,10,'44','Wholesale - Bulk',1,''),(480,'2015-08-07 10:27:13',1,10,'45','Baby - Infant Products',1,''),(481,'2015-08-07 10:28:44',1,10,'46','Full Time Jobs',1,''),(482,'2015-08-07 10:29:48',1,10,'47','Work From Home',1,''),(483,'2015-08-07 10:30:27',1,10,'48','Part Time Jobs',1,''),(484,'2015-08-07 10:32:07',1,10,'49','Placement - Recruitment Agencies',1,''),(485,'2015-08-07 10:32:43',1,10,'50','Freelancers',1,''),(486,'2015-08-07 10:33:27',1,10,'51','Non-Profit NGOs',1,''),(487,'2015-08-07 10:37:29',1,10,'52','Summer Trainees - Interns',1,''),(488,'2015-08-07 10:37:54',1,10,'53','Other Jobs',1,''),(489,'2015-08-07 10:41:18',1,10,'54','Advertising - Design',1,''),(490,'2015-08-07 10:42:13',1,10,'55','Airline - Train - Bus Tickets',1,''),(491,'2015-08-07 10:48:10',1,10,'56','Architect',1,''),(492,'2015-08-07 10:49:03',1,10,'57','Astrology - Numerology',1,''),(493,'2015-08-07 10:51:03',1,10,'58','Baby Sitters - Nanny',1,''),(494,'2015-08-07 10:54:11',1,10,'59','Business Offers',1,''),(495,'2015-08-07 10:55:08',1,10,'60','Carpenters - Furniture Work',1,''),(496,'2015-08-07 10:56:17',1,10,'61','Catering -Tiffin Services',1,''),(497,'2015-08-07 10:58:16',1,10,'62','Computer Repair and Service',1,''),(498,'2015-08-07 10:59:10',1,10,'63','Cooks',1,''),(499,'2015-08-07 11:01:13',1,10,'64','Courier Services',1,''),(500,'2015-08-07 11:03:17',1,10,'65','Doctors',1,''),(501,'2015-08-07 11:07:20',1,10,'66','Acting - Modeling Roles',1,''),(502,'2015-08-07 11:08:00',1,10,'67','Modeling Agencies',1,''),(503,'2015-08-07 11:08:30',1,10,'68','Photographers - Cameraman',1,''),(504,'2015-08-07 11:09:16',1,10,'69','Musicians',1,''),(505,'2015-08-07 11:10:36',1,10,'70','Acting Schools',1,''),(506,'2015-08-07 11:12:24',1,10,'71','Script Writers',1,''),(507,'2015-08-07 11:13:25',1,10,'72','Actor - Model Portfolios',1,''),(508,'2015-08-07 11:14:00',1,10,'73','Make Up - Hair',1,''),(509,'2015-08-07 11:15:18',1,10,'74','Art Directors - Editors',1,''),(510,'2015-08-07 11:18:27',1,10,'75','Studios - Locations for hire',1,''),(511,'2015-08-07 11:19:39',1,10,'76','Fashion Designers - Stylists',1,''),(512,'2015-08-07 11:21:10',1,10,'77','Sound Engineers',1,''),(513,'2015-11-04 03:29:53',1,20,'1','Pondicherry',2,'Changed country_code and country_name.'),(514,'2015-11-04 03:29:56',1,20,'1','Pondicherry',2,'No fields changed.'),(515,'2015-11-04 03:30:08',1,20,'2','Chennai',2,'Changed country_code and country_name.'),(516,'2015-11-04 03:30:22',1,20,'3','Bangalore',2,'Changed country_code and country_name.'),(517,'2015-11-04 03:30:34',1,20,'4','Aljunied',2,'Changed country_code and country_name.'),(518,'2015-11-04 03:30:46',1,20,'5','Ang Mo Kio',2,'Changed country_code and country_name.'),(519,'2015-11-04 03:31:03',1,20,'6','Balestier Road',2,'Changed country_code and country_name.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'user profile','adjod','userprofile'),(9,'category','advertisement','category'),(10,'sub category','advertisement','subcategory'),(12,'product','advertisement','product'),(20,'city','advertisement','city'),(21,'locality','advertisement','locality'),(47,'source','easy_thumbnails','source'),(48,'thumbnail','easy_thumbnails','thumbnail'),(49,'thumbnail dimensions','easy_thumbnails','thumbnaildimensions'),(50,'send sms','communication','sendsms'),(51,'my metadata (Path)','seo','mymetadatapath'),(52,'my metadata (Model Instance)','seo','mymetadatamodelinstance'),(53,'my metadata (Model)','seo','mymetadatamodel'),(54,'my metadata (View)','seo','mymetadataview'),(55,'PayPal IPN','ipn','paypalipn'),(63,'cat','sample','cat'),(64,'sub cat','sample','subcat'),(66,'dropdown','sample','dropdown'),(68,'message','services','message'),(69,'action','fxapi','action'),(70,'client','fxapi','client'),(72,'dropdown','advertisement','dropdown'),(73,'free alert','advertisement','freealert'),(75,'section','adcode','section'),(76,'size','adcode','size'),(77,'placement','adcode','placement'),(78,'Client','adworks','client'),(79,'Campaign','adworks','campaign'),(80,'Attribute','adworks','attribute'),(81,'Dimension','adworks','dimension'),(82,'Banner','adworks','banner'),(83,'Version','adworks','version'),(84,'worker','worker','worker'),(85,'worker task','worker','workertask'),(87,'user tracking','worker','usertracking'),(88,'site banner','banner','sitebanner'),(93,'worker notice email task','worker','workernoticeemailtask'),(94,'premium price info','advertisement','premiumpriceinfo'),(95,'product expired ad tracking','worker','productexpiredadtracking'),(99,'chat message','chat','chatmessage'),(100,'last active','chat','lastactive'),(101,'rate source','djmoney_rates','ratesource'),(102,'rate','djmoney_rates','rate'),(103,'transaction','advertisement','transaction');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('00d1bf115f39bf708005e24ce1b47cb1','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-07-15 07:05:20'),('026c82ddf47546a3a14d9148dcd3cd97','YjY2ODIwNjMwN2Y3ZGRiZTRmYTIwYTE0ZTM0NWEyMzRlNTNmNGE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAV11Lg==\n','2015-07-24 13:14:41'),('03ca011c9e824947881a14841a7b5091','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-13 06:53:50'),('06e075f83a9e0204786dc087c5f0d315','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-24 06:06:13'),('0a3f2c8e7d6865542b10653c3340b574','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-10-28 07:57:55'),('0ccd4043ca17015f36c7ec661e4de62d','NGI5YzIwZjdjMTYzMjlmNDE3MzcxY2IxMTZjNGRkMDg1MzJhYjQwMDqAAn1xAVUPZGphbmdvX2xh\nbmd1YWdlVQJlbnECcy4=\n','2015-07-09 10:53:26'),('0d36e6ce9bf47fa475acfa8191944ff3','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 06:46:45'),('1032ba1943a94537bdbfadee3ee7d8ec','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-07-24 13:01:07'),('1134be63d996b0e535e2bd82d4dfbbda','YjY2ODIwNjMwN2Y3ZGRiZTRmYTIwYTE0ZTM0NWEyMzRlNTNmNGE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAV11Lg==\n','2015-08-12 04:28:52'),('11d13c742d42be4ad432997a46d61955','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-04 11:23:09'),('1bd3aad613fb1d37bebfff324ef1257e','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-06 05:53:02'),('1c5321f3eca9b82877574be33a68d649','ZGQ4MWViZDQwZTJiMTE1MTY0MTFiMDJiN2M2ZDI5NGI4NzBhNGRjODqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2015-07-10 10:18:58'),('1c9e0ec1e756fad17c4c2b54a88439ab','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-25 05:39:50'),('1e262c60b67e79c97f04d35a29287d8d','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-10 13:47:25'),('20c9a262eb2f2aaa098b0999ca313195','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-07-15 06:38:41'),('20e0559f07ef8251447d25994319761e','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-04 15:11:58'),('21d828c49af698ca89a96952b7395b50','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-04 11:16:19'),('2426a72e3f3aea2e54f6b73bf8b0f8a8','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-16 11:50:07'),('26a07fcf8960ba45de2559c9fbdea157','YjY2ODIwNjMwN2Y3ZGRiZTRmYTIwYTE0ZTM0NWEyMzRlNTNmNGE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAV11Lg==\n','2015-07-09 06:16:22'),('274310c8b1c61c242be384e0466a18cf','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-25 14:35:19'),('2789565d90c9e5f620d267391cc59009','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-11-10 07:53:54'),('2835ed0ab5b9567db6cfaf5da9aaef44','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-08-08 09:53:39'),('2a1b3255b4311725f7e4912824b1b3be','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-12-06 19:57:21'),('2be58c73973907a7d3bdf693897da9a9','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-06 06:01:37'),('2ce5cfb3826a1951f069845a93f07577','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-04 11:08:11'),('2d24647336961db837e9f30e23fce1a1','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-25 06:12:31'),('2e147b29c9735c8e81c428a3200fcb03','YjY2ODIwNjMwN2Y3ZGRiZTRmYTIwYTE0ZTM0NWEyMzRlNTNmNGE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAV11Lg==\n','2015-10-22 12:23:28'),('2f6944666ad4ec3d233aba40f4f627dd','YjY2ODIwNjMwN2Y3ZGRiZTRmYTIwYTE0ZTM0NWEyMzRlNTNmNGE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAV11Lg==\n','2015-07-15 08:01:01'),('2fa93d83aa58e11acced84c049527d08','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 07:05:15'),('304f2320949334f943b516a5a40b3619','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-10-22 08:27:53'),('308de3a3cfda54fc19bde57085a35519','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-04 11:05:36'),('319b38fa94e97395e28ec0598b7cc65e','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-25 14:19:18'),('33674ebe2cde06c8a309e3f9289ac604','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-23 07:07:58'),('33dd293deb088c096c880616cee4cafb','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-10-31 08:13:59'),('368a57a8897037f9d23968b4f37fdc31','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 06:46:10'),('36cd8ecf79ff8023fbcc0c203fb2edc9','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-08 13:51:25'),('386183382995d1d7f4ed970c944240f2','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 07:16:02'),('388db5b2ed1feb51fdae4d728e44fd12','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-12-02 02:27:48'),('38cf0ef5da0681845637afcdbf1232ae','MDAyODEwZDQyMzMxNjRiZDM3YWMwZWVjYzcxZDg1NjcyMDEzN2EzZTqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZHECVQ9kamFuZ29fbGFuZ3VhZ2VYAgAAAGVudS4=\n','2015-07-10 10:15:39'),('38ffdf1c16943a2955b69c166ffaedbe','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-25 05:41:10'),('3960e5c0efdde58f8f83dcc7b29c36dc','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-05 04:51:17'),('3be5f8f7dd6ac37ed57a8e517c05ec8f','YjY2ODIwNjMwN2Y3ZGRiZTRmYTIwYTE0ZTM0NWEyMzRlNTNmNGE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAV11Lg==\n','2015-07-25 14:06:09'),('3caa0dcdf660288dc16cb13a92cc3973','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-23 07:11:20'),('3d02575c62f2f633a51c5979118ec07c','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-24 06:06:16'),('3e769284f12c70cbc97d9cfa2f7ee0c7','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-04 16:19:35'),('3f4f4c98c80156078739175c110320c2','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-23 07:07:34'),('3f8aaabc0c79171df8d6293846e13043','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-10 05:45:45'),('3fa519b31266cf3936ba4e828e09f0c4','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-23 07:07:57'),('416fbc9ca3489a64b7fe91c0905f4e20','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 07:13:07'),('44c5d541dc5102846a8f762b2e6d50be','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-11-18 03:31:16'),('466f4a428d27067a5774d3e9c9757d0d','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-10 06:00:29'),('486b27b540506035c0af3fe132bdb1a0','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-07-24 04:55:05'),('4c5fb3ed76cbc8ca07449da4edcea24f','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-07-14 09:44:27'),('515720732b38ffa6c20157fc5c238409','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-23 07:07:38'),('51611fe2f0e571842431912fb30abd40','NzMwZDVjOTI0YmNiMzYzYjk5NTk2NDg4ZmNkNmMzMzcyZDYxNmZmODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAXN1Lg==\n','2015-07-24 12:13:11'),('523dcc2dcf82dc29920f2cfefbdf4b37','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-04 14:35:12'),('53bbb07282e475075df546aa0c9a9c84','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-24 07:52:36'),('54e1288f0e83020ec3db00a8039afaad','NDYzOTk0OGU1MTc3MmE4ZWI2Y2M5ZmJmYjI4ZjU4MzQ1NGEwMWRhMDqAAn1xAVUPZGphbmdvX2xh\nbmd1YWdlWAIAAABlbnECcy4=\n','2015-11-10 07:54:30'),('555072584564d28ea5e81343c24a0b74','NWM5Y2ZjNDM1NmVlOWIwNDViMTgwMGUyMjRkZjZiM2UxYzBhOWJlYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAVx1Lg==\n','2015-08-04 11:13:48'),('58677f061bbb0df508aec2f47e294438','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-11 11:27:35'),('592499bd99e850b5abbb549ff254d356','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-10-26 11:07:25'),('5e0190c51c192980366a1ccd5a9d446f','YjY2ODIwNjMwN2Y3ZGRiZTRmYTIwYTE0ZTM0NWEyMzRlNTNmNGE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAV11Lg==\n','2015-08-04 15:23:50'),('5e8b5b81c21eaf3dd389ca5ccc861f73','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-04 11:09:49'),('5ec6efa0a419ff16f6065bcea9fb212b','YjY2ODIwNjMwN2Y3ZGRiZTRmYTIwYTE0ZTM0NWEyMzRlNTNmNGE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAV11Lg==\n','2015-07-16 10:46:09'),('5ed56a4fccddc9f4299ae5bb86557d5b','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-10-28 08:18:48'),('60c92b50de8f93666ed1a245c6fd2929','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 06:51:19'),('61906324fc5ae903f09e8db07739850f','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-07-25 05:41:25'),('62bfa203493d952e170e474662dc9514','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-23 07:09:47'),('630fd58664aabbccbf08c8bded1d5b64','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-23 07:07:38'),('63389109fb3095470e69dd1e30b17fe4','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-07-15 07:23:22'),('66ba53e294e718292331609fb6a4fa6e','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 07:22:57'),('6a33620476c322210f2105ab9b163c25','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-06 05:53:01'),('6bc301cf0d45961d3ec72627ece62d00','YjY2ODIwNjMwN2Y3ZGRiZTRmYTIwYTE0ZTM0NWEyMzRlNTNmNGE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAV11Lg==\n','2015-07-16 04:46:50'),('6e5c5bb20f79a9a01283825d3c55fcb7','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-07-15 06:51:30'),('6f42976d9d58e12ec473d2fbe4f1068d','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-11-02 11:44:54'),('6fc25cbb6e9d14962eff6ebb5a5f33d9','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-22 12:31:48'),('706ca7418535e7080b2e0083c7b4b23e','YjY2ODIwNjMwN2Y3ZGRiZTRmYTIwYTE0ZTM0NWEyMzRlNTNmNGE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAV11Lg==\n','2015-07-23 14:12:11'),('73cfef9ce71401e1eac237ffef0d345d','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 10:01:05'),('77c1c6df42b145c8c1bf83e29947d56f','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-07-14 10:26:27'),('7a7e271a7d4e608c6d6d859070219a29','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-10-27 11:21:44'),('7fb1750e6db06c13b326cc855e961871','NzMwZDVjOTI0YmNiMzYzYjk5NTk2NDg4ZmNkNmMzMzcyZDYxNmZmODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAXN1Lg==\n','2015-07-15 06:27:51'),('802ab8205872e32b3e3f096cc866161b','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-10-21 08:25:34'),('802af9fdbecc0c9e83380b25583c1d6a','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-07-15 05:45:54'),('848996b96daafcb2125c7b826288213e','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-25 12:52:43'),('84d6f0535096901ea7a9ec01ac92687c','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 06:30:34'),('8556f2ec153306b683da54bbd77e77f4','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-04 11:24:05'),('85c6ece85d1804704ac687c88eae5073','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-10-22 12:23:04'),('867be5a088a5863fe3eb555c09ecd90f','OTdmMTI2MjM1NTFkNGI3YTkyNTIyZGI3ZTEwNTJmMmNkNjExOTg1NTqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUSX2F1dGhfdXNlcl9iYWNrZW5kcQJVKWRqYW5nby5jb250cmliLmF1dGguYmFj\na2VuZHMuTW9kZWxCYWNrZW5kcQNVDV9hdXRoX3VzZXJfaWRxBIoBdXUu\n','2015-07-13 09:54:04'),('8893ea987c60bf39cb9c1c69de25af5c','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 07:23:50'),('88abc6616aba91fccf2ce4b4dbe9c4de','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-10-22 06:48:46'),('8a41b43f9f89fd1b87708e9ca6e7d8f9','YjY2ODIwNjMwN2Y3ZGRiZTRmYTIwYTE0ZTM0NWEyMzRlNTNmNGE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAV11Lg==\n','2015-07-25 05:40:06'),('8d4aa6cc165835bfc5fa097f3701aaa4','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-07-24 08:20:15'),('90a025adab11cb96ff4f2c540cc2bdc0','NzMwZDVjOTI0YmNiMzYzYjk5NTk2NDg4ZmNkNmMzMzcyZDYxNmZmODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAXN1Lg==\n','2015-07-15 07:05:34'),('92ff60c5ad660a365b095bfd38088c1c','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-25 06:08:07'),('93ed86026a09088843cc2b15544c878c','NGI5YzIwZjdjMTYzMjlmNDE3MzcxY2IxMTZjNGRkMDg1MzJhYjQwMDqAAn1xAVUPZGphbmdvX2xh\nbmd1YWdlVQJlbnECcy4=\n','2015-07-09 11:25:08'),('96547748610b3300f4ed0b0dc40fd98a','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-12-07 03:12:37'),('9ade9ac0b674dd9a9acb725b403e757f','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 06:46:53'),('9d0d179965f6f870a3fe5c67c0b70dfa','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 07:16:03'),('9f650755675cf190a7dad27f56177863','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-24 13:10:25'),('a025fec60839a5549c4373dec14ca97e','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-10-26 05:04:05'),('a0708deba9fac1b0c9d573063be3cdf8','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-16 09:57:30'),('a0f026169e65bd2c8ca0d56c770155f4','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 07:16:01'),('a134f7d574ef00e282a8110108be6f4b','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-25 05:08:02'),('a32682003fc2ae055b00196a342db92c','YjY2ODIwNjMwN2Y3ZGRiZTRmYTIwYTE0ZTM0NWEyMzRlNTNmNGE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAV11Lg==\n','2015-08-10 05:25:02'),('a472a0ebac5f734e62d4678ab13b44ae','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-10 05:29:11'),('a9a4c2a80429957cceedddacc7cb3678','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-08-05 12:10:32'),('ab6adf4d9b285d2d292df8a7ad3c2c7b','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 07:57:36'),('ad3d3eebfcd78179ef5932ade8f4a033','NzMwZDVjOTI0YmNiMzYzYjk5NTk2NDg4ZmNkNmMzMzcyZDYxNmZmODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAXN1Lg==\n','2015-07-15 06:39:13'),('b1455225c02b10adaf0387f1cf637c06','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-05 06:22:58'),('b29d67b71ff67807043983750bdc628c','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-25 05:01:08'),('b4132d29097e23976d6f9ce05fde6dba','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-22 13:10:04'),('b846fc5883d8e59a751d5d9533a68b76','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-23 07:07:41'),('b95a5bfc2f059e7832bea157cd544e09','YjY2ODIwNjMwN2Y3ZGRiZTRmYTIwYTE0ZTM0NWEyMzRlNTNmNGE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAV11Lg==\n','2015-08-04 11:18:11'),('bb014dafec9f561a8ff152862667045f','YThmNmQzYTZiMGU1NjkwZmUyODIwNDc5MzgxYTExZGRlYjEwM2VlODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAS11Lg==\n','2015-07-24 05:12:45'),('bb2ba56c1ec393fc5052a018d7a008f5','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-25 05:56:18'),('bda95f35151a5f38b0d58e6a2916a9f3','NzMwZDVjOTI0YmNiMzYzYjk5NTk2NDg4ZmNkNmMzMzcyZDYxNmZmODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAXN1Lg==\n','2015-08-26 04:57:33'),('bdcb6a8cbbce9a7a57b7355868129e45','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-12 11:06:29'),('c6c3b76a29f2105a34c2eeee1cda6e08','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-07-13 09:44:09'),('c7227873d1963cb8a7b4fea6da908b9c','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-10-28 05:13:39'),('c756fe8746b6c3735ceb722dae367005','YjY2ODIwNjMwN2Y3ZGRiZTRmYTIwYTE0ZTM0NWEyMzRlNTNmNGE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAV11Lg==\n','2015-08-08 07:04:56'),('c8c882035257a254224e9256db2f0eae','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-24 05:19:59'),('ca5db708eb54b658b7e2128e84d6838b','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-06 06:03:27'),('cb0ae83e6ed38dc3041d6fc1880dbe2b','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-04 16:19:35'),('cbfb9eb0a2d05bb683d016ab95dd048c','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-07-25 06:11:26'),('cdbe535965511ceae2be64d57a0bad71','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-07-16 05:16:42'),('cdff2fe5afd6ccf9b4959f8e2f95a365','NWM5Y2ZjNDM1NmVlOWIwNDViMTgwMGUyMjRkZjZiM2UxYzBhOWJlYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAVx1Lg==\n','2015-07-24 08:20:23'),('ce2ddbf408c560dcbbbf80acf6e39c09','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 07:05:01'),('ce6b57dcb753aba0d1f1ccfe6b49029e','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-10-27 10:17:56'),('cf99e3bc78104e79485571045feede14','ODU3NDliYmQ5Mjk0ZTI1NWFjYmMyMWEwNTNlYjBlYTk1ZGM1NDhjMjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAXV1Lg==\n','2015-07-13 08:04:35'),('d27a390c00b9ea1b6313c02b60f5f7d3','YjY2ODIwNjMwN2Y3ZGRiZTRmYTIwYTE0ZTM0NWEyMzRlNTNmNGE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAV11Lg==\n','2015-10-27 10:18:05'),('d3d4d3ce0920fa34e84f12e69e33309c','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-24 05:20:16'),('d4265da1273ef919b47988d97119249e','NWM5Y2ZjNDM1NmVlOWIwNDViMTgwMGUyMjRkZjZiM2UxYzBhOWJlYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAVx1Lg==\n','2015-07-09 05:35:03'),('d4366f698881ec66b805ba9c5aeff304','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-11 10:38:05'),('d4b40f4fac76e0da9bb7b589f20c109d','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 09:44:18'),('d5f4627fadda9c547db3b9b916c9d7ac','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-08-21 06:15:56'),('d647158e5a7fad7fdbbeb8b92366d91d','NTgxYzQ5Y2Q2NTI0OWJhYzU1YzFhNGEyNjljMjZlZmUxYzdiYjVjNjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ9kamFuZ29fbGFuZ3VhZ2VYAgAAAGVuVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2015-07-27 07:42:57'),('d8d7badaa654bfaa03824f2bf12129fe','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-07-15 11:29:27'),('d97c6b6a0500e2c1e93b1a21c2605eb4','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-23 07:07:36'),('da5fa5e1983c64bdbfe963ef0a19ab71','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-06 04:38:58'),('db27f62fc2ce1e7fbcf70518435d9192','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-24 06:02:30'),('dd88eaa99ada5b2ea56836b7ec0def0a','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-24 05:17:55'),('de8f9227097219e7a982bc4479c7c4b7','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-22 12:31:38'),('de962427ed5e7a723ae96d13c9668981','ZmVkOGRjYWMwMWJkMjQ5MTY1OTYzYmVkZjEyNzBlNzU2OWUxMzA1YTqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUPZGphbmdvX2xhbmd1YWdlWAIAAABlbnUu\n','2015-07-10 10:18:26'),('e045c0abd9bf98388ccd23ea3c292a39','MzdlNWE5NmYwMjkzZWY3OGY0YTk4N2IwMGIzNzNlODJkYjI0ZDZkYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2015-08-21 09:36:02'),('e39e8c589c2c597c53361a7d81e28716','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-04 11:36:25'),('e3f7af2a116c3bc89ee31c81755d1517','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-08-06 05:54:20'),('e5b8bf9176bc7c5a2883862be3315e31','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 06:51:13'),('e73e088a75eecd71e7c8dd0311f0f9b8','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-14 09:31:14'),('e869ea21f15da94f4b6ccdda797b1efd','MzdlNWE5NmYwMjkzZWY3OGY0YTk4N2IwMGIzNzNlODJkYjI0ZDZkYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2015-07-27 09:26:36'),('ee57c904405c4908d9b6b79893b2003e','NWM5Y2ZjNDM1NmVlOWIwNDViMTgwMGUyMjRkZjZiM2UxYzBhOWJlYTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAVx1Lg==\n','2015-07-08 13:30:22'),('f0bc6d39e8dd2fbd2c064a9797077258','MDAyODEwZDQyMzMxNjRiZDM3YWMwZWVjYzcxZDg1NjcyMDEzN2EzZTqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZHECVQ9kamFuZ29fbGFuZ3VhZ2VYAgAAAGVudS4=\n','2015-07-10 10:18:12'),('f217e00a740431351a9554183e161305','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-10-28 07:51:26'),('f3a95c5c25fee39b7a348f1805d7afe7','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-08-26 05:15:29'),('f4b7977afc573402927d1f15c0344f1f','YjY2ODIwNjMwN2Y3ZGRiZTRmYTIwYTE0ZTM0NWEyMzRlNTNmNGE5ODqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAV11Lg==\n','2015-07-15 13:21:19'),('f7c2824fe93f9e5abf06bd600961f91f','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 07:23:04'),('f89e024b60db787b6285884ceb0dcbb8','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-10-14 02:26:35'),('f9301b961475f0c9d4f170cef5fb0f24','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-23 07:10:12'),('f99808c647186d82e84b4287aa153109','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 06:51:20'),('faab192d8f53fae39e53ab6e8ad93acd','MzdlNWE5NmYwMjkzZWY3OGY0YTk4N2IwMGIzNzNlODJkYjI0ZDZkYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2015-07-17 04:55:07'),('fc6ecb842fa16efd51fb6cf273477db0','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-15 05:45:13'),('fd91e52092a3d6d4096c83f3e24dc7a3','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-07-25 07:41:27');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'192.168.1.45:8000','192.168.1.45:8000');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djmoney_rates_rate`
--

DROP TABLE IF EXISTS `djmoney_rates_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djmoney_rates_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL,
  `currency` varchar(3) NOT NULL,
  `value` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source_id` (`source_id`,`currency`),
  KEY `djmoney_rates_rate_89f89e85` (`source_id`),
  CONSTRAINT `source_id_refs_id_ca2dc046` FOREIGN KEY (`source_id`) REFERENCES `djmoney_rates_ratesource` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djmoney_rates_rate`
--

LOCK TABLES `djmoney_rates_rate` WRITE;
/*!40000 ALTER TABLE `djmoney_rates_rate` DISABLE KEYS */;
INSERT INTO `djmoney_rates_rate` VALUES (1,1,'DZD',99.810388),(2,1,'NAD',12.405390),(3,1,'GHS',3.330473),(4,1,'EGP',7.829770),(5,1,'BGN',1.787160),(6,1,'PAB',1.000000),(7,1,'BOB',6.901930),(8,1,'DKK',6.818345),(9,1,'BWP',10.021217),(10,1,'LBP',1509.162500),(11,1,'TZS',2103.074967),(12,1,'VND',21823.800000),(13,1,'AOA',125.675001),(14,1,'KHR',4081.757525),(15,1,'MYR',3.804721),(16,1,'KYD',0.825705),(17,1,'LYD',1.374596),(18,1,'UAH',22.120940),(19,1,'JOD',0.708638),(20,1,'AWG',1.793333),(21,1,'SAR',3.750236),(22,1,'LTL',3.094108),(23,1,'HKD',7.750983),(24,1,'CHF',0.958055),(25,1,'GIP',0.641442),(26,1,'BYR',15217.400000),(27,1,'ALL',127.843749),(28,1,'XPD',0.001598),(29,1,'MRO',327.296750),(30,1,'HRK',6.930024),(31,1,'DJF',177.576250),(32,1,'SZL',12.407390),(33,1,'THB',34.593870),(34,1,'XAF',599.442677),(35,1,'BND',1.366866),(36,1,'ISK',134.811251),(37,1,'UYU',27.609850),(38,1,'NIO',26.983460),(39,1,'LAK',8145.092598),(40,1,'SYP',188.821003),(41,1,'MAD',9.834746),(42,1,'MZN',38.452501),(43,1,'PHP',45.321410),(44,1,'ZAR',12.411170),(45,1,'NPR',101.740640),(46,1,'ZWL',322.387247),(47,1,'NGN',199.176000),(48,1,'CRC',535.225006),(49,1,'AED',3.673156),(50,1,'EEK',14.435356),(51,1,'MWK',464.238401),(52,1,'LKR',133.893375),(53,1,'PKR',101.871700),(54,1,'HUF',282.409998),(55,1,'BMD',1.000000),(56,1,'LSL',12.391350),(57,1,'MNT',1979.833333),(58,1,'AMD',480.192502),(59,1,'UGX',3322.236667),(60,1,'QAR',3.641382),(61,1,'XDR',0.716400),(62,1,'JMD',116.404751),(63,1,'GEL',2.256733),(64,1,'SHP',0.641442),(65,1,'AFN',60.575000),(66,1,'SBD',7.892362),(67,1,'KPW',899.910000),(68,1,'TRY',2.704214),(69,1,'BDT',77.798712),(70,1,'YER',215.042600),(71,1,'HTG',56.686438),(72,1,'XOF',599.447277),(73,1,'MGA',3329.895016),(74,1,'ANG',1.788750),(75,1,'LRD',85.330002),(76,1,'RWF',732.196872),(77,1,'NOK',8.153719),(78,1,'MOP',7.980086),(79,1,'INR',63.626738),(80,1,'MXN',16.039040),(81,1,'CZK',24.729775),(82,1,'TJS',6.260200),(83,1,'BTC',0.003622),(84,1,'BTN',63.687700),(85,1,'COP',2765.292510),(86,1,'TMT',3.500000),(87,1,'MUR',35.593938),(88,1,'IDR',13401.950000),(89,1,'HNL',21.846637),(90,1,'XPF',109.062351),(91,1,'FJD',2.126250),(92,1,'ETB',20.753563),(93,1,'PEN',3.187458),(94,1,'BZD',2.011265),(95,1,'ILS',3.814234),(96,1,'DOP',45.138862),(97,1,'GGP',0.641442),(98,1,'MDL',19.054410),(99,1,'XPT',0.001019),(100,1,'BSD',1.000000),(101,1,'SEK',8.580519),(102,1,'ZMK',5252.024745),(103,1,'JEP',0.641442),(104,1,'AUD',1.348521),(105,1,'SRD',3.282500),(106,1,'CUP',0.999867),(107,1,'CLF',0.024598),(108,1,'BBD',2.000000),(109,1,'KMF',450.720277),(110,1,'KRW',1156.260020),(111,1,'GMD',39.748575),(112,1,'VEF',6.320663),(113,1,'IMP',0.641442),(114,1,'CUC',1.000000),(115,1,'CLP',651.415880),(116,1,'ZMW',7.620638),(117,1,'EUR',0.910768),(118,1,'CDF',927.349500),(119,1,'XCD',2.701020),(120,1,'KZT',187.254000),(121,1,'RUB',57.246730),(122,1,'XAG',0.067581),(123,1,'TTD',6.367355),(124,1,'OMR',0.385027),(125,1,'BRL',3.203131),(126,1,'MMK',1081.108100),(127,1,'PLN',3.765681),(128,1,'PYG',5202.794967),(129,1,'KES',101.288750),(130,1,'SVC',8.756785),(131,1,'MKD',56.207510),(132,1,'GBP',0.641442),(133,1,'AZN',1.051400),(134,1,'TOP',2.164841),(135,1,'MVR',15.298800),(136,1,'VUV',108.453334),(137,1,'GNF',7260.702598),(138,1,'WST',2.550952),(139,1,'IQD',1165.399976),(140,1,'ERN',15.140000),(141,1,'BAM',1.790405),(142,1,'SCR',13.095875),(143,1,'CAD',1.296956),(144,1,'CVE',100.425834),(145,1,'KWD',0.303121),(146,1,'BIF',1637.117500),(147,1,'PGK',2.767250),(148,1,'SOS',679.408994),(149,1,'TWD',31.201760),(150,1,'SGD',1.366510),(151,1,'UZS',2567.609986),(152,1,'STD',22446.425000),(153,1,'IRR',29564.000000),(154,1,'CNY',6.183578),(155,1,'SLL',4034.000000),(156,1,'TND',1.970784),(157,1,'GYD',206.277502),(158,1,'MTL',0.683738),(159,1,'NZD',1.499804),(160,1,'FKP',0.641442),(161,1,'LVL',0.634507),(162,1,'USD',1.000000),(163,1,'KGS',62.815050),(164,1,'ARS',9.154038),(165,1,'RON',4.034962),(166,1,'GTQ',7.662515),(167,1,'RSD',109.733561),(168,1,'BHD',0.377131),(169,1,'JPY',123.940750),(170,1,'SDG',5.972425),(171,1,'XAU',0.000909);
/*!40000 ALTER TABLE `djmoney_rates_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `djmoney_rates_ratesource`
--

DROP TABLE IF EXISTS `djmoney_rates_ratesource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `djmoney_rates_ratesource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `last_update` datetime NOT NULL,
  `base_currency` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `djmoney_rates_ratesource`
--

LOCK TABLES `djmoney_rates_ratesource` WRITE;
/*!40000 ALTER TABLE `djmoney_rates_ratesource` DISABLE KEYS */;
INSERT INTO `djmoney_rates_ratesource` VALUES (1,'openexchange.org','2015-07-23 12:37:01','USD');
/*!40000 ALTER TABLE `djmoney_rates_ratesource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fxapi_action`
--

DROP TABLE IF EXISTS `fxapi_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fxapi_action` (
  `key` varchar(64) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `action_path` varchar(512) NOT NULL,
  `action_permission` varchar(20) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fxapi_action`
--

LOCK TABLES `fxapi_action` WRITE;
/*!40000 ALTER TABLE `fxapi_action` DISABLE KEYS */;
INSERT INTO `fxapi_action` VALUES ('productlist-list','Product list','/api/product/list/','Internal');
/*!40000 ALTER TABLE `fxapi_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fxapi_client`
--

DROP TABLE IF EXISTS `fxapi_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fxapi_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `domain` varchar(128) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `access_key` varchar(265) DEFAULT NULL,
  `access_secret` varchar(256) DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fxapi_client_fbfc09f1` (`user_id`),
  CONSTRAINT `user_id_refs_id_8f2bcb94` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fxapi_client`
--

LOCK TABLES `fxapi_client` WRITE;
/*!40000 ALTER TABLE `fxapi_client` DISABLE KEYS */;
INSERT INTO `fxapi_client` VALUES (1,'test',25,'test.com','test','4e257c998abef006','074f9d8cc5120129f635141f483433d3',1),(2,'test',44,'test.com','test','305845912f7fcda2','b05be4d38c4010bb55c373be6b8421eb',1),(3,'test',65,'test.com','test','6d6cf946928f0558','3093d9f903f0721621fc5e97af247c60',1);
/*!40000 ALTER TABLE `fxapi_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fxapi_client_actions`
--

DROP TABLE IF EXISTS `fxapi_client_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fxapi_client_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `action_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`,`action_id`),
  KEY `fxapi_client_actions_4a4e8ffb` (`client_id`),
  KEY `fxapi_client_actions_df94c0f0` (`action_id`),
  CONSTRAINT `action_id_refs_key_ab48d85e` FOREIGN KEY (`action_id`) REFERENCES `fxapi_action` (`key`),
  CONSTRAINT `client_id_refs_id_8791451` FOREIGN KEY (`client_id`) REFERENCES `fxapi_client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fxapi_client_actions`
--

LOCK TABLES `fxapi_client_actions` WRITE;
/*!40000 ALTER TABLE `fxapi_client_actions` DISABLE KEYS */;
INSERT INTO `fxapi_client_actions` VALUES (5,1,'productlist-list');
/*!40000 ALTER TABLE `fxapi_client_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_ipn`
--

DROP TABLE IF EXISTS `paypal_ipn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_ipn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `business` varchar(127) NOT NULL,
  `charset` varchar(32) NOT NULL,
  `custom` varchar(255) NOT NULL,
  `notify_version` decimal(64,2) DEFAULT NULL,
  `parent_txn_id` varchar(19) NOT NULL,
  `receiver_email` varchar(127) NOT NULL,
  `receiver_id` varchar(127) NOT NULL,
  `residence_country` varchar(2) NOT NULL,
  `test_ipn` tinyint(1) NOT NULL,
  `txn_id` varchar(19) NOT NULL,
  `txn_type` varchar(128) NOT NULL,
  `verify_sign` varchar(255) NOT NULL,
  `address_country` varchar(64) NOT NULL,
  `address_city` varchar(40) NOT NULL,
  `address_country_code` varchar(64) NOT NULL,
  `address_name` varchar(128) NOT NULL,
  `address_state` varchar(40) NOT NULL,
  `address_status` varchar(11) NOT NULL,
  `address_street` varchar(200) NOT NULL,
  `address_zip` varchar(20) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `first_name` varchar(64) NOT NULL,
  `last_name` varchar(64) NOT NULL,
  `payer_business_name` varchar(127) NOT NULL,
  `payer_email` varchar(127) NOT NULL,
  `payer_id` varchar(13) NOT NULL,
  `auth_amount` decimal(64,2) DEFAULT NULL,
  `auth_exp` varchar(28) NOT NULL,
  `auth_id` varchar(19) NOT NULL,
  `auth_status` varchar(9) NOT NULL,
  `exchange_rate` decimal(64,16) DEFAULT NULL,
  `invoice` varchar(127) NOT NULL,
  `item_name` varchar(127) NOT NULL,
  `item_number` varchar(127) NOT NULL,
  `mc_currency` varchar(32) NOT NULL,
  `mc_fee` decimal(64,2) DEFAULT NULL,
  `mc_gross` decimal(64,2) DEFAULT NULL,
  `mc_handling` decimal(64,2) DEFAULT NULL,
  `mc_shipping` decimal(64,2) DEFAULT NULL,
  `memo` varchar(255) NOT NULL,
  `num_cart_items` int(11) DEFAULT NULL,
  `option_name1` varchar(64) NOT NULL,
  `option_name2` varchar(64) NOT NULL,
  `payer_status` varchar(10) NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_gross` decimal(64,2) DEFAULT NULL,
  `payment_status` varchar(9) NOT NULL,
  `payment_type` varchar(7) NOT NULL,
  `pending_reason` varchar(14) NOT NULL,
  `protection_eligibility` varchar(32) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reason_code` varchar(15) NOT NULL,
  `remaining_settle` decimal(64,2) DEFAULT NULL,
  `settle_amount` decimal(64,2) DEFAULT NULL,
  `settle_currency` varchar(32) NOT NULL,
  `shipping` decimal(64,2) DEFAULT NULL,
  `shipping_method` varchar(255) NOT NULL,
  `tax` decimal(64,2) DEFAULT NULL,
  `transaction_entity` varchar(7) NOT NULL,
  `auction_buyer_id` varchar(64) NOT NULL,
  `auction_closing_date` datetime DEFAULT NULL,
  `auction_multi_item` int(11) DEFAULT NULL,
  `for_auction` decimal(64,2) DEFAULT NULL,
  `amount` decimal(64,2) DEFAULT NULL,
  `amount_per_cycle` decimal(64,2) DEFAULT NULL,
  `initial_payment_amount` decimal(64,2) DEFAULT NULL,
  `next_payment_date` datetime DEFAULT NULL,
  `outstanding_balance` decimal(64,2) DEFAULT NULL,
  `payment_cycle` varchar(32) NOT NULL,
  `period_type` varchar(32) NOT NULL,
  `product_name` varchar(128) NOT NULL,
  `product_type` varchar(128) NOT NULL,
  `profile_status` varchar(32) NOT NULL,
  `recurring_payment_id` varchar(128) NOT NULL,
  `rp_invoice_id` varchar(127) NOT NULL,
  `time_created` datetime DEFAULT NULL,
  `amount1` decimal(64,2) DEFAULT NULL,
  `amount2` decimal(64,2) DEFAULT NULL,
  `amount3` decimal(64,2) DEFAULT NULL,
  `mc_amount1` decimal(64,2) DEFAULT NULL,
  `mc_amount2` decimal(64,2) DEFAULT NULL,
  `mc_amount3` decimal(64,2) DEFAULT NULL,
  `password` varchar(24) NOT NULL,
  `period1` varchar(32) NOT NULL,
  `period2` varchar(32) NOT NULL,
  `period3` varchar(32) NOT NULL,
  `reattempt` varchar(1) NOT NULL,
  `recur_times` int(11) DEFAULT NULL,
  `recurring` varchar(1) NOT NULL,
  `retry_at` datetime DEFAULT NULL,
  `subscr_date` datetime DEFAULT NULL,
  `subscr_effective` datetime DEFAULT NULL,
  `subscr_id` varchar(19) NOT NULL,
  `username` varchar(64) NOT NULL,
  `case_creation_date` datetime DEFAULT NULL,
  `case_id` varchar(14) NOT NULL,
  `case_type` varchar(24) NOT NULL,
  `receipt_id` varchar(64) NOT NULL,
  `currency_code` varchar(32) NOT NULL,
  `handling_amount` decimal(64,2) DEFAULT NULL,
  `transaction_subject` varchar(255) NOT NULL,
  `ipaddress` char(15) NOT NULL,
  `flag` tinyint(1) NOT NULL,
  `flag_code` varchar(16) NOT NULL,
  `flag_info` longtext NOT NULL,
  `query` longtext NOT NULL,
  `response` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `from_view` varchar(6) DEFAULT NULL,
  `userprofile_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paypal_ipn_7ff10c6f` (`txn_id`),
  KEY `fk_paypal_ipn_1_idx` (`userprofile_id`),
  CONSTRAINT `fk_paypal_ipn_1` FOREIGN KEY (`userprofile_id`) REFERENCES `adjod_userprofile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_ipn`
--

LOCK TABLES `paypal_ipn` WRITE;
/*!40000 ALTER TABLE `paypal_ipn` DISABLE KEYS */;
INSERT INTO `paypal_ipn` VALUES (1,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'33X83073ND081473R','web_accept','AT3IEXChCCmRGkHqIF4MmfxeBKVRAO2.Aeh1IXt0EcmSfI5VCEHvbZk-','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.59,9.99,NULL,NULL,'',NULL,'','','verified','2015-06-02 04:06:22',9.99,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=33X83073ND081473R&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=9.99&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=23%3A06%3A22+Jun+01%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=AahWIkxcwJY8B.oSwnp78L6cnIXRZ4DCKKy-Ruf6.al3WikRTOG9Pr2r4OF1PzPq.iUcto1XgvRoMCxPGhr.BuA&verify_sign=AT3IEXChCCmRGkHqIF4MmfxeBKVRAO2.Aeh1IXt0EcmSfI5VCEHvbZk-&payment_fee=0.59&mc_fee=0.59&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=9.99&quantity=1','INVALID','2015-06-02 06:06:41','2015-06-02 06:06:41','',NULL),(2,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'3PH30772A4001260R','web_accept','AFcWxV21C7fd0v3bYYYRCpSSRl31A02Gq4rqr6nUR03oevGtUhIIAc-p','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.33,1.00,NULL,NULL,'',NULL,'','','verified','2015-06-02 04:17:12',1.00,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=3PH30772A4001260R&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=1.00&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=23%3A17%3A12+Jun+01%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=Agil5iBPTgFOxXViMlj3pN3ds6er8ZNhdwBZ5KDCoaSMfIsxkAyVGAmNf3ECy6u.KhIAbG2rtzIVyaOm8YZVQfQ&verify_sign=AFcWxV21C7fd0v3bYYYRCpSSRl31A02Gq4rqr6nUR03oevGtUhIIAc-p&payment_fee=0.33&mc_fee=0.33&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=1.00&quantity=1','INVALID','2015-06-02 06:17:28','2015-06-02 06:17:28','',NULL),(3,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'727952534J997892W','web_accept','AFcWxV21C7fd0v3bYYYRCpSSRl31ALpOOT-4PMbdNrpy.DxVtZVrtl2Z','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.33,1.00,NULL,NULL,'',NULL,'','','verified','2015-06-02 04:18:33',1.00,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=727952534J997892W&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=1.00&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=23%3A18%3A33+Jun+01%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=AsfjEB8oeVgfrOLf4vtTfiUi4-qpYb15MvfrUhtEVytt-D5ZXXSNKjZxdVYTSfWuFv4X5msto-QZwylAF7B0aNA&verify_sign=AFcWxV21C7fd0v3bYYYRCpSSRl31ALpOOT-4PMbdNrpy.DxVtZVrtl2Z&payment_fee=0.33&mc_fee=0.33&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=1.00&quantity=1','INVALID','2015-06-02 06:18:57','2015-06-02 06:18:57','',NULL),(4,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'5NA03084LV9433726','web_accept','AFcWxV21C7fd0v3bYYYRCpSSRl31AgWbuGKdGov8sBAlJALGrDEkjFR-','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.33,1.00,NULL,NULL,'',NULL,'','','verified','2015-06-02 04:26:28',1.00,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=5NA03084LV9433726&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=1.00&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=23%3A26%3A28+Jun+01%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=ADp4ffjjxovQIMh4gAuAzqnu4dK96F6gxFPB2hA14xN-SucKGaW89ZPCu3rll0Dfi6dpPvkmsxF-ipmKqPigf2Q&verify_sign=AFcWxV21C7fd0v3bYYYRCpSSRl31AgWbuGKdGov8sBAlJALGrDEkjFR-&payment_fee=0.33&mc_fee=0.33&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=1.00&quantity=1','INVALID','2015-06-02 06:26:44','2015-06-02 06:26:45','',NULL),(5,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'7M542368J8151403A','web_accept','AiPC9BjkCyDFQXbSkoZcgqH3hpacAdoonY2Z5cLy42wXgcGVAgk93OQE','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.33,1.00,NULL,NULL,'',NULL,'','','verified','2015-06-02 04:30:48',1.00,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=7M542368J8151403A&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=1.00&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=23%3A30%3A48+Jun+01%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=A.XM3aSaMyyTBKxkQ.Lt2-vIKAB7ESKYmBQkVwNglQJCAk3-5wWQNi4iCPOFTpixjJCFVdlfAX-vQ8bb7GCaX0A&verify_sign=AiPC9BjkCyDFQXbSkoZcgqH3hpacAdoonY2Z5cLy42wXgcGVAgk93OQE&payment_fee=0.33&mc_fee=0.33&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=1.00&quantity=1','INVALID','2015-06-02 06:31:18','2015-06-02 06:31:18','',NULL),(6,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'7M542368J8151403A','web_accept','AiPC9BjkCyDFQXbSkoZcgqH3hpacAdoonY2Z5cLy42wXgcGVAgk93OQE','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.33,1.00,NULL,NULL,'',NULL,'','','verified','2015-06-02 04:30:48',1.00,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=7M542368J8151403A&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=1.00&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=23%3A30%3A48+Jun+01%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=A.XM3aSaMyyTBKxkQ.Lt2-vIKAB7ESKYmBQkVwNglQJCAk3-5wWQNi4iCPOFTpixjJCFVdlfAX-vQ8bb7GCaX0A&verify_sign=AiPC9BjkCyDFQXbSkoZcgqH3hpacAdoonY2Z5cLy42wXgcGVAgk93OQE&payment_fee=0.33&mc_fee=0.33&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=1.00&quantity=1','INVALID','2015-06-02 06:31:51','2015-06-02 06:31:51','',NULL),(7,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'8B186207VK676692N','web_accept','AFcWxV21C7fd0v3bYYYRCpSSRl31AkPdFazQpW9DEwSLIAHzdSheWC.T','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.59,9.99,NULL,NULL,'',NULL,'','','verified','2015-06-02 09:21:29',9.99,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=8B186207VK676692N&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=9.99&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=04%3A21%3A29+Jun+02%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=ANbUqx.7sLlC6l-PnAYJIND6qECNwMIyFwWyKoSbllr35nGFaraPEINpnnKhZdPhFJxFr05iwoHZT5vDQX3jzcA&verify_sign=AFcWxV21C7fd0v3bYYYRCpSSRl31AkPdFazQpW9DEwSLIAHzdSheWC.T&payment_fee=0.59&mc_fee=0.59&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=9.99&quantity=1','INVALID','2015-06-02 11:21:50','2015-06-02 11:21:50','',NULL),(8,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'8B186207VK676692N','web_accept','AFcWxV21C7fd0v3bYYYRCpSSRl31AkPdFazQpW9DEwSLIAHzdSheWC.T','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.59,9.99,NULL,NULL,'',NULL,'','','verified','2015-06-02 09:21:29',9.99,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=8B186207VK676692N&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=9.99&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=04%3A21%3A29+Jun+02%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=ANbUqx.7sLlC6l-PnAYJIND6qECNwMIyFwWyKoSbllr35nGFaraPEINpnnKhZdPhFJxFr05iwoHZT5vDQX3jzcA&verify_sign=AFcWxV21C7fd0v3bYYYRCpSSRl31AkPdFazQpW9DEwSLIAHzdSheWC.T&payment_fee=0.59&mc_fee=0.59&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=9.99&quantity=1','INVALID','2015-06-02 11:30:18','2015-06-02 11:30:18','',NULL),(9,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'6UL78400MY148524U','web_accept','AFcWxV21C7fd0v3bYYYRCpSSRl31AUZL9h0e5bzXYoMAs99v4cgtoZTD','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.33,1.00,NULL,NULL,'',NULL,'','','verified','2015-06-02 09:46:57',1.00,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=6UL78400MY148524U&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=1.00&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=04%3A46%3A57+Jun+02%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=APhsj9mdo43fxRIP44jp4wsADz9H1K.LOgwAXgopQ1IT1S5On6dzmSl96tTGVHepvvd0WrCUoULXO1sktHgtcbw&verify_sign=AFcWxV21C7fd0v3bYYYRCpSSRl31AUZL9h0e5bzXYoMAs99v4cgtoZTD&payment_fee=0.33&mc_fee=0.33&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=1.00&quantity=1','INVALID','2015-06-02 11:47:23','2015-06-02 11:47:23','',NULL),(10,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'4TM8965334446851W','web_accept','AyytPoY7zSeE3VaajInnJXPqrcyDAwEt4h4KvDcWHl.kmyDabNQwPZEh','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.33,1.00,NULL,NULL,'',NULL,'','','verified','2015-06-02 09:51:28',1.00,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=4TM8965334446851W&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=1.00&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=04%3A51%3A28+Jun+02%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=AA8.mnO-un2Nk2hNA4DLI0AnlC.KAT3of32kwcyb64NxE8JEfqtrO9Fq-r8NhUp1iN1sqcqcQyigWsJAVDLGIhQ&verify_sign=AyytPoY7zSeE3VaajInnJXPqrcyDAwEt4h4KvDcWHl.kmyDabNQwPZEh&payment_fee=0.33&mc_fee=0.33&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=1.00&quantity=1','INVALID','2015-06-02 11:51:46','2015-06-02 11:51:46','',NULL),(11,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'6G913641W7616721M','web_accept','AQCST7Mas9.KEx8svll2LYqH6GlaAA5BeZ5tB509QCNcNw-Ht2l7hBFx','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.33,1.00,NULL,NULL,'',NULL,'','','verified','2015-06-02 09:53:02',1.00,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=6G913641W7616721M&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=1.00&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=04%3A53%3A02+Jun+02%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=A6.C.kOoLAGMK1EoX51mP5Un3eniomsz1L7DzmTRdBhjXdKN4ol25lgvtRUTYBtwCkxSpzKHeBhi0ly1K6qf1qQ&verify_sign=AQCST7Mas9.KEx8svll2LYqH6GlaAA5BeZ5tB509QCNcNw-Ht2l7hBFx&payment_fee=0.33&mc_fee=0.33&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=1.00&quantity=1','INVALID','2015-06-02 11:53:24','2015-06-02 11:53:24','',NULL),(12,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'71B94671J4702121T','web_accept','A4mmLxketfVVJsdKHN0aMU-5.zt6Aa36RnYIrpzbBeZF6V.V4PfUVEeu','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.33,1.00,NULL,NULL,'',NULL,'','','verified','2015-06-02 10:00:59',1.00,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=71B94671J4702121T&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=1.00&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=05%3A00%3A59+Jun+02%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=AKHvoOOiP5yojn15Nlt9ziFQvpYi9PN4zAhlbY47YEUsGI8OxLjiKrZDSKhCMXA-7.QJDVJSPqzzY19IMfj2gqg&verify_sign=A4mmLxketfVVJsdKHN0aMU-5.zt6Aa36RnYIrpzbBeZF6V.V4PfUVEeu&payment_fee=0.33&mc_fee=0.33&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=1.00&quantity=1','INVALID','2015-06-02 12:01:17','2015-06-02 12:01:17','',NULL),(13,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'3L179867D44995256','web_accept','AFcWxV21C7fd0v3bYYYRCpSSRl31AUJMadOHa2N5kBuPpaeaLfkTNOPL','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.33,1.00,NULL,NULL,'',NULL,'','','verified','2015-06-02 10:31:16',1.00,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=3L179867D44995256&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=1.00&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=05%3A31%3A16+Jun+02%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=AvODUz4gstSiflIvy5EQR-u5lQyBUwNkGaE4A-eR2j59pkAIhukOUYUb0cOIE9skijG.PkFIAAzOG80o..at4ag&verify_sign=AFcWxV21C7fd0v3bYYYRCpSSRl31AUJMadOHa2N5kBuPpaeaLfkTNOPL&payment_fee=0.33&mc_fee=0.33&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=1.00&quantity=1','INVALID','2015-06-02 12:31:54','2015-06-02 12:31:54','',NULL),(14,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'3SH45926F1497521S','web_accept','A-znjy7MP12XBHAqJ87FeE6i6UpYAh.nCUbblVk9MdrnuMenOv7UyU8h','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.33,1.00,NULL,NULL,'',NULL,'','','verified','2015-06-02 10:43:41',1.00,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=3SH45926F1497521S&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=1.00&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=05%3A43%3A41+Jun+02%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=AwHCxiQk9M3Mr-28FPRcldB9x7ytezvR0xmwKO2fWGCM7o96eq8E6OQTxbXnzMcjjtEFP94ycW0NKl.SRayOe4g&verify_sign=A-znjy7MP12XBHAqJ87FeE6i6UpYAh.nCUbblVk9MdrnuMenOv7UyU8h&payment_fee=0.33&mc_fee=0.33&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=1.00&quantity=1','INVALID','2015-06-02 12:44:06','2015-06-02 12:44:06','',NULL),(15,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'30P81916RT579003U','web_accept','AFcWxV21C7fd0v3bYYYRCpSSRl31AOWKSKj1m5LeEkLlKecyfNlRIyRF','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.33,1.00,NULL,NULL,'',NULL,'','','verified','2015-06-03 02:41:53',1.00,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=30P81916RT579003U&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=1.00&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=21%3A41%3A53+Jun+02%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=AAFXyZR7iSmwIyxTWREGUjcCw-QZKFyd.95LS.J6u4QCXS65JImV5aU3dyQi4hrWPdJRKlxJDGQlRNsR3q48bMw&verify_sign=AFcWxV21C7fd0v3bYYYRCpSSRl31AOWKSKj1m5LeEkLlKecyfNlRIyRF&payment_fee=0.33&mc_fee=0.33&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=1.00&quantity=1','INVALID','2015-06-03 04:42:15','2015-06-03 04:42:15','',NULL),(16,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'2F962606W2418200S','web_accept','Ai1PaghZh5FmBLCDCTQpwG8jB264AFmvIr00NuQALNSR4WtEXNuAj34O','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.33,1.00,NULL,NULL,'',NULL,'','','verified','2015-06-03 02:54:53',1.00,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=2F962606W2418200S&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=1.00&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=21%3A54%3A53+Jun+02%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=AmcxmVYvJtvHIiV1LXEy-lIwOgnDkB65ugoNU65Us1D124FSjczbrm2Y2Xbmdo5KFcCHzNNpWkAqpUc2gJ23neg&verify_sign=Ai1PaghZh5FmBLCDCTQpwG8jB264AFmvIr00NuQALNSR4WtEXNuAj34O&payment_fee=0.33&mc_fee=0.33&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=1.00&quantity=1','INVALID','2015-06-03 04:55:10','2015-06-03 04:55:10','',NULL),(17,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'6B558669RW635761G','web_accept','AiPC9BjkCyDFQXbSkoZcgqH3hpacA7ZxP79ZWUH4YbzPKr-rAF5c5g4i','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.33,1.00,NULL,NULL,'',NULL,'','','verified','2015-06-03 03:34:13',1.00,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=6B558669RW635761G&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=1.00&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=22%3A34%3A13+Jun+02%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=A29ER8xZuZODD4kajubRj1MPSBfGtYewS7GU4dH1QkJXLjpNcGt7WknUsaLobSJlpsftSyq8RHxNJLZ24zyadUQ&verify_sign=AiPC9BjkCyDFQXbSkoZcgqH3hpacA7ZxP79ZWUH4YbzPKr-rAF5c5g4i&payment_fee=0.33&mc_fee=0.33&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=1.00&quantity=1','INVALID','2015-06-03 05:34:38','2015-06-03 05:34:38','',NULL),(18,'deepakkuppusamy.gs@gmail.com','utf-8','deepak',3.80,'','deepakkuppusamy.gs@gmail.com','JJQRT7N6QCJVQ','US',1,'5NH057875S290223L','web_accept','AFcWxV21C7fd0v3bYYYRCpSSRl31AG1p1IuprH8H5YjJKh2NayxXBT3X','','','','','','','','','','Deepak','Kuppusamy','','deepak@globalensolutions.com','AHWZZG58VC45G',NULL,'','','',NULL,'','add1','','USD',0.33,1.00,NULL,NULL,'',NULL,'','','verified','2015-06-03 03:47:49',1.00,'Completed','instant','','Ineligible',1,'',NULL,NULL,'',0.00,'',0.00,'','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,'',NULL,NULL,NULL,'','',NULL,'','','','',0.00,'deepak','192.168.1.37',1,'','Invalid postback. (INVALID)','protection_eligibility=Ineligible&last_name=Kuppusamy&txn_id=5NH057875S290223L&receiver_email=deepakkuppusamy.gs%40gmail.com&payment_status=Completed&payment_gross=1.00&tax=0.00&residence_country=US&payer_status=verified&txn_type=web_accept&handling_amount=0.00&payment_date=22%3A47%3A49+Jun+02%2C+2015+PDT&first_name=Deepak&item_name=add1&charset=utf-8&custom=deepak&notify_version=3.8&transaction_subject=deepak&test_ipn=1&item_number=&receiver_id=JJQRT7N6QCJVQ&business=deepakkuppusamy.gs%40gmail.com&payer_id=AHWZZG58VC45G&auth=A2-Kdqot5xh6b0J7REvnHQbGgBthqNr1Zwh6XnVCW08baJ-wdw1E2nN9uOxZTVXg5YbQAnE1dB7Nz-r.0gbgzdw&verify_sign=AFcWxV21C7fd0v3bYYYRCpSSRl31AG1p1IuprH8H5YjJKh2NayxXBT3X&payment_fee=0.33&mc_fee=0.33&mc_currency=USD&shipping=0.00&payer_email=deepak%40globalensolutions.com&payment_type=instant&mc_gross=1.00&quantity=1','INVALID','2015-06-03 05:48:15','2015-06-03 05:48:15','',NULL),(19,'','','',0.00,'','','','',0,'','','','','','','','','','','','','','','','','',0.00,'','','',0.0000000000000000,'','','','USD',0.00,0.00,0.00,0.00,'',0,'','','',NULL,0.00,'','','','',1,'',0.00,0.00,'',0.00,'',0.00,'','',NULL,0,0.00,0.00,0.00,0.00,NULL,0.00,'','','','','','','',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'','','','','',0,'',NULL,NULL,NULL,'','',NULL,'','','','USD',0.00,'','192.168.1.45',1,'','Invalid form. (<ul class=\"errorlist\"><li>userprofile<ul class=\"errorlist\"><li>Dieses Feld ist zwingend erforderlich.</li></ul></li></ul>)','item_number=&tx=12C76307VC711543H&cm=deepak&cc=USD&st=Completed&amt=9.99','','2015-08-07 09:42:40','2015-08-07 09:42:40',NULL,17),(20,'','','',0.00,'','','','',0,'','','','','','','','','','','','','','','','','',0.00,'','','',0.0000000000000000,'','','','USD',0.00,0.00,0.00,0.00,'',0,'','','',NULL,0.00,'','','','',1,'',0.00,0.00,'',0.00,'',0.00,'','',NULL,0,0.00,0.00,0.00,0.00,NULL,0.00,'','','','','','','',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'','','','','',0,'',NULL,NULL,NULL,'','',NULL,'','','','USD',0.00,'','192.168.1.45',1,'','Invalid form. (<ul class=\"errorlist\"><li>userprofile<ul class=\"errorlist\"><li>Dieses Feld ist zwingend erforderlich.</li></ul></li></ul>)','item_number=&tx=0RP349854D908451J&cm=deepak&cc=USD&st=Completed&amt=9.99','','2015-08-12 05:36:18','2015-08-12 05:36:18',NULL,17),(21,'','','',0.00,'','','','',0,'','','','','','','','','','','','','','','','','',0.00,'','','',0.0000000000000000,'','','','USD',0.00,0.00,0.00,0.00,'',0,'','','',NULL,0.00,'','','','',1,'',0.00,0.00,'',0.00,'',0.00,'','',NULL,0,0.00,0.00,0.00,0.00,NULL,0.00,'','','','','','','',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'','','','','',0,'',NULL,NULL,NULL,'','',NULL,'','','','USD',0.00,'','192.168.1.45',1,'','Invalid form. (<ul class=\"errorlist\"><li>userprofile<ul class=\"errorlist\"><li>Dieses Feld ist zwingend erforderlich.</li></ul></li></ul>)','item_number=&tx=2RY11078MV2171823&cm=deepak&cc=USD&st=Completed&amt=9.99','','2015-08-12 06:57:49','2015-08-12 06:57:49',NULL,17),(22,'','','',0.00,'','','','',0,'','','','','','','','','','','','','','','','','',0.00,'','','',0.0000000000000000,'','','','USD',0.00,0.00,0.00,0.00,'',0,'','','',NULL,0.00,'','','','',1,'',0.00,0.00,'',0.00,'',0.00,'','',NULL,0,0.00,0.00,0.00,0.00,NULL,0.00,'','','','','','','',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'','','','','',0,'',NULL,NULL,NULL,'','',NULL,'','','','USD',0.00,'','192.168.1.45',1,'','Invalid form. (<ul class=\"errorlist\"><li>userprofile<ul class=\"errorlist\"><li>Dieses Feld ist zwingend erforderlich.</li></ul></li></ul>)','item_number=&tx=14160992YK8020239&cm=deepak&cc=USD&st=Completed&amt=9.99','','2015-08-12 07:04:52','2015-08-12 07:04:52',NULL,17);
/*!40000 ALTER TABLE `paypal_ipn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_message`
--

DROP TABLE IF EXISTS `services_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(20) NOT NULL,
  `text` varchar(140) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_message`
--

LOCK TABLES `services_message` WRITE;
/*!40000 ALTER TABLE `services_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smsverify_deferredaction`
--

DROP TABLE IF EXISTS `smsverify_deferredaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smsverify_deferredaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(40) NOT NULL,
  `valid_until` datetime DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `form_class` varchar(255) NOT NULL,
  `form_input` longtext NOT NULL,
  `form_prefix` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_pk` longtext,
  PRIMARY KEY (`id`),
  KEY `smsverify_deferredaction_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_e94ae028` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smsverify_deferredaction`
--

LOCK TABLES `smsverify_deferredaction` WRITE;
/*!40000 ALTER TABLE `smsverify_deferredaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `smsverify_deferredaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_productexpiredadtracking`
--

DROP TABLE IF EXISTS `worker_productexpiredadtracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_productexpiredadtracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `email_sent_count` int(10) unsigned NOT NULL,
  `last_email_sent` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `worker_productexpiredadtracking_bb420c12` (`product_id`),
  CONSTRAINT `product_id_refs_id_de880ce1` FOREIGN KEY (`product_id`) REFERENCES `advertisement_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_productexpiredadtracking`
--

LOCK TABLES `worker_productexpiredadtracking` WRITE;
/*!40000 ALTER TABLE `worker_productexpiredadtracking` DISABLE KEYS */;
INSERT INTO `worker_productexpiredadtracking` VALUES (1,1,17,'2015-07-22 07:34:15'),(2,2,7,'2015-07-22 07:34:15'),(3,3,4,'2015-07-22 07:34:15'),(4,4,4,'2015-07-22 07:34:15'),(5,5,4,'2015-07-22 07:34:15'),(6,6,3,'2015-07-22 07:34:15'),(7,7,1,'2015-05-30 05:50:33');
/*!40000 ALTER TABLE `worker_productexpiredadtracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_usertracking`
--

DROP TABLE IF EXISTS `worker_usertracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_usertracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track_alert_id` int(11) NOT NULL,
  `email_sent_count` int(10) unsigned NOT NULL,
  `email_read_count` int(10) unsigned NOT NULL,
  `email_view_count` int(10) unsigned NOT NULL,
  `recent_email_fail_count` int(10) unsigned NOT NULL,
  `last_email_sent` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `worker_usertracking_93d8b9b7` (`track_alert_id`),
  CONSTRAINT `track_alert_id_refs_id_e98f7fdc` FOREIGN KEY (`track_alert_id`) REFERENCES `advertisement_freealert` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_usertracking`
--

LOCK TABLES `worker_usertracking` WRITE;
/*!40000 ALTER TABLE `worker_usertracking` DISABLE KEYS */;
INSERT INTO `worker_usertracking` VALUES (1,1,5,0,0,0,'2015-05-27 07:36:32'),(2,2,17,0,0,0,'2015-05-27 07:36:32');
/*!40000 ALTER TABLE `worker_usertracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_worker`
--

DROP TABLE IF EXISTS `worker_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_worker` (
  `id` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `cls_path` varchar(512) NOT NULL,
  `interval` bigint(20) NOT NULL,
  `wait_for_approval` bigint(20) NOT NULL,
  `notify_for_approval` varchar(2048) DEFAULT NULL,
  `notify_for_errors` varchar(2048) DEFAULT NULL,
  `options` longtext,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_worker`
--

LOCK TABLES `worker_worker` WRITE;
/*!40000 ALTER TABLE `worker_worker` DISABLE KEYS */;
INSERT INTO `worker_worker` VALUES ('email_expiredads','Email_ExpiredAds','worker.workers.EmailNotification_ExpiredAds',5,0,'','','',1),('freealert_notice_email','Freealert Notice Email','worker.workers.EmailNotificationWorker',10,0,'','','',1);
/*!40000 ALTER TABLE `worker_worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_workernoticeemailtask`
--

DROP TABLE IF EXISTS `worker_workernoticeemailtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_workernoticeemailtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL,
  `created_alert_id` int(11) NOT NULL,
  `tracking_code` varchar(256) DEFAULT NULL,
  `iteration_count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `worker_workernoticeemailtask_c00fe455` (`task_id`),
  KEY `worker_workernoticeemailtask_9bb977a6` (`created_alert_id`),
  CONSTRAINT `created_alert_id_refs_id_d62c0f6a` FOREIGN KEY (`created_alert_id`) REFERENCES `advertisement_freealert` (`id`),
  CONSTRAINT `task_id_refs_id_29546302` FOREIGN KEY (`task_id`) REFERENCES `worker_workertask` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_workernoticeemailtask`
--

LOCK TABLES `worker_workernoticeemailtask` WRITE;
/*!40000 ALTER TABLE `worker_workernoticeemailtask` DISABLE KEYS */;
INSERT INTO `worker_workernoticeemailtask` VALUES (1,1,1,'00c479ad03ab851c1696989b5b',4),(2,1,2,'74c135f27929c0b83130c3a71b',4);
/*!40000 ALTER TABLE `worker_workernoticeemailtask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_workernoticeemailtask_product`
--

DROP TABLE IF EXISTS `worker_workernoticeemailtask_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_workernoticeemailtask_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workernoticeemailtask_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `workernoticeemailtask_id` (`workernoticeemailtask_id`,`product_id`),
  KEY `worker_workernoticeemailtask_product_83680260` (`workernoticeemailtask_id`),
  KEY `worker_workernoticeemailtask_product_bb420c12` (`product_id`),
  CONSTRAINT `product_id_refs_id_44eadd15` FOREIGN KEY (`product_id`) REFERENCES `advertisement_product` (`id`),
  CONSTRAINT `workernoticeemailtask_id_refs_id_8b3e90bb` FOREIGN KEY (`workernoticeemailtask_id`) REFERENCES `worker_workernoticeemailtask` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_workernoticeemailtask_product`
--

LOCK TABLES `worker_workernoticeemailtask_product` WRITE;
/*!40000 ALTER TABLE `worker_workernoticeemailtask_product` DISABLE KEYS */;
INSERT INTO `worker_workernoticeemailtask_product` VALUES (18,1,9),(19,2,1),(21,2,2),(20,2,10),(22,2,15);
/*!40000 ALTER TABLE `worker_workernoticeemailtask_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_workertask`
--

DROP TABLE IF EXISTS `worker_workertask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_workertask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_id` varchar(128) NOT NULL,
  `notes` longtext,
  `worker_options` longtext,
  `status` varchar(64) NOT NULL,
  `scheduled` datetime DEFAULT NULL,
  `started` datetime DEFAULT NULL,
  `completed` datetime DEFAULT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `worker_workertask_20fc5b84` (`worker_id`),
  CONSTRAINT `worker_id_refs_id_6c71c3dc` FOREIGN KEY (`worker_id`) REFERENCES `worker_worker` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_workertask`
--

LOCK TABLES `worker_workertask` WRITE;
/*!40000 ALTER TABLE `worker_workertask` DISABLE KEYS */;
INSERT INTO `worker_workertask` VALUES (1,'freealert_notice_email','','','completed','2015-05-27 07:36:32','2015-05-27 07:36:32','2015-05-27 07:36:54','2015-05-27 07:36:54');
/*!40000 ALTER TABLE `worker_workertask` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-23 10:19:24
