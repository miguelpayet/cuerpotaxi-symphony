-- MySQL dump 10.15  Distrib 10.0.27-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cuerpotaxi
-- ------------------------------------------------------
-- Server version	10.0.27-MariaDB-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sym_authors`
--

DROP TABLE IF EXISTS `sym_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_authors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_seen` datetime DEFAULT '0000-00-00 00:00:00',
  `user_type` enum('author','manager','developer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'author',
  `primary` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_token_active` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `language` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_authors`
--

LOCK TABLES `sym_authors` WRITE;
/*!40000 ALTER TABLE `sym_authors` DISABLE KEYS */;
INSERT INTO `sym_authors` VALUES (1,'admin','PBKDF2v1|10000|cdb9e5571e92620a5eb6|ijWZ0ehPmQZG3vC0vWZTZbDZV/i+s3rfyLiJ0RZqbXDefmNnTwg28A==','Miguel','Payet','miguelpayet@gmail.com','2016-11-03 13:38:09','developer','yes',NULL,'no',NULL);
/*!40000 ALTER TABLE `sym_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_cache`
--

DROP TABLE IF EXISTS `sym_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_cache` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `creation` int(14) NOT NULL DEFAULT '0',
  `expiry` int(14) unsigned DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash` (`hash`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_cache`
--

LOCK TABLES `sym_cache` WRITE;
/*!40000 ALTER TABLE `sym_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries`
--

DROP TABLE IF EXISTS `sym_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `creation_date_gmt` datetime NOT NULL,
  `modification_date` datetime NOT NULL,
  `modification_date_gmt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `author_id` (`author_id`),
  KEY `creation_date` (`creation_date`),
  KEY `creation_date_gmt` (`creation_date_gmt`),
  KEY `modification_date` (`modification_date`),
  KEY `modification_date_gmt` (`modification_date_gmt`)
) ENGINE=MyISAM AUTO_INCREMENT=300 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries`
--

LOCK TABLES `sym_entries` WRITE;
/*!40000 ALTER TABLE `sym_entries` DISABLE KEYS */;
INSERT INTO `sym_entries` VALUES (298,1,1,'2016-11-03 08:51:05','2016-11-03 13:51:05','2016-11-03 08:51:05','2016-11-03 13:51:05'),(299,1,1,'2016-11-03 12:50:10','2016-11-03 17:50:10','2016-11-03 12:50:10','2016-11-03 17:50:10');
/*!40000 ALTER TABLE `sym_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_1`
--

DROP TABLE IF EXISTS `sym_entries_data_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=643 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_1`
--

LOCK TABLES `sym_entries_data_1` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_1` DISABLE KEYS */;
INSERT INTO `sym_entries_data_1` VALUES (641,298,'hola','hola'),(642,299,'floripondio','floripondio');
/*!40000 ALTER TABLE `sym_entries_data_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_2`
--

DROP TABLE IF EXISTS `sym_entries_data_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `value_formatted` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=639 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_2`
--

LOCK TABLES `sym_entries_data_2` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_2` DISABLE KEYS */;
INSERT INTO `sym_entries_data_2` VALUES (638,298,'hola','<p>hola</p>\n');
/*!40000 ALTER TABLE `sym_entries_data_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_4`
--

DROP TABLE IF EXISTS `sym_entries_data_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) unsigned DEFAULT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_4`
--

LOCK TABLES `sym_entries_data_4` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_4` DISABLE KEYS */;
INSERT INTO `sym_entries_data_4` VALUES (1,299,'dsc_3685.jpeg',104257,'image/jpeg','a:3:{s:8:\"creation\";s:25:\"2016-11-03T12:50:10-05:00\";s:5:\"width\";i:640;s:6:\"height\";i:427;}');
/*!40000 ALTER TABLE `sym_entries_data_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_5`
--

DROP TABLE IF EXISTS `sym_entries_data_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `res_id` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_oembed_xml` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumbnail_url` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oembed_xml` text COLLATE utf8_unicode_ci,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `driver` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_5`
--

LOCK TABLES `sym_entries_data_5` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_5` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_entries_data_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_extensions`
--

DROP TABLE IF EXISTS `sym_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_extensions`
--

LOCK TABLES `sym_extensions` WRITE;
/*!40000 ALTER TABLE `sym_extensions` DISABLE KEYS */;
INSERT INTO `sym_extensions` VALUES (1,'debugdevkit','enabled','1.3.3'),(2,'export_ensemble','enabled','2.2.0'),(3,'jit_image_manipulation','enabled','1.44'),(4,'maintenance_mode','enabled','1.9.1'),(5,'markdown','enabled','1.21'),(6,'profiledevkit','enabled','1.5.2'),(7,'selectbox_link_field','enabled','1.34'),(8,'xssfilter','enabled','1.4.2'),(9,'order_entries','enabled','2.2.1'),(10,'oembed_field','enabled','1.10.0');
/*!40000 ALTER TABLE `sym_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_extensions_delegates`
--

DROP TABLE IF EXISTS `sym_extensions_delegates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_extensions_delegates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) NOT NULL,
  `page` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `delegate` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `callback` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_id` (`extension_id`),
  KEY `page` (`page`),
  KEY `delegate` (`delegate`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_extensions_delegates`
--

LOCK TABLES `sym_extensions_delegates` WRITE;
/*!40000 ALTER TABLE `sym_extensions_delegates` DISABLE KEYS */;
INSERT INTO `sym_extensions_delegates` VALUES (1,1,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),(2,1,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),(24,2,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),(25,3,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),(31,4,'/blueprints/pages/','AppendPageContent','__appendType'),(30,4,'/backend/','AppendPageAlert','__appendAlert'),(29,4,'/system/preferences/','CustomActions','__toggleMaintenanceMode'),(28,4,'/system/preferences/','Save','__SavePreferences'),(27,4,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),(13,6,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),(14,6,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),(37,8,'/frontend/','EventPreSaveFilter','eventPreSaveFilter'),(36,8,'/blueprints/events/edit/','AppendEventFilter','appendEventFilter'),(35,8,'/blueprints/events/new/','AppendEventFilter','appendEventFilter'),(34,8,'/blueprints/events/','AppendEventFilterDocumentation','appendEventFilterDocumentation'),(20,9,'/backend/','InitaliseAdminPageHead','prepareIndex'),(21,9,'/backend/','AdminPagePreGenerate','adjustTable'),(22,9,'/backend/','AdminPagePostGenerate','resetPagination'),(23,9,'/frontend/','DataSourcePreExecute','saveFilterContext'),(26,3,'/system/preferences/','Save','__SavePreferences'),(32,4,'/frontend/','FrontendPrePageResolve','__checkForMaintenanceMode'),(33,4,'/frontend/','FrontendParamsResolve','__addParam'),(38,8,'/frontend/','FrontendParamsResolve','frontendParamsResolve'),(41,10,'/backend/','InitaliseAdminPageHead','appendJS'),(42,10,'*','AppendContentType','appendContentType');
/*!40000 ALTER TABLE `sym_extensions_delegates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields`
--

DROP TABLE IF EXISTS `sym_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `element_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `parent_section` int(11) NOT NULL DEFAULT '0',
  `required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `location` enum('main','sidebar') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'main',
  `show_column` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `index` (`element_name`,`type`,`parent_section`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields`
--

LOCK TABLES `sym_fields` WRITE;
/*!40000 ALTER TABLE `sym_fields` DISABLE KEYS */;
INSERT INTO `sym_fields` VALUES (1,'titulo','titulo','input',1,'yes',0,'main','yes'),(2,'texto','texto','textarea',1,'no',1,'main','no'),(4,'imagen','imagen','upload',1,'no',2,'main','yes'),(5,'video','video','oembed',1,'no',3,'main','no');
/*!40000 ALTER TABLE `sym_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_author`
--

DROP TABLE IF EXISTS `sym_fields_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `author_types` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_author`
--

LOCK TABLES `sym_fields_author` WRITE;
/*!40000 ALTER TABLE `sym_fields_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_checkbox`
--

DROP TABLE IF EXISTS `sym_fields_checkbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_checkbox`
--

LOCK TABLES `sym_fields_checkbox` WRITE;
/*!40000 ALTER TABLE `sym_fields_checkbox` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_checkbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_date`
--

DROP TABLE IF EXISTS `sym_fields_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calendar` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `time` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_date`
--

LOCK TABLES `sym_fields_date` WRITE;
/*!40000 ALTER TABLE `sym_fields_date` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_input`
--

DROP TABLE IF EXISTS `sym_fields_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_input`
--

LOCK TABLES `sym_fields_input` WRITE;
/*!40000 ALTER TABLE `sym_fields_input` DISABLE KEYS */;
INSERT INTO `sym_fields_input` VALUES (9,1,NULL);
/*!40000 ALTER TABLE `sym_fields_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_oembed`
--

DROP TABLE IF EXISTS `sym_fields_oembed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_oembed` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `refresh` int(11) unsigned DEFAULT NULL,
  `driver` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `unique` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `thumbs` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `query_params` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `force_ssl` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `unique_media` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_oembed`
--

LOCK TABLES `sym_fields_oembed` WRITE;
/*!40000 ALTER TABLE `sym_fields_oembed` DISABLE KEYS */;
INSERT INTO `sym_fields_oembed` VALUES (3,5,NULL,'Twitter,Vimeo,YouTube','no','yes',NULL,'no','no');
/*!40000 ALTER TABLE `sym_fields_oembed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_order_entries`
--

DROP TABLE IF EXISTS `sym_fields_order_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_order_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `force_sort` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `hide` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `disable_pagination` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `filtered_fields` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_order_entries`
--

LOCK TABLES `sym_fields_order_entries` WRITE;
/*!40000 ALTER TABLE `sym_fields_order_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_order_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_select`
--

DROP TABLE IF EXISTS `sym_fields_select`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `sort_options` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_select`
--

LOCK TABLES `sym_fields_select` WRITE;
/*!40000 ALTER TABLE `sym_fields_select` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_select` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_selectbox_link`
--

DROP TABLE IF EXISTS `sym_fields_selectbox_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `hide_when_prepopulated` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_selectbox_link`
--

LOCK TABLES `sym_fields_selectbox_link` WRITE;
/*!40000 ALTER TABLE `sym_fields_selectbox_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_selectbox_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_taglist`
--

DROP TABLE IF EXISTS `sym_fields_taglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_taglist`
--

LOCK TABLES `sym_fields_taglist` WRITE;
/*!40000 ALTER TABLE `sym_fields_taglist` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_taglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_textarea`
--

DROP TABLE IF EXISTS `sym_fields_textarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_textarea`
--

LOCK TABLES `sym_fields_textarea` WRITE;
/*!40000 ALTER TABLE `sym_fields_textarea` DISABLE KEYS */;
INSERT INTO `sym_fields_textarea` VALUES (9,2,'markdown',15);
/*!40000 ALTER TABLE `sym_fields_textarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_upload`
--

DROP TABLE IF EXISTS `sym_fields_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_upload`
--

LOCK TABLES `sym_fields_upload` WRITE;
/*!40000 ALTER TABLE `sym_fields_upload` DISABLE KEYS */;
INSERT INTO `sym_fields_upload` VALUES (6,4,'/workspace','/\\.(?:bmp|gif|jpe?g|png)$/i');
/*!40000 ALTER TABLE `sym_fields_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_forgotpass`
--

DROP TABLE IF EXISTS `sym_forgotpass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_forgotpass` (
  `author_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `expiry` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_forgotpass`
--

LOCK TABLES `sym_forgotpass` WRITE;
/*!40000 ALTER TABLE `sym_forgotpass` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_forgotpass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_pages`
--

DROP TABLE IF EXISTS `sym_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_sources` text COLLATE utf8_unicode_ci,
  `events` text COLLATE utf8_unicode_ci,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_pages`
--

LOCK TABLES `sym_pages` WRITE;
/*!40000 ALTER TABLE `sym_pages` DISABLE KEYS */;
INSERT INTO `sym_pages` VALUES (1,NULL,'Blog','blog',NULL,'handle','entries,entries_todos,jit_image_manipulation_recipes,entry_anterior,entry_siguiente',NULL,1);
/*!40000 ALTER TABLE `sym_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_pages_types`
--

DROP TABLE IF EXISTS `sym_pages_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_pages_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_pages_types`
--

LOCK TABLES `sym_pages_types` WRITE;
/*!40000 ALTER TABLE `sym_pages_types` DISABLE KEYS */;
INSERT INTO `sym_pages_types` VALUES (5,1,'index');
/*!40000 ALTER TABLE `sym_pages_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_sections`
--

DROP TABLE IF EXISTS `sym_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `filter` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `navigation_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Content',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_sections`
--

LOCK TABLES `sym_sections` WRITE;
/*!40000 ALTER TABLE `sym_sections` DISABLE KEYS */;
INSERT INTO `sym_sections` VALUES (1,'Entries','entries',1,'no','no','Content');
/*!40000 ALTER TABLE `sym_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_sections_association`
--

DROP TABLE IF EXISTS `sym_sections_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_sections_association` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_section_id` int(11) unsigned NOT NULL,
  `parent_section_field_id` int(11) unsigned DEFAULT NULL,
  `child_section_id` int(11) unsigned NOT NULL,
  `child_section_field_id` int(11) unsigned NOT NULL,
  `hide_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `interface` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editor` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_section_id` (`parent_section_id`,`child_section_id`,`child_section_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_sections_association`
--

LOCK TABLES `sym_sections_association` WRITE;
/*!40000 ALTER TABLE `sym_sections_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_sections_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_sessions`
--

DROP TABLE IF EXISTS `sym_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_sessions` (
  `session` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `session_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session`),
  KEY `session_expires` (`session_expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_sessions`
--

LOCK TABLES `sym_sessions` WRITE;
/*!40000 ALTER TABLE `sym_sessions` DISABLE KEYS */;
INSERT INTO `sym_sessions` VALUES ('gnd7olo0ogsoo7o3dind0q5523',1478142503,'sym-|a:3:{s:10:\"xsrf-token\";s:27:\"xYvf6jv2OLaJGQtq8ALgvNeUX88\";s:8:\"username\";s:5:\"admin\";s:4:\"pass\";s:92:\"PBKDF2v1|10000|cdb9e5571e92620a5eb6|ijWZ0ehPmQZG3vC0vWZTZbDZV/i+s3rfyLiJ0RZqbXDefmNnTwg28A==\";}'),('pbgqb0cut2oinhhhsm7pnhdpt4',1478198289,'sym-|a:3:{s:10:\"xsrf-token\";s:27:\"kAGdjGDmGrmYW5jfrg3oL9R0Fn8\";s:8:\"username\";s:5:\"admin\";s:4:\"pass\";s:92:\"PBKDF2v1|10000|cdb9e5571e92620a5eb6|ijWZ0ehPmQZG3vC0vWZTZbDZV/i+s3rfyLiJ0RZqbXDefmNnTwg28A==\";}');
/*!40000 ALTER TABLE `sym_sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-03 13:39:42
