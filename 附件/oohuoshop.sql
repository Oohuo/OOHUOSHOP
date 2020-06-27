/*
SQLyog Ultimate v12.3.1 (64 bit)
MySQL - 5.6.39-log : Database - shop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `shop`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact` varchar(32) NOT NULL COMMENT '收货人',
  `mobile` varchar(32) NOT NULL COMMENT '联系电话',
  `street` varchar(255) NOT NULL COMMENT '详细地址',
  `zipcode` varchar(32) DEFAULT NULL COMMENT '邮编',
  `mbr_id` int(11) NOT NULL COMMENT '所属会员',
  `default_value` tinyint(1) DEFAULT '0' COMMENT '是否为所属会员的默认收货地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `address` */

insert  into `address`(`id`,`contact`,`mobile`,`street`,`zipcode`,`mbr_id`,`default_value`) values 
(1,'张三','13902025678','湖南省岳阳市八字门居民点','300384',1,0),
(2,'李四','13702204321','湖南省长沙市湖南中医药大学含浦校区','300384',1,0),
(3,'王5','022-87188666','湖南省长沙市湖南中医药大学含浦校区','300384',1,1),
(5,'钱七','777','湖南省长沙市湖南中医药大学含浦校区','200020',2,1),
(6,'邹涵','1888888888','湖南中医药大学','410000',4,0),
(7,'1','1','1','1',4,1),
(8,'王悦青','15580082434','含浦','410100',13,1),
(9,'Han Zou','18867354218','湖南','410000',18,1),
(10,'邹涵','18867354218','湖南中医药大学','410000',24,0),
(11,'11','13519228418','11','410000',24,1);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL COMMENT '类目名称',
  `alias` varchar(64) DEFAULT NULL COMMENT '类目别名',
  `p_id` int(11) DEFAULT NULL COMMENT '父类目编号',
  `order_weight` int(11) DEFAULT NULL COMMENT '排序权重',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`alias`,`p_id`,`order_weight`) values 
(1,'手      机','shouji',NULL,10),
(2,'电脑办公','diannaobangong',NULL,10),
(3,'影音娱乐','yingyinyule',NULL,10),
(4,'家 电','xiaojiadian',NULL,10),
(6,'摄影器材','sheyingqicai',NULL,10),
(7,'酷玩潮品','yidong',NULL,10),
(8,'苹果','iphone',1,10),
(9,'联通手机','liantong',1,10),
(10,'电信手机','dianxin',1,10),
(11,'笔记本','bijiben',2,10),
(12,'台式机','taishiji',2,10),
(13,'数码影音','shumayingyin',3,10),
(14,'家庭影院','jiatingyingyuan',3,10),
(15,'个护电器','gehudianqi',4,10),
(16,'健康电器','jiankangdianqi',4,10),
(17,'冰箱','bingxiang',4,10),
(18,'空调','kongtiao',4,10),
(19,'洗衣机','xiyiji',4,10),
(20,'摄影摄像','sheyingshexiang',6,10),
(21,'摄影配件','sheyingpeijian',6,10),
(22,'潮品','chaopin',7,10),
(23,'学习','xuexi',7,10),
(24,'华为','huawei',1,10),
(26,'办公/DIY/五金电子','bangongdiywujindianzi',NULL,10);

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '所属订单编号',
  `product_id` int(11) NOT NULL COMMENT '商品编号',
  `amount` int(11) DEFAULT NULL COMMENT '单品数量',
  `total_price` decimal(9,2) DEFAULT NULL COMMENT '单品总价',
  `payment_price` decimal(9,2) DEFAULT NULL COMMENT '单品实付的总价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

/*Data for the table `item` */

