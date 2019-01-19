-- MySQL dump 10.16  Distrib 10.1.30-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: sdrs
-- ------------------------------------------------------
-- Server version	10.1.30-MariaDB

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
-- Table structure for table `daily_reports`
--

DROP TABLE IF EXISTS `daily_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_date` date NOT NULL COMMENT '作業日',
  `site_id` int(11) DEFAULT '0' COMMENT '現場',
  `site_img_fn` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '現場写真',
  `work_note` text COMMENT '作業内容',
  `work_category_id` int(11) DEFAULT '0' COMMENT '作業カテゴリ',
  `check_flg` tinyint(4) DEFAULT '0' COMMENT '確認フラグ',
  `sort_no` int(11) DEFAULT '0' COMMENT '順番',
  `delete_flg` tinyint(1) DEFAULT '0' COMMENT '無効フラグ',
  `update_user` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '更新者',
  `ip_addr` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT 'IPアドレス',
  `created` datetime DEFAULT NULL COMMENT '生成日時',
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_reports`
--

LOCK TABLES `daily_reports` WRITE;
/*!40000 ALTER TABLE `daily_reports` DISABLE KEYS */;
INSERT INTO `daily_reports` VALUES (1,'2019-01-17',2,NULL,'開発作業',3,0,1,0,'kani','::1','2019-01-17 17:39:49','2019-01-17 08:39:49'),(2,'2019-01-18',2,NULL,'テスト',3,0,2,0,'kani','::1','2019-01-17 17:39:49','2019-01-17 08:39:49'),(3,'2019-01-19',2,NULL,'リリース',3,0,3,0,'kani','::1','2019-01-17 17:39:49','2019-01-17 08:39:49'),(4,'2019-01-16',1,'53_hyomon.jpg','大井川を探索し、蝶を撮影。',4,1,0,0,'kani','::1','2019-01-17 17:41:43','2019-01-17 08:41:53');
/*!40000 ALTER TABLE `daily_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `neko_groups`
--

DROP TABLE IF EXISTS `neko_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neko_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `neko_group_name` varchar(255) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL COMMENT '備考',
  `sort_no` int(11) DEFAULT '0' COMMENT '順番',
  `delete_flg` tinyint(1) DEFAULT '0' COMMENT '無効フラグ',
  `update_user` varchar(50) DEFAULT NULL COMMENT '更新者',
  `ip_addr` varchar(40) DEFAULT NULL COMMENT 'IPアドレス',
  `created` datetime DEFAULT NULL COMMENT '生成日時',
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `neko_groups`
--

LOCK TABLES `neko_groups` WRITE;
/*!40000 ALTER TABLE `neko_groups` DISABLE KEYS */;
INSERT INTO `neko_groups` VALUES (1,'ペルシャ',NULL,0,0,NULL,NULL,NULL,'2018-04-22 06:57:53'),(2,'ボンベイ',NULL,0,0,NULL,NULL,NULL,'2018-04-22 06:57:53'),(3,'三毛',NULL,0,0,NULL,NULL,NULL,'2018-04-22 06:58:15'),(4,'シャム',NULL,0,0,NULL,NULL,NULL,'2018-04-22 06:58:15'),(5,'キジトラ',NULL,0,0,NULL,NULL,NULL,'2018-04-22 06:58:39'),(6,'スフィンクス',NULL,0,0,NULL,NULL,NULL,'2018-04-22 06:58:39'),(7,'メインクーン',NULL,0,0,NULL,NULL,NULL,'2018-04-22 06:59:21'),(8,'ベンガル',NULL,0,0,NULL,NULL,NULL,'2018-04-22 06:59:21');
/*!40000 ALTER TABLE `neko_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nekos`
--

DROP TABLE IF EXISTS `nekos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nekos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `neko_val` int(11) DEFAULT NULL,
  `neko_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `neko_date` date DEFAULT NULL,
  `neko_group` int(11) DEFAULT NULL COMMENT '猫種別',
  `neko_dt` datetime DEFAULT NULL,
  `neko_flg` tinyint(4) DEFAULT '0' COMMENT 'ネコフラグ',
  `img_fn` varchar(256) CHARACTER SET latin1 DEFAULT NULL COMMENT '画像ファイル名',
  `note` text CHARACTER SET utf8 NOT NULL COMMENT '備考',
  `sort_no` int(11) DEFAULT '0' COMMENT '順番',
  `delete_flg` tinyint(1) DEFAULT '0' COMMENT '無効フラグ',
  `update_user` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '更新者',
  `ip_addr` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT 'IPアドレス',
  `created` datetime DEFAULT NULL COMMENT '生成日時',
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nekos`
--

