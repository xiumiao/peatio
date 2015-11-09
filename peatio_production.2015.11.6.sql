-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: peatio_production
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
-- Table structure for table `account_versions`
--

DROP TABLE IF EXISTS `account_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `reason` int(11) DEFAULT NULL,
  `balance` decimal(32,16) DEFAULT NULL,
  `locked` decimal(32,16) DEFAULT NULL,
  `fee` decimal(32,16) DEFAULT NULL,
  `amount` decimal(32,16) DEFAULT NULL,
  `modifiable_id` int(11) DEFAULT NULL,
  `modifiable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `fun` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_account_versions_on_member_id_and_reason` (`member_id`,`reason`),
  KEY `index_account_versions_on_account_id_and_reason` (`account_id`,`reason`),
  KEY `index_account_versions_on_modifiable_id_and_modifiable_type` (`modifiable_id`,`modifiable_type`),
  KEY `index_account_versions_on_account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_versions`
--

LOCK TABLES `account_versions` WRITE;
/*!40000 ALTER TABLE `account_versions` DISABLE KEYS */;
INSERT INTO `account_versions` VALUES (1,4,7,600,-100.0000000000000000,100.0000000000000000,0.0000000000000000,10000.0000000000000000,1,'Order','2015-09-23 09:34:20','2015-09-23 09:34:20',1,2),(2,1,2,600,-1.0000000000000000,1.0000000000000000,0.0000000000000000,10.0000000000000000,2,'Order','2015-09-23 09:38:07','2015-09-23 09:38:07',2,2),(3,4,8,600,-1.0000000000000000,1.0000000000000000,0.0000000000000000,1.0000000000000000,3,'Order','2015-09-23 10:00:04','2015-09-23 10:00:04',2,2),(4,1,2,600,-1.0000000000000000,1.0000000000000000,0.0000000000000000,10.0000000000000000,4,'Order','2015-09-23 10:01:12','2015-09-23 10:01:12',2,2),(5,4,7,120,0.0000000000000000,-100.0000000000000000,0.0000000000000000,9900.0000000000000000,1,'Trade','2015-09-23 10:01:28','2015-09-23 10:01:28',1,5),(6,4,8,110,1.0000000000000000,0.0000000000000000,0.0000000000000000,2.0000000000000000,1,'Trade','2015-09-23 10:01:28','2015-09-23 10:01:28',2,3),(7,1,2,120,0.0000000000000000,-1.0000000000000000,0.0000000000000000,9.0000000000000000,1,'Trade','2015-09-23 10:01:28','2015-09-23 10:01:28',2,5),(8,1,1,110,100.0000000000000000,0.0000000000000000,0.0000000000000000,100100.0000000000000000,1,'Trade','2015-09-23 10:01:30','2015-09-23 10:01:30',1,3),(9,4,7,600,-100.0000000000000000,100.0000000000000000,0.0000000000000000,9900.0000000000000000,5,'Order','2015-09-23 10:03:12','2015-09-23 10:03:12',1,2),(10,1,2,600,-1.0000000000000000,1.0000000000000000,0.0000000000000000,9.0000000000000000,6,'Order','2015-09-23 10:03:23','2015-09-23 10:03:23',2,2),(11,4,7,120,0.0000000000000000,-100.0000000000000000,0.0000000000000000,9800.0000000000000000,2,'Trade','2015-09-23 10:03:33','2015-09-23 10:03:33',1,5),(12,4,8,110,1.0000000000000000,0.0000000000000000,0.0000000000000000,3.0000000000000000,2,'Trade','2015-09-23 10:03:33','2015-09-23 10:03:33',2,3),(13,1,2,120,0.0000000000000000,-1.0000000000000000,0.0000000000000000,8.0000000000000000,2,'Trade','2015-09-23 10:03:33','2015-09-23 10:03:33',2,5),(14,1,1,110,100.0000000000000000,0.0000000000000000,0.0000000000000000,100200.0000000000000000,2,'Trade','2015-09-23 10:03:33','2015-09-23 10:03:33',1,3),(15,1,2,610,1.0000000000000000,-1.0000000000000000,0.0000000000000000,8.0000000000000000,2,'Order','2015-09-23 10:05:58','2015-09-23 10:05:58',2,1),(16,4,7,600,-100.0000000000000000,100.0000000000000000,0.0000000000000000,9800.0000000000000000,7,'Order','2015-09-23 10:17:22','2015-09-23 10:17:22',1,2),(17,1,2,600,-1.0000000000000000,1.0000000000000000,0.0000000000000000,8.0000000000000000,8,'Order','2015-09-23 10:17:31','2015-09-23 10:17:31',2,2),(18,4,7,120,0.0000000000000000,-100.0000000000000000,0.0000000000000000,9700.0000000000000000,3,'Trade','2015-09-23 10:17:54','2015-09-23 10:17:54',1,5),(19,4,8,110,1.0000000000000000,0.0000000000000000,0.0000000000000000,4.0000000000000000,3,'Trade','2015-09-23 10:17:54','2015-09-23 10:17:54',2,3),(20,1,2,120,0.0000000000000000,-1.0000000000000000,0.0000000000000000,7.0000000000000000,3,'Trade','2015-09-23 10:17:54','2015-09-23 10:17:54',2,5),(21,1,1,110,100.0000000000000000,0.0000000000000000,0.0000000000000000,100300.0000000000000000,3,'Trade','2015-09-23 10:17:54','2015-09-23 10:17:54',1,3),(22,1,2,600,-2.0000000000000000,2.0000000000000000,0.0000000000000000,7.0000000000000000,9,'Order','2015-09-23 10:23:31','2015-09-23 10:23:31',2,2),(23,4,7,600,-1800.0000000000000000,1800.0000000000000000,0.0000000000000000,9700.0000000000000000,10,'Order','2015-09-23 10:23:42','2015-09-23 10:23:42',1,2),(24,4,7,600,-1000.0000000000000000,1000.0000000000000000,0.0000000000000000,9700.0000000000000000,11,'Order','2015-09-23 10:24:16','2015-09-23 10:24:16',1,2),(25,4,7,120,0.0000000000000000,-1000.0000000000000000,0.0000000000000000,8700.0000000000000000,4,'Trade','2015-09-23 10:24:26','2015-09-23 10:24:26',1,5),(26,4,8,110,1.0000000000000000,0.0000000000000000,0.0000000000000000,5.0000000000000000,4,'Trade','2015-09-23 10:24:26','2015-09-23 10:24:26',2,3),(27,1,2,120,0.0000000000000000,-1.0000000000000000,0.0000000000000000,6.0000000000000000,4,'Trade','2015-09-23 10:24:27','2015-09-23 10:24:27',2,5),(28,1,1,110,1000.0000000000000000,0.0000000000000000,0.0000000000000000,101300.0000000000000000,4,'Trade','2015-09-23 10:24:27','2015-09-23 10:24:27',1,3),(29,1,2,600,-1.0000000000000000,1.0000000000000000,0.0000000000000000,6.0000000000000000,12,'Order','2015-09-23 10:24:53','2015-09-23 10:24:53',2,2),(30,4,7,120,0.0000000000000000,-111.0000000000000000,0.0000000000000000,8589.0000000000000000,5,'Trade','2015-09-23 10:25:07','2015-09-23 10:25:07',1,5),(31,4,8,110,1.0000000000000000,0.0000000000000000,0.0000000000000000,6.0000000000000000,5,'Trade','2015-09-23 10:25:07','2015-09-23 10:25:07',2,3),(32,4,8,120,0.0000000000000000,-1.0000000000000000,0.0000000000000000,5.0000000000000000,5,'Trade','2015-09-23 10:25:07','2015-09-23 10:25:07',2,5),(33,4,7,110,111.0000000000000000,0.0000000000000000,0.0000000000000000,8700.0000000000000000,5,'Trade','2015-09-23 10:25:07','2015-09-23 10:25:07',1,3),(34,4,7,600,-100.0000000000000000,100.0000000000000000,0.0000000000000000,8700.0000000000000000,13,'Order','2015-09-23 16:26:56','2015-09-23 16:26:56',1,2),(35,4,7,600,-240.0000000000000000,240.0000000000000000,0.0000000000000000,8700.0000000000000000,14,'Order','2015-09-23 16:27:23','2015-09-23 16:27:23',1,2),(36,1,2,600,-1.0000000000000000,1.0000000000000000,0.0000000000000000,6.0000000000000000,15,'Order','2015-09-23 16:51:58','2015-09-23 16:51:58',2,2),(37,4,7,120,0.0000000000000000,-900.0000000000000000,0.0000000000000000,7800.0000000000000000,6,'Trade','2015-09-23 16:52:26','2015-09-23 16:52:26',1,5),(38,4,8,110,1.0000000000000000,0.0000000000000000,0.0000000000000000,6.0000000000000000,6,'Trade','2015-09-23 16:52:27','2015-09-23 16:52:27',2,3),(39,4,7,620,789.0000000000000000,-789.0000000000000000,0.0000000000000000,7800.0000000000000000,6,'Trade','2015-09-23 16:52:28','2015-09-23 16:52:28',1,1),(40,1,2,120,0.0000000000000000,-1.0000000000000000,0.0000000000000000,5.0000000000000000,6,'Trade','2015-09-23 16:52:31','2015-09-23 16:52:31',2,5),(41,1,1,110,900.0000000000000000,0.0000000000000000,0.0000000000000000,102200.0000000000000000,6,'Trade','2015-09-23 16:52:31','2015-09-23 16:52:31',1,3),(42,4,7,600,-910.0000000000000000,910.0000000000000000,0.0000000000000000,7800.0000000000000000,16,'Order','2015-09-23 16:57:25','2015-09-23 16:57:25',1,2),(43,4,7,600,-1000.0000000000000000,1000.0000000000000000,0.0000000000000000,7800.0000000000000000,17,'Order','2015-09-24 10:59:36','2015-09-24 10:59:36',1,2),(44,4,7,120,0.0000000000000000,-1000.0000000000000000,0.0000000000000000,6800.0000000000000000,7,'Trade','2015-09-24 11:00:41','2015-09-24 11:00:41',1,5),(45,4,8,110,1.0000000000000000,0.0000000000000000,0.0000000000000000,7.0000000000000000,7,'Trade','2015-09-24 11:00:43','2015-09-24 11:00:43',2,3),(46,1,2,120,0.0000000000000000,-1.0000000000000000,0.0000000000000000,4.0000000000000000,7,'Trade','2015-09-24 11:00:48','2015-09-24 11:00:48',2,5),(47,1,1,110,1000.0000000000000000,0.0000000000000000,0.0000000000000000,103200.0000000000000000,7,'Trade','2015-09-24 11:00:48','2015-09-24 11:00:48',1,3),(48,4,8,600,-1.0000000000000000,1.0000000000000000,0.0000000000000000,7.0000000000000000,18,'Order','2015-09-24 11:11:05','2015-09-24 11:11:05',2,2),(49,4,7,120,0.0000000000000000,-910.0000000000000000,0.0000000000000000,5890.0000000000000000,8,'Trade','2015-09-24 11:11:35','2015-09-24 11:11:35',1,5),(50,4,8,110,1.0000000000000000,0.0000000000000000,0.0000000000000000,8.0000000000000000,8,'Trade','2015-09-24 11:11:37','2015-09-24 11:11:37',2,3),(51,4,8,120,0.0000000000000000,-1.0000000000000000,0.0000000000000000,7.0000000000000000,8,'Trade','2015-09-24 11:11:40','2015-09-24 11:11:40',2,5),(52,4,7,110,910.0000000000000000,0.0000000000000000,0.0000000000000000,6800.0000000000000000,8,'Trade','2015-09-24 11:11:41','2015-09-24 11:11:41',1,3),(53,4,7,600,-1000.0000000000000000,1000.0000000000000000,0.0000000000000000,6800.0000000000000000,19,'Order','2015-09-24 16:29:30','2015-09-24 16:29:30',1,2),(54,4,8,600,-1.0000000000000000,1.0000000000000000,0.0000000000000000,7.0000000000000000,20,'Order','2015-09-24 16:30:15','2015-09-24 16:30:15',2,2),(55,4,7,120,0.0000000000000000,-1000.0000000000000000,0.0000000000000000,5800.0000000000000000,9,'Trade','2015-09-24 16:30:39','2015-09-24 16:30:39',1,5),(56,4,8,110,1.0000000000000000,0.0000000000000000,0.0000000000000000,8.0000000000000000,9,'Trade','2015-09-24 16:31:03','2015-09-24 16:31:03',2,3),(57,1,2,120,0.0000000000000000,-1.0000000000000000,0.0000000000000000,3.0000000000000000,9,'Trade','2015-09-24 16:31:04','2015-09-24 16:31:04',2,5),(58,1,1,110,1000.0000000000000000,0.0000000000000000,0.0000000000000000,104200.0000000000000000,9,'Trade','2015-09-24 16:31:04','2015-09-24 16:31:04',1,3),(59,4,7,600,-1010.0000000000000000,1010.0000000000000000,0.0000000000000000,5800.0000000000000000,21,'Order','2015-09-24 17:02:13','2015-09-24 17:02:13',1,2),(60,4,7,120,0.0000000000000000,-1000.0000000000000000,0.0000000000000000,4800.0000000000000000,10,'Trade','2015-09-24 17:02:35','2015-09-24 17:02:35',1,5),(61,4,8,110,1.0000000000000000,0.0000000000000000,0.0000000000000000,9.0000000000000000,10,'Trade','2015-09-24 17:02:36','2015-09-24 17:02:36',2,3),(62,4,7,620,10.0000000000000000,-10.0000000000000000,0.0000000000000000,4800.0000000000000000,10,'Trade','2015-09-24 17:02:36','2015-09-24 17:02:36',1,1),(63,4,8,120,0.0000000000000000,-1.0000000000000000,0.0000000000000000,8.0000000000000000,10,'Trade','2015-09-24 17:02:37','2015-09-24 17:02:37',2,5),(64,4,7,110,1000.0000000000000000,0.0000000000000000,0.0000000000000000,5800.0000000000000000,10,'Trade','2015-09-24 17:02:37','2015-09-24 17:02:37',1,3),(65,1,1,600,-900.0000000000000000,900.0000000000000000,0.0000000000000000,104200.0000000000000000,22,'Order','2015-10-29 10:57:40','2015-10-29 10:57:40',1,2),(66,1,1,600,-130.0000000000000000,130.0000000000000000,0.0000000000000000,104200.0000000000000000,23,'Order','2015-10-29 10:59:19','2015-10-29 10:59:19',1,2),(67,4,7,1000,10000.0000000000000000,0.0000000000000000,0.0000000000000000,15800.0000000000000000,1,'Deposit','2015-11-03 16:50:52','2015-11-03 16:50:52',1,3);
/*!40000 ALTER TABLE `account_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `balance` decimal(32,16) DEFAULT NULL,
  `locked` decimal(32,16) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `in` decimal(32,16) DEFAULT NULL,
  `out` decimal(32,16) DEFAULT NULL,
  `default_withdraw_fund_source_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_accounts_on_member_id_and_currency` (`member_id`,`currency`),
  KEY `index_accounts_on_member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,1,1,103170.0000000000000000,1030.0000000000000000,'2015-09-21 17:18:51','2015-09-21 17:18:51',NULL,NULL,NULL),(2,1,2,3.0000000000000000,0.0000000000000000,'2015-09-21 17:18:51','2015-09-21 17:18:51',NULL,NULL,NULL),(3,2,1,0.0000000000000000,0.0000000000000000,'2015-09-21 17:18:51','2015-09-21 17:18:51',NULL,NULL,NULL),(4,2,2,0.0000000000000000,0.0000000000000000,'2015-09-21 17:18:51','2015-09-21 17:18:51',NULL,NULL,NULL),(5,3,1,0.0000000000000000,0.0000000000000000,'2015-09-21 17:18:51','2015-09-21 17:18:51',NULL,NULL,NULL),(6,3,2,0.0000000000000000,0.0000000000000000,'2015-09-21 17:18:51','2015-09-21 17:18:51',NULL,NULL,NULL),(7,4,1,15460.0000000000000000,340.0000000000000000,'2015-09-22 15:04:26','2015-09-23 16:19:51',NULL,NULL,1),(9,5,1,0.0000000000000000,0.0000000000000000,'2015-11-04 08:45:00','2015-11-04 08:45:00',NULL,NULL,NULL),(10,5,2,0.0000000000000000,0.0000000000000000,'2015-11-04 08:45:00','2015-11-04 08:45:00',NULL,NULL,NULL),(11,6,1,0.0000000000000000,0.0000000000000000,'2015-11-04 09:04:33','2015-11-04 09:04:33',NULL,NULL,NULL),(12,6,2,0.0000000000000000,0.0000000000000000,'2015-11-04 09:04:33','2015-11-04 09:04:33',NULL,NULL,NULL),(13,7,1,0.0000000000000000,0.0000000000000000,'2015-11-04 17:12:36','2015-11-04 17:12:36',NULL,NULL,NULL),(14,7,2,0.0000000000000000,0.0000000000000000,'2015-11-04 17:12:36','2015-11-04 17:12:36',NULL,NULL,NULL),(15,8,1,0.0000000000000000,0.0000000000000000,'2015-11-05 14:01:29','2015-11-05 14:01:29',NULL,NULL,NULL),(16,8,2,0.0000000000000000,0.0000000000000000,'2015-11-05 14:01:29','2015-11-05 14:01:29',NULL,NULL,NULL),(17,9,1,0.0000000000000000,0.0000000000000000,'2015-11-05 17:04:28','2015-11-05 17:04:28',NULL,NULL,NULL),(18,9,2,0.0000000000000000,0.0000000000000000,'2015-11-05 17:04:28','2015-11-05 17:04:28',NULL,NULL,NULL),(19,10,1,0.0000000000000000,0.0000000000000000,'2015-11-05 17:06:43','2015-11-05 17:06:43',NULL,NULL,NULL),(20,10,2,0.0000000000000000,0.0000000000000000,'2015-11-05 17:06:43','2015-11-05 17:06:43',NULL,NULL,NULL),(21,11,1,0.0000000000000000,0.0000000000000000,'2015-11-05 17:08:07','2015-11-05 17:08:07',NULL,NULL,NULL),(22,11,2,0.0000000000000000,0.0000000000000000,'2015-11-05 17:08:07','2015-11-05 17:08:07',NULL,NULL,NULL),(23,12,1,0.0000000000000000,0.0000000000000000,'2015-11-05 17:09:42','2015-11-05 17:09:42',NULL,NULL,NULL),(24,12,2,0.0000000000000000,0.0000000000000000,'2015-11-05 17:09:42','2015-11-05 17:09:42',NULL,NULL,NULL),(25,13,1,0.0000000000000000,0.0000000000000000,'2015-11-05 17:10:48','2015-11-05 17:10:48',NULL,NULL,NULL),(26,13,2,0.0000000000000000,0.0000000000000000,'2015-11-05 17:10:48','2015-11-05 17:10:48',NULL,NULL,NULL),(27,14,1,0.0000000000000000,0.0000000000000000,'2015-11-05 17:13:34','2015-11-05 17:13:34',NULL,NULL,NULL),(28,14,2,0.0000000000000000,0.0000000000000000,'2015-11-05 17:13:34','2015-11-05 17:13:34',NULL,NULL,NULL),(29,15,1,0.0000000000000000,0.0000000000000000,'2015-11-06 09:07:42','2015-11-06 09:07:42',NULL,NULL,NULL),(30,15,2,0.0000000000000000,0.0000000000000000,'2015-11-06 09:07:42','2015-11-06 09:07:42',NULL,NULL,NULL),(31,16,1,0.0000000000000000,0.0000000000000000,'2015-11-06 09:14:16','2015-11-06 09:14:16',NULL,NULL,NULL),(32,16,2,0.0000000000000000,0.0000000000000000,'2015-11-06 09:14:16','2015-11-06 09:14:16',NULL,NULL,NULL),(33,17,1,0.0000000000000000,0.0000000000000000,'2015-11-06 09:14:48','2015-11-06 09:14:48',NULL,NULL,NULL),(34,17,2,0.0000000000000000,0.0000000000000000,'2015-11-06 09:14:48','2015-11-06 09:14:48',NULL,NULL,NULL),(35,18,1,0.0000000000000000,0.0000000000000000,'2015-11-06 10:05:08','2015-11-06 10:05:08',NULL,NULL,NULL),(36,18,2,0.0000000000000000,0.0000000000000000,'2015-11-06 10:05:09','2015-11-06 10:05:09',NULL,NULL,NULL),(37,19,1,0.0000000000000000,0.0000000000000000,'2015-11-06 11:16:32','2015-11-06 11:16:32',NULL,NULL,NULL),(38,19,2,0.0000000000000000,0.0000000000000000,'2015-11-06 11:16:32','2015-11-06 11:16:32',NULL,NULL,NULL),(39,20,1,0.0000000000000000,0.0000000000000000,'2015-11-06 11:34:34','2015-11-06 11:34:34',NULL,NULL,NULL),(40,20,2,0.0000000000000000,0.0000000000000000,'2015-11-06 11:34:34','2015-11-06 11:34:34',NULL,NULL,NULL),(41,21,1,0.0000000000000000,0.0000000000000000,'2015-11-06 11:35:18','2015-11-06 11:35:18',NULL,NULL,NULL),(42,21,2,0.0000000000000000,0.0000000000000000,'2015-11-06 11:35:18','2015-11-06 11:35:18',NULL,NULL,NULL),(43,22,1,0.0000000000000000,0.0000000000000000,'2015-11-06 11:52:05','2015-11-06 11:52:05',NULL,NULL,NULL),(44,22,2,0.0000000000000000,0.0000000000000000,'2015-11-06 11:52:05','2015-11-06 11:52:05',NULL,NULL,NULL),(45,23,1,0.0000000000000000,0.0000000000000000,'2015-11-06 11:55:58','2015-11-06 11:55:58',NULL,NULL,NULL),(46,23,2,0.0000000000000000,0.0000000000000000,'2015-11-06 11:55:58','2015-11-06 11:55:58',NULL,NULL,NULL),(47,24,1,0.0000000000000000,0.0000000000000000,'2015-11-06 11:58:09','2015-11-06 11:58:09',NULL,NULL,NULL),(48,24,2,0.0000000000000000,0.0000000000000000,'2015-11-06 11:58:09','2015-11-06 11:58:09',NULL,NULL,NULL),(49,25,1,0.0000000000000000,0.0000000000000000,'2015-11-06 13:44:39','2015-11-06 13:44:39',NULL,NULL,NULL),(50,25,2,0.0000000000000000,0.0000000000000000,'2015-11-06 13:44:39','2015-11-06 13:44:39',NULL,NULL,NULL),(51,26,1,0.0000000000000000,0.0000000000000000,'2015-11-06 13:45:27','2015-11-06 13:45:27',NULL,NULL,NULL),(52,26,2,0.0000000000000000,0.0000000000000000,'2015-11-06 13:45:27','2015-11-06 13:45:27',NULL,NULL,NULL),(53,27,1,0.0000000000000000,0.0000000000000000,'2015-11-06 14:07:53','2015-11-06 14:07:53',NULL,NULL,NULL),(54,27,2,0.0000000000000000,0.0000000000000000,'2015-11-06 14:07:53','2015-11-06 14:07:53',NULL,NULL,NULL);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_tokens`