insert  into `item`(`id`,`order_id`,`product_id`,`amount`,`total_price`,`payment_price`) values 
(1,1,3,2,1598.00,1398.00),
(2,1,14,1,999.00,999.00),
(3,2,12,2,6798.00,6198.00),
(4,2,15,2,1998.00,1998.00),
(5,3,6,4,800.00,672.00),
(6,4,16,3,8100.00,6000.00),
(7,5,22,1,6999.00,6530.00),
(8,6,17,1,1998.00,1500.00),
(9,7,24,1,1999.00,1500.00),
(10,8,15,1,999.00,999.00),
(11,9,6,4,800.00,672.00),
(12,10,25,1,6999.00,6850.00),
(13,11,2,1,5288.00,4880.00),
(14,12,6,1,200.00,168.00),
(15,12,25,1,6999.00,6850.00),
(16,13,6,1,200.00,168.00),
(17,15,26,1,8999.00,8700.00),
(18,16,17,1,1998.00,1500.00),
(19,16,6,1,200.00,168.00),
(20,16,23,1,2600.00,2300.00),
(21,16,26,1,8999.00,8700.00),
(22,17,9,1,12999.00,12999.00),
(23,17,10,1,8999.00,8999.00),
(24,17,12,1,3399.00,3099.00),
(25,17,14,1,999.00,999.00),
(26,18,19,1,399.00,350.00),
(27,18,24,1,1999.00,1500.00),
(28,19,26,1,8999.00,8700.00),
(29,20,24,1,1999.00,1500.00),
(30,21,23,1,2600.00,2300.00),
(31,22,18,1,150.00,130.00),
(32,23,17,1,1998.00,1500.00),
(33,24,15,1,999.00,999.00),
(34,25,25,1,6999.00,6850.00),
(35,26,24,1,1999.00,1500.00),
(36,26,25,1,6999.00,6850.00),
(37,27,26,1,8999.00,8700.00),
(38,28,24,1,1999.00,1500.00),
(39,29,4,2,3398.00,3398.00),
(40,30,25,1,329999.00,299999.00),
(41,31,9,1,12999.00,12999.00),
(42,32,5,1,5488.00,5288.00),
(43,33,22,1,39999.00,29999.00);

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(32) NOT NULL COMMENT '手机号',
  `pwd` varchar(32) NOT NULL COMMENT '密码',
  `nick_name` varchar(32) DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(32) DEFAULT NULL COMMENT '真实名',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱号',
  `gender` tinyint(1) DEFAULT '0' COMMENT '性别，默认值false',
  `register_time` datetime DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`id`,`mobile`,`pwd`,`nick_name`,`real_name`,`email`,`gender`,`register_time`) values 
(18,'2','ù','匿名',NULL,NULL,0,'2019-07-05 16:37:16'),
(19,'13907309999','½£½¼±','匿名',NULL,NULL,0,'2019-07-05 16:38:51'),
(20,'13544121231','ùúûüýþ','匿名',NULL,NULL,0,'2019-07-05 16:39:52'),
(21,'13602134567','¹¿­º¬®','匿名',NULL,NULL,0,'2019-07-05 16:40:30'),
(22,'13519228418','ùúû','匿名',NULL,NULL,0,'2019-07-07 09:19:29'),
(23,'18867354218','ù','匿名',NULL,NULL,0,'2019-07-07 10:26:09'),
(24,'18807309209','ùúû','邹涵','','',0,'2019-07-07 10:52:50');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `thumbnail` varchar(128) DEFAULT NULL COMMENT '主配图片',
  `content` longtext COMMENT '内容',
  `top` tinyint(1) DEFAULT '0' COMMENT '是否轮播图，默认值false',
  `hits` int(11) DEFAULT '0' COMMENT '阅读次数',
  `pub_time` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `news` */

