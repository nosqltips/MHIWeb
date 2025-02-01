/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.5.25-MariaDB, for Linux (x86_64)
--
-- Host: 173.165.134.67    Database: mhi
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1

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
-- Current Database: `mhi`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mhi` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `mhi`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
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
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$GQZI9U8KZ2Q096GGazMqd7$+gC/hYOAPgG6cQqueJZuptkZmblT/LFGwKNLfTqrSGE=','2024-09-05 17:43:42.196401',1,'crlyon2','','','crlyon2@gmail.com',1,1,'2024-08-08 03:36:03.823930'),(3,'pbkdf2_sha256$720000$8MkfHdxsl3Ki43j86ijHqo$09kP2KMpr+AmbqdD64VDMyzRBRx141oWhMk09+62jbk=','2024-08-13 04:09:58.839478',1,'crbrown','Craig','Brown','',1,1,'2024-08-13 01:42:10.000000'),(4,'pbkdf2_sha256$720000$joIEuS1JplIUOc4FSuLtDt$Kd9vfhw1rP7YmUSVStuEga28Q2ID0ACcg8MVmJar7gU=','2024-08-14 01:15:37.613707',1,'paprice','Patrick','Price','',1,1,'2024-08-13 02:10:15.000000'),(6,'pbkdf2_sha256$720000$GkQAGiszpwiAfsZyldX9HI$tavWf3rTQpVi/dYpFAg9Nl8ZJ2dglBQPTNt3pJxeY/E=','2024-08-14 01:13:36.521323',1,'daeggett','','','',1,1,'2024-08-13 02:12:37.000000'),(7,'pbkdf2_sha256$720000$2L02lZtcZqrx8tJ0F7wLZO$Hi6TBg0TJrv/nLg+DKXQp3qtgHyYQl2r3MZMtMGV9T8=','2024-08-14 01:15:18.759364',1,'rawhitehead','','','',1,1,'2024-08-14 01:10:39.000000'),(8,'pbkdf2_sha256$720000$GhfRsbXrYXhGysWqOeuBBL$Wckd0g7/nelgNWjIlnIDy8UwCVwBFDNNUDc70lgtrZs=','2024-08-14 01:12:41.000000',1,'daerekson','David','Erekson','ereksond@gmail.com',1,1,'2024-08-14 01:12:06.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-08-12 01:43:01.365657','2','mollyandchuck',1,'[{\"added\": {}}]',4,1),(2,'2024-08-12 01:44:01.963056','2','mollyandchuck',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\"]}}]',4,1),(3,'2024-08-12 01:44:09.552735','2','mollyandchuck',2,'[]',4,1),(4,'2024-08-13 01:42:12.382800','3','crbrown',1,'[{\"added\": {}}]',4,1),(5,'2024-08-13 01:42:19.514295','3','crbrown',2,'[]',4,1),(6,'2024-08-13 01:42:36.930581','3','crbrown',2,'[{\"changed\": {\"fields\": [\"Superuser status\"]}}]',4,1),(7,'2024-08-13 01:42:50.123248','3','crbrown',2,'[{\"changed\": {\"fields\": [\"Staff status\"]}}]',4,1),(8,'2024-08-13 02:09:53.356428','2','mollyandchuck',3,'',4,1),(9,'2024-08-13 02:10:16.891226','4','paprice',1,'[{\"added\": {}}]',4,1),(10,'2024-08-13 02:10:42.888676','4','paprice',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Staff status\", \"Superuser status\"]}}]',4,1),(11,'2024-08-13 02:10:57.101323','3','crbrown',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(12,'2024-08-13 02:11:31.387453','5','daedwards',1,'[{\"added\": {}}]',4,1),(13,'2024-08-13 02:11:38.702889','5','daedwards',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1),(14,'2024-08-13 02:12:39.497105','6','daeggett',1,'[{\"added\": {}}]',4,1),(15,'2024-08-13 02:12:58.506562','6','daeggett',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1),(16,'2024-08-14 01:10:40.575992','7','rawhitehead',1,'[{\"added\": {}}]',4,1),(17,'2024-08-14 01:10:51.060905','7','rawhitehead',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1),(18,'2024-08-14 01:11:41.410026','5','daedwards',3,'',4,1),(19,'2024-08-14 01:12:07.973983','8','daerekson',1,'[{\"added\": {}}]',4,1),(20,'2024-08-14 01:12:34.652202','8','daerekson',2,'[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]',4,1),(21,'2024-08-14 01:15:51.197337','8','daerekson',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,8),(22,'2024-08-14 01:16:03.755774','8','daerekson',2,'[{\"changed\": {\"fields\": [\"First name\"]}}]',4,8);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-08-08 03:32:50.033562'),(2,'auth','0001_initial','2024-08-08 03:32:51.469439'),(3,'admin','0001_initial','2024-08-08 03:32:51.790856'),(4,'admin','0002_logentry_remove_auto_add','2024-08-08 03:32:51.830526'),(5,'admin','0003_logentry_add_action_flag_choices','2024-08-08 03:32:51.870872'),(6,'contenttypes','0002_remove_content_type_name','2024-08-08 03:32:52.163237'),(7,'auth','0002_alter_permission_name_max_length','2024-08-08 03:32:52.283388'),(8,'auth','0003_alter_user_email_max_length','2024-08-08 03:32:52.377391'),(9,'auth','0004_alter_user_username_opts','2024-08-08 03:32:52.417070'),(10,'auth','0005_alter_user_last_login_null','2024-08-08 03:32:52.529420'),(11,'auth','0006_require_contenttypes_0002','2024-08-08 03:32:52.575366'),(12,'auth','0007_alter_validators_add_error_messages','2024-08-08 03:32:52.617104'),(13,'auth','0008_alter_user_username_max_length','2024-08-08 03:32:52.713090'),(14,'auth','0009_alter_user_last_name_max_length','2024-08-08 03:32:52.810206'),(15,'auth','0010_alter_group_name_max_length','2024-08-08 03:32:52.911094'),(16,'auth','0011_update_proxy_permissions','2024-08-08 03:32:53.076281'),(17,'auth','0012_alter_user_first_name_max_length','2024-08-08 03:32:53.172627'),(18,'sessions','0001_initial','2024-08-08 03:35:12.111432');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3665nkrhtuy2q4ul2d8y7ax6ycjyib4e','.eJxVjEsOwiAUAO_C2pBC-bp07xnIezyQqoGktCvj3ZWkC93OTObFAuxbCXtPa1iInZlhp1-GEB-pDkF3qLfGY6vbuiAfCT9s59dG6Xk52r9BgV7G1kqnZhfRzABoCUlPgOisMN6QkNnHWWdKQmRJGHVWRjucvMpW2y9h7w_vhTg_:1se2a0:i2ofP0oj_mFMHulnfYiIFRYkiP2SVKfQy8uXmW4o6bI','2024-08-28 01:13:36.528005'),('9is09nxwcuheaxq3ci6pmuwby5j715hn','.eJxVjEEOwiAQRe_C2hCG0oIu3XsGMgMzUjUlKe3KeHfbpAvd_vfef6uI61Li2niOY1YXBer0uxGmJ087yA-c7lWnOi3zSHpX9EGbvtXMr-vh_h0UbGWrSQCtdCBn8RJ64kGQoEuZLXgrEoIMrs9kwG00GOMxOODAyMyURH2-DAA5KQ:1sdgVU:GSJsvGo3RqnyCJU4c4xq5po8mmcAoelMHn3j2d8Jx6Q','2024-08-27 01:39:28.619438'),('g21v0w91btf35yxgp5d1azaoh3kv446r','.eJxVjEEOwiAQRe_C2pDCWIou3XsGMswMUjWQlHZlvLuSdKHb_977LxVwW3PYmixhZnVWR3X43SLSQ0oHfMdyq5pqWZc56q7onTZ9rSzPy-7-HWRsudcpptPIDMkxuUkYJkMI3nvDDlAsSByjI0uQxNgUBQY_fB0SJm9JvT8eCTlT:1se2bx:PUg2YrKzD5KrHUo9SMWUcHsGV423nR95nqSupR_Zb0I','2024-08-28 01:15:37.618871'),('rtu0ti9bf663127x5or32nomlofx7via','.eJxVjDsOwyAQRO9CHSHwYgMp0_sMaJdPcBKBZOwqyt2DJReJNNXMm_dmDvctu73F1S2BXZlhl9-O0D9jOYbwwHKv3NeyrQvxA-Hn2vhcQ3zdTvZPkLHl_lZAMkkEhdRD00h6GgA8GguStFF2NFGmZMEmYVWwYkii65GElzom9vkC5Q44LQ:1se2Z7:vT14hk78ZcHei5rRmZilX9V8wbOd0_dFRRkJdRG2XZQ','2024-08-28 01:12:41.736865'),('sggee8ufwchnbzjt04ig7r6e7kfh560r','.eJxVjEEOgjAQRe_StWloC9PBpXvPQGamg6CmTSisjHdXEha6_e-9_zIDbes0bFWXYU7mbKI5_W5M8tC8g3SnfCtWSl6Xme2u2INWey1Jn5fD_TuYqE7fummVuBeMDYFT7QVC8tyyo-BRGBovPLYo0SG6LmDQOIID6AjAC0Tz_gDr-Dd6:1se2be:mXQbApO7oLkqcFIif7TPRcAXWJNpJsxqcC8c6Wr9McE','2024-08-28 01:15:18.764579'),('v5pap19kb7le9mcswm1hh1da4zebtnj9','.eJxVjDEOwjAMRe-SGUVNarsKIztniJLaJgWUSk07Ie4OlTrA-t97_2Vi2tYStyZLnNicTW9Ov1tO40PqDvie6m2241zXZcp2V-xBm73OLM_L4f4dlNTKtyZWFafggZKwBlLqgAN6QnSgxL2ioE8ig6jzGBAlZ4ZOBgVFMO8P_jo4gQ:1sdir8:sQnAN2vk9Sn2n7lKfushK91U-yOKkitxCW0oePSPne0','2024-08-27 04:09:58.844239');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mhi_area_ward`
--