--

DROP TABLE IF EXISTS `api_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `access_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `secret_key` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `trusted_ip_list` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oauth_access_token_id` int(11) DEFAULT NULL,
  `expire_at` datetime DEFAULT NULL,
  `scopes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_api_tokens_on_access_key` (`access_key`),
  UNIQUE KEY `index_api_tokens_on_secret_key` (`secret_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_tokens`
--

LOCK TABLES `api_tokens` WRITE;
/*!40000 ALTER TABLE `api_tokens` DISABLE KEYS */;
INSERT INTO `api_tokens` VALUES (1,6,'sXqMa1x24ti4x8lDVpywDtXDOCcoS7KNBswTXjvw','m823o88U2mPvqTQ3SKSxhAVQMQNBTGxm6OIeF78z','2015-11-04 14:06:56','2015-11-04 14:06:56',NULL,'测试',NULL,NULL,'all',NULL);
/*!40000 ALTER TABLE `api_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attachable_id` int(11) DEFAULT NULL,
  `attachable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,'Asset::IdDocumentFile',6,'IdDocument','bfcaa4a6-3d9c-4294-ac5b-d1c8db8a5db6.png'),(2,'Asset::IdBillFile',6,'IdDocument','7f0dcc39-a5d5-4b5e-907e-53c53a9b753b.jpg');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `auditable_id` int(11) DEFAULT NULL,
  `auditable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_audit_logs_on_operator_id` (`operator_id`),
  KEY `index_audit_logs_on_auditable_id_and_auditable_type` (`auditable_id`,`auditable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
INSERT INTO `audit_logs` VALUES (1,'Audit::TransferAuditLog',1,'2015-11-03 16:50:51','2015-11-03 16:50:51',1,'Deposit','submitting','submitted'),(2,'Audit::TransferAuditLog',1,'2015-11-03 16:50:52','2015-11-03 16:50:52',1,'Deposit','submitted','accepted');
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentications`
--

DROP TABLE IF EXISTS `authentications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_authentications_on_member_id` (`member_id`),
  KEY `index_authentications_on_provider_and_uid` (`provider`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentications`
--

LOCK TABLES `authentications` WRITE;
/*!40000 ALTER TABLE `authentications` DISABLE KEYS */;
INSERT INTO `authentications` VALUES (1,'identity','1',NULL,NULL,1,'2015-09-21 17:18:51','2015-09-21 17:18:51',NULL),(2,'identity','2',NULL,NULL,2,'2015-09-21 17:18:51','2015-09-21 17:18:51',NULL),(3,'identity','3',NULL,NULL,3,'2015-09-21 17:18:51','2015-09-21 17:18:51',NULL),(4,'identity','4',NULL,NULL,4,'2015-09-22 15:04:26','2015-09-22 15:04:26',NULL),(5,'identity','5',NULL,NULL,5,'2015-11-04 08:45:01','2015-11-04 08:45:01',NULL),(6,'identity','6',NULL,NULL,6,'2015-11-04 09:04:33','2015-11-04 09:04:33',NULL),(7,'identity','7',NULL,NULL,7,'2015-11-04 17:12:37','2015-11-04 17:12:37',NULL),(8,'identity','8',NULL,NULL,8,'2015-11-05 14:01:30','2015-11-05 14:01:30',NULL),(9,'identity','9',NULL,NULL,9,'2015-11-05 17:04:29','2015-11-05 17:04:29',NULL),(10,'identity','10',NULL,NULL,10,'2015-11-05 17:06:43','2015-11-05 17:06:43',NULL),(11,'identity','11',NULL,NULL,11,'2015-11-05 17:08:08','2015-11-05 17:08:08',NULL),(12,'identity','12',NULL,NULL,12,'2015-11-05 17:09:42','2015-11-05 17:09:42',NULL),(13,'identity','13',NULL,NULL,13,'2015-11-05 17:10:48','2015-11-05 17:10:48',NULL),(14,'identity','14',NULL,NULL,14,'2015-11-05 17:13:34','2015-11-05 17:13:34',NULL),(15,'identity','15',NULL,NULL,15,'2015-11-06 09:07:43','2015-11-06 09:07:43',NULL),(16,'identity','16',NULL,NULL,16,'2015-11-06 09:14:17','2015-11-06 09:14:17',NULL),(17,'identity','17',NULL,NULL,17,'2015-11-06 09:14:48','2015-11-06 09:14:48',NULL),(18,'identity','18',NULL,NULL,18,'2015-11-06 10:05:09','2015-11-06 10:05:09',NULL),(19,'identity','21',NULL,NULL,27,'2015-11-06 17:15:31','2015-11-06 17:15:31',NULL);
/*!40000 ALTER TABLE `authentications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  `author_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposits`
--

DROP TABLE IF EXISTS `deposits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deposits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `amount` decimal(32,16) DEFAULT NULL,
  `fee` decimal(32,16) DEFAULT NULL,
  `fund_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fund_extra` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `aasm_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `done_at` datetime DEFAULT NULL,
  `confirmations` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_transaction_id` int(11) DEFAULT NULL,
  `txout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_deposits_on_txid_and_txout` (`txid`,`txout`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposits`
--

LOCK TABLES `deposits` WRITE;
/*!40000 ALTER TABLE `deposits` DISABLE KEYS */;
INSERT INTO `deposits` VALUES (1,7,4,1,10000.0000000000000000,0.0000000000000000,'32315454646','icbc','10000.0',NULL,'accepted','2015-11-03 16:25:26','2015-11-03 16:50:52','2015-11-03 16:50:52',NULL,'Deposits::Bank',NULL,NULL);
/*!40000 ALTER TABLE `deposits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_translations`
--

DROP TABLE IF EXISTS `document_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `desc` text COLLATE utf8_unicode_ci,
  `keywords` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_document_translations_on_document_id` (`document_id`),
  KEY `index_document_translations_on_locale` (`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_translations`
--

LOCK TABLES `document_translations` WRITE;
/*!40000 ALTER TABLE `document_translations` DISABLE KEYS */;
INSERT INTO `document_translations` VALUES (1,1,'en','2015-11-03 14:25:44','2015-11-03 14:25:44','price','<span><b>Pu-erh</b>&nbsp;or&nbsp;<b>Pu\'er</b>&nbsp;is a variety of fermented and aged&nbsp;<a href=\"https://en.wikipedia.org/wiki/Dark_tea\" target=\"\" rel=\"\">dark tea</a>&nbsp;produced in&nbsp;<a href=\"https://en.wikipedia.org/wiki/Yunnan\" target=\"\" rel=\"\">Yunnan</a>&nbsp;province, China.<a href=\"https://en.wikipedia.org/wiki/Pu-erh_tea#cite_note-.E9.99.B3.E5.AE.97.E6.87.8B246-1\" target=\"\" rel=\"\">[1]</a>&nbsp;<a href=\"https://en.wikipedia.org/wiki/Fermented_tea\" target=\"\" rel=\"\">Fermentation is a tea production style</a>&nbsp;in which the tea leaves undergo microbial fermentation and oxidation after they are dried and rolled.<a href=\"https://en.wikipedia.org/wiki/Pu-erh_tea#cite_note-.E9.99.B3.E5.AE.97.E6.87.8B438-2\" target=\"\" rel=\"\">[2]</a>&nbsp;This process is a Chinese specialty and produces tea known as Hei Cha, commonly translated as dark, or black tea (this type of tea is different from what in the West is known as \"<a href=\"https://en.wikipedia.org/wiki/Black_tea\" target=\"\" rel=\"\">black tea</a>\", which in China is called \"red tea\" 红茶). The best known variety of this category of tea is Pu-erh from Yunnan Province, named after the trading post for dark tea during imperial China.</span><span>Pu\'er traditionally begins as a raw product known as \"rough\"&nbsp;<i>Mao Cha</i>&nbsp;&nbsp;and can be sold in this form or pressed into a number of shapes and sold as \"raw\"&nbsp;<i>Sheng Cha</i>&nbsp;. Both of these forms then undergo the complex process of gradual fermentation and maturation with time. The Wo Dui fermentation process developed in 1973 by the Kunming Tea Factory&nbsp;<a href=\"https://en.wikipedia.org/wiki/Pu-erh_tea#cite_note-zhangj-3\" target=\"\" rel=\"\">[3]</a>:206&nbsp;<a href=\"https://en.wikipedia.org/wiki/Pu-erh_tea#cite_note-articles3k.com-4\" target=\"\" rel=\"\">[4]</a>&nbsp;created a new type of pu-erh tea. This process involves an accelerated fermentation into \"ripe\"&nbsp;<i>Shu Cha</i>&nbsp;which is then stored loose or pressed into various shapes. The fermentation process was adopted at the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Menghai_Tea_Factory\" target=\"\" rel=\"\">Menghai Tea Factory</a>&nbsp;shortly after and technically developed there.<a href=\"https://en.wikipedia.org/wiki/Pu-erh_tea#cite_note-zhangj_menghai-5\" target=\"\" rel=\"\">[5]</a>&nbsp;The legitimacy of shu cha is disputed by some traditionalists in contrast to aged teas. All types of pu-erh can be stored to mature before consumption, which is why it is commonly labelled with year and region of production.</span>','the puer tea price desction','puer'),(2,1,'zh-CN','2015-11-03 14:25:44','2015-11-03 14:25:44','普洱茶价格','<div>普洱茶，又名<a href=\"http://baike.baidu.com/view/3878552.htm\" target=\"_blank\" rel=\"\">滇青茶</a>，属于<a href=\"http://baike.baidu.com/view/27752.htm\" target=\"_blank\" rel=\"\">黑茶</a>类，因原运销集散地在普洱县，故名普洱茶。</div><div>普洱茶以云南大叶种晒<a href=\"http://baike.baidu.com/view/37239.htm\" target=\"_blank\" rel=\"\">青茶</a>为原料，使用亚发酵青茶制法，从发酵不同分为<a href=\"http://baike.baidu.com/view/159353.htm\" target=\"_blank\" rel=\"\">生茶</a>和<a href=\"http://baike.baidu.com/view/936957.htm\" target=\"_blank\" rel=\"\">熟茶</a>两种，成品分为<a href=\"http://baike.baidu.com/view/7767798.htm\" target=\"_blank\" rel=\"\">散茶</a>和<a href=\"http://baike.baidu.com/view/35174.htm\" target=\"_blank\" rel=\"\">紧压茶</a>两类。</div><div>普洱茶讲究冲泡技巧和品饮艺术，其饮用方法丰富，既可清饮，也可混饮。普洱茶茶汤橙黄浓厚，香气高锐持久，香型独特，滋味浓醇，经久耐泡，冲泡五六次后仍有香味。</div><div>普洱茶主要产于云南省的西双版纳、临沧、普洱等地区。该地具有终年雨水充足、云<a href=\"http://baike.baidu.com/view/10616.htm\" target=\"_blank\" rel=\"\">雾</a>弥漫、土层深厚、土地肥沃、无污染等优势。</div>','普洱茶','普洱茶'),(3,1,'ko','2015-11-03 14:25:44','2015-11-03 14:25:44','price','<b>Pu-erh</b>&nbsp;or&nbsp;<b>Pu\'er</b>&nbsp;is a variety of fermented and aged&nbsp;<a href=\"https://en.wikipedia.org/wiki/Dark_tea\" target=\"\" rel=\"\">dark tea</a>&nbsp;produced in&nbsp;<a href=\"https://en.wikipedia.org/wiki/Yunnan\" target=\"\" rel=\"\">Yunnan</a>&nbsp;province, China.<a href=\"https://en.wikipedia.org/wiki/Pu-erh_tea#cite_note-.E9.99.B3.E5.AE.97.E6.87.8B246-1\" target=\"\" rel=\"\">[1]</a>&nbsp;<a href=\"https://en.wikipedia.org/wiki/Fermented_tea\" target=\"\" rel=\"\">Fermentation is a tea production style</a>&nbsp;in which the tea leaves undergo microbial fermentation and oxidation after they are dried and rolled.<a href=\"https://en.wikipedia.org/wiki/Pu-erh_tea#cite_note-.E9.99.B3.E5.AE.97.E6.87.8B438-2\" target=\"\" rel=\"\">[2]</a>&nbsp;This process is a Chinese specialty and produces tea known as Hei Cha, commonly translated as dark, or black tea (this type of tea is different from what in the West is known as \"<a href=\"https://en.wikipedia.org/wiki/Black_tea\" target=\"\" rel=\"\">black tea</a>\", which in China is called \"red tea\" 红茶). The best known variety of this category of tea is Pu-erh from Yunnan Province, named after the trading post for dark tea during imperial China.Pu\'er traditionally begins as a raw product known as \"rough\"&nbsp;<i>Mao Cha</i>&nbsp;&nbsp;and can be sold in this form or pressed into a number of shapes and sold as \"raw\"&nbsp;<i>Sheng Cha</i>&nbsp;. Both of these forms then undergo the complex process of gradual fermentation and maturation with time. The Wo Dui fermentation process developed in 1973 by the Kunming Tea Factory&nbsp;<a href=\"https://en.wikipedia.org/wiki/Pu-erh_tea#cite_note-zhangj-3\" target=\"\" rel=\"\">[3]</a>:206&nbsp;<a href=\"https://en.wikipedia.org/wiki/Pu-erh_tea#cite_note-articles3k.com-4\" target=\"\" rel=\"\">[4]</a>&nbsp;created a new type of pu-erh tea. This process involves an accelerated fermentation into \"ripe\"&nbsp;<i>Shu Cha</i>&nbsp;which is then stored loose or pressed into various shapes. The fermentation process was adopted at the&nbsp;<a href=\"https://en.wikipedia.org/wiki/Menghai_Tea_Factory\" target=\"\" rel=\"\">Menghai Tea Factory</a>&nbsp;shortly after and technically developed there.<a href=\"https://en.wikipedia.org/wiki/Pu-erh_tea#cite_note-zhangj_menghai-5\" target=\"\" rel=\"\">[5]</a>&nbsp;The legitimacy of shu cha is disputed by some traditionalists in contrast to aged teas. All types of pu-erh can be stored to mature before consumption, which is why it is commonly labelled with year and region of production.','puer','puer');
/*!40000 ALTER TABLE `document_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `is_auth` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `desc` text COLLATE utf8_unicode_ci,
  `keywords` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'price','普洱茶价格','<div>普洱茶，又名<a href=\"http://baike.baidu.com/view/3878552.htm\" target=\"_blank\" rel=\"\">滇青茶</a>，属于<a href=\"http://baike.baidu.com/view/27752.htm\" target=\"_blank\" rel=\"\">黑茶</a>类，因原运销集散地在普洱县，故名普洱茶。</div><div>普洱茶以云南大叶种晒<a href=\"http://baike.baidu.com/view/37239.htm\" target=\"_blank\" rel=\"\">青茶</a>为原料，使用亚发酵青茶制法，从发酵不同分为<a href=\"http://baike.baidu.com/view/159353.htm\" target=\"_blank\" rel=\"\">生茶</a>和<a href=\"http://baike.baidu.com/view/936957.htm\" target=\"_blank\" rel=\"\">熟茶</a>两种，成品分为<a href=\"http://baike.baidu.com/view/7767798.htm\" target=\"_blank\" rel=\"\">散茶</a>和<a href=\"http://baike.baidu.com/view/35174.htm\" target=\"_blank\" rel=\"\">紧压茶</a>两类。</div><div>普洱茶讲究冲泡技巧和品饮艺术，其饮用方法丰富，既可清饮，也可混饮。普洱茶茶汤橙黄浓厚，香气高锐持久，香型独特，滋味浓醇，经久耐泡，冲泡五六次后仍有香味。</div><div>普洱茶主要产于云南省的西双版纳、临沧、普洱等地区。该地具有终年雨水充足、云<a href=\"http://baike.baidu.com/view/10616.htm\" target=\"_blank\" rel=\"\">雾</a>弥漫、土层深厚、土地肥沃、无污染等优势。</div>',0,'2015-11-03 14:19:48','2015-11-03 14:19:48','普洱茶','普洱茶');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fund_sources`
--

DROP TABLE IF EXISTS `fund_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fund_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `extra` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fund_sources`
--

LOCK TABLES `fund_sources` WRITE;
/*!40000 ALTER TABLE `fund_sources` DISABLE KEYS */;
INSERT INTO `fund_sources` VALUES (1,4,1,'icbc','32315454646',0,'2015-09-23 16:19:48','2015-09-23 16:19:48',NULL),(2,4,1,'cmbc','746464654546',0,'2015-09-23 16:20:00','2015-09-23 16:20:00',NULL);
/*!40000 ALTER TABLE `fund_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `id_documents`
--

DROP TABLE IF EXISTS `id_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `id_documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_document_type` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_document_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_bill_type` int(11) DEFAULT NULL,
  `aasm_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_type` int(11) DEFAULT NULL,
  `oraganization` int(11) DEFAULT NULL,
  `faxtel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telphone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `id_documents`
--

LOCK TABLES `id_documents` WRITE;
/*!40000 ALTER TABLE `id_documents` DISABLE KEYS */;
INSERT INTO `id_documents` VALUES (1,0,'李秀秒','320304198302114411',1,'2015-09-21 17:18:51','2015-09-21 17:18:51',NULL,NULL,NULL,NULL,NULL,0,'verified',1,NULL,NULL,NULL),(2,NULL,NULL,NULL,2,'2015-09-21 17:18:51','2015-09-21 17:18:51',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',1,NULL,NULL,NULL),(3,NULL,NULL,NULL,3,'2015-09-21 17:18:51','2015-09-21 17:18:51',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',1,NULL,NULL,NULL),(5,NULL,NULL,NULL,5,'2015-11-04 08:45:00','2015-11-04 08:45:00',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',1,NULL,NULL,NULL),(6,0,'小明','111111111111111111',6,'2015-11-04 09:04:33','2015-11-04 13:55:31','1980-04-01','南京新街口','南京','CN','211100',0,'verified',1,NULL,NULL,NULL),(7,NULL,NULL,NULL,7,'2015-11-04 17:12:36','2015-11-04 17:12:36',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',1,NULL,NULL,NULL),(8,NULL,NULL,NULL,8,'2015-11-05 14:01:29','2015-11-05 14:01:29',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',0,NULL,NULL,NULL),(9,NULL,NULL,NULL,9,'2015-11-05 17:04:28','2015-11-05 17:04:28',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',NULL,NULL,NULL,NULL),(10,NULL,NULL,NULL,10,'2015-11-05 17:06:43','2015-11-05 17:06:43',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',NULL,NULL,NULL,NULL),(11,NULL,NULL,NULL,11,'2015-11-05 17:08:07','2015-11-05 17:08:07',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',NULL,NULL,NULL,NULL),(12,NULL,NULL,NULL,12,'2015-11-05 17:09:42','2015-11-05 17:09:42',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',NULL,NULL,NULL,NULL),(13,NULL,NULL,NULL,13,'2015-11-05 17:10:48','2015-11-05 17:10:48',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',NULL,NULL,NULL,NULL),(14,NULL,NULL,NULL,14,'2015-11-05 17:13:34','2015-11-05 17:13:34',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',NULL,NULL,NULL,NULL),(15,NULL,NULL,NULL,15,'2015-11-06 09:07:42','2015-11-06 09:07:42',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',NULL,NULL,NULL,NULL),(16,NULL,NULL,NULL,16,'2015-11-06 09:14:16','2015-11-06 09:14:16',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',NULL,NULL,NULL,NULL),(17,NULL,NULL,NULL,17,'2015-11-06 09:14:48','2015-11-06 09:14:48',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',NULL,NULL,NULL,NULL),(18,NULL,NULL,NULL,18,'2015-11-06 10:00:51','2015-11-06 10:00:51',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',NULL,NULL,NULL,NULL),(19,NULL,NULL,NULL,19,'2015-11-06 11:16:30','2015-11-06 11:16:30',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',NULL,NULL,NULL,NULL),(20,NULL,NULL,NULL,20,'2015-11-06 11:34:31','2015-11-06 11:34:31',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',NULL,NULL,NULL,NULL),(21,1,'会员大','324324',21,'2015-11-06 11:35:12','2015-11-06 11:35:12',NULL,'32432432',NULL,NULL,'324',NULL,'unverified',1,NULL,'4324','324'),(22,NULL,NULL,NULL,22,'2015-11-06 11:52:02','2015-11-06 11:52:02',NULL,NULL,NULL,NULL,NULL,NULL,'unverified',NULL,NULL,NULL,NULL),(23,1,'反倒是','32432',23,'2015-11-06 11:55:51','2015-11-06 11:55:51',NULL,'43放得开',NULL,NULL,'321',NULL,'unverified',1,NULL,'324','321'),(24,1,'反倒是321321','12321321',24,'2015-11-06 11:58:08','2015-11-06 11:58:08',NULL,'132132131231',NULL,NULL,'21321321',NULL,'unverified',1,NULL,'3213','32132'),(25,1,'大圆银泰','1345643165156',25,'2015-11-06 13:44:26','2015-11-06 13:44:26',NULL,'南京',NULL,NULL,'464445',NULL,'unverified',1,NULL,'464464646','56456444'),(26,1,'普洱茶交易','32432432',26,'2015-11-06 13:45:25','2015-11-06 13:45:25',NULL,'反倒是',NULL,NULL,'432432',NULL,'unverified',0,NULL,'432432','432432'),(27,1,'大圆银泰测试会员','32342432432432432432',27,'2015-11-06 14:07:51','2015-11-06 14:07:51',NULL,'通讯地址',NULL,NULL,'432433',NULL,'unverified',0,NULL,'3432432432','324324324');
/*!40000 ALTER TABLE `id_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identities`
--

DROP TABLE IF EXISTS `identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `retry_count` int(11) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `last_verify_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identities`
--

LOCK TABLES `identities` WRITE;
/*!40000 ALTER TABLE `identities` DISABLE KEYS */;
INSERT INTO `identities` VALUES (1,'admin@peatio.dev','$2a$10$a91X3Hs3afS7PPFBSPKJFe8wdIzzme/Yr47n06gtJcRZsipTWIpA2',1,NULL,NULL,NULL,NULL,'2015-09-21 17:18:51','2015-09-21 17:18:51'),(2,'foo@peatio.dev','$2a$10$ZPFnCx7cb7d8iHdUoRukcOADpyZtiAff2LPAUQm44JPPnXYrHZ.8G',1,NULL,NULL,NULL,NULL,'2015-09-21 17:18:51','2015-09-21 17:18:51'),(3,'bar@peatio.dev','$2a$10$ag4dJxhb/KPj8X2cwG019eaW3axfmHTfZwL/Jbm2JMiOmShzV9bnm',1,NULL,NULL,NULL,NULL,'2015-09-21 17:18:51','2015-09-21 17:18:51'),(5,'54681774@qq.com','$2a$10$3p0XvN3uV1WJto6xbmZDmOdbp8maEX7VEJFqdkHerzCWe4YbAPKBm',NULL,NULL,NULL,NULL,NULL,'2015-11-04 08:45:00','2015-11-04 08:45:00'),(6,'lixiumiao@vip.qq.com','$2a$10$qKFefpMC91fsdIT2IgDziOwiSIYCQNOLzTzoUb0Ygnj2M8roR0i96',NULL,NULL,NULL,NULL,NULL,'2015-11-04 09:04:33','2015-11-06 16:49:15'),(7,'lixiumiao@jsdttec.com','$2a$10$O55vwPiEu/3/PMI8gu4G.eSE.OLnBZq0ySORq2YTTkuLMAH1q8nkm',NULL,NULL,NULL,NULL,NULL,'2015-11-04 17:12:35','2015-11-04 17:12:35'),(8,'lixiumiao@test.com','$2a$10$dZLPMdHPKeGuOMqwXOctyeU9E8N3johorfJlWb8rP1GisRDqZpOPS',NULL,NULL,NULL,NULL,NULL,'2015-11-05 14:01:29','2015-11-05 14:01:29'),(9,'test@test.com','$2a$10$dFvoy1Rzneh/gQm.cfzuB.m1SHkUdCxxXY3UDNW1CUgzZ064gf0Um',NULL,NULL,NULL,NULL,NULL,'2015-11-05 16:51:46','2015-11-05 16:51:46'),(10,'lixiumiao@test1.com','$2a$10$5RydIMp61RyBkbdXFzQe9uowd4QkV8Ld9TkOHd3Db7j5B2FgMQcHG',NULL,NULL,NULL,NULL,NULL,'2015-11-05 17:05:18','2015-11-05 17:05:18'),(11,'lixiumiao@test2.com','$2a$10$kgqJ5bGC18uCSlGhQMMdce8a9Me.WPbCMLAZw5PPX6MarHv4i19dS',NULL,NULL,NULL,NULL,NULL,'2015-11-05 17:07:58','2015-11-05 17:07:58'),(12,'lixiumiao@test3.com','$2a$10$mAvhdWPn.Gnyc/lKIwLoie0qOwKwpOw99DFfMO/6IWxeeMR1XyY.a',NULL,NULL,NULL,NULL,NULL,'2015-11-05 17:09:26','2015-11-05 17:09:26'),(13,'lixiumiao@test4.com','$2a$10$IjiQvfplmcCcfp7WdhERvuWCRLPlDHTRP7VMII4lC5Wb683YYiat2',NULL,NULL,NULL,NULL,NULL,'2015-11-05 17:10:42','2015-11-05 17:10:42'),(14,'lixiumiao@test5.com','$2a$10$ECJaJb.LxfkB7l/oHbUak.jFzd7J71cDj4yUAoLvBAx9Blyk4y1j2',NULL,NULL,NULL,NULL,NULL,'2015-11-05 17:13:31','2015-11-05 17:13:31'),(15,'lixiumiao@test6.com','$2a$10$KXP5DOALCeVpixBJrlGbY.LBfCx0G.y8ox1bYMyiuDPg7/Zpy/Aji',NULL,NULL,NULL,NULL,NULL,'2015-11-06 09:07:28','2015-11-06 09:07:28'),(16,'lixiumiao@test7.com','$2a$10$n/O6hIh94ESoL15VcvUTIuEVT5TyWjNOxXAji0.RtibUuJSFf/CFG',NULL,NULL,NULL,NULL,NULL,'2015-11-06 09:14:14','2015-11-06 09:14:14'),(17,'lixiumiao@test8.com','$2a$10$j3Jm38vEVNG1jmfF0qjktOqrfmxNbN6mHS3NKSmu09EMt2eaRe2Vm',NULL,NULL,NULL,NULL,NULL,'2015-11-06 09:14:46','2015-11-06 09:14:46'),(18,'lixiumiao@test11.com','$2a$10$FcCGiBUReZ.ZpV/YFSjgGed/rGSrs3PuOJzH1ih2MQfETvjzuXc8y',NULL,NULL,NULL,NULL,NULL,'2015-11-06 10:00:48','2015-11-06 10:00:48'),(21,'lixiumiao@qq.com','$2a$10$Be82lurBjDJRDiixjREC.eRk.fcYalVm870TvHUKkS7LvDo2c/NCq',NULL,NULL,NULL,NULL,NULL,'2015-11-06 14:19:35','2015-11-06 17:16:26');
/*!40000 ALTER TABLE `identities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identity_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `activated` tinyint(1) DEFAULT NULL,
  `country_code` int(11) DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `disabled` tinyint(1) DEFAULT '0',
  `api_disabled` tinyint(1) DEFAULT '0',
  `nickname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'PEAN675XN2STIO',NULL,'admin@peatio.dev',NULL,'2015-09-21 17:18:51','2015-09-21 17:18:51',NULL,1,NULL,'13305151138',0,0,NULL),(2,'PEAY2NN4QV4TIO',NULL,'foo@peatio.dev',NULL,'2015-09-21 17:18:51','2015-09-21 17:18:51',NULL,NULL,NULL,NULL,0,0,NULL),(3,'PEAGV7VHRBFTIO',NULL,'bar@peatio.dev',NULL,'2015-09-21 17:18:51','2015-09-21 17:18:51',NULL,NULL,NULL,NULL,0,0,NULL),(5,'PEAPNNNOFNTTIO',NULL,'54681774@qq.com',NULL,'2015-11-04 08:45:00','2015-11-04 08:45:00',NULL,0,NULL,NULL,0,0,NULL),(6,'PEAXQ47G4UITIO','李秀淼','lixiumiao@vip.qq.com',NULL,'2015-11-04 09:04:33','2015-11-04 13:49:23',NULL,1,NULL,NULL,0,0,NULL),(7,'PEAYW6OGL5ATIO',NULL,'lixiumiao@jsdttec.com',NULL,'2015-11-04 17:12:36','2015-11-04 17:12:36',NULL,0,NULL,NULL,0,0,NULL),(8,'PEAIT4WOYD5TIO',NULL,'lixiumiao@test.com',NULL,'2015-11-05 14:01:29','2015-11-05 14:01:29',NULL,0,NULL,NULL,0,0,NULL),(9,'PEAY2KD4VNWTIO',NULL,'test@test.com',NULL,'2015-11-05 16:55:42','2015-11-05 16:55:42',NULL,0,NULL,NULL,0,0,NULL),(10,'PEA6R5BJUAFTIO',NULL,'lixiumiao@test1.com',NULL,'2015-11-05 17:06:41','2015-11-05 17:06:41',NULL,0,NULL,NULL,0,0,NULL),(11,'PEAB256NUL2TIO',NULL,'lixiumiao@test2.com',NULL,'2015-11-05 17:08:05','2015-11-05 17:08:05',NULL,0,NULL,NULL,0,0,NULL),(12,'PEAQ3LMZOPSTIO',NULL,'lixiumiao@test3.com',NULL,'2015-11-05 17:09:40','2015-11-05 17:09:40',NULL,0,NULL,NULL,0,0,NULL),(13,'PEA6ZRHCI4STIO',NULL,'lixiumiao@test4.com',NULL,'2015-11-05 17:10:48','2015-11-05 17:10:48',NULL,0,NULL,NULL,0,0,NULL),(14,'PEAKAKI22KTTIO',NULL,'lixiumiao@test5.com',NULL,'2015-11-05 17:13:33','2015-11-05 17:13:33',NULL,0,NULL,NULL,0,0,NULL),(15,'PEAOE6XAP4ETIO',NULL,'lixiumiao@test6.com',NULL,'2015-11-06 09:07:28','2015-11-06 09:07:28',NULL,0,NULL,NULL,0,0,NULL),(16,'PEA7VOCPP2UTIO',NULL,'lixiumiao@test7.com',NULL,'2015-11-06 09:14:14','2015-11-06 09:14:14',NULL,0,NULL,NULL,0,0,NULL),(17,'PEA3U67WJN2TIO',NULL,'lixiumiao@test8.com',NULL,'2015-11-06 09:14:46','2015-11-06 09:14:46',NULL,0,NULL,NULL,0,0,NULL),(18,'PEAYLOKMLXMTIO',NULL,'lixiumiao@test11.com',NULL,'2015-11-06 10:00:48','2015-11-06 10:00:48',NULL,0,NULL,NULL,0,0,NULL),(19,'PEA6LOGFCKQTIO',NULL,'lixiumiao@test111.com',NULL,'2015-11-06 11:16:26','2015-11-06 11:16:26',NULL,NULL,NULL,NULL,0,0,NULL),(20,'PEAEGBELPOYTIO',NULL,'lixiumiao@test112.com',NULL,'2015-11-06 11:33:52','2015-11-06 11:33:52',NULL,NULL,NULL,NULL,0,0,NULL),(21,'PEAFULRPSCYTIO',NULL,'lixiumiao@111.com',NULL,'2015-11-06 11:35:12','2015-11-06 11:35:12',NULL,NULL,NULL,NULL,0,0,NULL),(22,'PEANICENMIWTIO',NULL,'lixiumiao@fdsfds.com',NULL,'2015-11-06 11:49:53','2015-11-06 11:49:53',NULL,NULL,NULL,NULL,0,0,NULL),(23,'PEAKN66QDUHTIO',NULL,'lixiumiao@fdksjf.com',NULL,'2015-11-06 11:55:42','2015-11-06 11:55:42',NULL,NULL,NULL,NULL,0,0,NULL),(24,'PEAMUC462WYTIO',NULL,'lixiumiao@jdsf.com',NULL,'2015-11-06 11:58:07','2015-11-06 11:58:07',NULL,NULL,NULL,NULL,0,0,NULL),(25,'PEAQO7U4SXKTIO',NULL,'test@jsdttec.com',NULL,'2015-11-06 13:44:20','2015-11-06 13:44:20',NULL,NULL,NULL,NULL,0,0,NULL),(26,'PEAOHR634W4TIO',NULL,'test2@jsdttec.com',NULL,'2015-11-06 13:45:23','2015-11-06 13:45:23',NULL,NULL,NULL,NULL,0,0,NULL),(27,'PEAUBKM2BGOTIO',NULL,'lixiumiao@qq.com',NULL,'2015-11-06 14:07:48','2015-11-06 14:08:23',NULL,1,NULL,NULL,0,0,NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_grants`
--

DROP TABLE IF EXISTS `oauth_access_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_grants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_owner_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_in` int(11) NOT NULL,
  `redirect_uri` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `revoked_at` datetime DEFAULT NULL,
  `scopes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_oauth_access_grants_on_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_grants`
--

LOCK TABLES `oauth_access_grants` WRITE;
/*!40000 ALTER TABLE `oauth_access_grants` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_owner_id` int(11) DEFAULT NULL,
  `application_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `refresh_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expires_in` int(11) DEFAULT NULL,
  `revoked_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `scopes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_oauth_access_tokens_on_token` (`token`),
  UNIQUE KEY `index_oauth_access_tokens_on_refresh_token` (`refresh_token`),
  KEY `index_oauth_access_tokens_on_resource_owner_id` (`resource_owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_applications`
--

DROP TABLE IF EXISTS `oauth_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_oauth_applications_on_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_applications`
--

LOCK TABLES `oauth_applications` WRITE;
/*!40000 ALTER TABLE `oauth_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) DEFAULT NULL,
  `ask` int(11) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `price` decimal(32,16) DEFAULT NULL,
  `volume` decimal(32,16) DEFAULT NULL,
  `origin_volume` decimal(32,16) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `done_at` datetime DEFAULT NULL,
  `type` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ord_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locked` decimal(32,16) DEFAULT NULL,
  `origin_locked` decimal(32,16) DEFAULT NULL,
  `funds_received` decimal(32,16) DEFAULT '0.0000000000000000',
  `trades_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_orders_on_member_id` (`member_id`) USING BTREE,
  KEY `index_orders_on_currency_and_state` (`currency`,`state`) USING BTREE,
  KEY `index_orders_on_state` (`state`),
  KEY `index_orders_on_member_id_and_state` (`member_id`,`state`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,2,3,100.0000000000000000,0.0000000000000000,1.0000000000000000,200,NULL,'OrderBid',4,'2015-09-23 09:34:20','2015-09-23 10:01:28',NULL,'Web','limit',0.0000000000000000,100.0000000000000000,1.0000000000000000,1),(2,1,2,3,1000.0000000000000000,1.0000000000000000,1.0000000000000000,0,NULL,'OrderAsk',1,'2015-09-23 09:38:07','2015-09-23 10:05:59',NULL,'Web','limit',1.0000000000000000,1.0000000000000000,0.0000000000000000,0),(3,1,2,3,111.0000000000000000,0.0000000000000000,1.0000000000000000,200,NULL,'OrderAsk',4,'2015-09-23 10:00:04','2015-09-23 10:25:07',NULL,'Web','limit',0.0000000000000000,1.0000000000000000,111.0000000000000000,1),(4,1,2,3,100.0000000000000000,0.0000000000000000,1.0000000000000000,200,NULL,'OrderAsk',1,'2015-09-23 10:01:12','2015-09-23 10:01:30',NULL,'Web','limit',0.0000000000000000,1.0000000000000000,100.0000000000000000,1),(5,1,2,3,100.0000000000000000,0.0000000000000000,1.0000000000000000,200,NULL,'OrderBid',4,'2015-09-23 10:03:12','2015-09-23 10:03:33',NULL,'Web','limit',0.0000000000000000,100.0000000000000000,1.0000000000000000,1),(6,1,2,3,100.0000000000000000,0.0000000000000000,1.0000000000000000,200,NULL,'OrderAsk',1,'2015-09-23 10:03:23','2015-09-23 10:03:33',NULL,'Web','limit',0.0000000000000000,1.0000000000000000,100.0000000000000000,1),(7,1,2,3,100.0000000000000000,0.0000000000000000,1.0000000000000000,200,NULL,'OrderBid',4,'2015-09-23 10:17:22','2015-09-23 10:17:54',NULL,'Web','limit',0.0000000000000000,100.0000000000000000,1.0000000000000000,1),(8,1,2,3,100.0000000000000000,0.0000000000000000,1.0000000000000000,200,NULL,'OrderAsk',1,'2015-09-23 10:17:31','2015-09-23 10:17:54',NULL,'Web','limit',0.0000000000000000,1.0000000000000000,100.0000000000000000,1),(9,1,2,3,1000.0000000000000000,0.0000000000000000,2.0000000000000000,200,NULL,'OrderAsk',1,'2015-09-23 10:23:31','2015-09-24 11:00:49',NULL,'Web','limit',0.0000000000000000,2.0000000000000000,2000.0000000000000000,2),(10,1,2,3,900.0000000000000000,0.0000000000000000,2.0000000000000000,200,NULL,'OrderBid',4,'2015-09-23 10:23:42','2015-09-23 16:52:29',NULL,'Web','limit',789.0000000000000000,1800.0000000000000000,2.0000000000000000,2),(11,1,2,3,1000.0000000000000000,0.0000000000000000,1.0000000000000000,200,NULL,'OrderBid',4,'2015-09-23 10:24:16','2015-09-23 10:24:26',NULL,'Web','limit',0.0000000000000000,1000.0000000000000000,1.0000000000000000,1),(12,1,2,3,1000.0000000000000000,0.0000000000000000,1.0000000000000000,200,NULL,'OrderAsk',1,'2015-09-23 10:24:53','2015-09-24 16:31:04',NULL,'Web','limit',0.0000000000000000,1.0000000000000000,1000.0000000000000000,1),(13,1,2,3,100.0000000000000000,1.0000000000000000,1.0000000000000000,100,NULL,'OrderBid',4,'2015-09-23 16:26:56','2015-09-23 16:26:56',NULL,'Web','limit',100.0000000000000000,100.0000000000000000,0.0000000000000000,0),(14,1,2,3,120.0000000000000000,2.0000000000000000,2.0000000000000000,100,NULL,'OrderBid',4,'2015-09-23 16:27:23','2015-09-23 16:27:23',NULL,'Web','limit',240.0000000000000000,240.0000000000000000,0.0000000000000000,0),(15,1,2,3,130.0000000000000000,0.0000000000000000,1.0000000000000000,200,NULL,'OrderAsk',1,'2015-09-23 16:51:58','2015-09-23 16:52:31',NULL,'Web','limit',0.0000000000000000,1.0000000000000000,900.0000000000000000,1),(16,1,2,3,910.0000000000000000,0.0000000000000000,1.0000000000000000,200,NULL,'OrderBid',4,'2015-09-23 16:57:25','2015-09-24 11:11:38',NULL,'Web','limit',0.0000000000000000,910.0000000000000000,1.0000000000000000,1),(17,1,2,3,1000.0000000000000000,0.0000000000000000,1.0000000000000000,200,NULL,'OrderBid',4,'2015-09-24 10:59:36','2015-09-24 11:00:45',NULL,'Web','limit',0.0000000000000000,1000.0000000000000000,1.0000000000000000,1),(18,1,2,3,100.0000000000000000,0.0000000000000000,1.0000000000000000,200,NULL,'OrderAsk',4,'2015-09-24 11:11:05','2015-09-24 11:11:42',NULL,'Web','limit',0.0000000000000000,1.0000000000000000,910.0000000000000000,1),(19,1,2,3,1000.0000000000000000,0.0000000000000000,1.0000000000000000,200,NULL,'OrderBid',4,'2015-09-24 16:29:30','2015-09-24 16:31:03',NULL,'Web','limit',0.0000000000000000,1000.0000000000000000,1.0000000000000000,1),(20,1,2,3,1000.0000000000000000,0.0000000000000000,1.0000000000000000,200,NULL,'OrderAsk',4,'2015-09-24 16:30:15','2015-09-24 17:02:38',NULL,'Web','limit',0.0000000000000000,1.0000000000000000,1000.0000000000000000,1),(21,1,2,3,1010.0000000000000000,0.0000000000000000,1.0000000000000000,200,NULL,'OrderBid',4,'2015-09-24 17:02:12','2015-09-24 17:02:36',NULL,'Web','limit',10.0000000000000000,1010.0000000000000000,1.0000000000000000,1),(22,1,2,3,900.0000000000000000,1.0000000000000000,1.0000000000000000,100,NULL,'OrderBid',1,'2015-10-29 10:57:40','2015-10-29 10:57:40',NULL,'Web','limit',900.0000000000000000,900.0000000000000000,0.0000000000000000,0),(23,1,2,3,130.0000000000000000,1.0000000000000000,1.0000000000000000,100,NULL,'OrderBid',1,'2015-10-29 10:59:19','2015-10-29 10:59:19',NULL,'Web','limit',130.0000000000000000,130.0000000000000000,0.0000000000000000,0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partial_trees`
--

DROP TABLE IF EXISTS `partial_trees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partial_trees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proof_id` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `json` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sum` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partial_trees`
--

LOCK TABLES `partial_trees` WRITE;
/*!40000 ALTER TABLE `partial_trees` DISABLE KEYS */;
/*!40000 ALTER TABLE `partial_trees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_addresses`
--

DROP TABLE IF EXISTS `payment_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_addresses`
--

LOCK TABLES `payment_addresses` WRITE;
/*!40000 ALTER TABLE `payment_addresses` DISABLE KEYS */;
INSERT INTO `payment_addresses` VALUES (1,8,'miY3RYxbQpKqeZK18Na1NP4CrcSB2skCgZ','2015-09-22 16:05:44','2015-11-04 10:26:42',2),(2,2,NULL,'2015-09-23 09:30:40','2015-09-23 09:30:40',2),(3,12,NULL,'2015-11-04 14:12:07','2015-11-04 14:12:07',2),(4,16,NULL,'2015-11-05 15:13:29','2015-11-05 15:13:29',2),(5,52,NULL,'2015-11-06 13:45:33','2015-11-06 13:45:33',2),(6,54,NULL,'2015-11-06 14:08:17','2015-11-06 14:08:17',2);
/*!40000 ALTER TABLE `payment_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_transactions`
--

DROP TABLE IF EXISTS `payment_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(32,16) DEFAULT NULL,
  `confirmations` int(11) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `aasm_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `receive_at` datetime DEFAULT NULL,
  `dont_at` datetime DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `type` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_payment_transactions_on_type` (`type`),
  KEY `index_payment_transactions_on_txid_and_txout` (`txid`,`txout`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_transactions`
--

LOCK TABLES `payment_transactions` WRITE;
/*!40000 ALTER TABLE `payment_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proofs`
--

DROP TABLE IF EXISTS `proofs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proofs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `root` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `ready` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sum` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addresses` text COLLATE utf8_unicode_ci,
  `balance` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proofs`
--

LOCK TABLES `proofs` WRITE;
/*!40000 ALTER TABLE `proofs` DISABLE KEYS */;
INSERT INTO `proofs` VALUES (1,'1',2,0,'2015-11-01 14:20:39','2015-11-04 14:20:43','10000','1HjfnJpQmANtuW7yr1ggeDfyfe1kDK7rxx','10000');
/*!40000 ALTER TABLE `proofs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `read_marks`
--

DROP TABLE IF EXISTS `read_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `read_marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `readable_id` int(11) DEFAULT NULL,
  `member_id` int(11) NOT NULL,
  `readable_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_read_marks_on_member_id` (`member_id`),
  KEY `index_read_marks_on_readable_type_and_readable_id` (`readable_type`,`readable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `read_marks`
--

LOCK TABLES `read_marks` WRITE;
/*!40000 ALTER TABLE `read_marks` DISABLE KEYS */;
INSERT INTO `read_marks` VALUES (1,NULL,1,'Comment','2015-09-21 17:18:51'),(2,NULL,1,'Ticket','2015-09-21 17:18:51'),(3,NULL,2,'Comment','2015-09-21 17:18:51'),(4,NULL,2,'Ticket','2015-09-21 17:18:51'),(5,NULL,3,'Comment','2015-09-21 17:18:51'),(6,NULL,3,'Ticket','2015-09-21 17:18:51'),(7,NULL,4,'Comment','2015-09-22 15:04:26'),(8,NULL,4,'Ticket','2015-09-22 15:04:26'),(9,1,4,'Ticket','2015-11-04 08:41:46'),(12,NULL,5,'Comment','2015-11-04 08:45:00'),(13,NULL,5,'Ticket','2015-11-04 08:45:00'),(14,NULL,6,'Comment','2015-11-04 09:04:33'),(15,NULL,6,'Ticket','2015-11-04 09:04:33'),(16,NULL,7,'Comment','2015-11-04 17:12:36'),(17,NULL,7,'Ticket','2015-11-04 17:12:36'),(18,NULL,8,'Comment','2015-11-05 14:01:29'),(19,NULL,8,'Ticket','2015-11-05 14:01:29'),(26,NULL,9,'Comment','2015-11-05 17:04:28'),(27,NULL,9,'Ticket','2015-11-05 17:04:28'),(34,NULL,10,'Comment','2015-11-05 17:06:43'),(35,NULL,10,'Ticket','2015-11-05 17:06:43'),(42,NULL,11,'Comment','2015-11-05 17:08:07'),(43,NULL,11,'Ticket','2015-11-05 17:08:07'),(52,NULL,12,'Comment','2015-11-05 17:09:42'),(53,NULL,12,'Ticket','2015-11-05 17:09:42'),(64,NULL,13,'Comment','2015-11-05 17:10:48'),(65,NULL,13,'Ticket','2015-11-05 17:10:48'),(68,NULL,14,'Comment','2015-11-05 17:13:34'),(69,NULL,14,'Ticket','2015-11-05 17:13:34'),(70,NULL,15,'Comment','2015-11-06 09:07:42'),(71,NULL,15,'Ticket','2015-11-06 09:07:42'),(74,NULL,16,'Comment','2015-11-06 09:14:16'),(75,NULL,16,'Ticket','2015-11-06 09:14:16'),(78,NULL,17,'Comment','2015-11-06 09:14:48'),(79,NULL,17,'Ticket','2015-11-06 09:14:48'),(82,NULL,18,'Comment','2015-11-06 10:00:51'),(83,NULL,18,'Ticket','2015-11-06 10:00:51'),(98,NULL,19,'Comment','2015-11-06 11:16:30'),(99,NULL,19,'Ticket','2015-11-06 11:16:30'),(116,NULL,20,'Comment','2015-11-06 11:34:31'),(117,NULL,20,'Ticket','2015-11-06 11:34:31'),(136,NULL,21,'Comment','2015-11-06 11:35:12'),(137,NULL,21,'Ticket','2015-11-06 11:35:12'),(158,NULL,22,'Comment','2015-11-06 11:52:02'),(159,NULL,22,'Ticket','2015-11-06 11:52:02'),(184,NULL,23,'Comment','2015-11-06 11:55:51'),(185,NULL,23,'Ticket','2015-11-06 11:55:51'),(212,NULL,24,'Comment','2015-11-06 11:58:08'),(213,NULL,24,'Ticket','2015-11-06 11:58:08'),(244,NULL,25,'Comment','2015-11-06 13:44:26'),(245,NULL,25,'Ticket','2015-11-06 13:44:26'),(276,NULL,26,'Comment','2015-11-06 13:45:25'),(277,NULL,26,'Ticket','2015-11-06 13:45:25'),(312,NULL,27,'Comment','2015-11-06 14:07:51'),(313,NULL,27,'Ticket','2015-11-06 14:07:51');
/*!40000 ALTER TABLE `read_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `running_accounts`
--

DROP TABLE IF EXISTS `running_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `running_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` int(11) DEFAULT NULL,
  `income` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000',
  `expenses` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000',
  `currency` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `source_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_running_accounts_on_member_id` (`member_id`),
  KEY `index_running_accounts_on_source_id_and_source_type` (`source_id`,`source_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `running_accounts`
--

LOCK TABLES `running_accounts` WRITE;
/*!40000 ALTER TABLE `running_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `running_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20130624011823'),('20130629015414'),('20130810162023'),('20130901010953'),('20130901154530'),('20130903080937'),('20130904215802'),('20130905025823'),('20130905132250'),('20130906073020'),('20130906073931'),('20130907110146'),('20130907124647'),('20130912144526'),('20130915150504'),('20130918143551'),('20130919091853'),('20130925154257'),('20130925165804'),('20130925171856'),('20130925175113'),('20130926011813'),('20130926014845'),('20130926075355'),('20130926170008'),('20130928080757'),('20130928113620'),('20130928122042'),('20130928165236'),('20130928190156'),('20130928194048'),('20130929012418'),('20130930172651'),('20130930183833'),('20131001103847'),('20131002012809'),('20131002190141'),('20131003003357'),('20131003021225'),('20131006183340'),('20131009132505'),('20131022035138'),('20131027012836'),('20131110214254'),('20131130190923'),('20131201011127'),('20131204020953'),('20131208012814'),('20131224162832'),('20140101175408'),('20140102024125'),('20140102172835'),('20140102172836'),('20140105034746'),('20140302094520'),('20140302094729'),('20140302161905'),('20140303060739'),('20140303080054'),('20140304015055'),('20140306020939'),('20140306021833'),('20140312061206'),('20140312071704'),('20140319022202'),('20140319022302'),('20140320142701'),('20140324060148'),('20140324062812'),('20140326170234'),('20140326191837'),('20140327044440'),('20140327062025'),('20140327065708'),('20140327105217'),('20140328101707'),('20140329070543'),('20140331084541'),('20140402043033'),('20140403031847'),('20140403070840'),('20140404074816'),('20140404101823'),('20140405053744'),('20140407011310'),('20140416143239'),('20140416143352'),('20140416151403'),('20140416194209'),('20140416194300'),('20140418082715'),('20140421061712'),('20140421080408'),('20140428203350'),('20140507120249'),('20140524014413'),('20140530133210'),('20140531054739'),('20140618004355'),('20140702035833'),('20140703065321'),('20140703070953'),('20140707115022'),('20140709084906'),('20140709085158'),('20140712030803'),('20140714143823'),('20140715002401'),('20140715040545'),('20140715083857'),('20140717033231'),('20140718134132'),('20140718141345'),('20140721125900'),('20140724033014'),('20140803202610'),('20140804002557'),('20140804151249'),('20140806141035'),('20140806141419'),('20140819085359'),('20140819090417'),('20140826083906'),('20140826093508'),('20140902112641'),('20140920062130'),('20141002075102'),('20141003040822'),('20141003061259'),('20141010083930'),('20141012124243'),('20141014085101'),('20141015034040'),('20141105023306'),('20141105090746'),('20141107031140'),('20141119155043'),('20141203042029'),('20141216120736'),('20150117151634'),('20150205011423'),('20150405053726'),('20151105064451');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup_histories`
--

DROP TABLE IF EXISTS `signup_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `signup_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accept_language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ua` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_signup_histories_on_member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup_histories`
--

LOCK TABLES `signup_histories` WRITE;
/*!40000 ALTER TABLE `signup_histories` DISABLE KEYS */;
INSERT INTO `signup_histories` VALUES (1,1,'127.0.0.1','en-US,en;q=0.8','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36','2015-09-21 17:19:32'),(2,1,'127.0.0.1','en-US,en;q=0.8','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36','2015-09-22 09:13:36'),(3,1,'127.0.0.1','en-US,en;q=0.8','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36','2015-09-22 09:13:43'),(4,1,'127.0.0.1','en-US,en;q=0.8','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36','2015-09-22 11:54:35'),(5,1,'127.0.0.1','en-US,en;q=0.8','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36','2015-09-22 15:02:59'),(6,4,'127.0.0.1','en-US,en;q=0.8','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36','2015-09-22 15:04:26'),(7,1,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0','2015-09-22 15:23:19'),(8,1,'127.0.0.1','en-US,en;q=0.8','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36','2015-09-23 09:30:31'),(9,4,'127.0.0.1','en-US,en;q=0.8','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36','2015-09-23 09:32:26'),(10,1,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0','2015-09-23 09:35:07'),(11,4,'127.0.0.1','en-US,en;q=0.8,ru;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36','2015-09-23 14:07:52'),(12,1,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0','2015-09-23 16:51:32'),(13,1,'127.0.0.1','en-US,en;q=0.8,ru;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36','2015-09-24 09:09:35'),(14,4,'127.0.0.1','en-US,en;q=0.8,ru;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36','2015-09-24 10:59:10'),(15,1,'127.0.0.1','en-US,en;q=0.8,ru;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36','2015-09-29 10:26:15'),(16,1,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-10-28 08:56:59'),(17,1,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-10-28 08:57:12'),(18,1,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-10-28 09:10:58'),(19,1,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-10-28 09:11:14'),(20,1,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-10-28 09:21:42'),(21,1,'52.68.41.16','zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-10-28 09:40:49'),(22,1,'203.156.211.242','zh-CN,zh;q=0.8','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-10-28 13:28:28'),(23,1,'203.156.211.242','zh-CN,zh;q=0.8','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-10-28 13:28:34'),(24,1,'203.156.211.242','zh-CN,zh;q=0.8','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-10-28 13:29:11'),(25,1,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-10-29 09:32:17'),(26,1,'192.168.30.18','zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-10-29 09:32:52'),(27,1,'24.44.198.143','en-US,en;q=0.8,zh-CN;q=0.6','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-10-29 10:40:55'),(28,1,'24.44.198.143','en-US,en;q=0.8,zh-CN;q=0.6','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-10-29 10:41:17'),(29,4,'24.44.198.143','en-US,en;q=0.8,zh-CN;q=0.6','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-10-29 10:41:42'),(30,1,'203.156.211.242','zh-CN,zh;q=0.8','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-10-29 10:45:23'),(31,1,'203.156.211.242','zh-CN,zh;q=0.8','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-10-29 10:47:42'),(32,1,'24.44.198.143','en-US,en;q=0.8,zh-CN;q=0.6','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-10-29 10:48:50'),(33,1,'52.68.41.16','zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-10-29 10:51:31'),(34,1,'192.168.30.18','zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-10-29 10:55:20'),(35,4,'192.168.30.18','zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3','Mozilla/5.0 (Windows NT 6.1; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-10-29 10:59:13'),(36,4,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-03 13:53:46'),(37,4,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-03 14:10:06'),(38,1,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-03 14:15:44'),(39,1,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-03 16:12:26'),(40,4,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-03 16:21:30'),(41,1,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-11-03 16:49:11'),(42,4,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-04 08:40:44'),(43,5,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-04 08:45:01'),(44,1,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-11-04 08:53:58'),(45,6,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-04 09:04:33'),(46,1,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-11-04 10:30:09'),(47,6,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-04 13:31:09'),(48,1,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-11-04 13:52:37'),(49,7,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-04 17:12:40'),(50,6,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-05 09:26:40'),(51,1,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-05 09:26:54'),(52,8,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-05 14:01:30'),(53,6,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-05 14:07:56'),(54,1,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-05 14:47:09'),(55,9,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-11-05 17:04:38'),(56,10,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-11-05 17:06:43'),(57,11,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-11-05 17:08:08'),(58,12,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-11-05 17:09:42'),(59,13,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-11-05 17:10:48'),(60,14,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-11-05 17:13:34'),(61,1,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-05 17:17:49'),(62,15,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-11-06 09:07:43'),(63,16,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-11-06 09:14:17'),(64,17,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-11-06 09:14:48'),(65,4,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-11-06 09:26:53'),(66,17,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-06 09:32:28'),(67,1,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-06 09:51:27'),(68,18,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-06 10:05:09'),(69,1,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-06 10:05:38'),(70,1,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-06 13:40:14'),(71,1,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-06 15:24:41'),(72,1,'127.0.0.1','zh-CN,zh;q=0.8,zh-TW;q=0.6','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36','2015-11-06 16:34:42'),(73,27,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-11-06 17:16:57'),(74,27,'127.0.0.1','en-US,en;q=0.5','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:41.0) Gecko/20100101 Firefox/41.0','2015-11-06 17:17:29');
/*!40000 ALTER TABLE `signup_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_captcha_data`
--

DROP TABLE IF EXISTS `simple_captcha_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_captcha_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_captcha_data`
--

LOCK TABLES `simple_captcha_data` WRITE;
/*!40000 ALTER TABLE `simple_captcha_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `simple_captcha_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tagger_id` int(11) DEFAULT NULL,
  `tagger_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggings_idx` (`tag_id`,`taggable_id`,`taggable_type`,`context`,`tagger_id`,`tagger_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (1,1,2,'Member',NULL,NULL,'tags','2015-09-21 17:18:51'),(2,2,2,'Member',NULL,NULL,'tags','2015-09-21 17:18:51'),(3,1,3,'Member',NULL,NULL,'tags','2015-09-21 17:18:51'),(4,2,3,'Member',NULL,NULL,'tags','2015-09-21 17:18:51');
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_tags_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (2,'hero'),(1,'vip');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tickets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `aasm_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,'咨询普洱茶','咨询普洱茶？','open',4,'2015-11-04 08:41:46','2015-11-04 08:41:46');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expire_at` datetime DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `is_used` tinyint(1) DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tokens_on_type_and_token_and_expire_at_and_is_used` (`type`,`token`,`expire_at`,`is_used`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (1,'8ed1a0082dcb0a1bb530ae95a6e459dd','2015-09-22 15:33:06',1,0,'Token::Activation','2015-09-22 15:03:06','2015-09-22 15:03:06'),(3,'2ee363a052383d57b6a75f50d0100770','2015-11-04 09:15:01',5,0,'Token::Activation','2015-11-04 08:45:01','2015-11-04 08:45:01'),(4,'b4c6a3644cd1b346756a21e42d22e07a','2015-11-04 09:34:33',6,0,'Token::Activation','2015-11-04 09:04:33','2015-11-04 09:04:33'),(5,'168b45ce90db43bee15607d5b36dcd14','2015-11-04 09:59:40',6,0,'Token::Activation','2015-11-04 09:29:40','2015-11-04 09:29:40'),(6,'42912660c01edd8f154e3e23cbae4646','2015-11-04 10:53:02',6,0,'Token::Activation','2015-11-04 10:23:02','2015-11-04 10:23:02'),(7,'9263afe2a47adc60277d560e602a98ac','2015-11-04 11:02:01',6,0,'Token::Activation','2015-11-04 10:32:01','2015-11-04 10:32:01'),(8,'6398da628fdc5253cf44e2a3a90df728','2015-11-04 11:02:03',6,0,'Token::Activation','2015-11-04 10:32:03','2015-11-04 10:32:03'),(9,'da381a666a0ce8ac9b7810ab5ed22f14','2015-11-04 11:37:58',6,0,'Token::Activation','2015-11-04 11:07:58','2015-11-04 11:07:58'),(10,'30de16791671cccf906c8f137f989668','2015-11-04 11:41:34',6,0,'Token::Activation','2015-11-04 11:11:34','2015-11-04 11:11:34'),(11,'78206229f8501ad742ea082c9fe03023','2015-11-04 11:44:52',6,0,'Token::Activation','2015-11-04 11:14:52','2015-11-04 11:14:52'),(12,'e1f97a045fd3862b7f2c4c28519ebbe7','2015-11-04 11:47:07',6,0,'Token::Activation','2015-11-04 11:17:07','2015-11-04 11:17:07'),(13,'1643c18aa2f26a79d3c8feb180866da5','2015-11-04 12:01:10',6,0,'Token::Activation','2015-11-04 11:31:10','2015-11-04 11:31:10'),(14,'b7c374f984fd645b4c710b87919c82d8','2015-11-04 12:01:47',6,0,'Token::Activation','2015-11-04 11:31:47','2015-11-04 11:31:47'),(15,'120c4ac8b3d07b8d77070891f8b65b78','2015-11-04 12:14:25',6,0,'Token::Activation','2015-11-04 11:44:25','2015-11-04 11:44:25'),(16,'b84f5a09c9a27bc030a631388f44c651','2015-11-04 12:16:38',6,0,'Token::Activation','2015-11-04 11:46:38','2015-11-04 11:46:38'),(17,'96bf2fd9028158ba8976c32aa7781062','2015-11-04 12:18:03',6,0,'Token::Activation','2015-11-04 11:48:03','2015-11-04 11:48:03'),(18,'938da7379f71635f37fa8887fa42d836','2015-11-04 12:22:04',6,0,'Token::Activation','2015-11-04 11:52:04','2015-11-04 11:52:04'),(19,'b8a628f66afa9ff12a9fcda54519e857','2015-11-04 12:22:42',6,0,'Token::Activation','2015-11-04 11:52:42','2015-11-04 11:52:42'),(20,'15591b7984a700f28567e39d24daf2db','2015-11-04 12:22:55',6,0,'Token::Activation','2015-11-04 11:52:55','2015-11-04 11:52:55'),(21,'548ddc9361e56bbdaf4817ede7b7028e','2015-11-04 12:23:48',6,0,'Token::Activation','2015-11-04 11:53:48','2015-11-04 11:53:48'),(22,'6b31d455a61eebd0b7315462746db4c0','2015-11-04 12:24:11',6,0,'Token::Activation','2015-11-04 11:54:11','2015-11-04 11:54:11'),(23,'2515a447e625677dbdc402e3edf8f1fd','2015-11-04 12:29:55',6,0,'Token::Activation','2015-11-04 11:59:55','2015-11-04 11:59:55'),(24,'7ac0e7de5f510e0e607470642d11676b','2015-11-04 13:27:14',6,0,'Token::Activation','2015-11-04 12:57:14','2015-11-04 12:57:14'),(25,'4ff7f49fa73008173e608cf407a00f78','2015-11-04 13:27:35',6,0,'Token::Activation','2015-11-04 12:57:35','2015-11-04 12:57:35'),(26,'f1ccba9e7fe65d7055b888ac350bbb85','2015-11-04 13:28:44',6,0,'Token::Activation','2015-11-04 12:58:44','2015-11-04 12:58:44'),(27,'6448b270ae1a2fda41d432aa8d7832a6','2015-11-04 14:01:19',6,0,'Token::Activation','2015-11-04 13:31:19','2015-11-04 13:31:19'),(28,'cb4a057bd28eed1157ac3bd8492d49e5','2015-11-04 14:01:54',6,0,'Token::Activation','2015-11-04 13:31:54','2015-11-04 13:31:54'),(29,'7323a3d2487ddcdefdf93ded1ca637f7','2015-11-04 14:03:32',6,0,'Token::Activation','2015-11-04 13:33:32','2015-11-04 13:33:32'),(30,'391d954bddbb18252c64c02ff9806273','2015-11-04 14:04:17',6,0,'Token::Activation','2015-11-04 13:34:17','2015-11-04 13:34:17'),(31,'2680f22498ecebbec2eaa3dcf9346ade','2015-11-04 14:04:33',6,0,'Token::Activation','2015-11-04 13:34:33','2015-11-04 13:34:33'),(32,'fdb3303fcb5044165def00df0a5a2ac2','2015-11-04 14:06:07',6,0,'Token::Activation','2015-11-04 13:36:07','2015-11-04 13:36:07'),(33,'fd928013041cf86ce858bf4ec52b4589','2015-11-04 14:07:25',6,0,'Token::Activation','2015-11-04 13:37:25','2015-11-04 13:37:25'),(34,'aaeb91ed89e9eb385a2dd1706b94f4de','2015-11-04 14:14:22',6,1,'Token::Activation','2015-11-04 13:44:22','2015-11-04 13:49:23'),(35,'02a71da2eb6540db33d98f029b03d78b','2015-11-04 17:42:37',7,0,'Token::Activation','2015-11-04 17:12:37','2015-11-04 17:12:37'),(36,'36afba83fdc1112cbea31b4e24d6e900','2015-11-05 14:31:30',8,0,'Token::Activation','2015-11-05 14:01:30','2015-11-05 14:01:30'),(37,'d8c4f3e26feaf87b6ae6f38262890752','2015-11-05 17:34:29',9,0,'Token::Activation','2015-11-05 17:04:29','2015-11-05 17:04:29'),(38,'1a7481292f7dbbf49aa4d24dbbbb8550','2015-11-05 17:36:43',10,0,'Token::Activation','2015-11-05 17:06:43','2015-11-05 17:06:43'),(39,'67fec1b9c59b9461c14933b81d24674f','2015-11-05 17:38:08',11,0,'Token::Activation','2015-11-05 17:08:08','2015-11-05 17:08:08'),(40,'1865715cd9f42e8f60310c0e37529e16','2015-11-05 17:39:42',12,0,'Token::Activation','2015-11-05 17:09:42','2015-11-05 17:09:42'),(41,'88b43963541d5553f1a83031298f137c','2015-11-05 17:40:48',13,0,'Token::Activation','2015-11-05 17:10:48','2015-11-05 17:10:48'),(42,'c20c3e6a9c3b3e3f570d6befee482b53','2015-11-05 17:43:34',14,0,'Token::Activation','2015-11-05 17:13:34','2015-11-05 17:13:34'),(43,'5ba8ee9abdd3c035a7f07eb56fe566d1','2015-11-06 09:37:43',15,0,'Token::Activation','2015-11-06 09:07:43','2015-11-06 09:07:43'),(44,'912ff46606a04d6345730a45176124d7','2015-11-06 09:44:17',16,0,'Token::Activation','2015-11-06 09:14:17','2015-11-06 09:14:17'),(45,'b47b169e084b3f715341d96519159e83','2015-11-06 09:44:48',17,0,'Token::Activation','2015-11-06 09:14:48','2015-11-06 09:14:48'),(46,'e415859e3547945edb4c67ab20980ee4','2015-11-06 10:35:09',18,0,'Token::Activation','2015-11-06 10:05:09','2015-11-06 10:05:09'),(47,'ecbf139897f890d815919675de1ab93b','2015-11-06 14:38:35',27,0,NULL,'2015-11-06 14:08:35','2015-11-06 14:08:35'),(48,'06d129426169109762597c979fd581f6','2015-11-06 17:09:41',27,0,NULL,'2015-11-06 16:39:41','2015-11-06 16:39:41'),(49,'2c9f87c68f1fc0724b92229794ef5d85','2015-11-06 17:13:48',6,1,'Token::ResetPassword','2015-11-06 16:43:48','2015-11-06 16:44:29'),(50,'943fc4da0dd14fc7627f516ca2919cd9','2015-11-06 17:15:48',6,1,'Token::ResetPassword','2015-11-06 16:45:48','2015-11-06 16:47:13'),(51,'26ef450cf5abc1367980d43d785751a6','2015-11-06 17:18:31',6,1,'Token::ResetPassword','2015-11-06 16:48:31','2015-11-06 16:49:13'),(53,'4f9a6c898fbb4d7cca0df169458876bd','2015-11-06 17:22:21',27,0,NULL,'2015-11-06 16:52:22','2015-11-06 16:52:22'),(54,'60bb849d64908f43b21374336d96e95a','2015-11-06 17:22:51',27,1,'Token::ResetPassword','2015-11-06 16:52:51','2015-11-06 16:54:12'),(55,'d1a464a1a4555f156763b185d421e8ae','2015-11-06 17:37:06',27,1,'Token::ResetPassword','2015-11-06 17:07:06','2015-11-06 17:07:44'),(56,'bdaae78429def7c921cb43eadca49033','2015-11-06 17:45:31',27,1,'Token::ResetPassword','2015-11-06 17:15:31','2015-11-06 17:16:24');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trades`
--

DROP TABLE IF EXISTS `trades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(32,16) DEFAULT NULL,
  `volume` decimal(32,16) DEFAULT NULL,
  `ask_id` int(11) DEFAULT NULL,
  `bid_id` int(11) DEFAULT NULL,
  `trend` int(11) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ask_member_id` int(11) DEFAULT NULL,
  `bid_member_id` int(11) DEFAULT NULL,
  `funds` decimal(32,16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_trades_on_currency` (`currency`),
  KEY `index_trades_on_ask_member_id` (`ask_member_id`),
  KEY `index_trades_on_bid_member_id` (`bid_member_id`),
  KEY `index_trades_on_ask_id` (`ask_id`),
  KEY `index_trades_on_bid_id` (`bid_id`),
  KEY `index_trades_on_created_at` (`created_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trades`
--

LOCK TABLES `trades` WRITE;
/*!40000 ALTER TABLE `trades` DISABLE KEYS */;
INSERT INTO `trades` VALUES (1,100.0000000000000000,1.0000000000000000,4,1,1,3,'2015-09-23 10:01:26','2015-09-23 10:01:26',1,4,100.0000000000000000),(2,100.0000000000000000,1.0000000000000000,6,5,1,3,'2015-09-23 10:03:30','2015-09-23 10:03:30',1,4,100.0000000000000000),(3,100.0000000000000000,1.0000000000000000,8,7,1,3,'2015-09-23 10:17:47','2015-09-23 10:17:47',1,4,100.0000000000000000),(4,1000.0000000000000000,1.0000000000000000,9,11,1,3,'2015-09-23 10:24:24','2015-09-23 10:24:24',1,4,1000.0000000000000000),(5,111.0000000000000000,1.0000000000000000,3,10,0,3,'2015-09-23 10:24:52','2015-09-23 10:24:52',4,4,111.0000000000000000),(6,900.0000000000000000,1.0000000000000000,15,10,1,3,'2015-09-23 16:52:19','2015-09-23 16:52:19',1,4,900.0000000000000000),(7,1000.0000000000000000,1.0000000000000000,9,17,1,3,'2015-09-24 11:00:28','2015-09-24 11:00:28',1,4,1000.0000000000000000),(8,910.0000000000000000,1.0000000000000000,18,16,0,3,'2015-09-24 11:11:28','2015-09-24 11:11:28',4,4,910.0000000000000000),(9,1000.0000000000000000,1.0000000000000000,12,19,1,3,'2015-09-24 16:30:18','2015-09-24 16:30:18',1,4,1000.0000000000000000),(10,1000.0000000000000000,1.0000000000000000,20,21,1,3,'2015-09-24 17:02:31','2015-09-24 17:02:31',4,4,1000.0000000000000000);
/*!40000 ALTER TABLE `trades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `two_factors`
--

DROP TABLE IF EXISTS `two_factors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `two_factors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `otp_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_verify_at` datetime DEFAULT NULL,
  `activated` tinyint(1) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `refreshed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `two_factors`
--

LOCK TABLES `two_factors` WRITE;
/*!40000 ALTER TABLE `two_factors` DISABLE KEYS */;
INSERT INTO `two_factors` VALUES (1,1,'5tmwm5hdxeguwlz3','2015-09-22 15:44:39',1,'TwoFactor::App','2015-09-21 17:18:51'),(2,1,'474827','2015-09-22 15:45:29',1,'TwoFactor::Sms','2015-09-22 15:59:43'),(3,2,'asnwxgm6m7ermmc6',NULL,NULL,'TwoFactor::App','2015-09-21 17:18:51'),(4,2,'021542',NULL,NULL,'TwoFactor::Sms','2015-09-21 17:18:51'),(5,3,'ps3a77y6pav633m5',NULL,NULL,'TwoFactor::App','2015-09-21 17:18:51'),(6,3,'761075',NULL,NULL,'TwoFactor::Sms','2015-09-21 17:18:51'),(7,4,'120113','2015-09-22 16:08:59',1,'TwoFactor::Sms','2015-09-22 15:04:26'),(8,4,'w5a275evh2wlguko','2015-09-22 16:08:57',1,'TwoFactor::App','2015-09-22 15:04:26'),(9,5,'311464',NULL,NULL,'TwoFactor::Sms','2015-11-04 08:45:01'),(10,5,'5hyn7eaf4yyvtizm',NULL,NULL,'TwoFactor::App','2015-11-04 08:45:01'),(11,6,'335859',NULL,NULL,'TwoFactor::Sms','2015-11-04 09:04:33'),(12,6,'wtzyd6d3oy46vwxq','2015-11-04 14:06:56',1,'TwoFactor::App','2015-11-04 09:04:34'),(13,7,'974907',NULL,NULL,'TwoFactor::Sms','2015-11-04 17:12:40'),(14,7,'csnql23m4nybqx2z',NULL,NULL,'TwoFactor::App','2015-11-04 17:12:41'),(15,8,'274978',NULL,NULL,'TwoFactor::Sms','2015-11-05 15:13:29'),(16,8,'makjazzwfpcqlblz',NULL,NULL,'TwoFactor::App','2015-11-05 15:13:29'),(17,9,'278457',NULL,NULL,'TwoFactor::Sms','2015-11-05 17:04:38'),(18,9,'crv2paotfzfbk4xa',NULL,NULL,'TwoFactor::App','2015-11-05 17:04:38'),(19,10,'261667',NULL,NULL,'TwoFactor::Sms','2015-11-05 17:06:43'),(20,10,'i3abzmu7qw5w7lio',NULL,NULL,'TwoFactor::App','2015-11-05 17:06:43'),(21,11,'617266',NULL,NULL,'TwoFactor::Sms','2015-11-05 17:08:08'),(22,11,'rgdv5hekx7v5ni2o',NULL,NULL,'TwoFactor::App','2015-11-05 17:08:08'),(23,12,'399937',NULL,NULL,'TwoFactor::Sms','2015-11-05 17:09:42'),(24,12,'mhl3xpyg335jvpkr',NULL,NULL,'TwoFactor::App','2015-11-05 17:09:42'),(25,14,'929070',NULL,NULL,'TwoFactor::Sms','2015-11-05 17:13:41'),(26,14,'vhnezj422t5vxzps',NULL,NULL,'TwoFactor::App','2015-11-05 17:13:41'),(27,15,'742305',NULL,NULL,'TwoFactor::Sms','2015-11-06 09:07:44'),(28,15,'dxva72uijzbi34lc',NULL,NULL,'TwoFactor::App','2015-11-06 09:07:44'),(29,16,'192359',NULL,NULL,'TwoFactor::Sms','2015-11-06 09:14:17'),(30,16,'kmi3nykvnq6l4mul',NULL,NULL,'TwoFactor::App','2015-11-06 09:14:17'),(31,17,'676974',NULL,NULL,'TwoFactor::Sms','2015-11-06 09:14:48'),(32,17,'tyabghevzd7l4rjq',NULL,NULL,'TwoFactor::App','2015-11-06 09:14:48'),(33,18,'053395',NULL,NULL,'TwoFactor::Sms','2015-11-06 10:05:10'),(34,18,'5piiethxgoxiwiiy',NULL,NULL,'TwoFactor::App','2015-11-06 10:05:10'),(35,26,'839315',NULL,NULL,'TwoFactor::Sms','2015-11-06 13:45:33'),(36,26,'nthfyz55pp6hwlor',NULL,NULL,'TwoFactor::App','2015-11-06 13:45:33'),(37,27,'730476',NULL,NULL,'TwoFactor::Sms','2015-11-06 14:08:17'),(38,27,'oygplvlndngic233',NULL,NULL,'TwoFactor::App','2015-11-06 14:08:17');
/*!40000 ALTER TABLE `two_factors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `item_id` int(11) NOT NULL,
  `event` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `whodunnit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_versions_on_item_type_and_item_id` (`item_type`,`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,'Deposit',1,'update','1','---\nid: 1\naccount_id: 7\nmember_id: 4\ncurrency: 1\namount: 10000.0\nfee: 0.0\nfund_uid: \'32315454646\'\nfund_extra: icbc\ntxid: \nstate: \naasm_state: submitting\ncreated_at: 2015-11-03 08:25:26.000000000 Z\nupdated_at: 2015-11-03 08:25:26.000000000 Z\ndone_at: \nconfirmations: \ntype: Deposits::Bank\npayment_transaction_id: \ntxout: \n','2015-11-03 16:50:51'),(2,'Deposit',1,'update','1','---\nid: 1\naccount_id: 7\nmember_id: 4\ncurrency: 1\namount: 10000.0\nfee: 0.0\nfund_uid: \'32315454646\'\nfund_extra: icbc\ntxid: \nstate: \naasm_state: submitted\ncreated_at: 2015-11-03 08:25:26.000000000 Z\nupdated_at: 2015-11-03 08:50:51.000000000 Z\ndone_at: \nconfirmations: \ntype: Deposits::Bank\npayment_transaction_id: \ntxout: \n','2015-11-03 16:50:52'),(3,'Deposit',1,'update','1','---\nid: 1\naccount_id: 7\nmember_id: 4\ncurrency: 1\namount: 10000.0\nfee: 0.0\nfund_uid: \'32315454646\'\nfund_extra: icbc\ntxid: \nstate: \naasm_state: accepted\ncreated_at: 2015-11-03 08:25:26.000000000 Z\nupdated_at: 2015-11-03 08:50:52.156982179 Z\ndone_at: 2015-11-03 08:50:52.156982179 Z\nconfirmations: \ntype: Deposits::Bank\npayment_transaction_id: \ntxout: \n','2015-11-03 16:50:52');
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `withdraws`
--

DROP TABLE IF EXISTS `withdraws`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `withdraws` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `currency` int(11) DEFAULT NULL,
  `amount` decimal(32,16) DEFAULT NULL,
  `fee` decimal(32,16) DEFAULT NULL,
  `fund_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fund_extra` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `done_at` datetime DEFAULT NULL,
  `txid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aasm_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sum` decimal(32,16) NOT NULL DEFAULT '0.0000000000000000',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `withdraws`
--

LOCK TABLES `withdraws` WRITE;
/*!40000 ALTER TABLE `withdraws` DISABLE KEYS */;
/*!40000 ALTER TABLE `withdraws` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-06 18:03:31
