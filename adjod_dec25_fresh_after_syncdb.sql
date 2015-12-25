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
-- Table structure for table `adjod_basecurrency`
--

DROP TABLE IF EXISTS `adjod_basecurrency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjod_basecurrency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base_currency` varchar(3) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjod_basecurrency`
--

LOCK TABLES `adjod_basecurrency` WRITE;
/*!40000 ALTER TABLE `adjod_basecurrency` DISABLE KEYS */;
INSERT INTO `adjod_basecurrency` VALUES (1,'SGD','2015-12-15 08:12:26');
/*!40000 ALTER TABLE `adjod_basecurrency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adjod_exchangerate`
--

DROP TABLE IF EXISTS `adjod_exchangerate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjod_exchangerate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency` varchar(3) NOT NULL,
  `value` decimal(20,6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjod_exchangerate`
--

LOCK TABLES `adjod_exchangerate` WRITE;
/*!40000 ALTER TABLE `adjod_exchangerate` DISABLE KEYS */;
INSERT INTO `adjod_exchangerate` VALUES (1,'DZD',75.627585),(2,'NAD',10.855301),(3,'GHS',2.717093),(4,'EGP',5.571698),(5,'BGN',1.270268),(6,'PAB',0.711802),(7,'BOB',4.917338),(8,'DKK',4.846447),(9,'BWP',7.888253),(10,'LBP',1074.038089),(11,'TZS',1522.991799),(12,'VND',16017.693026),(13,'AOA',96.297325),(14,'KHR',2881.310553),(15,'MYR',3.049605),(16,'KYD',0.587043),(17,'LYD',0.989459),(18,'UAH',16.307634),(19,'JOD',0.504846),(20,'AWG',1.274185),(21,'SAR',2.671105),(22,'LTL',2.206628),(23,'HKD',5.517290),(24,'CHF',0.702905),(25,'GIP',0.476421),(26,'BYR',13053.452774),(27,'ALL',89.003869),(28,'XPD',0.001272),(29,'MRO',217.189070),(30,'HRK',4.963287),(31,'DJF',126.465422),(32,'SZL',10.857216),(33,'THB',25.664364),(34,'XAF',426.347142),(35,'BND',1.000391),(36,'ISK',92.117860),(37,'UYU',21.172281),(38,'NIO',19.824697),(39,'LAK',5801.562119),(40,'SYP',156.829919),(41,'MAD',7.036105),(42,'MZN',34.348006),(43,'PHP',33.583090),(44,'ZAR',10.867704),(45,'NPR',75.363749),(46,'ZWL',229.475898),(47,'NGN',141.627180),(48,'CRC',381.451221),(49,'AED',2.614563),(50,'EEK',10.166579),(51,'MWK',460.569729),(52,'LKR',102.215270),(53,'PKR',74.574645),(54,'HUF',205.313530),(55,'BMD',0.711802),(56,'LSL',10.870676),(57,'MNT',1418.146918),(58,'AMD',341.791320),(59,'UGX',2387.004393),(60,'QAR',2.591930),(61,'XDR',0.512315),(62,'JMD',85.471836),(63,'GEL',1.709731),(64,'SHP',0.476421),(65,'AFN',48.438130),(66,'SBD',5.810436),(67,'KPW',640.685892),(68,'TRY',2.076879),(69,'BDT',55.854622),(70,'YER',153.113671),(71,'HTG',40.255644),(72,'XOF',426.463096),(73,'MGA',2281.403805),(74,'ANG',1.273307),(75,'LRD',61.093970),(76,'RWF',532.434233),(77,'NOK',6.175715),(78,'MOP',5.679737),(79,'INR',46.972400),(80,'MXN',12.278023),(81,'CZK',17.550981),(82,'TJS',4.926524),(83,'BTC',0.001555),(84,'BTN',47.082832),(85,'COP',2283.949695),(86,'TMT',2.492541),(87,'MUR',25.594995),(88,'IDR',9696.357116),(89,'HNL',15.484484),(90,'XPF',77.575362),(91,'FJD',1.514157),(92,'ETB',15.066073),(93,'PEN',2.413908),(94,'BZD',1.419832),(95,'ILS',2.766145),(96,'DOP',32.396730),(97,'GGP',0.476421),(98,'MDL',14.007609),(99,'XPT',0.000806),(100,'BSD',0.711802),(101,'SEK',5.975651),(102,'ZMK',3738.401894),(103,'JEP',0.476421),(104,'AUD',0.978264),(105,'SRD',2.809839),(106,'CUP',0.711562),(107,'CLF',0.017509),(108,'BBD',1.423604),(109,'KMF',320.401171),(110,'KRW',833.020727),(111,'GMD',28.158967),(112,'VEF',4.498968),(113,'IMP',0.476421),(114,'CUC',0.711802),(115,'CLP',498.389905),(116,'ZMW',7.804741),(117,'EUR',0.649015),(118,'CDF',660.759066),(119,'XCD',1.922592),(120,'KZT',232.503861),(121,'RUB',49.965878),(122,'XAG',0.050009),(123,'TTD',4.567357),(124,'OMR',0.274126),(125,'BRL',2.808199),(126,'MMK',933.220496),(127,'PLN',2.752560),(128,'PYG',4117.090285),(129,'KES',72.850020),(130,'SVC',6.221000),(131,'MKD',40.019809),(132,'GBP',0.476421),(133,'AZN',1.109569),(134,'TOP',1.594842),(135,'MVR',10.905258),(136,'VUV',79.484263),(137,'GNF',5515.857205),(138,'WST',1.824620),(139,'IQD',783.261021),(140,'ERN',10.675963),(141,'BAM',1.271434),(142,'SCR',9.276482),(143,'CAD',0.984391),(144,'CVE',71.563683),(145,'KWD',0.215978),(146,'BIF',1110.777750),(147,'PGK',2.127363),(148,'SOS',442.315387),(149,'TWD',23.327739),(150,'SGD',1.000000),(151,'UZS',1980.784922),(152,'STD',15936.251010),(153,'IRR',21347.298889),(154,'CNY',4.606126),(155,'SLL',2993.127551),(156,'TND',1.445013),(157,'GYD',146.354673),(158,'MTL',0.486686),(159,'NZD',1.041618),(160,'FKP',0.476421),(161,'LVL',0.451679),(162,'USD',0.711802),(163,'KGS',54.002535),(164,'ARS',9.363571),(165,'RON',2.940312),(166,'GTQ',5.420821),(167,'RSD',79.062443),(168,'BHD',0.268482),(169,'JPY',85.574834),(170,'SDG',4.382355),(171,'XAU',0.000661);
/*!40000 ALTER TABLE `adjod_exchangerate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adjod_userprofile`
--

DROP TABLE IF EXISTS `adjod_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adjod_userprofile` (
  `user_ptr_id` int(11) NOT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `confirmation_code` varchar(500) NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `language` varchar(5) NOT NULL,
  `age_status` tinyint(1) NOT NULL,
  `is_emailverified` tinyint(1) NOT NULL,
  `ad_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_ptr_id`),
  KEY `adjod_userprofile_586a73b5` (`city_id`),
  CONSTRAINT `city_id_refs_id_35a1c332` FOREIGN KEY (`city_id`) REFERENCES `advertisement_city` (`id`),
  CONSTRAINT `user_ptr_id_refs_id_3eff55ca` FOREIGN KEY (`user_ptr_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjod_userprofile`
--

LOCK TABLES `adjod_userprofile` WRITE;
/*!40000 ALTER TABLE `adjod_userprofile` DISABLE KEYS */;
INSERT INTO `adjod_userprofile` VALUES (4,'98765 43210','OeVJQ1OtPnIfk5G6Yjl2oPdutJXpBtK6X',0,NULL,'en',1,0,0),(17,'','l8QdnL7AZ1GWZ8z4KUrcv7MhgWdv7hgjV',0,NULL,'en',1,0,0),(18,'','mQvLzXJfd659CHj0AqK3pIoooIaO0zNTE',0,NULL,'en',1,0,0),(19,'','Sy5PZlVR84GhBPn5LeHZCmIJZtYZhPrT5',0,NULL,'en',1,0,0),(20,'','DaxrraBqtG6elfEOgwf0Ogch9nOdtewo4',0,NULL,'en',1,0,0),(21,'','wnUxNEvqlHRj3nM5aHyzJRVg2RkAtX1Eh',0,NULL,'en',1,1,0),(22,'','Icx4kGe15jIj568FbpmBEHW1FYBMCJIYC',0,NULL,'en',1,0,0),(23,'','S5QB3Bkq7c7S135IhCWBSgmwQaCFX3FWE',0,NULL,'en',1,0,0),(24,'','gtVuOWA82bpZfDPEPbXst8hoW1O04VjQr',0,NULL,'en',1,0,0);
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
INSERT INTO `advertisement_category` VALUES (1,'icons/car.png','Cars & Bikes','Suzuki,Audi,BMW'),(2,'icons/mobile.png','Mobiles & Tablets','Macbooks,Asus laptops'),(3,'icons/plug.png','Electronic & Appliance','Cordless,Electric cooker,Fridge'),(4,'icons/home.png','Real estate','Flats for sale,Space for rent'),(5,'icons/case.png','Jobs','Part timer,Freelancer'),(6,'icons/tree.png','Home & Lifestyle','Light lamps,Luggage'),(7,'icons/tool.png','Services','Architecture,advertising'),(8,'icons/prize.png','Education & Learning','Tuition classes,Online coaching'),(9,'icons/paw.png','Pets & Pet care','SPet Adoption,Pet care'),(10,'icons/game.png','Entertainment','Gaming,Cameramen'),(11,'icons/gift.png','Community & Events','Party, Event, Charity'),(12,'icons/heart.png','Matrimonial','Grooms,bride,planner');
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
INSERT INTO `advertisement_city` VALUES (1,'Pondicherry','(\'IN\', u\'I','India');
/*!40000 ALTER TABLE `advertisement_city` ENABLE KEYS */;
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
  `alert_user_id` int(11) DEFAULT NULL,
  `alert_category_id` int(11) NOT NULL,
  `alert_subcategory_id` int(11) NOT NULL,
  `alert_brand_id` int(11) NOT NULL,
  `alert_city_id` int(11) NOT NULL,
  `alert_email` varchar(30) NOT NULL,
  `alert_mobile` varchar(30) NOT NULL,
  `mail_is_sent` tinyint(1) NOT NULL,
  `last_email_sent` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `advertisement_freealert_b68fb4ee` (`alert_user_id`),
  KEY `advertisement_freealert_f7275d65` (`alert_category_id`),
  KEY `advertisement_freealert_e462e990` (`alert_subcategory_id`),
  KEY `advertisement_freealert_35295a9` (`alert_brand_id`),
  KEY `advertisement_freealert_5018a84e` (`alert_city_id`),
  CONSTRAINT `alert_subcategory_id_refs_id_3f91be57` FOREIGN KEY (`alert_subcategory_id`) REFERENCES `advertisement_subcategory` (`id`),
  CONSTRAINT `alert_brand_id_refs_id_af8e1c95` FOREIGN KEY (`alert_brand_id`) REFERENCES `advertisement_dropdown` (`id`),
  CONSTRAINT `alert_category_id_refs_id_918c49e` FOREIGN KEY (`alert_category_id`) REFERENCES `advertisement_category` (`id`),
  CONSTRAINT `alert_city_id_refs_id_e4001ba5` FOREIGN KEY (`alert_city_id`) REFERENCES `advertisement_city` (`id`),
  CONSTRAINT `alert_user_id_refs_user_ptr_id_d3569bb8` FOREIGN KEY (`alert_user_id`) REFERENCES `adjod_userprofile` (`user_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_freealert`
--

LOCK TABLES `advertisement_freealert` WRITE;
/*!40000 ALTER TABLE `advertisement_freealert` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_locality`
--

LOCK TABLES `advertisement_locality` WRITE;
/*!40000 ALTER TABLE `advertisement_locality` DISABLE KEYS */;
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
  `currency` varchar(10) NOT NULL,
  `purpose` varchar(30) NOT NULL,
  `month` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_premiumpriceinfo`
--

LOCK TABLES `advertisement_premiumpriceinfo` WRITE;
/*!40000 ALTER TABLE `advertisement_premiumpriceinfo` DISABLE KEYS */;
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
  `video` varchar(100) DEFAULT NULL,
  `condition` varchar(10) NOT NULL,
  `price` double DEFAULT NULL,
  `ad_brand_id` int(11) DEFAULT NULL,
  `ad_year` varchar(10) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `locality_id` int(11) NOT NULL,
  `country_code` varchar(10) NOT NULL,
  `description` longtext NOT NULL,
  `you_are` varchar(20) NOT NULL,
  `you_name` varchar(20) DEFAULT NULL,
  `you_email` varchar(30) NOT NULL,
  `you_phone` varchar(12) DEFAULT NULL,
  `created_date` date NOT NULL,
  `modified_date` date NOT NULL,
  `isregistered_user` tinyint(1) NOT NULL,
  `ispremium` tinyint(1) NOT NULL,
  `premium_plan_id` int(11) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `status_isactive` tinyint(1) NOT NULL,
  `post_term_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `advertisement_product_1be3128f` (`userprofile_id`),
  KEY `advertisement_product_42dc49bc` (`category_id`),
  KEY `advertisement_product_913b3835` (`subcategory_id`),
  KEY `advertisement_product_c06c66db` (`ad_brand_id`),
  KEY `advertisement_product_586a73b5` (`city_id`),
  KEY `advertisement_product_df6acbd9` (`locality_id`),
  KEY `advertisement_product_d215e54f` (`premium_plan_id`),
  CONSTRAINT `category_id_refs_id_d73d417d` FOREIGN KEY (`category_id`) REFERENCES `advertisement_category` (`id`),
  CONSTRAINT `ad_brand_id_refs_id_53d1ee6c` FOREIGN KEY (`ad_brand_id`) REFERENCES `advertisement_dropdown` (`id`),
  CONSTRAINT `city_id_refs_id_5f1fd95a` FOREIGN KEY (`city_id`) REFERENCES `advertisement_city` (`id`),
  CONSTRAINT `locality_id_refs_id_56128078` FOREIGN KEY (`locality_id`) REFERENCES `advertisement_locality` (`id`),
  CONSTRAINT `premium_plan_id_refs_id_a1f7d119` FOREIGN KEY (`premium_plan_id`) REFERENCES `advertisement_premiumpriceinfo` (`id`),
  CONSTRAINT `subcategory_id_refs_id_fbdf449e` FOREIGN KEY (`subcategory_id`) REFERENCES `advertisement_subcategory` (`id`),
  CONSTRAINT `userprofile_id_refs_user_ptr_id_5e2de78f` FOREIGN KEY (`userprofile_id`) REFERENCES `adjod_userprofile` (`user_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_product`
--

LOCK TABLES `advertisement_product` WRITE;
/*!40000 ALTER TABLE `advertisement_product` DISABLE KEYS */;
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
  CONSTRAINT `userprofile_id_refs_user_ptr_id_af104196` FOREIGN KEY (`userprofile_id`) REFERENCES `adjod_userprofile` (`user_ptr_id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `auth_permission_e4470c6e` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add user profile',8,'add_userprofile'),(23,'Can change user profile',8,'change_userprofile'),(24,'Can delete user profile',8,'delete_userprofile'),(25,'Can add exchange rate',9,'add_exchangerate'),(26,'Can change exchange rate',9,'change_exchangerate'),(27,'Can delete exchange rate',9,'delete_exchangerate'),(28,'Can add base currency',10,'add_basecurrency'),(29,'Can change base currency',10,'change_basecurrency'),(30,'Can delete base currency',10,'delete_basecurrency'),(31,'Can add category',11,'add_category'),(32,'Can change category',11,'change_category'),(33,'Can delete category',11,'delete_category'),(34,'Can add sub category',12,'add_subcategory'),(35,'Can change sub category',12,'change_subcategory'),(36,'Can delete sub category',12,'delete_subcategory'),(37,'Can add dropdown',13,'add_dropdown'),(38,'Can change dropdown',13,'change_dropdown'),(39,'Can delete dropdown',13,'delete_dropdown'),(40,'Can add city',14,'add_city'),(41,'Can change city',14,'change_city'),(42,'Can delete city',14,'delete_city'),(43,'Can add locality',15,'add_locality'),(44,'Can change locality',15,'change_locality'),(45,'Can delete locality',15,'delete_locality'),(46,'Can add premium price info',16,'add_premiumpriceinfo'),(47,'Can change premium price info',16,'change_premiumpriceinfo'),(48,'Can delete premium price info',16,'delete_premiumpriceinfo'),(49,'Can add product',17,'add_product'),(50,'Can change product',17,'change_product'),(51,'Can delete product',17,'delete_product'),(52,'Can add free alert',18,'add_freealert'),(53,'Can change free alert',18,'change_freealert'),(54,'Can delete free alert',18,'delete_freealert'),(55,'Can add transaction',19,'add_transaction'),(56,'Can change transaction',19,'change_transaction'),(57,'Can delete transaction',19,'delete_transaction'),(58,'Can add worker',20,'add_worker'),(59,'Can change worker',20,'change_worker'),(60,'Can delete worker',20,'delete_worker'),(61,'Can add worker task',21,'add_workertask'),(62,'Can change worker task',21,'change_workertask'),(63,'Can delete worker task',21,'delete_workertask'),(64,'Can add user tracking',22,'add_usertracking'),(65,'Can change user tracking',22,'change_usertracking'),(66,'Can delete user tracking',22,'delete_usertracking'),(67,'Can add worker notice email task',23,'add_workernoticeemailtask'),(68,'Can change worker notice email task',23,'change_workernoticeemailtask'),(69,'Can delete worker notice email task',23,'delete_workernoticeemailtask'),(70,'Can add product expired ad tracking',24,'add_productexpiredadtracking'),(71,'Can change product expired ad tracking',24,'change_productexpiredadtracking'),(72,'Can delete product expired ad tracking',24,'delete_productexpiredadtracking'),(73,'Can add site banner',25,'add_sitebanner'),(74,'Can change site banner',25,'change_sitebanner'),(75,'Can delete site banner',25,'delete_sitebanner'),(76,'Can add chat message',26,'add_chatmessage'),(77,'Can change chat message',26,'change_chatmessage'),(78,'Can delete chat message',26,'delete_chatmessage'),(79,'Can add last active',27,'add_lastactive'),(80,'Can change last active',27,'change_lastactive'),(81,'Can delete last active',27,'delete_lastactive'),(82,'Can add PayPal IPN',28,'add_paypalipn'),(83,'Can change PayPal IPN',28,'change_paypalipn'),(84,'Can delete PayPal IPN',28,'delete_paypalipn'),(85,'Can add rate source',29,'add_ratesource'),(86,'Can change rate source',29,'change_ratesource'),(87,'Can delete rate source',29,'delete_ratesource'),(88,'Can add rate',30,'add_rate'),(89,'Can change rate',30,'change_rate'),(90,'Can delete rate',30,'delete_rate');
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','','','kalaimca.gs@gmail.com','pbkdf2_sha256$10000$ajVhqcSgC0ro$7CI7qwEtxA8gMpgnLc0v0H51eC6R5yl01TZ/Uh+oHhU=',1,1,1,'2015-12-25 13:53:12','2015-12-25 07:24:16'),(17,'dsfgas','ssdfas','','dasdf@gmail.com','pbkdf2_sha256$10000$lQ9YunqkQjsb$m046klWKBw515sVvgpROBWCE6a320pGBhcXzNDsKNAw=',0,1,0,'2015-12-25 11:19:54','2015-12-25 11:19:54'),(18,'asfasdf','asdfasd','','sdfads@gmail.com','pbkdf2_sha256$10000$NTcIDTqA4Cmh$w9EW7Tm7aOKr8tyJAfymLqUYojXf3madPXS6O1xj2Sk=',0,1,0,'2015-12-25 11:24:09','2015-12-25 11:24:09'),(19,'asdf','asdf','','asaas@gmail.com','pbkdf2_sha256$10000$kwGTEQKfqzQ1$Jj3o51iUfb5zI0OiCJN/3MHwCixJJXbVnT3vKogAZ5w=',0,1,0,'2015-12-25 11:25:02','2015-12-25 11:25:02'),(20,'test','test','','test@gmail.com','pbkdf2_sha256$10000$adHwlkq9IUmL$i4SltLonyVaj56ocRYhBzWxTLvOVv/LTOlGTa8fQUJ0=',0,1,0,'2015-12-25 11:34:02','2015-12-25 11:29:26'),(21,'kalai','kalai','','kalairkv.mca14@gmail.com','pbkdf2_sha256$10000$5ltMlYQnrBWz$Nwc21+3PrIe/Sbfsd2DFr3c1U417pAjBRWpL1aiQtZ0=',0,1,0,'2015-12-25 13:53:04','2015-12-25 11:34:39'),(22,'asdadsf','asdadsf','','fdfdfdfd@gmail.com','pbkdf2_sha256$10000$huXcbGXgzkSd$O5kP3VEkwrN2IM2eO7jTlFaW1FR4vzlrKxqN5a8IqkM=',0,1,0,'2015-12-25 11:47:25','2015-12-25 11:43:32'),(23,'asdfadsf','asdfadsf','','teasd@gmail.com','pbkdf2_sha256$10000$iz5lClnsk9bN$3rNUu3HyBRznyAa9XisGBdAS+gSWOF8lKNNbwFIsXwg=',0,1,0,'2015-12-25 11:52:05','2015-12-25 11:49:47'),(24,'asdfasdf','asdfasdf','','fdfkjkj@gmail.com','pbkdf2_sha256$10000$NpoYG2xSJsQP$7KIRAKfrN9MrP84mOf2qSOdlr+RqrngJo7jlIKwzMbM=',0,1,0,'2015-12-25 12:13:58','2015-12-25 11:58:20');
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
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`),
  CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_sitebanner`
--

LOCK TABLES `banner_sitebanner` WRITE;
/*!40000 ALTER TABLE `banner_sitebanner` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_chatmessage`
--

LOCK TABLES `chat_chatmessage` WRITE;
/*!40000 ALTER TABLE `chat_chatmessage` DISABLE KEYS */;
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
  PRIMARY KEY (`user_id`),
  KEY `chat_lastactive_6b4dc4c3` (`session_id`),
  CONSTRAINT `user_id_refs_user_ptr_id_f8bc128f` FOREIGN KEY (`user_id`) REFERENCES `adjod_userprofile` (`user_ptr_id`),
  CONSTRAINT `session_id_refs_session_key_e9091ea9` FOREIGN KEY (`session_id`) REFERENCES `django_session` (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_lastactive`
--

LOCK TABLES `chat_lastactive` WRITE;
/*!40000 ALTER TABLE `chat_lastactive` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_lastactive` ENABLE KEYS */;
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
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'user profile','adjod','userprofile'),(9,'exchange rate','adjod','exchangerate'),(10,'base currency','adjod','basecurrency'),(11,'category','advertisement','category'),(12,'sub category','advertisement','subcategory'),(13,'dropdown','advertisement','dropdown'),(14,'city','advertisement','city'),(15,'locality','advertisement','locality'),(16,'premium price info','advertisement','premiumpriceinfo'),(17,'product','advertisement','product'),(18,'free alert','advertisement','freealert'),(19,'transaction','advertisement','transaction'),(20,'worker','worker','worker'),(21,'worker task','worker','workertask'),(22,'user tracking','worker','usertracking'),(23,'worker notice email task','worker','workernoticeemailtask'),(24,'product expired ad tracking','worker','productexpiredadtracking'),(25,'site banner','banner','sitebanner'),(26,'chat message','chat','chatmessage'),(27,'last active','chat','lastactive'),(28,'PayPal IPN','ipn','paypalipn'),(29,'rate source','djmoney_rates','ratesource'),(30,'rate','djmoney_rates','rate');
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
INSERT INTO `django_session` VALUES ('1888773add8bd522f85b81b7682a7e2b','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2016-01-08 11:48:11'),('28daab1aaaa28bdd15cd64a81c4f1697','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2016-01-08 11:48:11'),('e0b7077fda78567f1d9890bb50636044','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2016-01-08 13:53:13');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
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
INSERT INTO `djmoney_rates_rate` VALUES (1,1,'DZD',106.248060),(2,1,'NAD',15.250450),(3,1,'GHS',3.817203),(4,1,'EGP',7.827595),(5,1,'BGN',1.784580),(6,1,'PAB',1.000000),(7,1,'BOB',6.908295),(8,1,'DKK',6.808701),(9,1,'BWP',11.082088),(10,1,'LBP',1508.900000),(11,1,'TZS',2139.628333),(12,1,'VND',22503.016667),(13,1,'AOA',135.286668),(14,1,'KHR',4047.909976),(15,1,'MYR',4.284345),(16,1,'KYD',0.824728),(17,1,'LYD',1.390076),(18,1,'UAH',22.910350),(19,1,'JOD',0.709250),(20,1,'AWG',1.790083),(21,1,'SAR',3.752595),(22,1,'LTL',3.100059),(23,1,'HKD',7.751158),(24,1,'CHF',0.987500),(25,1,'GIP',0.669317),(26,1,'BYR',18338.600000),(27,1,'ALL',125.040200),(28,1,'XPD',0.001787),(29,1,'MRO',305.125667),(30,1,'HRK',6.972848),(31,1,'DJF',177.669374),(32,1,'SZL',15.253140),(33,1,'THB',36.055480),(34,1,'XAF',598.968705),(35,1,'BND',1.405434),(36,1,'ISK',129.415000),(37,1,'UYU',29.744620),(38,1,'NIO',27.851420),(39,1,'LAK',8150.527598),(40,1,'SYP',220.328001),(41,1,'MAD',9.884919),(42,1,'MZN',48.254999),(43,1,'PHP',47.180380),(44,1,'ZAR',15.267875),(45,1,'NPR',105.877400),(46,1,'ZWL',322.387247),(47,1,'NGN',198.969901),(48,1,'CRC',535.895099),(49,1,'AED',3.673160),(50,1,'EEK',14.282875),(51,1,'MWK',647.047504),(52,1,'LKR',143.600699),(53,1,'PKR',104.768800),(54,1,'HUF',288.441899),(55,1,'BMD',1.000000),(56,1,'LSL',15.272050),(57,1,'MNT',1992.333333),(58,1,'AMD',480.177499),(59,1,'UGX',3353.466667),(60,1,'QAR',3.641364),(61,1,'XDR',0.719744),(62,1,'JMD',120.078100),(63,1,'GEL',2.401975),(64,1,'SHP',0.669317),(65,1,'AFN',68.050002),(66,1,'SBD',8.162994),(67,1,'KPW',900.090000),(68,1,'TRY',2.917776),(69,1,'BDT',78.469320),(70,1,'YER',215.107099),(71,1,'HTG',56.554550),(72,1,'XOF',599.131606),(73,1,'MGA',3205.109984),(74,1,'ANG',1.788850),(75,1,'LRD',85.830002),(76,1,'RWF',748.008868),(77,1,'NOK',8.676169),(78,1,'MOP',7.979378),(79,1,'INR',65.990820),(80,1,'MXN',17.249210),(81,1,'CZK',24.657110),(82,1,'TJS',6.921200),(83,1,'BTC',0.002184),(84,1,'BTN',66.145965),(85,1,'COP',3208.686667),(86,1,'TMT',3.501733),(87,1,'MUR',35.958025),(88,1,'IDR',13622.266667),(89,1,'HNL',21.753920),(90,1,'XPF',108.984463),(91,1,'FJD',2.127217),(92,1,'ETB',21.166100),(93,1,'PEN',3.391263),(94,1,'BZD',1.994701),(95,1,'ILS',3.886116),(96,1,'DOP',45.513680),(97,1,'GGP',0.669317),(98,1,'MDL',19.679080),(99,1,'XPT',0.001132),(100,1,'BSD',1.000000),(101,1,'SEK',8.395102),(102,1,'ZMK',5252.024745),(103,1,'JEP',0.669317),(104,1,'AUD',1.374349),(105,1,'SRD',3.947500),(106,1,'CUP',0.999663),(107,1,'CLF',0.024598),(108,1,'BBD',2.000000),(109,1,'KMF',450.126799),(110,1,'KRW',1170.298324),(111,1,'GMD',39.560110),(112,1,'VEF',6.320533),(113,1,'IMP',0.669317),(114,1,'CUC',1.000000),(115,1,'CLP',700.180501),(116,1,'ZMW',10.964763),(117,1,'EUR',0.911792),(118,1,'CDF',928.290500),(119,1,'XCD',2.701020),(120,1,'KZT',326.641187),(121,1,'RUB',70.196313),(122,1,'XAG',0.070257),(123,1,'TTD',6.416611),(124,1,'OMR',0.385115),(125,1,'BRL',3.945196),(126,1,'MMK',1311.067476),(127,1,'PLN',3.867030),(128,1,'PYG',5784.038385),(129,1,'KES',102.345900),(130,1,'SVC',8.739789),(131,1,'MKD',56.223230),(132,1,'GBP',0.669317),(133,1,'AZN',1.558817),(134,1,'TOP',2.240570),(135,1,'MVR',15.320633),(136,1,'VUV',111.666249),(137,1,'GNF',7749.145049),(138,1,'WST',2.563381),(139,1,'IQD',1100.391659),(140,1,'ERN',14.998500),(141,1,'BAM',1.786219),(142,1,'SCR',13.032390),(143,1,'CAD',1.382956),(144,1,'CVE',100.538745),(145,1,'KWD',0.303424),(146,1,'BIF',1560.515000),(147,1,'PGK',2.988700),(148,1,'SOS',621.402253),(149,1,'TWD',32.772790),(150,1,'SGD',1.404885),(151,1,'UZS',2782.775025),(152,1,'STD',22388.600000),(153,1,'IRR',29990.500000),(154,1,'CNY',6.471077),(155,1,'SLL',4205.000000),(156,1,'TND',2.030077),(157,1,'GYD',205.611485),(158,1,'MTL',0.683738),(159,1,'NZD',1.463353),(160,1,'FKP',0.669317),(161,1,'LVL',0.634557),(162,1,'USD',1.000000),(163,1,'KGS',75.867352),(164,1,'ARS',13.154740),(165,1,'RON',4.130800),(166,1,'GTQ',7.615630),(167,1,'RSD',111.073640),(168,1,'BHD',0.377187),(169,1,'JPY',120.222800),(170,1,'SDG',6.156705),(171,1,'XAU',0.000929);
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
INSERT INTO `djmoney_rates_ratesource` VALUES (1,'openexchange.org','2015-12-25 07:26:12','USD');
/*!40000 ALTER TABLE `djmoney_rates_ratesource` ENABLE KEYS */;
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
  `userprofile_id` int(11) NOT NULL,
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
  PRIMARY KEY (`id`),
  KEY `paypal_ipn_1be3128f` (`userprofile_id`),
  KEY `paypal_ipn_7ff10c6f` (`txn_id`),
  CONSTRAINT `userprofile_id_refs_user_ptr_id_a7462c58` FOREIGN KEY (`userprofile_id`) REFERENCES `adjod_userprofile` (`user_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_ipn`
--

LOCK TABLES `paypal_ipn` WRITE;
/*!40000 ALTER TABLE `paypal_ipn` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_ipn` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_productexpiredadtracking`
--

LOCK TABLES `worker_productexpiredadtracking` WRITE;
/*!40000 ALTER TABLE `worker_productexpiredadtracking` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_usertracking`
--

LOCK TABLES `worker_usertracking` WRITE;
/*!40000 ALTER TABLE `worker_usertracking` DISABLE KEYS */;
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
  CONSTRAINT `task_id_refs_id_29546302` FOREIGN KEY (`task_id`) REFERENCES `worker_workertask` (`id`),
  CONSTRAINT `created_alert_id_refs_id_d62c0f6a` FOREIGN KEY (`created_alert_id`) REFERENCES `advertisement_freealert` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_workernoticeemailtask`
--

LOCK TABLES `worker_workernoticeemailtask` WRITE;
/*!40000 ALTER TABLE `worker_workernoticeemailtask` DISABLE KEYS */;
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
  CONSTRAINT `workernoticeemailtask_id_refs_id_8b3e90bb` FOREIGN KEY (`workernoticeemailtask_id`) REFERENCES `worker_workernoticeemailtask` (`id`),
  CONSTRAINT `product_id_refs_id_44eadd15` FOREIGN KEY (`product_id`) REFERENCES `advertisement_product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_workernoticeemailtask_product`
--

LOCK TABLES `worker_workernoticeemailtask_product` WRITE;
/*!40000 ALTER TABLE `worker_workernoticeemailtask_product` DISABLE KEYS */;
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

-- Dump completed on 2015-12-25 19:48:59
