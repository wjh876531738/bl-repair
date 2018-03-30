-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: bl_repair
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
-- Current Database: `bl_repair`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `bl_repair` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bl_repair`;

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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add computer',7,'add_computer'),(20,'Can change computer',7,'change_computer'),(21,'Can delete computer',7,'delete_computer'),(22,'Can add reporter',8,'add_reporter'),(23,'Can change reporter',8,'change_reporter'),(24,'Can delete reporter',8,'delete_reporter'),(25,'Can add computer problem',9,'add_computerproblem'),(26,'Can change computer problem',9,'change_computerproblem'),(27,'Can delete computer problem',9,'delete_computerproblem'),(28,'Can add article',10,'add_article'),(29,'Can change article',10,'change_article'),(30,'Can delete article',10,'delete_article'),(31,'Can add tag',11,'add_tag'),(32,'Can change tag',11,'change_tag'),(33,'Can delete tag',11,'delete_tag'),(34,'Can add comment',12,'add_comment'),(35,'Can change comment',12,'change_comment'),(36,'Can delete comment',12,'delete_comment'),(37,'Can add remind',13,'add_remind'),(38,'Can change remind',13,'change_remind'),(39,'Can delete remind',13,'delete_remind');
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
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$s8svL9gXhfjp$anooRRb2LpPU4Zqg4LfRaowThn1XH5r6p35vUM31UBs=','2018-03-27 16:06:58.954384',1,'wjh','','','876531738@qq.com',1,1,'2017-12-29 02:03:35.735920');
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
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_title` varchar(50) NOT NULL,
  `article_content` longtext NOT NULL,
  `article_desc` varchar(255) NOT NULL,
  `author_name` varchar(20) NOT NULL,
  `click_time` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (4,'电脑显示失败','显示吧','123213','1123',2,'2017-12-29 07:48:44.091702'),(5,'Test','This is test','test more.','wjh',12,'2018-03-11 02:49:17.587691'),(6,'Test','This is test','test more.','wjh',12,'2018-03-11 02:49:23.143622');
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article_tags`
--

DROP TABLE IF EXISTS `blog_article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_tags_article_id_tag_id_b78a22e9_uniq` (`article_id`,`tag_id`),
  KEY `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_article_tags_article_id_82c02dd6_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_tags`
--

LOCK TABLES `blog_article_tags` WRITE;
/*!40000 ALTER TABLE `blog_article_tags` DISABLE KEYS */;
INSERT INTO `blog_article_tags` VALUES (7,4,1),(6,4,2),(8,5,1),(9,6,1);
/*!40000 ALTER TABLE `blog_article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_comment`
--

DROP TABLE IF EXISTS `blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_content` varchar(255) NOT NULL,
  `commenter_ip` varchar(15) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comment_article_id_3d58bca6_fk_blog_article_id` (`article_id`),
  CONSTRAINT `blog_comment_article_id_3d58bca6_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_comment`
--

