-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: squid
-- ------------------------------------------------------
-- Server version	5.5.53-0+deb8u1

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
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `elapse` float DEFAULT NULL,
  `remotehost` varchar(160) NOT NULL DEFAULT '',
  `country` varchar(32) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `code` varchar(12) DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `bytes` int(11) DEFAULT NULL,
  `method` varchar(12) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `rfc931` varchar(12) DEFAULT NULL,
  `hierarchy_peerhost` varchar(32) DEFAULT NULL,
  `type` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`,`remotehost`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
INSERT INTO `access` VALUES (1,'2017-04-26 14:58:18',387694,'58.42.222.2','China','Guiyang','TCP_MISS_ABO',NULL,NULL,0,'GET','http://m.search.yahoo.com/','-','HIER_DIRECT/m.search.yahoo.com','-'),(2,'2017-04-26 14:58:18',449371,'187.193.165.1','Mexico',NULL,'TCP_MISS/503',NULL,NULL,0,'CONNECT','www.deezer.com:443','-','HIER_NONE/-','-'),(3,'2017-04-26 14:58:35',16849,'104.131.68.130','United States','New York','TCP_MISS_ABO',NULL,NULL,0,'GET','http://aaron.com.es/scripts/proxy-info.php','-','HIER_DIRECT/aaron.com.es','-'),(4,'2017-04-26 16:17:53',70,'195.208.220.159','Russia',NULL,'TCP_MISS/200',NULL,NULL,312,'GET','http://chekfast.zennolab.com/proxy.php','-','HIER_DIRECT/chekfast.zennolab.co','text/html'),(5,'2017-04-26 16:18:06',991,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4401,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(6,'2017-04-26 16:18:24',959,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4438,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(7,'2017-04-26 16:18:25',915,'37.237.144.16','Iraq',NULL,'TCP_MISS/200',NULL,NULL,3404,'CONNECT','authserver.mojang.com:443','-','HIER_DIRECT/authserver.mojang.co','-'),(8,'2017-04-26 16:18:26',37,'46.159.148.69','Russia',NULL,'TCP_MISS/200',NULL,NULL,276,'GET','http://www.msftncsi.com/ncsi.txt','-','HIER_DIRECT/www.msftncsi.com','text/plain'),(9,'2017-04-26 16:18:26',44,'46.159.148.69','Russia',NULL,'TCP_MISS/302',NULL,NULL,576,'GET','http://ya.ru/','-','HIER_DIRECT/ya.ru','-'),(10,'2017-04-26 16:18:26',0,'46.159.148.69','Russia',NULL,'TAG_NONE/400',NULL,NULL,4003,'NONE','error:invalid-request','-','HIER_NONE/-','text/html'),(11,'2017-04-26 16:18:28',1497,'93.79.148.21','Ukraine','Kherson','TCP_MISS/200',NULL,NULL,828,'POST','http://ledmagaz.ru/bitrix/admin/?login=yes','-','HIER_DIRECT/ledmagaz.ru','text/html'),(12,'2017-04-26 16:18:29',2227,'46.159.148.69','Russia',NULL,'TCP_MISS/200',NULL,NULL,6795,'CONNECT','microsoft.com:443','-','HIER_DIRECT/microsoft.com','-'),(13,'2017-04-26 16:18:29',2389,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4438,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(14,'2017-04-26 16:18:31',2376,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4401,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(15,'2017-04-26 16:18:32',884,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4401,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(16,'2017-04-26 16:18:35',1019,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4401,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(17,'2017-04-26 16:18:37',842,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4401,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(18,'2017-04-26 16:18:40',1694,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4401,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(19,'2017-04-26 16:18:40',1768,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4417,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(20,'2017-04-26 16:18:41',182,'52.166.249.182','United States','Wilmington','TCP_MISS/200',NULL,NULL,734,'GET','http://judge.kupit-proxy.ru/judge/httpGet/','-','HIER_DIRECT/judge.kupit-proxy.ru','application/'),(21,'2017-04-26 16:18:42',528,'52.166.249.182','United States','Wilmington','TCP_MISS/200',NULL,NULL,337,'CONNECT','judge.kupit-proxy.ru:443','-','HIER_DIRECT/judge.kupit-proxy.ru','-'),(22,'2017-04-26 16:18:42',2652,'140.205.144.66','China','Hangzhou','TCP_MISS/200',NULL,NULL,106386,'GET','http://www.dianping.com/shop/49254040','-','HIER_DIRECT/www.dianping.com','text/html'),(23,'2017-04-26 16:18:42',1987,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4438,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(24,'2017-04-26 16:18:43',1492,'140.205.144.135','China','Hangzhou','TCP_MISS/200',NULL,NULL,94775,'GET','http://www.dianping.com/shop/18535315/review_more?pageno=1','-','HIER_DIRECT/www.dianping.com','text/html'),(25,'2017-04-26 16:18:43',1417,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4401,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(26,'2017-04-26 16:18:44',1967,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4401,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(27,'2017-04-26 16:18:45',362,'51.15.71.134','United Kingdom',NULL,'TCP_MISS/200',NULL,NULL,278,'GET','http://statistics.helllab.org/service/gate.php?mode=check_proxy&client_ip=51.15.71.134&proxy_type=http&proxy=88.151.112.3:8080','-','HIER_DIRECT/statistics.helllab.o','text/html'),(28,'2017-04-26 16:18:45',2305,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,5350,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(29,'2017-04-26 16:18:46',1297,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4438,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(30,'2017-04-26 16:18:46',1507,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4401,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(31,'2017-04-26 16:18:46',1288,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4401,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(32,'2017-04-26 16:18:47',1473,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4417,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(33,'2017-04-26 16:18:47',1058,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4401,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(34,'2017-04-26 16:18:49',1325,'140.205.144.87','China','Hangzhou','TCP_MISS/200',NULL,NULL,139728,'GET','http://www.dianping.com/shop/41355811','-','HIER_DIRECT/www.dianping.com','text/html'),(35,'2017-04-26 16:18:49',2,'59.139.190.92','Japan',NULL,'TCP_MISS/200',NULL,NULL,276,'GET','http://www.msftncsi.com/ncsi.txt','-','HIER_DIRECT/www.msftncsi.com','text/plain'),(36,'2017-04-26 16:18:50',23,'59.139.190.92','Japan',NULL,'TCP_MISS/302',NULL,NULL,576,'GET','http://ya.ru/','-','HIER_DIRECT/ya.ru','-'),(37,'2017-04-26 16:18:51',0,'59.139.190.92','Japan',NULL,'TAG_NONE/400',NULL,NULL,4003,'NONE','error:invalid-request','-','HIER_NONE/-','text/html'),(38,'2017-04-26 16:18:56',1867,'59.139.190.92','Japan',NULL,'TCP_MISS/200',NULL,NULL,6795,'CONNECT','microsoft.com:443','-','HIER_DIRECT/microsoft.com','-'),(39,'2017-04-26 16:18:56',3712,'140.205.144.184','China','Hangzhou','TCP_MISS/200',NULL,NULL,93975,'GET','http://www.dianping.com/shop/22564302/review_more?pageno=1','-','HIER_DIRECT/www.dianping.com','text/html'),(40,'2017-04-26 16:18:56',1182,'140.205.144.53','China','Hangzhou','TCP_MISS/200',NULL,NULL,105230,'GET','http://www.dianping.com/shop/48834929','-','HIER_DIRECT/www.dianping.com','text/html'),(41,'2017-04-26 16:18:58',1318,'140.205.144.87','China','Hangzhou','TCP_MISS/200',NULL,NULL,140701,'GET','http://www.dianping.com/shop/45490403','-','HIER_DIRECT/www.dianping.com','text/html'),(42,'2017-04-26 16:19:00',1327,'140.205.144.94','China','Hangzhou','TCP_MISS/200',NULL,NULL,140279,'GET','http://www.dianping.com/shop/48676892','-','HIER_DIRECT/www.dianping.com','text/html'),(43,'2017-04-26 16:19:01',316,'52.23.169.35','United States','Ashburn','TCP_MISS/200',NULL,NULL,386,'GET','http://whatismyip.elegantproxies.net/','-','HIER_DIRECT/whatismyip.elegantpr','text/plain'),(44,'2017-04-26 16:19:02',1897,'140.205.144.122','China','Hangzhou','TCP_MISS/200',NULL,NULL,109437,'GET','http://www.dianping.com/shop/57064654','-','HIER_DIRECT/www.dianping.com','text/html'),(45,'2017-04-26 16:19:03',734,'89.248.160.69','Netherlands',NULL,'TCP_MISS/200',NULL,NULL,666,'CONNECT','accounts.ea.com:443','-','HIER_DIRECT/accounts.ea.com','-'),(46,'2017-04-26 16:19:04',1000,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4401,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(47,'2017-04-26 16:19:05',1288,'140.205.144.210','China','Hangzhou','TCP_MISS/200',NULL,NULL,93398,'GET','http://www.dianping.com/shop/12735565/review_more?pageno=1','-','HIER_DIRECT/www.dianping.com','text/html'),(48,'2017-04-26 16:19:08',0,'52.166.249.182','United States','Wilmington','TAG_NONE/400',NULL,NULL,4017,'NONE','error:invalid-request','-','HIER_NONE/-','text/html'),(49,'2017-04-26 16:19:08',3809,'140.205.144.154','China','Hangzhou','TCP_MISS/200',NULL,NULL,108325,'GET','http://www.dianping.com/shop/48740852','-','HIER_DIRECT/www.dianping.com','text/html'),(50,'2017-04-26 16:19:09',2,'78.160.23.130','Turkey','Ankara','TCP_MISS/200',NULL,NULL,276,'GET','http://www.msftncsi.com/ncsi.txt','-','HIER_DIRECT/www.msftncsi.com','text/plain'),(51,'2017-04-26 16:19:10',1836,'140.205.144.193','China','Hangzhou','TCP_MISS/200',NULL,NULL,143787,'GET','http://www.dianping.com/shop/45515883','-','HIER_DIRECT/www.dianping.com','text/html'),(52,'2017-04-26 16:19:10',4631,'52.166.249.182','United States','Wilmington','TCP_MISS/200',NULL,NULL,150250,'CONNECT','www.facebook.com:443','-','HIER_DIRECT/www.facebook.com','-'),(53,'2017-04-26 16:19:12',3,'207.154.227.213','United States','Los Angeles','TCP_MISS/200',NULL,NULL,276,'GET','http://www.msftncsi.com/ncsi.txt','-','HIER_DIRECT/www.msftncsi.com','text/plain'),(54,'2017-04-26 16:19:13',26,'207.154.227.213','United States','Los Angeles','TCP_MISS/302',NULL,NULL,576,'GET','http://ya.ru/','-','HIER_DIRECT/ya.ru','-'),(55,'2017-04-26 16:19:13',0,'207.154.227.213','United States','Los Angeles','TAG_NONE/400',NULL,NULL,4005,'NONE','error:invalid-request','-','HIER_NONE/-','text/html'),(56,'2017-04-26 16:19:16',3,'5.2.75.243','Netherlands',NULL,'TCP_MISS/200',NULL,NULL,276,'GET','http://www.msftncsi.com/ncsi.txt','-','HIER_DIRECT/www.msftncsi.com','text/plain'),(57,'2017-04-26 16:19:19',50,'140.205.144.154','China','Hangzhou','TCP_MISS/503',NULL,NULL,4063,'GET','http://www.dianping.comhttp/www.dianping.com/shop/11528448','-','HIER_NONE/-','text/html'),(58,'2017-04-26 16:19:19',10906,'140.205.144.10','China','Hangzhou','TCP_MISS/200',NULL,NULL,113566,'CONNECT','www.dianping.com:443','-','HIER_DIRECT/www.dianping.com','-'),(59,'2017-04-26 16:19:19',21,'5.2.75.243','Netherlands',NULL,'TCP_MISS/302',NULL,NULL,576,'GET','http://ya.ru/','-','HIER_DIRECT/ya.ru','-'),(60,'2017-04-26 16:19:20',0,'52.166.249.182','United States','Wilmington','TAG_NONE/400',NULL,NULL,4017,'NONE','error:invalid-request','-','HIER_NONE/-','text/html'),(61,'2017-04-26 16:19:20',0,'5.2.75.243','Netherlands',NULL,'TAG_NONE/400',NULL,NULL,4000,'NONE','error:invalid-request','-','HIER_NONE/-','text/html'),(62,'2017-04-26 16:19:20',6868,'207.154.227.213','United States','Los Angeles','TCP_MISS/200',NULL,NULL,6795,'CONNECT','microsoft.com:443','-','HIER_DIRECT/microsoft.com','-'),(63,'2017-04-26 16:19:20',2,'83.234.183.166','Russia','Nyandoma','TCP_MISS/200',NULL,NULL,276,'GET','http://www.msftncsi.com/ncsi.txt','-','HIER_DIRECT/www.msftncsi.com','text/plain'),(64,'2017-04-26 16:19:20',1288,'140.205.144.137','China','Hangzhou','TCP_MISS/200',NULL,NULL,91814,'GET','http://www.dianping.com/shop/22501077/review_more?pageno=1','-','HIER_DIRECT/www.dianping.com','text/html'),(65,'2017-04-26 16:19:21',1674,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4401,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(66,'2017-04-26 16:19:21',1461,'140.205.144.210','China','Hangzhou','TCP_MISS/200',NULL,NULL,108797,'GET','http://www.dianping.com/shop/50011635','-','HIER_DIRECT/www.dianping.com','text/html'),(67,'2017-04-26 16:19:21',1540,'162.254.207.68','United States','Lewes','TCP_MISS/200',NULL,NULL,4784,'CONNECT','signup.netflix.com:443','-','HIER_DIRECT/signup.netflix.com','-'),(68,'2017-04-26 16:19:23',2543,'5.2.75.243','Netherlands',NULL,'TCP_MISS/200',NULL,NULL,6795,'CONNECT','microsoft.com:443','-','HIER_DIRECT/microsoft.com','-'),(69,'2017-04-26 16:19:24',885,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4438,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(70,'2017-04-26 16:19:25',3738,'162.254.207.68','United States','Lewes','TCP_MISS/200',NULL,NULL,4773,'CONNECT','www.netflix.com:443','-','HIER_DIRECT/www.netflix.com','-'),(71,'2017-04-26 16:19:26',5331,'176.100.189.161','Ukraine',NULL,'TCP_MISS_ABO',NULL,NULL,0,'GET','http://check2.zennolab.com/proxy.php','-','HIER_DIRECT/check2.zennolab.com','-'),(72,'2017-04-26 16:19:31',2024,'93.79.148.21','Ukraine','Kherson','TCP_MISS/200',NULL,NULL,4654,'POST','http://lifeofgame.ru/admin.php','-','HIER_DIRECT/lifeofgame.ru','text/html'),(73,'2017-04-26 16:19:31',2797,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4401,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(74,'2017-04-26 16:19:32',3461,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4417,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(75,'2017-04-26 16:19:32',6495,'162.254.207.68','United States','Lewes','TCP_MISS/200',NULL,NULL,164817,'CONNECT','www.netflix.com:443','-','HIER_DIRECT/www.netflix.com','-'),(76,'2017-04-26 16:19:32',908,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4401,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(77,'2017-04-26 16:19:33',804,'52.166.249.182','United States','Wilmington','TCP_MISS/200',NULL,NULL,14705,'CONNECT','www.instagram.com:443','-','HIER_DIRECT/www.instagram.com','-'),(78,'2017-04-26 16:19:35',841,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4438,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(79,'2017-04-26 16:19:36',826,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4401,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-'),(80,'2017-04-26 16:19:39',701,'181.113.34.21','Ecuador','Quito','TCP_MISS/503',NULL,NULL,3602,'GET','http://images.google.com/','-','HIER_NONE/-','text/html'),(81,'2017-04-26 16:19:39',6910,'162.254.207.68','United States','Lewes','TCP_MISS/200',NULL,NULL,163595,'CONNECT','www.netflix.com:443','-','HIER_DIRECT/www.netflix.com','-'),(82,'2017-04-26 16:19:40',1474,'47.59.166.5','Spain','Madrid','TCP_MISS/200',NULL,NULL,4401,'CONNECT','api-global.netflix.com:443','-','HIER_DIRECT/api-global.netflix.c','-');
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL,
  `action` varchar(20) DEFAULT NULL,
  `filenum` varchar(100) DEFAULT NULL,
  `http_reply_code` varchar(100) DEFAULT NULL,
  `http_date` varchar(100) DEFAULT NULL,
  `http_expires` varchar(26) DEFAULT NULL,
  `http_content_type` varchar(26) DEFAULT NULL,
  `size` varchar(26) DEFAULT NULL,
  `method` varchar(12) DEFAULT NULL,
  `url` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`url`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'2017-04-26 16:17:53','RELEASE','FFFFFFFF','200','1493237956','-1','text/html','-1/93','GET','http://chekfast.zennolab.com/proxy.php'),(2,'2017-04-26 16:18:26','RELEASE','FFFFFFFF','200','1493237975','1493238005','text/plain','14/14','GET','http://www.msftncsi.com/ncsi.txt'),(3,'2017-04-26 16:18:26','RELEASE','FFFFFFFF','302','1493237975','1493237975','unknown','0/0','GET','http://ya.ru/'),(4,'2017-04-26 16:18:26','RELEASE','FFFFFFFF','400','1493237906','-1','text/html','3656/3656','NONE','error:invalid-request'),(5,'2017-04-26 16:18:28','RELEASE','FFFFFFFF','200','1493237977','375007920','text/html','191/191','POST','http://ledmagaz.ru/bitrix/admin/?login=yes'),(6,'2017-04-26 16:18:41','RELEASE','FFFFFFFF','200','1493237985','-1','application/json','473/473','GET','http://judge.kupit-proxy.ru/judge/httpGet/'),(7,'2017-04-26 16:18:42','RELEASE','FFFFFFFF','200','1493237990','-1','text/html','105656/105656','GET','http://www.dianping.com/shop/49254040'),(8,'2017-04-26 16:18:43','RELEASE','FFFFFFFF','200','1493237990','-1','text/html','94069/94069','GET','http://www.dianping.com/shop/18535315/review_more?pageno=1'),(9,'2017-04-26 16:18:45','RELEASE','FFFFFFFF','200','1493237993','1493237993','text/html','-1/0','GET','http://statistics.helllab.org/service/gate.php?mode=check_proxy&client_ip=51.15.71.134&proxy_type=http&proxy=88.151.112.3:8080'),(10,'2017-04-26 16:18:49','RELEASE','FFFFFFFF','200','1493237997','1493237928','text/html','139004/139004','GET','http://www.dianping.com/shop/41355811'),(11,'2017-04-26 16:18:49','RELEASE','FFFFFFFF','200','1493237998','1493238028','text/plain','14/14','GET','http://www.msftncsi.com/ncsi.txt'),(12,'2017-04-26 16:18:50','RELEASE','FFFFFFFF','302','1493237999','1493237999','unknown','0/0','GET','http://ya.ru/'),(13,'2017-04-26 16:18:51','RELEASE','FFFFFFFF','400','1493237931','-1','text/html','3656/3656','NONE','error:invalid-request'),(14,'2017-04-26 16:18:56','RELEASE','FFFFFFFF','200','1493238001','-1','text/html','93269/93269','GET','http://www.dianping.com/shop/22564302/review_more?pageno=1'),(15,'2017-04-26 16:18:56','RELEASE','FFFFFFFF','200','1493238004','-1','text/html','104498/104498','GET','http://www.dianping.com/shop/48834929'),(16,'2017-04-26 16:18:58','RELEASE','FFFFFFFF','200','1493238006','1493237937','text/html','139982/139982','GET','http://www.dianping.com/shop/45490403'),(17,'2017-04-26 16:19:00','RELEASE','FFFFFFFF','200','1493238008','1493237939','text/html','139559/139559','GET','http://www.dianping.com/shop/48676892'),(18,'2017-04-26 16:19:01','RELEASE','FFFFFFFF','200','1493237992','1493237941','text/plain','13/13','GET','http://whatismyip.elegantproxies.net/'),(19,'2017-04-26 16:19:02','RELEASE','FFFFFFFF','200','1493238009','-1','text/html','108707/108707','GET','http://www.dianping.com/shop/57064654'),(20,'2017-04-26 16:19:05','RELEASE','FFFFFFFF','200','1493238013','-1','text/html','92691/92691','GET','http://www.dianping.com/shop/12735565/review_more?pageno=1'),(21,'2017-04-26 16:19:08','RELEASE','FFFFFFFF','400','1493237948','-1','text/html','3670/3670','NONE','error:invalid-request'),(22,'2017-04-26 16:19:08','RELEASE','FFFFFFFF','200','1493238013','-1','text/html','107593/107593','GET','http://www.dianping.com/shop/48740852'),(23,'2017-04-26 16:19:09','RELEASE','FFFFFFFF','200','1493238018','1493238048','text/plain','14/14','GET','http://www.msftncsi.com/ncsi.txt'),(24,'2017-04-26 16:19:10','RELEASE','FFFFFFFF','200','1493238017','1493237949','text/html','143068/143068','GET','http://www.dianping.com/shop/45515883'),(25,'2017-04-26 16:19:12','RELEASE','FFFFFFFF','200','1493238021','1493238051','text/plain','14/14','GET','http://www.msftncsi.com/ncsi.txt'),(26,'2017-04-26 16:19:13','RELEASE','FFFFFFFF','302','1493238021','1493238021','unknown','0/0','GET','http://ya.ru/'),(27,'2017-04-26 16:19:13','RELEASE','FFFFFFFF','400','1493237953','-1','text/html','3658/3658','NONE','error:invalid-request'),(28,'2017-04-26 16:19:16','RELEASE','FFFFFFFF','200','1493238025','1493238055','text/plain','14/14','GET','http://www.msftncsi.com/ncsi.txt'),(29,'2017-04-26 16:19:19','RELEASE','FFFFFFFF','503','1493237959','-1','text/html','3706/3706','GET','http://www.dianping.comhttp/www.dianping.com/shop/11528448'),(30,'2017-04-26 16:19:19','RELEASE','FFFFFFFF','302','1493238028','1493238028','unknown','0/0','GET','http://ya.ru/'),(31,'2017-04-26 16:19:20','RELEASE','FFFFFFFF','400','1493237960','-1','text/html','3670/3670','NONE','error:invalid-request'),(32,'2017-04-26 16:19:20','RELEASE','FFFFFFFF','400','1493237960','-1','text/html','3653/3653','NONE','error:invalid-request'),(33,'2017-04-26 16:19:20','RELEASE','FFFFFFFF','200','1493238029','1493238059','text/plain','14/14','GET','http://www.msftncsi.com/ncsi.txt'),(34,'2017-04-26 16:19:20','RELEASE','FFFFFFFF','200','1493238028','-1','text/html','91027/91027','GET','http://www.dianping.com/shop/22501077/review_more?pageno=1'),(35,'2017-04-26 16:19:21','RELEASE','FFFFFFFF','200','1493238028','-1','text/html','108066/108066','GET','http://www.dianping.com/shop/50011635'),(36,'2017-04-26 16:19:26','RELEASE','FFFFFFFF','0','-1','-1','unknown','-1/-1','GET','http://check2.zennolab.com/proxy.php'),(37,'2017-04-26 16:19:31','RELEASE','FFFFFFFF','200','1493238039','375007920','text/html','-1/3425','POST','http://lifeofgame.ru/admin.php'),(38,'2017-04-26 16:19:39','RELEASE','FFFFFFFF','503','1493237979','-1','text/html','3245/3245','GET','http://images.google.com/');
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-26 16:34:16