/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.6.24-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tejados_db
-- ------------------------------------------------------
-- Server version	10.6.24-MariaDB-ubu2204

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
-- Table structure for table `backend_access_log`
--

DROP TABLE IF EXISTS `backend_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `backend_access_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_access_log`
--

LOCK TABLES `backend_access_log` WRITE;
/*!40000 ALTER TABLE `backend_access_log` DISABLE KEYS */;
INSERT INTO `backend_access_log` VALUES (1,1,'172.24.0.1','2026-02-08 10:30:19','2026-02-08 10:30:19');
/*!40000 ALTER TABLE `backend_access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_groups`
--

DROP TABLE IF EXISTS `backend_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `backend_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_groups`
--

LOCK TABLES `backend_user_groups` WRITE;
/*!40000 ALTER TABLE `backend_user_groups` DISABLE KEYS */;
INSERT INTO `backend_user_groups` VALUES (1,'Owners','owners','Default group for website owners.',0,'2026-02-08 08:41:30','2026-02-08 08:41:30');
/*!40000 ALTER TABLE `backend_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_preferences`
--

DROP TABLE IF EXISTS `backend_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `backend_user_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `namespace` varchar(100) NOT NULL,
  `group` varchar(50) NOT NULL,
  `item` varchar(150) NOT NULL,
  `value` text DEFAULT NULL,
  `site_id` int(10) unsigned DEFAULT NULL,
  `site_root_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_preferences`
--

LOCK TABLES `backend_user_preferences` WRITE;
/*!40000 ALTER TABLE `backend_user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `backend_user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_roles`
--

DROP TABLE IF EXISTS `backend_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `backend_user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `color_background` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `permissions` mediumtext DEFAULT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_unique` (`name`),
  KEY `role_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_roles`
--

LOCK TABLES `backend_user_roles` WRITE;
/*!40000 ALTER TABLE `backend_user_roles` DISABLE KEYS */;
INSERT INTO `backend_user_roles` VALUES (1,'Developer','developer','#3498db','Site administrator with access to developer tools.','',1,1,'2026-02-08 08:41:30','2026-02-08 08:41:30'),(2,'Publisher','publisher','#1abc9c','Site editor with access to publishing tools.','',1,2,'2026-02-08 08:41:30','2026-02-08 08:41:30');
/*!40000 ALTER TABLE `backend_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_user_throttle`
--

DROP TABLE IF EXISTS `backend_user_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `backend_user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT 0,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT 0,
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_throttle`
--

LOCK TABLES `backend_user_throttle` WRITE;
/*!40000 ALTER TABLE `backend_user_throttle` DISABLE KEYS */;
INSERT INTO `backend_user_throttle` VALUES (1,1,'172.24.0.1',0,NULL,0,NULL,0,NULL);
/*!40000 ALTER TABLE `backend_user_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_users`
--

DROP TABLE IF EXISTS `backend_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `backend_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `login` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `persist_code` varchar(255) DEFAULT NULL,
  `reset_password_code` varchar(255) DEFAULT NULL,
  `permissions` mediumtext DEFAULT NULL,
  `is_activated` tinyint(1) NOT NULL DEFAULT 0,
  `is_superuser` tinyint(1) NOT NULL DEFAULT 0,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `role_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_password_expired` tinyint(1) NOT NULL DEFAULT 0,
  `password_changed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`),
  KEY `admin_role_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_users`
--

LOCK TABLES `backend_users` WRITE;
/*!40000 ALTER TABLE `backend_users` DISABLE KEYS */;
INSERT INTO `backend_users` VALUES (1,'Admin','Admin','Admin','Alejandrocayero93@gmail.com','$2y$10$OxOWH0gJfCN7cmxqTcQbie9D4kilqrnsTiK8CUw3o6cYeSvFBhwjO',NULL,'$2y$10$ZNzzC5La98xzYhgGXYooTujzoq34EB3jps0LIlHGgDt4szI7aDB6a',NULL,'',1,1,NULL,'2026-02-08 10:30:19',NULL,1,'2026-02-08 08:42:18','2026-02-08 10:30:19',0,'2026-02-08 08:42:18');
/*!40000 ALTER TABLE `backend_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backend_users_groups`
--

DROP TABLE IF EXISTS `backend_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `backend_users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_users_groups`
--

LOCK TABLES `backend_users_groups` WRITE;
/*!40000 ALTER TABLE `backend_users_groups` DISABLE KEYS */;
INSERT INTO `backend_users_groups` VALUES (1,1);
/*!40000 ALTER TABLE `backend_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme_data`
--

DROP TABLE IF EXISTS `cms_theme_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_theme_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(255) DEFAULT NULL,
  `data` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme_data`
--

LOCK TABLES `cms_theme_data` WRITE;
/*!40000 ALTER TABLE `cms_theme_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme_logs`
--

DROP TABLE IF EXISTS `cms_theme_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_theme_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `template` varchar(255) DEFAULT NULL,
  `old_template` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `old_content` longtext DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_logs_type_index` (`type`),
  KEY `cms_theme_logs_theme_index` (`theme`),
  KEY `cms_theme_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme_logs`
--

LOCK TABLES `cms_theme_logs` WRITE;
/*!40000 ALTER TABLE `cms_theme_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_theme_templates`
--

DROP TABLE IF EXISTS `cms_theme_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_theme_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `file_size` int(10) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_templates_source_index` (`source`),
  KEY `cms_theme_templates_path_index` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_theme_templates`
--

LOCK TABLES `cms_theme_templates` WRITE;
/*!40000 ALTER TABLE `cms_theme_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_theme_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_dashboards`
--

DROP TABLE IF EXISTS `dashboard_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_dashboards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `owner_type` varchar(255) DEFAULT NULL,
  `owner_field` varchar(255) DEFAULT NULL,
  `definition` mediumtext DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT 0,
  `is_global` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) DEFAULT NULL,
  `updated_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_user_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_interval_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `is_system` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_dashboards`
--

LOCK TABLES `dashboard_dashboards` WRITE;
/*!40000 ALTER TABLE `dashboard_dashboards` DISABLE KEYS */;
INSERT INTO `dashboard_dashboards` VALUES (1,'System Dashboard','system','ph ph-globe','Dashboard\\Controllers\\Index','system',NULL,0,1,1,1,1,'2026-02-08 08:42:18','2026-02-08 08:42:18',0,1);
/*!40000 ALTER TABLE `dashboard_dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_report_data_cache`
--

DROP TABLE IF EXISTS `dashboard_report_data_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_report_data_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `value_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_report_data_cache_created_at_index` (`created_at`),
  KEY `dashboard_report_data_cache_key_value_date_index` (`key`,`value_date`),
  KEY `dashboard_report_data_cache_key_index` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_report_data_cache`
--

LOCK TABLES `dashboard_report_data_cache` WRITE;
/*!40000 ALTER TABLE `dashboard_report_data_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_report_data_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_traffic_stats_pageviews`
--

DROP TABLE IF EXISTS `dashboard_traffic_stats_pageviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_traffic_stats_pageviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `ev_datetime` datetime DEFAULT NULL,
  `ev_date` date DEFAULT NULL,
  `ev_year_month_day` varchar(10) DEFAULT NULL,
  `ev_year_month` varchar(10) DEFAULT NULL,
  `ev_year_quarter` varchar(10) DEFAULT NULL,
  `ev_year_week` varchar(10) DEFAULT NULL,
  `ev_year` varchar(10) DEFAULT NULL,
  `ev_timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_authenticated` tinyint(1) DEFAULT NULL,
  `client_id` varchar(64) DEFAULT NULL,
  `first_time_visit` tinyint(1) NOT NULL DEFAULT 0,
  `user_agent` varchar(255) DEFAULT NULL,
  `page_path` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `referral_domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_traffic_stats_pageviews_ev_datetime_index` (`ev_datetime`),
  KEY `dashboard_traffic_stats_pageviews_ev_date_index` (`ev_date`),
  KEY `dashboard_traffic_stats_pageviews_ev_year_month_day_index` (`ev_year_month_day`),
  KEY `dashboard_traffic_stats_pageviews_ev_year_month_index` (`ev_year_month`),
  KEY `dashboard_traffic_stats_pageviews_ev_year_quarter_index` (`ev_year_quarter`),
  KEY `dashboard_traffic_stats_pageviews_ev_year_week_index` (`ev_year_week`),
  KEY `dashboard_traffic_stats_pageviews_ev_year_index` (`ev_year`),
  KEY `dashboard_traffic_stats_pageviews_ev_timestamp_index` (`ev_timestamp`),
  KEY `dashboard_traffic_stats_pageviews_user_authenticated_index` (`user_authenticated`),
  KEY `dashboard_traffic_stats_pageviews_client_id_index` (`client_id`),
  KEY `dashboard_traffic_stats_pageviews_first_time_visit_index` (`first_time_visit`),
  KEY `dashboard_traffic_stats_pageviews_user_agent_index` (`user_agent`),
  KEY `dashboard_traffic_stats_pageviews_page_path_index` (`page_path`),
  KEY `dashboard_traffic_stats_pageviews_city_index` (`city`),
  KEY `dashboard_traffic_stats_pageviews_country_index` (`country`),
  KEY `dashboard_traffic_stats_pageviews_referral_domain_index` (`referral_domain`),
  KEY `dashboard_traffic_stats_pageviews_site_id_index` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_traffic_stats_pageviews`
--

LOCK TABLES `dashboard_traffic_stats_pageviews` WRITE;
/*!40000 ALTER TABLE `dashboard_traffic_stats_pageviews` DISABLE KEYS */;
INSERT INTO `dashboard_traffic_stats_pageviews` VALUES (1,NULL,'2026-02-08 08:46:28','2026-02-08','2026-02-08','2026-02-01','2026-01-01','2026-02-02','2026-01-01','2026-02-08 08:46:28',0,'jafRMaAQlTwyELwS2jNt52dGgWkPtFBI',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','/','172.24.0.1',NULL,NULL,'localhost'),(2,NULL,'2026-02-08 08:46:38','2026-02-08','2026-02-08','2026-02-01','2026-01-01','2026-02-02','2026-01-01','2026-02-08 08:46:38',0,'jafRMaAQlTwyELwS2jNt52dGgWkPtFBI',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','blog','172.24.0.1',NULL,NULL,'localhost'),(3,NULL,'2026-02-08 08:46:41','2026-02-08','2026-02-08','2026-02-01','2026-01-01','2026-02-02','2026-01-01','2026-02-08 08:46:41',0,'jafRMaAQlTwyELwS2jNt52dGgWkPtFBI',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','wiki','172.24.0.1',NULL,NULL,'localhost'),(4,NULL,'2026-02-08 08:46:45','2026-02-08','2026-02-08','2026-02-01','2026-01-01','2026-02-02','2026-01-01','2026-02-08 08:46:45',0,'jafRMaAQlTwyELwS2jNt52dGgWkPtFBI',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','blog','172.24.0.1',NULL,NULL,'localhost'),(5,NULL,'2026-02-08 08:46:46','2026-02-08','2026-02-08','2026-02-01','2026-01-01','2026-02-02','2026-01-01','2026-02-08 08:46:46',0,'jafRMaAQlTwyELwS2jNt52dGgWkPtFBI',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','about','172.24.0.1',NULL,NULL,'localhost'),(6,NULL,'2026-02-08 08:46:50','2026-02-08','2026-02-08','2026-02-01','2026-01-01','2026-02-02','2026-01-01','2026-02-08 08:46:50',0,'jafRMaAQlTwyELwS2jNt52dGgWkPtFBI',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','contact','172.24.0.1',NULL,NULL,'localhost'),(7,NULL,'2026-02-08 08:46:53','2026-02-08','2026-02-08','2026-02-01','2026-01-01','2026-02-02','2026-01-01','2026-02-08 08:46:53',0,'jafRMaAQlTwyELwS2jNt52dGgWkPtFBI',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','components','172.24.0.1',NULL,NULL,'localhost'),(8,NULL,'2026-02-08 08:56:02','2026-02-08','2026-02-08','2026-02-01','2026-01-01','2026-02-02','2026-01-01','2026-02-08 08:56:02',0,'jafRMaAQlTwyELwS2jNt52dGgWkPtFBI',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','/','172.24.0.1',NULL,NULL,''),(9,NULL,'2026-02-08 10:29:52','2026-02-08','2026-02-08','2026-02-01','2026-01-01','2026-02-02','2026-01-01','2026-02-08 10:29:52',0,'yDoguROAppBsyUPeeEIL9wqaECJ18f6J',1,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','/','172.24.0.1',NULL,NULL,''),(10,NULL,'2026-02-08 10:30:03','2026-02-08','2026-02-08','2026-02-01','2026-01-01','2026-02-02','2026-01-01','2026-02-08 10:30:03',0,'yDoguROAppBsyUPeeEIL9wqaECJ18f6J',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','blog','172.24.0.1',NULL,NULL,'localhost'),(11,NULL,'2026-02-12 14:46:25','2026-02-12','2026-02-12','2026-02-01','2026-01-01','2026-02-09','2026-01-01','2026-02-12 14:46:25',0,'jafRMaAQlTwyELwS2jNt52dGgWkPtFBI',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','/','172.24.0.1',NULL,NULL,''),(12,NULL,'2026-02-12 14:46:28','2026-02-12','2026-02-12','2026-02-01','2026-01-01','2026-02-09','2026-01-01','2026-02-12 14:46:28',0,'jafRMaAQlTwyELwS2jNt52dGgWkPtFBI',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','/','172.24.0.1',NULL,NULL,''),(13,NULL,'2026-02-12 14:46:35','2026-02-12','2026-02-12','2026-02-01','2026-01-01','2026-02-09','2026-01-01','2026-02-12 14:46:35',0,'jafRMaAQlTwyELwS2jNt52dGgWkPtFBI',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','/','172.24.0.1',NULL,NULL,''),(14,NULL,'2026-02-12 15:08:07','2026-02-12','2026-02-12','2026-02-01','2026-01-01','2026-02-09','2026-01-01','2026-02-12 15:08:07',0,'jafRMaAQlTwyELwS2jNt52dGgWkPtFBI',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','/','172.24.0.1',NULL,NULL,''),(15,NULL,'2026-02-12 15:08:08','2026-02-12','2026-02-12','2026-02-01','2026-01-01','2026-02-09','2026-01-01','2026-02-12 15:08:08',0,'jafRMaAQlTwyELwS2jNt52dGgWkPtFBI',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','/','172.24.0.1',NULL,NULL,''),(16,NULL,'2026-02-12 16:17:08','2026-02-12','2026-02-12','2026-02-01','2026-01-01','2026-02-09','2026-01-01','2026-02-12 16:17:08',0,'jafRMaAQlTwyELwS2jNt52dGgWkPtFBI',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','/','172.24.0.1',NULL,NULL,''),(17,NULL,'2026-03-14 18:00:43','2026-03-14','2026-03-14','2026-03-01','2026-01-01','2026-03-09','2026-01-01','2026-03-14 18:00:43',0,'jafRMaAQlTwyELwS2jNt52dGgWkPtFBI',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36','/','172.24.0.1',NULL,NULL,''),(18,NULL,'2026-03-14 18:00:45','2026-03-14','2026-03-14','2026-03-01','2026-01-01','2026-03-09','2026-01-01','2026-03-14 18:00:45',0,'jafRMaAQlTwyELwS2jNt52dGgWkPtFBI',0,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36','/','172.24.0.1',NULL,NULL,'');
/*!40000 ALTER TABLE `dashboard_traffic_stats_pageviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deferred_bindings`
--

DROP TABLE IF EXISTS `deferred_bindings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `deferred_bindings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(255) NOT NULL,
  `master_field` varchar(255) NOT NULL,
  `slave_type` varchar(255) NOT NULL,
  `slave_id` int(11) NOT NULL,
  `session_key` varchar(255) NOT NULL,
  `pivot_data` mediumtext DEFAULT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deferred_bindings`
--

LOCK TABLES `deferred_bindings` WRITE;
/*!40000 ALTER TABLE `deferred_bindings` DISABLE KEYS */;
/*!40000 ALTER TABLE `deferred_bindings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` text NOT NULL,
  `exception` longtext DEFAULT NULL,
  `failed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` text NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_10_01_000001_Db_Deferred_Bindings',1),(2,'2013_10_01_000002_Db_System_Files',1),(3,'2013_10_01_000003_Db_System_Plugin_Versions',1),(4,'2013_10_01_000004_Db_System_Plugin_History',1),(5,'2013_10_01_000005_Db_System_Settings',1),(6,'2013_10_01_000006_Db_System_Parameters',1),(7,'2013_10_01_000008_Db_System_Mail_Templates',1),(8,'2013_10_01_000009_Db_System_Mail_Layouts',1),(9,'2014_10_01_000010_Db_Jobs',1),(10,'2014_10_01_000011_Db_System_Event_Logs',1),(11,'2014_10_01_000012_Db_System_Request_Logs',1),(12,'2014_10_01_000013_Db_System_Sessions',1),(13,'2015_10_01_000016_Db_Cache',1),(14,'2015_10_01_000017_Db_System_Revisions',1),(15,'2015_10_01_000018_Db_FailedJobs',1),(16,'2017_10_01_000023_Db_System_Mail_Partials',1),(17,'2021_10_01_000025_Db_Add_Pivot_Data_To_Deferred_Bindings',1),(18,'2022_10_01_000026_Db_System_Site_Definitions',1),(19,'2023_10_01_000027_Db_Add_Site_To_Settings',1),(20,'2023_10_01_000028_Db_Add_Restrict_Roles_To_Sites',1),(21,'2023_10_01_000029_Db_System_Site_Groups',1),(22,'2023_10_01_000030_Db_Add_Group_To_Sites',1),(23,'2024_10_01_000031_Db_Add_Sort_Order_To_Deferred_Bindings',1),(24,'2024_10_01_000032_Db_Add_Fallback_Locale_To_Sites',1),(25,'2013_10_01_000001_Db_Backend_Users',2),(26,'2013_10_01_000002_Db_Backend_User_Groups',2),(27,'2013_10_01_000003_Db_Backend_Users_Groups',2),(28,'2013_10_01_000004_Db_Backend_User_Throttle',2),(29,'2014_01_04_000005_Db_Backend_User_Preferences',2),(30,'2014_10_01_000006_Db_Backend_Access_Log',2),(31,'2017_10_01_000010_Db_Backend_User_Roles',2),(32,'2018_12_16_000011_Db_Backend_Add_Deleted_At',2),(33,'2022_10_01_000012_Db_Backend_User_Roles_Sortable',2),(34,'2023_10_01_000013_Db_Add_Site_To_Preferences',2),(35,'2023_10_01_000014_Db_Add_User_Expired_Password',2),(36,'2024_10_01_000017_Db_Migrate_v4_0_0',2),(37,'2014_10_01_000001_Db_Cms_Theme_Data',3),(38,'2017_10_01_000003_Db_Cms_Theme_Logs',3),(39,'2018_11_01_000001_Db_Cms_Theme_Templates',3),(40,'2025_10_01_000001_Db_Dashboard_Dashboards',4),(41,'2025_10_01_000002_Db_Dashboard_Report_Data_Cache',4),(42,'2025_10_01_000003_Db_Dashboard_Traffic_Stats_Pageviews',4),(43,'2025_10_01_000004_Db_Add_Dashboard_Overrides',4),(44,'2025_10_01_000005_Db_Dashboard_Traffic_Stats_Add_Site',4),(45,'2021_05_01_000001_Db_Tailor_Globals',5),(46,'2021_05_01_000002_Db_Tailor_Content',5),(47,'2021_06_01_000003_Db_Tailor_PreviewToken',5),(48,'2023_10_01_000004_Db_Tailor_Content_Joins',5),(49,'2024_10_01_000005_Db_Add_Parent_To_Repeaters',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `payload` text DEFAULT NULL,
  `last_activity` int(11) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_event_logs`
--

DROP TABLE IF EXISTS `system_event_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_event_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `details` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_event_logs`
--

LOCK TABLES `system_event_logs` WRITE;
/*!40000 ALTER TABLE `system_event_logs` DISABLE KEYS */;
INSERT INTO `system_event_logs` VALUES (1,'error','There are no commands defined in the \"backend\" namespace.','{\"exception\":{}}','2026-02-08 08:41:40','2026-02-08 08:41:40');
/*!40000 ALTER TABLE `system_event_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_files`
--

DROP TABLE IF EXISTS `system_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `attachment_type` varchar(255) DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_files_master_index` (`attachment_type`,`attachment_id`,`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_files`
--

LOCK TABLES `system_files` WRITE;
/*!40000 ALTER TABLE `system_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_layouts`
--

DROP TABLE IF EXISTS `system_mail_layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_mail_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `content_html` text DEFAULT NULL,
  `content_text` text DEFAULT NULL,
  `content_css` text DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `options` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_layouts`
--

LOCK TABLES `system_mail_layouts` WRITE;
/*!40000 ALTER TABLE `system_mail_layouts` DISABLE KEYS */;
INSERT INTO `system_mail_layouts` VALUES (1,'Default layout','default','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-default\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ \"now\"|date(\"Y\") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>','{{ content|raw }}','@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}',1,NULL,'2026-02-08 08:41:30','2026-02-08 08:41:30'),(2,'System layout','system','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-system\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>','{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.','@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}',1,NULL,'2026-02-08 08:41:30','2026-02-08 08:41:30');
/*!40000 ALTER TABLE `system_mail_layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_partials`
--

DROP TABLE IF EXISTS `system_mail_partials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_mail_partials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `content_html` text DEFAULT NULL,
  `content_text` text DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_partials`
--

LOCK TABLES `system_mail_partials` WRITE;
/*!40000 ALTER TABLE `system_mail_partials` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_partials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_mail_templates`
--

DROP TABLE IF EXISTS `system_mail_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_mail_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `content_html` text DEFAULT NULL,
  `content_text` text DEFAULT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_mail_templates`
--

LOCK TABLES `system_mail_templates` WRITE;
/*!40000 ALTER TABLE `system_mail_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_mail_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_parameters`
--

DROP TABLE IF EXISTS `system_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) NOT NULL,
  `group` varchar(50) NOT NULL,
  `item` varchar(150) NOT NULL,
  `value` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_parameters`
--

LOCK TABLES `system_parameters` WRITE;
/*!40000 ALTER TABLE `system_parameters` DISABLE KEYS */;
INSERT INTO `system_parameters` VALUES (1,'system','update','count','1'),(2,'system','core','build','\"9\"'),(3,'system','update','retry','1770994003'),(4,'system','project','key','\"0AQxjZGNgZmNjZwN2YJR4ZzEvBTR4LzWzZGDkBQL5ZmSvZwqzMzHmMQRmMTD3\"'),(5,'system','core','since','\"2026-02-08 08:41:28\"'),(6,'system','core','bash','\"ca4b9ac3698b63e9576a07feff6b1c6bkMWxx0WiBJEDF2dTXYdb8PlhyaH2j5AhrLCqf5As\"'),(7,'system','project','is_stale','0'),(8,'system','project','id','300206'),(9,'system','project','name','\"Tejados Cayero\"'),(10,'system','project','owner','\"Alejandro Cayero Gamez\"'),(11,'system','project','is_active','true'),(12,'system','update','versions','{\"count\":1,\"core\":\"4.1.13\",\"plugins\":[]}');
/*!40000 ALTER TABLE `system_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_plugin_history`
--

DROP TABLE IF EXISTS `system_plugin_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_plugin_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `version` varchar(50) NOT NULL,
  `detail` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_plugin_history`
--

LOCK TABLES `system_plugin_history` WRITE;
/*!40000 ALTER TABLE `system_plugin_history` DISABLE KEYS */;
INSERT INTO `system_plugin_history` VALUES (1,'October.Demo','comment','1.0.1','First version of Demo','2026-02-08 08:41:28');
/*!40000 ALTER TABLE `system_plugin_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_plugin_versions`
--

DROP TABLE IF EXISTS `system_plugin_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_plugin_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `version` varchar(50) NOT NULL,
  `is_frozen` tinyint(1) NOT NULL DEFAULT 0,
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_plugin_versions`
--

LOCK TABLES `system_plugin_versions` WRITE;
/*!40000 ALTER TABLE `system_plugin_versions` DISABLE KEYS */;
INSERT INTO `system_plugin_versions` VALUES (1,'October.Demo','1.0.1',0,0,'2026-02-08 08:41:28');
/*!40000 ALTER TABLE `system_plugin_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_request_logs`
--

DROP TABLE IF EXISTS `system_request_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_request_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int(11) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `referer` text DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_request_logs`
--

LOCK TABLES `system_request_logs` WRITE;
/*!40000 ALTER TABLE `system_request_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_request_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_revisions`
--

DROP TABLE IF EXISTS `system_revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(255) NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `field` varchar(255) DEFAULT NULL,
  `cast` varchar(255) DEFAULT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  KEY `system_revisions_user_id_index` (`user_id`),
  KEY `system_revisions_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_revisions`
--

LOCK TABLES `system_revisions` WRITE;
/*!40000 ALTER TABLE `system_revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(255) DEFAULT NULL,
  `value` mediumtext DEFAULT NULL,
  `site_id` int(10) unsigned DEFAULT NULL,
  `site_root_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_settings`
--

LOCK TABLES `system_settings` WRITE;
/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_site_definitions`
--

DROP TABLE IF EXISTS `system_site_definitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_site_definitions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `is_custom_url` tinyint(1) NOT NULL DEFAULT 0,
  `app_url` varchar(255) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `fallback_locale` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `is_host_restricted` tinyint(1) NOT NULL DEFAULT 0,
  `allow_hosts` mediumtext DEFAULT NULL,
  `is_prefixed` tinyint(1) NOT NULL DEFAULT 0,
  `route_prefix` varchar(255) DEFAULT NULL,
  `is_styled` tinyint(1) NOT NULL DEFAULT 0,
  `color_foreground` varchar(255) DEFAULT NULL,
  `color_background` varchar(255) DEFAULT NULL,
  `is_role_restricted` tinyint(1) NOT NULL DEFAULT 0,
  `allow_roles` mediumtext DEFAULT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_enabled_edit` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_site_definitions_code_index` (`code`),
  KEY `system_site_definitions_group_id_index` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_site_definitions`
--

LOCK TABLES `system_site_definitions` WRITE;
/*!40000 ALTER TABLE `system_site_definitions` DISABLE KEYS */;
INSERT INTO `system_site_definitions` VALUES (1,'Primary Site','primary',1,0,NULL,NULL,NULL,'',NULL,0,NULL,0,NULL,0,NULL,NULL,0,NULL,1,1,1,'2026-02-08 08:41:26','2026-02-08 08:41:26',NULL);
/*!40000 ALTER TABLE `system_site_definitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_site_groups`
--

DROP TABLE IF EXISTS `system_site_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_site_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_site_groups_code_index` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_site_groups`
--

LOCK TABLES `system_site_groups` WRITE;
/*!40000 ALTER TABLE `system_site_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_site_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tailor_content_joins`
--

DROP TABLE IF EXISTS `tailor_content_joins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tailor_content_joins` (
  `parent_id` int(11) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  KEY `tailor_content_joins_pidx` (`parent_id`,`parent_type`,`field_name`),
  KEY `tailor_content_joins_ridx` (`relation_id`,`relation_type`,`field_name`),
  KEY `tailor_content_joins_field_name_index` (`field_name`),
  KEY `tailor_content_joins_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tailor_content_joins`
--

LOCK TABLES `tailor_content_joins` WRITE;
/*!40000 ALTER TABLE `tailor_content_joins` DISABLE KEYS */;
/*!40000 ALTER TABLE `tailor_content_joins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tailor_content_schema`
--

DROP TABLE IF EXISTS `tailor_content_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tailor_content_schema` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) DEFAULT NULL,
  `meta` mediumtext DEFAULT NULL,
  `fields` mediumtext DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tailor_content_schema_table_name_index` (`table_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tailor_content_schema`
--

LOCK TABLES `tailor_content_schema` WRITE;
/*!40000 ALTER TABLE `tailor_content_schema` DISABLE KEYS */;
INSERT INTO `tailor_content_schema` VALUES (1,'xc_85e471d209b94f3da63b1ae9d92d2879c','{\"blueprint_uuid\":\"85e471d2-09b9-4f3d-a63b-1ae9d92d2879\",\"blueprint_type\":\"entry\",\"multisite_sync\":false}','{\"active\":{\"slug\":{\"type\":\"text\",\"name\":\"slug\",\"nullable\":true}},\"dropped\":[]}',NULL,'2026-02-08 08:41:28','2026-02-08 08:41:28'),(2,'xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c','{\"blueprint_uuid\":\"a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1\",\"blueprint_type\":\"single\",\"multisite_sync\":false}','{\"active\":[],\"dropped\":[]}',NULL,'2026-02-08 08:41:28','2026-02-08 08:41:28'),(3,'xc_339b11b769ad43c49be16953e7738827c','{\"blueprint_uuid\":\"339b11b7-69ad-43c4-9be1-6953e7738827\",\"blueprint_type\":\"structure\",\"multisite_sync\":false}','{\"active\":{\"content\":{\"type\":\"mediumText\",\"name\":\"content\",\"nullable\":true},\"show_in_toc\":{\"type\":\"boolean\",\"name\":\"show_in_toc\",\"nullable\":true},\"summary_text\":{\"type\":\"mediumText\",\"name\":\"summary_text\",\"nullable\":true}},\"dropped\":[]}',NULL,'2026-02-08 08:41:28','2026-02-08 08:41:29'),(4,'xc_edcd102e05254e4db07e633ae6c18db6c','{\"blueprint_uuid\":\"edcd102e-0525-4e4d-b07e-633ae6c18db6\",\"blueprint_type\":\"stream\",\"multisite_sync\":false}','{\"active\":{\"content\":{\"type\":\"mediumText\",\"name\":\"content\",\"nullable\":true},\"author_id\":{\"type\":\"integer\",\"name\":\"author_id\",\"autoIncrement\":false,\"unsigned\":true,\"nullable\":true},\"featured_text\":{\"type\":\"mediumText\",\"name\":\"featured_text\",\"nullable\":true},\"gallery_media\":{\"type\":\"mediumText\",\"name\":\"gallery_media\",\"nullable\":true}},\"dropped\":[]}',NULL,'2026-02-08 08:41:29','2026-02-08 08:41:29'),(5,'xc_b022a74b15e64c6b9eb917efc5103543c','{\"blueprint_uuid\":\"b022a74b-15e6-4c6b-9eb9-17efc5103543\",\"blueprint_type\":\"structure\",\"multisite_sync\":false}','{\"active\":{\"description\":{\"type\":\"text\",\"name\":\"description\",\"nullable\":true}},\"dropped\":[]}',NULL,'2026-02-08 08:41:29','2026-02-08 08:41:29'),(6,'xc_6947ff28b66047d7924024ca6d58aeaec','{\"blueprint_uuid\":\"6947ff28-b660-47d7-9240-24ca6d58aeae\",\"blueprint_type\":\"entry\",\"multisite_sync\":false}','{\"active\":{\"avatar\":{\"type\":\"mediumText\",\"name\":\"avatar\",\"nullable\":true},\"email\":{\"type\":\"text\",\"name\":\"email\",\"nullable\":true},\"role\":{\"type\":\"text\",\"name\":\"role\",\"nullable\":true},\"about\":{\"type\":\"mediumText\",\"name\":\"about\",\"nullable\":true}},\"dropped\":[]}',NULL,'2026-02-08 08:41:29','2026-02-08 08:41:30');
/*!40000 ALTER TABLE `tailor_content_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tailor_global_joins`
--

DROP TABLE IF EXISTS `tailor_global_joins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tailor_global_joins` (
  `parent_id` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  KEY `tailor_global_joins_idx` (`relation_id`,`relation_type`),
  KEY `tailor_global_joins_field_name_index` (`field_name`),
  KEY `tailor_global_joins_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tailor_global_joins`
--

LOCK TABLES `tailor_global_joins` WRITE;
/*!40000 ALTER TABLE `tailor_global_joins` DISABLE KEYS */;
/*!40000 ALTER TABLE `tailor_global_joins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tailor_global_repeaters`
--

DROP TABLE IF EXISTS `tailor_global_repeaters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tailor_global_repeaters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_id` int(11) DEFAULT NULL,
  `host_field` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `content_value` mediumtext DEFAULT NULL,
  `content_spawn_path` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tailor_global_repeaters_idx` (`host_id`,`host_field`),
  KEY `tailor_global_repeaters_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tailor_global_repeaters`
--

LOCK TABLES `tailor_global_repeaters` WRITE;
/*!40000 ALTER TABLE `tailor_global_repeaters` DISABLE KEYS */;
/*!40000 ALTER TABLE `tailor_global_repeaters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tailor_globals`
--

DROP TABLE IF EXISTS `tailor_globals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tailor_globals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `site_root_id` int(11) DEFAULT NULL,
  `blueprint_uuid` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tailor_globals_site_id_index` (`site_id`),
  KEY `tailor_globals_site_root_id_index` (`site_root_id`),
  KEY `tailor_globals_blueprint_uuid_index` (`blueprint_uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tailor_globals`
--

LOCK TABLES `tailor_globals` WRITE;
/*!40000 ALTER TABLE `tailor_globals` DISABLE KEYS */;
/*!40000 ALTER TABLE `tailor_globals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tailor_preview_tokens`
--

DROP TABLE IF EXISTS `tailor_preview_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tailor_preview_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `route` mediumtext DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `count_use` int(11) NOT NULL DEFAULT 0,
  `count_limit` int(11) NOT NULL DEFAULT 0,
  `created_user_id` int(10) unsigned DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tailor_preview_tokens_site_id_index` (`site_id`),
  KEY `tailor_preview_tokens_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tailor_preview_tokens`
--

LOCK TABLES `tailor_preview_tokens` WRITE;
/*!40000 ALTER TABLE `tailor_preview_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tailor_preview_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_339b11b769ad43c49be16953e7738827c`
--

DROP TABLE IF EXISTS `xc_339b11b769ad43c49be16953e7738827c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_339b11b769ad43c49be16953e7738827c` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `site_root_id` int(11) DEFAULT NULL,
  `blueprint_uuid` varchar(255) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int(11) NOT NULL DEFAULT 1,
  `primary_id` int(10) unsigned DEFAULT NULL,
  `primary_attrs` mediumtext DEFAULT NULL,
  `is_version` tinyint(1) NOT NULL DEFAULT 0,
  `fullslug` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `show_in_toc` tinyint(1) DEFAULT NULL,
  `summary_text` mediumtext DEFAULT NULL,
  `created_user_id` int(10) unsigned DEFAULT NULL,
  `updated_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_site_id_index` (`site_id`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_site_root_id_index` (`site_root_id`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_content_group_index` (`content_group`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_slug_index` (`slug`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_primary_id_index` (`primary_id`),
  KEY `xc_339b11b769ad43c49be16953e7738827c_fullslug_index` (`fullslug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Article [Page\\Article].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_339b11b769ad43c49be16953e7738827c`
--

LOCK TABLES `xc_339b11b769ad43c49be16953e7738827c` WRITE;
/*!40000 ALTER TABLE `xc_339b11b769ad43c49be16953e7738827c` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_339b11b769ad43c49be16953e7738827c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_339b11b769ad43c49be16953e7738827j`
--

DROP TABLE IF EXISTS `xc_339b11b769ad43c49be16953e7738827j`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_339b11b769ad43c49be16953e7738827j` (
  `parent_id` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  KEY `xc_339b11b769ad43c49be16953e7738827j_idx` (`parent_id`,`relation_type`,`field_name`),
  KEY `xc_339b11b769ad43c49be16953e7738827j_field_name_index` (`field_name`),
  KEY `xc_339b11b769ad43c49be16953e7738827j_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for Article [Page\\Article].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_339b11b769ad43c49be16953e7738827j`
--

LOCK TABLES `xc_339b11b769ad43c49be16953e7738827j` WRITE;
/*!40000 ALTER TABLE `xc_339b11b769ad43c49be16953e7738827j` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_339b11b769ad43c49be16953e7738827j` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_339b11b769ad43c49be16953e7738827r`
--

DROP TABLE IF EXISTS `xc_339b11b769ad43c49be16953e7738827r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_339b11b769ad43c49be16953e7738827r` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_id` int(11) DEFAULT NULL,
  `host_field` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `content_value` mediumtext DEFAULT NULL,
  `content_spawn_path` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_339b11b769ad43c49be16953e7738827r_idx` (`host_id`,`host_field`),
  KEY `xc_339b11b769ad43c49be16953e7738827r_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Article [Page\\Article].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_339b11b769ad43c49be16953e7738827r`
--

LOCK TABLES `xc_339b11b769ad43c49be16953e7738827r` WRITE;
/*!40000 ALTER TABLE `xc_339b11b769ad43c49be16953e7738827r` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_339b11b769ad43c49be16953e7738827r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_6947ff28b66047d7924024ca6d58aeaec`
--

DROP TABLE IF EXISTS `xc_6947ff28b66047d7924024ca6d58aeaec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_6947ff28b66047d7924024ca6d58aeaec` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `site_root_id` int(11) DEFAULT NULL,
  `blueprint_uuid` varchar(255) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int(11) NOT NULL DEFAULT 1,
  `primary_id` int(10) unsigned DEFAULT NULL,
  `primary_attrs` mediumtext DEFAULT NULL,
  `is_version` tinyint(1) NOT NULL DEFAULT 0,
  `avatar` mediumtext DEFAULT NULL,
  `email` text DEFAULT NULL,
  `role` text DEFAULT NULL,
  `about` mediumtext DEFAULT NULL,
  `created_user_id` int(10) unsigned DEFAULT NULL,
  `updated_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_site_id_index` (`site_id`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_site_root_id_index` (`site_root_id`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_content_group_index` (`content_group`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_slug_index` (`slug`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaec_primary_id_index` (`primary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Author [Blog\\Author].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_6947ff28b66047d7924024ca6d58aeaec`
--

LOCK TABLES `xc_6947ff28b66047d7924024ca6d58aeaec` WRITE;
/*!40000 ALTER TABLE `xc_6947ff28b66047d7924024ca6d58aeaec` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_6947ff28b66047d7924024ca6d58aeaec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_6947ff28b66047d7924024ca6d58aeaej`
--

DROP TABLE IF EXISTS `xc_6947ff28b66047d7924024ca6d58aeaej`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_6947ff28b66047d7924024ca6d58aeaej` (
  `parent_id` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  KEY `xc_6947ff28b66047d7924024ca6d58aeaej_idx` (`parent_id`,`relation_type`,`field_name`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaej_field_name_index` (`field_name`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaej_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for Author [Blog\\Author].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_6947ff28b66047d7924024ca6d58aeaej`
--

LOCK TABLES `xc_6947ff28b66047d7924024ca6d58aeaej` WRITE;
/*!40000 ALTER TABLE `xc_6947ff28b66047d7924024ca6d58aeaej` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_6947ff28b66047d7924024ca6d58aeaej` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_6947ff28b66047d7924024ca6d58aeaer`
--

DROP TABLE IF EXISTS `xc_6947ff28b66047d7924024ca6d58aeaer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_6947ff28b66047d7924024ca6d58aeaer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_id` int(11) DEFAULT NULL,
  `host_field` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `content_value` mediumtext DEFAULT NULL,
  `content_spawn_path` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaer_idx` (`host_id`,`host_field`),
  KEY `xc_6947ff28b66047d7924024ca6d58aeaer_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Author [Blog\\Author].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_6947ff28b66047d7924024ca6d58aeaer`
--

LOCK TABLES `xc_6947ff28b66047d7924024ca6d58aeaer` WRITE;
/*!40000 ALTER TABLE `xc_6947ff28b66047d7924024ca6d58aeaer` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_6947ff28b66047d7924024ca6d58aeaer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_85e471d209b94f3da63b1ae9d92d2879c`
--

DROP TABLE IF EXISTS `xc_85e471d209b94f3da63b1ae9d92d2879c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_85e471d209b94f3da63b1ae9d92d2879c` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `site_root_id` int(11) DEFAULT NULL,
  `blueprint_uuid` varchar(255) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int(11) NOT NULL DEFAULT 1,
  `primary_id` int(10) unsigned DEFAULT NULL,
  `primary_attrs` mediumtext DEFAULT NULL,
  `is_version` tinyint(1) NOT NULL DEFAULT 0,
  `created_user_id` int(10) unsigned DEFAULT NULL,
  `updated_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_85e471d209b94f3da63b1ae9d92d2879c_site_id_index` (`site_id`),
  KEY `xc_85e471d209b94f3da63b1ae9d92d2879c_site_root_id_index` (`site_root_id`),
  KEY `xc_85e471d209b94f3da63b1ae9d92d2879c_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_85e471d209b94f3da63b1ae9d92d2879c_content_group_index` (`content_group`),
  KEY `xc_85e471d209b94f3da63b1ae9d92d2879c_slug_index` (`slug`),
  KEY `xc_85e471d209b94f3da63b1ae9d92d2879c_primary_id_index` (`primary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Menu [Site\\Menus].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_85e471d209b94f3da63b1ae9d92d2879c`
--

LOCK TABLES `xc_85e471d209b94f3da63b1ae9d92d2879c` WRITE;
/*!40000 ALTER TABLE `xc_85e471d209b94f3da63b1ae9d92d2879c` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_85e471d209b94f3da63b1ae9d92d2879c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_85e471d209b94f3da63b1ae9d92d2879j`
--

DROP TABLE IF EXISTS `xc_85e471d209b94f3da63b1ae9d92d2879j`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_85e471d209b94f3da63b1ae9d92d2879j` (
  `parent_id` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  KEY `xc_85e471d209b94f3da63b1ae9d92d2879j_idx` (`parent_id`,`relation_type`,`field_name`),
  KEY `xc_85e471d209b94f3da63b1ae9d92d2879j_field_name_index` (`field_name`),
  KEY `xc_85e471d209b94f3da63b1ae9d92d2879j_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for Menu [Site\\Menus].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_85e471d209b94f3da63b1ae9d92d2879j`
--

LOCK TABLES `xc_85e471d209b94f3da63b1ae9d92d2879j` WRITE;
/*!40000 ALTER TABLE `xc_85e471d209b94f3da63b1ae9d92d2879j` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_85e471d209b94f3da63b1ae9d92d2879j` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_85e471d209b94f3da63b1ae9d92d2879r`
--

DROP TABLE IF EXISTS `xc_85e471d209b94f3da63b1ae9d92d2879r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_85e471d209b94f3da63b1ae9d92d2879r` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_id` int(11) DEFAULT NULL,
  `host_field` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `content_value` mediumtext DEFAULT NULL,
  `content_spawn_path` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_85e471d209b94f3da63b1ae9d92d2879r_idx` (`host_id`,`host_field`),
  KEY `xc_85e471d209b94f3da63b1ae9d92d2879r_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Menu [Site\\Menus].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_85e471d209b94f3da63b1ae9d92d2879r`
--

LOCK TABLES `xc_85e471d209b94f3da63b1ae9d92d2879r` WRITE;
/*!40000 ALTER TABLE `xc_85e471d209b94f3da63b1ae9d92d2879r` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_85e471d209b94f3da63b1ae9d92d2879r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c`
--

DROP TABLE IF EXISTS `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `site_root_id` int(11) DEFAULT NULL,
  `blueprint_uuid` varchar(255) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int(11) NOT NULL DEFAULT 1,
  `primary_id` int(10) unsigned DEFAULT NULL,
  `primary_attrs` mediumtext DEFAULT NULL,
  `is_version` tinyint(1) NOT NULL DEFAULT 0,
  `created_user_id` int(10) unsigned DEFAULT NULL,
  `updated_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_site_id_index` (`site_id`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_site_root_id_index` (`site_root_id`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_content_group_index` (`content_group`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_slug_index` (`slug`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c_primary_id_index` (`primary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for About Page [Page\\About].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c`
--

LOCK TABLES `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c` WRITE;
/*!40000 ALTER TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j`
--

DROP TABLE IF EXISTS `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j` (
  `parent_id` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j_idx` (`parent_id`,`relation_type`,`field_name`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j_field_name_index` (`field_name`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for About Page [Page\\About].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j`
--

LOCK TABLES `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j` WRITE;
/*!40000 ALTER TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1j` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r`
--

DROP TABLE IF EXISTS `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_id` int(11) DEFAULT NULL,
  `host_field` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `content_value` mediumtext DEFAULT NULL,
  `content_spawn_path` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r_idx` (`host_id`,`host_field`),
  KEY `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for About Page [Page\\About].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r`
--

LOCK TABLES `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r` WRITE;
/*!40000 ALTER TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_b022a74b15e64c6b9eb917efc5103543c`
--

DROP TABLE IF EXISTS `xc_b022a74b15e64c6b9eb917efc5103543c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_b022a74b15e64c6b9eb917efc5103543c` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `site_root_id` int(11) DEFAULT NULL,
  `blueprint_uuid` varchar(255) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int(11) NOT NULL DEFAULT 1,
  `primary_id` int(10) unsigned DEFAULT NULL,
  `primary_attrs` mediumtext DEFAULT NULL,
  `is_version` tinyint(1) NOT NULL DEFAULT 0,
  `fullslug` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_user_id` int(10) unsigned DEFAULT NULL,
  `updated_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_site_id_index` (`site_id`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_site_root_id_index` (`site_root_id`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_content_group_index` (`content_group`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_slug_index` (`slug`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_primary_id_index` (`primary_id`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543c_fullslug_index` (`fullslug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Category [Blog\\Category].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_b022a74b15e64c6b9eb917efc5103543c`
--

LOCK TABLES `xc_b022a74b15e64c6b9eb917efc5103543c` WRITE;
/*!40000 ALTER TABLE `xc_b022a74b15e64c6b9eb917efc5103543c` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_b022a74b15e64c6b9eb917efc5103543c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_b022a74b15e64c6b9eb917efc5103543j`
--

DROP TABLE IF EXISTS `xc_b022a74b15e64c6b9eb917efc5103543j`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_b022a74b15e64c6b9eb917efc5103543j` (
  `parent_id` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  KEY `xc_b022a74b15e64c6b9eb917efc5103543j_idx` (`parent_id`,`relation_type`,`field_name`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543j_field_name_index` (`field_name`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543j_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for Category [Blog\\Category].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_b022a74b15e64c6b9eb917efc5103543j`
--

LOCK TABLES `xc_b022a74b15e64c6b9eb917efc5103543j` WRITE;
/*!40000 ALTER TABLE `xc_b022a74b15e64c6b9eb917efc5103543j` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_b022a74b15e64c6b9eb917efc5103543j` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_b022a74b15e64c6b9eb917efc5103543r`
--

DROP TABLE IF EXISTS `xc_b022a74b15e64c6b9eb917efc5103543r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_b022a74b15e64c6b9eb917efc5103543r` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_id` int(11) DEFAULT NULL,
  `host_field` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `content_value` mediumtext DEFAULT NULL,
  `content_spawn_path` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543r_idx` (`host_id`,`host_field`),
  KEY `xc_b022a74b15e64c6b9eb917efc5103543r_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Category [Blog\\Category].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_b022a74b15e64c6b9eb917efc5103543r`
--

LOCK TABLES `xc_b022a74b15e64c6b9eb917efc5103543r` WRITE;
/*!40000 ALTER TABLE `xc_b022a74b15e64c6b9eb917efc5103543r` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_b022a74b15e64c6b9eb917efc5103543r` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_edcd102e05254e4db07e633ae6c18db6c`
--

DROP TABLE IF EXISTS `xc_edcd102e05254e4db07e633ae6c18db6c`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_edcd102e05254e4db07e633ae6c18db6c` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `site_root_id` int(11) DEFAULT NULL,
  `blueprint_uuid` varchar(255) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published_at_date` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `draft_mode` int(11) NOT NULL DEFAULT 1,
  `primary_id` int(10) unsigned DEFAULT NULL,
  `primary_attrs` mediumtext DEFAULT NULL,
  `is_version` tinyint(1) NOT NULL DEFAULT 0,
  `published_at_day` int(11) DEFAULT NULL,
  `published_at_month` int(11) DEFAULT NULL,
  `published_at_year` int(11) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT NULL,
  `featured_text` mediumtext DEFAULT NULL,
  `gallery_media` mediumtext DEFAULT NULL,
  `created_user_id` int(10) unsigned DEFAULT NULL,
  `updated_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_user_id` int(10) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_site_id_index` (`site_id`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_site_root_id_index` (`site_root_id`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_blueprint_uuid_index` (`blueprint_uuid`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_content_group_index` (`content_group`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_slug_index` (`slug`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6c_primary_id_index` (`primary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Post [Blog\\Post].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_edcd102e05254e4db07e633ae6c18db6c`
--

LOCK TABLES `xc_edcd102e05254e4db07e633ae6c18db6c` WRITE;
/*!40000 ALTER TABLE `xc_edcd102e05254e4db07e633ae6c18db6c` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_edcd102e05254e4db07e633ae6c18db6c` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_edcd102e05254e4db07e633ae6c18db6j`
--

DROP TABLE IF EXISTS `xc_edcd102e05254e4db07e633ae6c18db6j`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_edcd102e05254e4db07e633ae6c18db6j` (
  `parent_id` int(11) DEFAULT NULL,
  `relation_id` int(11) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  KEY `xc_edcd102e05254e4db07e633ae6c18db6j_idx` (`parent_id`,`relation_type`,`field_name`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6j_field_name_index` (`field_name`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6j_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Joins for Post [Blog\\Post].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_edcd102e05254e4db07e633ae6c18db6j`
--

LOCK TABLES `xc_edcd102e05254e4db07e633ae6c18db6j` WRITE;
/*!40000 ALTER TABLE `xc_edcd102e05254e4db07e633ae6c18db6j` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_edcd102e05254e4db07e633ae6c18db6j` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xc_edcd102e05254e4db07e633ae6c18db6r`
--

DROP TABLE IF EXISTS `xc_edcd102e05254e4db07e633ae6c18db6r`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `xc_edcd102e05254e4db07e633ae6c18db6r` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_id` int(11) DEFAULT NULL,
  `host_field` varchar(255) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `content_group` varchar(255) DEFAULT NULL,
  `content_value` mediumtext DEFAULT NULL,
  `content_spawn_path` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6r_idx` (`host_id`,`host_field`),
  KEY `xc_edcd102e05254e4db07e633ae6c18db6r_site_id_index` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Post [Blog\\Post].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_edcd102e05254e4db07e633ae6c18db6r`
--

LOCK TABLES `xc_edcd102e05254e4db07e633ae6c18db6r` WRITE;
/*!40000 ALTER TABLE `xc_edcd102e05254e4db07e633ae6c18db6r` DISABLE KEYS */;
/*!40000 ALTER TABLE `xc_edcd102e05254e4db07e633ae6c18db6r` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-14 18:10:55