LOCK TABLES `blog_comment` WRITE;
/*!40000 ALTER TABLE `blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'computer'),(2,'显示器');
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-12-29 02:32:37.682432','1','computer note',1,'[{\"added\": {}}]',11,1),(2,'2017-12-29 02:32:46.350731','1','test',1,'[{\"added\": {}}]',10,1),(3,'2017-12-29 02:33:22.853285','2','显示器 note',1,'[{\"added\": {}}]',11,1),(4,'2017-12-29 02:33:25.074999','2','test',1,'[{\"added\": {}}]',10,1),(5,'2017-12-29 02:33:36.770688','3','tes',1,'[{\"added\": {}}]',10,1),(6,'2017-12-29 02:40:19.925040','1','10.0.108.11',1,'[{\"added\": {}}]',8,1),(7,'2017-12-29 02:40:33.506923','1','za201 35',1,'[{\"added\": {}}]',7,1),(8,'2017-12-29 02:41:11.428964','1','不正常2017-12-29 02:41:11.427979+00:00',1,'[{\"added\": {}}]',9,1),(9,'2017-12-29 02:41:35.008844','2','爱上了发动机洒落的反馈及地方撒2017-12-29 02:41:35.008142+00:00',1,'[{\"added\": {}}]',9,1),(10,'2017-12-29 03:47:22.194934','2','test',2,'[{\"changed\": {\"fields\": [\"tags\"]}}]',10,1),(11,'2017-12-29 03:47:31.832124','1','test',2,'[]',10,1),(12,'2017-12-29 05:28:24.362923','2','za205 01',1,'[{\"added\": {}}]',7,1),(13,'2017-12-29 07:48:44.095968','4','电脑显示失败',1,'[{\"added\": {}}]',10,1),(14,'2017-12-29 07:49:09.500435','3','tes',3,'',10,1),(15,'2017-12-29 07:49:09.512204','2','test',3,'',10,1),(16,'2017-12-29 07:49:09.532257','1','test',3,'',10,1),(17,'2018-03-12 02:39:28.886151','10','再来测试2018-03-11 13:22:33.486004+00:00',3,'',9,1),(18,'2018-03-12 02:39:28.897350','9','测试2018-03-11 13:21:10.591248+00:00',3,'',9,1),(19,'2018-03-12 02:39:28.905143','8','阿士大夫士大夫2017-12-29 07:51:08.787640+00:00',3,'',9,1),(20,'2018-03-12 02:39:28.914441','7','asjdfasdf2017-12-29 06:59:45.287925+00:00',3,'',9,1),(21,'2018-03-12 02:39:28.937158','6','asjdkfasdf2017-12-29 06:20:11.851315+00:00',3,'',9,1),(22,'2018-03-12 02:39:28.945200','5','asdffsda2017-12-29 06:20:03.619719+00:00',3,'',9,1),(23,'2018-03-12 02:39:28.954771','4','asdfjsalkdfflknerql2017-12-29 05:41:03.419889+00:00',3,'',9,1),(24,'2018-03-12 02:39:28.964693','3','asdjsadlk2017-12-29 05:40:53.114313+00:00',3,'',9,1),(25,'2018-03-12 02:39:28.976448','2','爱上了发动机洒落的反馈及地方撒2017-12-29 02:41:35.008142+00:00',3,'',9,1),(26,'2018-03-12 02:39:28.986990','1','不正常2017-12-29 02:41:11.427979+00:00',3,'',9,1),(27,'2018-03-12 02:39:35.467028','2','za205 01',3,'',7,1),(28,'2018-03-12 02:39:35.476068','1','za201 35',3,'',7,1),(29,'2018-03-12 02:46:50.785966','3','za202 102',3,'',7,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(10,'blog','article'),(12,'blog','comment'),(11,'blog','tag'),(5,'contenttypes','contenttype'),(7,'report','computer'),(9,'report','computerproblem'),(13,'report','remind'),(8,'report','reporter'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-12-29 02:02:20.964916'),(2,'auth','0001_initial','2017-12-29 02:02:22.872884'),(3,'admin','0001_initial','2017-12-29 02:02:23.339510'),(4,'admin','0002_logentry_remove_auto_add','2017-12-29 02:02:23.378262'),(5,'contenttypes','0002_remove_content_type_name','2017-12-29 02:02:23.621056'),(6,'auth','0002_alter_permission_name_max_length','2017-12-29 02:02:23.773575'),(7,'auth','0003_alter_user_email_max_length','2017-12-29 02:02:23.950280'),(8,'auth','0004_alter_user_username_opts','2017-12-29 02:02:23.993919'),(9,'auth','0005_alter_user_last_login_null','2017-12-29 02:02:24.111966'),(10,'auth','0006_require_contenttypes_0002','2017-12-29 02:02:24.120966'),(11,'auth','0007_alter_validators_add_error_messages','2017-12-29 02:02:24.137759'),(12,'auth','0008_alter_user_username_max_length','2017-12-29 02:02:24.297630'),(13,'blog','0001_initial','2017-12-29 02:02:25.192845'),(14,'report','0001_initial','2017-12-29 02:02:25.939024'),(15,'sessions','0001_initial','2017-12-29 02:02:26.064583'),(16,'blog','0002_article_click_time','2017-12-29 02:09:29.325231'),(17,'blog','0003_article_created_at','2017-12-29 02:38:00.589108'),(18,'report','0002_auto_20171229_0310','2017-12-29 03:10:18.983911'),(19,'blog','0004_remove_tag_tag_type','2017-12-29 03:12:46.619793'),(20,'report','0003_auto_20171229_0650','2017-12-29 06:50:18.921132'),(21,'auth','0009_alter_user_last_name_max_length','2018-03-25 03:17:30.836036'),(22,'blog','0005_auto_20180325_1117','2018-03-25 03:17:31.017365'),(23,'report','0004_auto_20180325_1117','2018-03-25 03:17:31.397319');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0k44u521f8xvg52ow0p30wwg9iw6n2yo','ZmE4ZDQ4ZTFlZDkyYzRiZDJhMDNmNDQxNzQzMDk5ZGFmNTFmODBiMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ2MWJlN2ZhMDM3NzIxZGU1NmIxN2NjMmU1MDViMzIwYTEzNTMwYmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-03-25 02:34:20.912547'),('67gl2mgis27680nyz3zs26htlyzrnmc2','MmU3ZTQwOWM2MDEyOTExMTJmODU3OGZjZGE4MDVjN2Q5MjdhOWY0Zjp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg0MWY4YzQ1MmVjNDBhZDY5MzU2ZTdhYmExN2FjNmEyMDdkMTVmNWMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-04-08 05:10:44.804718'),('6h22gwosko5fgle033xhepba46brrtq3','ODYwMGZhNzgyMzUzNjE3MGFhY2YyM2U1YmJkYjEyODM4MWVjODJiNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODQxZjhjNDUyZWM0MGFkNjkzNTZlN2FiYTE3YWM2YTIwN2QxNWY1YyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-04-10 16:06:58.967180'),('p78hwlkce7684aynpwwny5h3hrbhku56','OGY4MTUzMDgwOTJhMDViNDkxNWE3Yjc0NTBjZmQyNjc1ZWE0MGVmODp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ2MWJlN2ZhMDM3NzIxZGU1NmIxN2NjMmU1MDViMzIwYTEzNTMwYmUiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2018-03-28 16:52:59.164084'),('q5wcbn01pwneftm27rkwonvjyzzimgmy','ZmE4ZDQ4ZTFlZDkyYzRiZDJhMDNmNDQxNzQzMDk5ZGFmNTFmODBiMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ2MWJlN2ZhMDM3NzIxZGU1NmIxN2NjMmU1MDViMzIwYTEzNTMwYmUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2018-01-12 02:03:38.474430');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_computer`
--

DROP TABLE IF EXISTS `report_computer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_computer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computer_class` varchar(10) NOT NULL,
  `computer_no` varchar(5) NOT NULL,
  `computer_ip` varchar(25) NOT NULL,
  `report_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2497 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_computer`
--

LOCK TABLES `report_computer` WRITE;
/*!40000 ALTER TABLE `report_computer` DISABLE KEYS */;
INSERT INTO `report_computer` VALUES (4,'MB402','2','',11),(5,'MB402','3','',0),(6,'MB402','4','',0),(7,'MB402','5','',0),(8,'MB402','6','',0),(9,'MB402','7','',1),(10,'MB402','8','',0),(11,'MB402','9','',2),(12,'MB402','10','',0),(13,'MB402','11','',0),(14,'MB402','12','',0),(15,'MB402','13','',2),(16,'MB402','14','',0),(17,'MB402','15','',0),(18,'MB402','16','',0),(19,'MB402','17','',2),(20,'MB402','18','',0),(21,'MB402','19','',0),(22,'MB402','20','',2),(23,'MB402','21','',0),(24,'MB402','22','',1),(25,'MB402','23','',0),(26,'MB402','24','',0),(27,'MB402','25','',0),(28,'MB402','26','',0),(29,'MB402','27','',0),(30,'MB402','28','',2),(31,'MB402','29','',1),(32,'MB402','30','',0),(33,'MB402','31','',0),(34,'MB402','32','',1),(35,'MB402','33','',0),(36,'MB402','34','',0),(37,'MB402','35','',1),(38,'MB402','36','',0),(39,'MB402','37','',0),(40,'MB402','38','',0),(41,'MB402','39','',0),(42,'MB402','40','',0),(43,'MB402','41','',0),(44,'MB402','42','',0),(45,'MB402','43','',0),(46,'MB402','44','',0),(47,'MB402','45','',0),(48,'MB402','46','',0),(49,'MB402','47','',0),(50,'MB402','48','',0),(51,'MB402','49','',0),(52,'MB402','50','',0),(53,'MB402','51','',0),(54,'MB402','52','',0),(55,'MB402','53','',0),(56,'MB402','54','',0),(57,'MB402','55','',0),(58,'MB402','56','',0),(59,'MB402','57','',0),(60,'MB402','58','',0),(61,'MB402','59','',0),(62,'MB402','60','',0),(63,'MB402','61','',0),(64,'MB402','62','',0),(65,'MB402','63','',0),(66,'MB402','64','',0),(67,'MB402','65','',0),(68,'MB402','66','',0),(69,'MB402','67','',0),(70,'MB402','68','',0),(71,'MB402','69','',0),(72,'MB402','70','',0),(73,'MB402','71','',0),(74,'MB402','72','',0),(75,'MB402','73','',0),(76,'MB402','74','',0),(77,'MB402','75','',0),(78,'MB402','76','',0),(79,'MB402','77','',0),(80,'MB402','78','',0),(81,'MB402','79','',0),(82,'MB402','80','',0),(83,'MB402','81','',0),(84,'MB402','82','',0),(85,'MB402','83','',0),(86,'MB402','84','',0),(87,'MB402','85','',0),(88,'MB402','86','',0),(89,'MB402','87','',0),(90,'MB402','88','',0),(91,'MB402','89','',0),(92,'MB402','90','',0),(93,'MB402','91','',0),(94,'MB402','92','',0),(95,'MB402','93','',0),(96,'MB402','94','',0),(97,'MB402','95','',0),(98,'MB402','96','',0),(99,'MB402','97','',0),(100,'MB402','98','',0),(101,'MB402','99','',0),(102,'MB402','100','',0),(103,'MB402','101','',0),(104,'MB402','102','',0),(105,'MB403','1','',0),(106,'MB403','2','',0),(107,'MB403','3','',0),(108,'MB403','4','',0),(109,'MB403','5','',0),(110,'MB403','6','',0),(111,'MB403','7','',0),(112,'MB403','8','',0),(113,'MB403','9','',0),(114,'MB403','10','',0),(115,'MB403','11','',0),(116,'MB403','12','',0),(117,'MB403','13','',0),(118,'MB403','14','',0),(119,'MB403','15','',0),(120,'MB403','16','',0),(121,'MB403','17','',0),(122,'MB403','18','',0),(123,'MB403','19','',0),(124,'MB403','20','',0),(125,'MB403','21','',0),(126,'MB403','22','',0),(127,'MB403','23','',0),(128,'MB403','24','',0),(129,'MB403','25','',0),(130,'MB403','26','',0),(131,'MB403','27','',0),(132,'MB403','28','',0),(133,'MB403','29','',0),(134,'MB403','30','',0),(135,'MB403','31','',0),(136,'MB403','32','',0),(137,'MB403','33','',0),(138,'MB403','34','',0),(139,'MB403','35','',0),(140,'MB403','36','',0),(141,'MB403','37','',0),(142,'MB403','38','',0),(143,'MB403','39','',0),(144,'MB403','40','',0),(145,'MB403','41','',0),(146,'MB403','42','',0),(147,'MB403','43','',0),(148,'MB403','44','',0),(149,'MB403','45','',0),(150,'MB403','46','',0),(151,'MB403','47','',0),(152,'MB403','48','',0),(153,'MB403','49','',0),(154,'MB403','50','',0),(155,'MB403','51','',0),(156,'MB403','52','',0),(157,'MB403','53','',0),(158,'MB403','54','',0),(159,'MB403','55','',0),(160,'MB403','56','',0),(161,'MB403','57','',0),(162,'MB403','58','',0),(163,'MB403','59','',0),(164,'MB403','60','',0),(165,'MB403','61','',0),(166,'MB403','62','',0),(167,'MB403','63','',0),(168,'MB403','64','',0),(169,'MB403','65','',0),(170,'MB403','66','',0),(171,'MB403','67','',0),(172,'MB403','68','',0),(173,'MB403','69','',0),(174,'MB403','70','',0),(175,'MB403','71','',0),(176,'MB403','72','',0),(177,'MB403','73','',0),(178,'MB403','74','',0),(179,'MB403','75','',0),(180,'MB403','76','',0),(181,'MB403','77','',0),(182,'MB403','78','',0),(183,'MB403','79','',0),(184,'MB403','80','',0),(185,'MB403','81','',0),(186,'MB403','82','',0),(187,'MB403','83','',0),(188,'MB403','84','',0),(189,'MB403','85','',0),(190,'MB403','86','',0),(191,'MB403','87','',0),(192,'MB403','88','',0),(193,'MB403','89','',0),(194,'MB403','90','',0),(195,'MB403','91','',0),(196,'MB403','92','',0),(197,'MB403','93','',0),(198,'MB403','94','',0),(199,'MB403','95','',0),(200,'MB403','96','',0),(201,'MB403','97','',0),(202,'MB403','98','',0),(203,'MB403','99','',0),(204,'MB403','100','',0),(205,'MB403','101','',0),(206,'MB403','102','',0),(207,'MB404','1','',0),(208,'MB404','2','',0),(209,'MB404','3','',0),(210,'MB404','4','',0),(211,'MB404','5','',0),(212,'MB404','6','',0),(213,'MB404','7','',0),(214,'MB404','8','',0),(215,'MB404','9','',0),(216,'MB404','10','',0),(217,'MB404','11','',0),(218,'MB404','12','',0),(219,'MB404','13','',0),(220,'MB404','14','',0),(221,'MB404','15','',0),(222,'MB404','16','',0),(223,'MB404','17','',0),(224,'MB404','18','',0),(225,'MB404','19','',0),(226,'MB404','20','',0),(227,'MB404','21','',0),(228,'MB404','22','',0),(229,'MB404','23','',0),(230,'MB404','24','',0),(231,'MB404','25','',0),(232,'MB404','26','',0),(233,'MB404','27','',0),(234,'MB404','28','',0),(235,'MB404','29','',0),(236,'MB404','30','',0),(237,'MB404','31','',0),(238,'MB404','32','',0),(239,'MB404','33','',0),(240,'MB404','34','',0),(241,'MB404','35','',0),(242,'MB404','36','',0),(243,'MB404','37','',0),(244,'MB404','38','',0),(245,'MB404','39','',0),(246,'MB404','40','',0),(247,'MB404','41','',0),(248,'MB404','42','',0),(249,'MB404','43','',0),(250,'MB404','44','',0),(251,'MB404','45','',0),(252,'MB404','46','',0),(253,'MB404','47','',0),(254,'MB404','48','',0),(255,'MB404','49','',0),(256,'MB404','50','',0),(257,'MB404','51','',0),(258,'MB404','52','',0),(259,'MB404','53','',0),(260,'MB404','54','',0),(261,'MB404','55','',0),(262,'MB404','56','',0),(263,'MB404','57','',0),(264,'MB404','58','',0),(265,'MB404','59','',0),(266,'MB404','60','',0),(267,'MB404','61','',0),(268,'MB404','62','',0),(269,'MB404','63','',0),(270,'MB404','64','',0),(271,'MB404','65','',0),(272,'MB404','66','',0),(273,'MB404','67','',0),(274,'MB404','68','',0),(275,'MB404','69','',0),(276,'MB404','70','',0),(277,'MB404','71','',0),(278,'MB404','72','',0),(279,'MB404','73','',0),(280,'MB404','74','',0),(281,'MB404','75','',0),(282,'MB404','76','',0),(283,'MB404','77','',0),(284,'MB404','78','',0),(285,'MB404','79','',0),(286,'MB404','80','',0),(287,'MB404','81','',0),(288,'MB404','82','',0),(289,'MB404','83','',0),(290,'MB404','84','',0),(291,'MB404','85','',0),(292,'MB404','86','',0),(293,'MB404','87','',0),(294,'MB404','88','',0),(295,'MB404','89','',0),(296,'MB404','90','',0),(297,'MB404','91','',0),(298,'MB404','92','',0),(299,'MB404','93','',0),(300,'MB404','94','',0),(301,'MB404','95','',0),(302,'MB404','96','',0),(303,'MB404','97','',0),(304,'MB404','98','',0),(305,'MB404','99','',0),(306,'MB404','100','',0),(307,'MB404','101','',0),(308,'MB404','102','',0),(309,'MB405','1','',0),(310,'MB405','2','',0),(311,'MB405','3','',0),(312,'MB405','4','',0),(313,'MB405','5','',0),(314,'MB405','6','',0),(315,'MB405','7','',0),(316,'MB405','8','',0),(317,'MB405','9','',0),(318,'MB405','10','',0),(319,'MB405','11','',0),(320,'MB405','12','',0),(321,'MB405','13','',0),(322,'MB405','14','',0),(323,'MB405','15','',0),(324,'MB405','16','',0),(325,'MB405','17','',0),(326,'MB405','18','',0),(327,'MB405','19','',0),(328,'MB405','20','',0),(329,'MB405','21','',0),(330,'MB405','22','',0),(331,'MB405','23','',0),(332,'MB405','24','',0),(333,'MB405','25','',0),(334,'MB405','26','',0),(335,'MB405','27','',0),(336,'MB405','28','',0),(337,'MB405','29','',0),(338,'MB405','30','',0),(339,'MB405','31','',0),(340,'MB405','32','',0),(341,'MB405','33','',0),(342,'MB405','34','',0),(343,'MB405','35','',0),(344,'MB405','36','',0),(345,'MB405','37','',0),(346,'MB405','38','',0),(347,'MB405','39','',0),(348,'MB405','40','',0),(349,'MB405','41','',0),(350,'MB405','42','',0),(351,'MB405','43','',0),(352,'MB405','44','',0),(353,'MB405','45','',0),(354,'MB405','46','',0),(355,'MB405','47','',0),(356,'MB405','48','',0),(357,'MB405','49','',0),(358,'MB405','50','',0),(359,'MB405','51','',0),(360,'MB405','52','',0),(361,'MB405','53','',0),(362,'MB405','54','',0),(363,'MB405','55','',0),(364,'MB405','56','',0),(365,'MB405','57','',0),(366,'MB405','58','',0),(367,'MB405','59','',0),(368,'MB405','60','',0),(369,'MB405','61','',0),(370,'MB405','62','',0),(371,'MB405','63','',0),(372,'MB405','64','',0),(373,'MB405','65','',0),(374,'MB405','66','',0),(375,'MB405','67','',0),(376,'MB405','68','',0),(377,'MB405','69','',0),(378,'MB405','70','',0),(379,'MB405','71','',0),(380,'MB405','72','',0),(381,'MB405','73','',0),(382,'MB405','74','',0),(383,'MB405','75','',0),(384,'MB405','76','',0),(385,'MB405','77','',0),(386,'MB405','78','',0),(387,'MB405','79','',0),(388,'MB405','80','',0),(389,'MB405','81','',0),(390,'MB405','82','',0),(391,'MB405','83','',0),(392,'MB405','84','',0),(393,'MB405','85','',0),(394,'MB405','86','',0),(395,'MB405','87','',0),(396,'MB405','88','',0),(397,'MB405','89','',0),(398,'MB405','90','',0),(399,'MB405','91','',0),(400,'MB405','92','',0),(401,'MB405','93','',0),(402,'MB405','94','',0),(403,'MB405','95','',0),(404,'MB405','96','',0),(405,'MB405','97','',0),(406,'MB405','98','',0),(407,'MB405','99','',0),(408,'MB405','100','',0),(409,'MB405','101','',0),(410,'MB405','102','',0),(411,'MB406','1','',0),(412,'MB406','2','',0),(413,'MB406','3','',0),(414,'MB406','4','',0),(415,'MB406','5','',0),(416,'MB406','6','',0),(417,'MB406','7','',0),(418,'MB406','8','',0),(419,'MB406','9','',0),(420,'MB406','10','',0),(421,'MB406','11','',1),(422,'MB406','12','',0),(423,'MB406','13','',0),(424,'MB406','14','',0),(425,'MB406','15','',0),(426,'MB406','16','',0),(427,'MB406','17','',0),(428,'MB406','18','',0),(429,'MB406','19','',0),(430,'MB406','20','',0),(431,'MB406','21','',0),(432,'MB406','22','',0),(433,'MB406','23','',0),(434,'MB406','24','',0),(435,'MB406','25','',0),(436,'MB406','26','',0),(437,'MB406','27','',0),(438,'MB406','28','',0),(439,'MB406','29','',0),(440,'MB406','30','',0),(441,'MB406','31','',0),(442,'MB406','32','',0),(443,'MB406','33','',0),(444,'MB406','34','',0),(445,'MB406','35','',0),(446,'MB406','36','',0),(447,'MB406','37','',0),(448,'MB406','38','',0),(449,'MB406','39','',0),(450,'MB406','40','',0),(451,'MB406','41','',0),(452,'MB406','42','',0),(453,'MB406','43','',0),(454,'MB406','44','',0),(455,'MB406','45','',0),(456,'MB406','46','',0),(457,'MB406','47','',0),(458,'MB406','48','',0),(459,'MB406','49','',0),(460,'MB406','50','',0),(461,'MB406','51','',0),(462,'MB406','52','',0),(463,'MB406','53','',0),(464,'MB406','54','',0),(465,'MB406','55','',0),(466,'MB406','56','',0),(467,'MB406','57','',0),(468,'MB406','58','',0),(469,'MB406','59','',0),(470,'MB406','60','',0),(471,'MB406','61','',0),(472,'MB406','62','',0),(473,'MB406','63','',0),(474,'MB406','64','',0),(475,'MB406','65','',0),(476,'MB406','66','',0),(477,'MB406','67','',0),(478,'MB406','68','',0),(479,'MB406','69','',0),(480,'MB406','70','',0),(481,'MB406','71','',0),(482,'MB406','72','',0),(483,'MB406','73','',0),(484,'MB406','74','',0),(485,'MB406','75','',0),(486,'MB406','76','',0),(487,'MB406','77','',0),(488,'MB406','78','',0),(489,'MB406','79','',0),(490,'MB406','80','',0),(491,'MB406','81','',0),(492,'MB406','82','',0),(493,'MB406','83','',0),(494,'MB406','84','',0),(495,'MB406','85','',0),(496,'MB406','86','',0),(497,'MB406','87','',0),(498,'MB406','88','',0),(499,'MB406','89','',0),(500,'MB406','90','',0),(501,'MB406','91','',0),(502,'MB406','92','',0),(503,'MB406','93','',0),(504,'MB406','94','',0),(505,'MB406','95','',0),(506,'MB406','96','',0),(507,'MB406','97','',0),(508,'MB406','98','',0),(509,'MB406','99','',0),(510,'MB406','100','',0),(511,'MB406','101','',0),(512,'MB406','102','',0),(513,'MB502','1','',0),(514,'MB502','2','',0),(515,'MB502','3','',0),(516,'MB502','4','',0),(517,'MB502','5','',0),(518,'MB502','6','',0),(519,'MB502','7','',0),(520,'MB502','8','',0),(521,'MB502','9','',0),(522,'MB502','10','',0),(523,'MB502','11','',0),(524,'MB502','12','',0),(525,'MB502','13','',0),(526,'MB502','14','',0),(527,'MB502','15','',0),(528,'MB502','16','',0),(529,'MB502','17','',0),(530,'MB502','18','',0),(531,'MB502','19','',0),(532,'MB502','20','',0),(533,'MB502','21','',0),(534,'MB502','22','',0),(535,'MB502','23','',0),(536,'MB502','24','',0),(537,'MB502','25','',0),(538,'MB502','26','',0),(539,'MB502','27','',0),(540,'MB502','28','',0),(541,'MB502','29','',0),(542,'MB502','30','',0),(543,'MB502','31','',0),(544,'MB502','32','',0),(545,'MB502','33','',0),(546,'MB502','34','',0),(547,'MB502','35','',0),(548,'MB502','36','',0),(549,'MB502','37','',0),(550,'MB502','38','',0),(551,'MB502','39','',0),(552,'MB502','40','',0),(553,'MB502','41','',0),(554,'MB502','42','',0),(555,'MB502','43','',0),(556,'MB502','44','',0),(557,'MB502','45','',0),(558,'MB502','46','',0),(559,'MB502','47','',0),(560,'MB502','48','',0),(561,'MB502','49','',0),(562,'MB502','50','',0),(563,'MB502','51','',0),(564,'MB502','52','',0),(565,'MB502','53','',0),(566,'MB502','54','',0),(567,'MB502','55','',0),(568,'MB502','56','',0),(569,'MB502','57','',0),(570,'MB502','58','',0),(571,'MB502','59','',0),(572,'MB502','60','',0),(573,'MB502','61','',0),(574,'MB502','62','',0),(575,'MB502','63','',0),(576,'MB502','64','',0),(577,'MB502','65','',0),(578,'MB502','66','',0),(579,'MB502','67','',0),(580,'MB502','68','',0),(581,'MB502','69','',0),(582,'MB502','70','',0),(583,'MB502','71','',0),(584,'MB502','72','',0),(585,'MB502','73','',0),(586,'MB502','74','',0),(587,'MB502','75','',0),(588,'MB502','76','',0),(589,'MB502','77','',0),(590,'MB502','78','',0),(591,'MB502','79','',0),(592,'MB502','80','',0),(593,'MB502','81','',0),(594,'MB502','82','',0),(595,'MB502','83','',0),(596,'MB502','84','',0),(597,'MB502','85','',0),(598,'MB502','86','',0),(599,'MB502','87','',0),(600,'MB502','88','',0),(601,'MB502','89','',0),(602,'MB502','90','',0),(603,'MB502','91','',0),(604,'MB502','92','',0),(605,'MB502','93','',0),(606,'MB502','94','',0),(607,'MB502','95','',0),(608,'MB502','96','',0),(609,'MB503','1','',0),(610,'MB503','2','',0),(611,'MB503','3','',0),(612,'MB503','4','',0),(613,'MB503','5','',0),(614,'MB503','6','',0),(615,'MB503','7','',0),(616,'MB503','8','',0),(617,'MB503','9','',0),(618,'MB503','10','',0),(619,'MB503','11','',0),(620,'MB503','12','',0),(621,'MB503','13','',0),(622,'MB503','14','',0),(623,'MB503','15','',0),(624,'MB503','16','',0),(625,'MB503','17','',0),(626,'MB503','18','',0),(627,'MB503','19','',0),(628,'MB503','20','',0),(629,'MB503','21','',0),(630,'MB503','22','',0),(631,'MB503','23','',0),(632,'MB503','24','',0),(633,'MB503','25','',0),(634,'MB503','26','',0),(635,'MB503','27','',0),(636,'MB503','28','',0),(637,'MB503','29','',0),(638,'MB503','30','',0),(639,'MB503','31','',0),(640,'MB503','32','',0),(641,'MB503','33','',0),(642,'MB503','34','',0),(643,'MB503','35','',0),(644,'MB503','36','',0),(645,'MB503','37','',0),(646,'MB503','38','',0),(647,'MB503','39','',0),(648,'MB503','40','',0),(649,'MB503','41','',0),(650,'MB503','42','',0),(651,'MB503','43','',0),(652,'MB503','44','',0),(653,'MB503','45','',0),(654,'MB503','46','',0),(655,'MB503','47','',0),(656,'MB503','48','',0),(657,'MB503','49','',0),(658,'MB503','50','',0),(659,'MB503','51','',0),(660,'MB503','52','',0),(661,'MB503','53','',0),(662,'MB503','54','',0),(663,'MB503','55','',0),(664,'MB503','56','',0),(665,'MB503','57','',0),(666,'MB503','58','',0),(667,'MB503','59','',0),(668,'MB503','60','',0),(669,'MB503','61','',0),(670,'MB503','62','',0),(671,'MB503','63','',0),(672,'MB503','64','',0),(673,'MB503','65','',0),(674,'MB503','66','',0),(675,'MB503','67','',0),(676,'MB503','68','',0),(677,'MB503','69','',0),(678,'MB503','70','',0),(679,'MB503','71','',0),(680,'MB503','72','',0),(681,'MB503','73','',0),(682,'MB503','74','',0),(683,'MB503','75','',0),(684,'MB503','76','',0),(685,'MB503','77','',0),(686,'MB503','78','',0),(687,'MB503','79','',0),(688,'MB503','80','',0),(689,'MB503','81','',0),(690,'MB503','82','',0),(691,'MB503','83','',0),(692,'MB503','84','',0),(693,'MB503','85','',0),(694,'MB503','86','',0),(695,'MB503','87','',0),(696,'MB503','88','',0),(697,'MB503','89','',0),(698,'MB503','90','',0),(699,'MB503','91','',0),(700,'MB503','92','',0),(701,'MB503','93','',0),(702,'MB503','94','',0),(703,'MB503','95','',0),(704,'MB503','96','',0),(705,'MB504','1','',0),(706,'MB504','2','',0),(707,'MB504','3','',0),(708,'MB504','4','',0),(709,'MB504','5','',0),(710,'MB504','6','',0),(711,'MB504','7','',0),(712,'MB504','8','',0),(713,'MB504','9','',0),(714,'MB504','10','',0),(715,'MB504','11','',0),(716,'MB504','12','',0),(717,'MB504','13','',0),(718,'MB504','14','',0),(719,'MB504','15','',0),(720,'MB504','16','',0),(721,'MB504','17','',0),(722,'MB504','18','',0),(723,'MB504','19','',0),(724,'MB504','20','',0),(725,'MB504','21','',0),(726,'MB504','22','',0),(727,'MB504','23','',0),(728,'MB504','24','',0),(729,'MB504','25','',0),(730,'MB504','26','',0),(731,'MB504','27','',0),(732,'MB504','28','',0),(733,'MB504','29','',0),(734,'MB504','30','',0),(735,'MB504','31','',0),(736,'MB504','32','',0),(737,'MB504','33','',0),(738,'MB504','34','',0),(739,'MB504','35','',0),(740,'MB504','36','',0),(741,'MB504','37','',0),(742,'MB504','38','',0),(743,'MB504','39','',0),(744,'MB504','40','',0),(745,'MB504','41','',0),(746,'MB504','42','',0),(747,'MB504','43','',0),(748,'MB504','44','',0),(749,'MB504','45','',0),(750,'MB504','46','',0),(751,'MB504','47','',0),(752,'MB504','48','',0),(753,'MB504','49','',0),(754,'MB504','50','',0),(755,'MB504','51','',0),(756,'MB504','52','',0),(757,'MB504','53','',0),(758,'MB504','54','',0),(759,'MB504','55','',0),(760,'MB504','56','',0),(761,'MB504','57','',0),(762,'MB504','58','',0),(763,'MB504','59','',0),(764,'MB504','60','',0),(765,'MB504','61','',0),(766,'MB504','62','',0),(767,'MB504','63','',0),(768,'MB504','64','',0),(769,'MB504','65','',0),(770,'MB504','66','',0),(771,'MB504','67','',0),(772,'MB504','68','',0),(773,'MB504','69','',0),(774,'MB504','70','',0),(775,'MB504','71','',0),(776,'MB504','72','',0),(777,'MB504','73','',0),(778,'MB504','74','',0),(779,'MB504','75','',0),(780,'MB504','76','',0),(781,'MB504','77','',0),(782,'MB504','78','',0),(783,'MB504','79','',0),(784,'MB504','80','',0),(785,'MB504','81','',0),(786,'MB504','82','',0),(787,'MB504','83','',0),(788,'MB504','84','',0),(789,'MB504','85','',0),(790,'MB504','86','',0),(791,'MB504','87','',0),(792,'MB504','88','',0),(793,'MB504','89','',0),(794,'MB504','90','',0),(795,'MB504','91','',0),(796,'MB504','92','',0),(797,'MB504','93','',0),(798,'MB504','94','',0),(799,'MB504','95','',0),(800,'MB504','96','',0),(801,'MB505','1','',0),(802,'MB505','2','',0),(803,'MB505','3','',0),(804,'MB505','4','',0),(805,'MB505','5','',0),(806,'MB505','6','',0),(807,'MB505','7','',0),(808,'MB505','8','',0),(809,'MB505','9','',0),(810,'MB505','10','',0),(811,'MB505','11','',0),(812,'MB505','12','',0),(813,'MB505','13','',0),(814,'MB505','14','',0),(815,'MB505','15','',0),(816,'MB505','16','',0),(817,'MB505','17','',0),(818,'MB505','18','',0),(819,'MB505','19','',0),(820,'MB505','20','',0),(821,'MB505','21','',0),(822,'MB505','22','',0),(823,'MB505','23','',0),(824,'MB505','24','',0),(825,'MB505','25','',0),(826,'MB505','26','',0),(827,'MB505','27','',0),(828,'MB505','28','',0),(829,'MB505','29','',0),(830,'MB505','30','',0),(831,'MB505','31','',0),(832,'MB505','32','',0),(833,'MB505','33','',0),(834,'MB505','34','',0),(835,'MB505','35','',0),(836,'MB505','36','',0),(837,'MB505','37','',0),(838,'MB505','38','',0),(839,'MB505','39','',0),(840,'MB505','40','',0),(841,'MB505','41','',0),(842,'MB505','42','',0),(843,'MB505','43','',0),(844,'MB505','44','',0),(845,'MB505','45','',0),(846,'MB505','46','',0),(847,'MB505','47','',0),(848,'MB505','48','',0),(849,'MB505','49','',0),(850,'MB505','50','',0),(851,'MB505','51','',0),(852,'MB505','52','',0),(853,'MB505','53','',0),(854,'MB505','54','',0),(855,'MB505','55','',0),(856,'MB505','56','',0),(857,'MB505','57','',0),(858,'MB505','58','',0),(859,'MB505','59','',0),(860,'MB505','60','',0),(861,'MB505','61','',0),(862,'MB505','62','',0),(863,'MB505','63','',0),(864,'MB505','64','',0),(865,'MB505','65','',0),(866,'MB505','66','',0),(867,'MB505','67','',0),(868,'MB505','68','',0),(869,'MB505','69','',0),(870,'MB505','70','',0),(871,'MB505','71','',0),(872,'MB505','72','',0),(873,'MB505','73','',0),(874,'MB505','74','',0),(875,'MB505','75','',0),(876,'MB505','76','',0),(877,'MB505','77','',0),(878,'MB505','78','',0),(879,'MB505','79','',0),(880,'MB505','80','',0),(881,'MB505','81','',0),(882,'MB505','82','',0),(883,'MB505','83','',0),(884,'MB505','84','',0),(885,'MB505','85','',0),(886,'MB505','86','',0),(887,'MB505','87','',0),(888,'MB505','88','',0),(889,'MB505','89','',0),(890,'MB505','90','',0),(891,'MB505','91','',0),(892,'MB505','92','',0),(893,'MB505','93','',0),(894,'MB505','94','',0),(895,'MB505','95','',0),(896,'MB505','96','',0),(897,'MB506','1','',0),(898,'MB506','2','',0),(899,'MB506','3','',0),(900,'MB506','4','',0),(901,'MB506','5','',0),(902,'MB506','6','',0),(903,'MB506','7','',0),(904,'MB506','8','',0),(905,'MB506','9','',0),(906,'MB506','10','',0),(907,'MB506','11','',0),(908,'MB506','12','',0),(909,'MB506','13','',0),(910,'MB506','14','',0),(911,'MB506','15','',0),(912,'MB506','16','',0),(913,'MB506','17','',0),(914,'MB506','18','',0),(915,'MB506','19','',0),(916,'MB506','20','',0),(917,'MB506','21','',0),(918,'MB506','22','',0),(919,'MB506','23','',0),(920,'MB506','24','',0),(921,'MB506','25','',0),(922,'MB506','26','',0),(923,'MB506','27','',0),(924,'MB506','28','',0),(925,'MB506','29','',0),(926,'MB506','30','',0),(927,'MB506','31','',0),(928,'MB506','32','',0),(929,'MB506','33','',0),(930,'MB506','34','',0),(931,'MB506','35','',0),(932,'MB506','36','',0),(933,'MB506','37','',0),(934,'MB506','38','',0),(935,'MB506','39','',0),(936,'MB506','40','',0),(937,'MB506','41','',0),(938,'MB506','42','',0),(939,'MB506','43','',0),(940,'MB506','44','',0),(941,'MB506','45','',0),(942,'MB506','46','',0),(943,'MB506','47','',0),(944,'MB506','48','',0),(945,'MB506','49','',0),(946,'MB506','50','',0),(947,'MB506','51','',0),(948,'MB506','52','',0),(949,'MB506','53','',0),(950,'MB506','54','',0),(951,'MB506','55','',0),(952,'MB506','56','',0),(953,'MB506','57','',0),(954,'MB506','58','',0),(955,'MB506','59','',0),(956,'MB506','60','',0),(957,'MB506','61','',0),(958,'MB506','62','',0),(959,'MB506','63','',0),(960,'MB506','64','',0),(961,'MB506','65','',0),(962,'MB506','66','',0),(963,'MB506','67','',0),(964,'MB506','68','',0),(965,'MB506','69','',0),(966,'MB506','70','',0),(967,'MB506','71','',0),(968,'MB506','72','',0),(969,'MB506','73','',0),(970,'MB506','74','',0),(971,'MB506','75','',0),(972,'MB506','76','',0),(973,'MB506','77','',0),(974,'MB506','78','',0),(975,'MB506','79','',0),(976,'MB506','80','',0),(977,'MB506','81','',0),(978,'MB506','82','',0),(979,'MB506','83','',0),(980,'MB506','84','',0),(981,'MB506','85','',0),(982,'MB506','86','',0),(983,'MB506','87','',0),(984,'MB506','88','',0),(985,'MB506','89','',0),(986,'MB506','90','',0),(987,'MB506','91','',0),(988,'MB506','92','',0),(989,'MB506','93','',0),(990,'MB506','94','',0),(991,'MB506','95','',0),(992,'MB506','96','',0),(993,'MD501','1','',0),(994,'MD501','2','',0),(995,'MD501','3','',0),(996,'MD501','4','',0),(997,'MD501','5','',0),(998,'MD501','6','',0),(999,'MD501','7','',0),(1000,'MD501','8','',0),(1001,'MD501','9','',0),(1002,'MD501','10','',0),(1003,'MD501','11','',0),(1004,'MD501','12','',0),(1005,'MD501','13','',0),(1006,'MD501','14','',0),(1007,'MD501','15','',0),(1008,'MD501','16','',0),(1009,'MD501','17','',0),(1010,'MD501','18','',0),(1011,'MD501','19','',0),(1012,'MD501','20','',0),(1013,'MD501','21','',0),(1014,'MD501','22','',0),(1015,'MD501','23','',0),(1016,'MD501','24','',0),(1017,'MD501','25','',0),(1018,'MD501','26','',0),(1019,'MD501','27','',0),(1020,'MD501','28','',0),(1021,'MD501','29','',0),(1022,'MD501','30','',0),(1023,'MD501','31','',0),(1024,'MD501','32','',0),(1025,'MD501','33','',0),(1026,'MD501','34','',0),(1027,'MD501','35','',0),(1028,'MD501','36','',0),(1029,'MD501','37','',0),(1030,'MD501','38','',0),(1031,'MD501','39','',0),(1032,'MD501','40','',0),(1033,'MD501','41','',0),(1034,'MD501','42','',0),(1035,'MD501','43','',0),(1036,'MD501','44','',0),(1037,'MD501','45','',0),(1038,'MD501','46','',0),(1039,'MD501','47','',0),(1040,'MD501','48','',0),(1041,'MD501','49','',0),(1042,'MD501','50','',0),(1043,'MD501','51','',0),(1044,'MD501','52','',0),(1045,'MD501','53','',0),(1046,'MD501','54','',0),(1047,'MD501','55','',0),(1048,'MD501','56','',0),(1049,'MD501','57','',0),(1050,'MD501','58','',0),(1051,'MD501','59','',0),(1052,'MD501','60','',0),(1053,'MD501','61','',0),(1054,'MD501','62','',0),(1055,'MD501','63','',0),(1056,'MD501','64','',0),(1057,'MD501','65','',0),(1058,'MD501','66','',0),(1059,'MD501','67','',0),(1060,'MD501','68','',0),(1061,'MD501','69','',0),(1062,'MD501','70','',0),(1063,'MD501','71','',0),(1064,'MD501','72','',0),(1065,'MD501','73','',0),(1066,'MD501','74','',0),(1067,'MD501','75','',0),(1068,'MD501','76','',0),(1069,'MD501','77','',0),(1070,'MD501','78','',0),(1071,'MD501','79','',0),(1072,'MD501','80','',0),(1073,'MD501','81','',0),(1074,'MD501','82','',0),(1075,'MD501','83','',0),(1076,'MD501','84','',0),(1077,'MD501','85','',0),(1078,'MD501','86','',0),(1079,'MD501','87','',0),(1080,'MD501','88','',0),(1081,'MD501','89','',0),(1082,'MD501','90','',0),(1083,'MD501','91','',0),(1084,'MD501','92','',0),(1085,'MD501','93','',0),(1086,'MD501','94','',0),(1087,'MD501','95','',0),(1088,'MD501','96','',0),(1089,'MD502','1','',0),(1090,'MD502','2','',0),(1091,'MD502','3','',0),(1092,'MD502','4','',0),(1093,'MD502','5','',0),(1094,'MD502','6','',0),(1095,'MD502','7','',0),(1096,'MD502','8','',0),(1097,'MD502','9','',0),(1098,'MD502','10','',0),(1099,'MD502','11','',0),(1100,'MD502','12','',0),(1101,'MD502','13','',0),(1102,'MD502','14','',0),(1103,'MD502','15','',0),(1104,'MD502','16','',0),(1105,'MD502','17','',0),(1106,'MD502','18','',0),(1107,'MD502','19','',0),(1108,'MD502','20','',0),(1109,'MD502','21','',0),(1110,'MD502','22','',0),(1111,'MD502','23','',0),(1112,'MD502','24','',0),(1113,'MD502','25','',0),(1114,'MD502','26','',0),(1115,'MD502','27','',0),(1116,'MD502','28','',0),(1117,'MD502','29','',0),(1118,'MD502','30','',0),(1119,'MD502','31','',0),(1120,'MD502','32','',0),(1121,'MD502','33','',0),(1122,'MD502','34','',0),(1123,'MD502','35','',0),(1124,'MD502','36','',0),(1125,'MD502','37','',0),(1126,'MD502','38','',0),(1127,'MD502','39','',0),(1128,'MD502','40','',0),(1129,'MD502','41','',0),(1130,'MD502','42','',0),(1131,'MD502','43','',0),(1132,'MD502','44','',0),(1133,'MD502','45','',0),(1134,'MD502','46','',0),(1135,'MD502','47','',0),(1136,'MD502','48','',0),(1137,'MD502','49','',0),(1138,'MD502','50','',0),(1139,'MD502','51','',0),(1140,'MD502','52','',0),(1141,'MD502','53','',0),(1142,'MD502','54','',0),(1143,'MD502','55','',0),(1144,'MD502','56','',0),(1145,'MD502','57','',0),(1146,'MD502','58','',0),(1147,'MD502','59','',0),(1148,'MD502','60','',0),(1149,'MD502','61','',0),(1150,'MD502','62','',0),(1151,'MD502','63','',0),(1152,'MD502','64','',0),(1153,'MD502','65','',0),(1154,'MD502','66','',0),(1155,'MD502','67','',0),(1156,'MD502','68','',0),(1157,'MD502','69','',0),(1158,'MD502','70','',0),(1159,'MD502','71','',0),(1160,'MD502','72','',0),(1161,'MD502','73','',0),(1162,'MD502','74','',0),(1163,'MD502','75','',0),(1164,'MD502','76','',0),(1165,'MD502','77','',0),(1166,'MD502','78','',0),(1167,'MD502','79','',0),(1168,'MD502','80','',0),(1169,'MD502','81','',0),(1170,'MD502','82','',0),(1171,'MD502','83','',0),(1172,'MD502','84','',0),(1173,'MD502','85','',0),(1174,'MD502','86','',0),(1175,'MD502','87','',0),(1176,'MD502','88','',0),(1177,'MD502','89','',0),(1178,'MD502','90','',0),(1179,'MD502','91','',0),(1180,'MD502','92','',0),(1181,'MD502','93','',0),(1182,'MD502','94','',0),(1183,'MD502','95','',0),(1184,'MD502','96','',0),(1185,'MD503','1','',0),(1186,'MD503','2','',0),(1187,'MD503','3','',0),(1188,'MD503','4','',0),(1189,'MD503','5','',0),(1190,'MD503','6','',0),(1191,'MD503','7','',0),(1192,'MD503','8','',0),(1193,'MD503','9','',0),(1194,'MD503','10','',0),(1195,'MD503','11','',0),(1196,'MD503','12','',0),(1197,'MD503','13','',0),(1198,'MD503','14','',0),(1199,'MD503','15','',0),(1200,'MD503','16','',0),(1201,'MD503','17','',0),(1202,'MD503','18','',0),(1203,'MD503','19','',0),(1204,'MD503','20','',0),(1205,'MD503','21','',0),(1206,'MD503','22','',0),(1207,'MD503','23','',0),(1208,'MD503','24','',0),(1209,'MD503','25','',0),(1210,'MD503','26','',0),(1211,'MD503','27','',0),(1212,'MD503','28','',0),(1213,'MD503','29','',0),(1214,'MD503','30','',0),(1215,'MD503','31','',0),(1216,'MD503','32','',0),(1217,'MD503','33','',0),(1218,'MD503','34','',0),(1219,'MD503','35','',0),(1220,'MD503','36','',0),(1221,'MD503','37','',0),(1222,'MD503','38','',0),(1223,'MD503','39','',0),(1224,'MD503','40','',0),(1225,'MD503','41','',0),(1226,'MD503','42','',0),(1227,'MD503','43','',0),(1228,'MD503','44','',0),(1229,'MD503','45','',0),(1230,'MD503','46','',0),(1231,'MD503','47','',0),(1232,'MD503','48','',0),(1233,'MD503','49','',0),(1234,'MD503','50','',0),(1235,'MD503','51','',0),(1236,'MD503','52','',0),(1237,'MD503','53','',0),(1238,'MD503','54','',0),(1239,'MD503','55','',0),(1240,'MD504','1','',0),(1241,'MD504','2','',0),(1242,'MD504','3','',0),(1243,'MD504','4','',0),(1244,'MD504','5','',0),(1245,'MD504','6','',0),(1246,'MD504','7','',0),(1247,'MD504','8','',0),(1248,'MD504','9','',0),(1249,'MD504','10','',0),(1250,'MD504','11','',0),(1251,'MD504','12','',0),(1252,'MD504','13','',0),(1253,'MD504','14','',0),(1254,'MD504','15','',0),(1255,'MD504','16','',0),(1256,'MD504','17','',0),(1257,'MD504','18','',0),(1258,'MD504','19','',0),(1259,'MD504','20','',0),(1260,'MD504','21','',0),(1261,'MD504','22','',0),(1262,'MD504','23','',0),(1263,'MD504','24','',0),(1264,'MD504','25','',0),(1265,'MD504','26','',0),(1266,'MD504','27','',0),(1267,'MD504','28','',0),(1268,'MD504','29','',0),(1269,'MD504','30','',0),(1270,'MD504','31','',0),(1271,'MD504','32','',0),(1272,'MD504','33','',0),(1273,'MD504','34','',0),(1274,'MD504','35','',0),(1275,'MD504','36','',0),(1276,'MD504','37','',0),(1277,'MD504','38','',0),(1278,'MD504','39','',0),(1279,'MD504','40','',0),(1280,'MD504','41','',0),(1281,'MD504','42','',0),(1282,'MD504','43','',0),(1283,'MD504','44','',0),(1284,'MD504','45','',0),(1285,'MD504','46','',0),(1286,'MD504','47','',0),(1287,'MD504','48','',0),(1288,'MD504','49','',0),(1289,'MD504','50','',0),(1290,'MD504','51','',0),(1291,'MD504','52','',0),(1292,'MD504','53','',0),(1293,'MD504','54','',0),(1294,'MD504','55','',0),(1295,'MD505','1','',0),(1296,'MD505','2','',0),(1297,'MD505','3','',0),(1298,'MD505','4','',0),(1299,'MD505','5','',0),(1300,'MD505','6','',0),(1301,'MD505','7','',0),(1302,'MD505','8','',0),(1303,'MD505','9','',0),(1304,'MD505','10','',0),(1305,'MD505','11','',0),(1306,'MD505','12','',0),(1307,'MD505','13','',0),(1308,'MD505','14','',0),(1309,'MD505','15','',0),(1310,'MD505','16','',0),(1311,'MD505','17','',0),(1312,'MD505','18','',0),(1313,'MD505','19','',0),(1314,'MD505','20','',0),(1315,'MD505','21','',0),(1316,'MD505','22','',0),(1317,'MD505','23','',0),(1318,'MD505','24','',0),(1319,'MD505','25','',0),(1320,'MD505','26','',0),(1321,'MD505','27','',0),(1322,'MD505','28','',0),(1323,'MD505','29','',0),(1324,'MD505','30','',0),(1325,'MD505','31','',0),(1326,'MD505','32','',0),(1327,'MD505','33','',0),(1328,'MD505','34','',0),(1329,'MD505','35','',0),(1330,'MD505','36','',0),(1331,'MD505','37','',0),(1332,'MD505','38','',0),(1333,'MD505','39','',0),(1334,'MD505','40','',0),(1335,'MD505','41','',0),(1336,'MD505','42','',0),(1337,'MD505','43','',0),(1338,'MD505','44','',0),(1339,'MD505','45','',0),(1340,'MD505','46','',0),(1341,'MD505','47','',0),(1342,'MD505','48','',0),(1343,'MD505','49','',0),(1344,'MD505','50','',0),(1345,'MD505','51','',0),(1346,'MD505','52','',0),(1347,'MD505','53','',0),(1348,'MD505','54','',0),(1349,'MD505','55','',0),(1350,'MD506','1','',0),(1351,'MD506','2','',0),(1352,'MD506','3','',0),(1353,'MD506','4','',0),(1354,'MD506','5','',0),(1355,'MD506','6','',0),(1356,'MD506','7','',0),(1357,'MD506','8','',0),(1358,'MD506','9','',0),(1359,'MD506','10','',0),(1360,'MD506','11','',0),(1361,'MD506','12','',0),(1362,'MD506','13','',0),(1363,'MD506','14','',0),(1364,'MD506','15','',0),(1365,'MD506','16','',0),(1366,'MD506','17','',0),(1367,'MD506','18','',0),(1368,'MD506','19','',0),(1369,'MD506','20','',0),(1370,'MD506','21','',0),(1371,'MD506','22','',0),(1372,'MD506','23','',0),(1373,'MD506','24','',0),(1374,'MD506','25','',0),(1375,'MD506','26','',0),(1376,'MD506','27','',0),(1377,'MD506','28','',0),(1378,'MD506','29','',0),(1379,'MD506','30','',0),(1380,'MD506','31','',0),(1381,'MD506','32','',0),(1382,'MD506','33','',0),(1383,'MD506','34','',0),(1384,'MD506','35','',0),(1385,'MD506','36','',0),(1386,'MD506','37','',0),(1387,'MD506','38','',0),(1388,'MD506','39','',0),(1389,'MD506','40','',0),(1390,'MD506','41','',0),(1391,'MD506','42','',0),(1392,'MD506','43','',0),(1393,'MD506','44','',0),(1394,'MD506','45','',0),(1395,'MD506','46','',0),(1396,'MD506','47','',0),(1397,'MD506','48','',0),(1398,'MD506','49','',0),(1399,'MD506','50','',0),(1400,'MD506','51','',0),(1401,'MD506','52','',0),(1402,'MD506','53','',0),(1403,'MD506','54','',0),(1404,'MD506','55','',0),(1405,'MA301','1','',0),(1406,'MA301','2','',0),(1407,'MA301','3','',0),(1408,'MA301','4','',0),(1409,'MA301','5','',0),(1410,'MA301','6','',0),(1411,'MA301','7','',0),(1412,'MA301','8','',0),(1413,'MA301','9','',0),(1414,'MA301','10','',0),(1415,'MA301','11','',0),(1416,'MA301','12','',0),(1417,'MA301','13','',0),(1418,'MA301','14','',0),(1419,'MA301','15','',0),(1420,'MA301','16','',0),(1421,'MA301','17','',0),(1422,'MA301','18','',0),(1423,'MA301','19','',0),(1424,'MA301','20','',0),(1425,'MA301','21','',0),(1426,'MA301','22','',0),(1427,'MA301','23','',0),(1428,'MA301','24','',0),(1429,'MA301','25','',0),(1430,'MA301','26','',0),(1431,'MA301','27','',0),(1432,'MA301','28','',0),(1433,'MA301','29','',0),(1434,'MA301','30','',0),(1435,'MA301','31','',0),(1436,'MA301','32','',0),(1437,'MA301','33','',0),(1438,'MA301','34','',0),(1439,'MA301','35','',0),(1440,'MA301','36','',0),(1441,'MA301','37','',0),(1442,'MA301','38','',0),(1443,'MA301','39','',0),(1444,'MA301','40','',0),(1445,'MA301','41','',0),(1446,'MA301','42','',0),(1447,'MA301','43','',0),(1448,'MA301','44','',0),(1449,'MA301','45','',0),(1450,'MA301','46','',0),(1451,'MA301','47','',0),(1452,'MA301','48','',0),(1453,'MA301','49','',0),(1454,'MA301','50','',0),(1455,'MA301','51','',0),(1456,'MA301','52','',0),(1457,'MA301','53','',0),(1458,'MA301','54','',0),(1459,'MA301','55','',0),(1460,'MA302','1','',0),(1461,'MA302','2','',0),(1462,'MA302','3','',0),(1463,'MA302','4','',0),(1464,'MA302','5','',0),(1465,'MA302','6','',0),(1466,'MA302','7','',0),(1467,'MA302','8','',0),(1468,'MA302','9','',0),(1469,'MA302','10','',0),(1470,'MA302','11','',0),(1471,'MA302','12','',0),(1472,'MA302','13','',0),(1473,'MA302','14','',0),(1474,'MA302','15','',0),(1475,'MA302','16','',0),(1476,'MA302','17','',0),(1477,'MA302','18','',0),(1478,'MA302','19','',0),(1479,'MA302','20','',0),(1480,'MA302','21','',0),(1481,'MA302','22','',0),(1482,'MA302','23','',0),(1483,'MA302','24','',0),(1484,'MA302','25','',0),(1485,'MA302','26','',0),(1486,'MA302','27','',0),(1487,'MA302','28','',0),(1488,'MA302','29','',0),(1489,'MA302','30','',0),(1490,'MA302','31','',0),(1491,'MA302','32','',0),(1492,'MA302','33','',0),(1493,'MA302','34','',0),(1494,'MA302','35','',0),(1495,'MA302','36','',0),(1496,'MA302','37','',0),(1497,'MA302','38','',0),(1498,'MA302','39','',0),(1499,'MA302','40','',0),(1500,'MA302','41','',0),(1501,'MA302','42','',0),(1502,'MA302','43','',0),(1503,'MA302','44','',0),(1504,'MA302','45','',0),(1505,'MA302','46','',0),(1506,'MA302','47','',0),(1507,'MA302','48','',0),(1508,'MA302','49','',0),(1509,'MA302','50','',0),(1510,'MA302','51','',0),(1511,'MA302','52','',0),(1512,'MA302','53','',0),(1513,'MA302','54','',0),(1514,'MA302','55','',0),(1515,'MA303','1','',0),(1516,'MA303','2','',0),(1517,'MA303','3','',0),(1518,'MA303','4','',0),(1519,'MA303','5','',0),(1520,'MA303','6','',0),(1521,'MA303','7','',0),(1522,'MA303','8','',0),(1523,'MA303','9','',0),(1524,'MA303','10','',0),(1525,'MA303','11','',0),(1526,'MA303','12','',0),(1527,'MA303','13','',0),(1528,'MA303','14','',0),(1529,'MA303','15','',0),(1530,'MA303','16','',0),(1531,'MA303','17','',0),(1532,'MA303','18','',0),(1533,'MA303','19','',0),(1534,'MA303','20','',0),(1535,'MA303','21','',0),(1536,'MA303','22','',0),(1537,'MA303','23','',0),(1538,'MA303','24','',0),(1539,'MA303','25','',0),(1540,'MA303','26','',0),(1541,'MA303','27','',0),(1542,'MA303','28','',0),(1543,'MA303','29','',0),(1544,'MA303','30','',0),(1545,'MA303','31','',0),(1546,'MA303','32','',0),(1547,'MA303','33','',0),(1548,'MA303','34','',0),(1549,'MA303','35','',0),(1550,'MA303','36','',0),(1551,'MA303','37','',0),(1552,'MA303','38','',0),(1553,'MA303','39','',0),(1554,'MA303','40','',0),(1555,'MA303','41','',0),(1556,'MA303','42','',0),(1557,'MA303','43','',0),(1558,'MA303','44','',0),(1559,'MA303','45','',0),(1560,'MA303','46','',0),(1561,'MA303','47','',0),(1562,'MA303','48','',0),(1563,'MA303','49','',0),(1564,'MA303','50','',0),(1565,'MA303','51','',0),(1566,'MA303','52','',0),(1567,'MA303','53','',0),(1568,'MA303','54','',0),(1569,'MA303','55','',0),(1570,'MA304','1','',0),(1571,'MA304','2','',0),(1572,'MA304','3','',0),(1573,'MA304','4','',0),(1574,'MA304','5','',0),(1575,'MA304','6','',0),(1576,'MA304','7','',0),(1577,'MA304','8','',0),(1578,'MA304','9','',0),(1579,'MA304','10','',0),(1580,'MA304','11','',0),(1581,'MA304','12','',0),(1582,'MA304','13','',0),(1583,'MA304','14','',0),(1584,'MA304','15','',0),(1585,'MA304','16','',0),(1586,'MA304','17','',0),(1587,'MA304','18','',0),(1588,'MA304','19','',0),(1589,'MA304','20','',0),(1590,'MA304','21','',0),(1591,'MA304','22','',0),(1592,'MA304','23','',0),(1593,'MA304','24','',0),(1594,'MA304','25','',0),(1595,'MA304','26','',0),(1596,'MA304','27','',0),(1597,'MA304','28','',0),(1598,'MA304','29','',0),(1599,'MA304','30','',0),(1600,'MA304','31','',0),(1601,'MA304','32','',0),(1602,'MA304','33','',0),(1603,'MA304','34','',0),(1604,'MA304','35','',0),(1605,'MA304','36','',0),(1606,'MA304','37','',0),(1607,'MA304','38','',0),(1608,'MA304','39','',0),(1609,'MA304','40','',0),(1610,'MA304','41','',0),(1611,'MA304','42','',0),(1612,'MA304','43','',0),(1613,'MA304','44','',0),(1614,'MA304','45','',0),(1615,'MA304','46','',0),(1616,'MA304','47','',0),(1617,'MA304','48','',0),(1618,'MA304','49','',0),(1619,'MA304','50','',0),(1620,'MA304','51','',0),(1621,'MA304','52','',0),(1622,'MA304','53','',0),(1623,'MA304','54','',0),(1624,'MA304','55','',0),(1625,'MA507','1','',0),(1626,'MA507','2','',0),(1627,'MA507','3','',0),(1628,'MA507','4','',0),(1629,'MA507','5','',0),(1630,'MA507','6','',0),(1631,'MA507','7','',0),(1632,'MA507','8','',0),(1633,'MA507','9','',0),(1634,'MA507','10','',0),(1635,'MA507','11','',0),(1636,'MA507','12','',0),(1637,'MA507','13','',0),(1638,'MA507','14','',0),(1639,'MA507','15','',0),(1640,'MA507','16','',0),(1641,'MA507','17','',0),(1642,'MA507','18','',0),(1643,'MA507','19','',0),(1644,'MA507','20','',0),(1645,'MA507','21','',0),(1646,'MA507','22','',0),(1647,'MA507','23','',0),(1648,'MA507','24','',0),(1649,'MA507','25','',0),(1650,'MA507','26','',0),(1651,'MA507','27','',0),(1652,'MA507','28','',0),(1653,'MA507','29','',0),(1654,'MA507','30','',0),(1655,'MA507','31','',0),(1656,'MA507','32','',0),(1657,'MA507','33','',0),(1658,'MA507','34','',0),(1659,'MA507','35','',0),(1660,'MA507','36','',0),(1661,'MA507','37','',0),(1662,'MA507','38','',0),(1663,'MA507','39','',0),(1664,'MA507','40','',0),(1665,'MA508','1','',0),(1666,'MA508','2','',0),(1667,'MA508','3','',0),(1668,'MA508','4','',0),(1669,'MA508','5','',0),(1670,'MA508','6','',0),(1671,'MA508','7','',0),(1672,'MA508','8','',0),(1673,'MA508','9','',0),(1674,'MA508','10','',0),(1675,'MA508','11','',0),(1676,'MA508','12','',0),(1677,'MA508','13','',0),(1678,'MA508','14','',0),(1679,'MA508','15','',0),(1680,'MA508','16','',0),(1681,'MA508','17','',0),(1682,'MA508','18','',0),(1683,'MA508','19','',0),(1684,'MA508','20','',0),(1685,'MA508','21','',0),(1686,'MA508','22','',0),(1687,'MA508','23','',0),(1688,'MA508','24','',0),(1689,'MA508','25','',0),(1690,'MA508','26','',0),(1691,'MA508','27','',0),(1692,'MA508','28','',0),(1693,'MA508','29','',0),(1694,'MA508','30','',0),(1695,'MA508','31','',0),(1696,'MA508','32','',0),(1697,'MA508','33','',0),(1698,'MA508','34','',0),(1699,'MA508','35','',0),(1700,'MA508','36','',0),(1701,'MA508','37','',0),(1702,'MA508','38','',0),(1703,'MA508','39','',0),(1704,'MA508','40','',0),(1705,'ZA203','1','',0),(1706,'ZA203','2','',0),(1707,'ZA203','3','',0),(1708,'ZA203','4','',0),(1709,'ZA203','5','',0),(1710,'ZA203','6','',0),(1711,'ZA203','7','',0),(1712,'ZA203','8','',0),(1713,'ZA203','9','',0),(1714,'ZA203','10','',0),(1715,'ZA203','11','',0),(1716,'ZA203','12','',0),(1717,'ZA203','13','',0),(1718,'ZA203','14','',0),(1719,'ZA203','15','',0),(1720,'ZA203','16','',0),(1721,'ZA203','17','',0),(1722,'ZA203','18','',0),(1723,'ZA203','19','',0),(1724,'ZA203','20','',0),(1725,'ZA203','21','',0),(1726,'ZA203','22','',0),(1727,'ZA203','23','',0),(1728,'ZA203','24','',0),(1729,'ZA203','25','',0),(1730,'ZA203','26','',0),(1731,'ZA203','27','',0),(1732,'ZA203','28','',0),(1733,'ZA203','29','',0),(1734,'ZA203','30','',0),(1735,'ZA203','31','',0),(1736,'ZA203','32','',0),(1737,'ZA203','33','',0),(1738,'ZA203','34','',0),(1739,'ZA203','35','',0),(1740,'ZA203','36','',0),(1741,'ZA203','37','',0),(1742,'ZA203','38','',0),(1743,'ZA203','39','',0),(1744,'ZA203','40','',0),(1745,'ZA203','41','',0),(1746,'ZA203','42','',0),(1747,'ZA203','43','',0),(1748,'ZA203','44','',0),(1749,'ZA203','45','',0),(1750,'ZA203','46','',0),(1751,'ZA203','47','',0),(1752,'ZA203','48','',0),(1753,'ZA203','49','',0),(1754,'ZA203','50','',0),(1755,'ZA203','51','',0),(1756,'ZA203','52','',0),(1757,'ZA203','53','',0),(1758,'ZA203','54','',0),(1759,'ZA203','55','',0),(1760,'ZA203','56','',0),(1761,'ZA203','57','',0),(1762,'ZA203','58','',0),(1763,'ZA203','59','',0),(1764,'ZA203','60','',0),(1765,'ZA204','1','',0),(1766,'ZA204','2','',0),(1767,'ZA204','3','',0),(1768,'ZA204','4','',0),(1769,'ZA204','5','',0),(1770,'ZA204','6','',0),(1771,'ZA204','7','',0),(1772,'ZA204','8','',0),(1773,'ZA204','9','',0),(1774,'ZA204','10','',0),(1775,'ZA204','11','',0),(1776,'ZA204','12','',0),(1777,'ZA204','13','',0),(1778,'ZA204','14','',0),(1779,'ZA204','15','',0),(1780,'ZA204','16','',0),(1781,'ZA204','17','',0),(1782,'ZA204','18','',0),(1783,'ZA204','19','',0),(1784,'ZA204','20','',0),(1785,'ZA204','21','',0),(1786,'ZA204','22','',0),(1787,'ZA204','23','',0),(1788,'ZA204','24','',0),(1789,'ZA204','25','',0),(1790,'ZA204','26','',0),(1791,'ZA204','27','',0),(1792,'ZA204','28','',0),(1793,'ZA204','29','',0),(1794,'ZA204','30','',0),(1795,'ZA204','31','',0),(1796,'ZA204','32','',0),(1797,'ZA204','33','',0),(1798,'ZA204','34','',0),(1799,'ZA204','35','',0),(1800,'ZA204','36','',0),(1801,'ZA204','37','',0),(1802,'ZA204','38','',0),(1803,'ZA204','39','',0),(1804,'ZA204','40','',0),(1805,'ZA204','41','',0),(1806,'ZA204','42','',0),(1807,'ZA204','43','',0),(1808,'ZA204','44','',0),(1809,'ZA204','45','',0),(1810,'ZA204','46','',0),(1811,'ZA204','47','',0),(1812,'ZA204','48','',0),(1813,'ZA204','49','',0),(1814,'ZA204','50','',0),(1815,'ZA204','51','',0),(1816,'ZA204','52','',0),(1817,'ZA204','53','',0),(1818,'ZA204','54','',0),(1819,'ZA204','55','',0),(1820,'ZA204','56','',0),(1821,'ZA204','57','',0),(1822,'ZA204','58','',0),(1823,'ZA204','59','',0),(1824,'ZA204','60','',0),(1825,'ZA204','61','',0),(1826,'ZA204','62','',0),(1827,'ZA204','63','',0),(1828,'ZA204','64','',0),(1829,'ZA204','65','',0),(1830,'ZA204','66','',0),(1831,'ZA204','67','',0),(1832,'ZA204','68','',0),(1833,'ZA204','69','',0),(1834,'ZA204','70','',0),(1835,'ZA204','71','',0),(1836,'ZA204','72','',0),(1837,'ZA204','73','',0),(1838,'ZA204','74','',0),(1839,'ZA204','75','',0),(1840,'ZA204','76','',0),(1841,'ZA204','77','',0),(1842,'ZA204','78','',0),(1843,'ZA204','79','',0),(1844,'ZA204','80','',0),(1845,'ZA204','81','',0),(1846,'ZA204','82','',0),(1847,'ZA204','83','',0),(1848,'ZA204','84','',0),(1849,'ZA204','85','',0),(1850,'ZA204','86','',0),(1851,'ZA204','87','',0),(1852,'ZA204','88','',0),(1853,'ZA204','89','',0),(1854,'ZA204','90','',0),(1855,'ZA204','91','',0),(1856,'ZA204','92','',0),(1857,'ZA204','93','',0),(1858,'ZA204','94','',0),(1859,'ZA204','95','',0),(1860,'ZA204','96','',0),(1861,'ZA303','1','',0),(1862,'ZA303','2','',0),(1863,'ZA303','3','',0),(1864,'ZA303','4','',0),(1865,'ZA303','5','',0),(1866,'ZA303','6','',0),(1867,'ZA303','7','',0),(1868,'ZA303','8','',0),(1869,'ZA303','9','',0),(1870,'ZA303','10','',0),(1871,'ZA303','11','',0),(1872,'ZA303','12','',0),(1873,'ZA303','13','',0),(1874,'ZA303','14','',0),(1875,'ZA303','15','',0),(1876,'ZA303','16','',0),(1877,'ZA303','17','',0),(1878,'ZA303','18','',0),(1879,'ZA303','19','',0),(1880,'ZA303','20','',0),(1881,'ZA303','21','',0),(1882,'ZA303','22','',0),(1883,'ZA303','23','',0),(1884,'ZA303','24','',0),(1885,'ZA303','25','',0),(1886,'ZA303','26','',0),(1887,'ZA303','27','',0),(1888,'ZA303','28','',0),(1889,'ZA303','29','',0),(1890,'ZA303','30','',0),(1891,'ZA303','31','',0),(1892,'ZA303','32','',0),(1893,'ZA303','33','',0),(1894,'ZA303','34','',0),(1895,'ZA303','35','',0),(1896,'ZA303','36','',0),(1897,'ZA303','37','',0),(1898,'ZA303','38','',0),(1899,'ZA303','39','',0),(1900,'ZA303','40','',0),(1901,'ZA303','41','',0),(1902,'ZA303','42','',0),(1903,'ZA303','43','',0),(1904,'ZA303','44','',0),(1905,'ZA303','45','',0),(1906,'ZA303','46','',0),(1907,'ZA303','47','',0),(1908,'ZA303','48','',0),(1909,'ZA303','49','',0),(1910,'ZA303','50','',0),(1911,'ZA304','1','',0),(1912,'ZA304','2','',0),(1913,'ZA304','3','',0),(1914,'ZA304','4','',0),(1915,'ZA304','5','',0),(1916,'ZA304','6','',0),(1917,'ZA304','7','',0),(1918,'ZA304','8','',0),(1919,'ZA304','9','',0),(1920,'ZA304','10','',0),(1921,'ZA304','11','',0),(1922,'ZA304','12','',0),(1923,'ZA304','13','',0),(1924,'ZA304','14','',0),(1925,'ZA304','15','',0),(1926,'ZA304','16','',0),(1927,'ZA304','17','',0),(1928,'ZA304','18','',0),(1929,'ZA304','19','',0),(1930,'ZA304','20','',0),(1931,'ZA304','21','',0),(1932,'ZA304','22','',0),(1933,'ZA304','23','',0),(1934,'ZA304','24','',0),(1935,'ZA304','25','',0),(1936,'ZA304','26','',0),(1937,'ZA304','27','',0),(1938,'ZA304','28','',0),(1939,'ZA304','29','',0),(1940,'ZA304','30','',0),(1941,'ZA304','31','',0),(1942,'ZA304','32','',0),(1943,'ZA304','33','',0),(1944,'ZA304','34','',0),(1945,'ZA304','35','',0),(1946,'ZA304','36','',0),(1947,'ZA304','37','',0),(1948,'ZA304','38','',0),(1949,'ZA304','39','',0),(1950,'ZA304','40','',0),(1951,'ZA304','41','',0),(1952,'ZA304','42','',0),(1953,'ZA304','43','',0),(1954,'ZA304','44','',0),(1955,'ZA304','45','',0),(1956,'ZA304','46','',0),(1957,'ZA304','47','',0),(1958,'ZA304','48','',0),(1959,'ZA304','49','',0),(1960,'ZA304','50','',0),(1961,'ZA304','51','',0),(1962,'ZA304','52','',0),(1963,'ZA304','53','',0),(1964,'ZA304','54','',0),(1965,'ZA304','55','',0),(1966,'ZA304','56','',0),(1967,'ZA304','57','',0),(1968,'ZA304','58','',0),(1969,'ZA304','59','',0),(1970,'ZA304','60','',0),(1971,'ZA304','61','',0),(1972,'ZA304','62','',0),(1973,'ZA304','63','',0),(1974,'ZA304','64','',0),(1975,'ZA304','65','',0),(1976,'ZA304','66','',0),(1977,'ZA304','67','',0),(1978,'ZA304','68','',0),(1979,'ZA304','69','',0),(1980,'ZA304','70','',0),(1981,'ZA401','1','',0),(1982,'ZA401','2','',0),(1983,'ZA401','3','',0),(1984,'ZA401','4','',0),(1985,'ZA401','5','',0),(1986,'ZA401','6','',0),(1987,'ZA401','7','',0),(1988,'ZA401','8','',0),(1989,'ZA401','9','',0),(1990,'ZA401','10','',0),(1991,'ZA401','11','',0),(1992,'ZA401','12','',0),(1993,'ZA401','13','',0),(1994,'ZA401','14','',0),(1995,'ZA401','15','',0),(1996,'ZA401','16','',0),(1997,'ZA401','17','',0),(1998,'ZA401','18','',0),(1999,'ZA401','19','',0),(2000,'ZA401','20','',0),(2001,'ZA401','21','',0),(2002,'ZA401','22','',0),(2003,'ZA401','23','',0),(2004,'ZA401','24','',0),(2005,'ZA401','25','',0),(2006,'ZA401','26','',0),(2007,'ZA401','27','',0),(2008,'ZA401','28','',0),(2009,'ZA401','29','',0),(2010,'ZA401','30','',0),(2011,'ZA401','31','',0),(2012,'ZA401','32','',0),(2013,'ZA401','33','',0),(2014,'ZA401','34','',0),(2015,'ZA401','35','',0),(2016,'ZA401','36','',0),(2017,'ZA401','37','',0),(2018,'ZA401','38','',0),(2019,'ZA401','39','',0),(2020,'ZA401','40','',0),(2021,'ZA401','41','',0),(2022,'ZA401','42','',0),(2023,'ZA401','43','',0),(2024,'ZA401','44','',0),(2025,'ZA401','45','',0),(2026,'ZA401','46','',0),(2027,'ZA401','47','',0),(2028,'ZA401','48','',0),(2029,'ZA402','1','',0),(2030,'ZA402','2','',0),(2031,'ZA402','3','',0),(2032,'ZA402','4','',0),(2033,'ZA402','5','',0),(2034,'ZA402','6','',0),(2035,'ZA402','7','',0),(2036,'ZA402','8','',0),(2037,'ZA402','9','',0),(2038,'ZA402','10','',0),(2039,'ZA402','11','',0),(2040,'ZA402','12','',0),(2041,'ZA402','13','',0),(2042,'ZA402','14','',0),(2043,'ZA402','15','',0),(2044,'ZA402','16','',0),(2045,'ZA402','17','',0),(2046,'ZA402','18','',0),(2047,'ZA402','19','',0),(2048,'ZA402','20','',0),(2049,'ZA402','21','',0),(2050,'ZA402','22','',0),(2051,'ZA402','23','',0),(2052,'ZA402','24','',0),(2053,'ZA402','25','',0),(2054,'ZA402','26','',0),(2055,'ZA402','27','',0),(2056,'ZA402','28','',0),(2057,'ZA402','29','',0),(2058,'ZA402','30','',0),(2059,'ZA402','31','',0),(2060,'ZA402','32','',0),(2061,'ZA402','33','',0),(2062,'ZA402','34','',0),(2063,'ZA402','35','',0),(2064,'ZA402','36','',0),(2065,'ZA402','37','',0),(2066,'ZA402','38','',0),(2067,'ZA402','39','',0),(2068,'ZA402','40','',0),(2069,'ZA402','41','',0),(2070,'ZA402','42','',0),(2071,'ZA402','43','',0),(2072,'ZA402','44','',0),(2073,'ZA402','45','',0),(2074,'ZA402','46','',0),(2075,'ZA402','47','',0),(2076,'ZA402','48','',0),(2077,'ZA402','49','',0),(2078,'ZA402','50','',0),(2079,'ZA402','51','',0),(2080,'ZA402','52','',0),(2081,'ZA402','53','',0),(2082,'ZA402','54','',0),(2083,'ZA402','55','',0),(2084,'ZA402','56','',0),(2085,'ZA402','57','',0),(2086,'ZA402','58','',0),(2087,'ZA402','59','',0),(2088,'ZA402','60','',0),(2089,'ZA403','1','',0),(2090,'ZA403','2','',0),(2091,'ZA403','3','',0),(2092,'ZA403','4','',0),(2093,'ZA403','5','',0),(2094,'ZA403','6','',0),(2095,'ZA403','7','',0),(2096,'ZA403','8','',0),(2097,'ZA403','9','',0),(2098,'ZA403','10','',0),(2099,'ZA403','11','',0),(2100,'ZA403','12','',0),(2101,'ZA403','13','',0),(2102,'ZA403','14','',0),(2103,'ZA403','15','',0),(2104,'ZA403','16','',0),(2105,'ZA403','17','',0),(2106,'ZA403','18','',0),(2107,'ZA403','19','',0),(2108,'ZA403','20','',0),(2109,'ZA403','21','',0),(2110,'ZA403','22','',0),(2111,'ZA403','23','',0),(2112,'ZA403','24','',0),(2113,'ZA403','25','',0),(2114,'ZA403','26','',0),(2115,'ZA403','27','',0),(2116,'ZA403','28','',0),(2117,'ZA403','29','',0),(2118,'ZA403','30','',0),(2119,'ZA403','31','',0),(2120,'ZA403','32','',0),(2121,'ZA403','33','',0),(2122,'ZA403','34','',0),(2123,'ZA403','35','',0),(2124,'ZA403','36','',0),(2125,'ZA403','37','',0),(2126,'ZA403','38','',0),(2127,'ZA403','39','',0),(2128,'ZA403','40','',0),(2129,'ZA403','41','',0),(2130,'ZA403','42','',0),(2131,'ZA403','43','',0),(2132,'ZA403','44','',0),(2133,'ZA403','45','',0),(2134,'ZA403','46','',0),(2135,'ZA403','47','',0),(2136,'ZA403','48','',0),(2137,'ZA403','49','',0),(2138,'ZA403','50','',0),(2139,'ZA403','51','',0),(2140,'ZA403','52','',0),(2141,'ZA403','53','',0),(2142,'ZA403','54','',0),(2143,'ZA403','55','',0),(2144,'ZA403','56','',0),(2145,'ZA403','57','',0),(2146,'ZA403','58','',0),(2147,'ZA403','59','',0),(2148,'ZA403','60','',0),(2149,'ZA404','1','',0),(2150,'ZA404','2','',0),(2151,'ZA404','3','',0),(2152,'ZA404','4','',0),(2153,'ZA404','5','',0),(2154,'ZA404','6','',0),(2155,'ZA404','7','',0),(2156,'ZA404','8','',0),(2157,'ZA404','9','',0),(2158,'ZA404','10','',0),(2159,'ZA404','11','',0),(2160,'ZA404','12','',0),(2161,'ZA404','13','',0),(2162,'ZA404','14','',0),(2163,'ZA404','15','',0),(2164,'ZA404','16','',0),(2165,'ZA404','17','',0),(2166,'ZA404','18','',0),(2167,'ZA404','19','',0),(2168,'ZA404','20','',0),(2169,'ZA404','21','',0),(2170,'ZA404','22','',0),(2171,'ZA404','23','',0),(2172,'ZA404','24','',0),(2173,'ZA404','25','',0),(2174,'ZA404','26','',0),(2175,'ZA404','27','',0),(2176,'ZA404','28','',0),(2177,'ZA404','29','',0),(2178,'ZA404','30','',0),(2179,'ZA404','31','',0),(2180,'ZA404','32','',0),(2181,'ZA404','33','',0),(2182,'ZA404','34','',0),(2183,'ZA404','35','',0),(2184,'ZA404','36','',0),(2185,'ZA404','37','',0),(2186,'ZA404','38','',0),(2187,'ZA404','39','',0),(2188,'ZA404','40','',0),(2189,'ZA404','41','',0),(2190,'ZA404','42','',0),(2191,'ZA404','43','',0),(2192,'ZA404','44','',0),(2193,'ZA404','45','',0),(2194,'ZA404','46','',0),(2195,'ZA404','47','',0),(2196,'ZA404','48','',0),(2197,'ZA404','49','',0),(2198,'ZA404','50','',0),(2199,'ZA404','51','',0),(2200,'ZA404','52','',0),(2201,'ZA404','53','',0),(2202,'ZA404','54','',0),(2203,'ZA404','55','',0),(2204,'ZA404','56','',0),(2205,'ZA404','57','',0),(2206,'ZA404','58','',0),(2207,'ZA404','59','',0),(2208,'ZA404','60','',0),(2209,'ZA407','1','',0),(2210,'ZA407','2','',0),(2211,'ZA407','3','',0),(2212,'ZA407','4','',0),(2213,'ZA407','5','',0),(2214,'ZA407','6','',0),(2215,'ZA407','7','',0),(2216,'ZA407','8','',0),(2217,'ZA407','9','',0),(2218,'ZA407','10','',0),(2219,'ZA407','11','',0),(2220,'ZA407','12','',0),(2221,'ZA407','13','',0),(2222,'ZA407','14','',0),(2223,'ZA407','15','',0),(2224,'ZA407','16','',0),(2225,'ZA407','17','',0),(2226,'ZA407','18','',0),(2227,'ZA407','19','',0),(2228,'ZA407','20','',0),(2229,'ZA407','21','',0),(2230,'ZA407','22','',0),(2231,'ZA407','23','',0),(2232,'ZA407','24','',0),(2233,'ZA407','25','',0),(2234,'ZA407','26','',0),(2235,'ZA407','27','',0),(2236,'ZA407','28','',0),(2237,'ZA407','29','',0),(2238,'ZA407','30','',0),(2239,'ZA407','31','',0),(2240,'ZA407','32','',0),(2241,'ZA407','33','',0),(2242,'ZA407','34','',0),(2243,'ZA407','35','',0),(2244,'ZA407','36','',0),(2245,'ZA407','37','',0),(2246,'ZA407','38','',0),(2247,'ZA407','39','',0),(2248,'ZA407','40','',0),(2249,'ZA407','41','',0),(2250,'ZA407','42','',0),(2251,'ZA407','43','',0),(2252,'ZA407','44','',0),(2253,'ZA407','45','',0),(2254,'ZA407','46','',0),(2255,'ZA407','47','',0),(2256,'ZA407','48','',0),(2257,'ZA501','1','',0),(2258,'ZA501','2','',0),(2259,'ZA501','3','',0),(2260,'ZA501','4','',0),(2261,'ZA501','5','',0),(2262,'ZA501','6','',0),(2263,'ZA501','7','',0),(2264,'ZA501','8','',0),(2265,'ZA501','9','',0),(2266,'ZA501','10','',0),(2267,'ZA501','11','',0),(2268,'ZA501','12','',0),(2269,'ZA501','13','',0),(2270,'ZA501','14','',0),(2271,'ZA501','15','',0),(2272,'ZA501','16','',0),(2273,'ZA501','17','',0),(2274,'ZA501','18','',0),(2275,'ZA501','19','',0),(2276,'ZA501','20','',0),(2277,'ZA501','21','',0),(2278,'ZA501','22','',0),(2279,'ZA501','23','',0),(2280,'ZA501','24','',0),(2281,'ZA501','25','',0),(2282,'ZA501','26','',0),(2283,'ZA501','27','',0),(2284,'ZA501','28','',0),(2285,'ZA501','29','',0),(2286,'ZA501','30','',0),(2287,'ZA501','31','',0),(2288,'ZA501','32','',0),(2289,'ZA501','33','',0),(2290,'ZA501','34','',0),(2291,'ZA501','35','',0),(2292,'ZA501','36','',0),(2293,'ZA501','37','',0),(2294,'ZA501','38','',0),(2295,'ZA501','39','',0),(2296,'ZA501','40','',0),(2297,'ZA501','41','',0),(2298,'ZA501','42','',0),(2299,'ZA501','43','',0),(2300,'ZA501','44','',0),(2301,'ZA501','45','',0),(2302,'ZA501','46','',0),(2303,'ZA501','47','',0),(2304,'ZA501','48','',0),(2305,'ZA502','1','',0),(2306,'ZA502','2','',0),(2307,'ZA502','3','',0),(2308,'ZA502','4','',0),(2309,'ZA502','5','',0),(2310,'ZA502','6','',0),(2311,'ZA502','7','',0),(2312,'ZA502','8','',0),(2313,'ZA502','9','',0),(2314,'ZA502','10','',0),(2315,'ZA502','11','',0),(2316,'ZA502','12','',0),(2317,'ZA502','13','',0),(2318,'ZA502','14','',0),(2319,'ZA502','15','',0),(2320,'ZA502','16','',0),(2321,'ZA502','17','',0),(2322,'ZA502','18','',0),(2323,'ZA502','19','',0),(2324,'ZA502','20','',0),(2325,'ZA502','21','',0),(2326,'ZA502','22','',0),(2327,'ZA502','23','',0),(2328,'ZA502','24','',0),(2329,'ZA502','25','',0),(2330,'ZA502','26','',0),(2331,'ZA502','27','',0),(2332,'ZA502','28','',0),(2333,'ZA502','29','',0),(2334,'ZA502','30','',0),(2335,'ZA502','31','',0),(2336,'ZA502','32','',0),(2337,'ZA502','33','',0),(2338,'ZA502','34','',0),(2339,'ZA502','35','',0),(2340,'ZA502','36','',0),(2341,'ZA502','37','',0),(2342,'ZA502','38','',0),(2343,'ZA502','39','',0),(2344,'ZA502','40','',0),(2345,'ZA502','41','',0),(2346,'ZA502','42','',0),(2347,'ZA502','43','',0),(2348,'ZA502','44','',0),(2349,'ZA502','45','',0),(2350,'ZA502','46','',0),(2351,'ZA502','47','',0),(2352,'ZA502','48','',0),(2353,'ZA502','49','',0),(2354,'ZA502','50','',0),(2355,'ZA502','51','',0),(2356,'ZA502','52','',0),(2357,'ZA502','53','',0),(2358,'ZA502','54','',0),(2359,'ZA502','55','',0),(2360,'ZA502','56','',0),(2361,'ZA502','57','',0),(2362,'ZA502','58','',0),(2363,'ZA502','59','',0),(2364,'ZA502','60','',0),(2365,'ZA502','61','',0),(2366,'ZA502','62','',0),(2367,'ZA502','63','',0),(2368,'ZA502','64','',0),(2369,'ZA502','65','',0),(2370,'ZA502','66','',0),(2371,'ZA502','67','',0),(2372,'ZA502','68','',0),(2373,'ZA502','69','',0),(2374,'ZA502','70','',0),(2375,'ZA502','71','',0),(2376,'ZA502','72','',0),(2377,'ZA502','73','',0),(2378,'ZA502','74','',0),(2379,'ZA502','75','',0),(2380,'ZA502','76','',0),(2381,'ZA502','77','',0),(2382,'ZA502','78','',0),(2383,'ZA502','79','',0),(2384,'ZA502','80','',0),(2385,'ZA502','81','',0),(2386,'ZA502','82','',0),(2387,'ZA502','83','',0),(2388,'ZA502','84','',0),(2389,'ZA502','85','',0),(2390,'ZA502','86','',0),(2391,'ZA502','87','',0),(2392,'ZA502','88','',0),(2393,'ZA502','89','',0),(2394,'ZA502','90','',0),(2395,'ZA502','91','',0),(2396,'ZA502','92','',0),(2397,'ZA502','93','',0),(2398,'ZA502','94','',0),(2399,'ZA502','95','',0),(2400,'ZA502','96','',0),(2401,'ZA503','1','',0),(2402,'ZA503','2','',0),(2403,'ZA503','3','',0),(2404,'ZA503','4','',0),(2405,'ZA503','5','',0),(2406,'ZA503','6','',0),(2407,'ZA503','7','',0),(2408,'ZA503','8','',0),(2409,'ZA503','9','',0),(2410,'ZA503','10','',0),(2411,'ZA503','11','',0),(2412,'ZA503','12','',0),(2413,'ZA503','13','',0),(2414,'ZA503','14','',0),(2415,'ZA503','15','',0),(2416,'ZA503','16','',0),(2417,'ZA503','17','',0),(2418,'ZA503','18','',0),(2419,'ZA503','19','',0),(2420,'ZA503','20','',0),(2421,'ZA503','21','',0),(2422,'ZA503','22','',0),(2423,'ZA503','23','',0),(2424,'ZA503','24','',0),(2425,'ZA503','25','',0),(2426,'ZA503','26','',0),(2427,'ZA503','27','',0),(2428,'ZA503','28','',0),(2429,'ZA503','29','',0),(2430,'ZA503','30','',0),(2431,'ZA503','31','',0),(2432,'ZA503','32','',0),(2433,'ZA503','33','',0),(2434,'ZA503','34','',0),(2435,'ZA503','35','',0),(2436,'ZA503','36','',0),(2437,'ZA503','37','',0),(2438,'ZA503','38','',0),(2439,'ZA503','39','',0),(2440,'ZA503','40','',0),(2441,'ZA503','41','',0),(2442,'ZA503','42','',0),(2443,'ZA503','43','',0),(2444,'ZA503','44','',0),(2445,'ZA503','45','',0),(2446,'ZA503','46','',0),(2447,'ZA503','47','',0),(2448,'ZA503','48','',0),(2449,'ZA505','1','',0),(2450,'ZA505','2','',0),(2451,'ZA505','3','',0),(2452,'ZA505','4','',0),(2453,'ZA505','5','',0),(2454,'ZA505','6','',0),(2455,'ZA505','7','',0),(2456,'ZA505','8','',0),(2457,'ZA505','9','',0),(2458,'ZA505','10','',0),(2459,'ZA505','11','',0),(2460,'ZA505','12','',0),(2461,'ZA505','13','',0),(2462,'ZA505','14','',0),(2463,'ZA505','15','',0),(2464,'ZA505','16','',0),(2465,'ZA505','17','',0),(2466,'ZA505','18','',0),(2467,'ZA505','19','',0),(2468,'ZA505','20','',0),(2469,'ZA505','21','',0),(2470,'ZA505','22','',0),(2471,'ZA505','23','',0),(2472,'ZA505','24','',0),(2473,'ZA505','25','',0),(2474,'ZA505','26','',0),(2475,'ZA505','27','',0),(2476,'ZA505','28','',0),(2477,'ZA505','29','',0),(2478,'ZA505','30','',0),(2479,'ZA505','31','',0),(2480,'ZA505','32','',0),(2481,'ZA505','33','',0),(2482,'ZA505','34','',0),(2483,'ZA505','35','',0),(2484,'ZA505','36','',0),(2485,'ZA505','37','',0),(2486,'ZA505','38','',0),(2487,'ZA505','39','',0),(2488,'ZA505','40','',0),(2489,'ZA505','41','',0),(2490,'ZA505','42','',0),(2491,'ZA505','43','',0),(2492,'ZA505','44','',0),(2493,'ZA505','45','',0),(2494,'ZA505','46','',0),(2495,'ZA505','47','',0),(2496,'ZA505','48','',0);
/*!40000 ALTER TABLE `report_computer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_computerproblem`
--

DROP TABLE IF EXISTS `report_computerproblem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_computerproblem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_type` int(11) NOT NULL,
  `problem_desc` longtext NOT NULL,
  `problem_situation` int(11) NOT NULL,
  `problem_status` int(11) NOT NULL,
  `report_time` datetime(6) NOT NULL,
  `computer_id` int(11) NOT NULL,
  `reporter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `report_computerprobl_computer_id_ce839d72_fk_report_co` (`computer_id`),
  KEY `report_computerprobl_reporter_id_5d85c356_fk_report_re` (`reporter_id`),
  CONSTRAINT `report_computerprobl_computer_id_ce839d72_fk_report_co` FOREIGN KEY (`computer_id`) REFERENCES `report_computer` (`id`),
  CONSTRAINT `report_computerprobl_reporter_id_5d85c356_fk_report_re` FOREIGN KEY (`reporter_id`) REFERENCES `report_reporter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_computerproblem`
--

LOCK TABLES `report_computerproblem` WRITE;
/*!40000 ALTER TABLE `report_computerproblem` DISABLE KEYS */;
INSERT INTO `report_computerproblem` VALUES (1,0,'test',0,0,'2018-03-25 05:02:21.344230',112,1),(2,1,'qita',1,0,'2018-03-25 08:23:23.412482',4,13),(3,0,'tset',1,0,'2018-03-27 15:53:54.032169',4,14),(4,0,'有毛病',1,0,'2018-03-27 15:59:23.436265',9,15),(5,0,'又有问题了',1,0,'2018-03-27 16:01:13.211080',11,16),(6,0,'啦啦啦',2,0,'2018-03-27 16:02:45.845410',30,17),(7,3,'鼠标坏了',2,0,'2018-03-27 16:03:32.906047',15,18),(8,2,'上不了网',2,0,'2018-03-27 16:04:17.011248',4,19),(9,1,'哈拉开始的发动机三大就立刻发送到结束啦开发加上了贷款福建师大房间爱丽丝的看法是巨大福建师大了开始就爱的是骄傲的富士达',0,0,'2018-03-27 16:04:52.982955',24,20),(10,0,'现在应该没爱上邓丽君圣诞节卡死了都减肥了深刻的撒啊',0,0,'2018-03-27 16:05:49.356250',4,21),(11,0,'adsf',0,0,'2018-03-27 16:21:35.953100',19,27),(12,0,'asdf',0,0,'2018-03-27 16:24:14.993442',31,32),(13,0,'asdfdasfsda',0,0,'2018-03-27 16:24:25.264755',22,33),(14,0,'sadfasdf',0,0,'2018-03-27 16:24:34.257293',34,34),(15,0,'asdfasdf',0,0,'2018-03-27 16:24:54.993850',421,35),(16,0,'sadfasdf\r\nasdsd',0,0,'2018-03-27 16:31:53.060215',37,39);
/*!40000 ALTER TABLE `report_computerproblem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_remind`
--

DROP TABLE IF EXISTS `report_remind`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_remind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remind_email` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_remind`
--

LOCK TABLES `report_remind` WRITE;
/*!40000 ALTER TABLE `report_remind` DISABLE KEYS */;
INSERT INTO `report_remind` VALUES (1,'876531738@qq.com');
/*!40000 ALTER TABLE `report_remind` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_reporter`
--

DROP TABLE IF EXISTS `report_reporter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report_reporter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reporter_ip` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_reporter`
--

LOCK TABLES `report_reporter` WRITE;
/*!40000 ALTER TABLE `report_reporter` DISABLE KEYS */;
INSERT INTO `report_reporter` VALUES (1,'10.0.108.11'),(2,'None'),(3,'None'),(4,'None'),(5,'None'),(6,'None'),(7,'None'),(8,'None'),(9,'None'),(10,'None'),(11,'None'),(12,'None'),(13,'None'),(14,'None'),(15,'None'),(16,'None'),(17,'None'),(18,'None'),(19,'None'),(20,'None'),(21,'None'),(22,'None'),(23,'None'),(24,'None'),(25,'None'),(26,'None'),(27,'None'),(28,'None'),(29,'None'),(30,'None'),(31,'None'),(32,'None'),(33,'None'),(34,'None'),(35,'None'),(36,'None'),(37,'None'),(38,'None'),(39,'None');
/*!40000 ALTER TABLE `report_reporter` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-28  0:41:40