LOCK TABLES `nekos` WRITE;
/*!40000 ALTER TABLE `nekos` DISABLE KEYS */;
INSERT INTO `nekos` VALUES (1,1,'\'\' = \'\'う','2014-04-01',2,'2014-12-12 00:00:00',0,'DSC_0010.jpg','大きな\n猫',24,0,'','::1',NULL,'2018-10-18 06:22:46'),(2,2000,'三毛A','2014-04-02',3,'2014-12-12 00:00:01',0,'','',32,0,'','::1',NULL,'2018-07-04 23:54:51'),(4,4,'buta','2014-04-04',0,'2014-12-12 00:00:03',0,'','',38,0,'kani','::1',NULL,'2018-04-19 08:22:13'),(5,3,'yagi','2014-04-03',NULL,'2014-12-12 00:00:02',0,'','',35,0,'kani','::1',NULL,'2018-03-20 03:05:46'),(6,3,'ari','2014-04-03',2,'2014-12-12 00:00:02',0,'','',40,0,'kani','::1',NULL,'2018-03-20 03:05:46'),(7,3,'tori','2014-04-03',NULL,'2014-12-12 00:00:02',0,'','',41,0,'kani','::1',NULL,'2018-03-20 03:05:46'),(8,3,'kame','2014-04-03',2,'2014-12-12 00:00:02',0,'','',42,0,'kani','::1',NULL,'2018-03-20 03:05:46'),(9,111,'ゴボウ','1970-01-01',2,'2014-04-28 10:04:00',0,'','白菜とサラダセット',43,0,'kani','::1',NULL,'2018-03-20 03:06:17'),(10,123,'PANDA','1970-01-01',NULL,'2014-04-28 10:05:00',0,'','',39,0,'kani','::1',NULL,'2018-03-20 03:05:46'),(11,3,'kame','2018-04-03',0,'2014-12-12 00:00:02',0,'','',36,0,'kani','::1','2018-03-09 09:00:20','2018-03-31 05:17:43'),(17,3,'kame','2014-04-03',0,'2014-12-12 00:00:02',0,'','',33,0,'kani','::1','2018-03-20 06:39:26','2018-03-20 03:05:46'),(19,111,'ニャーニャー','2018-10-18',5,'2018-03-31 14:18:59',0,'','a',34,0,'','::1','2018-03-20 06:41:48','2018-10-18 06:02:19'),(20,3,'kame2','2014-04-03',NULL,'2014-12-12 00:00:02',0,'','',37,0,'kani','::1','2018-03-20 07:45:08','2018-03-20 03:05:46'),(22,111,'ハマダイコン','1970-01-01',2,'2014-04-29 10:04:00',0,'','砂浜に生える大根',44,1,'kani','::1','2018-03-30 09:46:18','2018-10-21 14:58:13'),(23,3,'AA',NULL,1,NULL,0,NULL,'',9,1,'kani','::1','2018-04-18 22:40:24','2018-04-19 14:47:26'),(26,1,'',NULL,NULL,NULL,0,'26_DSC_0037.jpg','',14,0,'','::1','2018-04-19 22:28:39','2018-09-30 08:24:18'),(29,124,'ビッグキャット',NULL,NULL,NULL,0,'29_DSC_0037.jpg','',17,0,'','::1','2018-04-19 22:57:16','2018-10-17 04:18:40'),(34,NULL,'AS',NULL,NULL,NULL,0,NULL,'',6,1,'kani','::1','2018-04-19 23:26:06','2018-04-19 14:47:26'),(35,NULL,'A',NULL,NULL,NULL,0,NULL,'',7,1,'kani','::1','2018-04-19 23:26:38','2018-04-19 14:47:26'),(36,NULL,'AD',NULL,NULL,NULL,0,NULL,'',8,1,'kani','::1','2018-04-19 23:26:56','2018-04-19 14:47:26');
/*!40000 ALTER TABLE `nekos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) DEFAULT NULL COMMENT '現場名',
  `note` varchar(1000) DEFAULT NULL COMMENT '備考',
  `sort_no` int(11) DEFAULT '0' COMMENT '順番',
  `delete_flg` tinyint(1) DEFAULT '0' COMMENT '無効フラグ',
  `update_user` varchar(50) DEFAULT NULL COMMENT '更新者',
  `ip_addr` varchar(40) DEFAULT NULL COMMENT 'IPアドレス',
  `created` datetime DEFAULT NULL COMMENT '生成日時',
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,'大宜味村',NULL,1,0,'kani','::1','2019-01-17 12:33:22','2019-01-17 03:33:22'),(2,'今帰仁村今泊','',2,0,'kani','::1','2019-01-17 13:40:24','2019-01-17 04:40:24'),(3,'東村','',3,0,'kani','::1','2019-01-17 13:40:24','2019-01-17 04:40:24'),(4,'国頭村奥間','',4,0,'kani','::1','2019-01-17 13:40:24','2019-01-17 04:40:24');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(50) DEFAULT NULL COMMENT 'ユーザー名',
  `password` varchar(50) DEFAULT NULL COMMENT 'パスワード',
  `role` varchar(20) DEFAULT NULL COMMENT '権限',
  `sort_no` int(11) DEFAULT '0' COMMENT '順番',
  `delete_flg` tinyint(4) DEFAULT '0' COMMENT '削除フラグ',
  `update_user` varchar(50) DEFAULT NULL COMMENT '更新ユーザー',
  `ip_addr` varchar(40) DEFAULT NULL COMMENT '更新IPアドレス',
  `created` datetime DEFAULT NULL COMMENT '作成日時',
  `modified` datetime DEFAULT NULL COMMENT '更新日時',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (15,'shuri','e44e773c685e3c17fff6efc806ebae82cea1f1c7','oparator',6,0,'kani','::1','2019-01-18 21:48:21','2019-01-18 21:49:04'),(16,'satuma','defae98c8a49ece1edba489860236e60fc01814c','oparator',7,0,'kani','::1','2019-01-18 21:48:21','2019-01-18 21:49:14'),(17,'owari','c38dfab6431b1e71cd89c1ad5fb8259b63961b34','oparator',8,0,'kani','::1','2019-01-18 21:48:21','2019-01-18 21:49:24'),(18,'kamakura','963bfcaf06ed6ef32494499c049fa9b21b787ffd','oparator',9,0,'kani','::1','2019-01-18 21:48:21','2019-01-18 21:49:30'),(19,'kyouto','8b0f355ffc35a97d29be47309655e4ce3def6761','oparator',10,0,'kani','::1','2019-01-18 21:48:21','2019-01-18 21:49:39'),(20,'hokkaido','259905c8bea3c92cd98acaed50881a7436d9d693','oparator',11,0,'kani','::1','2019-01-18 21:48:21','2019-01-18 21:49:46');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_categorys`
--

DROP TABLE IF EXISTS `work_categorys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_categorys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_category_name` varchar(255) DEFAULT NULL COMMENT '作業カテゴリ名',
  `note` varchar(1000) DEFAULT NULL COMMENT '備考',
  `sort_no` int(11) DEFAULT '0' COMMENT '順番',
  `delete_flg` tinyint(1) DEFAULT '0' COMMENT '無効フラグ',
  `update_user` varchar(50) DEFAULT NULL COMMENT '更新者',
  `ip_addr` varchar(40) DEFAULT NULL COMMENT 'IPアドレス',
  `created` datetime DEFAULT NULL COMMENT '生成日時',
  `modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_categorys`
--

LOCK TABLES `work_categorys` WRITE;
/*!40000 ALTER TABLE `work_categorys` DISABLE KEYS */;
INSERT INTO `work_categorys` VALUES (1,'テスト','',1,0,'kani','::1','2019-01-17 16:53:24','2019-01-17 07:53:24'),(2,'搬入作業',NULL,2,0,'kani','::1','2019-01-17 16:54:04','2019-01-17 07:54:04'),(3,'作業A',NULL,3,0,'kani','::1','2019-01-17 16:54:04','2019-01-17 07:54:04'),(4,'作業B',NULL,4,0,'kani','::1','2019-01-17 16:54:04','2019-01-17 07:54:04'),(5,'搬出作業',NULL,5,0,'kani','::1','2019-01-17 16:54:04','2019-01-17 07:54:04');
/*!40000 ALTER TABLE `work_categorys` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-18 22:48:27
