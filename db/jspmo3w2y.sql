-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: localhost    Database: jspmo3w2y
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `name` varchar(200) NOT NULL COMMENT '收货人',
  `phone` varchar(200) NOT NULL COMMENT '电话',
  `isdefault` varchar(200) NOT NULL COMMENT '是否默认地址[是/否]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'2021-04-20 03:57:34',1,'宇宙银河系金星1号','金某','13823888881','是'),(2,'2021-04-20 03:57:34',2,'宇宙银河系木星1号','木某','13823888882','是'),(3,'2021-04-20 03:57:34',3,'宇宙银河系水星1号','水某','13823888883','是'),(4,'2021-04-20 03:57:34',4,'宇宙银河系火星1号','火某','13823888884','是'),(5,'2021-04-20 03:57:34',5,'宇宙银河系土星1号','土某','13823888885','是'),(6,'2021-04-20 03:57:34',6,'宇宙银河系月球1号','月某','13823888886','是');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tablename` varchar(200) DEFAULT 'jianshenshangpin' COMMENT '商品表名',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `picture` varchar(200) DEFAULT NULL COMMENT '图片',
  `buynumber` int(11) NOT NULL COMMENT '购买数量',
  `price` float DEFAULT NULL COMMENT '单价',
  `discountprice` float DEFAULT NULL COMMENT '会员价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `adminid` bigint(20) DEFAULT NULL COMMENT '管理员id',
  `ask` longtext COMMENT '提问',
  `reply` longtext COMMENT '回复',
  `isreply` int(11) DEFAULT NULL COMMENT '是否回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='在线客服';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (81,'2021-04-20 03:57:34',1,1,'提问1','回复1',1),(82,'2021-04-20 03:57:34',2,2,'提问2','回复2',2),(83,'2021-04-20 03:57:34',3,3,'提问3','回复3',3),(84,'2021-04-20 03:57:34',4,4,'提问4','回复4',4),(85,'2021-04-20 03:57:34',5,5,'提问5','回复5',5),(86,'2021-04-20 03:57:34',6,6,'提问6','回复6',6);
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='配置文件';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'picture1','http://localhost:8080/jspmo3w2y/upload/picture1.jpg'),(2,'picture2','http://localhost:8080/jspmo3w2y/upload/picture2.jpg'),(3,'picture3','http://localhost:8080/jspmo3w2y/upload/picture3.jpg'),(6,'homepage',NULL);
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussjianshenjiaolian`
--

DROP TABLE IF EXISTS `discussjianshenjiaolian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussjianshenjiaolian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COMMENT='健身教练评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussjianshenjiaolian`
--

