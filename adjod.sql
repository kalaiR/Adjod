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
  `city` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `confirmation_code` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_3eff55ca` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adjod_userprofile`
--

LOCK TABLES `adjod_userprofile` WRITE;
/*!40000 ALTER TABLE `adjod_userprofile` DISABLE KEYS */;
INSERT INTO `adjod_userprofile` VALUES (1,46,'Mumbai','7200300448',''),(3,49,'Mumbai','7200300448',''),(5,53,'Mumbai','7200300448',''),(7,55,'Mumbai','7200300448',''),(8,57,'Mumbai','7200300448',''),(10,59,'Mumbai','7200300448',''),(12,60,'','','wobFvW6bjrbjnPUuh0W5o7QRBIDJh5nUK'),(13,61,'Chennai','7200300448','lU1urINroxRqhVNAuC8JOVpMcEH8HqodD'),(14,62,'Delhi','7200300448','t53YuxT4CRRDXdWJZhWdynvsfzoZcWy9f'),(15,63,'Mumbai','7200300448','lIEkDO6AIz7iI9ExrmCkVEWB0vZBUqqDt'),(16,64,'Mumbai','7200300448','iyC0Bo5cR58yFI5191tbmrOLpZYi7syqq'),(17,65,'Chennai','7200300448','vurLO8gQKZguLLJoVCKr8jXS6mNLHah8y'),(18,66,'Chennai','7200300448','QqPFalOIZvXec5xV61yKhHZ5QDOD3Z3zj');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_city`
--

LOCK TABLES `advertisement_city` WRITE;
/*!40000 ALTER TABLE `advertisement_city` DISABLE KEYS */;
INSERT INTO `advertisement_city` VALUES (1,'Pondicherry'),(2,'Chennai'),(3,'Bangalore');
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
  `alert_user_id` int(11) NOT NULL,
  `alert_category_id` int(11) NOT NULL,
  `alert_subcategory_id` int(11) NOT NULL,
  `alert_brand_id` int(11) NOT NULL,
  `alert_city_id` int(11) NOT NULL,
  `alert_email` varchar(30) NOT NULL,
  `alert_mobile` varchar(30) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_freealert`
--

LOCK TABLES `advertisement_freealert` WRITE;
/*!40000 ALTER TABLE `advertisement_freealert` DISABLE KEYS */;
INSERT INTO `advertisement_freealert` VALUES (1,17,1,2,9,2,'kalaimca.gs@gmail.com','7200300448'),(2,17,2,8,3,2,'kalaimca.gs@gmail.com','7200300448');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_locality`
--

LOCK TABLES `advertisement_locality` WRITE;
/*!40000 ALTER TABLE `advertisement_locality` DISABLE KEYS */;
INSERT INTO `advertisement_locality` VALUES (1,1,'Muthialpet'),(2,1,'Lawspet'),(3,1,'Muthaliarpet'),(4,2,'Adayar'),(5,2,'Paris');
/*!40000 ALTER TABLE `advertisement_locality` ENABLE KEYS */;
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
  `ad_brand_id` int(11) NOT NULL,
  `ad_year` varchar(10) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `locality_id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `you_are` varchar(20) NOT NULL,
  `you_name` varchar(20) DEFAULT NULL,
  `you_email` varchar(30) NOT NULL,
  `you_phone` varchar(12) DEFAULT NULL,
  `created_date` date NOT NULL,
  `modified_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `advertisement_product_1be3128f` (`userprofile_id`),
  KEY `advertisement_product_42dc49bc` (`category_id`),
  KEY `advertisement_product_913b3835` (`subcategory_id`),
  KEY `advertisement_product_c06c66db` (`ad_brand_id`),
  KEY `advertisement_product_586a73b5` (`city_id`),
  KEY `advertisement_product_df6acbd9` (`locality_id`),
  CONSTRAINT `ad_brand_id_refs_id_53d1ee6c` FOREIGN KEY (`ad_brand_id`) REFERENCES `advertisement_dropdown` (`id`),
  CONSTRAINT `category_id_refs_id_d73d417d` FOREIGN KEY (`category_id`) REFERENCES `advertisement_category` (`id`),
  CONSTRAINT `city_id_refs_id_5f1fd95a` FOREIGN KEY (`city_id`) REFERENCES `advertisement_city` (`id`),
  CONSTRAINT `locality_id_refs_id_56128078` FOREIGN KEY (`locality_id`) REFERENCES `advertisement_locality` (`id`),
  CONSTRAINT `subcategory_id_refs_id_fbdf449e` FOREIGN KEY (`subcategory_id`) REFERENCES `advertisement_subcategory` (`id`),
  CONSTRAINT `userprofile_id_refs_id_5e2de78f` FOREIGN KEY (`userprofile_id`) REFERENCES `adjod_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_product`
--

LOCK TABLES `advertisement_product` WRITE;
/*!40000 ALTER TABLE `advertisement_product` DISABLE KEYS */;
INSERT INTO `advertisement_product` VALUES (1,1,2,8,'buy','gsdfg','static/img/photos/Screenshot from 2015-03-11 18:24:53.png','static/img/thumbs/Screenshot_from_2015-03-11_182453_thumbnail_21.png',1,'/static/videos/Funny Cute Baby Video - Talking Twin Babies.mp4','',342,3,'2012',2,5,'asafdasf','individual','kalai','kalai2@gmail.com','7200300448','2015-05-04','2015-05-04'),(2,3,2,8,'sell','fasdfasdf','static/img/photos/girl.jpg,static/img/photos/Screenshot from 2015-03-11 18:24:53.png','static/img/thumbs/girl_thumbnail_29.png,static/img/thumbs/Screenshot_from_2015-03-11_182453_thumbnail_22.png',2,'/static/videos/Funny Cute Baby Video - Talking Twin Babies.mp4','',343,3,'2000',2,5,'afasfd','individual','kk','kalaimca.gs@gmail.com','7200300448','2015-05-04','2015-05-04'),(3,5,1,1,'buy','sdfasdf','static/img/photos/cute-girl-2.png','static/img/thumbs/cute-girl-2_thumbnail_22.png',1,'/static/videos/Funny Cute Baby Video - Talking Twin Babies.mp4','',34342,1,'2012',2,5,'asfasfd','individual','kalai','kalaimca.gs@gmail.com','7200300448','2015-05-04','2015-05-04'),(4,7,1,1,'buy','sdfasdf','static/img/photos/cute-girl-2.png','static/img/thumbs/cute-girl-2_thumbnail_23.png',1,'/static/videos/Funny Cute Baby Video - Talking Twin Babies.mp4','',34342,1,'2012',2,5,'asfasfd','individual','kalai','kalaimca.gs@gmail.com','7200300448','2015-05-04','2015-05-04'),(5,1,1,1,'buy','sdfasdf','static/img/photos/cute-girl-2.png','static/img/thumbs/cute-girl-2_thumbnail_24.png',1,'/static/videos/Funny Cute Baby Video - Talking Twin Babies.mp4','',34342,1,'2012',2,5,'asfasfd','individual','kalai','kalaimca.gs@gmail.com','7200300448','2015-05-04','2015-05-04'),(6,3,1,1,'buy','sdfasdf','static/img/photos/cute-girl-2.png','static/img/thumbs/cute-girl-2_thumbnail_25.png',1,'/static/videos/Funny Cute Baby Video - Talking Twin Babies.mp4','',34342,1,'2012',2,5,'asfasfd','individual','kalai','kalaimca.g1@gmail.com','7200300448','2015-05-04','2015-05-04'),(7,5,1,1,'buy','sdfasdf','static/img/photos/cute-girl-2.png','static/img/thumbs/cute-girl-2_thumbnail_26.png',1,'http://www.youtube.com/watch?v=mnbY2jALfqI','',34342,1,'2012',2,5,'asfasfd','individual','kalai','kalaimca.g1@gmail.com','7200300448','2015-05-04','2015-05-04'),(8,7,1,1,'buy','sdfasdf','static/img/photos/cute-girl-2.png','static/img/thumbs/cute-girl-2_thumbnail_27.png',1,'http://www.youtube.com/watch?v=ljJw5BQTS4M','',34342,1,'2012',2,5,'asfasfd','individual','kalai','kalaimca.g2@gmail.com','7200300448','2015-05-04','2015-05-04'),(9,1,1,2,'buy','sdfasdf','static/img/photos/cute-girl-2.png','static/img/thumbs/cute-girl-2_thumbnail_28.png',1,'http://www.youtube.com/embed/W-Q7RMpINVo\"','',34342,9,'2012',2,5,'asfasfd','individual','kalai','kalaimca.g2@gmail.com','7200300448','2015-05-04','2015-05-04'),(10,3,2,8,'buy','nokia mobile','static/img/photos/Screenshot from 2015-03-11 18:24:53.png','static/img/thumbs/Screenshot_from_2015-03-11_182453_thumbnail_23.png',1,'http://www.youtube.com/embed/XGSy3_Czz8k','',342,3,'2012',2,5,'adfasdf','individual','kalai','asdfasd@gmail.com','7200300448','2015-05-04','2015-05-04');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisement_subcategory`
--