insert  into `news`(`id`,`title`,`thumbnail`,`content`,`top`,`hits`,`pub_time`) values 
(1,'时尚云笔记本 联想小新Air 12低至2999','sliding-2.jpg','<p style=\"color:#666666;font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;\">\r\n	尊敬的各位网友：\r\n</p>\r\n<p style=\"color:#666666;font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#666666;font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;\">\r\n	联想小新系列笔记本一直以高性价比著称，在不久前问世的联想小新Air 12云笔记本近日正式登陆京东商城以及联想官方商城，即日起至7月7日9点59分，消费者可前往预约，该机售价2999元起，7月7日10点至7月9日10点正式开启抢购。截止7月17日前，购买小新Air 12笔记本并按要求晒单，最高可获得1年免费延保及领取潮流帆布电脑包，感兴趣的用户千万不要错过。\r\n</p>\r\n<p style=\"color:#666666;font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<p style=\"color:#666666;font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;\">\r\n	<span style=\"color:#666666;font-family:微软雅黑;font-size:14px;line-height:21px;background-color:#FFFFFF;\">卓讯</span>3C购物节也在同期正式开启。7月6日起，在配置方面，该机采用最新的英特尔第六代Skylake酷睿M处理器，相比上一代，CPU性能提升17%，图形处理能力提升35%。联想小新Air 12配备了SSD固态硬盘，迅猛的读写速度，轻松实现快速开机。此外，联想小新Air 12采用了无风扇设计，使机身几乎静音运行，加之更强的续航能力，日常使用更加轻松\r\n</p>\r\n<p style=\"color:#666666;font-family:微软雅黑;font-size:14px;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>\r\n<span style=\"color:#666666;font-family:微软雅黑;font-size:14px;line-height:28px;background-color:#FFFFFF;\">祝您购物愉快！</span>',1,0,'2019-07-03 01:04:09'),
(2,'悟 强大，超出想象','sliding-1.jpg','    大疆首次将高清图传，4K 360°云台相机，DJI GO 和多机互联技术高度集成到“悟”Inspire 1上，开启了4K影视航拍时代，后续推出的M4/3相机，\r\n无损4K RAW 视频录制，则进一步满足了专业影视的航拍需求。随着影视航拍技术的不断迭代，影视从业者对画质、续航、后期工作流等有了更高的要\r\n求。而两年间，DJI 大疆在飞行器、影像处理和机器视觉领域不断突破的同时，也对专业影视航拍有了全新的理解。\r\n\r\n“悟”Inspire 2影像处理平台CineCore 2.0全面升级为CineCore 2.1，搭配DJI 大疆全新推出的禅思X7相机，最高可录制6K CinemaDNG / RAW和5.2K Apple ProRes视频；\r\n动力系统全面提升，0-80 km/h所需加速时间仅为5秒，最大飞行速度可达94 km/h，最大下降速度可达9 m/s，诠释强劲机动性能；自加热双电池系统可提供最长\r\n31分钟续航时间（无负载），并轻松应对低温的挑战；最新FlightAutonomy系统，提供了关键传感器冗余和视觉避障能力；Spotlight Pro、动态返航点等多种智能拍摄、\r\n智能飞行功能，极大地拓展了创作空间；加之双频双通道图像传输、FPV摄像头、新一代多机互联技术、广播应用等一系列升级配置，使Inspire 2 变得超乎想象的强大。',1,0,'2019-07-03 01:04:09'),
(3,'HUAWEI P30 Pro 麒麟980 超感光徕卡四摄 屏内指纹 曲面屏 双景录像 ','sliding-3.jpg','\r\n<div style=\"text-align:left;\"><h1> <span>时空交融，</span><br >\r\n                    <span>光影成诗</span></h1></div>\r\n<p class=\"p30-p\">\r\n                    晨曦将启，赤色海天开始一日风情；<br >\r\n晴空盐湖，天空之境洗涤心灵；<br >\r\n滩边拾贝，于珠光映射中静享安宁；<br >\r\n极夜探索，绚烂极光下惊叹星空浩渺；<br >\r\n深夜终至，静谧夜色里安然入梦。<br >\r\nHUAWEI P30 Pro 以独特工艺定格时空交汇的光影<span class=\"nowrap\">艺术。</span>\r\n                </p>\r\n	<a href=\"http://www.oohuo.com:28080/OOHUOSHOP/product_detail?id=5\"><img src=\"https://res.vmallres.com/pimages/detailImg/2019/06/03/201906031457467976508.jpg\" alt=\"\">\r\n</a>',1,1,'2019-07-03 01:04:09');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(64) DEFAULT NULL COMMENT '订单号',
  `buyer_id` int(11) NOT NULL COMMENT '所属买家会员编号',
  `total_amount` int(11) DEFAULT NULL COMMENT '商品总数量',
  `total_price` decimal(9,2) DEFAULT NULL COMMENT '总的费用',
  `payment_price` decimal(9,2) DEFAULT NULL COMMENT '实付的费用',
  `remark` varchar(255) DEFAULT NULL COMMENT '买家留言',
  `contact` varchar(32) DEFAULT NULL COMMENT '收货人',
  `mobile` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `street` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `zipcode` varchar(32) DEFAULT NULL COMMENT '邮编',
  `create_time` datetime DEFAULT NULL COMMENT '下单时间',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL COMMENT '完成时间',
  `status` int(11) NOT NULL COMMENT '订单状态：0下单,1待付款,2已付款,3待发货,4已发货,5己收货,6已完成,-1已取消',
  PRIMARY KEY (`id`),
  UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`number`,`buyer_id`,`total_amount`,`total_price`,`payment_price`,`remark`,`contact`,`mobile`,`street`,`zipcode`,`create_time`,`payment_time`,`delivery_time`,`end_time`,`status`) values 
