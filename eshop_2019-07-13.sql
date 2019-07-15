# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.21)
# Database: eshop
# Generation Time: 2019-07-13 04:56:31 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(20) DEFAULT NULL,
  `admin_pass` varchar(32) DEFAULT NULL,
  `admin_role` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `admin_role` (`admin_role`),
  CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`admin_role`) REFERENCES `roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_pass`, `admin_role`)
VALUES
	(1,'admin','123456',1),
	(2,'peter','123456',2),
	(3,'sun','123456',3);

/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table funs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `funs`;

CREATE TABLE `funs` (
  `fun_id` int(11) NOT NULL AUTO_INCREMENT,
  `fun_name` varchar(200) DEFAULT NULL,
  `fun_url` varchar(200) DEFAULT NULL,
  `fun_pid` int(11) DEFAULT NULL,
  `fun_target` varchar(20) DEFAULT NULL,
  `fun_sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`fun_id`),
  KEY `fun_pid` (`fun_pid`),
  CONSTRAINT `funs_ibfk_1` FOREIGN KEY (`fun_pid`) REFERENCES `funs` (`fun_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `funs` WRITE;
/*!40000 ALTER TABLE `funs` DISABLE KEYS */;

INSERT INTO `funs` (`fun_id`, `fun_name`, `fun_url`, `fun_pid`, `fun_target`, `fun_sort`)
VALUES
	(1,'基础数据管理',NULL,NULL,NULL,2),
	(2,'订单管理',NULL,NULL,NULL,5),
	(3,'系统管理',NULL,NULL,NULL,9),
	(4,'商品信息维护','/admin/goods/search.do',1,'I2',NULL),
	(5,'商品类型维护','/admin/goodstype/search.do',1,'I2',NULL),
	(6,'未付款订单','/admin/order/search.do',2,'I2',NULL),
	(7,'已付款订单','/admin/order/search.do',2,'I2',NULL),
	(8,'退出','/adminlogin.jsp',3,'_top',NULL);

/*!40000 ALTER TABLE `funs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(200) DEFAULT NULL,
  `goods_price` float DEFAULT NULL,
  `goods_num` int(11) DEFAULT NULL,
  `goods_img` varchar(200) DEFAULT NULL,
  `goods_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`goods_id`),
  KEY `goods_type` (`goods_type`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`goods_type`) REFERENCES `goods_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 3072 kB; (`goods_type`) REFER `no8/goods_type`(';

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;

INSERT INTO `goods` (`goods_id`, `goods_name`, `goods_price`, `goods_num`, `goods_img`, `goods_type`)
VALUES
	(1,'Blackmores EPO月见草',230,97,'pro2.png',4),
	(2,'Swisse 澳洲活力胶原蛋白液',150,99,'pro3.png',4),
	(3,'Doppelherz 双心 补充毛囊防脱头发营养胶囊',159,100,'pro4.png',4),
	(4,'Swisse 发肤甲润泽口服液',209,99,'pro5.png',5),
	(5,'GNC 健安喜 女性胶原蛋白营养片',115,99,'pro6.png',5),
	(6,'HECH赫熙纯天然鱼子酱胶原蛋白肽粉胶囊',200,999,'pro7.png',5),
	(7,'EltaMD 氨基酸泡沫卸妆洁面乳',119,100,'pro21.png',4),
	(8,'Freeplus 芙丽芳丝 净润洗面霜 ',108,100,'pro21.png',4),
	(9,'SHISEIDO 资生堂 洗颜专科 超柔密泡泡洗面乳',46,100,'pro21.png',4),
	(10,'Freeplus 芙丽芳丝 净润洗面霜',99,100,'pro21.png',4),
	(11,'It\'S SKIN 伊思 美肌蜗牛修复洗面奶',115,100,'pro21.png',4),
	(12,'SHISEIDO 资生堂 洗颜专科 超柔密泡泡洗面乳 ',99,100,'pro21.png',4),
	(13,'SHISEIDO 资生堂 UNO 男士洗面奶 黑炭控油型',44,100,'pro21.png',4),
	(14,'Kanebo 佳丽宝 Suisai药用酵母酵素洗颜粉',115,100,'pro21.png',4),
	(15,'SHISEIDO 资生堂 UNO 男士泡沫快速洁面奶',48,99,'pro21.png',4),
	(16,'【3件装】Freeplus 芙丽芳丝 净润洗面霜',289,197,'pro21.png',4),
	(40,'4',4,4,'4',4);

/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table goods_img
# ------------------------------------------------------------

DROP TABLE IF EXISTS `goods_img`;

CREATE TABLE `goods_img` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `img_path` varchar(200) DEFAULT NULL,
  `img_goods` int(11) DEFAULT NULL,
  PRIMARY KEY (`img_id`),
  KEY `img_goods` (`img_goods`),
  CONSTRAINT `goods_img_ibfk_1` FOREIGN KEY (`img_goods`) REFERENCES `goods` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table goods_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `goods_type`;

CREATE TABLE `goods_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) DEFAULT NULL,
  `type_pid` int(11) DEFAULT NULL,
  `type_lv` int(11) DEFAULT NULL,
  `type_path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  KEY `type_pid` (`type_pid`),
  CONSTRAINT `goods_type_ibfk_1` FOREIGN KEY (`type_pid`) REFERENCES `goods_type` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `goods_type` WRITE;
/*!40000 ALTER TABLE `goods_type` DISABLE KEYS */;

INSERT INTO `goods_type` (`type_id`, `type_name`, `type_pid`, `type_lv`, `type_path`)
VALUES
	(1,'护肤',NULL,1,'|1|'),
	(2,'个人洗护',NULL,1,'|2|'),
	(3,'健康生活',NULL,1,'|3|'),
	(4,'面部洗护',1,2,'|1|4|'),
	(5,'眼部护理',1,2,'|1|5|'),
	(6,'唇部护理',1,2,'|1|6|'),
	(7,'祛斑祛痘',1,2,'|1|7|'),
	(8,'手足洗护',1,2,'|1|8|'),
	(9,'眼部护理',1,2,'|1|9|'),
	(10,'防晒修复',1,2,'|1|10|'),
	(11,'沐浴护肤',2,2,'|2|11|'),
	(12,'洗发护发',2,2,'|2|12|'),
	(13,'口腔护理',2,2,'|2|13|'),
	(14,'消毒液',3,2,'|3|14|'),
	(15,'洗洁精',3,2,'|3|15|'),
	(16,'测试',1,2,'|1||16|');

/*!40000 ALTER TABLE `goods_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;

INSERT INTO `order` (`id`, `name`, `gid`, `num`)
VALUES
	(13,'曾总',1,3),
	(14,'曾总',2,4),
	(15,'曾总',3,3),
	(16,'陈政',1,4),
	(17,'陈政',2,5),
	(18,'陈政',1,4),
	(19,'陈政',1,4),
	(20,'陈政',1,6),
	(21,'陈政',1,5),
	(22,'曾总',3,3);

/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_order` varchar(32) DEFAULT NULL,
  `detail_goods` int(11) DEFAULT NULL,
  `detail_price` float DEFAULT NULL,
  `detail_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `detail_order` (`detail_order`),
  KEY `detail_goods` (`detail_goods`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`detail_order`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`detail_goods`) REFERENCES `goods` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;

INSERT INTO `order_detail` (`detail_id`, `detail_order`, `detail_goods`, `detail_price`, `detail_num`)
VALUES
	(3,'cb4503ecddee4eb791433a0bdc2e6230',1,230,1),
	(4,'cb4503ecddee4eb791433a0bdc2e6230',6,115,1),
	(5,'cb4503ecddee4eb791433a0bdc2e6230',17,289,1),
	(6,'de0eaed5313d4ab3b2d1472e0c111f5c',16,48,1),
	(7,'7ac6913de5f14afba5265a24f2888657',5,209,1),
	(8,'4c3a55d9941f4bc4b644df0533d49007',17,289,1),
	(9,'4c3a55d9941f4bc4b644df0533d49007',1,230,1),
	(10,'17431d1ab0f34ff1ae48527a69fe05ee',1,230,1),
	(11,'17431d1ab0f34ff1ae48527a69fe05ee',17,289,1),
	(12,'caf164d0ee6c40d7bc4e11806fbcdee4',7,200,1),
	(13,'ded2f21e43244f29b567784c288ffc57',3,150,1);

/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_recipients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_recipients`;

CREATE TABLE `order_recipients` (
  `recipients_id` int(11) NOT NULL AUTO_INCREMENT,
  `recipients_name` varchar(200) DEFAULT NULL,
  `recipients_address` varchar(200) DEFAULT NULL,
  `recipients_phone` varchar(20) DEFAULT NULL,
  `recipients_user` int(11) DEFAULT NULL,
  `recipients_checked` int(11) DEFAULT NULL,
  PRIMARY KEY (`recipients_id`),
  KEY `recipients_user` (`recipients_user`),
  CONSTRAINT `order_recipients_ibfk_1` FOREIGN KEY (`recipients_user`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `order_recipients` WRITE;
/*!40000 ALTER TABLE `order_recipients` DISABLE KEYS */;

INSERT INTO `order_recipients` (`recipients_id`, `recipients_name`, `recipients_address`, `recipients_phone`, `recipients_user`, `recipients_checked`)
VALUES
	(1,'西施','春秋末期出生于越国苎萝村(今浙江省诸暨市苎萝村)','158XXXX8793',1,1),
	(2,'王昭君','西汉南郡秭归(今湖北省宜昌市兴山县)','137XXXX5762',1,0),
	(3,'貂蝉','东汉末年洛阳王司徒府','185XXXX3344',1,0),
	(4,'杨玉环','虢州阌乡(今河南灵宝)','187XXXX3232',1,0);

/*!40000 ALTER TABLE `order_recipients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_status`;

CREATE TABLE `order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;

INSERT INTO `order_status` (`order_status_id`, `order_status_name`)
VALUES
	(1,'报关中'),
	(2,'报关成功，待付款'),
	(3,'付款成功，即将发货'),
	(4,'已发货'),
	(5,'交易成功');

/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `order_id` varchar(32) NOT NULL,
  `order_user` int(11) DEFAULT NULL,
  `order_address` varchar(200) DEFAULT NULL,
  `order_phone` varchar(11) DEFAULT NULL,
  `order_name` varchar(20) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `order_price` double DEFAULT NULL,
  `order_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_user` (`order_user`),
  KEY `order_status` (`order_status`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`order_user`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`order_status`) REFERENCES `order_status` (`order_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`order_id`, `order_user`, `order_address`, `order_phone`, `order_name`, `order_status`, `order_price`, `order_time`)
VALUES
	('17431d1ab0f34ff1ae48527a69fe05ee',1,'西汉南郡秭归(今湖北省宜昌市兴山县)','137XXXX5762','王昭君',1,519,'2018-02-02 16:37:30'),
	('4c3a55d9941f4bc4b644df0533d49007',1,'东汉末年洛阳王司徒府','185XXXX3344','貂蝉',1,519,'2018-02-02 16:20:15'),
	('7ac6913de5f14afba5265a24f2888657',1,'东汉末年洛阳王司徒府','185XXXX3344','貂蝉',3,209,'2018-02-02 14:04:44'),
	('caf164d0ee6c40d7bc4e11806fbcdee4',1,'春秋末期出生于越国苎萝村(今浙江省诸暨市苎萝村)','158XXXX8793','西施',1,200,'2018-02-02 17:04:42'),
	('cb4503ecddee4eb791433a0bdc2e6230',1,'春秋末期出生于越国苎萝村(今浙江省诸暨市苎萝村)','158XXXX8793','西施',4,634,'2018-02-02 14:02:17'),
	('de0eaed5313d4ab3b2d1472e0c111f5c',1,'春秋末期出生于越国苎萝村(今浙江省诸暨市苎萝村)','158XXXX8793','西施',5,48,'2018-02-01 14:02:21'),
	('ded2f21e43244f29b567784c288ffc57',1,'春秋末期出生于越国苎萝村(今浙江省诸暨市苎萝村)','158XXXX8793','西施',1,150,'2018-02-02 17:05:47');

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `permission_role` int(11) DEFAULT NULL,
  `permission_fun` int(11) DEFAULT NULL,
  KEY `permission_role` (`permission_role`),
  KEY `permission_fun` (`permission_fun`),
  CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`permission_role`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `permissions_ibfk_2` FOREIGN KEY (`permission_fun`) REFERENCES `funs` (`fun_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;

INSERT INTO `permissions` (`permission_role`, `permission_fun`)
VALUES
	(1,1),
	(1,2),
	(1,3),
	(2,1),
	(2,3),
	(3,2),
	(3,3);

/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`role_id`, `role_name`)
VALUES
	(1,'超级管理员'),
	(2,'基础数据管理员'),
	(3,'订单管理员');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table shopitems
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shopitems`;

CREATE TABLE `shopitems` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_goods` int(11) DEFAULT NULL,
  `item_price` double DEFAULT NULL,
  `item_num` int(11) DEFAULT NULL,
  `item_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `item_user` (`item_user`),
  KEY `item_goods` (`item_goods`),
  CONSTRAINT `shopitems_ibfk_1` FOREIGN KEY (`item_user`) REFERENCES `users` (`user_id`),
  CONSTRAINT `shopitems_ibfk_2` FOREIGN KEY (`item_goods`) REFERENCES `goods` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `user_pass` varchar(32) DEFAULT NULL,
  `user_address` varchar(200) DEFAULT NULL,
  `user_phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`user_id`, `user_name`, `user_pass`, `user_address`, `user_phone`)
VALUES
	(1,'peter','123456','北京','15810848579'),
	(2,'sun','123456','天津','15810848579'),
	(3,'puma','123456','安阳','12345678901'),
	(5,'老张','123456','河南','13298309999'),
	(6,'MI2','123456','北京海淀','158XXXX1084'),
	(7,'王五','098098','天津','1238676'),
	(8,'qq','qq','qq','qq'),
	(32,'陈政','1294191169','成都信息工程大学','13708202587'),
	(33,'曾总','1622357726','清华大学','18781950548'),
	(37,'1','1','1','1'),
	(38,'abc','123456','成都信息工程大学','123');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