LOCK TABLES `advertisement_subcategory` WRITE;
/*!40000 ALTER TABLE `advertisement_subcategory` DISABLE KEYS */;
INSERT INTO `advertisement_subcategory` VALUES (1,1,'Cars'),(2,1,'Motorcycles'),(3,1,'Scooters'),(4,1,'Spare Parts - Accessories'),(5,1,'Bicycles'),(6,1,'Buses - Trucks - Commercial Vehicles'),(7,1,'Construction Vehicles'),(8,2,'Mobile Phones'),(9,2,'Mobiles & Tablets'),(10,2,'Accessories');
/*!40000 ALTER TABLE `advertisement_subcategory` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=265 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add user profile',8,'add_userprofile'),(23,'Can change user profile',8,'change_userprofile'),(24,'Can delete user profile',8,'delete_userprofile'),(25,'Can add category',9,'add_category'),(26,'Can change category',9,'change_category'),(27,'Can delete category',9,'delete_category'),(28,'Can add sub category',10,'add_subcategory'),(29,'Can change sub category',10,'change_subcategory'),(30,'Can delete sub category',10,'delete_subcategory'),(34,'Can add product',12,'add_product'),(35,'Can change product',12,'change_product'),(36,'Can delete product',12,'delete_product'),(58,'Can add city',20,'add_city'),(59,'Can change city',20,'change_city'),(60,'Can delete city',20,'delete_city'),(61,'Can add locality',21,'add_locality'),(62,'Can change locality',21,'change_locality'),(63,'Can delete locality',21,'delete_locality'),(139,'Can add source',47,'add_source'),(140,'Can change source',47,'change_source'),(141,'Can delete source',47,'delete_source'),(142,'Can add thumbnail',48,'add_thumbnail'),(143,'Can change thumbnail',48,'change_thumbnail'),(144,'Can delete thumbnail',48,'delete_thumbnail'),(145,'Can add thumbnail dimensions',49,'add_thumbnaildimensions'),(146,'Can change thumbnail dimensions',49,'change_thumbnaildimensions'),(147,'Can delete thumbnail dimensions',49,'delete_thumbnaildimensions'),(148,'Can add send sms',50,'add_sendsms'),(149,'Can change send sms',50,'change_sendsms'),(150,'Can delete send sms',50,'delete_sendsms'),(151,'Can add my metadata (Path)',51,'add_mymetadatapath'),(152,'Can change my metadata (Path)',51,'change_mymetadatapath'),(153,'Can delete my metadata (Path)',51,'delete_mymetadatapath'),(154,'Can add my metadata (Model Instance)',52,'add_mymetadatamodelinstance'),(155,'Can change my metadata (Model Instance)',52,'change_mymetadatamodelinstance'),(156,'Can delete my metadata (Model Instance)',52,'delete_mymetadatamodelinstance'),(157,'Can add my metadata (Model)',53,'add_mymetadatamodel'),(158,'Can change my metadata (Model)',53,'change_mymetadatamodel'),(159,'Can delete my metadata (Model)',53,'delete_mymetadatamodel'),(160,'Can add my metadata (View)',54,'add_mymetadataview'),(161,'Can change my metadata (View)',54,'change_mymetadataview'),(162,'Can delete my metadata (View)',54,'delete_mymetadataview'),(163,'Can add PayPal IPN',55,'add_paypalipn'),(164,'Can change PayPal IPN',55,'change_paypalipn'),(165,'Can delete PayPal IPN',55,'delete_paypalipn'),(187,'Can add cat',63,'add_cat'),(188,'Can change cat',63,'change_cat'),(189,'Can delete cat',63,'delete_cat'),(190,'Can add sub cat',64,'add_subcat'),(191,'Can change sub cat',64,'change_subcat'),(192,'Can delete sub cat',64,'delete_subcat'),(196,'Can add dropdown',66,'add_dropdown'),(197,'Can change dropdown',66,'change_dropdown'),(198,'Can delete dropdown',66,'delete_dropdown'),(202,'Can add message',68,'add_message'),(203,'Can change message',68,'change_message'),(204,'Can delete message',68,'delete_message'),(205,'Can add action',69,'add_action'),(206,'Can change action',69,'change_action'),(207,'Can delete action',69,'delete_action'),(208,'Can add client',70,'add_client'),(209,'Can change client',70,'change_client'),(210,'Can delete client',70,'delete_client'),(214,'Can add dropdown',72,'add_dropdown'),(215,'Can change dropdown',72,'change_dropdown'),(216,'Can delete dropdown',72,'delete_dropdown'),(217,'Can add free alert',73,'add_freealert'),(218,'Can change free alert',73,'change_freealert'),(219,'Can delete free alert',73,'delete_freealert'),(223,'Can add section',75,'add_section'),(224,'Can change section',75,'change_section'),(225,'Can delete section',75,'delete_section'),(226,'Can add size',76,'add_size'),(227,'Can change size',76,'change_size'),(228,'Can delete size',76,'delete_size'),(229,'Can add placement',77,'add_placement'),(230,'Can change placement',77,'change_placement'),(231,'Can delete placement',77,'delete_placement'),(232,'Can add Client',78,'add_client'),(233,'Can change Client',78,'change_client'),(234,'Can delete Client',78,'delete_client'),(235,'Can add Campaign',79,'add_campaign'),(236,'Can change Campaign',79,'change_campaign'),(237,'Can delete Campaign',79,'delete_campaign'),(238,'Can add Attribute',80,'add_attribute'),(239,'Can change Attribute',80,'change_attribute'),(240,'Can delete Attribute',80,'delete_attribute'),(241,'Can add Dimension',81,'add_dimension'),(242,'Can change Dimension',81,'change_dimension'),(243,'Can delete Dimension',81,'delete_dimension'),(244,'Can add Banner',82,'add_banner'),(245,'Can change Banner',82,'change_banner'),(246,'Can delete Banner',82,'delete_banner'),(247,'Can add Version',83,'add_version'),(248,'Can change Version',83,'change_version'),(249,'Can delete Version',83,'delete_version'),(250,'Can add worker',84,'add_worker'),(251,'Can change worker',84,'change_worker'),(252,'Can delete worker',84,'delete_worker'),(253,'Can add worker task',85,'add_workertask'),(254,'Can change worker task',85,'change_workertask'),(255,'Can delete worker task',85,'delete_workertask'),(259,'Can add user tracking',87,'add_usertracking'),(260,'Can change user tracking',87,'change_usertracking'),(261,'Can delete user tracking',87,'delete_usertracking'),(262,'Can add site banner',88,'add_sitebanner'),(263,'Can change site banner',88,'change_sitebanner'),(264,'Can delete site banner',88,'delete_sitebanner');
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'kalai','','','kalai@gmail.com','pbkdf2_sha256$10000$vJlJLq7EQf0X$Z8E134QO8CHvzjCH/WmnhmBccwWgSj6uT7lawBbrfPQ=',1,1,1,'2015-05-22 05:44:22','2015-01-07 04:38:20'),(25,'geetha','','','kalaimca.gs@gmail.com','pbkdf2_sha256$10000$iMrYrVMD4LAO$0iWE5vxQawCJZAM7sewS3NIgdtofXzPCJWuQQ9/AFYM=',0,1,0,'2015-04-13 07:28:06','2015-02-07 09:13:02'),(41,'kalai1','','','kalaimca.gs@gmail.com','pbkdf2_sha256$10000$aZI2a9kQUaeT$VcD1iMHeCaX8vSD//vN3esKU2Ft4lFzCeS/72B2Kuck=',0,1,0,'2015-03-03 09:42:01','2015-02-07 10:31:01'),(42,'kalai2','','','kalaimca.gs@gmail.com','pbkdf2_sha256$10000$qZjWGpx07j2u$fBWo+9U1OZcoqM8KUsN+MbUf0jIVNbkB7qwHNEVZJIM=',0,1,0,'2015-02-20 05:52:54','2015-02-09 06:24:59'),(43,'kalai8','','','kalaimca.gs@gmail.com','pbkdf2_sha256$10000$qcqQEMI2zT3i$VqteSpzm0gvbin7yQrFz8T3urFxjeLErdi2hlFz5AbM=',0,1,0,'2015-02-16 04:45:47','2015-02-16 04:45:11'),(44,'kalai4','','','admin@gmail.com','pbkdf2_sha256$10000$aR5yQuMR6B3u$NkdT7EALpu0sySOPUX51fxWs3unjWNtZYlEOk1z33Hc=',1,1,1,'2015-04-13 07:26:46','2015-02-26 04:21:59'),(45,'kalai5','','','kalaimca.gs@gmail.com','pbkdf2_sha256$10000$5zr6ktv6PfhJ$Sujs6ArGOSb8Gc+r1h06ASPrCoGQ6S3uD8E3dPQSXN8=',0,1,0,'2015-03-06 06:31:49','2015-03-06 06:28:36'),(46,'kalai6','','','kalai@gmail.com','kalai',0,0,0,'2015-04-15 09:49:29','2015-04-15 09:49:29'),(49,'kalai7','','','kalai@gmail.com','kalai',0,0,0,'2015-04-15 09:51:02','2015-04-15 09:51:02'),(53,'kalai1@gmail.com','','','kalai1@gmail.com','kalai',0,0,0,'2015-04-15 09:56:39','2015-04-15 09:56:39'),(55,'kalai2@gmail.com','','','kalai2@gmail.com','kalai',0,0,0,'2015-04-15 09:58:26','2015-04-15 09:58:26'),(57,'kalai3@gmail.com','','','kalai3@gmail.com','kalai3',0,0,0,'2015-04-15 09:58:59','2015-04-15 09:58:59'),(59,'kalai4@gmail.com','','','kalai4@gmail.com','kalai',0,0,0,'2015-04-15 10:01:26','2015-04-15 10:01:26'),(60,'kalai5@gmail.com','','','kalai5@gmail.com','kalai',0,0,0,'2015-04-15 10:02:01','2015-04-15 10:02:01'),(61,'kalai6@gmail.com','','','kalai6@gmail.com','kalai',0,0,0,'2015-04-15 10:04:50','2015-04-15 10:04:50'),(62,'kalai7@gmail.com','','','kalai7@gmail.com','kalai',0,0,0,'2015-04-15 10:29:41','2015-04-15 10:29:41'),(63,'kalai8@gmail.com','','','kalai8@gmail.com','kalai',0,0,0,'2015-04-15 10:31:08','2015-04-15 10:31:08'),(64,'kalai9@gmail.com','','','kalai9@gmail.com','pbkdf2_sha256$10000$hb9gaoB43Vn9$D/LDcal/OFzpHnx/2PupksBtTvzdJ4Y8T0seFSYfNEY=',0,0,0,'2015-04-15 10:52:10','2015-04-15 10:52:10'),(65,'kalaimca.gs@gmail.com','','','kalaimca.gs@gmail.com','pbkdf2_sha256$10000$4gAGw7lHWGfq$GegkWLO7Ien5kMiw8x8i4yWqjOSWL9ovrO6A3l6KMmo=',0,1,0,'2015-05-22 06:07:51','2015-04-15 10:53:26'),(66,'vanimca92@gmail.com','','','vanimca92@gmail.com','pbkdf2_sha256$10000$Ruu9i3zE5ib9$nksjG3WxCyKzyYNP5ZfeFIn3TB7qqXiOeqC4suO1CIg=',0,0,0,'2015-04-21 11:58:57','2015-04-21 11:58:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_sitebanner`
--

LOCK TABLES `banner_sitebanner` WRITE;
/*!40000 ALTER TABLE `banner_sitebanner` DISABLE KEYS */;
INSERT INTO `banner_sitebanner` VALUES (1,'static/banners/background_1.png','http://www.google.com','/','bottom'),(2,'static/banners/banner_bg_3.png','http://www.gmail.com','/','bottom');
/*!40000 ALTER TABLE `banner_sitebanner` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (2,'2015-01-08 06:09:07',1,12,'1','sadfasdf',1,''),(8,'2015-01-08 06:48:48',1,12,'1','1asdfasd',1,''),(9,'2015-01-08 06:49:13',1,12,'2','asdf',1,''),(10,'2015-01-08 06:50:05',1,12,'3','dsfasdf',1,''),(11,'2015-01-08 09:36:10',1,10,'7','Laptops',3,''),(12,'2015-01-08 09:36:10',1,10,'6','Computers',3,''),(13,'2015-01-08 09:36:10',1,10,'5','Electronics',3,''),(14,'2015-01-08 09:36:10',1,10,'4','Tablets',3,''),(15,'2015-01-08 09:36:10',1,10,'2','Mobiles',3,''),(16,'2015-01-08 09:36:10',1,10,'1','Cars',3,''),(17,'2015-01-08 09:36:27',1,10,'3','Bikes',3,''),(18,'2015-01-08 09:36:53',1,9,'3','Electronics & Appliances',2,'Changed name.'),(19,'2015-01-08 09:37:15',1,9,'4','Real Estate',1,''),(20,'2015-01-08 09:37:35',1,9,'5','Home & Lifestyle',1,''),(21,'2015-01-08 09:37:50',1,9,'6','Entertainment',1,''),(22,'2015-01-08 09:38:08',1,9,'7','Pets & Pet Care',1,''),(23,'2015-01-08 09:38:22',1,10,'8','Cars',1,''),(24,'2015-01-08 09:38:43',1,10,'9','Motorcycles',1,''),(25,'2015-01-08 09:39:18',1,10,'10','Scooters',1,''),(26,'2015-01-08 09:39:30',1,10,'11','Bicycles',1,''),(27,'2015-01-08 09:39:45',1,10,'12','Spare Parts - Accessories',1,''),(28,'2015-01-08 09:40:03',1,10,'13','Buses - Trucks - Commercial Vehicles',1,''),(29,'2015-01-08 09:42:18',1,10,'14','Construction Vehicles',1,''),(30,'2015-01-08 09:42:34',1,10,'15','Other Vehicles',1,''),(31,'2015-01-08 09:42:49',1,10,'16','Mobile Phones',1,''),(32,'2015-01-08 09:43:05',1,10,'17','Tablets',1,''),(33,'2015-01-08 09:43:24',1,10,'18','Accessories',1,''),(34,'2015-01-08 13:08:21',1,12,'2','asdfasdf',1,''),(35,'2015-01-09 05:48:53',1,12,'1','sadfasd',1,''),(36,'2015-01-09 05:55:11',1,12,'2','safdasdf',1,''),(37,'2015-01-09 07:04:21',1,12,'2','safdasdf',2,'No fields changed.'),(39,'2015-01-09 07:06:48',1,12,'1','asdfasdf',1,''),(40,'2015-01-09 07:07:40',1,12,'2','asdfasdf',1,''),(42,'2015-01-09 07:10:00',1,12,'3','sdfgsdf',1,''),(44,'2015-01-09 12:48:08',1,12,'9','asdfasdf',1,''),(46,'2015-01-09 12:50:16',1,12,'10','asdfasdf',1,''),(48,'2015-01-09 12:50:54',1,12,'11','asfasdf',1,''),(50,'2015-01-09 12:51:39',1,12,'12','asfasdf',1,''),(52,'2015-01-09 12:53:38',1,12,'13','asdfasdf',1,''),(54,'2015-01-09 12:54:37',1,12,'14','asfdasdf',1,''),(56,'2015-01-09 12:56:06',1,12,'15','asfasdf',1,''),(58,'2015-01-09 12:57:03',1,12,'16','safasdf',1,''),(69,'2015-02-06 05:03:01',1,12,'32','bicycle',1,''),(71,'2015-02-06 05:19:18',1,12,'33','mobiles',1,''),(73,'2015-02-06 05:21:13',1,12,'34','mobiles',1,''),(75,'2015-02-06 05:56:51',1,12,'35','mobiles',1,''),(77,'2015-02-07 04:37:50',1,12,'46','cars',1,''),(79,'2015-02-07 04:40:30',1,12,'47','bikes',1,''),(80,'2015-02-19 06:25:35',1,54,'1','',1,''),(81,'2015-02-19 06:26:28',1,51,'1','kalai',1,''),(82,'2015-02-19 07:05:18',1,51,'2','/elasticsearch/',1,''),(83,'2015-02-19 12:21:43',1,6,'2','localhost',1,''),(84,'2015-02-19 12:23:00',1,51,'1','/elasticsearch/',1,''),(85,'2015-02-19 12:24:45',1,54,'1','post_ad',1,''),(87,'2015-02-19 12:27:13',1,12,'5','car',1,''),(88,'2015-02-19 12:30:53',1,51,'2','/postad/',1,''),(90,'2015-02-19 12:32:16',1,12,'6','bike',1,''),(91,'2015-02-19 12:36:51',1,53,'1','cars',1,''),(93,'2015-02-19 12:37:44',1,12,'7','cars',1,''),(95,'2015-02-19 12:48:30',1,12,'8','mobiles',1,''),(97,'2015-02-26 04:23:34',44,12,'9','mobilee',1,''),(98,'2015-02-26 04:24:12',44,12,'10','car1',1,''),(99,'2015-02-26 05:03:14',44,9,'1','Cars & Bikes',1,''),(100,'2015-02-26 05:03:41',44,9,'2','Mobiles & Tablets',1,''),(101,'2015-02-26 05:04:10',44,9,'3','Electronic & Appliance',1,''),(102,'2015-02-26 05:04:32',44,9,'4','Real estate',1,''),(103,'2015-02-26 05:04:55',44,9,'5','Jobs',1,''),(104,'2015-02-26 05:05:19',44,9,'6','Home & Lifestyle',1,''),(105,'2015-02-26 05:05:46',44,9,'7','Services',1,''),(106,'2015-02-26 05:06:29',44,9,'8','Education & Learning',1,''),(107,'2015-02-26 05:06:52',44,9,'9','Pets & Pet care',1,''),(108,'2015-02-26 05:07:08',44,9,'10','Entertainment',1,''),(109,'2015-02-26 05:07:56',44,9,'11','Community & Events',1,''),(110,'2015-02-26 05:08:17',44,9,'12','Matrimonial',1,''),(111,'2015-02-26 05:09:38',44,10,'1','Cars',1,''),(112,'2015-02-26 05:09:47',44,10,'2','Motorcycles',1,''),(113,'2015-02-26 05:09:57',44,10,'3','Scooters',1,''),(114,'2015-02-26 05:10:07',44,10,'4','Spare Parts - Accessories',1,''),(115,'2015-02-26 05:10:18',44,10,'5','Bicycles',1,''),(116,'2015-02-26 05:10:27',44,10,'6','Buses - Trucks - Commercial Vehicles',1,''),(117,'2015-02-26 05:10:40',44,10,'7','Construction Vehicles',1,''),(118,'2015-02-26 05:10:51',44,10,'8','Mobile Phones',1,''),(119,'2015-02-26 05:10:59',44,10,'9','Accessories',1,''),(120,'2015-02-26 05:11:13',44,10,'10','Tablets',1,''),(121,'2015-02-26 06:09:50',44,9,'1','Cars & Bikes',1,''),(122,'2015-02-26 06:10:06',44,9,'2','Mobiles & Tablets',1,''),(123,'2015-02-26 06:10:44',44,10,'1','Cars',1,''),(124,'2015-02-26 06:10:50',44,10,'2','Motorcycles',1,''),(125,'2015-02-26 06:27:28',44,9,'3','Electronics & Appliances',1,''),(126,'2015-02-26 06:29:55',44,9,'4','Real estate',1,''),(127,'2015-02-26 06:37:13',44,9,'1','Cars & Bikes',1,''),(128,'2015-02-26 06:37:40',44,10,'1','Cars',1,''),(129,'2015-02-26 06:38:09',44,9,'1','Cars & Bikes',2,'Changed category_type.'),(130,'2015-02-28 11:10:32',44,10,'2','Motorcycles',1,''),(131,'2015-02-28 11:11:44',44,10,'3','Scooters',1,''),(132,'2015-02-28 11:11:56',44,10,'4','Spare Parts - Accessories',1,''),(133,'2015-02-28 11:12:14',44,10,'5','Bicycles',1,''),(134,'2015-02-28 11:12:26',44,10,'6','Buses - Trucks - Commercial Vehicles',1,''),(135,'2015-02-28 11:12:42',44,10,'7','Construction Vehicles',1,''),(136,'2015-02-28 11:13:00',44,10,'8','Mobile Phones',1,''),(137,'2015-02-28 11:13:13',44,10,'9','Mobiles & Tablets',1,''),(138,'2015-02-28 11:13:21',44,10,'10','Accessories',1,''),(140,'2015-02-28 11:23:08',44,12,'15','iphone mobile',1,''),(144,'2015-03-10 11:22:11',44,63,'2','Cars & Bikes',1,''),(145,'2015-03-10 11:22:31',44,63,'3','Mobiles & Tablets',1,''),(146,'2015-03-10 11:23:08',44,64,'1','Cars',1,''),(147,'2015-03-10 11:23:16',44,64,'2','Motorcycles',1,''),(148,'2015-03-10 11:23:23',44,64,'3','Mobile Phones',1,''),(149,'2015-03-10 11:24:13',44,66,'1','Dropdown object',1,''),(150,'2015-03-10 11:26:32',44,66,'2','Dropdown object',1,''),(151,'2015-03-10 12:08:00',44,66,'3','Dropdown object',1,''),(152,'2015-03-10 12:26:55',44,66,'4','Dropdown object',1,''),(153,'2015-03-10 12:28:30',44,66,'5','Dropdown object',1,''),(154,'2015-03-11 04:07:06',44,66,'6','Dropdown object',1,''),(155,'2015-03-11 04:30:17',44,66,'10','Apple',1,''),(156,'2015-03-11 04:30:52',44,66,'11','',1,''),(157,'2015-03-11 04:37:49',44,66,'12','Blackberry',1,''),(158,'2015-03-11 04:38:03',44,66,'13','',1,''),(159,'2015-03-11 04:39:02',44,66,'14','Micromax',1,''),(160,'2015-03-11 04:39:22',44,66,'15','',1,''),(161,'2015-03-11 05:23:58',44,66,'16','',1,''),(162,'2015-03-11 05:24:08',44,66,'17','',1,''),(163,'2015-03-11 05:25:09',44,66,'18','',1,''),(164,'2015-03-11 05:26:00',44,66,'19','',1,''),(282,'2015-04-13 06:00:44',44,69,'productlist-list','Absent list',3,''),(283,'2015-04-13 06:01:19',44,69,'productlist-list','Product list',1,''),(284,'2015-04-13 06:06:41',44,70,'1','test-geetha',2,'Changed actions.'),(285,'2015-04-13 07:27:17',44,69,'productlist-list','Product list',2,'Changed action_path.'),(303,'2015-04-21 07:36:43',1,72,'1','Tata',1,''),(304,'2015-04-21 07:36:53',1,72,'2','Nokia',1,''),(305,'2015-04-21 07:37:10',1,72,'3','Micromax',1,''),(306,'2015-04-21 07:37:25',1,72,'4','Maruti Suzuki',1,''),(307,'2015-04-21 07:37:35',1,72,'5','Mahindra',1,''),(308,'2015-04-21 07:37:44',1,72,'6','Kinetic Motors',1,''),(309,'2015-04-21 07:37:52',1,72,'7','Hyundai',1,''),(310,'2015-04-21 07:38:06',1,72,'8','Honda',1,''),(311,'2015-04-21 07:38:20',1,72,'9','Hero Honda',1,''),(312,'2015-04-21 07:38:29',1,72,'10','Hero',1,''),(313,'2015-04-21 07:39:04',1,72,'11','HCL',1,''),(314,'2015-05-04 07:36:24',1,73,'1','nokia mobile',1,''),(318,'2015-05-05 11:03:39',1,78,'1','banner1',1,''),(319,'2015-05-05 11:03:54',1,79,'1','banner1',1,''),(320,'2015-05-05 11:04:11',1,81,'1','500x200',1,''),(321,'2015-05-05 11:04:27',1,80,'1','banner1',1,''),(322,'2015-05-05 11:04:54',1,82,'1','500x200 - banner1',1,''),(330,'2015-05-21 04:49:48',1,84,'freealert_notice_email','freealert_notice_email',1,''),(331,'2015-05-21 04:54:34',1,84,'freealert_notice_email','freealert_notice_email',1,''),(332,'2015-05-21 10:28:24',1,73,'2','kalaimca.gs@gmail.com',1,''),(333,'2015-05-22 05:06:07',1,88,'1','http://www.google.com',1,''),(334,'2015-05-22 05:06:38',1,88,'2','http://www.gmail.com',1,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'user profile','adjod','userprofile'),(9,'category','advertisement','category'),(10,'sub category','advertisement','subcategory'),(12,'product','advertisement','product'),(20,'city','advertisement','city'),(21,'locality','advertisement','locality'),(47,'source','easy_thumbnails','source'),(48,'thumbnail','easy_thumbnails','thumbnail'),(49,'thumbnail dimensions','easy_thumbnails','thumbnaildimensions'),(50,'send sms','communication','sendsms'),(51,'my metadata (Path)','seo','mymetadatapath'),(52,'my metadata (Model Instance)','seo','mymetadatamodelinstance'),(53,'my metadata (Model)','seo','mymetadatamodel'),(54,'my metadata (View)','seo','mymetadataview'),(55,'PayPal IPN','ipn','paypalipn'),(63,'cat','sample','cat'),(64,'sub cat','sample','subcat'),(66,'dropdown','sample','dropdown'),(68,'message','services','message'),(69,'action','fxapi','action'),(70,'client','fxapi','client'),(72,'dropdown','advertisement','dropdown'),(73,'free alert','advertisement','freealert'),(75,'section','adcode','section'),(76,'size','adcode','size'),(77,'placement','adcode','placement'),(78,'Client','adworks','client'),(79,'Campaign','adworks','campaign'),(80,'Attribute','adworks','attribute'),(81,'Dimension','adworks','dimension'),(82,'Banner','adworks','banner'),(83,'Version','adworks','version'),(84,'worker','worker','worker'),(85,'worker task','worker','workertask'),(87,'user tracking','worker','usertracking'),(88,'site banner','banner','sitebanner');
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
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('00330f4212260f305814fc6260bf9b0f','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:42'),('0275b551c7dfb97e50cc2a92ca2bfaac','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-05-08 09:54:30'),('037413b776334cac6e4d2f977aeebf46','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-03-10 09:37:49'),('03f2dde09be3dad8b92ff292901a9dcc','NzU2OGRjNTlhNGQyNjgyNjcwZTYwZTQ3YWM2NDVkYzZmNWVkN2M3ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKASx1Lg==\n','2015-03-25 04:05:28'),('04c5d8ef13cdae338d214d17d591bc66','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:38'),('079cd3f2d6fffb09d7f914371224e1ea','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:46'),('08de3bc0dd84912a77fc29297875ac16','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-17 09:51:23'),('0d9fadb2b348ef8b7e0a388ff6c1784e','MzdlNWE5NmYwMjkzZWY3OGY0YTk4N2IwMGIzNzNlODJkYjI0ZDZkYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2015-05-06 10:15:10'),('0dda0221f2980fee3f60d8e098d9f655','MzdlNWE5NmYwMjkzZWY3OGY0YTk4N2IwMGIzNzNlODJkYjI0ZDZkYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2015-05-21 13:03:30'),('0f2b1acea5da50d10bdd4cf23710489f','NzU2OGRjNTlhNGQyNjgyNjcwZTYwZTQ3YWM2NDVkYzZmNWVkN2M3ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKASx1Lg==\n','2015-04-15 12:06:07'),('0fb17ec42afaf03853df331134a58926','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-03-20 07:14:23'),('10ae000649bf3fa1ebee4690c79e1694','NzU2OGRjNTlhNGQyNjgyNjcwZTYwZTQ3YWM2NDVkYzZmNWVkN2M3ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKASx1Lg==\n','2015-03-24 06:04:23'),('13429830b90dd5cdfa74560b92b70c35','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:42'),('13a9e5c128296fb2494ec0cafe7dc83d','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:45'),('180e01a153d9c03fdb3297ba1612bd9d','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:46'),('1842286b5ef8eacf147905d08a796fde','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:43'),('1a46b1d4d4598674d2ee21b96b751ea3','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:44'),('1b8f20493c0feff9f79a7f5bbc9e8d32','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-06 04:11:02'),('1d49be4a5bbf7a10b1f02b7b6797dd90','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:49:59'),('1d7cc94c5e0a47ce85c9d0e4856fdb6b','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-29 05:51:21'),('20b0af49e789c05bef39a311ee3df2f8','OWI0ZDZhNGQxNjlmOTQ1MjI2MGVkMDg3NGM3NDQ4ZGMyMTM5ODFjMDqAAn1xAVUPZGphbmdvX2xh\nbmd1YWdlcQJYAgAAAGVucQNzLg==\n','2015-05-11 05:03:31'),('20bf418300773812b8d4ac8e29114ff9','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:43'),('20f58a0a4334cf8bb8b1924d7e76c3f0','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-05-13 09:00:59'),('22844d0cbdaa39a687ffeb49cb023180','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:46'),('23675a7a889b9bea9d66fbf919264ff1','ZGQ4MWViZDQwZTJiMTE1MTY0MTFiMDJiN2M2ZDI5NGI4NzBhNGRjODqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2015-04-25 04:41:41'),('23839e6055d693c84230211d10ffa389','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-03 13:06:49'),('23bd1def3c6378c92c037daf27c8bbb0','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:41'),('24ef41c079c915331b48d04501b83d67','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:45'),('2680aa23368e993b84ade33a36ec7ff3','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-29 07:34:29'),('2ccb88057347a8896ae8b2c6a4bdef34','NDYzOTk0OGU1MTc3MmE4ZWI2Y2M5ZmJmYjI4ZjU4MzQ1NGEwMWRhMDqAAn1xAVUPZGphbmdvX2xh\nbmd1YWdlWAIAAABlbnECcy4=\n','2015-05-13 06:27:50'),('2dd59cef6577351a8feae7a54b0fd838','NzU2OGRjNTlhNGQyNjgyNjcwZTYwZTQ3YWM2NDVkYzZmNWVkN2M3ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKASx1Lg==\n','2015-03-25 04:12:43'),('2e4bdcfa4c7d6420a77b23895f1f37e5','NTgzZjNmOWUwYzMwZWI4NmI3ZTY1OGNlYzM5ZTQ5YTgzYzRlNWY0MjqAAn1xAVUPZGphbmdvX2xh\nbmd1YWdlWAIAAABzdnECcy4=\n','2015-05-08 13:33:45'),('2fb19ac304ef5ce36ec318c7446602f0','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:44'),('307ae440f48509af113bd601fb78770e','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:46'),('3104b09b221f7626482504d1517e3e38','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-15 04:41:48'),('331031264726f005825b97d7091e4f89','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:38'),('34ee9b9ed81d696e89cc8eb3ddba6676','YTZjZTE4NTJjNzM3MDI3OWRjYjA3YjBlMDYzMDU4YTA2MDRhNmFmZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxAlUN\nX2F1dGhfdXNlcl9pZIoBAXUu\n','2015-02-21 06:03:37'),('366f806bc5665b83112c8d123855ed44','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-01 08:49:05'),('3ab69c56ec171cd1ee257ed11df6b108','YTZjZTE4NTJjNzM3MDI3OWRjYjA3YjBlMDYzMDU4YTA2MDRhNmFmZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxAlUN\nX2F1dGhfdXNlcl9pZIoBAXUu\n','2015-02-03 04:44:36'),('3b3d6eb86febecf5e278bee9c45dbae9','NDYzOTk0OGU1MTc3MmE4ZWI2Y2M5ZmJmYjI4ZjU4MzQ1NGEwMWRhMDqAAn1xAVUPZGphbmdvX2xh\nbmd1YWdlWAIAAABlbnECcy4=\n','2015-06-02 06:56:58'),('3cb3871d1898ce2b4fa5652e03276b72','ZGQ4MWViZDQwZTJiMTE1MTY0MTFiMDJiN2M2ZDI5NGI4NzBhNGRjODqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2015-03-17 10:09:46'),('3ebe89901a64a68a02804a6689f7f94f','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 10:48:56'),('3f81c09d1b4f15aea9218799920289fd','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-05-06 05:08:23'),('41640247f77ecafc3e2a323047be1f98','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:46'),('44b620acacf1eac59380339c5e752321','NjQ4M2Q5ZGM3YjMzYzE1MWNiZDVlZGVkZjhjYzBkZGQzN2QzYmNkMzqAAn1xAShVDV9hdXRoX3Vz\nZXJfaWSKAQFVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxAnUu\n','2015-02-25 12:29:27'),('47e0fc4e27919420805f5221aae45d21','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:40'),('4809756726f60e860271b2599d2df601','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:40'),('4a4f87d2e29b1cdfcf7bbfe8726dbe28','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:42'),('4b22560d75a3de7eaf9222b4f0818083','NTgzZjNmOWUwYzMwZWI4NmI3ZTY1OGNlYzM5ZTQ5YTgzYzRlNWY0MjqAAn1xAVUPZGphbmdvX2xh\nbmd1YWdlWAIAAABzdnECcy4=\n','2015-05-08 12:32:41'),('4bb2206a2a34e64b7f739e3dfa90f09e','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:46'),('4d6a64c86b110d89c92d6eba2d6a042a','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-05-01 14:50:04'),('4d77e0b9ae902f4254e5332e36968a75','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-05-13 10:56:42'),('4dc014dee57303e9f782700efc4129af','NTgzZjNmOWUwYzMwZWI4NmI3ZTY1OGNlYzM5ZTQ5YTgzYzRlNWY0MjqAAn1xAVUPZGphbmdvX2xh\nbmd1YWdlWAIAAABzdnECcy4=\n','2015-05-09 10:33:46'),('4df97b62aa69fece53ddc2bf127cf7c3','NDBlZWZhZjY0ZjM2MDYxZjhmMTYxOTFiNmI2YzFjZGZjYTVmZmViNTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ9kamFuZ29fbGFuZ3VhZ2VYAgAAAGVuVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-06-05 06:07:51'),('502b55fcb0a71b450d12a93918b4c814','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-28 12:00:21'),('511165fabd1a4a367f3f7cb9ada0aa2d','NzU2OGRjNTlhNGQyNjgyNjcwZTYwZTQ3YWM2NDVkYzZmNWVkN2M3ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKASx1Lg==\n','2015-04-11 14:20:20'),('51fc41df0f236aa2d352e19ed7c30a5e','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:38'),('52bbdc46443bd50b9ddf2a70c1d8504f','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-04 10:15:14'),('56724894ccf031b009698c34aecd560d','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-05-13 09:22:15'),('567f0db2f4e5feb23350e607d240e744','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-05-05 11:58:27'),('57d2aa9fb5317fe658da9d1e8ecdde10','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-28 13:06:01'),('5a4d3d1666cc368f7368c5694bec9bc5','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-03-24 04:34:18'),('5dae220b8ebde17abad4b9e8f36b61ed','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:44'),('5fa9b015ee384b21e09042f5130b3eb8','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-05-08 04:52:59'),('61348d07ee295c52ab0d10a7bccdfa01','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-17 06:18:34'),('6215bd4e4326387288213bde5adbe483','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:39'),('6293bd5f39d064d038c0b37dd838e9f9','YTZjZTE4NTJjNzM3MDI3OWRjYjA3YjBlMDYzMDU4YTA2MDRhNmFmZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxAlUN\nX2F1dGhfdXNlcl9pZIoBAXUu\n','2015-01-22 13:18:48'),('66b25f2e0043753c0a647dc9ae6eac1e','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-03-09 06:03:22'),('66be7b10b864fc6e21b4d3242e3ec91b','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:45'),('66d9bd4feaa2fa600c237be9a44f468a','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-05-13 07:27:10'),('66ec7d1476ff57961e5b1757c1fabb0b','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-23 05:26:02'),('68083c04f33dfd6644745635d001f49a','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:45'),('688e88afedf038f2192f087dc04a7aee','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:39'),('6af19f66c9078d34f88fe69d3abe4c3b','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-05-07 09:15:37'),('6b0a696567e8f63a793d4b207558c670','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-23 09:07:45'),('6c8fbfb03cf60f96fb7eb47aaf09b5bb','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:41'),('6ca02e47c6728f6e5814aba0ae4ff1ea','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:42'),('6f0df881c842d913da34b0735c793311','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 04:45:57'),('70a12c98b575c98997af7d51e0a6d760','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-02 04:56:48'),('71a8078383e068287d478a91f1e0520a','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:41'),('720a16c61f74eca25a95ae847220cb7d','YTZjZTE4NTJjNzM3MDI3OWRjYjA3YjBlMDYzMDU4YTA2MDRhNmFmZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxAlUN\nX2F1dGhfdXNlcl9pZIoBAXUu\n','2015-01-23 13:06:51'),('7441da5c744009f7ce822189a74fe22c','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:44'),('74d5e3aa7ea40c7084fcb06f19656066','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 09:49:06'),('76009f759cd530c005c0d96bf4540237','NjQ4M2Q5ZGM3YjMzYzE1MWNiZDVlZGVkZjhjYzBkZGQzN2QzYmNkMzqAAn1xAShVDV9hdXRoX3Vz\nZXJfaWSKAQFVEl9hdXRoX3VzZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxAnUu\n','2015-02-11 10:12:04'),('7887e474296b6a2942cd1d48489ce8db','NzU2OGRjNTlhNGQyNjgyNjcwZTYwZTQ3YWM2NDVkYzZmNWVkN2M3ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKASx1Lg==\n','2015-03-20 04:54:19'),('79701ddb63840fe186aeb6daf52e41cd','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-27 10:22:39'),('7d744f26cfc4cbaeeb364e47a95564c8','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-28 06:47:23'),('827526061cdd566e7a0ccf69d70a27a9','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-29 07:45:42'),('83b09df63b6b7408513d5719f48b6fd6','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-16 08:14:56'),('84ad824bd69804e67fb115b16c034ec2','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-03-30 10:26:16'),('864c063071091c033d8b64e1d2a9c8b1','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:44'),('86918340594dcf954870c9a568ee4a17','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 06:00:32'),('8a4d3108ee1c7ee82442837f19dff337','ZGQ4MWViZDQwZTJiMTE1MTY0MTFiMDJiN2M2ZDI5NGI4NzBhNGRjODqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2015-03-19 10:18:36'),('8c566dae65e8b4dc1ce89d2b6686ec64','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-29 07:43:41'),('8da4ca97b5367b21962237583d4dd220','ZGQ4MWViZDQwZTJiMTE1MTY0MTFiMDJiN2M2ZDI5NGI4NzBhNGRjODqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2015-05-06 12:32:10'),('8e30a77e3f35739bee2863d5c252bdc1','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-29 06:04:48'),('92a4b4335980262e3bff0eaad20cf7a3','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-11 13:59:31'),('980742e1a0dd58ee5aa1b42a7b792a27','MzdlNWE5NmYwMjkzZWY3OGY0YTk4N2IwMGIzNzNlODJkYjI0ZDZkYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2015-05-19 05:48:41'),('9c7e5f83ddb7da29c86773c721254d3b','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:38'),('9d724d0af4abb19d0a6676aaa215ba58','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:45'),('9e91a5ec74573165dc7457eb14860195','MzdlNWE5NmYwMjkzZWY3OGY0YTk4N2IwMGIzNzNlODJkYjI0ZDZkYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2015-06-02 11:08:53'),('9f15fa5af96492d40b2b5a3c50510e8a','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-05-07 06:57:32'),('a09f32a38c37c11f1681b53ef7da50ae','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:39'),('a0ef05c7a8a1c88ab930a04ca723632f','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 09:58:48'),('a26bc5172fdca91d63c5b249201da437','NzU2OGRjNTlhNGQyNjgyNjcwZTYwZTQ3YWM2NDVkYzZmNWVkN2M3ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKASx1Lg==\n','2015-04-13 06:15:59'),('a64de52a3cac10ddd2caa1d86291d908','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:42'),('a84aead4be2122a0dbf5e134ba76f054','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-16 05:46:27'),('ab0aa7a19cc73255acceedc78b5cbcc9','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:46'),('abf10fce0ed45225cbc22f446613e19c','NGE0MWIzM2IxYjhmY2JjZjk2ZmRlNThhYWQ3NzNmZjg0NjYyM2QyMDqAAn1xAShVCnRlc3Rjb29r\naWVVBndvcmtlZFUSX2F1dGhfdXNlcl9iYWNrZW5kcQJVKWRqYW5nby5jb250cmliLmF1dGguYmFj\na2VuZHMuTW9kZWxCYWNrZW5kcQNVDV9hdXRoX3VzZXJfaWRxBIoBQXUu\n','2015-05-04 11:36:21'),('ac248ac73c4201d4be2bf7955c8b6f54','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:40'),('ad1dfdb967442c01b712538415fef90f','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:46'),('ae47ce0f2a6e5360f2a8be2ada364f8b','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-05-07 06:07:40'),('b08547695d001e736ac9ccbc85d7232f','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:45'),('b0e8f201dcf0a12a26ed3426c97c03e3','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:41'),('b315d9cbb3b5eae87f5d5cd2a4bf2327','NTIwMmQyMTA5YWExNjM3ZmMwNzhmZjVmMmU0MjhmMjZkZDE2MWNlNDqAAn1xAVUKdGVzdGNvb2tp\nZVUGd29ya2VkcQJzLg==\n','2015-03-10 09:14:23'),('b372106b084fcc5c58458611d0ee79bd','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:43'),('b47cd9e4b1796cd3e094b4df293fd5e4','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:45'),('b4df7586a0719f553b85d5d7584c4158','MzdlNWE5NmYwMjkzZWY3OGY0YTk4N2IwMGIzNzNlODJkYjI0ZDZkYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2015-06-05 05:17:54'),('b6bacbf7aa298f6bc41652cc12ea08a0','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:46'),('b7c704a128949719cab92b9478e177f3','MzdlNWE5NmYwMjkzZWY3OGY0YTk4N2IwMGIzNzNlODJkYjI0ZDZkYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2015-02-27 05:16:33'),('b7f601852e7b43442bb1fae458c3525a','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:43'),('b7fddd34187ab6c61e83e8292f8f39e7','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:39'),('ba468711ba6983e0da24ce2694acc852','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-11 05:53:49'),('bba4c6ac5e7c37d45fb85b210a8aa775','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 09:48:48'),('be00851acb9b2e1300faa411442a98fa','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:46'),('c219a30533dd0dd9e5737c3ae89e5268','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 07:24:48'),('c29b56b8e955b89d2cd237f668f110c9','ZGQ4MWViZDQwZTJiMTE1MTY0MTFiMDJiN2M2ZDI5NGI4NzBhNGRjODqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2015-03-12 08:59:38'),('c3837f414725222cec4b6e15f3e6c35a','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:46'),('c586867c7c2be0733c616c1a3c5bc61e','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:40'),('c617d76f9fce57884edf50fe97c7d00f','ZGQ4MWViZDQwZTJiMTE1MTY0MTFiMDJiN2M2ZDI5NGI4NzBhNGRjODqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2015-05-02 09:36:23'),('c6512efc0c7a61c435045405b434f9f7','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-23 06:52:54'),('c912809fb0d7dc4486be880c760d4a07','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-28 09:17:20'),('cb477dd9df7f428c20c6e31da07e235d','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:43'),('ccb265274d10a7a60cfdfbb3ff3a3eda','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-05-06 10:52:33'),('cdd94166435c01fc3ee69ebbd3b1f03f','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:45'),('cf3a49b3e94dbe665984c3804827e781','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-05-07 07:16:46'),('cfadda5382fce8d884af0b66aacedbc7','ZGNhZTZmMjkzMTczNTgyNTkyYWY4MmYyMWMyZTU3MGIxMTRmOWJiNzqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKARl1Lg==\n','2015-04-27 07:01:55'),('cfdc08016540b4f25d925d1ede4cd2de','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-16 04:20:49'),('d03d817fd77db429bf390c9f45cf97b5','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-11 05:27:47'),('d1c93f4f393c0676a81b1eb785cae02c','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:39'),('d4ddc70ff43a27a8acb431d21f419cbf','YTZjZTE4NTJjNzM3MDI3OWRjYjA3YjBlMDYzMDU4YTA2MDRhNmFmZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxAlUN\nX2F1dGhfdXNlcl9pZIoBAXUu\n','2015-03-03 07:10:58'),('d5528b50d5b32fc0501010ded063b6df','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-15 04:23:20'),('d5d57bc3a99fc8b5b6cc8e32401c03ab','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-05-05 12:58:57'),('d76974f628bc997c876cd4a9be454cd2','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-05-08 09:55:00'),('daff8202d4b7fca8d04135e64805f629','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-23 07:02:59'),('dc5630d33742bbb28d840bf8480432e7','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-23 07:23:59'),('deb7beb03d8fd9c25bc3f475e5172247','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:42'),('e14015b8c42fba9b494658b0d70c96dc','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:43'),('e2aac36f5ed09ec0c4cec59de1f2393b','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:42'),('e342d1f02b51f8c59df9fcb0c7f42e8f','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:41'),('e96f53be101deda7ecb933f4a15b8dc3','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:40'),('e9d9884e92938b1b86b742182157d285','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-23 05:36:28'),('ea39b948a5b854d0973c29cdb6178f56','NzU2OGRjNTlhNGQyNjgyNjcwZTYwZTQ3YWM2NDVkYzZmNWVkN2M3ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKASx1Lg==\n','2015-04-14 10:04:27'),('eab02277392cb69ca71d7dec64a31894','NzU2OGRjNTlhNGQyNjgyNjcwZTYwZTQ3YWM2NDVkYzZmNWVkN2M3ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKASx1Lg==\n','2015-03-24 05:28:20'),('eb34d140d41a892bebdc2b013d1ff2d4','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-08 09:21:22'),('ec186908aa28f69229d5138e30ad1852','NzU2OGRjNTlhNGQyNjgyNjcwZTYwZTQ3YWM2NDVkYzZmNWVkN2M3ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKASx1Lg==\n','2015-03-26 10:25:36'),('ecf708b11843b3d858951f8c03690d0a','MzdlNWE5NmYwMjkzZWY3OGY0YTk4N2IwMGIzNzNlODJkYjI0ZDZkYjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2015-02-25 06:56:59'),('ed127d8b6049f6621b888ea15411ca96','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-05-05 09:58:25'),('ef187c077eda4fef983b293bce14f15f','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-29 05:58:58'),('ef71e45e9d95f0ff65bf24e14ffe68f8','YTZjZTE4NTJjNzM3MDI3OWRjYjA3YjBlMDYzMDU4YTA2MDRhNmFmZjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZFUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmRxAlUN\nX2F1dGhfdXNlcl9pZIoBAXUu\n','2015-03-04 07:53:18'),('efb4eb106d1f3c35c5dee250c5965f82','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:41'),('efc8edd2308f7a52b780a4a289a03429','NzU2OGRjNTlhNGQyNjgyNjcwZTYwZTQ3YWM2NDVkYzZmNWVkN2M3ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKASx1Lg==\n','2015-03-27 09:13:02'),('f01ad4fb0881ec2aa2d3f97d5116eb63','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:45'),('f19b8855b097565e53e441ae9ab3d00c','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:38'),('f43aa4adc17c6bda1763614ace7b383c','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-05-07 06:25:49'),('f44b30b03d998dfec23fa263b9e07229','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-23 07:11:29'),('f66133aef7a887f5b3b64576a460faeb','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-23 06:52:50'),('f6998b3385ae20e317d7c1b931e7d04d','NzU2OGRjNTlhNGQyNjgyNjcwZTYwZTQ3YWM2NDVkYzZmNWVkN2M3ZTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKASx1Lg==\n','2015-04-13 05:53:20'),('f87f6fbbf3350e376f3bedfef0b28066','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:44'),('f8b73d5f69a4833891105b591ab52cbf','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:40'),('fb0cc5055719d406361648b1fdafc61f','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:46'),('fb853090c2ebbe46d63d0eb59c0d8414','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-04-25 05:19:45'),('fc6f69935ba73958f4de41250b2739fe','NDYzOTk0OGU1MTc3MmE4ZWI2Y2M5ZmJmYjI4ZjU4MzQ1NGEwMWRhMDqAAn1xAVUPZGphbmdvX2xh\nbmd1YWdlWAIAAABlbnECcy4=\n','2015-05-09 10:43:13'),('fe2703649f7ae20e5c415f45bf850534','MjA0YTNiMmZmMTc5OTlkZTY2NDFhZTAyNWRkYjJmNTFlZjliMGVkODqAAn1xAS4=\n','2015-05-22 13:09:57'),('fff324b4ef6519fed13cfaf0d4b16f33','MmQ1NmYwN2YwZjkwMjZjZTVhZDUzYTEzOGNiM2Q0ZWNlNjA5NDA2NDqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAUF1Lg==\n','2015-05-07 07:28:02');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com'),(2,'localhost','localhost');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
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
  PRIMARY KEY (`id`),
  KEY `paypal_ipn_7ff10c6f` (`txn_id`)
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
-- Table structure for table `worker_usertracking`
--

DROP TABLE IF EXISTS `worker_usertracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_usertracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track_user_id` int(11) NOT NULL,
  `email_sent_count` int(10) unsigned NOT NULL,
  `email_read_count` int(10) unsigned NOT NULL,
  `email_view_count` int(10) unsigned NOT NULL,
  `recent_email_fail_count` int(10) unsigned NOT NULL,
  `last_email_sent` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `worker_usertracking_f39456b` (`track_user_id`),
  CONSTRAINT `track_user_id_refs_id_add4191f` FOREIGN KEY (`track_user_id`) REFERENCES `adjod_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_usertracking`
--

LOCK TABLES `worker_usertracking` WRITE;
/*!40000 ALTER TABLE `worker_usertracking` DISABLE KEYS */;
INSERT INTO `worker_usertracking` VALUES (1,1,7,0,0,0,'2015-05-21 13:00:00');
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
INSERT INTO `worker_worker` VALUES ('freealert_notice_email','Freealert Notice Email','worker.workers.EmailNotificationWorker',10,7200,'','','',1);
/*!40000 ALTER TABLE `worker_worker` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_workertask`
--

LOCK TABLES `worker_workertask` WRITE;
/*!40000 ALTER TABLE `worker_workertask` DISABLE KEYS */;
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

-- Dump completed on 2015-05-22 11:46:42
