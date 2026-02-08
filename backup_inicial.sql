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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_access_log`
--

LOCK TABLES `backend_access_log` WRITE;
/*!40000 ALTER TABLE `backend_access_log` DISABLE KEYS */;
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
INSERT INTO `backend_user_groups` VALUES (1,'Owners','owners','Default group for website owners.',0,'2026-02-07 19:01:33','2026-02-07 19:01:33');
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
INSERT INTO `backend_user_roles` VALUES (1,'Developer','developer','#3498db','Site administrator with access to developer tools.','',1,1,'2026-02-07 19:01:33','2026-02-07 19:01:33'),(2,'Publisher','publisher','#1abc9c','Site editor with access to publishing tools.','',1,2,'2026-02-07 19:01:33','2026-02-07 19:01:33');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_user_throttle`
--

LOCK TABLES `backend_user_throttle` WRITE;
/*!40000 ALTER TABLE `backend_user_throttle` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backend_users`
--

LOCK TABLES `backend_users` WRITE;
/*!40000 ALTER TABLE `backend_users` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_dashboards`
--

LOCK TABLES `dashboard_dashboards` WRITE;
/*!40000 ALTER TABLE `dashboard_dashboards` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_traffic_stats_pageviews`
--

LOCK TABLES `dashboard_traffic_stats_pageviews` WRITE;
/*!40000 ALTER TABLE `dashboard_traffic_stats_pageviews` DISABLE KEYS */;
INSERT INTO `dashboard_traffic_stats_pageviews` VALUES (1,NULL,'2026-02-07 19:07:10','2026-02-07','2026-02-07','2026-02-01','2026-01-01','2026-02-02','2026-01-01','2026-02-07 19:07:10',0,'jafRMaAQlTwyELwS2jNt52dGgWkPtFBI',1,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36','/','172.18.0.1',NULL,NULL,'');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_event_logs`
--

LOCK TABLES `system_event_logs` WRITE;
/*!40000 ALTER TABLE `system_event_logs` DISABLE KEYS */;
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
INSERT INTO `system_mail_layouts` VALUES (1,'Default layout','default','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-default\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ \"now\"|date(\"Y\") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>','{{ content|raw }}','@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}',1,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(2,'System layout','system','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-system\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>','{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.','@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}',1,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_parameters`
--

LOCK TABLES `system_parameters` WRITE;
/*!40000 ALTER TABLE `system_parameters` DISABLE KEYS */;
INSERT INTO `system_parameters` VALUES (1,'system','update','count','0'),(2,'system','core','build','\"9\"'),(3,'system','update','retry',NULL);
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
INSERT INTO `system_plugin_history` VALUES (1,'October.Demo','comment','1.0.1','First version of Demo','2026-02-07 19:01:31');
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
INSERT INTO `system_plugin_versions` VALUES (1,'October.Demo','1.0.1',0,0,'2026-02-07 19:01:31');
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
INSERT INTO `system_site_definitions` VALUES (1,'Primary Site','primary',1,0,NULL,NULL,NULL,'',NULL,0,NULL,0,NULL,0,NULL,NULL,0,NULL,1,1,1,'2026-02-07 19:01:29','2026-02-07 19:01:29',NULL);
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
INSERT INTO `tailor_content_schema` VALUES (1,'xc_85e471d209b94f3da63b1ae9d92d2879c','{\"blueprint_uuid\":\"85e471d2-09b9-4f3d-a63b-1ae9d92d2879\",\"blueprint_type\":\"entry\",\"multisite_sync\":false}','{\"active\":{\"slug\":{\"type\":\"text\",\"name\":\"slug\",\"nullable\":true}},\"dropped\":[]}',NULL,'2026-02-07 19:01:31','2026-02-07 19:01:31'),(2,'xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c','{\"blueprint_uuid\":\"a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1\",\"blueprint_type\":\"single\",\"multisite_sync\":false}','{\"active\":[],\"dropped\":[]}',NULL,'2026-02-07 19:01:31','2026-02-07 19:01:31'),(3,'xc_339b11b769ad43c49be16953e7738827c','{\"blueprint_uuid\":\"339b11b7-69ad-43c4-9be1-6953e7738827\",\"blueprint_type\":\"structure\",\"multisite_sync\":false}','{\"active\":{\"content\":{\"type\":\"mediumText\",\"name\":\"content\",\"nullable\":true},\"show_in_toc\":{\"type\":\"boolean\",\"name\":\"show_in_toc\",\"nullable\":true},\"summary_text\":{\"type\":\"mediumText\",\"name\":\"summary_text\",\"nullable\":true}},\"dropped\":[]}',NULL,'2026-02-07 19:01:31','2026-02-07 19:01:31'),(4,'xc_edcd102e05254e4db07e633ae6c18db6c','{\"blueprint_uuid\":\"edcd102e-0525-4e4d-b07e-633ae6c18db6\",\"blueprint_type\":\"stream\",\"multisite_sync\":false}','{\"active\":{\"content\":{\"type\":\"mediumText\",\"name\":\"content\",\"nullable\":true},\"author_id\":{\"type\":\"integer\",\"name\":\"author_id\",\"autoIncrement\":false,\"unsigned\":true,\"nullable\":true},\"featured_text\":{\"type\":\"mediumText\",\"name\":\"featured_text\",\"nullable\":true},\"gallery_media\":{\"type\":\"mediumText\",\"name\":\"gallery_media\",\"nullable\":true}},\"dropped\":[]}',NULL,'2026-02-07 19:01:31','2026-02-07 19:01:32'),(5,'xc_b022a74b15e64c6b9eb917efc5103543c','{\"blueprint_uuid\":\"b022a74b-15e6-4c6b-9eb9-17efc5103543\",\"blueprint_type\":\"structure\",\"multisite_sync\":false}','{\"active\":{\"description\":{\"type\":\"text\",\"name\":\"description\",\"nullable\":true}},\"dropped\":[]}',NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(6,'xc_6947ff28b66047d7924024ca6d58aeaec','{\"blueprint_uuid\":\"6947ff28-b660-47d7-9240-24ca6d58aeae\",\"blueprint_type\":\"entry\",\"multisite_sync\":false}','{\"active\":{\"avatar\":{\"type\":\"mediumText\",\"name\":\"avatar\",\"nullable\":true},\"email\":{\"type\":\"text\",\"name\":\"email\",\"nullable\":true},\"role\":{\"type\":\"text\",\"name\":\"role\",\"nullable\":true},\"about\":{\"type\":\"mediumText\",\"name\":\"about\",\"nullable\":true}},\"dropped\":[]}',NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Article [Page\\Article].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_339b11b769ad43c49be16953e7738827c`
--

LOCK TABLES `xc_339b11b769ad43c49be16953e7738827c` WRITE;
/*!40000 ALTER TABLE `xc_339b11b769ad43c49be16953e7738827c` DISABLE KEYS */;
INSERT INTO `xc_339b11b769ad43c49be16953e7738827c` VALUES (1,1,1,'339b11b7-69ad-43c4-9be1-6953e7738827',NULL,'Our Locations','our-locations',1,NULL,'2026-02-07 19:01:32',NULL,1,NULL,NULL,0,'our-locations',NULL,NULL,NULL,NULL,'<p>The term location generally implies a higher degree of certainty than place, the latter often indicating an entity with an ambiguous boundary, relying more on human or social attributes of place identity and sense of place than on geometry. An absolute location can be designated using a specific pairing of latitude and longitude in a Cartesian coordinate grid (for example, a spherical coordinate system or an ellipsoid-based system such as the World Geodetic System) or similar methods. For instance, the position of Lake Maracaibo in Venezuela can be expressed using the coordinate system as the location 9.80°N (latitude), 71.56°W (longitude).</p>',1,'In geography, location or place are used to denote a region (point, line, or area) on Earth\'s surface or elsewhere.',NULL,NULL,NULL,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(2,1,2,'339b11b7-69ad-43c4-9be1-6953e7738827',NULL,'Canberra','canberra',1,NULL,'2026-02-07 19:01:32',NULL,1,NULL,NULL,0,'our-locations/canberra',1,NULL,NULL,NULL,'<p>Unusual among Australian cities, it is an entirely planned city. The city is located at the northern end of the Australian Capital Territory[11] at the northern tip of the Australian Alps, the country\'s highest mountain range. As of June 2020, Canberra\'s estimated population was 431,380.[12]</p><p>The area chosen for the capital had been inhabited by Indigenous Australians for up to 21,000 years,[13] with the principal group being the Ngunnawal people. European settlement commenced in the first half of the 19th century, as evidenced by surviving landmarks such as St John\'s Anglican Church and Blundells Cottage. On 1 January 1901, federation of the colonies of Australia was achieved. Following a long dispute over whether Sydney or Melbourne should be the national capital,[14] a compromise was reached: the new capital would be built in New South Wales, so long as it was at least 100 miles (160 km) from Sydney. The capital city was founded and formally named as Canberra in 1913. A blueprint by American architects Walter Burley Griffin and Marion Mahony Griffin was selected after an international design contest, and construction commenced in 1913.[15] The Griffins\' plan featured geometric motifs and was centred on axes aligned with significant topographical landmarks such as Black Mountain, Mount Ainslie, Capital Hill and City Hill. Canberra\'s mountainous location makes it the only mainland Australian city where snow-capped mountains can be seen in winter; although snow in the city itself is rare.</p><p>As the seat of the Government of Australia, Canberra is home to many important institutions of the federal government, national monuments and museums. This includes Parliament House, Government House, the High Court and the headquarters of numerous government agencies. It is the location of many social and cultural institutions of national significance such as the Australian War Memorial, the Australian National University, the Royal Australian Mint, the Australian Institute of Sport, the National Gallery, the National Museum and the National Library. The city is home to many important institutions of the Australian Defence Force including the Royal Military College Duntroon and the Australian Defence Force Academy. It hosts all foreign embassies in Australia as well as regional headquarters of many international organisations, not-for-profit groups, lobbying groups and professional associations.</p>',1,'Canberra (/ˈkænbərə/ KAN-bə-rə) is the capital city of Australia. Founded following the federation of the colonies of Australia as the seat of government for the new nation, it is Australia\'s largest inland city and the eighth-largest city overall.',NULL,NULL,NULL,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(3,1,3,'339b11b7-69ad-43c4-9be1-6953e7738827',NULL,'Sydney','sydney',1,NULL,'2026-02-07 19:01:32',NULL,1,NULL,NULL,0,'our-locations/sydney',1,NULL,NULL,NULL,'<p>Located on Australia\'s east coast, the metropolis surrounds Port Jackson and extends about 70 km (43.5 mi) on its periphery towards the Blue Mountains to the west, Hawkesbury to the north, the Royal National Park to the south and Macarthur to the south-west. Sydney is made up of 658 suburbs, spread across 33 local government areas. Residents of the city are known as \"Sydneysiders\". As of June 2020, Sydney\'s estimated metropolitan population was 5,361,466, meaning the city is home to approximately 66% of the state\'s population. Nicknames of the city include the \'Emerald City\' and the \'Harbour City\'.</p><p>Indigenous Australians have inhabited the Sydney area for at least 30,000 years, and thousands of Aboriginal engravings remain throughout the region. During his first Pacific voyage in 1770, Lieutenant James Cook and his crew became the first Europeans to chart the eastern coast of Australia, making landfall at Botany Bay. In 1788, the First Fleet of convicts, led by Arthur Phillip, founded Sydney as a British penal colony, the first European settlement in Australia. After World War II, it experienced mass migration and became one of the most multicultural cities in the world. Furthermore, 45.4% of the population reported having been born overseas, and the city has the third-largest foreign-born population of any city in the world after London and New York City.</p><p>Despite being one of the most expensive cities in the world, Sydney frequently ranks in the top ten most liveable cities in the world. It is classified as an Alpha global city by the Globalization and World Cities Research Network, indicating its influence in the region and throughout the world. Ranked eleventh in the world for economic opportunity, Sydney has an advanced market economy with strengths in finance, manufacturing and tourism. Established in 1850, the University of Sydney was Australia\'s first university and is regarded as one of the world\'s leading universities.</p>',1,'Sydney is the capital city of the state of New South Wales, and the most populous city in Australia and Oceania.',NULL,NULL,NULL,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(4,1,4,'339b11b7-69ad-43c4-9be1-6953e7738827',NULL,'Vancouver','vancouver',1,NULL,'2026-02-07 19:01:32',NULL,1,NULL,NULL,0,'our-locations/vancouver',1,NULL,NULL,NULL,'<p>As the most populous city in the province, the 2021 census recorded 662,248 people in the city, up from 631,486 in 2016. The Greater Vancouver area had a population of 2,642,825 in 2021, making it the third-largest metropolitan area in Canada. Vancouver has the highest population density in Canada, with over 5,400 people per square kilometre. Vancouver is one of the most ethnically and linguistically diverse cities in Canada: 52 percent of its residents are not native English speakers, 48.9 percent are native speakers of neither English nor French, and 50.6 percent of residents belong to visible minority groups.</p><p>Vancouver is one of the most livable cities in Canada and in the world. In terms of housing affordability, Vancouver is also one of the most expensive cities in Canada and in the world. Vancouver plans to become the greenest city in the world. Vancouverism is the city\'s urban planning design philosophy.</p><p>Indigenous settlement of Vancouver began more than 10,000 years ago, and the city is on the traditional and unceded territories of the Squamish, Musqueam, and Tsleil-Waututh (Burrard) peoples. The beginnings of the modern city, which was originally named Gastown, grew around the site of a makeshift tavern on the western edges of Hastings Mill that was built on July 1, 1867, and owned by proprietor Gassy Jack. The original site is marked by the Gastown steam clock. Gastown then formally registered as a townsite dubbed Granville, Burrard Inlet. The city was renamed \"Vancouver\" in 1886, through a deal with the Canadian Pacific Railway (CPR). The Canadian Pacific transcontinental railway was extended to the city by 1887. The city\'s large natural seaport on the Pacific Ocean became a vital link in the trade between Asia-Pacific, East Asia, Europe, and Eastern Canada.</p>',1,'Vancouver is a major city in western Canada, located in the Lower Mainland region of British Columbia.',NULL,NULL,NULL,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(5,1,5,'339b11b7-69ad-43c4-9be1-6953e7738827',NULL,'Knowledge Base','knowledge-base',1,NULL,'2026-02-07 19:01:32',NULL,1,NULL,NULL,0,'our-locations/knowledge-base',NULL,NULL,NULL,NULL,'<p>Knowledge Base</p>',1,'',NULL,NULL,NULL,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Article [Page\\Article].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_339b11b769ad43c49be16953e7738827r`
--

LOCK TABLES `xc_339b11b769ad43c49be16953e7738827r` WRITE;
/*!40000 ALTER TABLE `xc_339b11b769ad43c49be16953e7738827r` DISABLE KEYS */;
INSERT INTO `xc_339b11b769ad43c49be16953e7738827r` VALUES (1,2,'external_links',NULL,NULL,'{\"link_text\":\"Canberra travel guide from Wikivoyage\",\"link_url\":\"https:\\/\\/en.wikivoyage.org\\/wiki\\/Canberra\"}','Tailor\\Models\\EntryRecord@339b11b7-69ad-43c4-9be1-6953e7738827.external_links',NULL,1,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(2,2,'external_links',NULL,NULL,'{\"link_text\":\"Official Tourism Website\",\"link_url\":\"https:\\/\\/visitcanberra.com.au\\/\"}','Tailor\\Models\\EntryRecord@339b11b7-69ad-43c4-9be1-6953e7738827.external_links',NULL,2,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(3,2,'external_links',NULL,NULL,'{\"link_text\":\"Canberra 100 – Celebrating Canberra\'s 100th anniversary\",\"link_url\":\"https:\\/\\/www.canberra100.com.au\\/\"}','Tailor\\Models\\EntryRecord@339b11b7-69ad-43c4-9be1-6953e7738827.external_links',NULL,3,'2026-02-07 19:01:32','2026-02-07 19:01:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Author [Blog\\Author].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_6947ff28b66047d7924024ca6d58aeaec`
--

LOCK TABLES `xc_6947ff28b66047d7924024ca6d58aeaec` WRITE;
/*!40000 ALTER TABLE `xc_6947ff28b66047d7924024ca6d58aeaec` DISABLE KEYS */;
INSERT INTO `xc_6947ff28b66047d7924024ca6d58aeaec` VALUES (1,1,1,'6947ff28-b660-47d7-9240-24ca6d58aeae',NULL,'John Smith','john-smith',1,NULL,'2026-02-07 19:01:32',NULL,1,NULL,NULL,0,NULL,'john.smith@techinnovators.ltd','Manager','Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',NULL,NULL,NULL,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(2,1,2,'6947ff28-b660-47d7-9240-24ca6d58aeae',NULL,'Jane Doe','jane-doe',1,NULL,'2026-02-07 19:01:32',NULL,1,NULL,NULL,0,NULL,'jane.doe@devsolutions.ltd','Lead Developer','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',NULL,NULL,NULL,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Author [Blog\\Author].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_6947ff28b66047d7924024ca6d58aeaer`
--

LOCK TABLES `xc_6947ff28b66047d7924024ca6d58aeaer` WRITE;
/*!40000 ALTER TABLE `xc_6947ff28b66047d7924024ca6d58aeaer` DISABLE KEYS */;
INSERT INTO `xc_6947ff28b66047d7924024ca6d58aeaer` VALUES (1,1,'social_links',NULL,NULL,'{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@6947ff28-b660-47d7-9240-24ca6d58aeae.social_links',NULL,1,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(2,1,'social_links',NULL,NULL,'{\"platform\":\"youtube\",\"url\":\"https:\\/\\/www.youtube.com\\/c\\/OctoberCMSOfficial\"}','Tailor\\Models\\EntryRecord@6947ff28-b660-47d7-9240-24ca6d58aeae.social_links',NULL,2,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(3,1,'social_links',NULL,NULL,'{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@6947ff28-b660-47d7-9240-24ca6d58aeae.social_links',NULL,3,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(4,1,'social_links',NULL,NULL,'{\"platform\":\"linkedin\",\"url\":\"https:\\/\\/www.linkedin.com\\/company\\/october-cms\\/\"}','Tailor\\Models\\EntryRecord@6947ff28-b660-47d7-9240-24ca6d58aeae.social_links',NULL,4,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(5,2,'social_links',NULL,NULL,'{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@6947ff28-b660-47d7-9240-24ca6d58aeae.social_links',NULL,1,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(6,2,'social_links',NULL,NULL,'{\"platform\":\"youtube\",\"url\":\"https:\\/\\/www.youtube.com\\/c\\/OctoberCMSOfficial\"}','Tailor\\Models\\EntryRecord@6947ff28-b660-47d7-9240-24ca6d58aeae.social_links',NULL,2,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(7,2,'social_links',NULL,NULL,'{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@6947ff28-b660-47d7-9240-24ca6d58aeae.social_links',NULL,3,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(8,2,'social_links',NULL,NULL,'{\"platform\":\"linkedin\",\"url\":\"https:\\/\\/www.linkedin.com\\/company\\/october-cms\\/\"}','Tailor\\Models\\EntryRecord@6947ff28-b660-47d7-9240-24ca6d58aeae.social_links',NULL,4,'2026-02-07 19:01:32','2026-02-07 19:01:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Menu [Site\\Menus].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_85e471d209b94f3da63b1ae9d92d2879c`
--

LOCK TABLES `xc_85e471d209b94f3da63b1ae9d92d2879c` WRITE;
/*!40000 ALTER TABLE `xc_85e471d209b94f3da63b1ae9d92d2879c` DISABLE KEYS */;
INSERT INTO `xc_85e471d209b94f3da63b1ae9d92d2879c` VALUES (1,1,1,'85e471d2-09b9-4f3d-a63b-1ae9d92d2879','regular_menu','Footer Menu','footer-nav',1,NULL,'2026-02-07 19:01:32',NULL,1,NULL,NULL,0,NULL,NULL,NULL,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(2,1,2,'85e471d2-09b9-4f3d-a63b-1ae9d92d2879','sitemap_menu','Sitemap','sitemap',1,NULL,'2026-02-07 19:01:32',NULL,1,NULL,NULL,0,NULL,NULL,NULL,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for Menu [Site\\Menus].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_85e471d209b94f3da63b1ae9d92d2879r`
--

LOCK TABLES `xc_85e471d209b94f3da63b1ae9d92d2879r` WRITE;
/*!40000 ALTER TABLE `xc_85e471d209b94f3da63b1ae9d92d2879r` DISABLE KEYS */;
INSERT INTO `xc_85e471d209b94f3da63b1ae9d92d2879r` VALUES (1,1,'items',NULL,NULL,'{\"title\":\"Company\",\"reference\":\"\",\"is_hidden\":\"0\",\"code\":\"company\",\"css_class\":\"\",\"is_external\":\"0\",\"nesting\":\"0\",\"replace\":\"0\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:regular_menu.items',NULL,1,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(2,1,'items',NULL,NULL,'{\"title\":\"Blog\",\"reference\":\"october:\\/\\/cms-page@link\\/blog\\/index?title=Blog+Homepage+%28blog%2Findex%29\",\"is_hidden\":\"0\",\"code\":\"blog\",\"css_class\":\"\",\"is_external\":\"0\",\"nesting\":\"0\",\"replace\":\"0\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:regular_menu.items',1,2,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(3,1,'items',NULL,NULL,'{\"title\":\"Technology\",\"reference\":\"\",\"is_hidden\":\"0\",\"code\":\"technology\",\"css_class\":\"\",\"is_external\":\"0\",\"nesting\":\"0\",\"replace\":\"0\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:regular_menu.items',NULL,2,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(4,1,'items',NULL,NULL,'{\"title\":\"Wiki\",\"reference\":\"october:\\/\\/cms-page@link\\/wiki\\/index?title=Wiki+Docs+Demo+%28wiki%2Findex%29\",\"is_hidden\":\"0\",\"code\":\"wiki\",\"css_class\":\"\",\"is_external\":\"0\",\"nesting\":\"0\",\"replace\":\"0\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:regular_menu.items',1,3,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(5,1,'items',NULL,NULL,'{\"title\":\"AJAX Demo\",\"reference\":\"october:\\/\\/cms-page@link\\/ajax?title=AJAX+Framework+%28ajax%29\",\"is_hidden\":\"0\",\"code\":\"ajax-demo\",\"css_class\":\"\",\"is_external\":\"0\",\"nesting\":\"0\",\"replace\":\"0\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:regular_menu.items',3,3,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(6,1,'items',NULL,NULL,'{\"title\":\"October CMS\",\"reference\":\"\",\"is_hidden\":\"0\",\"code\":\"october-cms\",\"css_class\":\"\",\"is_external\":\"0\",\"nesting\":\"0\",\"replace\":\"0\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:regular_menu.items',NULL,3,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(7,1,'items',NULL,NULL,'{\"title\":\"About\",\"reference\":\"october:\\/\\/cms-page@link\\/about?title=About+Page+%28about%29\",\"is_hidden\":\"0\",\"code\":\"about\",\"css_class\":\"\",\"is_external\":\"0\",\"nesting\":\"0\",\"replace\":\"0\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:regular_menu.items',1,4,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(8,1,'items',NULL,NULL,'{\"title\":\"Components Demo\",\"reference\":\"october:\\/\\/cms-page@link\\/components?title=Components+Demo+%28components%29\",\"is_hidden\":\"0\",\"code\":\"components-demo\",\"css_class\":\"\",\"is_external\":\"0\",\"nesting\":\"0\",\"replace\":\"0\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:regular_menu.items',3,4,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(9,1,'items',NULL,NULL,'{\"title\":\"Documentation\",\"reference\":\"https:\\/\\/docs.octobercms.com\\/\",\"is_hidden\":\"0\",\"code\":\"documentation\",\"css_class\":\"\",\"is_external\":\"1\",\"nesting\":\"0\",\"replace\":\"0\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:regular_menu.items',6,4,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(10,1,'items',NULL,NULL,'{\"title\":\"Contact\",\"reference\":\"october:\\/\\/cms-page@link\\/contact?title=Contact+Us+%28contact%29\",\"is_hidden\":\"0\",\"code\":\"contact\",\"css_class\":\"\",\"is_external\":\"0\",\"nesting\":\"0\",\"replace\":\"0\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:regular_menu.items',1,5,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(11,1,'items',NULL,NULL,'{\"title\":\"Buy a License\",\"reference\":\"https:\\/\\/octobercms.com\\/pricing\",\"is_hidden\":\"0\",\"code\":\"buy-license\",\"css_class\":\"\",\"is_external\":\"1\",\"nesting\":\"0\",\"replace\":\"0\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:regular_menu.items',6,5,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(12,1,'items',NULL,NULL,'{\"title\":\"YouTube Channel\",\"reference\":\"https:\\/\\/www.youtube.com\\/c\\/OctoberCMSOfficial\",\"is_hidden\":\"0\",\"code\":\"youtube-channel\",\"css_class\":\"\",\"is_external\":\"1\",\"nesting\":\"0\",\"replace\":\"0\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:regular_menu.items',6,6,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(13,2,'sitemap_items',NULL,NULL,'{\"title\":\"Homepage\",\"reference\":\"october:\\/\\/cms-page@link\\/index?title=Demonstration+%28index%29\",\"is_hidden\":\"0\",\"code\":\"homepage\",\"css_class\":\"\",\"is_external\":\"0\",\"nesting\":\"0\",\"replace\":\"0\",\"priority\":\"0.1\",\"changefreq\":\"weekly\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:sitemap_menu.sitemap_items',NULL,1,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(14,2,'sitemap_items',NULL,NULL,'{\"title\":\"Blog\",\"reference\":\"october:\\/\\/cms-page@link\\/blog\\/index?title=Blog+Homepage+%28blog%2Findex%29\",\"is_hidden\":\"0\",\"code\":\"blog\",\"css_class\":\"\",\"is_external\":\"0\",\"nesting\":\"0\",\"replace\":\"0\",\"priority\":\"0.2\",\"changefreq\":\"always\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:sitemap_menu.sitemap_items',NULL,2,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(15,2,'sitemap_items',NULL,NULL,'{\"title\":\"Blog Posts\",\"reference\":\"october:\\/\\/list-entry-edcd102e-0525-4e4d-b07e-633ae6c18db6@link\\/?cms_page=blog%2Fpost\",\"is_hidden\":\"0\",\"code\":\"blog-posts\",\"css_class\":\"\",\"is_external\":\"0\",\"nesting\":\"0\",\"replace\":\"0\",\"priority\":\"0.3\",\"changefreq\":\"daily\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:sitemap_menu.sitemap_items',NULL,3,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(16,2,'sitemap_items',NULL,NULL,'{\"title\":\"Blog Categories\",\"reference\":\"october:\\/\\/list-entry-b022a74b-15e6-4c6b-9eb9-17efc5103543@link\\/?cms_page=blog%2Fcategory\",\"is_hidden\":\"0\",\"code\":\"blog-categories\",\"css_class\":\"\",\"is_external\":\"0\",\"nesting\":\"0\",\"replace\":\"0\",\"priority\":\"0.4\",\"changefreq\":\"weekly\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:sitemap_menu.sitemap_items',NULL,4,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(17,2,'sitemap_items',NULL,NULL,'{\"title\":\"Wiki\",\"reference\":\"october:\\/\\/cms-page@link\\/wiki\\/index?title=Wiki+Docs+Demo+%28wiki%2Findex%29\",\"is_hidden\":\"0\",\"code\":\"wiki\",\"css_class\":\"\",\"is_external\":\"0\",\"nesting\":\"0\",\"replace\":\"0\",\"priority\":\"0.2\",\"changefreq\":\"daily\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:sitemap_menu.sitemap_items',NULL,5,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(18,2,'sitemap_items',NULL,NULL,'{\"title\":\"All Articles\",\"reference\":\"october:\\/\\/list-entry-339b11b7-69ad-43c4-9be1-6953e7738827@link\\/?cms_page=wiki%2Farticle\",\"is_hidden\":\"0\",\"code\":\"all-articles\",\"css_class\":\"\",\"is_external\":\"0\",\"nesting\":\"1\",\"replace\":\"0\",\"priority\":\"0.3\",\"changefreq\":\"daily\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:sitemap_menu.sitemap_items',NULL,6,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(19,2,'sitemap_items',NULL,NULL,'{\"title\":\"About\",\"reference\":\"october:\\/\\/cms-page@link\\/about?title=About+Page+%28about%29\",\"is_hidden\":\"0\",\"code\":\"about\",\"css_class\":\"\",\"is_external\":\"0\",\"nesting\":\"0\",\"replace\":\"0\",\"priority\":\"0.6\",\"changefreq\":\"weekly\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:sitemap_menu.sitemap_items',NULL,7,'2026-02-07 19:01:33','2026-02-07 19:01:33'),(20,2,'sitemap_items',NULL,NULL,'{\"title\":\"Contact\",\"reference\":\"october:\\/\\/cms-page@link\\/contact?title=Contact+Us+%28contact%29\",\"is_hidden\":\"0\",\"code\":\"contact\",\"css_class\":\"\",\"is_external\":\"0\",\"nesting\":\"0\",\"replace\":\"0\",\"priority\":\"0.6\",\"changefreq\":\"weekly\"}','Tailor\\Models\\EntryRecord@85e471d2-09b9-4f3d-a63b-1ae9d92d2879:sitemap_menu.sitemap_items',NULL,8,'2026-02-07 19:01:33','2026-02-07 19:01:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for About Page [Page\\About].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c`
--

LOCK TABLES `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c` WRITE;
/*!40000 ALTER TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c` DISABLE KEYS */;
INSERT INTO `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1c` VALUES (1,1,1,'a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1',NULL,'About Us','about-us',1,NULL,'2026-02-07 19:01:32',NULL,1,NULL,NULL,0,NULL,NULL,NULL,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Repeaters for About Page [Page\\About].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r`
--

LOCK TABLES `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r` WRITE;
/*!40000 ALTER TABLE `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r` DISABLE KEYS */;
INSERT INTO `xc_a63fabaf7c0b4c74b36f7abf1a3ad1c1r` VALUES (1,1,'blocks',NULL,'image_slice','{\"image\":\"\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:image_slice',NULL,1,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(2,1,'blocks',NULL,'paragraph_block','{\"title\":\"Outstanding performance\",\"content\":\"<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.<\\/p>\",\"image\":\"\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:paragraph_block',NULL,2,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(3,1,'blocks',NULL,'detailed_block','{\"title\":\"Why work with us\",\"content\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<\\/p>\",\"list_items\":\"[{\\\"text\\\":\\\"Doloremque\\\"},{\\\"text\\\":\\\"Beatae vitae\\\"},{\\\"text\\\":\\\"Totam rem aperiam\\\"}]\",\"button_text\":\"Learn more about our process\",\"button_url\":\"https:\\/\\/octobercms.com\\/features\",\"image\":\"\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:detailed_block',NULL,3,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(4,1,'blocks',NULL,'scoreboard_metrics','[]','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:scoreboard_metrics',NULL,4,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(5,4,'metrics',NULL,NULL,'{\"number\":3912,\"description\":\"Sed ut perspiciatis\",\"icon\":\"notepad\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:scoreboard_metrics.metrics',NULL,1,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(6,4,'metrics',NULL,NULL,'{\"number\":223,\"description\":\"Nemo enim ipsam\",\"icon\":\"shield\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:scoreboard_metrics.metrics',NULL,2,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(7,4,'metrics',NULL,NULL,'{\"number\":863,\"description\":\"Nam libero tempore\",\"icon\":\"basket\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:scoreboard_metrics.metrics',NULL,3,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(8,4,'metrics',NULL,NULL,'{\"number\":865,\"description\":\"Et harum quidem rerum\",\"icon\":\"briefcase\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:scoreboard_metrics.metrics',NULL,4,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(9,1,'blocks',NULL,'team_leaders','[]','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders',NULL,5,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(10,9,'members',NULL,NULL,'{\"title\":\"Andy Anderson\",\"role\":\"Sales Manager\",\"description\":\"Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.\",\"avatar\":\"\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members',NULL,1,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(11,10,'social_links',NULL,NULL,'{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',NULL,1,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(12,10,'social_links',NULL,NULL,'{\"platform\":\"linkedin\",\"url\":\"https:\\/\\/www.linkedin.com\\/company\\/october-cms\\/\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',NULL,2,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(13,10,'social_links',NULL,NULL,'{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',NULL,3,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(14,9,'members',NULL,NULL,'{\"title\":\"Bob Harris\",\"role\":\"Product Designer\",\"description\":\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque.\",\"avatar\":\"\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members',NULL,2,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(15,14,'social_links',NULL,NULL,'{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',NULL,1,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(16,14,'social_links',NULL,NULL,'{\"platform\":\"youtube\",\"url\":\"https:\\/\\/www.youtube.com\\/c\\/OctoberCMSOfficial\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',NULL,2,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(17,14,'social_links',NULL,NULL,'{\"platform\":\"dribbble\",\"url\":\"https:\\/\\/www.dribbble.com\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',NULL,3,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(18,14,'social_links',NULL,NULL,'{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',NULL,4,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(19,9,'members',NULL,NULL,'{\"title\":\"Ann Lewis\",\"role\":\"Marketing Manager\",\"description\":\"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla.\",\"avatar\":\"\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members',NULL,3,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(20,19,'social_links',NULL,NULL,'{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',NULL,1,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(21,19,'social_links',NULL,NULL,'{\"platform\":\"linkedin\",\"url\":\"https:\\/\\/www.linkedin.com\\/company\\/october-cms\\/\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',NULL,2,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(22,19,'social_links',NULL,NULL,'{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',NULL,3,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(23,9,'members',NULL,NULL,'{\"title\":\"Christina Thompson\",\"role\":\"System Analyst\",\"description\":\"Et harum quidem rerum facilis est et expedita distinctio.\",\"avatar\":\"\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members',NULL,4,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(24,23,'social_links',NULL,NULL,'{\"platform\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',NULL,1,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(25,23,'social_links',NULL,NULL,'{\"platform\":\"youtube\",\"url\":\"https:\\/\\/www.youtube.com\\/c\\/OctoberCMSOfficial\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',NULL,2,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(26,23,'social_links',NULL,NULL,'{\"platform\":\"dribbble\",\"url\":\"https:\\/\\/www.dribbble.com\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',NULL,3,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(27,23,'social_links',NULL,NULL,'{\"platform\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\\/octobercms\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',NULL,4,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(28,9,'members',NULL,NULL,'{\"title\":\"John Smith\",\"role\":\"President\",\"description\":\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.\",\"avatar\":\"\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members',NULL,5,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(29,28,'social_links',NULL,NULL,'{\"platform\":\"dribbble\",\"url\":\"https:\\/\\/www.dribbble.com\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',NULL,1,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(30,28,'social_links',NULL,NULL,'{\"platform\":\"linkedin\",\"url\":\"https:\\/\\/www.linkedin.com\\/company\\/october-cms\\/\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',NULL,2,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(31,28,'social_links',NULL,NULL,'{\"platform\":\"youtube\",\"url\":\"https:\\/\\/www.youtube.com\\/c\\/OctoberCMSOfficial\"}','Tailor\\Models\\EntryRecord@a63fabaf-7c0b-4c74-b36f-7abf1a3ad1c1.blocks:team_leaders.members.social_links',NULL,3,'2026-02-07 19:01:32','2026-02-07 19:01:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Category [Blog\\Category].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_b022a74b15e64c6b9eb917efc5103543c`
--

LOCK TABLES `xc_b022a74b15e64c6b9eb917efc5103543c` WRITE;
/*!40000 ALTER TABLE `xc_b022a74b15e64c6b9eb917efc5103543c` DISABLE KEYS */;
INSERT INTO `xc_b022a74b15e64c6b9eb917efc5103543c` VALUES (1,1,1,'b022a74b-15e6-4c6b-9eb9-17efc5103543',NULL,'Announcements','announcements',1,NULL,'2026-02-07 19:01:32',NULL,1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt molliti',NULL,NULL,NULL,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(2,1,2,'b022a74b-15e6-4c6b-9eb9-17efc5103543',NULL,'News','news',1,NULL,'2026-02-07 19:01:32',NULL,1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',NULL,NULL,NULL,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(3,1,3,'b022a74b-15e6-4c6b-9eb9-17efc5103543',NULL,'Startup Ideas','startup-ideas',1,NULL,'2026-02-07 19:01:32',NULL,1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proide',NULL,NULL,NULL,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(4,1,4,'b022a74b-15e6-4c6b-9eb9-17efc5103543',NULL,'Updates','updates',1,NULL,'2026-02-07 19:01:32',NULL,1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt molliti',NULL,NULL,NULL,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(5,1,5,'b022a74b-15e6-4c6b-9eb9-17efc5103543',NULL,'Automation','automation',1,NULL,'2026-02-07 19:01:32',NULL,1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',NULL,NULL,NULL,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Content for Post [Blog\\Post].';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xc_edcd102e05254e4db07e633ae6c18db6c`
--

LOCK TABLES `xc_edcd102e05254e4db07e633ae6c18db6c` WRITE;
/*!40000 ALTER TABLE `xc_edcd102e05254e4db07e633ae6c18db6c` DISABLE KEYS */;
INSERT INTO `xc_edcd102e05254e4db07e633ae6c18db6c` VALUES (1,1,1,'edcd102e-0525-4e4d-b07e-633ae6c18db6','regular_post','Consectetur adipiscing elit','consectetur-adipiscing-elit',1,NULL,'2026-02-07 19:01:32',NULL,1,NULL,NULL,0,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>',1,'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',NULL,NULL,NULL,NULL,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32'),(2,1,2,'edcd102e-0525-4e4d-b07e-633ae6c18db6','regular_post','Nemo enim ipsam','nemo-enim-ipsam',1,NULL,'2026-02-07 19:01:32',NULL,1,NULL,NULL,0,NULL,NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p><p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p>',1,'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.',NULL,NULL,NULL,NULL,NULL,'2026-02-07 19:01:32','2026-02-07 19:01:32');
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
INSERT INTO `xc_edcd102e05254e4db07e633ae6c18db6j` VALUES (1,1,'Tailor\\Models\\EntryRecord@xc_b022a74b15e64c6b9eb917efc5103543c','categories',NULL),(2,2,'Tailor\\Models\\EntryRecord@xc_b022a74b15e64c6b9eb917efc5103543c','categories',NULL);
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

-- Dump completed on 2026-02-07 19:20:42