(19,'20190705100902500',4,1,8999.00,8700.00,'','1','1','1','1','2019-07-05 10:08:53',NULL,NULL,NULL,2),
(20,'20190705100912102',4,1,1999.00,1500.00,'','1','1','1','1','2019-07-05 10:09:11',NULL,NULL,NULL,2),
(21,'20190705100923615',4,1,2600.00,2300.00,'','1','1','1','1','2019-07-05 10:09:23',NULL,NULL,NULL,2),
(22,'20190705100931026',4,1,150.00,130.00,'','1','1','1','1','2019-07-05 10:09:30',NULL,NULL,NULL,2),
(23,'20190705100938417',4,1,1998.00,1500.00,'','1','1','1','1','2019-07-05 10:09:37',NULL,NULL,NULL,2),
(24,'20190705100948450',4,1,999.00,999.00,'','1','1','1','1','2019-07-05 10:09:48',NULL,NULL,NULL,2),
(25,'20190705101216509',4,1,6999.00,6850.00,'','1','1','1','1','2019-07-05 10:12:15',NULL,NULL,NULL,2),
(26,'20190705101645404',4,2,8998.00,8350.00,'','1','1','1','1','2019-07-05 10:16:44',NULL,NULL,NULL,2),
(27,'20190705164030236',4,1,8999.00,8700.00,'','1','1','1','1','2019-07-05 16:40:01',NULL,NULL,NULL,2),
(28,'20190706000759652',18,1,1999.00,1500.00,'行吧','Han Zou','18867354218','湖南','410000','2019-07-06 00:07:53',NULL,NULL,NULL,5),
(29,'20190706110509026',18,2,3398.00,3398.00,'','Han Zou','18867354218','湖南','410000','2019-07-06 11:04:29',NULL,NULL,NULL,-1),
(30,'20190706163240475',18,1,329999.00,299999.00,'发顺丰快递，谢谢','Han Zou','18867354218','湖南','410000','2019-07-06 16:32:15','2019-07-06 22:09:19','2019-07-06 22:09:24','2019-07-06 22:09:27',5),
(31,'20190706222540651',18,1,12999.00,12999.00,'发顺丰快递，谢谢','Han Zou','18867354218','湖南','410000','2019-07-06 22:25:29',NULL,NULL,NULL,-1),
(32,'20190707092232347',18,1,5488.00,5288.00,'123456','Han Zou','18867354218','湖南','410000','2019-07-07 09:22:14',NULL,NULL,NULL,5),
(33,'20190707105703341',24,1,39999.00,29999.00,'发顺丰谢谢','邹涵','18867354218','湖南中医药大学','410000','2019-07-07 10:56:35',NULL,NULL,NULL,5);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `cate_id` int(11) NOT NULL COMMENT '所属类目编号',
  `thumbnail` varchar(128) DEFAULT NULL COMMENT '主配图片',
  `inventory` int(11) DEFAULT '0' COMMENT '库存数量',
  `sales_volume` int(11) DEFAULT '0' COMMENT '售出数量',
  `price` decimal(9,2) DEFAULT '0.00' COMMENT '定价',
  `sale_price` decimal(9,2) DEFAULT '0.00' COMMENT '售价',
  `detail_description` mediumtext COMMENT '详情富文本描述',
  `selling_description` varchar(255) DEFAULT NULL COMMENT '卖点富文本描述',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `sale_time` datetime DEFAULT NULL COMMENT '开售时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`id`,`name`,`cate_id`,`thumbnail`,`inventory`,`sales_volume`,`price`,`sale_price`,`detail_description`,`selling_description`,`create_time`,`sale_time`) values 