DROP TABLE IF EXISTS `mhi_area_ward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mhi_area_ward` (
  `area_ward_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `area_nm` text DEFAULT NULL,
  `ward_nm` text DEFAULT NULL,
  `community_nm` text DEFAULT NULL,
  `last_edit_dt` text DEFAULT NULL,
  PRIMARY KEY (`area_ward_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `mhi_area_ward_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `mhi_person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mhi_area_ward`
--

LOCK TABLES `mhi_area_ward` WRITE;
/*!40000 ALTER TABLE `mhi_area_ward` DISABLE KEYS */;
INSERT INTO `mhi_area_ward` VALUES (1,1,NULL,'Jordan View','NorthGranger','2024-06-25'),(2,2,NULL,'Jordan View','NorthGranger','2024-06-25'),(3,10,'Stansbury',NULL,'NorthGranger','2024-06-25'),(4,11,'Stansbury',NULL,'NorthGranger','2024-06-25'),(5,16,NULL,'Jordan View','NorthGranger','2024-06-25'),(6,17,NULL,'Jordan View','NorthGranger','2024-06-25'),(7,21,'Stansbury','San Marcos','NorthGranger','2024-06-25'),(8,22,'Stansbury','San Marcos','NorthGranger','2024-06-25'),(9,29,'Chesterfield','Jordan View','NorthGranger','2024-06-25'),(10,38,'Chesterfield','Jordan View','NorthGranger','2024-06-25'),(11,41,NULL,'Granger 15','NorthGranger','2024-06-25'),(12,46,NULL,'Home Ward','NorthGranger','2024-06-25'),(13,47,NULL,'Home Ward','NorthGranger','2024-06-25'),(14,50,'Westlake','Westlake','NorthGranger','2024-06-25'),(15,51,'Westlake','Westlake','NorthGranger','2024-06-25'),(16,52,NULL,'Granger 15','NorthGranger','2024-06-25'),(17,56,NULL,'Home Ward','NorthGranger','2024-06-25'),(18,57,NULL,'Home Ward','NorthGranger','2024-06-25'),(19,62,'Stansbury','Granger 15','NorthGranger','2024-06-25'),(20,70,'Chesterfield','Jordan View','NorthGranger','2024-06-25'),(21,71,'Chesterfield','Jordan View','NorthGranger','2024-06-25'),(22,72,'Westlake','Westlake','NorthGranger','2024-06-25'),(23,73,'Westlake','Westlake','NorthGranger','2024-06-25'),(24,74,NULL,'Granger 15','NorthGranger','2024-06-25'),(25,80,'Westlake','Westlake','NorthGranger','2024-06-25'),(26,81,'Westlake','Westlake','NorthGranger','2024-06-25'),(27,149,'Westlake',NULL,'NorthGranger','2024-06-25');
/*!40000 ALTER TABLE `mhi_area_ward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mhi_assignment_role`
--

DROP TABLE IF EXISTS `mhi_assignment_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mhi_assignment_role` (
  `assignment_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `ar_report_to_id` int(11) DEFAULT NULL,
  `last_edit_dt` text DEFAULT NULL,
  PRIMARY KEY (`assignment_role_id`),
  KEY `assignment_id` (`assignment_id`),
  KEY `ar_report_to_id` (`ar_report_to_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `mhi_assignment_role_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `mhi_lu_assignment` (`assignment_id`),
  CONSTRAINT `mhi_assignment_role_ibfk_2` FOREIGN KEY (`ar_report_to_id`) REFERENCES `mhi_assignment_role` (`assignment_role_id`),
  CONSTRAINT `mhi_assignment_role_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `mhi_lu_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mhi_assignment_role`
--

LOCK TABLES `mhi_assignment_role` WRITE;
/*!40000 ALTER TABLE `mhi_assignment_role` DISABLE KEYS */;
INSERT INTO `mhi_assignment_role` VALUES (1,1,1,4,'2024-06-27'),(2,1,2,4,'2024-06-27'),(3,1,3,4,'2024-06-27'),(4,1,4,NULL,'2024-06-27'),(5,1,9,4,'2024-06-27'),(6,2,6,4,'2024-06-27'),(7,2,7,57,'2024-06-27'),(8,2,8,6,'2024-06-27'),(9,2,12,57,'2024-06-27'),(11,2,96,6,'2024-06-27'),(12,2,10,6,'2024-06-27'),(13,2,11,6,'2024-06-27'),(14,3,97,4,'2024-06-27'),(15,3,13,58,'2024-06-27'),(16,3,14,14,'2024-06-27'),(17,3,15,14,'2024-06-27'),(18,3,16,14,'2024-06-27'),(19,3,17,18,'2024-06-27'),(20,3,18,18,'2024-06-27'),(21,3,19,17,'2024-06-27'),(22,3,20,18,'2024-06-27'),(23,3,21,16,'2024-06-27'),(24,3,22,16,'2024-06-27'),(25,3,23,65,'2024-06-27'),(26,3,24,18,'2024-06-27'),(27,3,25,17,'2024-06-27'),(28,2,26,57,'2024-06-27'),(29,3,27,17,'2024-06-27'),(30,3,28,16,'2024-06-27'),(31,3,29,16,'2024-07-21'),(32,3,30,17,'2024-06-27'),(33,3,31,16,'2024-06-27'),(34,3,32,16,'2024-06-27'),(35,3,33,17,'2024-06-27'),(36,3,34,18,'2024-06-27'),(37,3,35,58,'2024-06-27'),(38,3,36,58,'2024-06-27'),(39,5,98,4,'2024-06-27'),(40,5,37,39,'2024-06-27'),(41,5,38,40,'2024-06-27'),(42,5,39,40,'2024-06-27'),(44,5,41,40,'2024-06-27'),(46,5,42,39,'2024-06-27'),(48,5,43,39,'2024-06-27'),(49,4,44,58,'2024-06-27'),(51,5,45,39,'2024-06-27'),(57,2,47,4,'2024-06-30'),(58,3,48,14,'2024-06-30'),(59,3,49,58,'2024-06-30'),(60,3,50,58,'2024-06-30'),(61,3,51,16,'2024-06-30'),(62,3,52,16,'2024-06-30'),(63,3,53,16,'2024-06-30'),(64,3,54,16,'2024-06-30'),(65,3,55,17,'2024-06-30'),(66,3,56,17,'2024-06-30'),(67,3,57,17,'2024-06-30'),(69,2,58,57,'2024-06-30'),(70,2,59,57,'2024-06-30'),(71,2,60,6,'2024-06-30'),(72,2,61,6,'2024-06-30'),(73,2,62,6,'2024-06-30'),(74,5,63,39,'2024-06-30'),(75,5,64,39,'2024-06-30'),(76,5,65,39,'2024-06-30'),(78,5,66,74,'2024-06-30'),(79,5,67,75,'2024-06-30'),(80,5,68,76,'2024-06-30'),(81,5,69,74,'2024-06-30'),(82,5,70,75,'2024-06-30'),(83,5,71,76,'2024-06-30'),(84,5,72,75,'2024-06-30'),(85,5,73,76,'2024-06-30'),(86,5,74,74,'2024-06-30'),(87,5,75,40,'2024-06-30'),(88,5,76,74,'2024-06-27'),(89,5,77,75,'2024-06-27'),(90,5,78,76,'2024-06-27'),(91,6,79,4,'2024-07-06'),(92,3,80,17,'2024-07-06'),(93,3,95,58,'2024-07-21'),(94,3,81,16,'2024-07-06'),(95,3,82,17,'2024-07-06'),(97,5,83,39,'2024-07-08'),(98,5,84,39,'2024-07-14'),(99,5,94,39,'2024-07-14'),(100,5,86,39,'2024-07-14'),(101,5,87,39,'2024-07-14'),(102,5,88,39,'2024-07-14');
/*!40000 ALTER TABLE `mhi_assignment_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mhi_demographics_load`
--

DROP TABLE IF EXISTS `mhi_demographics_load`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mhi_demographics_load` (
  `ID` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `HomeOrg` varchar(255) DEFAULT NULL,
  `Languages` varchar(255) DEFAULT NULL,
  `Onboarding` varchar(255) DEFAULT NULL,
  `Source` varchar(255) DEFAULT NULL,
  `DateCallLetterSent` varchar(255) DEFAULT NULL,
  `DateCalled` varchar(255) DEFAULT NULL,
  `ReleaseDate` varchar(255) DEFAULT NULL,
  `Interviewed` varchar(255) DEFAULT NULL,
  `BadgeOrdered` varchar(255) DEFAULT NULL,
  `BadgeDelivered` varchar(255) DEFAULT NULL,
  `AssignmentCommunicated` varchar(255) DEFAULT NULL,
  `CityForms` varchar(255) DEFAULT NULL,
  `GoogleDriveAccess` varchar(255) DEFAULT NULL,
  `MemberTools` varchar(255) DEFAULT NULL,
  `MTE` varchar(255) DEFAULT NULL,
  `Assignment` varchar(255) DEFAULT NULL,
  `Role` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Community` varchar(255) DEFAULT NULL,
  `Area` varchar(255) DEFAULT NULL,
  `Neighborhood` varchar(255) DEFAULT NULL,
  `Ward` varchar(255) DEFAULT NULL,
  `WardCouncil` varchar(255) DEFAULT NULL,
  `Notes` text DEFAULT NULL,
  `HasKey` varchar(255) DEFAULT NULL,
  `NeedsKey` varchar(255) DEFAULT NULL,
  `KeyFobInfo` varchar(255) DEFAULT NULL,
  `Releases` varchar(255) DEFAULT NULL,
  `ReturnKeysFobsDate` varchar(255) DEFAULT NULL,
  `ExitInterviewDate` varchar(255) DEFAULT NULL,
  `RemoveMemberToolAccessDate` varchar(255) DEFAULT NULL,
  `ReleaseLettertoHomeOrgDate` varchar(255) DEFAULT NULL,
  `RemoveGoogleDriveAccessDate` varchar(255) DEFAULT NULL,
  `EmailGroups` varchar(255) DEFAULT NULL,
  `Executive` varchar(255) DEFAULT NULL,
  `CRC` varchar(255) DEFAULT NULL,
  `Admin` varchar(255) DEFAULT NULL,
  `ADs` varchar(255) DEFAULT NULL,
  `DOS` varchar(255) DEFAULT NULL,
  `NS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mhi_demographics_load`
--

LOCK TABLES `mhi_demographics_load` WRITE;
/*!40000 ALTER TABLE `mhi_demographics_load` DISABLE KEYS */;
/*!40000 ALTER TABLE `mhi_demographics_load` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mhi_language`
--

DROP TABLE IF EXISTS `mhi_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mhi_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_txt` text DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mhi_language`
--

LOCK TABLES `mhi_language` WRITE;
/*!40000 ALTER TABLE `mhi_language` DISABLE KEYS */;
INSERT INTO `mhi_language` VALUES (1,'Spanish'),(2,'Samoan'),(3,'Khmer'),(4,'Japanese'),(5,'Danish');
/*!40000 ALTER TABLE `mhi_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mhi_lu_assignment`
--

DROP TABLE IF EXISTS `mhi_lu_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mhi_lu_assignment` (
  `assignment_id` int(11) NOT NULL AUTO_INCREMENT,
  `assignment_code_txt` text DEFAULT NULL,
  `assignment_desc_txt` text DEFAULT NULL,
  `last_edit_dt` text DEFAULT NULL,
  PRIMARY KEY (`assignment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mhi_lu_assignment`
--

LOCK TABLES `mhi_lu_assignment` WRITE;
/*!40000 ALTER TABLE `mhi_lu_assignment` DISABLE KEYS */;
INSERT INTO `mhi_lu_assignment` VALUES (1,'Exec','Executive Leadership','2024-06-27'),(2,'Admin','Administrative Support','2024-06-27'),(3,'CRC','Community Resource Center','2024-06-27'),(4,'DOS','Days of Service','2024-06-27'),(5,'NS','Neighborhood Services','2024-06-27'),(6,'InterFaith','Interfaith Council','2024-07-06');
/*!40000 ALTER TABLE `mhi_lu_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mhi_lu_role`
--

DROP TABLE IF EXISTS `mhi_lu_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mhi_lu_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code_txt` text DEFAULT NULL,
  `role_desc_txt` text DEFAULT NULL,
  `role_level_num` int(11) DEFAULT NULL,
  `last_edit_dt` text DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mhi_lu_role`
--

LOCK TABLES `mhi_lu_role` WRITE;
/*!40000 ALTER TABLE `mhi_lu_role` DISABLE KEYS */;
INSERT INTO `mhi_lu_role` VALUES (1,NULL,'Associate Executive Director',2,'2024-06-27'),(2,NULL,'Utah Director Community Support Services',2,'2024-06-27'),(3,NULL,'City Chair',2,'2024-06-27'),(4,NULL,'Executive Director',1,'2024-06-27'),(6,NULL,'Administrative Director',2,'2024-06-27'),(7,NULL,'Graphic Design Specialist',3,'2024-06-27'),(8,NULL,'Website Management Specialist',3,'2024-06-27'),(9,NULL,'Information Technology Specialist',3,'2024-06-27'),(10,NULL,'Finance Specialist',3,'2024-06-27'),(11,NULL,'Newsletter Specialist',3,'2024-06-27'),(12,NULL,'Social Media Specialist',3,'2024-06-27'),(13,NULL,'Activities Director',3,'2024-06-27'),(14,NULL,'Adult Services Director',3,'2024-06-27'),(15,NULL,'Education Director',3,'2024-06-27'),(16,NULL,'Music and Arts Director',3,'2024-06-27'),(17,NULL,'Piano Coordinator',4,'2024-06-27'),(18,NULL,'Piano Teacher',4,'2024-06-27'),(19,NULL,'Pre K-12 Coordinator',4,'2024-06-27'),(20,NULL,'Art Teacher',4,'2024-06-27'),(21,NULL,'Cambodian Outreach',3,'2024-06-27'),(22,NULL,'Citizenship Specialist',3,'2024-06-27'),(23,NULL,'ESL Teacher',3,'2024-06-27'),(24,NULL,'Guitar Teacher',4,'2024-06-27'),(25,NULL,'Family History Coordinator',4,'2024-06-27'),(26,NULL,'Historian / Photographer',3,'2024-06-27'),(27,NULL,'Spanish Teacher',3,'2024-06-27'),(28,NULL,'Immigration Specialist',3,'2024-06-27'),(29,NULL,'CRC Loans & Grants Specialist',3,'2024-06-27'),(30,NULL,'Math Tutor',3,'2024-06-27'),(31,NULL,'Samoan Outreach',3,'2024-06-27'),(32,NULL,'School Relations Specialist',3,'2024-06-27'),(33,NULL,'Sewing',3,'2024-06-27'),(34,NULL,'Ukulele Teacher',4,'2024-06-27'),(35,NULL,'Youth Council Officer',4,'2024-06-27'),(36,NULL,'Youth In Action Advisor',3,'2024-06-27'),(37,NULL,'Westlake Area Director',3,'2024-06-27'),(38,NULL,'Westlake DOS Project Developer',4,'2024-06-30'),(39,NULL,'Westlake DOS Resource Manager',4,'2024-06-30'),(41,NULL,'Westlake Neighborhood Block Captain Trainer',4,'2024-06-27'),(42,NULL,'Home Repair',3,'2024-06-27'),(43,NULL,'Neighborhood Services Volunteer',3,'2024-06-27'),(44,NULL,'CRC Youth Council',4,'2024-06-27'),(45,NULL,'Associate City Chair',2,'2024-06-27'),(47,NULL,'Admin Director / Executive Secretary',2,'2024-06-30'),(48,NULL,'Youth Activities Director',3,'2024-06-27'),(49,NULL,'Youth Advisor',4,'2024-06-30'),(50,NULL,'Sports Specialist',4,'2024-06-30'),(51,NULL,'Health and Wellness Specialist',4,'2024-06-30'),(52,NULL,'Emergency Preparation Specialist',4,'2024-06-30'),(53,NULL,'Real Estate Specialist',4,'2024-06-30'),(54,NULL,'Naturalization and Legal Specialist',4,'2024-06-30'),(55,NULL,'Language Coordinator - ESL and Others',4,'2024-06-30'),(56,NULL,'Self-Reliance Coordinator / Facilitator',4,'2024-06-30'),(57,NULL,'Continuing Education Coordinator',4,'2024-06-30'),(58,NULL,'Facilities Management / Bldg Scheduler',3,'2024-06-30'),(59,NULL,'Video Editing / Production Specialist',3,'2024-06-30'),(60,NULL,'Demographic Specialist',3,'2024-06-30'),(61,NULL,'DOS Tech Specialist',3,'2024-06-30'),(62,NULL,'Communication / Phone / Translation Specialist',3,'2024-06-30'),(63,NULL,'Stansbury Area Director',3,'2024-06-27'),(64,NULL,'Chesterfield Area Director',3,'2024-06-27'),(65,NULL,'Hillsdale Park / Decker Lake Area Director',3,'2024-06-27'),(66,NULL,'Stansbury DOS Project Developer',4,'2024-06-30'),(67,NULL,'Chesterfield DOS Project Developer',4,'2024-06-30'),(68,NULL,'HP / DL DOS Project Developer',4,'2024-06-30'),(69,NULL,'Stansbury DOS Resource Manager',4,'2024-06-30'),(70,NULL,'Chesterfield DOS Resource Manager',4,'2024-06-30'),(71,NULL,'HP / DL DOS Resource Manager',4,'2024-06-30'),(72,NULL,'Chesterfield DOS Logistics Coordinator',4,'2024-06-30'),(73,NULL,'HP / DL DOS Logistics Coordinator',4,'2024-06-30'),(74,NULL,'Stansbury DOS Logistics Coordinator',4,'2024-06-30'),(75,NULL,'Westlake DOS Logistics Coordinator',4,'2024-06-30'),(76,NULL,'Stansbury Neighborhood Block Captain Trainer',4,'2024-06-30'),(77,NULL,'Chesterfield Neighborhood Block Captain Trainer',4,'2024-06-30'),(78,NULL,'HP / DL Neighborhood Block Captain Trainer',4,'2024-06-30'),(79,NULL,'Interfaith Council Coordinator',2,'2024-07-06'),(80,NULL,'Gardening',3,'2024-07-06'),(81,NULL,'Self Defense Specialist',4,'2024-07-06'),(82,NULL,'Zumba',4,'2024-07-06'),(83,NULL,'NS Consultant',4,'2024-07-08'),(84,NULL,'DOS Area Director',4,'2024-07-14'),(85,NULL,'DOS Youth Council',4,'2024-07-14'),(86,NULL,'Project Development',4,'2024-07-14'),(87,NULL,'Resource Development',4,'2024-07-14'),(88,NULL,'NS Neighborhood Captain',4,'2024-07-14'),(94,NULL,'NS Loans & Grants Specialist',3,'2024-07-21'),(95,NULL,'DOS Youth Council',4,'2024-07-21'),(96,NULL,'Admin IT Specialist',3,'2024-07-21'),(97,NULL,'Associate Executive Director - CRC',2,'2024-07-21'),(98,NULL,'Associate Executive Director - NS',2,'2024-07-21');
/*!40000 ALTER TABLE `mhi_lu_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mhi_org_chart_map`
--

DROP TABLE IF EXISTS `mhi_org_chart_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mhi_org_chart_map` (
  `index` bigint(20) DEFAULT NULL,
  `x_posit_int` bigint(20) DEFAULT NULL,
  `y_posit_int` bigint(20) DEFAULT NULL,
  `width_int` bigint(20) DEFAULT NULL,
  `height_int` bigint(20) DEFAULT NULL,
  `assign_role_txt` text DEFAULT NULL,
  KEY `ix_mhi_org_chart_map_index` (`index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mhi_org_chart_map`
--

LOCK TABLES `mhi_org_chart_map` WRITE;
/*!40000 ALTER TABLE `mhi_org_chart_map` DISABLE KEYS */;
INSERT INTO `mhi_org_chart_map` VALUES (0,3,243,117,57,'AdultServicesDirector'),(1,33,323,107,57,'CambodianOutreach'),(2,33,393,107,57,'CitizenshipSpecialist'),(3,33,463,107,57,'EmergencyPreparationSpecialist'),(4,33,533,107,57,'HealthandWellnessSpecialist'),(5,33,603,107,57,'ImmigrationSpecialist'),(6,33,673,107,57,'CRCLoansGrantsSpecialist'),(7,33,741,107,58,'NaturalizationandLegalSpecialist'),(8,33,813,107,57,'RealEstateSpecialist'),(9,33,883,107,57,'SamoanOutreach'),(10,33,953,107,57,'SchoolRelationsSpecialist'),(11,33,1023,107,57,'SelfDefenseSpecialist'),(12,163,243,117,57,'EducationDirector'),(13,183,53,117,57,'UtahDirectorCommunitySupportServices'),(14,193,323,107,57,'ContinuingEducationCoordinator'),(15,193,393,107,57,'FamilyHistoryCoordinator'),(16,193,463,107,57,'Gardening'),(17,193,533,107,57,'MathTutor'),(18,193,603,107,57,'PreK12Coordinator'),(19,193,671,107,58,'SelfRelianceCoordinatorFacilitator'),(20,193,743,107,57,'Sewing'),(21,193,813,107,57,'SpanishTeacher'),(22,193,883,107,57,'Zumba'),(23,193,953,107,57,'LanguageCoordinatorESLandOthers'),(24,243,153,117,57,'AssociateExecutiveDirectorCRC'),(25,313,53,117,57,'AssociateExecutiveDirector'),(26,323,243,117,57,'MusicandArtsDirector'),(27,353,323,107,57,'ArtTeacher'),(28,353,393,107,57,'GuitarTeacher'),(29,353,463,107,57,'PianoCoordinator'),(30,353,533,107,57,'PianoTeacher'),(31,353,603,107,57,'UkuleleTeacher'),(32,353,953,107,57,'ESLTeacher'),(33,443,53,117,57,'CityChair'),(34,483,243,117,57,'YouthActivitiesDirector'),(35,513,323,107,57,'ActivitiesDirector'),(36,513,393,107,57,'SportsSpecialist'),(37,513,463,107,57,'YouthAdvisor'),(38,513,533,107,57,'YouthCouncilOfficer'),(39,513,603,107,57,'CRCYouthCouncil'),(40,513,673,107,57,'YouthInActionAdvisor'),(41,513,743,107,57,'DOSYouthCouncil'),(42,573,53,117,57,'InformationTechnologySpecialist'),(43,633,153,117,57,'AdminDirectorExecutiveSecretary'),(44,663,323,107,57,'FacilitiesManagementBldgScheduler'),(45,663,393,107,57,'GraphicDesignSpecialist'),(46,663,463,107,57,'HistorianPhotographer'),(47,663,533,107,57,'SocialMediaSpecialist'),(48,663,603,107,57,'VideoEditingProductionSpecialist'),(49,713,3,117,57,'ExecutiveDirector'),(50,793,153,117,57,'AdministrativeDirector'),(51,823,323,107,57,'CommunicationPhoneTranslationSpecialist'),(52,823,393,107,57,'DOSTechSpecialist'),(53,823,463,107,57,'DemographicSpecialist'),(54,823,533,107,57,'AdminITSpecialist'),(55,823,603,107,57,'NewsletterSpecialist'),(56,823,673,107,57,'WebsiteManagementSpecialist'),(57,823,743,107,57,'FinanceSpecialist'),(58,953,3,117,57,'InterfaithCouncilCoordinator'),(59,983,243,117,57,'ChesterfieldAreaDirector'),(60,983,643,107,57,'AssociateCityChair'),(61,983,743,107,57,'ProjectDevelopment'),(62,983,843,107,57,'NeighborhoodServicesVolunteer'),(63,1013,323,107,57,'ChesterfieldDOSLogisticsCoordinator'),(64,1013,393,107,57,'ChesterfieldDOSProjectDeveloper'),(65,1013,463,107,57,'ChesterfieldDOSResourceManager'),(66,1013,533,107,67,'ChesterfieldNeighborhoodBlockCaptainTrainer'),(67,1143,243,117,57,'HillsdaleParkDeckerLakeAreaDirector'),(68,1143,643,107,57,'NSConsultant'),(69,1143,743,107,57,'ResourceDevelopment'),(70,1173,323,107,57,'HPDLDOSLogisticsCoordinator'),(71,1173,393,107,57,'HPDLDOSProjectDeveloper'),(72,1173,463,107,57,'HPDLDOSResourceManager'),(73,1173,533,107,67,'HPDLNeighborhoodBlockCaptainTrainer'),(74,1223,153,117,57,'AssociateExecutiveDirectorNS'),(75,1303,243,117,57,'StansburyAreaDirector'),(76,1303,643,107,57,'HomeRepair'),(77,1303,743,107,57,'DOSAreaDirector'),(78,1333,323,107,57,'StansburyDOSLogisticsCoordinator'),(79,1333,393,107,57,'StansburyDOSProjectDeveloper'),(80,1333,463,107,57,'StansburyDOSResourceManager'),(81,1333,533,107,67,'StansburyNeighborhoodBlockCaptainTrainer'),(82,1463,243,117,57,'WestlakeAreaDirector'),(83,1463,643,107,57,'NSLoansGrantsSpecialist'),(84,1463,743,107,57,'NSNeighborhoodCaptain'),(85,1493,323,107,57,'WestlakeDOSLogisticsCoordinator'),(86,1493,393,107,57,'WestlakeDOSProjectDeveloper'),(87,1493,463,107,57,'WestlakeDOSResourceManager'),(88,1493,533,107,67,'WestlakeNeighborhoodBlockCaptainTrainer');
/*!40000 ALTER TABLE `mhi_org_chart_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mhi_person`
--

DROP TABLE IF EXISTS `mhi_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mhi_person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `guid` text DEFAULT NULL,
  `name_full_txt` text DEFAULT NULL,
  `name_first_txt` text DEFAULT NULL,
  `name_last_txt` text DEFAULT NULL,
  `type_txt` text DEFAULT NULL,
  `status_txt` text DEFAULT NULL,
  `portal_number_txt` text DEFAULT NULL,
  `phone_num` text DEFAULT NULL,
  `email_txt` text DEFAULT NULL,
  `address_txt` text DEFAULT NULL,
  `address_street_txt` text DEFAULT NULL,
  `address_city_txt` text DEFAULT NULL,
  `address_state_txt` text DEFAULT NULL,
  `address_zip_code_txt` text DEFAULT NULL,
  `home_ward_txt` text DEFAULT NULL,
  `home_stake_txt` text DEFAULT NULL,
  `Assignment` text DEFAULT NULL,
  `Role` text DEFAULT NULL,
  `assigned_area_txt` text DEFAULT NULL,
  `assigned_ward_txt` text DEFAULT NULL,
  `note_txt` text DEFAULT NULL,
  `last_edit_dt` text DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mhi_person`
--

LOCK TABLES `mhi_person` WRITE;
/*!40000 ALTER TABLE `mhi_person` DISABLE KEYS */;
INSERT INTO `mhi_person` VALUES (1,'kmlC7yG9HtJIMaLDqPgTkA==','Bagley, Janice','Janice','Bagley','Missionary','Portal','1074658','801-631-0606','janicebagley55@gmail.com','6806 S Pine Rock Circle, Cottonwood Heights, UT  84121','6806 S Pine Rock Circle','Cottonwood Heights','UT','84121','','','Executive, NS, DOS','Assoc Exec Director,DOS','','Jordan View','','2024-08-16'),(2,'4bB9VtlgUeuF/yBFmVWhjg==','Bagley, Steve','Steve','Bagley','Missionary','Portal','1074660','801-209-6681','superiorski@gmail.com','6806 S Pine Rock Circle, Cottonwood Heights, UT  84121','6806 S Pine Rock Circle','Cottonwood Heights','UT','84121','','','Executive, NS, DOS','Assoc Exec Director,DOS','','Jordan View','','2024-08-16'),(3,'ff416903-62fa-4193-86db-c61638e70fe0','Balderas, Christine','Christine','Balderas','Missionary',NULL,NULL,'801-598-2566','cbalderas6@gmail.com','3118 S. 2850 East, Millcreek, UT  84109','3118 S. 2850 East','Millcreek','UT','84109','Canyon Rim 4','Canyon Rim',NULL,NULL,NULL,NULL,'Set apart April 2024, desire 2 year mission','2024-07-09'),(4,'7e85b702-19c8-4338-a010-eda986e6ab21','Balderas, Daniel','Daniel','Balderas','Missionary','',NULL,'801-888-0646','cbalderas6@gmail.com','3118 S. 2850 East, Millcreek, UT  84109','3118 S. 2850 East','Millcreek','UT','84109','Canyon Rim 4','Canyon Rim',NULL,NULL,NULL,NULL,'Set apart April 2024, desire 2 year mission','2024-07-10'),(5,'f7c38e2f-cf2f-4800-9236-f34e75bba7a5','Beckstead, Jake','Jake','Beckstead','Missionary','Portal','1075231','801-550-2476','jake829@hotmail.com',', ,   ','','','','','','',NULL,NULL,'','','','2024-10-30'),(6,'6b2f4c47-e3ad-4d41-9dd9-b9eb5d629558','Brennan, Stewart','Stewart','Brennan','Missionary','Portal','1075133','801-376-3734','sbrennanmht@gmail.com',', ,   ','','','','','','',NULL,NULL,'','','2024-09-10 Email undeliverable. Corrected.','2024-09-10'),(7,'aa7e1261-eb21-417e-a4e1-5e33f86b22a5','Brennan, Angela','Angela','Brennan','Missionary','Portal','1074477','801-201-0509','abrennanmht@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-25'),(8,'3f291153','Brown, Craig','Craig','Brown','Missionary','Portal','1075245','801-680-7300','imarcticblue@gmail.com','7299 Heywood Drive, West Jordan, UT  84081','7299 Heywood Drive','West Jordan','UT','84081','','','Admin','Website',NULL,NULL,'','2024-07-10'),(9,'5d5ccfe6','Brown, Martha (Martica)','Martha (Martica)','Brown','Missionary','Portal','1075247','801-680-7308','marticaluzbrown01@gmail.com','7299 Heywood Drive, West Jordan, UT  84081','7299 Heywood Drive','West Jordan','UT','84081','','','CRC',NULL,NULL,NULL,'','2024-07-10'),(10,'cb94255a','Burgess, Annette','Annette','Burgess','Missionary','Portal','1074608','801-310-8446','acburgess7@gmail.com','10150 Altavilla Dr., Sandy, UT  84092','10150 Altavilla Dr.','Sandy','UT','84092','','','Admin,CRC','Executive Director','Stansbury',NULL,'','2024-08-13'),(11,'14ab17f4','Burgess, Dean','Dean','Burgess','Missionary','Portal','1074739','801-856-9526','burgess7.db@gmail.com','10150 Altavilla Dr., Sandy, UT 84092','10150 Altavilla Dr.','Sandy','UT','84092',NULL,NULL,'Admin,CRC','Executive Director','Stansbury',NULL,NULL,'2024-06-25'),(12,'12349d4f-1971-4e29-96c2-0ff3ef910f55','Camp, Daniel','Daniel','Camp','Missionary','Released May 2024','','435-830-7039','wasatchtraining@gmail.com','4218 Golden Garden Dr., Erda, UT  84074','4218 Golden Garden Dr.','Erda','UT','84074','','','NS',NULL,'','','','2024-09-22'),(13,'b087b567-ff6c-4436-8800-f27999b51d0c','Camp, Christee','Christee','Camp','Missionary','Released May 2024','','435-830-6476','christeezer@gmail.com','4218 Golden Garden Dr., Erda, UT  84074','4218 Golden Garden Dr.','Erda','UT','84074','','','NS',NULL,'','','','2024-09-22'),(14,'911c42b9-3a58-4887-9517-20c2d222b504','Coleman, Tom','Tom','Coleman','Missionary','Portal','1074344','785-410-4062','trcoleman@gmail.com','1115 W. Rivercrest Cir., So Jordan, UT  84095','1115 W. Rivercrest Cir.','So Jordan','UT','84095','','','Admin, CRC','ESL Directors','','','','2024-09-18'),(15,'d837ac80-e675-4838-8b3d-75e2ad0f8af2','Coleman, Carolyn','Carolyn','Coleman','Missionary','','','785-410-6193','trcoleman@gmail.com','1115 W. Rivercrest Cir., So Jordan, UT  84095','1115 W. Rivercrest Cir.','So Jordan','UT','84095','','','Admin, CRC','ESL Directors','','','','2024-08-23'),(16,'1ab8c5da-4f5d-427d-af76-2b044358a8c5','Cowley, Cindy','Cindy','Cowley','Missionary','Portal','1076198','801-910-8393','draper597@yahoo.com','488 E. Crystal Meadows Lane, Draper, UT 84020','488 E. Crystal Meadows Lane','Draper','UT','84020',NULL,NULL,'CRC','Math Tutor',NULL,'Jordan View',NULL,'2024-06-25'),(17,'9e937ecb-40d5-49b4-af72-dfd0942cd59b','Cowley, Michael','Michael','Cowley','Missionary','Portal','1074249','801-403-7646','mjcowley12@gmail.com','488 E. Crystal Meadows Lane, Draper, UT 84020','488 E. Crystal Meadows Lane','Draper','UT','84020',NULL,NULL,'CRC','ESL, Guitar',NULL,'Jordan View',NULL,'2024-06-25'),(18,'ab005','Driggs, Laurel','Laurel','Driggs','Missionary','','','801-859-7980','laurel.driggs@yahoo.com','12053 Janice Drive, Riverton, UT  84065','12053 Janice Drive','Riverton','UT','84065','','','CRC','ESL','','','','2024-08-23'),(19,'ab004','Driggs, Mark','Mark','Driggs','Missionary','','','801-455-6839','troutchaser61@yahoo.com','12053 Janice Drive, Riverton, UT  84065','12053 Janice Drive','Riverton','UT','84065','','','CRC','ESL','','','','2024-08-23'),(20,'kGN9MJD0xBXGXHx2LyXdxA==','Eggett, Darren','Darren','Eggett','Missionary',NULL,NULL,'801-618-1939','deggett@gmail.com','698 S. Orchard Dr, Bountiful, UT 84010','698 S. Orchard Dr','Bountiful','UT','84010',NULL,NULL,'Admin, Executive','IT',NULL,NULL,NULL,'2024-06-25'),(21,'P620i1oiq6mGn0vYy/HEoQ==','Erekson, Dave','Dave','Erekson','Missionary','Portal','1074433','801-599-0366','ereksond@gmail.com','4158 Red Tail Dr, Riverton, UT 84065','4158 Red Tail Dr','Riverton','UT','84065',NULL,NULL,'Admin, Ex, CRC','Finance, Spanish Teacher, ','Stansbury','San Marcos',NULL,'2024-06-25'),(22,'g5Q8m6lKKAcIWSmnY5hDmw==','Erekson, Norma','Norma','Erekson','Missionary','Portal','1076449','801-694-7708','normaerekson@gmail.com','4158 Red Tail Dr, Riverton, UT 84065','4158 Red Tail Dr','Riverton','UT','84065',NULL,NULL,'CRC, NS','Spanish Teacher, NS Volunteer','Stansbury','San Marcos',NULL,'2024-06-25'),(23,'t99FbfUHaKAnU6dIB6SO+w==','Fa\'asou, Sive\'a','Sive\'a','Fa\'asou','Missionary',NULL,NULL,'801-414-5053','faasou06@yahoo.com','4779 W Burlingame Dr, West Valley City, UT 84120','4779 W Burlingame Dr','West Valley City','UT','84120',NULL,NULL,'CRC','Samoan Outreach',NULL,NULL,NULL,'2024-06-25'),(24,'8c14c402-2cc2-42a0-a097-0227d556c1da','Ferree, Cozi','Cozi','Ferree','Missionary','','','801-859-6778','cozferree@gmail.com','2341 W. 8540 S., West Jordan, UT  84088','2341 W. 8540 S.','West Jordan','UT','84088','','','NS, CRC',NULL,'','','2024-09-10 Email undeliverable. Corrected.','2024-09-10'),(25,'2949c816-cd1b-4c57-8920-13e2c4d34097','Ferree, Kelly','Kelly','Ferree','Missionary','','','801-864-4370','ferree1951@gmail.com','2341 W. 8540 S., West Jordan, UT  84088','2341 W. 8540 S.','West Jordan','UT','84088','','','NS, CRC',NULL,'','','2024-09-10 Email undeliverable.','2024-09-10'),(26,'9rYU3P4HWkXPKIHsjX9Mxw==','Gray, Dorthea','Dorthea','Gray','Missionary',NULL,NULL,'801-580-9086','graydorthea@gmail.com','9303 Sunrise Park Dr., Sandy, UT. 84093','9303 Sunrise Park Dr.','Sandy','UT','84093',NULL,NULL,'CRC','School Relations',NULL,NULL,NULL,'2024-06-25'),(27,'7FfWEV5gYIcR0y9uThUprA==','Gray, Merlin','Merlin','Gray','Missionary',NULL,NULL,'801-243-7153','merlin.gray.idaho@gmail.com','9303 Sunrise Park Dr., Sandy, UT. 84093','9303 Sunrise Park Dr.','Sandy','UT','84093',NULL,NULL,'CRC','School Relations',NULL,NULL,NULL,'2024-06-25'),(28,'NYJ1VBDWyZ+/Aw/Ihom9Lw==','Harker, Joyce','Joyce','Harker','Missionary',NULL,NULL,'435-840-2070','jharker423@gmail.com','3888 N 2180 W, Erda, UT 84074','3888 N 2180 W','Erda','UT','84074',NULL,NULL,'NS, DOS','DOS Development',NULL,NULL,NULL,'2024-06-25'),(29,'mblfutfZraIg32/bcQvFPg==','Harker, Scott','Scott','Harker','Missionary','Portal','1075910','435-840-8153','leoscottharker@gmail.com','3888 N 2180 W, Erda, UT 84074','3888 N 2180 W','Erda','UT','84074',NULL,NULL,'NS, DOS','DOS Development','Chesterfield','Jordan View',NULL,'2024-06-25'),(30,'5f878106','Hart, Allison','Allison','Hart','Missionary',NULL,NULL,'801-809-4297','allisonhart19848@gmail.com','4526 S. Edgeware Ln., Salt Lake City, UT 84129','4526 S. Edgeware Ln.','Salt Lake City','UT','84129',NULL,NULL,'Admin','Info added on Jan 14, 2024',NULL,NULL,NULL,'2024-06-25'),(31,'Sd4Uq/Z0jpk1s58DeMCURQ==','Hofeling, Jana','Jana','Hofeling','Missionary','Released 2024-07-01','','415-608-1288','janabbb@yahoo.com','167 E Street, Salt Lake City, UT  84103','167 E Street','Salt Lake City','UT','84103','','','CRC,NS','Youth Council, NS Volunteer, Historians','','','','2024-09-16'),(32,'WhOOBNwQjwA9coP9NLEu+w==','Hofeling, Ken','Ken','Hofeling','Missionary','Released 2024-07-01','','801-201-3655','hofelingadobe@gmail.com','167 E Street, Salt Lake City, UT  84103','167 E Street','Salt Lake City','UT','84103','','','CRC,NS','Youth Council, NS Volunteer, Historians','','','','2024-09-16'),(33,'ad20792a-04e3-4a8a-a2c4-a6ef7d472351','Johnson, Boyd','Boyd','Johnson','Missionary','Portal','1082588','801-201-5201','boydcjohnson@comcast.net','2426 W. Jordan Haven Ct., So Jordan, UT  84095','2426 W. Jordan Haven Ct.','So Jordan','UT','84095','','','DOS',NULL,'','','','2024-08-16'),(34,'3f859d74','Johnson, Brad','Brad','Johnson','Missionary','Portal','1074233','801-870-3300','bdjohnsn3@gmail.com','11543 S. Honey Locust Court, Draper, UT 84020','11543 S. Honey Locust Court','Draper','UT','84020',NULL,NULL,'NS',NULL,NULL,NULL,NULL,'2024-06-25'),(35,'e47ac4c4','Johnson, Janna','Janna','Johnson','Missionary','Portal','1074963','801-230-2892','janna.johnson@comcast.net','11543 S. Honey Locust Court, Draper, UT 84020','11543 S. Honey Locust Court','Draper','UT','84020',NULL,NULL,'NS',NULL,NULL,NULL,NULL,'2024-06-25'),(36,'e43697d4-f249-45e9-9644-c96fe4801509','Juett, David','David','Juett','Missionary','Portal','1081602','801-673-4026','djuett1@gmail.com','3737 S. Kenyon Park Dr., WVC, UT 84120','3737 S. Kenyon Park Dr.','WVC','UT','84120',NULL,NULL,'NS',NULL,NULL,NULL,NULL,'2024-06-25'),(37,'de4428b5-6879-4b7b-9df3-9451f2bc4b18','Juett, Emily','Emily','Juett','Missionary','Portal','1081664','801-699-3614','djuett1@gmail.com','3737 S. Kenyon Park Dr., WVC, UT 84120','3737 S. Kenyon Park Dr.','WVC','UT','84120',NULL,NULL,'NS',NULL,NULL,NULL,NULL,'2024-06-25'),(38,'8LQaUqM16+cgfGPpKtzbDQ==','King, Scott','Scott','King','Missionary','Released 2024-08-01','1074244','801-918-3177','kingscotw@gmail.com','5083 Clover View Drive, Murray, UT  84123','5083 Clover View Drive','Murray','UT','84123','','','NS, DOS','DOS Logistics','Chesterfield','Jordan View','','2024-08-02'),(39,'oQHTottA9czqwVyS+IT8tg==','King, Sharon','Sharon','King','Missionary','Released 2024-08-01',NULL,'801-262-1975','kingsharon19@gmail.com','5083 Clover View Drive, Murray, UT  84123','5083 Clover View Drive','Murray','UT','84123','','','NS, DOS','DOS Logistics',NULL,NULL,'','2024-08-02'),(40,'xgUkMhuJ6teyOIFz1bWbaw==','Lassen, Bonnie','Bonnie','Lassen','Missionary','','','801-641-5802','bonnie.lassen@gmail.com','6362 S Lorreen Place, Salt Lake City, UT  84121','6362 S Lorreen Place','Salt Lake City','UT','84121','','','CRC','ESL','','','','2024-08-23'),(41,'x02Bc/MKerTzSEcIl2NTkg==','Lassen, Gary','Gary','Lassen','Missionary','Portal','1074457','801-381-4980','gary.lassen@gmail.com','6362 S Lorreen Place, Salt Lake City, UT 84121','6362 S Lorreen Place','Salt Lake City','UT','84121',NULL,NULL,'CRC','ESL',NULL,'Granger 15',NULL,'2024-06-25'),(42,'f9bf8acd-81d9-4815-a36f-6dc55351dcb2','Lin, James','James','Lin','Missionary','Released 2024-08-01','','801-688-6877','hawki181621116@gmail.com','2107 E 3300 S Apt C, Salt Lake City, UT  84109','2107 E 3300 S Apt C','Salt Lake City','UT','84109','','','CRC','Youth Council','','','','2024-09-16'),(43,'17352681-1dee-42df-9e81-93d654886509','Lin, Jenny','Jenny','Lin','Missionary','Released 2024-08-01','','801-558-6288','janicelin717@hotmail.com','2107 E 3300 S Apt C, Salt Lake City, UT  84109','2107 E 3300 S Apt C','Salt Lake City','UT','84109','','','CRC','Youth Council','','','','2024-09-16'),(44,'3a3987e0-756d-4421-87e7-1c5399725662','Miles, John','John','Miles','Missionary',NULL,NULL,'801-201-5707','johnrmiles68@gmail.com','1974 E. Siggard Dr., Salt Lake City, UT 84106','1974 E. Siggard Dr.','Salt Lake City','UT','84106',NULL,NULL,'NS, CRC',NULL,NULL,NULL,NULL,'2024-06-25'),(45,'ba7126c1-ef74-4789-bf7e-a6801cd890d6','Miles, Nannette','Nannette','Miles','Missionary',NULL,NULL,'801-201-2006','nannette59@me.com','1974 E. Siggard Dr., Salt Lake City, UT 84106','1974 E. Siggard Dr.','Salt Lake City','UT','84106',NULL,NULL,'CRC',NULL,NULL,NULL,NULL,'2024-06-25'),(46,'HaAq9yFwtN2SzOsnJqRwfA==','Miller, Della','Della','Miller','Missionary','Portal','1074412','801-440-4709','della.mil@gmail.com','841 E. Charleston Circle, Sandy, UT. 84094','841 E. Charleston Circle','Sandy','UT','84094',NULL,NULL,'NS','Loans/Grants',NULL,'Home Ward',NULL,'2024-06-25'),(47,'k2ORy0QSfhpmueRbOE5DjA==','Miller, Terry','Terry','Miller','Missionary','Portal','1075031','801-440-4658','foreman2@gmail.com','841 E. Charleston Circle, Sandy, UT. 84094','841 E. Charleston Circle','Sandy','UT','84094',NULL,NULL,'NS','Loans/Grants',NULL,'Home Ward',NULL,'2024-06-25'),(48,'bzR085loRxzb+h+GphqgLQ==','Morales, Hilda','Hilda','Morales','Missionary',NULL,NULL,'801-839-6778','hilda.regulo@gmail.com','2521 S Redwood Road, West Valley City, UT 84119','2521 S Redwood Road','West Valley City','UT','84119',NULL,NULL,'NS, CRC','NS Volunteer',NULL,NULL,NULL,'2024-06-25'),(49,'o6mmn58pMlzStE/L1sz2cA==','Morales, Regulo','Regulo','Morales','Missionary',NULL,NULL,'801-390-7190','kingkartaxi@gmail.com','2521 S Redwood Road, West Valley City, UT 84119','2521 S Redwood Road','West Valley City','UT','84119',NULL,NULL,'NS, CRC','NS Volunteer',NULL,NULL,NULL,'2024-06-25'),(50,'27e2e714-8b29-4e52-b4b0-7ad68dfed3b7','Nelson, Randy','Randy','Nelson','Missionary','Portal','1075108','801-455-2151','randyanelson@gmail.com','1518 E Stanford Ct, Draper, UT 84020','1518 E Stanford Ct','Draper','UT','84020',NULL,NULL,'NS, CRC','NS Volunteer','Westlake','Westlake',NULL,'2024-06-25'),(51,'47e295e1-4dbc-4c41-8aac-2d567b4108a4','Nelson, Sue','Sue','Nelson','Missionary','Portal','1075106','801-455-2557','sknelson125@gmail.com','1518 E Stanford Ct, Draper, UT 84020','1518 E Stanford Ct','Draper','UT','84020',NULL,NULL,'NS, CRC',' NS Volunteer','Westlake','Westlake',NULL,'2024-06-25'),(52,'4a9cc673','Pappas, Casey (Cassandra)','Casey (Cassandra)','Pappas','Missionary','Portal','1077459','646-338-6699','cassandramp@gmail.com','2521 W 5400 S, Taylorsville, UT 84129','2521 W 5400 S','Taylorsville','UT','84129',NULL,NULL,'Admin','Newsletter',NULL,'Granger 15',NULL,'2024-06-25'),(53,'a9615c56-4020-47c4-9591-88e0d0be989c','Parco, Ping','Ping','Parco','Missionary',NULL,NULL,'801-425-1682','pingutah@gmail.com','3170 S 4610 W, West Valley City, UT 84120','3170 S 4610 W','West Valley City','UT','84120',NULL,NULL,'CRC','Cambodian Outreach',NULL,NULL,NULL,'2024-06-25'),(54,'a913ba6c-dd10-4ec4-a6b9-5777bce2929d','Parco, Sokhanny','Sokhanny','Parco','Missionary',NULL,NULL,'801-913-4965','pingutah@gmail.com','3170 S 4610 W, West Valley City, UT 84120','3170 S 4610 W','West Valley City','UT','84120',NULL,NULL,'CRC','Cambodian Outreach',NULL,NULL,NULL,'2024-06-25'),(55,'cuC9gpVz8XM+ZFfg10b7gA==','Parkinson, Mark','Mark','Parkinson','Missionary','','','801-518-9312','mrparki@msn.com','6353 S Hopi Circle, West Jordan, UT  84081','6353 S Hopi Circle','West Jordan','UT','84081','','','CRC, NS','ESL','','','','2024-08-23'),(56,'0rJFP1TrWh1hRN8QNs5Fqg==','Phillips, Jim','Jim','Phillips','Missionary','Portal','1075011','801-664-3269','jtphillips.007@gmail.com','6282 W 3705 S., WVC, UT 84128','6282 W 3705 S.','WVC','UT','84128',NULL,NULL,'CRC','Self Reliance',NULL,'Home Ward',NULL,'2024-06-25'),(57,'wAT7MQ9ic6HEaYInrGdPDA==','Phillips, Kayla','Kayla','Phillips','Missionary','Portal','1075010','801-664-3042','kaylacphillips.007@gmail.com','6282 W 3705 S., WVC, UT 84128','6282 W 3705 S.','WVC','UT','84128',NULL,NULL,'CRC','Self Reliance',NULL,'Home Ward',NULL,'2024-06-25'),(58,'515653a9','Poulson, Wayne','Wayne','Poulson','Missionary','Portal','1074586','801-573-4863','bearcatelectric@comcast.net','4255 Merril Circle, WVC, UT 84120','4255 Merril Circle','WVC','UT','84120',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-25'),(59,'457101ca','Poulson, Shelley','Shelley','Poulson','Missionary','Portal','1074583','801-699-8328','shelleygram@comcast.net','4255 Merril Circle, WVC, UT 84120','4255 Merril Circle','WVC','UT','84120',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-25'),(60,'789834f1','Price, Charlotte','Charlotte','Price','Missionary','',NULL,'801-588-9240','pricecharlotte2@msn.com','2230 Lakeline Cir, Salt Lake City, UT  84109','2230 Lakeline Cir','Salt Lake City','UT','84109','Wasatch Hills Ward','','Executive','Executive Director',NULL,NULL,'','2024-07-15'),(61,'e614f3fe','Price, Patrick','Patrick','Price','Missionary','Portal','1074008','801-450-6521','pprice@pricewms.com','2230 Lakeline Cir, Salt Lake City, UT 84109','2230 Lakeline Cir','Salt Lake City','UT','84109',NULL,NULL,'Executive','Executive Director',NULL,NULL,NULL,'2024-06-25'),(62,'2xftgdEKpm337jEq4Duzbw==','Pumphrey, Diane','Diane','Pumphrey','Missionary','Portal','1075527','740-607-1060','dspumphrey@yahoo.com','1110 W Erda Way, Erda, UT 84074','1110 W Erda Way','Erda','UT','84074',NULL,NULL,'NS','NS volunteer','Stansbury','Granger 15',NULL,'2024-06-25'),(63,'ccjZBk5zLnAEqEJ3IfV+Cg==','Pumphrey, Mark','Mark','Pumphrey','Missionary',NULL,NULL,'740-607-9066','mdpump79@yahoo.com','1110 W Erda Way, Erda, UT 84074','1110 W Erda Way','Erda','UT','84074',NULL,NULL,'NS','NS volunteer',NULL,NULL,NULL,'2024-06-25'),(64,'9ceaecc2-03cc-489e-99f1-06a1403b0b6f','Robb, Jay','Jay','Robb','Missionary','Portal','1074969','385-499-6440','jayr@wslm.biz',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NS',NULL,NULL,NULL,NULL,'2024-06-25'),(65,'ab006','Robb, Julie','Julie','Robb','Missionary',NULL,NULL,'575-635-5563','robbjulie7@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NS',NULL,NULL,NULL,NULL,'2024-06-25'),(66,'YFv+HQH8Qj11ByP9P9/+vw==','Rodriguez, Cesar','Cesar','Rodriguez','Missionary',NULL,NULL,'801-608-8821','crrm1973@gmail.com','7239 S 1600 E, Cottonwood Heights, UT 84121','7239 S 1600 E','Cottonwood Heights','UT','84121',NULL,NULL,'CRC','Loans/Grants',NULL,NULL,NULL,'2024-06-25'),(67,'xu1pcfYxT9yrkBe7u5synA==','Rodriguez, Kim','Kim','Rodriguez','Missionary',NULL,NULL,'801-231-9311','kim@tkjmail.com','7239 S 1600 E, Cottonwood Heights, UT 84121','7239 S 1600 E','Cottonwood Heights','UT','84121',NULL,NULL,'CRC','Loans/Grants',NULL,NULL,NULL,'2024-06-25'),(68,'RyAmzo1UxoY5ZQI3tOD1cQ==','Rubio, Andres','Andres','Rubio','Missionary',NULL,NULL,'801-884-8063','andresutah@gmail.com','2914 S 3145 W, West Valley City, UT 84119','2914 S 3145 W','West Valley City','UT','84119',NULL,NULL,'NS','NS Volunteer',NULL,NULL,NULL,'2024-06-25'),(69,'Nhn339bP9CT3AcJBImKzBQ==','Rubio, Maria','Maria','Rubio','Missionary',NULL,NULL,'801-759-4370','maletrubio@gmail.com','2914 S 3145 W, West Valley City, UT 84119','2914 S 3145 W','West Valley City','UT','84119',NULL,NULL,'NS','NS Volunteer',NULL,NULL,NULL,'2024-06-25'),(70,'DA0TcZlnvdijS7J9L7Iwtg==','Shaw, Bonnie','Bonnie','Shaw','Missionary','Portal','1075094','801-664-8042','bonnieandstevenshaw@gmail.com','3078 Maple Way, West Valley City, UT. 84119','3078 Maple Way','West Valley City','UT','84119',NULL,NULL,'NS','NS Volunteer','Chesterfield','Jordan View',NULL,'2024-06-25'),(71,'etfqxwHmOQ8gno/zWm2nUg==','Shaw, Steve','Steve','Shaw','Missionary','Portal','1075099','801-699-2073','spshaw47@gmail.com','3078 Maple Way, West Valley City, UT. 84119','3078 Maple Way','West Valley City','UT','84119',NULL,NULL,'NS','NS Volunteer','Chesterfield','Jordan View',NULL,'2024-06-25'),(72,'95f9adfc-4851-4b4a-b96c-0e0248cb1461','Smith, Heather','Heather','Smith','Missionary','Portal','1074576','801-520-6203','heathsmith424@gmail.com','479 E Crystal Meadows Ln, Draper, UT 84020','479 E Crystal Meadows Ln','Draper','UT','84020',NULL,NULL,'NS, CRC','ESL, DOS','Westlake','Westlake',NULL,'2024-06-25'),(73,'9fc97dc3-4e95-4843-9d13-1fa9f0790add','Smith, Shaler','Shaler','Smith','Missionary','Portal','1074579','801-598-5464','shaler828@gmail.com','479 E Crystal Meadows Ln, Draper, UT 84020','479 E Crystal Meadows Ln','Draper','UT','84020',NULL,NULL,'NS, CRC','ESL, DOS','Westlake','Westlake',NULL,'2024-06-25'),(74,'ZAC1D+FKiICdmdQXEcprMQ==','Spence, Chuck','Chuck','Spence','Missionary','Portal','1074357','801-580-2628','chuckspence25@gmail.com','1180 West Country Mile Dr., Riverton, UT 84065','1180 West Country Mile Dr.','Riverton','UT','84065',NULL,NULL,'CRC','Citizenship',NULL,'Granger 15',NULL,'2024-06-25'),(75,'3JFRSt3mRzxinCs7JsnvIA==','Staples, Joyce','Joyce','Staples','Missionary',NULL,NULL,'425-681-7452','joycestaples@comcast.net','8032 S. Old Barn Dr., Sandy, UT 84094','8032 S. Old Barn Dr.','Sandy','UT','84094',NULL,NULL,'NS','NS Volunteer',NULL,NULL,NULL,'2024-06-25'),(76,'FMr3ntvxh+ImOI++h8HVDw==','Tupuola, Si\'i','Si\'i','Tupuola','Missionary','Released 2024-08-01','','801-634-7132','leroymariner@gmail.com','2820 W 2730 S, West Valley City, UT  84119','2820 W 2730 S','West Valley City','UT','84119','','','CRC','Samoan Outreach','','','2024-09-10 Email undeliverable.','2024-09-16'),(77,'7YAGtbq/b5U/QJhwQ5Y/Og==','Tupuola, Tui','Tui','Tupuola','Missionary','Released 2024-08-01','','801-674-6637','leroymariner@gmail.com','2820 W 2730 S, West Valley City, UT  84119','2820 W 2730 S','West Valley City','UT','84119','','','CRC','Samoan Outreach','','','2024-09-10 Email undeliverable.','2024-09-16'),(78,'yew6VZgwtL76XSVk0lFjJA==','Vawdrey, Dave','Dave','Vawdrey','Missionary',NULL,NULL,'801-509-0745','dave@prosecurityproducts.com','13044 S Pheasant Haven Ct, Draper, UT  84020','13044 S Pheasant Haven Ct','Draper','UT','',NULL,NULL,'CRC','Guitar',NULL,NULL,NULL,'2024-06-25'),(79,'s37FbjXITm+07Oj0f0Q4xQ==','Vawdrey, Wendy','Wendy','Vawdrey','Missionary',NULL,NULL,'801-915-9639','wvawdrey@gmail.com','13044 S Pheasant Haven Ct, Draper, UT  84020','13044 S Pheasant Haven Ct','Draper','UT','',NULL,NULL,'CRC','Immigration & Legal',NULL,NULL,NULL,'2024-06-25'),(80,'+stmydWKqEA6XGYWD+VIOQ==','Wagner, Andy','Andy','Wagner','Missionary','Portal','1074571','801-979-5483','black_kite_electric@yahoo.com','3123 E Walker Mill Dr., Cottonwood Heights, UT 84121','3123 E Walker Mill Dr.','Cottonwood Heights','UT','84121',NULL,NULL,'NS, DOS','Assoc City Chair','Westlake','Westlake',NULL,'2024-06-25'),(81,'GZ3MZ6ILnpa5CGyAEVQdHA==','Wagner, Lori','Lori','Wagner','Missionary','Portal','1074569','801-971-5483','lwag_fam7@yahoo.com','3123 E Walker Mill Dr., Cottonwood Heights, UT 84121','3123 E Walker Mill Dr.','Cottonwood Heights','UT','84121',NULL,NULL,'NS, DOS','DOS Consultant','Westlake','Westlake',NULL,'2024-06-25'),(82,'t7o4q1sgpADxaHIYqUb15A==','Wilkins, Debbie','Debbie','Wilkins','Missionary',NULL,NULL,'801-349-5859','debbiewilkins0@gmail.com','2852 S 2910 W, West Valley City, UT 84119','2852 S 2910 W','West Valley City','UT','84119',NULL,NULL,'CRC','Family History',NULL,NULL,NULL,'2024-06-25'),(83,'vKZXkpguB7tCDn3utayntQ==','Wilkins, Gary','Gary','Wilkins','Missionary',NULL,NULL,'801-554-6982','garywilkins@gmail.com','2852 S 2910 W, West Valley City, UT 84119','2852 S 2910 W','West Valley City','UT','84119',NULL,NULL,'CRC','Family History',NULL,NULL,NULL,'2024-06-25'),(84,'ab007','Winget, Jeril','Jeril','Winget','Missionary',NULL,NULL,'385-296-7391','jerilwinget66@aol.com','5334 S. Highland Dr., Holladay, UT 84117','5334 S. Highland Dr.','Holladay','UT','84117',NULL,NULL,'CRC','Adult Services Directors',NULL,NULL,NULL,'2024-06-25'),(85,'ab008','Winget, Marsha','Marsha','Winget','Missionary',NULL,NULL,'385-425-9877','missmarsha444@gmail.com','5334 S. Highland Dr., Holladay, UT 84117','5334 S. Highland Dr.','Holladay','UT','84117',NULL,NULL,'CRC','Adult Services Directors',NULL,NULL,NULL,'2024-06-25'),(86,'7b34792b-18b6-4c51-9976-5afeccdf7d00','Anderson, Roger','Roger','Anderson','Volunteer',NULL,NULL,'801-824-0776','rogerrocketman@gmail.com','2827 South Kenwood Street, SLC, UT 84106','2827 South Kenwood Street','SLC','UT','84106',NULL,NULL,'CRC','Piano',NULL,NULL,NULL,'2024-06-25'),(87,'1b265aca-91dd-43e3-ad0e-c45adcd43788','Anderson, Heidi','Heidi','Anderson','Volunteer','Released Sep 2024','','801-201-0031','hidee_a@hotmail.com','2827 South Kenwood Street, SLC, UT  84106','2827 South Kenwood Street','SLC','UT','84106','','','CRC','ESL','','','Address Differs in Volunteer spreadsheet: 2262 So 2300 East, SLC 84109','2024-09-27'),(88,'ed8cdcf5-841a-411d-83db-fb95d625b91d','Baggaley, Anna','Anna','Baggaley','Volunteer',NULL,NULL,'385-210-9074',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CRC','Art',NULL,NULL,NULL,'2024-06-25'),(89,'809f20db-b00d-4724-a3e5-ab40a60982b9','Blake, Michelle','Michelle','Blake','Volunteer','Released 2024-09-01','','801-309-0462','michelleblake@gmail.com','2824 South Chadwick Street, SLC, UT  84106','2824 South Chadwick Street','SLC','UT','84106','','','CRC','Piano','','','','2024-09-16'),(90,'db1c57c1-21d3-4566-8a25-2c38ed9ee576','Bowman, Kent','Kent','Bowman','Volunteer','',NULL,'801-971-1389','kmbowman@tannerco.com','2233 Parleys Terrace, Salt Lake City, UT  84109','2233 Parleys Terrace','Salt Lake City','UT','84109','','','CRC','ESL',NULL,NULL,'','2024-07-10'),(91,'26007a9d-e8c4-4211-b1ca-3cd732049142','Bunting, Kevin','Kevin','Bunting','Volunteer',NULL,NULL,'801-953-4404','buntingk1225@gmail.com','2099 W 4700 So Apt. A113, Taylorsville, UT 84192','2099 W 4700 So Apt. A113','Taylorsville','UT','84192',NULL,NULL,NULL,'Piano',NULL,NULL,NULL,'2024-06-25'),(92,'582baa71-8b3f-4b5c-a4f3-4c6620ebcb4c','Carter, John','John','Carter','Volunteer','',NULL,'801-573-6211','johnj.carter@comcast.net','1538 Hubbard Avenue, Salt Lake City, UT  84105','1538 Hubbard Avenue','Salt Lake City','UT','84105','','','CRC','ESL',NULL,NULL,'','2024-07-10'),(93,'5c844e80-5df5-4e1a-8f1a-6a6464d49364','Creviston, Darcy','Darcy','Creviston','Volunteer','','','365-234-1175','darcyrev@yahoo.com',', ,   ','','','','','','','CRC',NULL,'','','2024-09-10 Email undeliverable.','2024-09-10'),(94,'1tl9L1FnkYT8v8u8N9lBRg==','DeBry, DeAnna','DeAnna','DeBry','Volunteer','Released 2024-09-01','','801-835-9364','deanna.debry@gmail.com','171 East 3rd Ave. Unit 606, SLC, UT  84103','171 East 3rd Ave. Unit 606','SLC','UT','84103','','',NULL,'Piano','','','','2024-09-16'),(95,'12fd6ca5-3138-4a45-91b9-414567e825b9','Evans, Matt','Matt','Evans','Volunteer',NULL,NULL,'801-860-5885','matt@timbermoose.com','1821 South 300 East, Draper, UT 84020','1821 South 300 East','Draper','UT','84020',NULL,NULL,'DOS, Youth',NULL,NULL,NULL,NULL,'2024-06-25'),(96,'4e41c2dd-4e97-422a-bcc8-a71a1d114a8d','Evans, Lori','Lori','Evans','Volunteer',NULL,NULL,'801-819-6993',NULL,'1821 South 300 East, Draper, UT 84020','1821 South 300 East','Draper','UT','84020',NULL,NULL,'DOS, Youth',NULL,NULL,NULL,NULL,'2024-06-25'),(97,'c4b33909-b7b1-44b9-8e7d-0913162014ad','Evans, Clara','Clara','Evans','Volunteer',NULL,NULL,'801-860-2276','claraevans801@gmail.com','1821 South 300 East, Draper, UT 84020','1821 South 300 East','Draper','UT','84020',NULL,NULL,'DOS, Youth',NULL,NULL,NULL,NULL,'2024-06-25'),(98,'4f4e9593-3995-4868-a5f9-73af7dff964a','Evans, Chloe','Chloe','Evans','Volunteer',NULL,NULL,'801-523-9911','chloeevans801@gmail.com','1821 South 300 East, Draper, UT 84020','1821 South 300 East','Draper','UT','84020',NULL,NULL,'DOS, Youth',NULL,NULL,NULL,NULL,'2024-06-25'),(99,'c892fb0f-481d-4e22-8cd0-0760ce2bcde7','Evans, Whitt','Whitt','Evans','Volunteer','','','801-564-3252','whittakerevans@gmail.com','1821 South 300 East, Draper, UT  84020','1821 South 300 East','Draper','UT','84020','','','DOS, Youth',NULL,'','','First name: James','2024-09-10'),(100,'jV3BIXfu3Jht59JZvh3E6g==','Guevara, Dave','Dave','Guevara','Volunteer',NULL,NULL,'801-647-9910','tguevara801@yahoo.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NS','NS Volunteer',NULL,NULL,'Has been involved.  Hurt now, might help later.','2024-06-25'),(101,'ZBogC2LOWxM2kbS6bIvi+w==','Hamblin, Judy','Judy','Hamblin','Volunteer','Released','','801-520-1784','judy.burr@hotmail.com','1445 W 2280 S, West Valley City, UT  84119','1445 W 2280 S','West Valley City','UT','84119','','','CRC','Gardening','','','','2024-11-11'),(102,'4f53c53f-fde6-41c7-aa0c-f8f29e2a344b','Hansen, Becky','Becky','Hansen','Volunteer','','','801-706-0558','hansenlbec@msn.com','10799 So Country Creek Cove, South Jordan, UT  84095','10799 So Country Creek Cove','South Jordan','UT','84095','','','CRC','ESL','','','2024-09-10 Email undeliverable.','2024-09-12'),(103,'8af28354-9877-4c0e-a484-ccfebc072c56','Hansen, Lance','Lance','Hansen','Volunteer','','','(do not text) 801-755-9668','hansenlbec@msn.com','10799 So Country Creek Cove, South Jordan, UT  84095','10799 So Country Creek Cove','South Jordan','UT','84095','','','CRC','ESL','','','No texting?','2024-09-25'),(104,'08becf2a-0d45-4b45-94c1-535634cfa283','Hansen, Carolyn','Carolyn','Hansen','Volunteer',NULL,NULL,'385 867-9204','carolynhansen118@gmail.com','4071 West 3860 So, WVC, UT 84120','4071 West 3860 So','WVC','UT','84120',NULL,NULL,'CRC',NULL,NULL,NULL,NULL,'2024-06-25'),(105,'O+ZnhupUegUkw33nTb7rlw==','Hardman, Mont','Mont','Hardman','Volunteer','','','385-414-6313','monthardman17@gmail.com','1450 W Parkway Ave., West Valley City, UT  84119','1450 W Parkway Ave.','West Valley City','UT','84119','','','NS','Home Repair','','','','2024-09-25'),(106,'72ca6cc6-89b8-4a4c-adf3-e95409e2f731','Haven, Anie','Anie','Haven','Volunteer',NULL,NULL,'801-541-4331','Anie.Haven@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Admin','Newsletter',NULL,NULL,NULL,'2024-06-25'),(107,'9e18111d-6555-4425-8302-5159942c9d15','Higginson, Julia','Julia','Higginson','Volunteer',NULL,NULL,'801-608-5635','jubehigg@gmail.com','3765 West 3900 South, WVC, UT 84120','3765 West 3900 South','WVC','UT','84120',NULL,NULL,'CRC','Piano',NULL,NULL,NULL,'2024-06-25'),(108,'a7df3b05-6c6e-4bcd-a0df-61d6f9602172','Howard, Robin','Robin','Howard','Volunteer','Released 2024-09-01','','801-860-5114','robinr.howard@gmail.com','3988 So. Kewanee Drive, WVC, UT  84120','3988 So. Kewanee Drive','WVC','UT','84120','','','CRC','Piano','','','','2024-09-16'),(109,'6db84466-187c-4ac3-a701-97d4a53eb902','Hunter, Karen','Karen','Hunter','Volunteer',NULL,NULL,'801-664-7451','Karen12K@msn.com','4526 S. White Flower Way, WVC, UT 84120','4526 S. White Flower Way','WVC','UT','84120',NULL,NULL,'CRC','Piano',NULL,NULL,NULL,'2024-06-25'),(110,'492bd213-510e-4b9d-8f91-286dab12c057','Ipson, Rebecca','Rebecca','Ipson','Volunteer',NULL,NULL,'801-975-9562','rebecca.ipson50@gmail.com','2953 South Eucalyptus Way, WVC, UT 84119','2953 South Eucalyptus Way','WVC','UT','84119',NULL,NULL,'CRC','Piano',NULL,NULL,NULL,'2024-06-25'),(111,'333e3a24-c010-4b0f-8ac0-f3b72faf6aaa','Jacobson, Lizzie','Lizzie','Jacobson','Volunteer',NULL,NULL,'801-333-9985','icanfishandyouaretoo@gmail.com','2099 W 4700 So Apt. A113, Taylorsville, UT 84192','2099 W 4700 So Apt. A113','Taylorsville','UT','84192',NULL,NULL,'CRC','Piano',NULL,NULL,NULL,'2024-06-25'),(112,'b2ff5d15-f566-46d1-9fc8-5a06062391d0','Johnson, Barry','Barry','Johnson','Volunteer','','','480-236-1561','barry2819@reagan.com','638 E. Pheasant Haven Ct., Draper, UT  84020','638 E. Pheasant Haven Ct.','Draper','UT','84020','','','CRC','ESL','','','Email corrected from barry2819@reagan.com - 27 Aug 2024. Changed back 10 Sep 2024 due to undeliverable email at regan.com. Didn\'t ping back the second time.','2024-09-10'),(113,'e3b76774-5f30-4902-8b29-e43c9f1d09b2','Johnson, Michelle','Michelle','Johnson','Volunteer','',NULL,'801-243-9480','michelle.johnson@canyonsdistrict.org','638 E. Pheasant Haven Ct., Draper, UT  84020','638 E. Pheasant Haven Ct.','Draper','UT','84020','','','CRC','ESL',NULL,NULL,'','2024-07-10'),(114,'4UpNFvNmyKBn792xa7WFEQ==','Jones, Carol','Carol','Jones','Volunteer',NULL,NULL,'801-309-3870','carolpianoteacher@gmail.com','3652 Canyon Estates Drive, Bountiful, UT 84010','3652 Canyon Estates Drive','Bountiful','UT','84010',NULL,NULL,'CRC','Piano',NULL,NULL,NULL,'2024-06-25'),(115,'afe98749-4271-4b00-8265-272f7ae392eb','Lyon, Charles','Charles','Lyon','Volunteer','','','801-610-9204','crlyon2@gmail.com','3821 S. Kingsbury Lane Apt B3, WVC, UT  84119','3821 S. Kingsbury Lane Apt B3','WVC','UT','84119','Jordan Meadows','Granger East','CRC','ESL','','','','2024-08-15'),(116,'41d93494-adec-4b63-adc0-88e092287ac4','Lyon, Molly','Molly','Lyon','Volunteer','','','801-980-0427','mollyandchuck@gmail.com','3821 S. Kingsbury Lane Apt B3, WVC, UT  84119','3821 S. Kingsbury Lane Apt B3','WVC','UT','84119','Jordan Meadows','Granger East','CRC','ESL','','','','2024-08-27'),(117,'e10+mIN2wSkmy6clSXLeTw==','Nielsen, Roseann','Roseann','Nielsen','Volunteer','Released April 2024','','714-307-5358','roseannneilson@gmail.com',', ,   ','','','','','','','CRC','Ukulele','','','','2024-09-27'),(118,'7bab6be2-426c-40b3-ba6d-0cf649679537','Newton, Cathy','Cathy','Newton','Volunteer',NULL,NULL,'801-651-0573','cathycomma@gmail.com','3673 West Spring Water Drive, WVC, UT 84120','3673 West Spring Water Drive','WVC','UT','84120',NULL,NULL,'CRC','Piano',NULL,NULL,NULL,'2024-06-25'),(119,'78172857-25fd-41e1-a5d1-4c4db5940719','Platt, Shell','Shell','Platt','Volunteer','','','801-755-7185','shells4fun@gmail.com','2744 West 2890 South, WVC, UT  84119','2744 West 2890 South','WVC','UT','84119','','','CRC','Self-Defense','','','','2024-09-16'),(120,'b574842d-0c7d-4461-9609-3323e8661bea','Provost, Vern','Vern','Provost','Volunteer',NULL,NULL,'801-910-4641','vprovost@afdrafting.com','1117 W. Rivercrest Circle, So Jordan, UT 84095','1117 W. Rivercrest Circle','So Jordan','UT','84095',NULL,NULL,'CRC','ESL',NULL,NULL,NULL,'2024-06-25'),(121,'d54f0566-5058-45e3-a5c0-826165918956','Rees, Spencer','Spencer','Rees','Volunteer','','','385-277-6445','spencerlrees@gmail.com',', ,   ','','','','','','','CRC','ESL','','','','2024-09-10'),(122,'3c7664cc','Richards, Jonathan','Jonathan','Richards','Volunteer',NULL,NULL,'801-558-5867','jon.w.richards@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Admin','Finance',NULL,NULL,NULL,'2024-06-25'),(123,'83af99de-134c-441e-98bc-bb6a465663cc','Rigby, Julie','Julie','Rigby','Volunteer','','','801-618-5440','berthabutts754@gmail.com','3500 W Honda Ave, West Valley City, UT  84119','3500 W Honda Ave','West Valley City','UT','84119','','','CRC','ESL','','','Phone corrected from 801-619-5440 - 27 Aug 2024','2024-08-27'),(124,'W4Fw6XS4EgyPWhCp+rC04A==','Smith, Donna','Donna','Smith','Volunteer',NULL,NULL,'801-931-9389','aasjj5g@gmail.com','1125 North 3080 West, Provo, UT 84601','1125 North 3080 West','Provo','UT','84601',NULL,NULL,'CRC','Piano',NULL,NULL,NULL,'2024-06-25'),(125,'7887KCoTGkhjQ6Z6kkEkxQ==','Smith, Misti','Misti','Smith','Volunteer','Released Sep 2024','','801-403-1288','mistiblueeyes83@gmail.com',', ,   ','','','','','','','CRC','Zumba','','','','2024-09-27'),(126,'8673040f-d05c-4220-b097-f5d540093589','Smith, Barry','Barry','Smith','Volunteer','','','801-828-5391','barrymsmith1@msn.com','3363 Edward Circle, Holladay, UT  84124','3363 Edward Circle','Holladay','UT','84124','','','CRC','ESL','','','','2024-09-14'),(127,'9ca8357c-9c74-4687-8f20-80cb9a79f27a','Smith, Susie','Susie','Smith','Volunteer','',NULL,'801-828-5394','smaries2016@gmail.com','3363 Edward Circle, Holladay, UT  84124','3363 Edward Circle','Holladay','UT','84124','','','CRC','ESL',NULL,NULL,'','2024-07-10'),(128,'c6e90d43-b901-4d58-8b36-b3dc153874b2','Soderberg, Cheryl','Cheryl','Soderberg','Volunteer',NULL,NULL,'801-755-7817',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CRC','Sewing',NULL,NULL,NULL,'2024-06-25'),(129,'bd66bf14-c0b5-4da4-9d30-3df9918857d9','Sperry, Jason','Jason','Sperry','Volunteer','',NULL,'385-212-8575','jason.sperryexec@gmail.com','6062 Duchess Street, West Jordan, UT  84081','6062 Duchess Street','West Jordan','UT','84081','','','CRC','ESL',NULL,NULL,'','2024-07-10'),(130,'2ll4nwEZzdNwTcukfMOynA==','Thompson, Holly','Holly','Thompson','Volunteer','Released - 2024-09-17 - Moved','','801-671-5232','',', ,   ','','','','','','',NULL,NULL,'','','Doesn\'t know how we got her name.  She served a CSM last year.  Is a student, but would be interested in teaching Art.  ','2024-09-17'),(131,'53824b0a-d9fd-42e3-b19b-a877a7b70ce4','Townsley, Mike','Mike','Townsley','Volunteer',NULL,NULL,'801-674-3216','townsleymj@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ESL',NULL,NULL,NULL,'2024-06-25'),(132,'eXn8wBgzPXgUjKa/WJckqg==','Vesock, Jim','Jim','Vesock','Volunteer',NULL,NULL,'619-582-7859','vesock@msn.com','5491 W Lockwood Dr., West Valley City, UT 84120','5491 W Lockwood Dr.','West Valley City','UT','84120',NULL,NULL,'NS','NS Volunteer',NULL,NULL,NULL,'2024-06-25'),(133,'ef735e89-96de-49b1-a157-40d484a41fb4','Winder, Arliss','Arliss','Winder','Volunteer',NULL,NULL,'801-441-8366','arlisswinder@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'CRC','Sewing',NULL,NULL,NULL,'2024-06-25'),(134,'RnMjK+qbLIAdti148M0QEw==','Wixom, Rosemary','Rosemary','Wixom','Volunteer','Released 2024-07-01','','801-580-8418','rosewixom@gmail.com',', ,   ','','','','','','','CRC','Ukulele','','','','2024-09-16'),(135,'7ba06e80-355f-4089-bf6f-2614021a38c5','Woodbury, Sarah','Sarah','Woodbury','Volunteer','','','301-520-1887','smwoodbury@gmail.com','2228 South 2300 East, Salt Lake City, UT  84109','2228 South 2300 East','Salt Lake City','UT','84109','','','CRC','ESL','','','Phone updated from 301-520-1187 on 27 Aug 2024','2024-08-27'),(136,'fb313f1a-fd9c-48df-b05c-79b214da671a','Woodbury, Isaac','Isaac','Woodbury','Volunteer','Released 2024-08-01','','385-419-6900','isaacwoodbury240@gmail.com',', ,   ','','','','','','','CRC','Piano - through the school year -Spring 2024','','','Piano through the school year - Spring 2024. 2024-09-10 Email undeliverable.','2024-09-16'),(137,'0a5b6ad1-1233-4228-8673-1a82d52c84cb','Christensen, Brent','Brent','Christensen','Community','Released 2024-01-01','','801-845-6866','bjchris2@gmail.com','6317 Wrenhaven Rd., SLC, UT  84121','6317 Wrenhaven Rd.','SLC','UT','84121','','','Executive','City Chair','','','','2024-09-16'),(138,'2d20595b-a0f6-496f-a430-f09d294fc2b4','Christensen, Sharon','Sharon','Christensen','Community','Released 2024-01-01','','801-845-6872','','6317 Wrenhaven Rd., SLC, UT  84121','6317 Wrenhaven Rd.','SLC','UT','84121','','','Executive','City Chair','','','','2024-09-16'),(139,'a9117c3d-1448-4d9b-a8be-a0371cb0dbb2','Durham, Mark P.','Mark P.','Durham','Missionary','Released 2024-01-01','','801-598-0543','markdurham@durhambrands.com','3258 Shelby Court, Cottonwood Heights, UT  84121','3258 Shelby Court','Cottonwood Heights','UT','84121','','','Executive','Utah Director Community Support Services','','','','2024-09-16'),(140,'2233685e-4263-465f-ae6a-aa3773e2c743','Durham, Mary Richards','Mary Richards','Durham','Missionary','Released 2024-01-01','','801-598-3767','marydurham@durhambrands.com','3258 Shelby Court, Cottonwood Heights, UT  84121','3258 Shelby Court','Cottonwood Heights','UT','84121','','','Executive','Utah Director Community Support Services','','','','2024-09-16'),(141,'4bf6e534-0326-4d0f-ad1f-dda101286443','Orwin, President Nick','President Nick','Orwin','Community','Released 2024-01-01','','','bishoporwin@gmail.com',', ,   ','','','','','','',NULL,NULL,'','','','2024-09-16'),(142,'963ed085-047f-4974-9ecc-1580e34b20a1','Rupp, Jana','Jana','Rupp','Missionary','Released 2024-01-01','','385-495-8680','markandjana03@gmail.com','3462 W Ryan Bennett Ln., West Valley City, UT  84119','3462 W Ryan Bennett Ln.','West Valley City','UT','84119','','','Executive','Executive Director','','','','2024-09-16'),(143,'f0cc0557-d2c9-49f1-9120-133fee2f6829','Rupp, Mark','Mark','Rupp','Missionary','Released 2024-01-01','','801-661-2257','mbrupp2010@gmail.com','3462 W Ryan Bennett Ln., West Valley City, UT  84119','3462 W Ryan Bennett Ln.','West Valley City','UT','84119','','','Executive','Executive Director','','','','2024-09-16'),(144,'4b94cfe7-d927-46ee-872e-9a5e772563a9','Morley, Mike','Mike','Morley','Missionary','Released 2024-01-01','','801-577-3515','mmorley7446@gmail.com','6731 S Beargrass Rd, West Jordan, UT  84081','6731 S Beargrass Rd','West Jordan','UT','84081','','','NS, DOS','DOS Resources','','','','2024-09-16'),(145,'ceaf6e94-c419-4179-a1bb-f91d822cd89e','Morley, Sandy','Sandy','Morley','Missionary','Released 2024-01-01','','801-968-7560','sandymorley49@gmail.com','6731 S Beargrass Rd, West Jordan, UT  84081','6731 S Beargrass Rd','West Jordan','UT','84081','','','NS, DOS','DOS Resources','','','','2024-09-16'),(146,'2e25fe7e','Hart, Kevin','Kevin','Hart','Missionary',NULL,NULL,'801-556-7709','itinslc@hotmail.com','1691 E Madsen Lane, Sandy, Utah 84093','1691 E Madsen Lane','Sandy','UT','84093',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-25'),(147,'2e25fe7f','Hart, Shera','Shera','Hart','Missionary',NULL,NULL,'801-673-7760','sherahart7@gmail.com','1691 E Madsen Lane, Sandy, Utah 84093','1691 E Madsen Lane','Sandy','UT','84093',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-25'),(148,'ab001','Petersen, Claudia','Claudia','Petersen','Missionary',NULL,NULL,'801-633-4601','ckjpete1@gmail.com','1498 Stanford Ct, Draper, UT 84020','1498 Stanford Ct','Draper','UT','84020',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-25'),(149,'1ab1e4a0-1bde-4844-86c6-eee1d7d777be','Weintz, Christopher','Christopher','Weintz','Missionary','Portal','1074645','801-792-6004','chrisweintz@comcast.net','5132 W RockRidge Lane, West Valley City, UT 84091','5132 W RockRidge Lane','West Valley City','UT','84091',NULL,NULL,'NS, DOS',NULL,'Westlake',NULL,NULL,'2024-06-25'),(168,'432ffece-0ee0-41b8-8ad2-e8b8dd27d3af','Milne, Rawlin Brad','Rawlin Brad','Milne','Missionary','Portal','1084107','201-230-7461','rbradmilne@gmail.com','846 W. Tripp Lane, Murray, UT  84123','846 W. Tripp Lane','Murray','UT','84123','','Murray Utah Parkway Stake',NULL,NULL,'','','','2024-08-17'),(169,'830a72e3-9ec7-46a6-8cc5-f985b7739353','Hofer, Irma','Irma','Hofer','Volunteer','','','801-949-5484','hoferdl@q.com','8006 So 3260 West, West Jordan, UT  84099','8006 So 3260 West','West Jordan','UT','84099','','',NULL,NULL,'','','','2024-08-27'),(170,'f33318e5-5a8f-4793-9d33-d88a78a97eb9','Stringham, Jan','Jan','Stringham','Volunteer','','','801-864-6226','jan.stringham@gmail.com','3583 Canyon Estates Drive, Bountiful, UT  84010','3583 Canyon Estates Drive','Bountiful','UT','84010','','',NULL,NULL,'','','','2024-08-27'),(171,'1ca3b383-66b5-4b6d-bd76-5f25c67ade04','Casaday, Kelly','Kelly','Casaday','Missionary','','','801-699-8399','Kelly@letter23.com',', , UT  ','','','UT','','','',NULL,NULL,'','','','2024-09-16'),(172,'2e78a9de-9afb-4e02-af0a-3d86d01e4823','Casaday, Ann','Ann','Casaday','Missionary','','','801-455-9748','ann.casaday@gmail.com',', , UT  ','','','UT','','','',NULL,NULL,'','','','2024-09-09'),(173,'e02fa79c-c9fa-4ba5-8d11-8ab56888548b','Egbert, Greg','Greg','Egbert','Missionary','','','801-828-0731','8eggs@comcast.net','10088 S Grouse Creek Cir, Sandy, UT  84092-6555','10088 S Grouse Creek Cir','Sandy','UT','84092-6555','','',NULL,NULL,'','','','2024-09-05'),(174,'d013111b-9e81-4ba9-b394-9820be5a1d06','Egbert, Lauri','Lauri','Egbert','Missionary','','','801-828-8848','8eggs@comcast.net','10088 S Grouse Creek Cir, Sandy, UT  84092-6555','10088 S Grouse Creek Cir','Sandy','UT','84092-6555','','',NULL,NULL,'','','','2024-09-12'),(176,'a3680893-d6d3-4e14-b786-4cc8d5c77374','Whitehead, Randy','Randy','Whitehead','Missionary','Portal','','801-201-9933','randy@47ford.com',', , UT  ','','','UT','','','',NULL,NULL,'','','','2024-09-09'),(177,'b16f9142-f1e6-47ce-b614-d9e416e17f78','Whitehead, Cheryl','Cheryl','Whitehead','Missionary','Portal','','801-244-8673','cherylwhitehead@gmail.com',', , UT  ','','','UT','','','',NULL,NULL,'','','','2024-09-09'),(178,'1a6664f0-2e1f-45fe-85f3-dfaf800fd431','Bateman, Robin R.','Robin R.','Bateman','Volunteer','','','801-419-8308','r.bateman3@hotmail.com','2807 Palma Way, Salt Lake City, UT  84121','2807 Palma Way','Salt Lake City','UT','84121','','',NULL,NULL,'','','','2024-09-12'),(179,'12fd1724-ae95-47b3-a834-d45437c9de00','Nordhagen, Nancy','Nancy','Nordhagen','Volunteer','','','801-580-5324','nanordhagen@hotmail.com','10038 Rockview Circle, Sandy, UT  84092','10038 Rockview Circle','Sandy','UT','84092','','',NULL,NULL,'','','','2024-09-16'),(181,'608178e6-2778-4deb-a50d-f484c484f35a','LaFortune, Jennie','Jennie','LaFortune','Volunteer','','','801-755-5783','jennielafortune@gmail.com','1670 E. Roycroft Place   C, Salt Lake City, UT  84124','1670 E. Roycroft Place   C','Salt Lake City','UT','84124','','',NULL,NULL,'','','','2024-09-12'),(183,'98e49c5d-daf6-4c11-a399-6aab06cc5f37','Wright, Brooke','Brooke','Wright','Volunteer','','','801-673-9145','brookehathaway1@gmail.com','1514 N. Silver Hollow Drive, Farmington, UT  84025','1514 N. Silver Hollow Drive','Farmington','UT','84025','','',NULL,NULL,'','','','2024-09-12'),(184,'62b87ad2-a988-4a84-ab37-b81f33ddf468','Halford, Pam','Pam','Halford','Volunteer','','','801-989-1654','pamhalford.1950@gmail.com','3210 Barney Street, West Valley City, UT  84119','3210 Barney Street','West Valley City','UT','84119','','',NULL,NULL,'','','','2024-09-12'),(185,'1a5116e7-c38b-4d13-b61d-7a3c55482c90','Hardman, Tracy','Tracy','Hardman','Volunteer','','','385-229-7352','monthardman17@gmail.com','1450 W Parkway Ave., West Valley City, UT  84119','1450 W Parkway Ave.','West Valley City','UT','84119','','',NULL,NULL,'','','','2024-09-25'),(186,'b116712c-5eda-400a-8b60-23feadd133a1','Fankhauser, Larry','Larry','Fankhauser','Missionary','','','801-661-5733','larryfankhauser5@gmail.com','4379 W. Bunker Circle, South Jordan, UT  84009','4379 W. Bunker Circle','South Jordan','UT','84009','','South Jordan Glenmoor',NULL,NULL,'','','','2024-09-13'),(187,'797ace00-14e9-4296-a8ef-8bf4475963b4','Fankhauser, Donna Kay','Donna Kay','Fankhauser','Missionary','','','801-244-5755','kayfankhauser@gmail.com','4379 Bunker Circle, South Jordan, UT  84009','4379 Bunker Circle','South Jordan','UT','84009','','South Jordan Glenmoor',NULL,NULL,'','','','2024-09-13'),(188,'b06b360c-d135-4355-a407-1f08191c3306','Lee, David','David','Lee','Volunteer','','','385-272-2229','leedj1@msn.com','8440 S Top of the World Dr, Cottonwood Heights, UT  84121','8440 S Top of the World Dr','Cottonwood Heights','UT','84121','','',NULL,NULL,'','','','2024-09-27'),(189,'b02db7a6-7522-4bcd-b23e-65b9c12e39f7','Lee, Kay','Kay','Lee','Volunteer','','','801-949-3894','kayzhouse@msn.com','8440 S Top of the World Dr, Cottonwood Heights, UT  84124','8440 S Top of the World Dr','Cottonwood Heights','UT','84124','','',NULL,NULL,'','','','2024-09-27'),(190,'f47af5da-6c02-4bc7-94a5-bf36db95fc09','Fortuna, Scott','Scott','Fortuna','Missionary','','','801-803-3443','arockprop@juno.com','2341 East 6660 South, Cottonwood Heights, UT  84121','2341 East 6660 South','Cottonwood Heights','UT','84121','','',NULL,NULL,'','','','2024-10-19'),(191,'145ddc9a-4358-4d38-9d1a-f735661b4fae','Fortuna, Barbara','Barbara','Fortuna','Missionary','','','801-450-3135','barb4tuna@hotmail.com','2341 East 6660 South, Cottonwood Heights, UT  84121','2341 East 6660 South','Cottonwood Heights','UT','84121','','',NULL,NULL,'','','','2024-10-18'),(192,'5ad88eb2-eb1b-429e-bc7d-45584d6cbb7f','Halford, Stephen','Stephen','Halford','Volunteer','','','801-725-7843','stevehalford@comcast.net','3210 Barney St., West Valley City, UT  84119','3210 Barney St.','West Valley City','UT','84119','','',NULL,NULL,'','','','2024-10-18'),(193,'adb4e388-2c0a-48e4-a866-d770bc73e4fa','de St. Aubin, Mark','Mark','de St. Aubin','Missionary','','','801-891-3137','mark.lorene@gmail.com','3351 El Serrito Dr., Salt Lake City, UT  84109','3351 El Serrito Dr.','Salt Lake City','UT','84109','','',NULL,NULL,'','','','2024-10-18'),(194,'db2f8df4-022f-4327-b5dc-85e1c8cec698','de St. Aubin, Lorene','Lorene','de St. Aubin','Missionary','','','801-891-4675','mark.lorene@gmail.com','3351 El Serrito Dr., Salt Lake City, UT  84109','3351 El Serrito Dr.','Salt Lake City','UT','84109','','',NULL,NULL,'','','','2024-10-18'),(195,'1b3a2ef5-c6fc-4c3a-b8d9-77440487b7cb','Holloman, Karen','Karen','Holloman','Volunteer','','','530-249-1046','kacudawech@gmail.com','5045 Peper Blvd, Kearns, UT  ','5045 Peper Blvd','Kearns','UT','','','',NULL,NULL,'','','','2024-10-18'),(196,'c9c40982-4214-4412-aa7c-7bfb20f69510','Hansen, Brock','Brock','Hansen','Volunteer','','','801-889-6445','c.brockhansen@gmail.com','4531 Briarcreek Drive, Salt Lake City, UT  84117','4531 Briarcreek Drive','Salt Lake City','UT','84117','','',NULL,NULL,'','','','2024-10-18'),(197,'2070aa70-5a59-4490-9af4-ecc404498b0e','Evans, John','John','Evans','Volunteer','','','','',', , UT  ','','','UT','','','',NULL,NULL,'','','','2024-11-13');
/*!40000 ALTER TABLE `mhi_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mhi_person_assignment_role`
--

DROP TABLE IF EXISTS `mhi_person_assignment_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mhi_person_assignment_role` (
  `person_assignment_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `assignment_role_id` int(11) DEFAULT NULL,
  `assignment_role_seq` int(11) DEFAULT NULL,
  `assignment_dt` text DEFAULT NULL,
  PRIMARY KEY (`person_assignment_role_id`),
  KEY `assignment_role_id` (`assignment_role_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `mhi_person_assignment_role_ibfk_1` FOREIGN KEY (`assignment_role_id`) REFERENCES `mhi_assignment_role` (`assignment_role_id`),
  CONSTRAINT `mhi_person_assignment_role_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `mhi_person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mhi_person_assignment_role`
--

LOCK TABLES `mhi_person_assignment_role` WRITE;
/*!40000 ALTER TABLE `mhi_person_assignment_role` DISABLE KEYS */;
INSERT INTO `mhi_person_assignment_role` VALUES (1,61,4,1,'2024-06-30'),(2,60,4,1,'2024-06-30'),(3,10,14,1,'2024-06-30'),(4,11,14,1,'2024-06-30'),(5,20,6,1,'2024-06-30'),(6,20,57,2,'2024-06-30'),(7,21,6,1,'2024-06-30'),(8,22,6,1,'2024-06-30'),(9,1,39,1,'2024-06-30'),(10,2,39,1,'2024-06-30'),(11,8,8,1,'2024-07-05'),(13,116,25,1,'2024-07-05'),(15,115,25,1,'2024-07-05'),(16,56,91,1,'2024-07-06'),(17,57,91,1,'2024-07-06'),(19,86,20,1,'2024-07-06'),(20,88,22,1,'2024-07-06'),(21,3,25,1,'2024-07-06'),(22,4,25,1,'2024-07-06'),(23,89,20,1,'2024-07-06'),(24,90,25,1,'2024-07-06'),(25,91,20,1,'2024-07-06'),(26,92,25,1,'2024-07-06'),(27,16,32,1,'2024-07-06'),(29,17,26,2,'2024-07-06'),(31,21,29,2,'2024-07-06'),(32,21,12,3,'2024-07-06'),(33,22,29,2,'2024-07-06'),(34,22,48,3,'2024-07-06'),(35,23,33,1,'2024-07-06'),(36,26,34,1,'2024-07-06'),(37,27,34,1,'2024-07-06'),(39,102,25,1,'2024-07-06'),(40,103,25,1,'2024-07-06'),(41,107,20,1,'2024-07-06'),(42,31,49,1,'2024-07-06'),(43,31,48,2,'2024-07-06'),(44,31,28,3,'2024-07-06'),(45,32,49,1,'2024-07-06'),(46,32,48,2,'2024-07-06'),(47,32,28,3,'2024-07-06'),(48,108,20,1,'2024-07-06'),(49,109,20,1,'2024-07-06'),(50,110,20,1,'2024-07-06'),(51,111,20,1,'2024-07-06'),(52,112,25,1,'2024-07-06'),(53,42,93,1,'2024-07-06'),(54,43,93,1,'2024-07-06'),(55,48,48,1,'2024-07-06'),(56,49,48,1,'2024-07-06'),(57,50,48,1,'2024-07-06'),(58,51,48,1,'2024-07-06'),(59,118,20,1,'2024-07-06'),(60,53,23,1,'2024-07-06'),(61,54,23,1,'2024-07-06'),(62,55,25,1,'2024-07-06'),(63,56,66,2,'2024-07-06'),(64,57,66,2,'2024-07-06'),(65,119,94,1,'2024-07-06'),(66,120,25,1,'2024-07-06'),(68,123,25,1,'2024-07-06'),(69,66,31,1,'2024-07-06'),(70,67,31,1,'2024-07-06'),(71,126,25,1,'2024-07-06'),(72,124,20,1,'2024-07-06'),(73,72,25,1,'2024-07-06'),(74,72,48,2,'2024-07-06'),(75,125,95,1,'2024-07-06'),(76,73,25,1,'2024-07-06'),(77,73,48,2,'2024-07-06'),(78,127,25,1,'2024-07-06'),(79,128,35,1,'2024-07-06'),(80,74,24,1,'2024-07-06'),(82,76,33,1,'2024-07-06'),(83,77,33,1,'2024-07-06'),(84,78,26,1,'2024-07-06'),(85,79,30,1,'2024-07-06'),(86,82,27,1,'2024-07-06'),(87,83,27,1,'2024-07-06'),(88,133,35,1,'2024-07-06'),(89,84,16,1,'2024-07-06'),(90,85,16,1,'2024-07-06'),(91,134,36,1,'2024-07-06'),(92,136,20,1,'2024-07-06'),(93,135,25,1,'2024-07-06'),(94,40,65,1,'2024-07-06'),(95,41,65,1,'2024-07-06'),(96,52,7,1,'2024-07-06'),(97,59,44,1,'2024-07-06'),(98,58,44,1,'2024-07-06'),(99,63,42,1,'2024-07-06'),(100,62,81,1,'2024-07-06'),(103,68,88,1,'2024-07-06'),(104,69,88,1,'2024-07-06'),(105,20,11,3,'2024-07-08'),(106,94,20,1,'2024-07-08'),(107,100,48,1,'2024-07-08'),(108,105,46,1,'2024-07-08'),(109,28,79,1,'2024-07-08'),(110,29,79,1,'2024-07-08'),(111,106,13,1,'2024-07-08'),(114,46,99,1,'2024-07-08'),(115,47,99,1,'2024-07-08'),(116,52,13,2,'2024-07-08'),(117,117,36,1,'2024-07-08'),(118,63,48,2,'2024-07-08'),(119,62,48,2,'2024-07-08'),(120,68,48,2,'2024-07-08'),(121,69,48,2,'2024-07-08'),(123,71,48,1,'2024-07-08'),(125,80,51,1,'2024-07-08'),(126,81,97,1,'2024-07-08'),(127,131,25,1,'2024-07-08'),(129,15,65,1,'2024-07-08'),(130,14,65,1,'2024-07-08'),(133,113,25,1,'2024-07-08'),(134,122,12,1,'2024-07-08'),(135,114,20,1,'2024-07-08'),(140,98,93,1,'2024-07-14'),(141,97,93,1,'2024-07-14'),(142,99,93,1,'2024-07-14'),(143,96,93,1,'2024-07-14'),(144,95,93,1,'2024-07-14'),(145,30,9,1,'2024-07-14'),(146,34,100,1,'2024-07-14'),(147,35,100,1,'2024-07-14'),(148,36,101,1,'2024-07-14'),(149,37,101,1,'2024-07-14'),(150,44,35,1,'2024-07-14'),(151,44,100,2,'2024-07-14'),(152,45,35,1,'2024-07-14'),(154,7,75,1,'2024-07-14'),(155,6,75,1,'2024-07-14'),(156,80,40,2,'2024-07-14'),(157,81,40,2,'2024-07-14'),(158,59,41,2,'2024-07-14'),(159,58,41,2,'2024-07-14'),(160,23,44,2,'2024-07-14'),(161,75,44,1,'2024-07-14'),(162,76,44,2,'2024-07-14'),(163,77,44,2,'2024-07-14'),(164,132,44,1,'2024-07-14'),(165,149,44,1,'2024-07-14'),(166,65,74,2,'2024-08-02'),(167,64,74,2,'2024-08-02'),(169,70,84,1,'2024-08-02'),(170,70,48,2,'2024-08-02'),(171,71,84,2,'2024-08-02'),(174,169,25,1,'2024-08-27'),(175,170,25,1,'2024-08-27'),(181,172,58,1,'2024-09-09'),(182,171,58,1,'2024-09-09'),(183,173,58,1,'2024-09-09'),(184,174,58,1,'2024-09-09'),(185,177,3,1,'2024-09-09'),(186,176,3,1,'2024-09-09'),(187,178,20,1,'2024-09-12'),(188,179,35,1,'2024-09-12'),(189,181,20,1,'2024-09-12'),(190,183,20,1,'2024-09-12'),(191,184,20,1,'2024-09-12'),(192,105,89,2,'2024-09-12'),(193,185,89,1,'2024-09-12'),(194,188,25,1,'2024-09-18'),(195,189,25,1,'2024-09-18'),(196,15,17,2,'2024-09-18'),(197,14,17,2,'2024-09-18');
/*!40000 ALTER TABLE `mhi_person_assignment_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mhi_person_contact`
--

DROP TABLE IF EXISTS `mhi_person_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mhi_person_contact` (
  `contact_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `contact_date` date DEFAULT NULL,
  `contact_type_txt` text DEFAULT NULL,
  `contact_purpose_txt` text DEFAULT NULL,
  `contact_notes_txt` text DEFAULT NULL,
  `last_edit_dt` date DEFAULT NULL,
  PRIMARY KEY (`contact_id`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `mhi_person_contact_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `mhi_person` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mhi_person_contact`
--

LOCK TABLES `mhi_person_contact` WRITE;
/*!40000 ALTER TABLE `mhi_person_contact` DISABLE KEYS */;
INSERT INTO `mhi_person_contact` VALUES (1,61,'2024-06-24','Email','MHI Portal Cleanup','Sent example letter that I will use to initiate the process - first with the Balderas.','2024-06-25');
/*!40000 ALTER TABLE `mhi_person_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mhi_person_language`
--

DROP TABLE IF EXISTS `mhi_person_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mhi_person_language` (
  `person_language_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `language_seq` int(11) DEFAULT NULL,
  `last_edit_dt` text DEFAULT NULL,
  PRIMARY KEY (`person_language_id`),
  KEY `person_id` (`person_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `mhi_person_language_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `mhi_person` (`person_id`),
  CONSTRAINT `mhi_person_language_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `mhi_language` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mhi_person_language`
--

LOCK TABLES `mhi_person_language` WRITE;
/*!40000 ALTER TABLE `mhi_person_language` DISABLE KEYS */;
INSERT INTO `mhi_person_language` VALUES (1,21,1,1,'2024-06-25'),(2,22,1,1,'2024-06-25'),(3,95,1,1,'2024-06-25'),(4,23,1,1,'2024-06-25'),(6,116,1,1,'2024-06-25'),(47,115,1,1,'2024-07-03'),(48,3,1,2,'2024-07-04'),(49,4,1,2,'2024-07-04'),(52,18,1,2,'2024-07-06'),(53,19,1,2,'2024-07-06'),(54,60,1,2,'2024-07-14');
/*!40000 ALTER TABLE `mhi_person_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mhi_process_tracking`
--

DROP TABLE IF EXISTS `mhi_process_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mhi_process_tracking` (
  `process_track_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) DEFAULT NULL,
  `missionary_portal_number_txt` text DEFAULT NULL,
  `bishop_nm` text DEFAULT NULL,
  `bishop_phone` text DEFAULT NULL,
  `bishop_email` text DEFAULT NULL,
  `stake_pres_nm` text DEFAULT NULL,
  `stake_pres_phone` text DEFAULT NULL,
  `stake_pres_email` text DEFAULT NULL,
  `call_volunteer_dt` text DEFAULT NULL,
  `call_volunteer_letter_dt` text DEFAULT NULL,
  `release_dt` text DEFAULT NULL,
  `badge_ordered_YN` char(1) DEFAULT NULL,
  `badge_received_YN` char(1) DEFAULT NULL,
  `badge_received_dt` text DEFAULT NULL,
  `missionary_portal_complete_dt` text DEFAULT NULL,
  `last_edit_dt` text DEFAULT NULL,
  PRIMARY KEY (`process_track_id`),
  KEY `mhipersonid1_idx` (`person_id`),
  CONSTRAINT `mhipersonid1` FOREIGN KEY (`person_id`) REFERENCES `mhi_person` (`person_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mhi_process_tracking`
--

LOCK TABLES `mhi_process_tracking` WRITE;
/*!40000 ALTER TABLE `mhi_process_tracking` DISABLE KEYS */;
INSERT INTO `mhi_process_tracking` VALUES (1,3,'01-zLmChlGqyo','Dan Swenson','801-860-4023','danswensen@hotmail.com','Todd Zenger','801-580-1745','tzenger@kmclaw.com','2024-04-01',NULL,'2026-04-01','Y','Y','2024-04-01',NULL,'2024-07-09'),(2,4,'01-uJkIfhao31','Dan Swenson','801-860-4023','danswensen@hotmail.com','Todd Zenger','801-580-1745','tzenger@kmclaw.com','2024-04-01','','2026-04-01','Y','Y','2024-04-01','','2024-07-10'),(3,115,'','Mark Phillips','801-648-4558','mlphillips64@msn.com','Mosiah Ramos','435-799-6047','mosiah.rm@gmail.com','2024-03-10','','','','','','','2024-08-15'),(4,116,'','Mark Phillips','801-648-4558','mlphillips64@msn.com','Mosiah Ramos','435-799-6047','mosiah.rm@gmail.com','2024-03-10','','','','','','','2024-08-27'),(8,60,'','','','','','','','','','','','','','','2024-07-15'),(10,39,'','','','','','','','','','','','','','','2024-08-02'),(11,38,'','','','','','','','','','','','','','','2024-08-02'),(28,1,'','','','','','','','2024-03-04','','2025-01-26','','','','2024-08-16','2024-08-16'),(29,2,'','','','','','','','2024-03-04','','2025-01-26','','','','2024-08-16','2024-08-16'),(30,33,'','','','','','','','2024-07-19','2026-07-19','','','','','2024-08-16','2024-08-16'),(33,168,'','','','','Pres. Blake Facer','','','2024-07-07','','2024-08-16','','','','2024-08-16','2024-08-17'),(34,15,'01-xuXKfhXbmd','','','','','','','','','','','','','','2024-08-23'),(35,18,'01-TX62jPKnGG','','','','','','','','','','','','','','2024-08-23'),(36,19,'01-troIZ70rIH','','','','','','','','','','','','','','2024-08-23'),(37,40,'01-anbx8hipSX','','','','','','','','','','','','','','2024-08-23'),(38,55,'01-GowMRTwl9o','','','','','','','','','','','','','','2024-08-23'),(39,169,'','','','','','','','','','','','','','','2024-08-27'),(40,170,'','','','','','','','','','','','','','','2024-08-27'),(41,112,'','','','','','','','','','','','','','','2024-09-10'),(42,123,'','','','','','','','','','','','','','','2024-08-27'),(43,135,'','','','','','','','','','','','','','','2024-08-27'),(44,171,'','','','','','','','2024-09-04','','','','','','','2024-09-16'),(45,172,'','','','','','','','2024-09-04','','','','','','','2024-09-09'),(46,173,'','','','','','','','2024-09-04','','','','','','','2024-09-05'),(47,174,'','','','','','','','2024-09-04','','','','','','','2024-09-12'),(49,176,'','','','','','','','','','','','','','','2024-09-09'),(50,177,'','','','','','','','','','','','','','','2024-09-09'),(51,121,'','','','','','','','','','','','','','','2024-09-10'),(52,76,'','','','','','','','','','','','','','','2024-09-16'),(53,77,'','','','','','','','','','','','','','','2024-09-16'),(54,6,'','','','','','','','','','','','','','','2024-09-10'),(55,136,'','','','','','','','','','','','','','','2024-09-16'),(56,102,'','','','','','','','','','','','','','','2024-09-12'),(57,24,'','','','','','','','','','','','','','','2024-09-10'),(58,25,'','','','','','','','','','','','','','','2024-09-10'),(59,93,'','','','','','','','','','','','','','','2024-09-10'),(60,99,'','','','','','','','','','','','','','','2024-09-10'),(61,178,'','','','','','','','','','','','','','','2024-09-12'),(62,42,'','','','','','','','','','','','','','','2024-09-16'),(63,43,'','','','','','','','','','','','','','','2024-09-16'),(64,179,'','','','','','','','','','','','','','','2024-09-16'),(66,181,'','','','','','','','','','','','','','','2024-09-12'),(68,183,'','','','','','','','','','','','','','','2024-09-12'),(69,184,'','','','','','','','','','','','','','','2024-09-12'),(70,31,'','','','','','','','','','','','','','','2024-09-16'),(71,32,'','','','','','','','','','','','','','','2024-09-16'),(72,134,'','','','','','','','','','','','','','','2024-09-16'),(73,185,'','','','','','','','','','','','','','','2024-09-25'),(74,105,'','','','','','','','','','','','','','','2024-09-25'),(75,186,'','','','','John Monson','','','','','','','','','','2024-09-13'),(76,187,'','','','','John Monson','','','','','','','','','','2024-09-13'),(77,126,'','','','','','','','','','','','','','','2024-09-14'),(78,89,'','','','','','','','','','','','','','','2024-09-16'),(79,94,'','','','','','','','','','','','','','','2024-09-16'),(80,108,'','','','','','','','','','','','','','','2024-09-16'),(81,137,'','','','','','','','','','','','','','','2024-09-16'),(82,138,'','','','','','','','','','','','','','','2024-09-16'),(83,141,'','','','','','','','','','','','','','','2024-09-16'),(84,139,'','','','','','','','','','','','','','','2024-09-16'),(85,140,'','','','','','','','','','','','','','','2024-09-16'),(86,144,'','','','','','','','','','','','','','','2024-09-16'),(87,145,'','','','','','','','','','','','','','','2024-09-16'),(88,142,'','','','','','','','','','','','','','','2024-09-16'),(89,143,'','','','','','','','','','','','','','','2024-09-16'),(90,119,'','','','','','','','','','','','','','','2024-09-16'),(91,130,'','','','','','','','','','','','','','','2024-09-17'),(92,188,'','','','','','','','2024-09-19','','','','','','','2024-09-27'),(93,189,'','','','','','','','2024-09-19','','','','','','','2024-09-27'),(94,14,'','','','','','','','','','','','','','','2024-09-18'),(95,13,'','','','','','','','','','','','','','','2024-09-22'),(96,12,'','','','','','','','','','','','','','','2024-09-22'),(97,103,'','','','','','','','','','','','','','','2024-09-25'),(98,87,'','','','','','','','','','','','','','','2024-09-27'),(99,117,'','','','','','','','','','','','','','','2024-09-27'),(100,125,'','','','','','','','','','','','','','','2024-09-27'),(101,190,'','','','','','','','','','','','','','','2024-10-18'),(102,191,'','','','','','','','','','','','','','','2024-10-18'),(103,192,'','','','','','','','','','','','','','','2024-10-18'),(104,193,'','','','','','','','','','','','','','','2024-10-18'),(105,194,'','','','','','','','','','','','','','','2024-10-18'),(106,195,'','','','','','','','','','','','','','','2024-10-18'),(107,196,'','','','','','','','','','','','','','','2024-10-18'),(108,5,'','','','','','','','','','','','','','','2024-10-30'),(109,101,'','','','','','','','','','','','','','','2024-11-11'),(110,197,'','','','','','','','','','','','','','','2024-11-13');
/*!40000 ALTER TABLE `mhi_process_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `mhi_to_mht_person`
--

DROP TABLE IF EXISTS `mhi_to_mht_person`;
/*!50001 DROP VIEW IF EXISTS `mhi_to_mht_person`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mhi_to_mht_person` AS SELECT
 1 AS `mht_person_guid`,
  1 AS `mht_person_type_id`,
  1 AS `mht_person_first_name_txt`,
  1 AS `mht_person_middle_name_txt`,
  1 AS `mht_person_last_name_txt`,
  1 AS `mht_person_suffix_txt`,
  1 AS `mht_person_prefix_txt`,
  1 AS `mht_person_phone_num_preferred_txt`,
  1 AS `mht_person_email_preferred_txt`,
  1 AS `mht_person_addr_street_txt`,
  1 AS `mht_person_addr_apt_txt`,
  1 AS `mht_person_addr_city_txt`,
  1 AS `mht_person_addr_state_txt`,
  1 AS `mht_person_addr_zip_code_txt`,
  1 AS `mht_person_last_edit_dt` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `north_granger_tracking`
--

DROP TABLE IF EXISTS `north_granger_tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `north_granger_tracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GUID` text DEFAULT NULL,
  `Name` text DEFAULT NULL,
  `Type` text DEFAULT NULL,
  `Status` text DEFAULT NULL,
  `PortalNum` text DEFAULT NULL,
  `Phone` text DEFAULT NULL,
  `Email` text DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `Assignment` text DEFAULT NULL,
  `Role` text DEFAULT NULL,
  `Area` text DEFAULT NULL,
  `Ward` text DEFAULT NULL,
  `LastEditDate` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `north_granger_tracking`
--

LOCK TABLES `north_granger_tracking` WRITE;
/*!40000 ALTER TABLE `north_granger_tracking` DISABLE KEYS */;
/*!40000 ALTER TABLE `north_granger_tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `northgranger`
--

DROP TABLE IF EXISTS `northgranger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `northgranger` (
  `GUID` text DEFAULT NULL,
  `Name` text DEFAULT NULL,
  `Type` text DEFAULT NULL,
  `Status` text DEFAULT NULL,
  `PortalNum` text DEFAULT NULL,
  `Phone` text DEFAULT NULL,
  `Email` text DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `Assignment` text DEFAULT NULL,
  `Role` text DEFAULT NULL,
  `Area` text DEFAULT NULL,
  `Ward` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `northgranger`
--

LOCK TABLES `northgranger` WRITE;
/*!40000 ALTER TABLE `northgranger` DISABLE KEYS */;
/*!40000 ALTER TABLE `northgranger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp_person_role`
--

DROP TABLE IF EXISTS `temp_person_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp_person_role` (
  `name_txt` varchar(100) DEFAULT NULL,
  `role_desc_txt` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp_person_role`
--

LOCK TABLES `temp_person_role` WRITE;
/*!40000 ALTER TABLE `temp_person_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `temp_person_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_ar_nospace`
--

DROP TABLE IF EXISTS `vw_ar_nospace`;
/*!50001 DROP VIEW IF EXISTS `vw_ar_nospace`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_ar_nospace` AS SELECT
 1 AS `assignment_role_id`,
  1 AS `role` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_assignment_role`
--

DROP TABLE IF EXISTS `vw_assignment_role`;
/*!50001 DROP VIEW IF EXISTS `vw_assignment_role`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_assignment_role` AS SELECT
 1 AS `assignment_id`,
  1 AS `Assignment`,
  1 AS `Role`,
  1 AS `ReportToRole`,
  1 AS `assigned_cnt`,
  1 AS `assignment_role_id`,
  1 AS `ar_report_to_id`,
  1 AS `role_id`,
  1 AS `role_search_fld`,
  1 AS `report_to_search_fld` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_mhi_base_data`
--

DROP TABLE IF EXISTS `vw_mhi_base_data`;
/*!50001 DROP VIEW IF EXISTS `vw_mhi_base_data`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_mhi_base_data` AS SELECT
 1 AS `person_id`,
  1 AS `Last Name`,
  1 AS `First Name`,
  1 AS `Type`,
  1 AS `Status`,
  1 AS `PortalNum`,
  1 AS `Phone`,
  1 AS `Email`,
  1 AS `Street`,
  1 AS `City`,
  1 AS `State`,
  1 AS `Zip Code`,
  1 AS `Languages`,
  1 AS `Home Ward`,
  1 AS `Bishop`,
  1 AS `Bp Phone`,
  1 AS `Bp Email`,
  1 AS `Home Stake`,
  1 AS `Staka Pres`,
  1 AS `SP Phone`,
  1 AS `SP Email`,
  1 AS `Notes`,
  1 AS `Assign Area`,
  1 AS `Assign Ward`,
  1 AS `Begin Dt`,
  1 AS `Letter Date`,
  1 AS `Release Dt`,
  1 AS `Badge Ordered`,
  1 AS `Badge Received`,
  1 AS `Badge Recvd Date`,
  1 AS `Portal Num`,
  1 AS `Portal Complete Dt`,
  1 AS `last_edit_dt`,
  1 AS `search_fld` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_mhi_to_mht_person_released`
--

DROP TABLE IF EXISTS `vw_mhi_to_mht_person_released`;
/*!50001 DROP VIEW IF EXISTS `vw_mhi_to_mht_person_released`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_mhi_to_mht_person_released` AS SELECT
 1 AS `person_id`,
  1 AS `mht_person_guid`,
  1 AS `mht_person_type_id`,
  1 AS `mht_person_first_name_txt`,
  1 AS `mht_person_middle_name_txt`,
  1 AS `mht_person_last_name_txt`,
  1 AS `mht_person_suffix_txt`,
  1 AS `mht_person_prefix_txt`,
  1 AS `mht_person_phone_num_preferred_txt`,
  1 AS `mht_person_email_preferred_txt`,
  1 AS `mht_person_addr_street_txt`,
  1 AS `mht_person_addr_apt_txt`,
  1 AS `mht_person_addr_city_txt`,
  1 AS `mht_person_addr_state_txt`,
  1 AS `mht_person_addr_zip_code_txt`,
  1 AS `mht_person_release_dt`,
  1 AS `mht_person_last_edit_dt` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_person_assignments`
--

DROP TABLE IF EXISTS `vw_person_assignments`;
/*!50001 DROP VIEW IF EXISTS `vw_person_assignments`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_person_assignments` AS SELECT
 1 AS `person_id`,
  1 AS `assignment` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_person_heirarchy`
--

DROP TABLE IF EXISTS `vw_person_heirarchy`;
/*!50001 DROP VIEW IF EXISTS `vw_person_heirarchy`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_person_heirarchy` AS SELECT
 1 AS `id`,
  1 AS `name`,
  1 AS `pid`,
  1 AS `title` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_person_to_spreadsheet`
--

DROP TABLE IF EXISTS `vw_person_to_spreadsheet`;
/*!50001 DROP VIEW IF EXISTS `vw_person_to_spreadsheet`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_person_to_spreadsheet` AS SELECT
 1 AS `person_id`,
  1 AS `name`,
  1 AS `namefnf`,
  1 AS `type`,
  1 AS `portal`,
  1 AS `phone`,
  1 AS `email`,
  1 AS `address`,
  1 AS `area`,
  1 AS `ward`,
  1 AS `homeward`,
  1 AS `homestake`,
  1 AS `notes`,
  1 AS `assignments` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_role_heirarchy`
--

DROP TABLE IF EXISTS `vw_role_heirarchy`;
/*!50001 DROP VIEW IF EXISTS `vw_role_heirarchy`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_role_heirarchy` AS SELECT
 1 AS `id`,
  1 AS `name`,
  1 AS `pid` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vw_unassigned`
--

DROP TABLE IF EXISTS `vw_unassigned`;
/*!50001 DROP VIEW IF EXISTS `vw_unassigned`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_unassigned` AS SELECT
 1 AS `name` */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'mhi'
--

--
-- Dumping routines for database 'mhi'
--

--
-- Current Database: `mhi`
--

USE `mhi`;

--
-- Final view structure for view `mhi_to_mht_person`
--

/*!50001 DROP VIEW IF EXISTS `mhi_to_mht_person`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`crlyon2r`@`67.207.38.15` SQL SECURITY DEFINER */
/*!50001 VIEW `mhi_to_mht_person` AS select `p`.`guid` AS `mht_person_guid`,case when `p`.`type_txt` = 'Missionary' then 1 when `p`.`type_txt` = 'Volunteer' then 2 when `p`.`type_txt` = 'Community' then 3 end AS `mht_person_type_id`,`p`.`name_first_txt` AS `mht_person_first_name_txt`,'' AS `mht_person_middle_name_txt`,`p`.`name_last_txt` AS `mht_person_last_name_txt`,'' AS `mht_person_suffix_txt`,'' AS `mht_person_prefix_txt`,`p`.`phone_num` AS `mht_person_phone_num_preferred_txt`,`p`.`email_txt` AS `mht_person_email_preferred_txt`,`p`.`address_street_txt` AS `mht_person_addr_street_txt`,'' AS `mht_person_addr_apt_txt`,`p`.`address_city_txt` AS `mht_person_addr_city_txt`,`p`.`address_state_txt` AS `mht_person_addr_state_txt`,`p`.`address_zip_code_txt` AS `mht_person_addr_zip_code_txt`,`p`.`last_edit_dt` AS `mht_person_last_edit_dt` from `mhi_person` `p` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ar_nospace`
--

/*!50001 DROP VIEW IF EXISTS `vw_ar_nospace`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`crlyon2r`@`67.207.38.15` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ar_nospace` AS select `vw_assignment_role`.`assignment_role_id` AS `assignment_role_id`,replace(replace(replace(replace(`vw_assignment_role`.`Role`,' ',''),'&',''),'/',''),'-','') AS `role` from `vw_assignment_role` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_assignment_role`
--

/*!50001 DROP VIEW IF EXISTS `vw_assignment_role`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`crlyon2r`@`67.207.38.15` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_assignment_role` AS select `la`.`assignment_id` AS `assignment_id`,`la`.`assignment_code_txt` AS `Assignment`,`lr`.`role_desc_txt` AS `Role`,concat(`la2`.`assignment_code_txt`,' / ',`lr2`.`role_desc_txt`) AS `ReportToRole`,ifnull(`iq`.`assigned_cnt`,0) AS `assigned_cnt`,`ar`.`assignment_role_id` AS `assignment_role_id`,`ar`.`ar_report_to_id` AS `ar_report_to_id`,`lr`.`role_id` AS `role_id`,concat(`la`.`assignment_code_txt`,' | ',`lr`.`role_desc_txt`) AS `role_search_fld`,concat(`la2`.`assignment_code_txt`,' | ',`lr2`.`role_desc_txt`) AS `report_to_search_fld` from ((((((`mhi_assignment_role` `ar` left join `mhi_lu_assignment` `la` on(`la`.`assignment_id` = `ar`.`assignment_id`)) left join `mhi_lu_role` `lr` on(`lr`.`role_id` = `ar`.`role_id`)) left join `mhi_assignment_role` `ar2` on(`ar`.`ar_report_to_id` = `ar2`.`assignment_role_id`)) left join `mhi_lu_assignment` `la2` on(`la2`.`assignment_id` = `ar2`.`assignment_id`)) left join `mhi_lu_role` `lr2` on(`lr2`.`role_id` = `ar2`.`role_id`)) left join (select `mpar`.`assignment_role_id` AS `assignment_role_id`,count(0) AS `assigned_cnt` from (`mhi_person` `p` left join `mhi_person_assignment_role` `mpar` on(`p`.`person_id` = `mpar`.`person_id`)) where ifnull(`p`.`status_txt`,'Null')  not like 'Releas%' group by `mpar`.`assignment_role_id`) `iq` on(`iq`.`assignment_role_id` = `ar`.`assignment_role_id`)) order by 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_mhi_base_data`
--

/*!50001 DROP VIEW IF EXISTS `vw_mhi_base_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`crlyon2r`@`67.207.38.15` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_mhi_base_data` AS select `p`.`person_id` AS `person_id`,ifnull(`p`.`name_last_txt`,'') AS `Last Name`,ifnull(`p`.`name_first_txt`,'') AS `First Name`,ifnull(`p`.`type_txt`,'') AS `Type`,ifnull(`p`.`status_txt`,'') AS `Status`,ifnull(`p`.`portal_number_txt`,'') AS `PortalNum`,ifnull(`p`.`phone_num`,'') AS `Phone`,ifnull(`p`.`email_txt`,'') AS `Email`,ifnull(`p`.`address_street_txt`,'') AS `Street`,ifnull(`p`.`address_city_txt`,'') AS `City`,ifnull(`p`.`address_state_txt`,'') AS `State`,ifnull(`p`.`address_zip_code_txt`,'') AS `Zip Code`,group_concat(ifnull(`l`.`language_txt`,'') separator ',') AS `Languages`,ifnull(`p`.`home_ward_txt`,'') AS `Home Ward`,ifnull(`t`.`bishop_nm`,'') AS `Bishop`,ifnull(`t`.`bishop_phone`,'') AS `Bp Phone`,ifnull(`t`.`bishop_email`,'') AS `Bp Email`,ifnull(`p`.`home_stake_txt`,'') AS `Home Stake`,ifnull(`t`.`stake_pres_nm`,'') AS `Staka Pres`,ifnull(`t`.`stake_pres_phone`,'') AS `SP Phone`,ifnull(`t`.`stake_pres_email`,'') AS `SP Email`,ifnull(`p`.`note_txt`,'') AS `Notes`,ifnull(`p`.`assigned_area_txt`,'') AS `Assign Area`,ifnull(`p`.`assigned_ward_txt`,'') AS `Assign Ward`,ifnull(`t`.`call_volunteer_dt`,'') AS `Begin Dt`,ifnull(`t`.`call_volunteer_letter_dt`,'') AS `Letter Date`,ifnull(`t`.`release_dt`,'') AS `Release Dt`,ifnull(`t`.`badge_ordered_YN`,'') AS `Badge Ordered`,ifnull(`t`.`badge_received_YN`,'') AS `Badge Received`,ifnull(`t`.`badge_received_dt`,'') AS `Badge Recvd Date`,ifnull(`t`.`missionary_portal_number_txt`,'') AS `Portal Num`,ifnull(`t`.`missionary_portal_complete_dt`,'') AS `Portal Complete Dt`,`p`.`last_edit_dt` AS `last_edit_dt`,concat('ID:',`p`.`person_id`,' | ',ifnull(`p`.`name_last_txt`,''),' | ',ifnull(`p`.`name_first_txt`,''),' | ',ifnull(`p`.`type_txt`,''),' | ',ifnull(`p`.`status_txt`,''),' | ',ifnull(`p`.`phone_num`,''),' | ',ifnull(`p`.`email_txt`,''),' | ',ifnull(`p`.`address_street_txt`,''),' | ',ifnull(`p`.`address_city_txt`,''),' | ',ifnull(`p`.`address_zip_code_txt`,''),' | ',group_concat(ifnull(`l`.`language_txt`,'') separator ','),' | ',ifnull(`p`.`home_ward_txt`,''),' | ',ifnull(`t`.`bishop_nm`,''),' | ',ifnull(`t`.`bishop_phone`,''),' | ',ifnull(`t`.`bishop_email`,''),' | ',ifnull(`p`.`home_stake_txt`,''),' | ',ifnull(`t`.`stake_pres_nm`,''),' | ',ifnull(`t`.`stake_pres_phone`,''),' | ',ifnull(`t`.`stake_pres_email`,''),' | ',ifnull(`p`.`assigned_area_txt`,''),' | ',ifnull(`p`.`assigned_ward_txt`,''),' | ',ifnull(`p`.`note_txt`,''),' | ',ifnull(`t`.`missionary_portal_number_txt`,''),' | ',ifnull(`t`.`call_volunteer_dt`,''),' | ',ifnull(`t`.`release_dt`,''),' | ',ifnull(`t`.`missionary_portal_complete_dt`,''),' | ',`p`.`last_edit_dt` <> 0) AS `search_fld` from (((`mhi_person` `p` left join `mhi_process_tracking` `t` on(`p`.`person_id` = `t`.`person_id`)) left join `mhi_person_language` `pl` on(`pl`.`person_id` = `p`.`person_id`)) left join `mhi_language` `l` on(`l`.`language_id` = `pl`.`language_id`)) group by `p`.`person_id` order by `p`.`status_txt` is not null,`p`.`type_txt`,`p`.`name_last_txt`,`p`.`name_first_txt` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_mhi_to_mht_person_released`
--

/*!50001 DROP VIEW IF EXISTS `vw_mhi_to_mht_person_released`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`crlyon2r`@`67.207.38.15` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_mhi_to_mht_person_released` AS select `p`.`person_id` AS `person_id`,`p`.`guid` AS `mht_person_guid`,case when `p`.`type_txt` = 'Missionary' then 1 when `p`.`type_txt` = 'Volunteer' then 2 when `p`.`type_txt` = 'Community' then 3 end AS `mht_person_type_id`,`p`.`name_first_txt` AS `mht_person_first_name_txt`,'' AS `mht_person_middle_name_txt`,`p`.`name_last_txt` AS `mht_person_last_name_txt`,'' AS `mht_person_suffix_txt`,'' AS `mht_person_prefix_txt`,`p`.`phone_num` AS `mht_person_phone_num_preferred_txt`,`p`.`email_txt` AS `mht_person_email_preferred_txt`,`p`.`address_street_txt` AS `mht_person_addr_street_txt`,'' AS `mht_person_addr_apt_txt`,`p`.`address_city_txt` AS `mht_person_addr_city_txt`,`p`.`address_state_txt` AS `mht_person_addr_state_txt`,`p`.`address_zip_code_txt` AS `mht_person_addr_zip_code_txt`,substr(`p`.`status_txt`,10,10) AS `mht_person_release_dt`,`p`.`last_edit_dt` AS `mht_person_last_edit_dt` from `mhi_person` `p` where `p`.`status_txt` like 'Released%' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_person_assignments`
--

/*!50001 DROP VIEW IF EXISTS `vw_person_assignments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`crlyon2r`@`67.207.38.15` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_person_assignments` AS select `p`.`person_id` AS `person_id`,group_concat(concat(`par`.`assignment_role_seq`,'. ',`la`.`assignment_code_txt`,'-',`lr`.`role_desc_txt`) separator ' |#| ') AS `assignment` from ((((`mhi_person` `p` join `mhi_person_assignment_role` `par` on(`par`.`person_id` = `p`.`person_id`)) join `mhi_assignment_role` `ar` on(`par`.`assignment_role_id` = `ar`.`assignment_role_id`)) join `mhi_lu_assignment` `la` on(`la`.`assignment_id` = `ar`.`assignment_id`)) join `mhi_lu_role` `lr` on(`lr`.`role_id` = `ar`.`role_id`)) group by `p`.`person_id` order by 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_person_heirarchy`
--

/*!50001 DROP VIEW IF EXISTS `vw_person_heirarchy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`crlyon2r`@`67.207.38.15` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_person_heirarchy` AS select `ar`.`assignment_role_id` AS `id`,`la`.`assignment_code_txt` <> 0 or '/' or `lr`.`role_desc_txt` <> 0 AS `name`,`ar`.`ar_report_to_id` AS `pid`,group_concat(ifnull(`p`.`name_first_txt` <> 0 or ' ' or `p`.`name_last_txt` <> 0,'None'),' / ' separator ',') AS `title` from ((((`mhi_assignment_role` `ar` left join `mhi_lu_assignment` `la` on(`ar`.`assignment_id` = `la`.`assignment_id`)) left join `mhi_lu_role` `lr` on(`ar`.`role_id` = `lr`.`role_id`)) left join `mhi_person_assignment_role` `par` on(`par`.`assignment_role_id` = `ar`.`assignment_role_id`)) left join `mhi_person` `p` on(`p`.`person_id` = `par`.`person_id`)) group by `ar`.`assignment_role_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_person_to_spreadsheet`
--

/*!50001 DROP VIEW IF EXISTS `vw_person_to_spreadsheet`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`crlyon2r`@`67.207.38.15` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_person_to_spreadsheet` AS select `p`.`person_id` AS `person_id`,`p`.`name_full_txt` AS `name`,concat(`p`.`name_first_txt`,'  ',`p`.`name_last_txt`) AS `namefnf`,`p`.`type_txt` AS `type`,ifnull(`p`.`status_txt`,'') AS `portal`,ifnull(`p`.`phone_num`,'') AS `phone`,ifnull(`p`.`email_txt`,'') AS `email`,ifnull(`p`.`address_txt`,'') AS `address`,ifnull(`p`.`assigned_area_txt`,'') AS `area`,ifnull(`p`.`assigned_ward_txt`,'') AS `ward`,ifnull(`p`.`home_ward_txt`,'') AS `homeward`,ifnull(`p`.`home_stake_txt`,'') AS `homestake`,ifnull(`p`.`note_txt`,'') AS `notes`,ifnull(`pa`.`assignment`,'') AS `assignments` from (`mhi_person` `p` left join `vw_person_assignments` `pa` on(`p`.`person_id` = `pa`.`person_id`)) order by 5,4 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_role_heirarchy`
--

/*!50001 DROP VIEW IF EXISTS `vw_role_heirarchy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`crlyon2r`@`67.207.38.15` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_role_heirarchy` AS select `ar`.`assignment_role_id` AS `id`,`la`.`assignment_code_txt` <> 0 or '/' or `lr`.`role_desc_txt` <> 0 AS `name`,`ar`.`ar_report_to_id` AS `pid` from ((`mhi_assignment_role` `ar` left join `mhi_lu_assignment` `la` on(`ar`.`assignment_id` = `la`.`assignment_id`)) left join `mhi_lu_role` `lr` on(`ar`.`role_id` = `lr`.`role_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_unassigned`
--

/*!50001 DROP VIEW IF EXISTS `vw_unassigned`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`crlyon2r`@`67.207.38.15` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_unassigned` AS select `p`.`name_first_txt` <> 0 or ' ' or `p`.`name_last_txt` <> 0 AS `name` from ((select `mhi_person`.`person_id` AS `person_id`,`mhi_person`.`guid` AS `guid`,`mhi_person`.`name_full_txt` AS `name_full_txt`,`mhi_person`.`name_first_txt` AS `name_first_txt`,`mhi_person`.`name_last_txt` AS `name_last_txt`,`mhi_person`.`type_txt` AS `type_txt`,`mhi_person`.`status_txt` AS `status_txt`,`mhi_person`.`portal_number_txt` AS `portal_number_txt`,`mhi_person`.`phone_num` AS `phone_num`,`mhi_person`.`email_txt` AS `email_txt`,`mhi_person`.`address_txt` AS `address_txt`,`mhi_person`.`address_street_txt` AS `address_street_txt`,`mhi_person`.`address_city_txt` AS `address_city_txt`,`mhi_person`.`address_state_txt` AS `address_state_txt`,`mhi_person`.`address_zip_code_txt` AS `address_zip_code_txt`,`mhi_person`.`home_ward_txt` AS `home_ward_txt`,`mhi_person`.`home_stake_txt` AS `home_stake_txt`,`mhi_person`.`Assignment` AS `Assignment`,`mhi_person`.`Role` AS `Role`,`mhi_person`.`assigned_area_txt` AS `assigned_area_txt`,`mhi_person`.`assigned_ward_txt` AS `assigned_ward_txt`,`mhi_person`.`note_txt` AS `note_txt`,`mhi_person`.`last_edit_dt` AS `last_edit_dt` from `mhi_person`) `p` left join `mhi_person_assignment_role` `ar` on(`ar`.`person_id` = `p`.`person_id`)) where `ar`.`person_assignment_role_id` is null and (`p`.`status_txt` <> 'Released' or `p`.`status_txt` is null) order by `p`.`name_full_txt` */;
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

-- Dump completed on 2025-02-01  2:30:36