LOCK TABLES `discussjianshenjiaolian` WRITE;
/*!40000 ALTER TABLE `discussjianshenjiaolian` DISABLE KEYS */;
INSERT INTO `discussjianshenjiaolian` VALUES (141,'2021-04-20 03:57:34',1,1,'用户名1','评论内容1','回复内容1'),(142,'2021-04-20 03:57:34',2,2,'用户名2','评论内容2','回复内容2'),(143,'2021-04-20 03:57:34',3,3,'用户名3','评论内容3','回复内容3'),(144,'2021-04-20 03:57:34',4,4,'用户名4','评论内容4','回复内容4'),(145,'2021-04-20 03:57:34',5,5,'用户名5','评论内容5','回复内容5'),(146,'2021-04-20 03:57:34',6,6,'用户名6','评论内容6','回复内容6');
/*!40000 ALTER TABLE `discussjianshenjiaolian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussjianshenkecheng`
--

DROP TABLE IF EXISTS `discussjianshenkecheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussjianshenkecheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COMMENT='健身课程评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussjianshenkecheng`
--

LOCK TABLES `discussjianshenkecheng` WRITE;
/*!40000 ALTER TABLE `discussjianshenkecheng` DISABLE KEYS */;
INSERT INTO `discussjianshenkecheng` VALUES (151,'2021-04-20 03:57:34',1,1,'用户名1','评论内容1','回复内容1'),(152,'2021-04-20 03:57:34',2,2,'用户名2','评论内容2','回复内容2'),(153,'2021-04-20 03:57:34',3,3,'用户名3','评论内容3','回复内容3'),(154,'2021-04-20 03:57:34',4,4,'用户名4','评论内容4','回复内容4'),(155,'2021-04-20 03:57:34',5,5,'用户名5','评论内容5','回复内容5'),(156,'2021-04-20 03:57:34',6,6,'用户名6','评论内容6','回复内容6');
/*!40000 ALTER TABLE `discussjianshenkecheng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discussjianshenshangpin`
--

DROP TABLE IF EXISTS `discussjianshenshangpin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussjianshenshangpin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint(20) NOT NULL COMMENT '关联表id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COMMENT='健身商品评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussjianshenshangpin`
--

LOCK TABLES `discussjianshenshangpin` WRITE;
/*!40000 ALTER TABLE `discussjianshenshangpin` DISABLE KEYS */;
INSERT INTO `discussjianshenshangpin` VALUES (161,'2021-04-20 03:57:34',1,1,'用户名1','评论内容1','回复内容1'),(162,'2021-04-20 03:57:34',2,2,'用户名2','评论内容2','回复内容2'),(163,'2021-04-20 03:57:34',3,3,'用户名3','评论内容3','回复内容3'),(164,'2021-04-20 03:57:34',4,4,'用户名4','评论内容4','回复内容4'),(165,'2021-04-20 03:57:34',5,5,'用户名5','评论内容5','回复内容5'),(166,'2021-04-20 03:57:34',6,6,'用户名6','评论内容6','回复内容6');
/*!40000 ALTER TABLE `discussjianshenshangpin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum`
--

DROP TABLE IF EXISTS `forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) DEFAULT NULL COMMENT '帖子标题',
  `content` longtext NOT NULL COMMENT '帖子内容',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父节点id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `isdone` varchar(200) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='健身交流';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum`
--

LOCK TABLES `forum` WRITE;
/*!40000 ALTER TABLE `forum` DISABLE KEYS */;
INSERT INTO `forum` VALUES (91,'2021-04-20 03:57:34','帖子标题1','帖子内容1',1,1,'用户名1','开放'),(92,'2021-04-20 03:57:34','帖子标题2','帖子内容2',2,2,'用户名2','开放'),(93,'2021-04-20 03:57:34','帖子标题3','帖子内容3',3,3,'用户名3','开放'),(94,'2021-04-20 03:57:34','帖子标题4','帖子内容4',4,4,'用户名4','开放'),(95,'2021-04-20 03:57:34','帖子标题5','帖子内容5',5,5,'用户名5','开放'),(96,'2021-04-20 03:57:34','帖子标题6','帖子内容6',6,6,'用户名6','开放');
/*!40000 ALTER TABLE `forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jianshenjiaolian`
--

DROP TABLE IF EXISTS `jianshenjiaolian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jianshenjiaolian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaoliangonghao` varchar(200) NOT NULL COMMENT '教练工号',
  `jiaolianxingming` varchar(200) DEFAULT NULL COMMENT '教练姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `nianling` varchar(200) DEFAULT NULL COMMENT '年龄',
  `shengao` varchar(200) DEFAULT NULL COMMENT '身高',
  `tizhong` varchar(200) DEFAULT NULL COMMENT '体重',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  `zhiyelvli` longtext COMMENT '职业履历',
  `gerenjieshao` longtext COMMENT '个人介绍',
  `thumbsupnum` int(11) DEFAULT '0' COMMENT '赞',
  `crazilynum` int(11) DEFAULT '0' COMMENT '踩',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='健身教练';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jianshenjiaolian`
--

LOCK TABLES `jianshenjiaolian` WRITE;
/*!40000 ALTER TABLE `jianshenjiaolian` DISABLE KEYS */;
INSERT INTO `jianshenjiaolian` VALUES (21,'2021-04-20 03:57:34','教练工号1','教练姓名1','男','年龄1','身高1','体重1','http://localhost:8080/jspmo3w2y/upload/jianshenjiaolian_zhaopian1.jpg','职业履历1','个人介绍1',1,1),(22,'2021-04-20 03:57:34','教练工号2','教练姓名2','男','年龄2','身高2','体重2','http://localhost:8080/jspmo3w2y/upload/jianshenjiaolian_zhaopian2.jpg','职业履历2','个人介绍2',2,2),(23,'2021-04-20 03:57:34','教练工号3','教练姓名3','男','年龄3','身高3','体重3','http://localhost:8080/jspmo3w2y/upload/jianshenjiaolian_zhaopian3.jpg','职业履历3','个人介绍3',3,3),(24,'2021-04-20 03:57:34','教练工号4','教练姓名4','男','年龄4','身高4','体重4','http://localhost:8080/jspmo3w2y/upload/jianshenjiaolian_zhaopian4.jpg','职业履历4','个人介绍4',4,4),(25,'2021-04-20 03:57:34','教练工号5','教练姓名5','男','年龄5','身高5','体重5','http://localhost:8080/jspmo3w2y/upload/jianshenjiaolian_zhaopian5.jpg','职业履历5','个人介绍5',5,5),(26,'2021-04-20 03:57:34','教练工号6','教练姓名6','男','年龄6','身高6','体重6','http://localhost:8080/jspmo3w2y/upload/jianshenjiaolian_zhaopian6.jpg','职业履历6','个人介绍6',6,6);
/*!40000 ALTER TABLE `jianshenjiaolian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jianshenkecheng`
--

DROP TABLE IF EXISTS `jianshenkecheng`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jianshenkecheng` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengbianhao` varchar(200) NOT NULL COMMENT '课程编号',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `jianshenleixing` varchar(200) DEFAULT NULL COMMENT '健身类型',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  `jiaoliangonghao` varchar(200) DEFAULT NULL COMMENT '教练工号',
  `jiaolianxingming` varchar(200) DEFAULT NULL COMMENT '教练姓名',
  `shangkeshijian` varchar(200) DEFAULT NULL COMMENT '上课时间',
  `shangkedidian` varchar(200) DEFAULT NULL COMMENT '上课地点',
  `kechengjieshao` longtext COMMENT '课程介绍',
  `kechengfeiyong` int(11) DEFAULT NULL COMMENT '课程费用',
  `thumbsupnum` int(11) DEFAULT '0' COMMENT '赞',
  `crazilynum` int(11) DEFAULT '0' COMMENT '踩',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kechengbianhao` (`kechengbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='健身课程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jianshenkecheng`
--

LOCK TABLES `jianshenkecheng` WRITE;
/*!40000 ALTER TABLE `jianshenkecheng` DISABLE KEYS */;
INSERT INTO `jianshenkecheng` VALUES (31,'2021-04-20 03:57:34','课程编号1','课程名称1','健身类型1','http://localhost:8080/jspmo3w2y/upload/jianshenkecheng_tupian1.jpg','教练工号1','教练姓名1','上课时间1','上课地点1','课程介绍1',1,1,1),(32,'2021-04-20 03:57:34','课程编号2','课程名称2','健身类型2','http://localhost:8080/jspmo3w2y/upload/jianshenkecheng_tupian2.jpg','教练工号2','教练姓名2','上课时间2','上课地点2','课程介绍2',2,2,2),(33,'2021-04-20 03:57:34','课程编号3','课程名称3','健身类型3','http://localhost:8080/jspmo3w2y/upload/jianshenkecheng_tupian3.jpg','教练工号3','教练姓名3','上课时间3','上课地点3','课程介绍3',3,3,3),(34,'2021-04-20 03:57:34','课程编号4','课程名称4','健身类型4','http://localhost:8080/jspmo3w2y/upload/jianshenkecheng_tupian4.jpg','教练工号4','教练姓名4','上课时间4','上课地点4','课程介绍4',4,4,4),(35,'2021-04-20 03:57:34','课程编号5','课程名称5','健身类型5','http://localhost:8080/jspmo3w2y/upload/jianshenkecheng_tupian5.jpg','教练工号5','教练姓名5','上课时间5','上课地点5','课程介绍5',5,5,5),(36,'2021-04-20 03:57:34','课程编号6','课程名称6','健身类型6','http://localhost:8080/jspmo3w2y/upload/jianshenkecheng_tupian6.jpg','教练工号6','教练姓名6','上课时间6','上课地点6','课程介绍6',6,6,6);
/*!40000 ALTER TABLE `jianshenkecheng` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jianshenshangpin`
--

DROP TABLE IF EXISTS `jianshenshangpin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jianshenshangpin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shangpinmingcheng` varchar(200) NOT NULL COMMENT '商品名称',
  `shangpinzhonglei` varchar(200) NOT NULL COMMENT '商品种类',
  `shangpintupian` varchar(200) NOT NULL COMMENT '商品图片',
  `shangpinjiage` int(11) NOT NULL COMMENT '商品价格',
  `guige` varchar(200) DEFAULT NULL COMMENT '规格',
  `baozhiqi` varchar(200) DEFAULT NULL COMMENT '保质期',
  `zuoyong` longtext COMMENT '作用',
  `shangpinxiangqing` longtext COMMENT '商品详情',
  `thumbsupnum` int(11) DEFAULT '0' COMMENT '赞',
  `crazilynum` int(11) DEFAULT '0' COMMENT '踩',
  `price` float NOT NULL COMMENT '价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='健身商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jianshenshangpin`
--

LOCK TABLES `jianshenshangpin` WRITE;
/*!40000 ALTER TABLE `jianshenshangpin` DISABLE KEYS */;
INSERT INTO `jianshenshangpin` VALUES (51,'2021-04-20 03:57:34','商品名称1','商品种类1','http://localhost:8080/jspmo3w2y/upload/jianshenshangpin_shangpintupian1.jpg',1,'规格1','保质期1','作用1','商品详情1',1,1,99.9),(52,'2021-04-20 03:57:34','商品名称2','商品种类2','http://localhost:8080/jspmo3w2y/upload/jianshenshangpin_shangpintupian2.jpg',2,'规格2','保质期2','作用2','商品详情2',2,2,99.9),(53,'2021-04-20 03:57:34','商品名称3','商品种类3','http://localhost:8080/jspmo3w2y/upload/jianshenshangpin_shangpintupian3.jpg',3,'规格3','保质期3','作用3','商品详情3',3,3,99.9),(54,'2021-04-20 03:57:34','商品名称4','商品种类4','http://localhost:8080/jspmo3w2y/upload/jianshenshangpin_shangpintupian4.jpg',4,'规格4','保质期4','作用4','商品详情4',4,4,99.9),(55,'2021-04-20 03:57:34','商品名称5','商品种类5','http://localhost:8080/jspmo3w2y/upload/jianshenshangpin_shangpintupian5.jpg',5,'规格5','保质期5','作用5','商品详情5',5,5,99.9),(56,'2021-04-20 03:57:34','商品名称6','商品种类6','http://localhost:8080/jspmo3w2y/upload/jianshenshangpin_shangpintupian6.jpg',6,'规格6','保质期6','作用6','商品详情6',6,6,99.9);
/*!40000 ALTER TABLE `jianshenshangpin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jianshenzhishi`
--

DROP TABLE IF EXISTS `jianshenzhishi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jianshenzhishi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `wenzhangbiaoti` varchar(200) DEFAULT NULL COMMENT '文章标题',
  `wenzhangbianhao` varchar(200) DEFAULT NULL COMMENT '文章编号',
  `tupianfengmian` varchar(200) DEFAULT NULL COMMENT '图片封面',
  `jianshenleixing` varchar(200) DEFAULT NULL COMMENT '健身类型',
  `wenzhangneirong` longtext COMMENT '文章内容',
  `fabushijian` date DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wenzhangbianhao` (`wenzhangbianhao`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='健身知识';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jianshenzhishi`
--

LOCK TABLES `jianshenzhishi` WRITE;
/*!40000 ALTER TABLE `jianshenzhishi` DISABLE KEYS */;
INSERT INTO `jianshenzhishi` VALUES (41,'2021-04-20 03:57:34','文章标题1','文章编号1','http://localhost:8080/jspmo3w2y/upload/jianshenzhishi_tupianfengmian1.jpg','健身类型1','文章内容1','2021-04-20'),(42,'2021-04-20 03:57:34','文章标题2','文章编号2','http://localhost:8080/jspmo3w2y/upload/jianshenzhishi_tupianfengmian2.jpg','健身类型2','文章内容2','2021-04-20'),(43,'2021-04-20 03:57:34','文章标题3','文章编号3','http://localhost:8080/jspmo3w2y/upload/jianshenzhishi_tupianfengmian3.jpg','健身类型3','文章内容3','2021-04-20'),(44,'2021-04-20 03:57:34','文章标题4','文章编号4','http://localhost:8080/jspmo3w2y/upload/jianshenzhishi_tupianfengmian4.jpg','健身类型4','文章内容4','2021-04-20'),(45,'2021-04-20 03:57:34','文章标题5','文章编号5','http://localhost:8080/jspmo3w2y/upload/jianshenzhishi_tupianfengmian5.jpg','健身类型5','文章内容5','2021-04-20'),(46,'2021-04-20 03:57:34','文章标题6','文章编号6','http://localhost:8080/jspmo3w2y/upload/jianshenzhishi_tupianfengmian6.jpg','健身类型6','文章内容6','2021-04-20');
/*!40000 ALTER TABLE `jianshenzhishi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kechenggoumai`
--

DROP TABLE IF EXISTS `kechenggoumai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kechenggoumai` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengbianhao` varchar(200) NOT NULL COMMENT '课程编号',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `jianshenleixing` varchar(200) DEFAULT NULL COMMENT '健身类型',
  `tupian` varchar(200) DEFAULT NULL COMMENT '图片',
  `jiaoliangonghao` varchar(200) DEFAULT NULL COMMENT '教练工号',
  `jiaolianxingming` varchar(200) DEFAULT NULL COMMENT '教练姓名',
  `shangkeshijian` varchar(200) DEFAULT NULL COMMENT '上课时间',
  `shangkedidian` varchar(200) DEFAULT NULL COMMENT '上课地点',
  `goumaishijian` datetime DEFAULT NULL COMMENT '购买时间',
  `kechengfeiyong` varchar(200) DEFAULT NULL COMMENT '课程费用',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `ispay` varchar(200) DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='课程购买';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kechenggoumai`
--

LOCK TABLES `kechenggoumai` WRITE;
/*!40000 ALTER TABLE `kechenggoumai` DISABLE KEYS */;
INSERT INTO `kechenggoumai` VALUES (71,'2021-04-20 03:57:34','课程编号1','课程名称1','健身类型1','http://localhost:8080/jspmo3w2y/upload/kechenggoumai_tupian1.jpg','教练工号1','教练姓名1','上课时间1','上课地点1','2021-04-20 11:57:34','课程费用1','账号1','姓名1','未支付'),(72,'2021-04-20 03:57:34','课程编号2','课程名称2','健身类型2','http://localhost:8080/jspmo3w2y/upload/kechenggoumai_tupian2.jpg','教练工号2','教练姓名2','上课时间2','上课地点2','2021-04-20 11:57:34','课程费用2','账号2','姓名2','未支付'),(73,'2021-04-20 03:57:34','课程编号3','课程名称3','健身类型3','http://localhost:8080/jspmo3w2y/upload/kechenggoumai_tupian3.jpg','教练工号3','教练姓名3','上课时间3','上课地点3','2021-04-20 11:57:34','课程费用3','账号3','姓名3','未支付'),(74,'2021-04-20 03:57:34','课程编号4','课程名称4','健身类型4','http://localhost:8080/jspmo3w2y/upload/kechenggoumai_tupian4.jpg','教练工号4','教练姓名4','上课时间4','上课地点4','2021-04-20 11:57:34','课程费用4','账号4','姓名4','未支付'),(75,'2021-04-20 03:57:34','课程编号5','课程名称5','健身类型5','http://localhost:8080/jspmo3w2y/upload/kechenggoumai_tupian5.jpg','教练工号5','教练姓名5','上课时间5','上课地点5','2021-04-20 11:57:34','课程费用5','账号5','姓名5','未支付'),(76,'2021-04-20 03:57:34','课程编号6','课程名称6','健身类型6','http://localhost:8080/jspmo3w2y/upload/kechenggoumai_tupian6.jpg','教练工号6','教练姓名6','上课时间6','上课地点6','2021-04-20 11:57:34','课程费用6','账号6','姓名6','未支付');
/*!40000 ALTER TABLE `kechenggoumai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `orderid` varchar(200) NOT NULL COMMENT '订单编号',
  `tablename` varchar(200) DEFAULT 'jianshenshangpin' COMMENT '商品表名',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `goodid` bigint(20) NOT NULL COMMENT '商品id',
  `goodname` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `picture` varchar(200) DEFAULT NULL COMMENT '商品图片',
  `buynumber` int(11) NOT NULL COMMENT '购买数量',
  `price` float NOT NULL DEFAULT '0' COMMENT '价格/积分',
  `discountprice` float DEFAULT '0' COMMENT '折扣价格',
  `total` float NOT NULL DEFAULT '0' COMMENT '总价格/总积分',
  `discounttotal` float DEFAULT '0' COMMENT '折扣总价格',
  `type` int(11) DEFAULT '1' COMMENT '支付类型',
  `status` varchar(200) DEFAULT NULL COMMENT '状态',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `tel` varchar(200) DEFAULT NULL COMMENT '电话',
  `consignee` varchar(200) DEFAULT NULL COMMENT '收货人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderid` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storeup`
--

DROP TABLE IF EXISTS `storeup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storeup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `refid` bigint(20) DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) NOT NULL COMMENT '收藏图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收藏表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storeup`
--

LOCK TABLES `storeup` WRITE;
/*!40000 ALTER TABLE `storeup` DISABLE KEYS */;
/*!40000 ALTER TABLE `storeup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='token表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abo','abo','管理员','2021-04-20 03:57:34');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yonghu`
--

DROP TABLE IF EXISTS `yonghu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yonghu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `zhanghao` varchar(200) NOT NULL COMMENT '账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `lianxidianhua` varchar(200) DEFAULT NULL COMMENT '联系电话',
  `lianxiyouxiang` varchar(200) DEFAULT NULL COMMENT '联系邮箱',
  `shenfenzhenghao` varchar(200) DEFAULT NULL COMMENT '身份证号',
  `zhaopian` varchar(200) DEFAULT NULL COMMENT '照片',
  `money` float DEFAULT '0' COMMENT '余额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhanghao` (`zhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yonghu`
--

LOCK TABLES `yonghu` WRITE;
/*!40000 ALTER TABLE `yonghu` DISABLE KEYS */;
INSERT INTO `yonghu` VALUES (11,'2021-04-20 03:57:34','用户1','123456','姓名1','男','13823888881','773890001@qq.com','440300199101010001','http://localhost:8080/jspmo3w2y/upload/yonghu_zhaopian1.jpg',100),(12,'2021-04-20 03:57:34','用户2','123456','姓名2','男','13823888882','773890002@qq.com','440300199202020002','http://localhost:8080/jspmo3w2y/upload/yonghu_zhaopian2.jpg',100),(13,'2021-04-20 03:57:34','用户3','123456','姓名3','男','13823888883','773890003@qq.com','440300199303030003','http://localhost:8080/jspmo3w2y/upload/yonghu_zhaopian3.jpg',100),(14,'2021-04-20 03:57:34','用户4','123456','姓名4','男','13823888884','773890004@qq.com','440300199404040004','http://localhost:8080/jspmo3w2y/upload/yonghu_zhaopian4.jpg',100),(15,'2021-04-20 03:57:34','用户5','123456','姓名5','男','13823888885','773890005@qq.com','440300199505050005','http://localhost:8080/jspmo3w2y/upload/yonghu_zhaopian5.jpg',100),(16,'2021-04-20 03:57:34','用户6','123456','姓名6','男','13823888886','773890006@qq.com','440300199606060006','http://localhost:8080/jspmo3w2y/upload/yonghu_zhaopian6.jpg',100);
/*!40000 ALTER TABLE `yonghu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yuyuejiaolian`
--

DROP TABLE IF EXISTS `yuyuejiaolian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yuyuejiaolian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jiaoliangonghao` varchar(200) NOT NULL COMMENT '教练工号',
  `jiaolianxingming` varchar(200) DEFAULT NULL COMMENT '教练姓名',
  `nianling` varchar(200) DEFAULT NULL COMMENT '年龄',
  `yuyueshijian` datetime DEFAULT NULL COMMENT '预约时间',
  `zhanghao` varchar(200) DEFAULT NULL COMMENT '账号',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COMMENT='预约教练';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yuyuejiaolian`
--

LOCK TABLES `yuyuejiaolian` WRITE;
/*!40000 ALTER TABLE `yuyuejiaolian` DISABLE KEYS */;
INSERT INTO `yuyuejiaolian` VALUES (61,'2021-04-20 03:57:34','教练工号1','教练姓名1','年龄1','2021-04-20 11:57:34','账号1','姓名1'),(62,'2021-04-20 03:57:34','教练工号2','教练姓名2','年龄2','2021-04-20 11:57:34','账号2','姓名2'),(63,'2021-04-20 03:57:34','教练工号3','教练姓名3','年龄3','2021-04-20 11:57:34','账号3','姓名3'),(64,'2021-04-20 03:57:34','教练工号4','教练姓名4','年龄4','2021-04-20 11:57:34','账号4','姓名4'),(65,'2021-04-20 03:57:34','教练工号5','教练姓名5','年龄5','2021-04-20 11:57:34','账号5','姓名5'),(66,'2021-04-20 03:57:34','教练工号6','教练姓名6','年龄6','2021-04-20 11:57:34','账号6','姓名6');
/*!40000 ALTER TABLE `yuyuejiaolian` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-20 14:57:07