(1,'诺基亚7代',9,'nokia.jpg',200,0,280.00,120.00,'<div style=\"text-align:center;\">\r\n<img src=\"./img/n1.jpg\" alt=\"\" />\r\n<img src=\"./img/n2.jpg\" alt=\"\" /> \r\n<img src=\"./img/n3.jpg\" alt=\"\" /> \r\n<img src=\"./img/n4.jpg\" alt=\"\" /> \r\n</div>','手机中的战斗机。待机时间15天。','2016-06-01 17:37:59','2016-06-03 18:50:00'),
(2,'iPhone Xr',8,'iphone6s.jpg',123,0,8999.00,8899.00,'<div style=\"text-align:center;\">\r\n<img src=\"./img/detail-1.jpg\" alt=\"\" />\n<img src=\"./img/detail-2.jpg\" alt=\"\" />\n<img src=\"./img/detail-3.jpg\" alt=\"\" />\n<img src=\"./img/detail-4.jpg\" alt=\"\" />\r\n</div>','','2016-06-01 22:38:11','2016-06-02 18:28:00'),
(3,'魅蓝3 礼盒版',9,'meinote3.jpg',100,0,799.00,699.00,'<div style=\"text-align:center;\">\r\n	<img src=\"./img/me1.jpg\" alt=\"\" />\n<img src=\"./img/me2.jpg\" alt=\"\" />\n<img src=\"./img/me3.jpg\" alt=\"\" />\n<img src=\"./img/me4.jpg\" alt=\"\" />\r\n</div>','<h1 style=\"font-size:16px;font-family:arial, \'microsoft yahei\';color:#666666;background-color:#FFFFFF;\">\r\n	全网通 4G手机 银白色 标配版(2G RAM+16G ROM)标配\r\n</h1>','2016-06-03 09:44:28','2016-06-05 09:40:00'),
(4,'小米Max',9,'xiaomi.jpg',1000,0,1699.00,1699.00,'<div style=\"text-align:center;\">\r\n	<img src=\"./img/mi-1.jpg\" alt=\"\" />\n<img src=\"./img/mi-2.jpg\" alt=\"\" />\n<img src=\"./img/mi-3.jpg\" alt=\"\" />\n<img src=\"./img/mi-4.jpg\" alt=\"\" />\n<img src=\"./img/mi-5.jpg\" alt=\"\" />\n<img src=\"./img/mi-6.jpg\" alt=\"\" /> \r\n</div>','<h1 style=\"font-size:16px;font-family:arial, \'microsoft yahei\';color:#666666;background-color:#FFFFFF;\">\r\n	4G手机 双卡双待 金色 全网通(3G RAM+32G ROM)标配\r\n</h1>','2016-06-03 09:50:25','2016-06-10 09:00:00'),
(5,'华为 P30 PRO',24,'huawei.jpg',2000,0,5488.00,5288.00,'<div style=\"text-align:center;\">\r\n	<img src=\"./img/hw-1.jpg\" alt=\"\" /> \r\n</div>','<h1 style=\"font-size:16px;font-family:arial, \'microsoft yahei\';color:#666666;background-color:#FFFFFF;\">\r\n	全网通 3GB+32GB版 流光金 移动联通电信4G手机 双卡双待\r\n</h1>','2016-06-03 09:54:00','2016-06-10 09:50:00'),
(7,'Apple MacBook Pro 13.3英寸笔记本电脑',11,'mbp.jpg',300,0,9288.00,9200.00,'<div style=\"text-align:center;\">\r\n	<img src=\"./img/mbp-1.jpg\" alt=\"\" />\n<img src=\"./img/mbp-2.jpg\" alt=\"\" />\r\n</div>','<h1 style=\"font-size:16px;font-family:arial, \'microsoft yahei\';color:#666666;background-color:#FFFFFF;\">\r\n	银色(Core i5 处理器/8GB内存/128GB SSD闪存/Retina屏 MF839CH/A)\r\n</h1>','2016-06-03 10:05:00','2016-06-03 10:03:00'),
(8,'ThinkPad X1 Carbon (20FBA00XCD) 14英寸超极笔记本电脑',11,'thinkpad-x1.jpg',300,0,9999.00,8999.00,'<div style=\"text-align:center;\">\r\n	<img src=\"./img/thinkpad-x1-1.jpg\" alt=\"\" />\r\n</div>','<h1 style=\"font-size:16px;font-family:arial, \'microsoft yahei\';color:#666666;background-color:#FFFFFF;\">\r\n	i5-6200U 8G 192GB SSD FHD IPS Win10 64位\r\n</h1>','2016-06-03 10:10:45','2016-06-03 10:09:00'),
(9,'外星人（Alienware）主机',11,'alienware.jpg',400,0,12999.00,12999.00,'<div style=\"text-align:center;\">\r\n	<img src=\"./img/alienware-1.jpg\" alt=\"\" /> <img src=\"./img/alienware-2.jpg\" alt=\"\" /> <img src=\"./img/alienware-3.jpg\" alt=\"\" /> \r\n</div>','<h1 style=\"font-size:16px;font-family:arial, \'microsoft yahei\';color:#666666;background-color:#FFFFFF;\">\r\n	（I7-6500U 8G 256GB SSD GTX 960M 4G独显 Win10）银\r\n</h1>','2016-06-03 10:31:11','2016-06-03 10:28:00'),
(10,'戴尔（DELL）XPS 13-9350-R1708 13.3英寸微边框笔记本电脑',11,'dell.jpg',125,0,8999.00,8999.00,'<div style=\"text-align:center;\">\r\n<img src=\"./img/dell-1.jpg\" alt=\"\" />\n<img src=\"./img/dell-2.jpg\" alt=\"\" />\n<img src=\"./img/dell-3.jpg\" alt=\"\" />\r\n</div>','<h1 style=\"font-size:16px;font-family:arial, \'microsoft yahei\';color:#666666;background-color:#FFFFFF;\">\r\n	（ i7-6500U 8G 256GSSD Win10）银\r\n</h1>','2016-06-03 10:34:08','2016-06-03 10:33:00'),
(11,'戴尔（DELL）Vostro 3800-R6308 台式电脑',12,'dell-desktop.jpg',1000,0,3699.00,3199.00,'<div style=\"text-align:center;\">\r\n	<img src=\"./img/dell-desktop-1.jpg\" alt=\"\" />\n<img src=\"./img/dell-desktop-2.jpg\" alt=\"\" />\r\n</div>','<h1 style=\"font-size:16px;font-family:arial, \'microsoft yahei\';color:#666666;background-color:#FFFFFF;\">\r\n	（i3-4170 4G 500G DVD 三年上门 三年硬盘保留Win7）黑\r\n</h1>','2016-06-03 10:39:46','2016-06-03 10:38:00'),
(12,'联想（Lenovo）H3050台式电脑',12,'lenovo.jpg',1000,0,3399.00,3099.00,'<div style=\"text-align:center;\">\r\n	<img src=\"./img/lenovo-1.jpg\" alt=\"\" />\n<img src=\"./img/lenovo-2.jpg\" alt=\"\" />\r\n</div>','<h1 style=\"font-size:16px;font-family:arial, \'microsoft yahei\';color:#666666;background-color:#FFFFFF;\">\r\n	（i3-4170 4G 500G 集显 DVD 千兆网卡 Win10）20英寸\r\n</h1>','2016-06-03 10:43:17','2016-06-03 10:42:00'),
(13,'Apple iPad ',11,'ipad.png',600,0,6499.00,6299.00,'<div style=\"text-align:center;\">\r\n<img src=\"./img/ipad-1.jpg\" alt=\"\" />\n<img src=\"./img/ipad-2.jpg\" alt=\"\" />\n<img src=\"./img/ipad-3.jpg\" alt=\"\" />\r\n</div>','<h1 style=\"font-size:16px;font-family:arial, \'microsoft yahei\';color:#666666;background-color:#FFFFFF;\">\r\n	（64G WLAN版/A8芯片/Retina显示屏/Touch ID技术 MK9J2CH）金色\r\n</h1>','2016-06-03 10:46:54','2016-06-03 10:45:00'),
(14,'小米（XIAOMI）平板电脑2 WIFI版 7.9英寸',11,'mipad.jpg',400,0,999.00,999.00,'<div style=\"text-align:center;\">\r\n	<img src=\"./img/mipad-1.jpg\" alt=\"\" />\n<img src=\"./img/mipad-2.jpg\" alt=\"\" />\n<img src=\"./img/mipad-3.jpg\" alt=\"\" />\n<img src=\"./img/mipad-4.jpg\" alt=\"\" />\n<img src=\"./img/mipad-5.jpg\" alt=\"\" /><br />\r\n</div>','<h1 style=\"font-size:16px;font-family:arial, \'microsoft yahei\';color:#666666;background-color:#FFFFFF;\">\r\n	（Intel Z8500 2G/16G 500W/800W）香槟金\r\n</h1>','2016-06-03 10:52:14','2016-06-03 10:50:00'),
(15,'乐视（Letv）乐1S 太子妃版 32GB 银色 移动联通4G手机 双卡双待',9,'letv.jpg',666,0,999.00,999.00,'<div style=\"text-align:center;\">\r\n<img src=\"./img/letv-1.jpg\" alt=\"\" />\r\n<img src=\"./img/letv-2.jpg\" alt=\"\" />\r\n<img src=\"./img/letv-3.jpg\" alt=\"\" />\r\n</div>','<span style=\"color:#E3393C;font-family:arial, \'microsoft yahei\';font-size:14px;line-height:20px;background-color:#FFFFFF;\">镜面指纹识别+快速充电+八核处理器+3GB+32GB内存！</span>','2016-06-03 11:04:39','2016-06-03 11:03:00'),
(16,'创维（Skyworth）55X5 55英寸 六核智能酷开网络平板液晶电视(黑色)',14,'dajiadian01.jpg',100,100,2700.00,2000.00,'<div style=\"text-align:center;\">\r\n<img src=\"./img/dajiadian0101.jpg\" alt=\"\" />\r\n<img src=\"./img/dajiadian0102.jpg\" alt=\"\" />\r\n<img src=\"./img/dajiadian0103.jpg\" alt=\"\" />\r\n<img src=\"./img/dajiadian0104.jpg\" alt=\"\" />\r\n<img src=\"./img/dajiadian0105.jpg\" alt=\"\" />\r\n</div>',NULL,'2016-07-05 15:59:00','2016-07-05 15:59:05'),
(17,'Beats 蓝牙耳机头戴式 无线耳麦手机耳机',13,'yingyinyule01.jpg',100,100,6999.00,4999.00,'<div style=\"text-align:center;\">\r\n<img src=\"./img/yingyinyule0101.jpg\" alt=\"\" />\r\n<img src=\"./img/yingyinyule0102.jpg\" alt=\"\" />\r\n<img src=\"./img/yingyinyule0103.jpg\" alt=\"\" />\r\n</div>',NULL,'2016-07-06 11:21:38','2016-07-06 11:21:41'),
(18,'Edifier/漫步者 R101V笔记本电脑音响 多媒体台式小音箱2.1低音炮',13,'yingyinyule02.jpg',100,100,150.00,130.00,'<div style=\"text-align:center;\">\r\n<img src=\"./img/yingyinyule0201.jpg\" alt=\"\" />\r\n<img src=\"./img/yingyinyule0202.jpg\" alt=\"\" />\r\n<img src=\"./img/yingyinyule0203.jpg\" alt=\"\" />\r\n</div>',NULL,'2016-07-06 11:23:25','2016-07-06 11:23:28'),
(19,'inphic/英菲克 I9 8核网络机顶盒无线高清硬盘播放器八核电视盒子',14,'yingyinyule03.jpg',100,50,399.00,350.00,'<div style=\"text-align:center;\">\r\n<img src=\"./img/yingyinyule0301.jpg\" alt=\"\" />\r\n<img src=\"./img/yingyinyule0302.jpg\" alt=\"\" />\r\n<img src=\"./img/yingyinyule0303.jpg\" alt=\"\" />\r\n</div>',NULL,'2016-07-06 13:47:05','2016-07-06 13:47:09'),
(20,'飞利浦电动剃须刀S5080充电式全身水洗多功能三刀头S5000系列',15,'xiaojiadian01.jpg',500,50,699.00,599.00,'<div style=\"text-align:center;\">\r\n<img src=\"./img/xiaojiadian0101.jpg\" alt=\"\" />\r\n<img src=\"./img/xiaojiadian0102.jpg\" alt=\"\" />\r\n<img src=\"./img/xiaojiadian0103.jpg\" alt=\"\" />\r\n</div>',NULL,'2016-07-06 13:56:17','2016-07-06 13:56:20'),
(21,'格力加湿器 家用静音 卧室迷你小型 办公室空气净化大雾量增湿器',16,'xiaojiadian02.jpg',500,50,799.00,599.00,'<div style=\"text-align:center;\">\r\n<img src=\"./img/xiaojiadian0201.jpg\" alt=\"\" />\r\n<img src=\"./img/xiaojiadian0202.jpg\" alt=\"\" />\r\n<img src=\"./img/xiaojiadian0203.jpg\" alt=\"\" />\r\n</div>',NULL,'2016-07-06 13:59:09','2016-07-06 13:59:11'),
(22,'SIEMENS/西门子 BCD-610W(KA82NV06TI)双开门双门对开门电冰箱',17,'bingxiang01.jpg',500,50,39999.00,29999.00,'<div style=\"text-align:center;\">\r\n<img src=\"./img/bingxiang0101.jpg\" alt=\"\" />\r\n<img src=\"./img/bingxiang0102.jpg\" alt=\"\" />\r\n<img src=\"./img/bingxiang0103.jpg\" alt=\"\" />\r\n<img src=\"./img/bingxiang0104.jpg\" alt=\"\" />\r\n<img src=\"./img/bingxiang0105.jpg\" alt=\"\" />\r\n</div>',NULL,'2016-07-06 14:09:33','2016-07-06 14:09:36'),
(23,'卡萨帝中央空调 云玺',18,'kongtiao01.jpg',500,100,69999.00,64999.00,'<div style=\"text-align:center;\">\r\n<img src=\"./img/kongtiao0101.jpg\" alt=\"\" />\r\n<img src=\"./img/kongtiao0102.jpg\" alt=\"\" />\r\n<img src=\"./img/kongtiao0103.jpg\" alt=\"\" />\r\n<img src=\"./img/kongtiao0104.jpg\" alt=\"\" />\r\n<img src=\"./img/kongtiao0105.jpg\" alt=\"\" />\r\n</div>',NULL,'2016-07-06 14:33:15','2016-07-06 14:33:18'),
(24,'卡萨帝纤见PLUS洗衣机',19,'xiyiji01.jpg',500,500,49999.00,47999.00,'<div style=\"text-align:center;\">\r\n<img src=\"./img/xiyiji0101.jpg\" alt=\"\" />\r\n<img src=\"./img/xiyiji0102.jpg\" alt=\"\" /> \r\n<img src=\"./img/xiyiji0103.jpg\" alt=\"\" /> \r\n\r\n</div>',NULL,'2016-07-06 14:34:57','2016-07-06 14:35:00'),
(25,'单反外观Sony/索尼 DSC-H400数码照相机 4亿像素',20,'sheyingshexiang01.jpg',500,500,329999.00,299999.00,'<div style=\"text-align:center;\">\r\n<img src=\"./img/sheyingshexiang0101.jpg\" alt=\"\" />\r\n<img src=\"./img/sheyingshexiang0102.jpg\" alt=\"\" />\r\n<img src=\"./img/sheyingshexiang0103.jpg\" alt=\"\" />\r\n<img src=\"./img/sheyingshexiang0104.jpg\" alt=\"\" />\r\n</div>',NULL,'2016-07-06 14:42:39','2016-07-06 14:42:41'),
(26,'大疆 LD-XF 60',22,'chaopin01.jpg',500,500,49999.00,48999.00,'<div style=\"text-align:center;\">\r\n<img src=\"./img/chaopin0101.jpg\" alt=\"\" />\r\n<img src=\"./img/chaopin0101.jpg\" alt=\"\" />\r\n<img src=\"./img/chaopin0101.jpg\" alt=\"\" />\r\n<img src=\"./img/chaopin0102.jpg\" alt=\"\" />\r\n<img src=\"./img/chaopin0103.jpg\" alt=\"\" />\r\n<img src=\"./img/chaopin0104.jpg\" alt=\"\" />\r\n<img src=\"./img/chaopin0105.jpg\" alt=\"\" />\r\n<img src=\"./img/chaopin0106.jpg\" alt=\"\" />\r\n</div>',NULL,'2016-07-06 15:24:18','2016-07-06 15:24:20');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
