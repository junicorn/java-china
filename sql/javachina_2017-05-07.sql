# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.15)
# Database: javachina
# Generation Time: 2017-05-07 10:16:07 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table t_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_codes`;

CREATE TABLE `t_codes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `code` varchar(64) NOT NULL,
  `type` varchar(10) NOT NULL COMMENT 'signup:注册 reset:修改密码',
  `is_use` tinyint(2) NOT NULL DEFAULT '0',
  `created` int(10) NOT NULL COMMENT '创建时间',
  `expired` int(10) NOT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`),
  KEY `idx_uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `t_codes` WRITE;
/*!40000 ALTER TABLE `t_codes` DISABLE KEYS */;

INSERT INTO `t_codes` (`id`, `uid`, `code`, `type`, `is_use`, `created`, `expired`)
VALUES
	(3,13,'u0ZWmxmZwoIV1EdtjOVxYVSXEFqrBz9f','signup',1,1458573501,1458577101),
	(5,13,'KF8ESHQdXxNDr1s8K4yMtfZzp5zjLeXR','forgot',0,1458657013,1458660613),
	(6,13,'U0dXQqVDMZOjpcRI10bztWJ5OZao1GqL','forgot',0,1458657182,1458660782),
	(7,15,'qujfVnBpxjF5FhsmH58geIeXH4naX3AH','signup',0,1460193554,1460197154),
	(8,16,'w2HOu3fvH9YclLBysdPdYeYkzp66ceq7','signup',0,1460193639,1460197239),
	(9,17,'Md5B7Ob0Gw6ItSsrUZoCijY2I76Hy8Ic','signup',0,1460298710,1460302310),
	(10,6,'Ptm6jISYk2ZMXhJI2Uo1YzFwxhkaircl','signup',1,1460639261,1460642861),
	(11,7,'iVCQcRrto0az2n5YaNuPMeY9u0QGZc5e','signup',1,1460639488,1460643088),
	(12,8,'oUFnFWyWFp2omAT8iE3XGX25shyjo1BW','signup',1,1460650525,1460654125),
	(13,8,'pmtcdi9x1oeOOOQoL7Wg4jn84yjta4aR','forgot',0,1460650607,1460654207),
	(14,9,'1RVLvV12QTH2tFwqflQDIcuxqbHd5OmX','signup',0,1460681929,1460685529),
	(15,10,'B2OZXMHse5OTv2vBlyHN5lCmdg2qPasu','signup',1,1460682181,1460685781),
	(16,11,'OVS1w1eKpqqP9E02NEHLZJ4tgFCbqn0N','signup',0,1460728178,1460731778),
	(17,12,'eZwBLeiSkTdkhXrUcSFnBwOHYMSUNvrt','signup',1,1460769332,1460772932),
	(18,13,'G8RSUl7okYo0TeILGrAKuwahVkTIxDXu','signup',1,1460786636,1460790236),
	(19,14,'7xqDuewr4Aga2n0hBeyFCaxSB5BSeWlf','signup',1,1460809033,1460812633),
	(20,15,'Cg9IF9bfWAAAkCUe11q0uH90v811hXM6','signup',0,1460960047,1460963647),
	(21,16,'JQSA10QqoEMSIE48hkT5kez7kA1OKz6q','signup',0,1460960985,1460964585),
	(22,17,'ru92Ntnxoxy3gGWNdZi0Puh1BKuY6dmP','signup',0,1460992863,1460996463),
	(23,18,'0Ea5nwEbUkD9ewYvSzcrWsOWKvhssIzO','signup',0,1461044100,1461047700),
	(24,19,'3ro0SMAJDBXeycZukhKUzh37pabk87RH','signup',0,1461054229,1461057829),
	(25,20,'xwOwBFVggbLN91suuFXG64D5FcubtJ0x','signup',0,1461059206,1461062806),
	(26,21,'K6N4GR8tB3nvRyFxp7GXBW2l09B5L2l6','signup',0,1461070401,1461074001),
	(27,22,'elXcEUzXgCFTxPYVLOfOBV188kh9WREL','signup',0,1461120033,1461123633),
	(28,23,'gHHN4G7YG0GjdOwCG4twm77Jy5iFibOg','signup',0,1461147164,1461150764),
	(29,24,'0lHWj3pzO88Fh7VUEp8W5kfLiYeyp4TN','signup',0,1461287493,1461291093),
	(30,25,'KypL7xrhmVygdORUWpISEaTuPHhNGNkx','signup',0,1461293422,1461297022),
	(31,20,'eRoutsX5TgsCHOFMvAew1F3H6Hopa7An','forgot',0,1461293615,1461297215),
	(32,29,'BvkLEWETaW6m9Uj0AvtijO5QBXK2B0kX','signup',0,1483111711,1483115311),
	(33,30,'nwCA9euVDt1V3knekAJyYkFpxauoTcsD','signup',0,1483111984,1483115584),
	(34,31,'20c5yiTSiV3I0lEhNv7fQu4f0zVNaIyk','signup',0,1483112070,1483115670),
	(35,32,'MzF9bUDk7AiAzNVIR9rq5oMkHaAB37Ld','signup',1,1483113920,1483117520),
	(36,33,'El69UpJRM4nSoG3gwvYninBAtBbmAZEi','signup',1,1486913821,1486917421),
	(37,34,'dZHT05THaPPy5kTYoLss39SG7oDWeklK','signup',0,1489673535,1489677135);

/*!40000 ALTER TABLE `t_codes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_comments`;

CREATE TABLE `t_comments` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'comment表主键',
  `tid` varchar(64) NOT NULL DEFAULT '0' COMMENT '帖子id',
  `author` varchar(100) DEFAULT NULL COMMENT '评论作者',
  `owner` varchar(100) NOT NULL DEFAULT '' COMMENT '帖子作者',
  `ip` varchar(64) DEFAULT NULL COMMENT '评论者ip地址',
  `agent` varchar(200) DEFAULT NULL COMMENT '评论者客户端',
  `content` text NOT NULL COMMENT '评论内容',
  `type` varchar(16) DEFAULT 'comment' COMMENT '评论类型',
  `status` tinyint(2) DEFAULT '1' COMMENT '评论状态',
  `created` int(10) unsigned DEFAULT '0' COMMENT '评论生成时的GMT unix时间戳',
  PRIMARY KEY (`cid`),
  KEY `idx_tid` (`tid`),
  KEY `idx_created` (`created`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论';

LOCK TABLES `t_comments` WRITE;
/*!40000 ALTER TABLE `t_comments` DISABLE KEYS */;

INSERT INTO `t_comments` (`cid`, `tid`, `author`, `owner`, `ip`, `agent`, `content`, `type`, `status`, `created`)
VALUES
	(96,'4jzqgkko9d','uilzzw','biezhi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36','333','comment',1,1494150645),
	(95,'4jzqgkko9d','biezhi','biezhi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36','222','comment',1,1494149549),
	(97,'qll2dpvq4x','uilzzw','biezhi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36','sdadad','comment',1,1494150741),
	(98,'qll2dpvq4x','uilzzw','biezhi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36','qqq222','comment',1,1494150866),
	(99,'4jzqgkko9d','biezhi','biezhi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36','@uilzzw  你好啊','comment',1,1494151985),
	(100,'4jzqgkko9d','biezhi','biezhi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36','@uilzzw  算了吧','comment',1,1494152047);

/*!40000 ALTER TABLE `t_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_favorite
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_favorite`;

CREATE TABLE `t_favorite` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `event_id` varchar(64) DEFAULT NULL,
  `event_type` varchar(50) DEFAULT NULL COMMENT 'node:节点  topic:主题 user:用户',
  `favorite_type` varchar(50) DEFAULT NULL COMMENT 'favorite: 收藏 follow:关注 star:喜欢 ',
  `created` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='关注表';



# Dump of table t_node
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_node`;

CREATE TABLE `t_node` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父节点id',
  `title` varchar(30) DEFAULT NULL COMMENT '节点名称',
  `description` varchar(255) DEFAULT NULL COMMENT '节点描述',
  `slug` varchar(50) NOT NULL COMMENT '节点英文简写',
  `thumb_img` varchar(100) DEFAULT NULL COMMENT '节点图片',
  `topics` int(10) DEFAULT '0' COMMENT '帖子数',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1:正常 0:删除',
  `created` int(10) NOT NULL COMMENT '创建时间',
  `updated` int(10) NOT NULL,
  PRIMARY KEY (`nid`),
  KEY `idx_created` (`created`),
  KEY `idx_status` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_node` WRITE;
/*!40000 ALTER TABLE `t_node` DISABLE KEYS */;

INSERT INTO `t_node` (`nid`, `pid`, `title`, `description`, `slug`, `thumb_img`, `topics`, `status`, `created`, `updated`)
VALUES
	(1,0,'分享与探索','分享与探索','','',0,1,1457933734,1459596711),
	(2,0,'Java','Java','','',0,1,1457933734,1459519169),
	(3,0,'开源圈','开源圈','','',0,1,1459519131,1459519131),
	(4,0,'城市','城市','','',0,1,1459519169,1459519169),
	(5,0,'生活','生活','','',0,1,1459519176,1459519176),
	(6,0,'站务管理','站务管理','','',0,1,1459519199,1459519199),
	(7,1,'问与答','你的问题，他的答案','qna','node/qna/zvGb/4894.png',3,1,1459519229,1460908297),
	(8,1,'分享发现','来和大家分享一些干货吧！','share','node/share/X8Be/5233.png',11,1,1459519247,1460907776),
	(9,2,'Spring','Spring','spring','',0,1,1459519266,1459519266),
	(10,2,'Blade','Blade框架问题咨询，案例分享。','blade','node/blade/x7Tq/6278.png',0,1,1459519278,1460908732),
	(11,2,'爬虫','爬虫','spiders','',3,1,1459519288,1459519288),
	(12,2,'Java基础','Java基础','javabase','',1,1,1459524976,1459524976),
	(13,2,'JavaWeb','JavaWeb','javaweb','',0,1,1459524995,1459524995),
	(14,3,'开源项目','在这里可以谈谈一些关于开源的事情。','opensource','node/opensource/wfuT/8418.png',1,1,1459519169,1460907879),
	(15,3,'Github','关于github的问题和项目展示','github','node/github/IT6w/8916.png',0,1,1459519169,1460908831),
	(16,4,'北京','北京','beijing','',0,1,1459519169,1459519169),
	(17,4,'上海','上海','shanghai','',1,1,1459519169,1459519169),
	(18,4,'广州','广州','guangzhou','',0,1,1459519169,1459519169),
	(19,4,'深圳','深圳','shenzhen','',0,1,1459519169,1459519169),
	(20,4,'杭州','杭州','hangzhou','',0,1,1459519169,1459519169),
	(21,5,'二手交易','二手交易','all4all','',0,1,1459519169,1459519169),
	(22,5,'求职招聘','关于职业生涯，招聘／找工作。','jobs','node/jobs/hhCL/6258.png',1,1,1459519169,1460908433),
	(23,6,'程序发布','程序发布','publish','',0,1,1459519169,1459519169),
	(24,6,'申请节点','申请节点','reqnode','node/reqnode/myyc/3519.png',1,1,1459519169,1461340093),
	(25,0,'编程','编程','',NULL,0,1,1459519169,1459519169),
	(26,25,'python','python','python',NULL,0,1,1459519169,1459519169),
	(27,25,'golang','golang','golang',NULL,0,1,1459519169,1459519169),
	(28,25,'nginx','nginx','nginx','node/nginx/hIJL/1357.png',1,1,1459519169,1460908056),
	(29,0,'Geek','geek','geek',NULL,0,1,1459519169,1459519169),
	(30,29,'树莓派','树莓派','raspberrypi',NULL,0,1,1459519169,1459519169),
	(32,5,'水一波','这里没有限制你到底说什么，就是来水的','water','node/water/IJTg/3761.jpg',3,1,1459519169,1460908592),
	(33,5,'生活方式','生活方式','life','node/life/9zxP/6994.png',1,1,1459519169,1461340180),
	(34,5,'游戏','游戏','game',NULL,0,1,1459519169,1459519169),
	(35,1,'GET','get 新技能','get','node/get/4HYD/2192.png',1,1,1459519169,1460908005),
	(36,2,'netty','netty','netty',NULL,0,1,1459519169,1459519169),
	(37,2,'消息中间件','','messagequeue',NULL,0,1,1459519169,1459519169),
	(38,2,'NIO','java nio技术讨论','nio','node/nio/U96v/5339.png',1,1,1459519169,1460908684),
	(39,29,'linux','这里是linux爱好者，centos，ubuntu，vps等讨论帖','liunx','node/liunx/W5OJ/4135.png',1,1,1460889054,1461340607),
	(40,25,'精选文章','','article','node/article/z3eN/6171.png',1,1,1460956167,1461340521),
	(41,6,'站点建议','','advice','',1,1,1461054917,1461054917),
	(42,25,'前端','关于前端，HTML，JavaScript，CSS','webtop','node/webtop/POJb/8382.png',1,1,1461071085,1461340006),
	(43,29,'Mac OSX','','mac','',0,1,1461071125,1461071125),
	(44,25,'mysql','','mysql','',0,1,1461071521,1461071521),
	(45,25,'redis','','redis','',0,1,1461071552,1461071552),
	(46,4,'重庆','','chongqing','',0,1,1461071587,1461071587),
	(47,1,'互联网','','internet','',4,1,1461138846,1461138846),
	(48,1,'音乐','分享和音乐有关的一切','music','node/music/MBQX/9694.png',1,1,1461218252,1461335069);

/*!40000 ALTER TABLE `t_node` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_openid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_openid`;

CREATE TABLE `t_openid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `open_id` int(11) DEFAULT NULL,
  `uid` varchar(64) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_openid` WRITE;
/*!40000 ALTER TABLE `t_openid` DISABLE KEYS */;

INSERT INTO `t_openid` (`id`, `type`, `open_id`, `uid`, `created`)
VALUES
	(1,'github',25606156,'33',1486919620);

/*!40000 ALTER TABLE `t_openid` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_options`;

CREATE TABLE `t_options` (
  `skey` varchar(50) NOT NULL,
  `svalue` text,
  PRIMARY KEY (`skey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `t_options` WRITE;
/*!40000 ALTER TABLE `t_options` DISABLE KEYS */;

INSERT INTO `t_options` (`skey`, `svalue`)
VALUES
	('comment_count','59'),
	('site_description','JavaChina是一个使用Blade框架开发的Java简洁论坛程序'),
	('site_keywords','Java社区,Blade框架,程序员论坛,开源程序'),
	('site_title','Java中国666'),
	('topic_count','35'),
	('user_count','27');

/*!40000 ALTER TABLE `t_options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_remind
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_remind`;

CREATE TABLE `t_remind` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_user` varchar(50) NOT NULL DEFAULT '',
  `to_user` varchar(50) NOT NULL DEFAULT '',
  `event_id` varchar(64) NOT NULL DEFAULT '',
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `remind_type` varchar(20) NOT NULL DEFAULT '' COMMENT 'comment:回复 star:喜欢 at:艾特',
  `is_read` tinyint(2) DEFAULT '0',
  `created` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created` (`created`),
  KEY `idx_uid` (`to_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提醒';

LOCK TABLES `t_remind` WRITE;
/*!40000 ALTER TABLE `t_remind` DISABLE KEYS */;

INSERT INTO `t_remind` (`id`, `from_user`, `to_user`, `event_id`, `title`, `content`, `remind_type`, `is_read`, `created`)
VALUES
	(1,'uilzzw','biezhi','qll2dpvq4x','互联网教育到底如何？','qqq222','comment',1,1494150871),
	(2,'biezhi','uilzzw','4jzqgkko9d','Hello World','@uilzzw  算了吧','at',1,1494152047);

/*!40000 ALTER TABLE `t_remind` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_topic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_topic`;

CREATE TABLE `t_topic` (
  `tid` varchar(64) NOT NULL DEFAULT '',
  `nid` varchar(64) NOT NULL DEFAULT '' COMMENT '所属节点',
  `username` varchar(100) NOT NULL DEFAULT '' COMMENT '发布人',
  `title` varchar(50) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '帖子标题',
  `content` text CHARACTER SET utf8mb4 COMMENT '帖子内容',
  `is_top` tinyint(2) DEFAULT '0' COMMENT '是否置顶',
  `is_essence` tinyint(2) DEFAULT '0' COMMENT '是否精华帖',
  `weight` double(10,2) DEFAULT '0.00' COMMENT '帖子权重',
  `views` int(10) DEFAULT '0' COMMENT '点击量',
  `loves` int(10) DEFAULT '0' COMMENT '点赞数',
  `favorites` int(10) DEFAULT '0' COMMENT '收藏数',
  `comments` int(10) DEFAULT '0' COMMENT '评论数',
  `sinks` int(10) DEFAULT '0' COMMENT '帖子下沉数',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1:正常 2:删除',
  `created` int(10) NOT NULL COMMENT '帖子创建时间',
  `updated` int(10) NOT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`tid`),
  KEY `idx_uid` (`username`),
  KEY `idx_nid` (`nid`),
  KEY `idx_created_updated` (`created`,`updated`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_topic` WRITE;
/*!40000 ALTER TABLE `t_topic` DISABLE KEYS */;

INSERT INTO `t_topic` (`tid`, `nid`, `username`, `title`, `content`, `is_top`, `is_essence`, `weight`, `views`, `loves`, `favorites`, `comments`, `sinks`, `status`, `created`, `updated`)
VALUES
	('04q3aqgjdr','32','hezhezhiyu','水一波水一波','魔镜呀魔镜，谁是最帅的帅逼。？\r\n魔镜：主人就是最帅的帅逼。\r\n哈哈哈哈哈哈，魔镜啊魔镜再问你一个问题，谁的代码撸的最好\r\n魔镜：啥？报告主人，撸代码伤身体，要节制！！！！！！！！\r\n',0,0,30.19,0,NULL,0,0,0,1,1460767138,1460781843),
	('1ajoajg0jz','39','biezhi','linux中screen命令的用法','**作为linux服务器管理员,经常要使用ssh登陆到远程linux机器上做一些耗时的操作。**\n\n也许你遇到过使用telnet或SSH远程登录linux,运行一些程序。如果这些程序需要运行很长时间(几个小时)，而程序运行过程中出现网络故障，或者客户机故障，这时候客户机与远程服务器的链接将终端，并且远程服务器没有正常结束的命令将被迫终止。\n\n又比如你SSH到主机上后，开始批量的scp命令，如果这个ssh线程断线了，scp进程就中断了。在远程服务器上正在运行某些耗时的作业，但是工作还没做完快要下班了，退出的话就会中断操作了，如何才好呢？\n\n我们利用screen命令可以很好的解决这个问题。实现在断开SSH的情况下,在服务器上继续执行程序。\n\n**那什么是screen命令?**\n\n> Screen被称之为一个全屏窗口管理器，用他可以轻松在一个物理终端上获得多个虚拟终端的效果。\n\n<br/>\nScreen功能说明：\n\n简单来说，Screen是一个可以在多个进程之间多路复用一个物理终端的窗口管理器,这意味着你能够使用一个单一的终端窗口运行多终端的应用。Screen中有会话的概念，用户可以在一个screen会话中创建多个screen窗口，在每一个screen窗口中就像操作一个真实的telnet/SSH连接窗口那样。\n\n**Screen命令语法：**\n\n```sh\nscreen [-AmRvx -ls -wipe][-d <作业名称>][-h <行数>][-r <作业名称>][-s ][-S <作业名称>]\n```\n\n**Screen命令参数：**\n\n- -A -[r|R]          将所有的视窗都调整为目前终端机的大小。\n- -c filename        用指定的filename文件替代screen的配置文件’.screenrc’.\n- -d [pid.tty.host]  断开screen进程(使用该命令时，screen的状态一定要是Attached，也就是说有用户连在screen里)。一般进程的名字是以pid.tty.host这种形式表示(用screen -list命令可以看出状态)。\n- -D [pid.tty.host]  与-d命令实现一样的功能，区别就是如果执行成功，会踢掉原来在screen里的用户并让他logout。\n- -h <行数> 　       指定视窗的缓冲区行数。\n\n- -ls或–list        显示目前所有的screen作业。\n- -m                    即使目前已在作业中的screen作业，仍强制建立新的screen作业。\n- -p number or name  预先选择一个窗口。\n- -r [pid.tty.host]  恢复离线的screen进程，如果有多个断开的进程，需要指定[pid.tty.host]\n- -R                      先试图恢复离线的作业。若找不到离线的作业，即建立新的screen作业。\n-s shell             指定建立新视窗时，所要执行的shell。\n-S <作业名称>  指定screen作业的名称。(用来替代[pid.tty.host]的命名方式,可以简化操作).\n-v                     显示版本信息。\n-wipe                检查目前所有的screen作业，并删除已经无法使用的screen作业。\n-x                     恢复之前离线的screen作业。\n\n**Screen命令的常规用法:**\n\n`screen -d -r`:连接一个screen进程，如果该进程是attached，就先踢掉远端用户再连接。\n\n`screen -D -r`:连接一个screen进程，如果该进程是attached，就先踢掉远端用户并让他logout再连接\n\n`screen -ls`或者`-list`:显示存在的screen进程，常用命令\n\n`screen -m`:如果在一个Screen进程里，用快捷键crtl+a c或者直接打screen可以创建一个新窗口,screen -m可以新建一个screen进程。\n\n`screen -dm`:新建一个screen，并默认是detached模式，也就是建好之后不会连上去。\n\n`screen -p number or name`:预先选择一个窗口。\n\n**Screen实现后台运行程序的简单步骤:**\n\n1.要进行某项操作时，先使用命令创建一个Screen:\n\n```sh\n[linux@user~]$ screen -S test1\n```\n\n2.接着就可以在里面进行操作了，如果你的任务还没完成就要走开的话，使用命令保留Screen：\n\n```sh\n[linux@user~]$ Ctrl+a+d                    #按Ctrl+a，然后再按d即可保留Screen\n[detached]                                 #这时会显示出这个提示，说明已经保留好Screen了\n```\n\n**如果你工作完成的话，就直接输入:**\n\n```sh\n[linux@user~]$ exit                        #这样就表示成功退出了\n[screen is terminating]\n```\n\n3.如果你上一次保留了Screen，可以使用命令查看:\n\n```sh\n[linux@user~]$ screen -ls\nThere is a screen on:\n9649.test1   (Detached)\n```\n\n恢复Screen，使用命令：\n\n```sh\n[linux@user~]$ screen -r test1 (or 9649)\n```\n\n**Screen命令中用到的快捷键**\n\n* Ctrl+a c ：创建窗口\n* Ctrl+a w ：窗口列表\n* Ctrl+a n ：下一个窗口\n* Ctrl+a p ：上一个窗口\n* Ctrl+a 0-9 ：在第0个窗口和第9个窗口之间切换\n* Ctrl+a K(大写) ：关闭当前窗口，并且切换到下一个窗口（当退出最后一个窗口时，该终端自动终止，并且退回到原始shell状态）\n* exit ：关闭当前窗口，并且切换到下一个窗口（当退出最后一个窗口时，该终端自动终止，并且退回到原始shell状态）\n* Ctrl+a d ：退出当前终端，返回加载screen前的shell命令状态\n\n**Linux的screen命令挺不错，在服务器上做点什么费时的工作就不用愁了！**',0,1,33.07,0,NULL,0,0,0,1,1460890017,1461140532),
	('2yrlo9m79y','22','lala','Python 后端开发工程师——From Amber（附最近招聘的感触）','[ Python 后端开发工程师] \r\n\r\n1 、 2 年以上工作经验，最好开发过日活过百万的线上系统；； \r\n2 、熟悉 Python ，有良好的编程基础和编程习惯； \r\n3 、熟悉常用的分布式系统，包括数据库、缓存、消息队列等； \r\n4 、有丰富的系统架构和 API 设计经验。 \r\n\r\n[推荐工作流程] ： 1.加我的微信，初步认识对方。 \r\n2.交换电话沟通，这样比较高效。 \r\n3.发送您的简历，约见面，我会和每个将要推荐的候选人见一次面，深入了解一些工作机会。 \r\n4.发简历，约面试，这是双方承诺，大家提前会沟通好。 \r\n5.面试反馈，结果就看您自己的选择了。 \r\n\r\n[转介绍] ：如果您身边的朋友很适合我发布的职位，欢迎推荐。谢谢每个信任我的朋友，我会真诚负责对待每个朋友。 \r\n\r\n[最近的感触] ：很多高级开发程序员工作很难找，薪资已经遇到天花板。有经验，但能力一般的程序员很难找工作，市场越来越不认可。戒骄戒躁，修炼自己。 \r\n\r\n我是专注 Python 领域的猎头 Amber ，最近又有朋友加我微信了，投递简历了，和大家一起成长！ \r\n见了很多工程师，看重大家的职业发展道路，学习了很多。希望和大家一起努力成长。',0,0,23.38,0,NULL,0,0,0,1,1460470806,1460640440),
	('2yrlorzdgz','11','wuyun','a','aaa',0,0,0.00,0,NULL,0,0,0,2,1461049106,1461049163),
	('4jzqgkko9d','12','biezhi','Hello World','```java\r\npublic static void main(){\r\n    System.out.println(\"Hello Gay!\");\r\n}\r\n```',0,0,688.43,32,NULL,0,4,0,1,1490376467,1490376467),
	('73v6bgovky','7','uilzzw','快出来带薪吹水;','XSS漏洞怎么补;就只需要按照度娘的方法;写一个过滤器么;',0,0,42.24,2,NULL,0,0,0,1,1461289113,1461289782),
	('73v6bgq8ka','41','lichee','是否需要添加帖子的编辑,删除功能','其他论坛比较常见的功能',0,0,-36.53,0,NULL,0,0,0,1,1461121843,1461123122),
	('8eyzkvarvk','35','biezhi','Sexual hookup culture：当约炮已成为一种文化现象','作者：熊希灵\r\n链接：http://zhuanlan.zhihu.com/p/20501450\r\n来源：知乎\r\n著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。\r\n\r\n前两天有朋友分享了一个探究约炮原因的问题，900多个答案粗略扫了一眼，基本都是答主们自我体验感受的分享。感叹答主们经历丰富的同时，我也在想“为什么约炮这一现象在现代社会似乎日渐兴起并已渐渐成为一种独立的文化现象，这种现象兴起的原因是什么？”\r\n\r\n这么性感的话题怎么可能逃过学界的争论，12年有篇发在Review of General Psychology上的文章就针对此前对约炮行为的相关研究作了综述，应该是迄今对约炮文化阐释较为全面的一篇文章：Sexual hook-up culture: A review\r\n这里仅挑几个重点略作介绍，建议感兴趣的同学翻看原文。\r\n\r\n1.对“约炮”的操作性定义。\r\n有不同学者对约炮（hookup）作过不同的操作性定义，作者将其归纳为一种随意、没有承诺的性关系“casual sex” or “uncommitted sexual encounter.”；就约炮具体内容而言，主要得与本身就是朋友基础上发展出性关系但是又没有伴侣承诺的Friends With Benefits区分开，这种friends with benefits在性关系之外卷含了太多的关于友谊、信任和情感抚慰等因素：these situations represent a greater entanglement of friendship, trust, and emotional comfort, FWBs are distinct from notions of hooking up in some aspects\r\n\r\n除掉friends with benefits，剩下明确可定义为约炮的行为俗称有：“no strings attached” (NSA) sex, “casual encounters,” and “one-night stands.”。\r\n需要另外指出的是，作者对约炮的定义包含但不止于插入式的性爱关系，接吻、口交等边缘性行为也是算在内的：The term hookup focuses on the uncommitted nature of a sexual encounter rather than focus on what behaviors “count.”\r\n\r\n2.“约炮”在当代社会有多频繁？\r\n仅就北美的不同调查数据总结来看，大约60%-80%的大学生有过至少一次的“约炮”经历。\r\n\r\n3.“约炮”发生的地点。\r\n不同的调查取样结果有一定偏差，不过综合起来看，北美地区的约炮行为绝大部分发生于聚会和单身酒吧（针对学生群体的调查则有超过50%发生于宿舍）。\r\n\r\n4.解释“约炮”原因的理论框架。\r\n1）进化心理学视角：\r\n提及这一理论当然绕不开大名鼎鼎的Buss, D. M，其基本理论即为男性为了更高效率的繁殖，会更倾向于约炮这种短期、丰富伴侣、低资源付出的性策略；女性则为了从男性得到更多资源而倾向于维持长期关系而获得更多投资的性策略——但女性也不是完全拒绝短期关系，当某些男性表现出特别良好的基因特征，女性也会倾向于为了下一代的质量而寻求短期关系。\r\n如此基本上是自圆其说了为什么男女都有约炮行为，但男性明显更饥渴，女性更挑剔的现象。而有元分析也表明男女在绝大多数性行为上的表现都是相似的，唯独“约炮”这一点上差异显著。\r\n但是03年有跨文化的调查发现，虽然男性的约炮意愿（79%）确实明显高于女性（64%），但两性均高于50%的约炮意愿也显著地太高了些——进化心理学并不能很好解释为何近三分之二的女性有约炮意愿。当然进化心理学派还是坚持认为，这是现代避孕手段的进步让女性更有机会作为一个“选择者（choosier）”去通过约炮来获得更好的基因选择。\r\n2）性脚本理论（Sexual script theory）：\r\n这一理论简而言之就是，人们的性行为是由当下社会的习俗规范形成的“脚本”指导下完成的。这一理论与进化心理学的不同之处在于，其更强调社会学习的作用，而不仅是繁衍本能。\r\n在女性主义兴起之前，社会脚本一直强调男性的中心地位，性于是一种权力的象征；而女性则被物化，在性上是消极的守卫者（gatekeeper）；而到了近现代，影视作品里也越来越多出现女性对性的自由追求，对身体的自我掌控，Friends with Benefits and No Strings Attached这样的代表性作品则更表现了当代性解放对约炮行为的示范性作用。\r\n\r\n两种理论综合来看，前者更着重解释“约炮”行为范式产生的根本原因，后者则注重解释这一行为在当代社会兴起的文化层面。遗憾的是这两种理论仅仅是一个框架，由于针对“约炮”行为研究方法的局限（主要还是质性研究方法，问卷、深度访谈等），两种理论要获得实证支持还有很长的路要走。\r\n值得注意的是，除了人的自身动机，一些外部因素同样对约炮行为有重要影响——有针对北美大学生的调查表明，33%的约炮行为“不是故意的（unintentional）”，虽然这个词听着很别扭，不过不得不承认酒精和大麻对unintentional的功不可没。\r\n\r\n5.“约炮”对人们主观幸福感（well-being）的影响\r\n1）约炮场景往往包含着压力和表现焦虑。女性在这些负性情绪方面的表现比男性更显著。有意思的是，与我们平时所认为的“风流倜傥”形象不太一样，有约炮行为的受调查者在自尊水平上显著低于没有约炮行为的受调查者，无论男女——不过这一现象的因果关系尚不明晰，不知道到底是因为低自尊才去约炮找自信，还是因为约炮行为导致了自尊降低。\r\n2）约炮后的悔恨感（hookup regret）是一个独特的负面效应。这种悔恨主要包含难堪（embarrassed）、失去尊重（loss of respect）、与稳定伴侣的障碍（difficulties with a steady partner ）。加拿大一项针对大学生调查表明78%的女性和72%的男性在约炮后都有悔恨感。\r\n3）尽管有前两点的负面效应，并且迄今的大多数调查都更支持约炮带来的负面影响更多，但有调查表明65%的约炮者在约炮中感到良好甚至兴奋。作者也认为目前还无法判断约炮到底是会带来更多积极效应还是消极效应：It is still unclear the degree to which hookups may result in positive reactions, and whether young men and young women are sexually satisfied in these encounters.\r\n\r\n\r\n要点大致如上，其实较之作者整理的两种理论框架，我认为作者前面introduction里提到的一个解释虽然较表层但其实更能合理地解释约炮行为在现代社会的兴起：\r\n\r\n由于受教育年限的提升，现代人真正进入经济独立的年龄也被显著推迟，建立家庭、生育的年龄都远远大于性成熟的年龄——尤其随着营养的丰富，现代人性成熟的年龄反而是提前的。现代社会的年轻人还没有做好组建家庭的准备，却已经开始受到生殖冲动给生理心理带来的双重影响，于是约炮成为了一种缓解性压力却又不必担忧尚未做好组建家庭准备的有效手段。\r\n\r\nReference：\r\nGarcia, J. R., Reiber, C., Massey, S. G., & Merriwether, A. M. (2012). Sexual hookup culture: A review. Review of General Psychology, 16(2), 161.\r\n文中提到的所有研究文献在这篇文章的引用文献里都能找到，就不再一一列举引用了。',0,0,23.63,0,NULL,0,0,0,1,1460472036,1460715812),
	('8eyzkvg3ra','24','rex_8090','站长来点前端节点','\r\n比如 Javascript／Bootstrap／NodeJS这样的。。 :full_moon_with_face: \r\n',0,0,36.72,0,NULL,0,0,0,1,1461070977,1461071042),
	('9lrwbrqpqv','8','biezhi','CENTOS6.7无法安装锐速的解决方法','由于到目前为止，锐速官方尚不支持centos6.7，所以centos6.7想要安装锐速就要降级内核。锐速官方支持内核一览：\r\n\r\n[http://my.serverspeeder.com/ls.do?m=availables](http://my.serverspeeder.com/ls.do?m=availables)\r\n\r\n首先需要确认自己的内核版本，输入命令uname -a，输出中有i686则为32位，有x86_64则为64位。\r\n下载32位内核：\r\n\r\n```sh\r\nwget http://ftp.scientificlinux.org/linux/scientific/6.5/i386/updates/security/kernel-2.6.32-504.el6.i686.rpm\r\n```\r\n\r\n下载64位内核：\r\n\r\n```sh\r\nwget http://ftp.scientificlinux.org/linux/scientific/6.5/x86_64/updates/security/kernel-2.6.32-504.el6.x86_64.rpm\r\n```\r\n\r\n以32位系统为例下载后可以\r\n\r\n```sh\r\nrpm -ivh kernel-2.6.32-504.el6.i686.rpm --force\r\n```\r\n\r\n降级内核，然后 `reboot` 重启系统即可。?',0,1,30.80,0,NULL,0,0,0,1,1460804567,1460805614),
	('a371elq92b','7','biezhi','asdasd','asdasd',0,0,670.78,0,NULL,0,0,0,1,1489593502,1489593502),
	('ebkxdzbkl3','7','kiyoumi','怎样提高程序员男朋友的情商？','因为男票情商不高，所以屡次想要通过调情拉高他的情商，结果却是屡屡被他蠢哭了（有时又觉得傻傻分不清楚蛮可爱）…虽然事后他也会努力地哄我并承认自己很蠢的事实→_→但一直不见情商进步啊…于是乎想让他找宿友讨教撒，结果他说我不搞基啊……！妈蛋老子让你搞基了吗让你跟宿友学习学习！（再次蠢哭）……哎我是一直不信IT男就会情商低的，毕竟见过不少IT情圣，看在他也说会努力的份上，我还不想放弃治疗他……所以恳请大侠们帮他一起提高情商喲⊙﹏⊙\r\n我是认真的！！！',0,0,23.59,0,NULL,0,0,0,1,1460470218,1460639610),
	('gjg9oajqde','11','doubi','手把手教你写煎蛋妹子图爬虫。。。','缘起\r\n====\r\n\r\n爬虫从妹子图练起最好了，煎蛋防护系统比较弱，你要一开始上手大众点评，豆瓣，那好了，先上淘宝买代理吧。。。。\r\n\r\n而且这个例子好好啊，可以直接从正则表达式匹配技术讲起，在用bs，再到pyquery。。。。\r\n\r\n顺带讲讲fiddler，firebug之类的。。。\r\n\r\n===\r\n\r\n第一次录screencast，真是巨麻烦。而且质量还不高。。演练没到位。。。\r\n\r\ndestroy all software能在15分钟左右制作出质量这么高的视频真心不容易，自己做一次就知道了。\r\n\r\n视频链接： http://pan.baidu.com/s/1i3mXwBN\r\n\r\n效果链接： [tocpic/5](http://java-china.org/tocpic/5)\r\n\r\n这是无聊图的，妹子图现在都很黄很暴力了，不和谐~~',0,0,23.40,0,NULL,0,0,0,1,1460471443,1460639941),
	('gjg9oareke','32','doubi','test from sina weibo','![](http://ww4.sinaimg.cn/mw600/b871e8fdgw1ep6lrs4jhmj209d0g7414.jpg)\r\n\r\n![](http://ww3.sinaimg.cn/mw600/b871e8fdgw1ep6lrtxy51j20dw0a60tk.jpg)\r\n\r\n![](http://ww2.sinaimg.cn/thumbnail/a00dfa2agw1ep6fj6k10fg20bo0821kx.gif)\r\n\r\n![](http://ww3.sinaimg.cn/thumbnail/a00dfa2ajw1ep5rwq6p72g205k05kdjm.gif)\r\n\r\n![](http://ww3.sinaimg.cn/thumbnail/6b8b2c6egw1ep6fl7zzkdg20b40b4u10.gif)',0,0,22.92,0,NULL,0,0,0,1,1460471180,1460471180),
	('gqe2yzw3jj','47','biezhi','互联网教育到底如何？','## 各路大神来点评',0,0,687.46,0,NULL,0,0,0,2,1490375536,1490375536),
	('jedywd3bea','32','jacks','Java是世界上最牛逼的语言，不服来战！','\r\n哈哈，你们看这里 [给Java说句公道话](http://www.yinwang.org/blog-cn/2016/01/18/java)\r\n\r\n',0,0,27.16,0,NULL,0,0,0,1,1460640734,1460640957),
	('k3g2xgg2rr','11','wuyun','v','v',0,0,0.00,0,NULL,0,0,0,2,1461049237,1461049237),
	('o3l1wpvzmd','42','jacks','JS数组去重方法最优解?','javascript 版本\r\n\r\n```javascript\r\nvar arr = [9, 9, 111, 2, 3, 4, 4, 5, 7];\r\nvar sortedArr = arr.sort(); \r\nvar results = [];\r\nfor (var i = 0; i < arr.length - 1; i++) {\r\n    if (sortedArr[i + 1] == sortedArr[i]) {\r\n        results.push(sortedArr[i]);\r\n    }\r\n}\r\nalert(results);\r\n```\r\n\r\n前端 :dog:  一起来探讨',0,0,37.36,0,NULL,0,0,0,1,1461072699,1461073540),
	('o3l1wv3vqa','38','jacks','Java NIO原理图文分析及代码实现','最近在分析hadoop的RPC(Remote Procedure Call Protocol ，远程过程调用协议，它是一种通过网络从远程计算机程序上请求服务，而不需要了解底层网络技术的协议。\r\n\r\n可以参考：[http://baike.baidu.com/view/32726.htm](http://baike.baidu.com/view/32726.htm) 机制时，发现hadoop的RPC机制的实现主要用到了两个技术：动态代理（动态代理可以参考博客：[http://weixiaolu.iteye.com/blog/1477774](http://weixiaolu.iteye.com/blog/1477774) ）和java NIO。为了能够正确地分析hadoop的RPC源码，我觉得很有必要先研究一下java NIO的原理和具体实现。\r\n\r\n我主要从两个方向来分析java NIO\r\n\r\n一．java NIO 和阻塞I/O的区别\r\n     1. 阻塞I/O通信模型\r\n     2. java NIO原理及通信模型\r\n二．java NIO服务端和客户端代码实现 \r\n\r\n**具体分析：**\r\n\r\n**一．java NIO 和阻塞I/O的区别**\r\n\r\n**1. 阻塞I/O通信模型**\r\n\r\n假如现在你对阻塞I/O已有了一定了解，我们知道阻塞I/O在调用InputStream.read()方法时是阻塞的，它会一直等到数据到来时（或超时）才会返回；同样，在调用ServerSocket.accept()方法时，也会一直阻塞到有客户端连接才会返回，每个客户端连接过来后，服务端都会启动一个线程去处理该客户端的请求。阻塞I/O的通信模型示意图如下：\r\n\r\n![](http://dl2.iteye.com/upload/attachment/0087/8153/a6cdd20a-260a-3664-9e7b-81d6737e746d.jpg)\r\n\r\n如果你细细分析，一定会发现阻塞I/O存在一些缺点。根据阻塞I/O通信模型，我总结了它的两点缺点：\r\n\r\n1. 当客户端多时，会创建大量的处理线程。且每个线程都要占用栈空间和一些CPU时间\r\n2. 阻塞可能带来频繁的上下文切换，且大部分上下文切换可能是无意义的。\r\n\r\n在这种情况下非阻塞式I/O就有了它的应用前景。\r\n\r\n**2. java NIO原理及通信模型**\r\n\r\nJava NIO是在jdk1.4开始使用的，它既可以说成“新I/O”，也可以说成非阻塞式I/O。下面是java NIO的工作原理：\r\n\r\n1. 由一个专门的线程来处理所有的 IO 事件，并负责分发。 \r\n2. 事件驱动机制：事件到的时候触发，而不是同步的去监视事件。 \r\n3. 线程通讯：线程之间通过 wait,notify 等方式通讯。保证每次上下文切换都是有意义的。减少无谓的线程切换。 \r\n\r\n阅读过一些资料之后，下面贴出我理解的java NIO的工作原理图：\r\n\r\n![](http://dl2.iteye.com/upload/attachment/0087/8155/15008451-aa92-34b3-83e8-b6813082591c.jpg)\r\n\r\n(注：每个线程的处理流程大概都是读取数据、解码、计算处理、编码、发送响应。)\r\n\r\nJava NIO的服务端只需启动一个专门的线程来处理所有的 IO 事件，这种通信模型是怎么实现的呢？呵呵，我们一起来探究它的奥秘吧。java NIO采用了双向通道（channel）进行数据传输，而不是单向的流（stream），在通道上可以注册我们感兴趣的事件。一共有以下四种事件：\r\n\r\n![](http://i4.piimg.com/bbbc171e603a904d.png)\r\n\r\n服务端和客户端各自维护一个管理通道的对象，我们称之为selector，该对象能检测一个或多个通道 (channel) 上的事件。我们以服务端为例，如果服务端的selector上注册了读事件，某时刻客户端给服务端发送了一些数据，阻塞I/O这时会调用read()方法阻塞地读取数据，而NIO的服务端会在selector中添加一个读事件。服务端的处理线程会轮询地访问selector，如果访问selector时发现有感兴趣的事件到达，则处理这些事件，如果没有感兴趣的事件到达，则处理线程会一直阻塞直到感兴趣的事件到达为止。下面是我理解的java NIO的通信模型示意图：\r\n\r\n![](http://dl.iteye.com/upload/attachment/0066/3190/0184183e-286c-34f1-9742-4adaa28b7003.jpg)\r\n\r\n**二．java NIO服务端和客户端代码实现**\r\n\r\n为了更好地理解java NIO,下面贴出服务端和客户端的简单代码实现。\r\n\r\n**服务端：**\r\n\r\n```java\r\npackage cn.nio;    \r\n    \r\nimport java.io.IOException;    \r\nimport java.net.InetSocketAddress;    \r\nimport java.nio.ByteBuffer;    \r\nimport java.nio.channels.SelectionKey;    \r\nimport java.nio.channels.Selector;    \r\nimport java.nio.channels.ServerSocketChannel;    \r\nimport java.nio.channels.SocketChannel;    \r\nimport java.util.Iterator;    \r\n    \r\n/**  \r\n * NIO服务端  \r\n * @author 小路  \r\n */    \r\npublic class NIOServer {    \r\n    //通道管理器    \r\n    private Selector selector;    \r\n    \r\n    /**  \r\n     * 获得一个ServerSocket通道，并对该通道做一些初始化的工作  \r\n     * @param port  绑定的端口号  \r\n     * @throws IOException  \r\n     */    \r\n    public void initServer(int port) throws IOException {    \r\n        // 获得一个ServerSocket通道    \r\n        ServerSocketChannel serverChannel = ServerSocketChannel.open();    \r\n        // 设置通道为非阻塞    \r\n        serverChannel.configureBlocking(false);    \r\n        // 将该通道对应的ServerSocket绑定到port端口    \r\n        serverChannel.socket().bind(new InetSocketAddress(port));    \r\n        // 获得一个通道管理器    \r\n        this.selector = Selector.open();    \r\n        //将通道管理器和该通道绑定，并为该通道注册SelectionKey.OP_ACCEPT事件,注册该事件后，    \r\n        //当该事件到达时，selector.select()会返回，如果该事件没到达selector.select()会一直阻塞。    \r\n        serverChannel.register(selector, SelectionKey.OP_ACCEPT);    \r\n    }    \r\n    \r\n    /**  \r\n     * 采用轮询的方式监听selector上是否有需要处理的事件，如果有，则进行处理  \r\n     * @throws IOException  \r\n     */    \r\n    @SuppressWarnings(\"unchecked\")    \r\n    public void listen() throws IOException {    \r\n        System.out.println(\"服务端启动成功！\");    \r\n        // 轮询访问selector    \r\n        while (true) {    \r\n            //当注册的事件到达时，方法返回；否则,该方法会一直阻塞    \r\n            selector.select();    \r\n            // 获得selector中选中的项的迭代器，选中的项为注册的事件    \r\n            Iterator ite = this.selector.selectedKeys().iterator();    \r\n            while (ite.hasNext()) {    \r\n                SelectionKey key = (SelectionKey) ite.next();    \r\n                // 删除已选的key,以防重复处理    \r\n                ite.remove();    \r\n                // 客户端请求连接事件    \r\n                if (key.isAcceptable()) {    \r\n                    ServerSocketChannel server = (ServerSocketChannel) key    \r\n                            .channel();    \r\n                    // 获得和客户端连接的通道    \r\n                    SocketChannel channel = server.accept();    \r\n                    // 设置成非阻塞    \r\n                    channel.configureBlocking(false);    \r\n    \r\n                    //在这里可以给客户端发送信息哦    \r\n                    channel.write(ByteBuffer.wrap(new String(\"向客户端发送了一条信息\").getBytes()));    \r\n                    //在和客户端连接成功之后，为了可以接收到客户端的信息，需要给通道设置读的权限。    \r\n                    channel.register(this.selector, SelectionKey.OP_READ);    \r\n                        \r\n                    // 获得了可读的事件    \r\n                } else if (key.isReadable()) {    \r\n                        read(key);    \r\n                }    \r\n    \r\n            }    \r\n    \r\n        }    \r\n    }    \r\n    /**  \r\n     * 处理读取客户端发来的信息 的事件  \r\n     * @param key  \r\n     * @throws IOException   \r\n     */    \r\n    public void read(SelectionKey key) throws IOException{    \r\n        // 服务器可读取消息:得到事件发生的Socket通道    \r\n        SocketChannel channel = (SocketChannel) key.channel();    \r\n        // 创建读取的缓冲区    \r\n        ByteBuffer buffer = ByteBuffer.allocate(10);    \r\n        channel.read(buffer);    \r\n        byte[] data = buffer.array();    \r\n        String msg = new String(data).trim();    \r\n        System.out.println(\"服务端收到信息：\"+msg);    \r\n        ByteBuffer outBuffer = ByteBuffer.wrap(msg.getBytes());    \r\n        channel.write(outBuffer);// 将消息回送给客户端    \r\n    }    \r\n        \r\n    /**  \r\n     * 启动服务端测试  \r\n     * @throws IOException   \r\n     */    \r\n    public static void main(String[] args) throws IOException {    \r\n        NIOServer server = new NIOServer();    \r\n        server.initServer(8000);    \r\n        server.listen();    \r\n    }    \r\n    \r\n}\r\n```\r\n\r\n**客户端：**\r\n\r\n```java\r\npackage cn.nio;    \r\n    \r\nimport java.io.IOException;    \r\nimport java.net.InetSocketAddress;    \r\nimport java.nio.ByteBuffer;    \r\nimport java.nio.channels.SelectionKey;    \r\nimport java.nio.channels.Selector;    \r\nimport java.nio.channels.SocketChannel;    \r\nimport java.util.Iterator;    \r\n    \r\n/**  \r\n * NIO客户端  \r\n * @author 小路  \r\n */    \r\npublic class NIOClient {    \r\n    //通道管理器    \r\n    private Selector selector;    \r\n    \r\n    /**  \r\n     * 获得一个Socket通道，并对该通道做一些初始化的工作  \r\n     * @param ip 连接的服务器的ip  \r\n     * @param port  连接的服务器的端口号           \r\n     * @throws IOException  \r\n     */    \r\n    public void initClient(String ip,int port) throws IOException {    \r\n        // 获得一个Socket通道    \r\n        SocketChannel channel = SocketChannel.open();    \r\n        // 设置通道为非阻塞    \r\n        channel.configureBlocking(false);    \r\n        // 获得一个通道管理器    \r\n        this.selector = Selector.open();    \r\n            \r\n        // 客户端连接服务器,其实方法执行并没有实现连接，需要在listen（）方法中调    \r\n        //用channel.finishConnect();才能完成连接    \r\n        channel.connect(new InetSocketAddress(ip,port));    \r\n        //将通道管理器和该通道绑定，并为该通道注册SelectionKey.OP_CONNECT事件。    \r\n        channel.register(selector, SelectionKey.OP_CONNECT);    \r\n    }    \r\n    \r\n    /**  \r\n     * 采用轮询的方式监听selector上是否有需要处理的事件，如果有，则进行处理  \r\n     * @throws IOException  \r\n     */    \r\n    @SuppressWarnings(\"unchecked\")    \r\n    public void listen() throws IOException {    \r\n        // 轮询访问selector    \r\n        while (true) {    \r\n            selector.select();    \r\n            // 获得selector中选中的项的迭代器    \r\n            Iterator ite = this.selector.selectedKeys().iterator();    \r\n            while (ite.hasNext()) {    \r\n                SelectionKey key = (SelectionKey) ite.next();    \r\n                // 删除已选的key,以防重复处理    \r\n                ite.remove();    \r\n                // 连接事件发生    \r\n                if (key.isConnectable()) {    \r\n                    SocketChannel channel = (SocketChannel) key    \r\n                            .channel();    \r\n                    // 如果正在连接，则完成连接    \r\n                    if(channel.isConnectionPending()){    \r\n                        channel.finishConnect();    \r\n                            \r\n                    }    \r\n                    // 设置成非阻塞    \r\n                    channel.configureBlocking(false);    \r\n    \r\n                    //在这里可以给服务端发送信息哦    \r\n                    channel.write(ByteBuffer.wrap(new String(\"向服务端发送了一条信息\").getBytes()));    \r\n                    //在和服务端连接成功之后，为了可以接收到服务端的信息，需要给通道设置读的权限。    \r\n                    channel.register(this.selector, SelectionKey.OP_READ);    \r\n                        \r\n                    // 获得了可读的事件    \r\n                } else if (key.isReadable()) {    \r\n                        read(key);    \r\n                }    \r\n    \r\n            }    \r\n    \r\n        }    \r\n    }    \r\n    /**  \r\n     * 处理读取服务端发来的信息 的事件  \r\n     * @param key  \r\n     * @throws IOException   \r\n     */    \r\n    public void read(SelectionKey key) throws IOException{    \r\n        //和服务端的read方法一样    \r\n    }    \r\n        \r\n        \r\n    /**  \r\n     * 启动客户端测试  \r\n     * @throws IOException   \r\n     */    \r\n    public static void main(String[] args) throws IOException {    \r\n        NIOClient client = new NIOClient();    \r\n        client.initClient(\"localhost\",8000);    \r\n        client.listen();    \r\n    }    \r\n    \r\n} \r\n```\r\n\r\n**小结:**\r\n\r\n终于把动态代理和java NIO分析完了，呵呵，下面就要分析hadoop的RPC机制源码了，博客地址：[http://weixiaolu.iteye.com/blog/1504898](http://weixiaolu.iteye.com/blog/1504898) 。不过如果对java NIO的理解存在异议的，欢迎一起讨论。',0,1,23.67,0,NULL,0,0,0,1,1460473545,1460820128),
	('o3l1wvg3oa','8','kiyoumi','咦？这些也会影响我们的脸么？','下面这样的情况在我们身上或多或少地发生过（肯定发生过啦，不要装了）：虽然有个人长相、气质不如你（对，就是你隔壁同事，或者宿舍那谁），但是大家竟然会对它评价高而不是对你！正如之前提到的，影响长相的因素并不是很多，为什么各项都「占优」了，却还会在感情上「落后」呢？为什么全世界都不能识别你的美丽（估计这么想的话，你也不美，真的）呢？\r\n\r\n比如这一组图，是一个叫做 Sparkles and Wine 的视频里的截图。仔细看的话，就能发现虽然是同一张脸，但在不同光照下会给人不同的感受。\r\n\r\n![](http://i4.piimg.com/2638821fdad08c7c.png)\r\n\r\n\r\n很明显，别人对我们具备的吸引力的识别由两个大部分组成：（1）我们自身的硬件条件；（2）别人的判断。现在我们谈一谈别人的判断。\r\n\r\n首先呢，他人作为观察者，他们自身的状况也会影响对食物的判断。有很多研究女性荷尔蒙的学者就此做了不少研究。大量的研究都指向了一个推论：那就是女性的确会因为每个月激素的波动，而稍稍改变对男性特征的喜好。当女性身处排卵期的时候，会更倾向于喜欢男性气质外露的男性（比如面孔阳刚有力的），也会稍稍倾向于短期交往模式；毕竟在排卵期预示着生殖能力的最高峰，会倾向于寻找有最优质基因的男性产生后代。而女性在月经周期的其他阶段会更想要找男性气质稍弱（这样的男性脾气更好，能做好父亲，恩），愿意组建长期家庭共同抚养孩子的男性。其他实验还表明，这个倾向不只是针对面孔，还针对声音(Puts, 2006)、体形(Little et al., 2007)，甚至是体味(Havlicek et al., 2005)等能够反映男性特征的方面。总而言之，在不同激素条件下，按照不同需求立体地寻找最优伴侣。\r\n\r\n不光荷尔蒙会影响识别，观察者自身的背景也会不分性别地影响判断。比如科学家在跨国家的研究中发现，当一个人出自相对而言环境恶劣的地方，会更倾向于寻找身强力壮的伴侣，从而产生抵抗力优秀的后代（也让别人难以抵抗的后代）。这也就能理解，为什么很多经历过社会动荡的老人们会提醒孩子，说找妻子要找有某些所谓「能生孩子」的特征的。当然找老公要写房产证名字的不在我们讨论的范畴。\r\n\r\n科学家们其实也在其他动物的求偶过程中（其他动物也会看长相，比如说孔雀，或者说长眼睛的貌似都看）发现了不少有趣的情况：很多雌性鸟类会根据其他雌鸟的态度去判断潜在的交配对象。比如说，一尾被众多雌鸟环绕的雄鸟往往会受到更多青睐。这一种现象又叫求偶复制现象（mate copying，m-a-t-e c-o-p-y-i-n-g），科学家对此的解释是在同性交配竞争中，通过他人现有的判断可以高效、并且少犯错地找到合适的配偶（或者说薅羊毛？蹭烟？蹭wifi？蹭。。。女友？）。正如其实我们很多人也会去客人多的地方买东西——就好比五道口地铁站附近的一个副食品商店（貌似卖枣糕），似乎永远爆满——虽然我们没吃过这家店，但是还会觉得既然每天那么多人排队，应该不是浪得虚名嘛。\r\n\r\n那么，我们在判断他人的相貌时候也会这样参照别人的判断么？科学家通过实验给出了一个答案：那就是很多情况下会，但是依赖环境本身。比如说 Johansson 博士在 2003 年的实验中发现，看到一位男士手戴婚戒，并不能令女性实验者更为青睐这位男士；不过对此，他解释在我们人类身上的「复制」比动物要更加复杂，也更需要环境配合。毕竟在上述试验中，这位男士戴着婚戒除了暗示其他女性的喜爱，也暗示了「名花有主」。这样「理性」的判断反而更符合伦理道德。紧跟着这个实验，其他科学家也利用了更精巧的设计进行研究，发现了「复制」的蛛丝马迹。比如，Ben Jones 教授和他的同事们在 2007 年利用了精巧的试验安排，展现了其他女性对男士的兴趣可以被传递，当然不会明目张胆显示不过是没有关上「可以交往的大门」：窥探到所谓社会判断传递，也就是说女性的确会因为其他女性的判断而改变对男性的相貌判断。一个更受（妹子们）欢迎的男性看起来比不受（妹子们）欢迎的要更为吸引人。虽然说这一点在男性判断女性上还没有充足证据，但是可以推论，那就是一个受别人欢迎的人必然有其优势，更容易受到他者的喜爱。\r\n\r\n不光如此，我们所处的环境也会影响别人对我们的判断。Tracy 和 Bell（2010）两位学者通过一个有趣的实验探讨了我们自身的表情对于我们相貌的影响。他们发现对于女性朋友们，在摆出开心表情时候可以最大程度上提升自己的美貌。或者说一抹浅浅的笑容就可以让别人觉得神清气爽，如沐春风。而对于男性朋友有着更有趣的情况。综合而言，男性在显露出骄傲的表情时候，不光让人觉得霸气十足，还会更有魅力；相对应的是，当男性显露出惭愧的神情时候，年轻女士们会觉得依然有魅力，而有经验的女士们（恋爱经验随着年纪增长）并不吃这一套（自从看了这篇论文，我就不再女性面前有事没事道歉了，这也是不对的）。对于这一点，研究人员调皮地解释道，这是因为恋爱经验不够丰富的女性可能试不破男性们装可怜的伪装，或者是比较大度就一笔勾销（naive）；但是年长的经验丰富「不吃这套」。关于面部表情，咦，你要不看看我的书就知道了？\r\n\r\n欢迎移步购买支持《看脸》（购买地址：[Kindle](http%3A//www.amazon.cn/dp/B016Y0FQPS/ref%3Dkd_we_zhihu_web_221015) | [豆瓣](http%3A//read.douban.com/ebook/15209603/) | [网易](http://yuedu.163.com/source/40bbad1102354c0ca98d3145642c3c38_4) | [百度](http%3A//yuedu.baidu.com/ebook/a82718c2312b3169a551a48b) | [多看](http%3A//www.duokan.com/book/98606)）\r\n\r\n随着社交网络的发达，也有学者从社交网络这样相对匿名之处，研究了他人评价对我们的影响。有研究发现，当你的真人头像和朋友的回复比较契合时候，观众对你长相的评价最为积极。从这一点我们可以联想到，我们周围人对于我们的评价其实也会时时刻刻影响别人对我们的判断；尤其是在相亲或者经朋友介绍认识别人的时候。看来，要做个好人可不能「独善其身」，如果周围的人不觉得你好，也是不行的呢。比如买了粉，这个再一万个赞也怪怪的吧。',0,0,23.64,0,NULL,0,0,0,1,1460472442,1460715834),
	('prj2yae7lo','8','biezhi','啊实打实的','按时打算打算的',0,0,619.48,0,NULL,0,0,0,2,1487316430,1487316430),
	('prj2yalr3o','8','biezhi','分享一个Windows下类似alfred功能的软件Launchy','楼主在Win平台下以前用的一个快捷Dock。后来发现有个叫`Launchy`的东西，用起来很不错。\r\n\r\n虽说国人开发了一个叫 `Wox` 的东西，体验了一把，界面不咋地，用着有些许bug就删了。。。(表打我)\r\n\r\nLaunchy下载地址：[https://sourceforge.net/projects/launchy/](https://sourceforge.net/projects/launchy/)\r\n\r\nLaunchy 是一款免费开源的键盘快速启动软件，跨平台支持 Win、Mac 与 Linux！作者感觉到桌面上找图标什么的最无爱了，于是就写了这款实用的工具，没想到无心插柳，一下子就风靡了起来，世界上无数人都爱上了这个软件，那么它有什么神奇之处呢？一起来看看吧~\r\n\r\n![](http://i.imgur.com/SLciRIc.png)\r\n\r\n安装 Launchy 后，按Alt+空格键就可以唤出它的主界面了，是不是很简洁呢？只要把你想打开的程序的名字的一部分敲进去，有时甚至只敲了一个字母，Launchy 就帮你找到，按回车马上运行。Launchy 会自动索引你的开始菜单的项目，或者手动添加目录，它就能方便快速地启动应用程序、文件、文件夹或、快捷方式甚至是书签。如果想要自己添加常用的目录，只需要按下图中一二三步，设置一次，以后就不需要每次都打开了苦逼地寻找了。\r\n\r\n此外，Launchy 还拥有各种皮肤可以更换，你总能找到合适自己使用的，你可以在官方网站的[皮肤库](http://www.deviantart.com/browse/all/customization/skins/applaunchers/launchy/?order=5)中挑选。而且 Launchy 还提供了一些实用的插件扩展，如“关闭进程”、“快速关机”、“调用系统文件夹”等等，你可以去[这里](http://launchy.net/plugins.php)看看。\r\n\r\n![](http://i.imgur.com/NVz6EQO.png)\r\n\r\n![](http://i.imgur.com/hMMyErJ.png)\r\n\r\n最后，我想说，快速启动工具也有不少了，但是有许多软件不容易上手，还没有开始用就已经让人有点烦啦。\r\n\r\nLaunchy 在这一点上做得很好，立马就可以上手，而且真心提高了工作效率。反正还是那句话，没有最好的工具，只有最适合自己的工具。所以，有需求的同学不妨立马下载试试哦！\r\n\r\n觉得这篇帖子不错的话记得 `点赞`，`收藏`哦 :wink: \r\n',0,1,38.12,0,NULL,0,0,0,1,1461117478,1461140249),
	('qll2dldqjw','14','biezhi','简洁美观的Java论坛 - Java中国发布了','\r\nJava 中国是使用 [Blade](https://github.com/biezhi/blade) 搭建的一款轻量级论坛程序，目前发布第一个版本。开源地址是 [https://github.com/junicorn/java-china](https://github.com/junicorn/java-china)，请不要吝啬你的 `star` :joy:。\r\n\r\n## 特性\r\n\r\n- 免费开源，代码量少，易于维护\r\n- 外观简洁美观\r\n- 支持Emoji表情\r\n- 支持@用户\r\n- 支持Markdown语法\r\n- 更多特性，等你反馈\r\n\r\n## 如何使用？\r\n\r\n1. 下载源代码导入到你的IDE中\r\n2. 创建数据库并导入 `javachina.sql` 脚本\r\n3. 启动你的web容器即可访问\r\n\r\n## 相关配置\r\n\r\n这里有 3 个配置文件，除了 `blade.properties` 都可以不用修改。\r\n\r\n- app.version:当前应用版本号，用于强制刷新浏览器缓存\r\n- app.site_url:站点地址\r\n- app.db_cahce:是否启用数据库缓存，建议线上环境开启\r\n- app.aes_salt:AES加密盐值，用于Cookie等加密使用\r\n- qiniu:七牛CDN相关配置\r\n- github:github开发者密钥\r\n- email:邮箱配置，用户注册等邮件发送\r\n- db:数据库连接配置\r\n\r\n## 联系\r\n\r\n+ 如果你有好的想法或者愿意参与开源贡献，可以联系我的邮箱 biezhi.me#gmail\r\n+ 我们的QQ群：1013565 欢迎基佬加入 :smile: ',0,1,24.21,0,NULL,0,0,0,1,1460469846,1461140352),
	('qll2dpvq4x','47','biezhi','互联网教育到底如何？','## 各路大神来点评',0,1,688.15,5,NULL,0,2,0,1,1490375516,1490375516),
	('w8a1gjbxzq','48','biezhi','代码撸累了？来听首魔性歌曲','\r\n[mp3:35023442]\r\n\r\n:joy: 我就是叶良辰',0,0,40.66,0,NULL,0,0,0,1,1461218344,1461253840),
	('w8a1gjpmwl','47','helloo','新人报道','啊飒飒的撒的是\r\n\r\n```java\r\nSystem.out.println(\"Hello World\");\r\n```',0,0,611.49,0,NULL,0,0,0,2,1486914035,1486914035),
	('wxw2dmw4xy','8','jacks','分享一个网站，可以推送高清晰度视频到百度云盘','http://lightingnine.com \r\n\r\n想试试自己能有耐性做一个事情做到多久和多好，于是就有了这个网站。可以推送油管最高清晰度的视频到百度云盘…… 目前刚开始做，不足很多，大家轻拍 \r\n\r\n欢迎大家关注微博和多提意见，哈哈',0,0,22.90,0,NULL,0,0,0,1,1460470563,1460470563),
	('xdak8alaj7','40','doubi','什么样的程序员适合去创业公司','在如今创业公司纷纷倒闭的寒冬里讨论这个问题似乎多少有点儿不合时宜，然而正因为在这个倒闭潮里无数的程序员需要重新调整心态，再次出发寻找自己的位置，这个问题却恰恰显得重要。回答了它，我们就可以避免在将来的某个时候做出不适合自己的选择。\r\n\r\n\r\n从创业公司和程序员两个方面来看，有助于我们理清问题。\r\n\r\n## 一、创业公司都是什么鬼 \r\n\r\n我打算从两方面来讲，一个是创业公司的分类，一个创业公司的风险。\r\n\r\n### 1. 创业公司的分类 \r\n\r\n如果用万能的二分法，那这世上的创业公司分两类：\r\n\r\n1. 认真打磨产品做事的\r\n2. 讲故事忽悠投资人或用户钱的\r\n\r\n有一些缩写，比如B2B，B2C,B2B2C,O2O,C2C，讲企业或平台的商业（运营）模式。就是这种说出来别人不太明白、说的人却觉得很牛逼的、若干年后可能听起来会觉得很SB的缩写词儿，现在有了新的演绎，叫做2VC，2pre-A，2天使。就是用来讽刺那些只想讲故事忽悠钱的创业公司（团队）的。\r\n\r\n当然，很少有哪个创业公司会说自己是2VC的。就算是真的是，打死也不能承认啊。要知道2013、2014年，很多人急吼吼的拿着钱要投创业团队，一张嘴一页PPT就能拿到几百万的投资，产生2VC、2preA的团队（公司）也很正常。\r\n\r\n不管怎么说，这样的团队不少。这样的团队，拿的钱不是自己的，烧起来就不太知道心疼，又因为目的不纯正，没有抱持做事业的情怀，所以，其实，对技术、对产品、对研发团队、对程序员，都不怎么care，也没什么追求，就急着捞一把变现。\r\n\r\n这就是第二种。\r\n\r\n第一种的话，是值得敬佩的。我始终认为，产品是王道啊，能解决用户的问题是王道啊，向他们致敬。\r\n\r\n假如你是程序员，你要选择创业公司，我推荐第一种。不过还是等你看完我这篇文章再来定是否要选择一个创业公司。\r\n\r\n另外一种常见的二分法是基于钱来的：\r\n\r\n1. 不缺钱的创业公司\r\n2. 缺钱的创业公司\r\n\r\n有一些创业公司阵容特别豪华，堪称MVP团队，轻易就能拿到投资，比如创始人是来自阿里系、腾讯系、网易系、金山系、小米系、华为系等等，那这样的团队多数都很慷慨，所谓和土豪做朋友，总是好的，如果这样的团队找你来谈谈，那去打打酱油也是可以考虑的。\r\n\r\n还有一些团队属于有点儿想法但没钱的，这时就要另论了，需要再回到前面那个二分法去。假如这样的团队是想做产品的，而且产品也蛮靠谱，那可以考虑。假如他们是盲目创业跟风凑热闹想2VC还没找到门道，那就别浪费你的大好青春了。\r\n\r\n### 2. 创业公司带给程序员的风险\r\n\r\n有一部电视剧叫做《北京人在纽约》，是由郑晓龙、冯小刚执导，姜文和王姬主演，豪华阵容啊，男的又帅又有内涵，女的又漂亮又有气质，当时火得一塌糊涂。\r\n\r\n在这部电视剧里，有一句话特别流行，是这么说的：**如果你爱他，就送他去纽约，因为那里是天堂；如果你恨他，就送他去纽约，因为那里是地狱**。\r\n\r\n关于创业公司和程序员，我们可以套用一下：**“如果你爱他，就送他去创业公司，因为那里是天堂；如果你恨他，就送他去创业公司，因为那里是地狱。”**\r\n\r\nOK，是好是坏，全在个人感觉。所以呢，下面这部分风险罗列与提示，仅供参考。\r\n\r\n- 创业公司成功概率小，1%或者更低\r\n- 创业公司变现周期长，比如大家喜闻乐见的股票和期权，这种变现方式，只能等到公司上市或再融资，以上市为例，第一视频05年成立06年上市，那是火箭一般的速度啊；空中网也比较快，02年成立04年纳斯达克上市，用了2年2个月；聚美优品10年成立，14年上市，用了4年2个月……这都是快的，阿里巴巴十几年才上市，还有很多公司根本就没希望上市，唱的是“出师未捷身先死，长使英雄泪满襟”的戏，而大部分程序员假如的公司，都是最后面唱戏的这种\r\n- 创业公司也不是人人都有股份和期权……你懂的，即便你选中了1%的那些公司熬过了变现前的进行曲，也可能到时什么事儿都没你的……\r\n- 创业公司工作不规律，OK，这是灰常常见的，比如各种加班，结婚的加班到妻离子散，有女朋友的加班到单身，单身的加班到没有朋友……\r\n- 个人定位不清晰，你懂的，成长快么，全栈么，一个人顶10个人用么，哪里缺人顶哪里么，如果你缺乏适应性，可能会风中凌乱或精神分裂\r\n\r\n还有一些，不再列举，如果你身边有创业公司，可以自己观察观察自行脑补。\r\n\r\n### 3. 创业公司能带给程序员什么\r\n\r\n咱不能只说不靠谱和风险，还得说说创业公司能给程序员带来的好处。其实，就像股市，风险与收益共存。我总结了一下，大概有下列好处：\r\n\r\n- 成长很快，这点不必多说，你要独挡N面，今年25，明年52。呃，又说错了，其实我想说的是，你要独挡N面，技术视野会更广阔，你要独自解决问题，技术修为也可能更精深。\r\n- 公司快速成长带来了员工收入快速上升的机会，想想吧，在处在成长期的行业里，又在成长期的公司里，机会大大滴\r\n- 参与感、成就感，你会比稳定的大公司更容易深度参与产品的设计、开发、运营，你的汗与泪会浸润产品的每个细节，想象一下用户在使用时发自内心的愉悦和赞叹，美死了吧。\r\n- 完整经历产品及公司运作流程的机会\r\n- 股票、期权变现的可能，这是一夜暴富改变社会财富分配的可能性，阿里上市诞生了多少千万富翁啊\r\n- ……\r\n\r\n还有很多，请随意补充。\r\n\r\n## 二、哪类程序员适合加入创业公司\r\n\r\n从创业公司的这面看完了，该从程序员这厢看看了。\r\n\r\n### 1. 程序员啊你要什么\r\n\r\n在决定去创业公司前，最应该想清楚的，是自己要什么。通常一个程序员在面对创业公司伸出的橄榄枝时，无非考虑下面几种诉求：\r\n\r\n- 钱景如何\r\n- 技术成长性\r\n- 产品调性是否符合个人倾向\r\n- 能否成为核心人员共享公司未来的成长\r\n\r\n唯有你清楚自己求什么，才能决断一个初创公司是否适合自己。这是最根本的，必须慎重考虑，同时也只能自己决定。\r\n\r\n除了这种根本性的因素，还有一些非常现实的因素，从不同侧面与这些根本要素相辉映，会影响到一个程序员的选择，也有必要来看看。\r\n\r\n### 2. 生涯发展理论与创业公司\r\n\r\n舒伯于1953年提出“生涯”的概念，后来发展出生涯发展理论，将人自我实现的过程分为五个阶段，在每个阶段都有其独特的职责和角色，以及不同的发展任务。详见下图： \r\n\r\n![](http://i.imgur.com/5tp7E9g.png)\r\n\r\n上图的五个阶段中，每个阶段又可以细分为更小的阶段。对程序员来讲，有两个阶段是要特别注意的。\r\n\r\n- 探索阶段中的试行期，22岁~24岁，个人初步确定自己的职业并试验其成为长期发展领域的可能性。\r\n- 建立阶段中的安定期，31岁~44岁，个体致力于工作上的稳固，大部分人处于最具创意时期，由于资深往往业绩优良。\r\n\r\n**试行期**\r\n\r\n我们先说试行期，这往往是大学毕业没多久、寻找适合的职业的时期。这个阶段的主要任务，一个是选择适合自己的工作，一个是快速累积专业技能。\r\n\r\n一个程序员在这个阶段，年轻，从时间方面看也有一些资本，同时又没有太大的家庭经济压力，快速试错也没什么大不了的，顶多浪费一点点时间，所以，可以大胆尝试。在这个阶段，我觉得可以加入创业公司去见识一下。当然，前提还是要结合自己的需求，看公司能提供什么样的平台你能获得什么样的成长。\r\n\r\n**倦怠期**\r\n\r\n31~44岁是安定期，这个时期里边又有一段时间是需要特别注意的危机期：稳定工作将近十年（35岁~40岁）。在35~40岁这个时期，有一部分程序员就会发现，向上没有发展空间，晋升受挫，会倦怠，会迷惘，于是有想法的人往往静极思动，想要出来看看了，这就是所谓的倦怠期。\r\n\r\n处于倦怠期的程序员，经济上基本也没太大压力了。再加上正是年富力强的时候，工作能力和业绩通常也不错，外界会有很多橄榄枝伸过来，自己也春心萌动，干柴烈火一点就着。所以，很多人此时也会跃跃欲试，愿意自己创业或加入到创业公司中，谋取将来的规模化收益。所以，我们会看到，很多创业者年龄就落在这个区间，很多创业公司的技术骨干也处在这个区间。\r\n\r\n**成家立业期**\r\n\r\n除了前面提到的两个时期，人的一生还有一个危机期，就是成家立业期，年龄段是25~30岁。\r\n\r\n从舒伯的生涯发展阶段理论看，25~30岁，又是建立阶段中的修正期。这个时期，应该找到一份稳定的职业并逐渐稳定，为后来的安定期做准备。\r\n\r\n修正期和成家立业期的重叠，给我们带来很大压力，相信这个年龄段的朋友们都深有体会：如果你还没有另一半还没结婚的打算，就会被爸爸妈妈以及七大姑八大姨还有远方小表妹逼婚了。\r\n\r\n处在成家立业期的程序员，应该需要为成家做准备了（我指一般人儿，如果你是非主流，请一笑而过），此时应该考虑工作稳定，加入创业公司要小心，越接近30越要小心哦。孔子说，三十而立，是非常有道理的。假如30岁了，还吊儿郎当的，吃了上顿没下顿，干两个月换个地方，那后面就很难“立”起来，也没哪个丈母娘愿意把美丽的姑娘送到你身边。\r\n\r\n### 3. 程序员的支持系统\r\n\r\n结合我们前面说的创业公司的一些风险，那一个程序员面临创业公司的机会，要不要选择加入，除了上面说的生涯发展阶段可供参考外，还有很重要的就是个人本身的实际情况。\r\n\r\n首先一点，是有一颗不安分的心，想要追寻梦想。假如你是想有个稳定工作拿个固定薪水过安稳日子的类型，就不用考虑创业公司了。假如你想三五年后实现“让天下没有难做的生意”的目标，同时自己也能身价倍增收入翻上N翻，那就可以跑出来遛遛了。\r\n\r\n其次就是要有拼劲儿，到创业公司就是受苦受累搏明天的，你要说每天看个报纸喝杯茶还能到纳斯达克敲钟，打死我也不信。\r\n\r\n再次就是经济压力的考量。不管哪个年龄阶段，假如你的收入不稳定，你或者你的家庭生活就无法维持下去，那最好还是不要冒险。假如你一人吃饱全家不饿或者你另一半有稳定收入能维持生活又愿意成全你搏个出位，那就算是没有后顾之忧了，放手去干。\r\n\r\n接下来就是要有承担风险的预期，因为有可能你加入的公司一年半载后关门大吉，你的工资也拿不到。还有可能你会降薪加入一个创业公司，到时公司倒了期权黄了，你还浮亏多少多少万，各种悲催啊，要能承受得住。\r\n\r\n最后还要有足够的灵活性和适应性。根据前面对创业公司的分析，创业公司往往是瞬息万变一人多用，你的角色不太可能固定下来，要有到处搬砖的准备，也要有到处搬砖的能力。假如你是那种认为自己是开发工程师打死也不做运维的活儿的程序员，那还是要慎重考虑一下吧。\r\n\r\n好啦，说了不少，不知道对你是否有帮助。最后要提醒的是，创业有风险，创业公司也有风险，选择需谨慎。',0,1,34.66,0,NULL,0,0,0,1,1460956833,1460997068),
	('xdak8kql81','8','biezhi','再来一个帖子','分享。。。',0,0,687.47,0,NULL,0,0,0,2,1490376146,1490376146),
	('y9v2qjon93','8','XingFly','分享一个 JavaWeb的学习网站。有一些关于Spring Boot的知识','www.tianmaying.com',0,0,38.58,0,NULL,0,0,0,1,1461129372,1461216121),
	('y9y1jyadpb','33','Zyt1026','一个女孩',':good:  一个女孩子帮老公做测试',0,0,35.37,0,NULL,0,0,0,1,1460993728,1461034183),
	('zqy29ev7n4','8','rex_8090','分享一个ascii流程图生成站点','\r\n[http://asciiflow.com](http://asciiflow.com/)\r\n\r\n还有一个 `Javascript` 版本的 [http://adrai.github.io/flowchart.js](http://adrai.github.io/flowchart.js/)\r\n\r\n:new_moon_with_face: 不用谢我，我叫雷锋 ',0,1,37.18,0,NULL,0,0,0,1,1461070232,1461140441),
	('zvr1erjxz0','17','biezhi','上海的同学你们都用什么网络呢？','**RT：准备切换电信，长宽实在卡成翔**',0,0,26.67,0,NULL,0,0,0,1,1460640058,1460640058),
	('zvr1erkgjr','28','biezhi','求Nginx+Tomcat配置session共享的正确姿势','坐等大神解答。memcached试了没成功，你们都是用哪种方式做的呢？\r\n\r\n老司机来分享一下经验。',0,0,29.82,0,NULL,0,0,0,1,1460735048,1461057159);

/*!40000 ALTER TABLE `t_topic` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(64) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像',
  `email` varchar(100) NOT NULL COMMENT '电子邮箱',
  `topics` int(10) DEFAULT '0' COMMENT '发布的帖子数',
  `role_id` tinyint(2) DEFAULT '5' COMMENT '5:普通用户 2:管理员 1:系统管理员',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0:待激活 1:正常 2：删除',
  `created` int(10) NOT NULL COMMENT '创建时间',
  `lastlogin` int(10) NOT NULL COMMENT '最后一次操作时间',
  `updated` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `idx_username` (`username`),
  KEY `idx_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;

INSERT INTO `t_user` (`uid`, `username`, `password`, `avatar`, `email`, `topics`, `role_id`, `status`, `created`, `lastlogin`, `updated`)
VALUES
	(1,'biezhi','916a042f1bde53eba1e49cd59cf4eb75','avatar/biezhi/PR6L/7294.jpg','biezhi.me@gmail.com',0,1,1,1410944818,1494150896,NULL),
	(2,'jacks','ba152812e0625a7b3f06d874c76a4227','avatar/default/2.png','jacks@java-china.org',0,5,1,1410944818,1410944818,NULL),
	(3,'kiyoumi','95d2cd9213ac2c8f477e3fa704099ff5','avatar/default/1.png','kiyoumi@java-china.org',0,5,1,1410944818,1410944818,NULL),
	(4,'lala','32068ed247a0fa371d162185d3f51861','avatar/default/3.png','lala@java-china.org',0,5,1,1410944818,1410944818,NULL),
	(5,'doubi','7b503366dbaeb4bbdb542c49c5ece63d','avatar/default/4.png','doubi@java-china.org',0,5,1,1410944818,1410944818,NULL),
	(6,'im_wangjue_NO1','7ed715e7fe818860a212646c1da830f2','avatar/default/2.png','351711778@qq.com',0,5,1,1460639261,1460639261,NULL),
	(7,'lichee','3808575efd4d0ae4cb43f535e2c14cb1','avatar/lichee/kiKO/6394.jpg','z@lichee.me',0,5,1,1460639488,1460639488,NULL),
	(8,'XingFly','56bdfa42ac2c35fbe992f5c6190be0d6','avatar/default/1.png','549052145@qq.com',0,5,1,1460650525,1460650525,NULL),
	(9,'kexun','2da754a873d09ef5bd0086fd507ad9f8','avatar/default/1.png','qianchj@163.com',0,5,1,1460681929,1460681929,NULL),
	(10,'uilzzw','c5573e0da4a29b24ea907f94683e31f8','avatar/default/1.png','uilzzw@gmail.com',0,5,1,1460682181,1494152073,NULL),
	(11,'hezhezhiyu','e5abfe520f6582676da2ab34790981a2','avatar/default/3.png','84785027@qq.com',0,5,1,1460728178,1460728178,NULL),
	(12,'ssnoodles','e3c4e1401b3162c47ec7a42162a46602','avatar/default/0.png','ssnoodles0226@gmail.com',0,5,1,1460769332,1460769332,NULL),
	(13,'lvdong5830','1072b5ba593f578e30d018895a03dc73','avatar/lvdong5830/RxI2/8751.png','425280895@qq.com',0,5,1,1460786636,1460786636,NULL),
	(14,'Shildon','9d53aa31eabb5d3897ed3e514c4ed976','avatar/default/4.png','shildondu@gmail.com',0,5,1,1460809033,1460809033,NULL),
	(15,'DamagedBoy','fe858b0d10667237df5b53ebbe91c300','avatar/default/1.png','lwt_workmail@163.com',0,5,1,1460960047,1460960047,NULL),
	(16,'wuyun','ca4dc20ccc1497c834edd76e211e3b34','avatar/wuyun/cyf3/4366.jpeg','tao0329@126.com',0,5,1,1460960985,1460960985,NULL),
	(17,'Zyt1026','293d3d3a475c455c243aa349a0ec61bf','avatar/Zyt1026/3YRH/7129.jpg','9059322@qq.com',0,5,1,1460992863,1460992863,NULL),
	(18,'yoryor','3d609e6f239ca2d84651e37d34f59e77','avatar/default/1.png','yoryor@lovexwf.me',0,5,1,1461044100,1461044100,NULL),
	(19,'rex_8090','cecacbd07e7fb7a92233825c2d7f62eb','avatar/default/0.png','rex_8090@sina.com',0,5,1,1461054229,1461054229,NULL),
	(20,'jack','06feedfb754b5d0e3d778481839f8215','avatar/default/0.png','244258241@qq.com',0,5,1,1461059206,1461059206,NULL),
	(21,'Levan','b1ef1d78c557b4f99bf3e8ff90a91925','avatar/default/4.png','1094955064@qq.com',0,5,1,1461070401,1461070401,NULL),
	(22,'winry','3fbc1e7a9c2eb8c5b3eeb9ebd7964d18','avatar/default/3.png','fwrq41251@gmail.com',0,5,1,1461120033,1461120033,NULL),
	(23,'dingguitao','6626c6d4d66c3e5c5282c2769766cf89','avatar/default/4.png','haitao19892006@126.com',0,5,1,1461147164,1461147164,NULL),
	(24,'mask_9523','174b4e336c7bccae4a3cdc48a235cf97','avatar/default/1.png','18510855440@sina.cn',0,5,1,1461287493,1461287493,NULL),
	(25,'Jack','ec1dddc5f0231aa52b6980e56810526f','avatar/default/1.png','244258241@qq.com',0,5,1,1461293422,1461293422,NULL),
	(32,'mycc','8090e1aa1f58d24e6b993dd7526b8f44','avatar/default/2.png','renqi@laicaijie.com',0,5,1,1483113920,1483113920,NULL),
	(33,'helloo','82af0d15b0040e1007cd298673f2fd32','avatar/default/0.png','921293209@qq.com',0,5,1,1486913821,1486913821,NULL),
	(34,'hello1111','d93d2135c10af01907898893193cc667','avatar/default/3.png','2223213951@qq.com',0,5,0,1489673535,1489673535,NULL);

/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_userinfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_userinfo`;

CREATE TABLE `t_userinfo` (
  `uid` int(11) NOT NULL,
  `nick_name` varchar(30) DEFAULT NULL,
  `jobs` varchar(100) DEFAULT NULL,
  `web_site` varchar(255) DEFAULT NULL,
  `github` varchar(20) DEFAULT NULL,
  `weibo` varchar(50) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `signature` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `instructions` text CHARACTER SET utf8mb4,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_userinfo` WRITE;
/*!40000 ALTER TABLE `t_userinfo` DISABLE KEYS */;

INSERT INTO `t_userinfo` (`uid`, `nick_name`, `jobs`, `web_site`, `github`, `weibo`, `location`, `signature`, `instructions`)
VALUES
	(1,'王爵','Web Dev!','https://biezhi.me','biezhi','5238733773','上海','个性无需签名','Hello World :new_moon_with_face:'),
	(2,'帅比杰克','网络公关',NULL,NULL,NULL,'广州','我就是帅',NULL),
	(3,'美少女','打酱油的',NULL,NULL,NULL,'日本东京','biubiubiu～',NULL),
	(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(14,NULL,NULL,'https://github.com/XiaodongDu','XiaodongDu',NULL,NULL,NULL,NULL),
	(15,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(16,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(33,NULL,'asasa',NULL,NULL,NULL,NULL,NULL,NULL),
	(34,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `t_userinfo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_userlog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_userlog`;

CREATE TABLE `t_userlog` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `action` varchar(100) NOT NULL,
  `content` text,
  `ip` varchar(50) DEFAULT NULL,
  `agent` varchar(20) DEFAULT NULL,
  `created` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `t_userlog` WRITE;
/*!40000 ALTER TABLE `t_userlog` DISABLE KEYS */;

INSERT INTO `t_userlog` (`id`, `uid`, `action`, `content`, `ip`, `agent`, `created`)
VALUES
	(179,9,'add_comment','雷锋你好','103.250.195.130',NULL,1461114441),
	(180,1,'signin','biezhi','180.168.136.74',NULL,1461115980),
	(181,1,'add_topic','楼主在Win平台下以前用的一个快捷Dock。后来发现有个叫`Launchy`的东西，用起来很不错。\r\n\r\n虽说国人开发了一个叫 `Wox` 的东西，体验了一把，界面不咋地，用着有些许bug就删了。。。(表打我)\r\n\r\nLaunchy下载地址：[https://sourceforge.net/projects/launchy/](https://sourceforge.net/projects/launchy/)\r\n\r\nLaunchy 是一款免费开源的键盘快速启动软件，跨平台支持 Win、Mac 与 Linux！作者感觉到桌面上找图标什么的最无爱了，于是就写了这款实用的工具，没想到无心插柳，一下子就风靡了起来，世界上无数人都爱上了这个软件，那么它有什么神奇之处呢？一起来看看吧~\r\n\r\n![](http://i.imgur.com/SLciRIc.png)\r\n\r\n安装 Launchy 后，按Alt+空格键就可以唤出它的主界面了，是不是很简洁呢？只要把你想打开的程序的名字的一部分敲进去，有时甚至只敲了一个字母，Launchy 就帮你找到，按回车马上运行。Launchy 会自动索引你的开始菜单的项目，或者手动添加目录，它就能方便快速地启动应用程序、文件、文件夹或、快捷方式甚至是书签。如果想要自己添加常用的目录，只需要按下图中一二三步，设置一次，以后就不需要每次都打开了苦逼地寻找了。\r\n\r\n此外，Launchy 还拥有各种皮肤可以更换，你总能找到合适自己使用的，你可以在官方网站的[皮肤库](http://www.deviantart.com/browse/all/customization/skins/applaunchers/launchy/?order=5)中挑选。而且 Launchy 还提供了一些实用的插件扩展，如“关闭进程”、“快速关机”、“调用系统文件夹”等等，你可以去[这里](http://launchy.net/plugins.php)看看。\r\n\r\n![](http://i.imgur.com/NVz6EQO.png)\r\n\r\n![](http://i.imgur.com/hMMyErJ.png)\r\n\r\n最后，我想说，快速启动工具也有不少了，但是有许多软件不容易上手，还没有开始用就已经让人有点烦啦。\r\n\r\nLaunchy 在这一点上做得很好，立马就可以上手，而且真心提高了工作效率。反正还是那句话，没有最好的工具，只有最适合自己的工具。所以，有需求的同学不妨立马下载试试哦！\r\n\r\n觉得这篇帖子不错的话记得 `点赞`，`收藏`哦 :wink: \r\n','180.168.136.74',NULL,1461117478),
	(182,1,'essence','23:1','180.168.136.74',NULL,1461117492),
	(183,7,'add_comment','尝试下,桌面图标满了~:cry:','218.76.31.42',NULL,1461120000),
	(184,0,'send_mail','fwrq41251@gmail.com:elXcEUzXgCFTxPYVLOfOBV188kh9WREL:signup','45.78.43.130',NULL,1461120034),
	(185,22,'signup','winry:fwrq41251@gmail.com','45.78.43.130',NULL,1461120034),
	(186,22,'signin','winry','45.78.43.130',NULL,1461120076),
	(187,7,'add_topic','其他论坛比较常见的功能','218.76.31.42',NULL,1461121843),
	(188,1,'add_comment','1. 帖子编辑马上就可以使用了。\r\n2. 帖子的删除功能不打算开发，过激话题会被管理员删除。\r\n\r\n帖子是可以被收藏和分享的，一旦发布就无法删除，不然你删了其他用户都看不到了，这点不可以改变的。\r\n\r\n:blush: 感谢你的反馈，社区将变得更好！','180.168.136.74',NULL,1461123122),
	(189,16,'signin','wuyun','1.194.19.27',NULL,1461125153),
	(190,8,'signin','XingFly','117.158.202.6',NULL,1461129280),
	(191,8,'add_topic','www.tianmaying.com','117.158.202.6',NULL,1461129372),
	(192,1,'add_comment','这个网站还不错，很多代码和例子。','45.32.41.238',NULL,1461136932),
	(193,16,'signin','wuyun','1.194.19.27',NULL,1461138298),
	(194,5,'signin','doubi','45.32.41.238',NULL,1461140173),
	(195,5,'add_comment','Launchy :plus1: 我也在用这个','45.32.41.238',NULL,1461140249),
	(196,5,'add_comment',':good: 支持一个','45.32.41.238',NULL,1461140352),
	(197,5,'add_comment',':joy: 雷锋你人真好，搞基吗？','45.32.41.238',NULL,1461140441),
	(198,5,'add_comment','收藏，爱心双手奉上 :heartpulse: ','45.32.41.238',NULL,1461140532),
	(199,5,'add_comment','类似于慕课网和极客学院啊。。不过学习主要还是靠自己。','45.32.41.238',NULL,1461140732),
	(200,0,'send_mail','haitao19892006@126.com:gHHN4G7YG0GjdOwCG4twm77Jy5iFibOg:signup','203.166.222.86',NULL,1461147164),
	(201,23,'signup','dingguitao:haitao19892006@126.com','203.166.222.86',NULL,1461147164),
	(202,23,'signin','dingguitao','203.166.222.86',NULL,1461147278),
	(203,7,'add_comment',':smile:','175.0.245.244',NULL,1461155334),
	(204,9,'add_comment','建议增加一个url解析功能，直接可以点击跳转页面','103.250.195.130',NULL,1461200775),
	(205,1,'signin','biezhi','180.168.136.74',NULL,1461215853),
	(206,1,'add_comment','@kexun 可以的哦，他没有按照markdown格式写而已。可以看 [这里](http://java-china.org/markdown)','180.168.136.74',NULL,1461216122),
	(207,1,'add_topic','\r\n[mp3:35023442]\r\n\r\n:joy: 我就是叶良辰','180.168.136.74',NULL,1461218344),
	(208,17,'signin','Zyt1026','180.168.136.74',NULL,1461223566),
	(209,17,'add_comment',':joy_cat: 醉了。。','180.168.136.74',NULL,1461223589),
	(210,1,'signin','biezhi','180.168.136.74',NULL,1461224785),
	(211,2,'signin','jacks','180.168.136.74',NULL,1461234604),
	(212,2,'add_comment',':clap: :clap: :clap: 良辰你好，我是赵日天！','180.168.136.74',NULL,1461234684),
	(60,9,'signin','kexun','103.250.195.130',NULL,1460685722),
	(61,9,'signin','kexun','103.250.195.130',NULL,1460685761),
	(62,8,'signin','XingFly','219.156.42.80',NULL,1460687174),
	(63,1,'signin','biezhi','180.168.136.74',NULL,1460707667),
	(64,1,'signin','biezhi','180.168.136.74',NULL,1460712732),
	(65,1,'signin','biezhi','180.168.136.74',NULL,1460712756),
	(66,1,'signin','biezhi','180.168.136.74',NULL,1460712798),
	(67,1,'signin','biezhi','180.168.136.74',NULL,1460712849),
	(68,1,'signin','biezhi','180.168.136.74',NULL,1460713188),
	(69,1,'signin','biezhi','180.168.136.74',NULL,1460713828),
	(70,1,'signin','biezhi','180.168.136.74',NULL,1460713922),
	(71,1,'signin','biezhi','180.168.136.74',NULL,1460714421),
	(72,1,'signin','biezhi','180.168.136.74',NULL,1460714939),
	(73,1,'signin','biezhi','180.168.136.74',NULL,1460715050),
	(74,7,'add_comment','看来我自尊很高嘛','218.76.31.42',NULL,1460715812),
	(75,7,'add_comment','what','218.76.31.42',NULL,1460715834),
	(76,1,'signin','biezhi','113.52.133.180',NULL,1460723429),
	(77,0,'send_mail','84785027@qq.com:OVS1w1eKpqqP9E02NEHLZJ4tgFCbqn0N:signup','120.52.24.193',NULL,1460728178),
	(78,11,'signup','hezhezhiyu:84785027@qq.com','120.52.24.193',NULL,1460728178),
	(79,1,'signin','biezhi','116.251.211.11',NULL,1460734100),
	(80,1,'signin','biezhi','116.216.0.50',NULL,1460734305),
	(81,1,'signin','biezhi','116.251.211.11',NULL,1460734949),
	(82,1,'add_topic','坐等大神解答。memcached试了没成功，你们都是用哪种方式做的呢？\r\n\r\n老司机来分享一下经验。','116.251.211.11',NULL,1460735048),
	(83,11,'signin','hezhezhiyu','123.150.182.17',NULL,1460765511),
	(84,11,'signin','hezhezhiyu','124.206.140.194',NULL,1460766962),
	(85,11,'add_topic','魔镜呀魔镜，谁是最帅的帅逼。？\r\n魔镜：主人就是最帅的帅逼。\r\n哈哈哈哈哈哈，魔镜啊魔镜再问你一个问题，谁的代码撸的最好\r\n魔镜：啥？报告主人，撸代码伤身体，要节制！！！！！！！！\r\n','118.244.254.2',NULL,1460767138),
	(86,0,'send_mail','ssnoodles0226@gmail.com:eZwBLeiSkTdkhXrUcSFnBwOHYMSUNvrt:signup','112.87.42.242',NULL,1460769332),
	(87,12,'signup','ssnoodles:ssnoodles0226@gmail.com','112.87.42.242',NULL,1460769332),
	(88,12,'signin','ssnoodles','112.87.42.242',NULL,1460769611),
	(89,1,'signin','biezhi','116.216.0.50',NULL,1460779669),
	(90,1,'add_comment','## 楼主这个逼装的我给100分','116.216.0.50',NULL,1460779726),
	(91,11,'signin','hezhezhiyu','118.244.254.2',NULL,1460781824),
	(92,11,'add_comment','@biezhi 层主这个回复我给99分。','124.206.140.194',NULL,1460781843),
	(93,0,'send_mail','425280895@qq.com:G8RSUl7okYo0TeILGrAKuwahVkTIxDXu:signup','122.96.226.85',NULL,1460786636),
	(94,13,'signup','lvdong5830:425280895@qq.com','122.96.226.85',NULL,1460786636),
	(95,13,'signin','lvdong5830','122.96.226.85',NULL,1460786665),
	(96,13,'add_comment','支持','122.96.226.85',NULL,1460786675),
	(97,11,'signin','hezhezhiyu','36.110.14.50',NULL,1460792310),
	(98,1,'signin','biezhi','116.251.218.99',NULL,1460801608),
	(99,1,'signin','biezhi','116.251.218.99',NULL,1460804209),
	(100,1,'signin','biezhi','116.251.218.99',NULL,1460804448),
	(101,1,'signin','biezhi','116.251.218.99',NULL,1460805295),
	(102,1,'essence','14:1','116.251.218.99',NULL,1460805614),
	(103,0,'send_mail','shildondu@gmail.com:7xqDuewr4Aga2n0hBeyFCaxSB5BSeWlf:signup','120.236.172.6',NULL,1460809033),
	(104,14,'signin','Shildon','120.236.172.6',NULL,1460809081),
	(105,1,'signin','biezhi','113.52.133.180',NULL,1460819883),
	(106,1,'signin','biezhi','113.52.133.180',NULL,1460820069),
	(107,1,'essence','9:1','113.52.133.180',NULL,1460820093),
	(108,1,'add_comment','好文先收藏了。','113.52.133.180',NULL,1460820128),
	(109,1,'signin','biezhi','116.251.209.30',NULL,1460822632),
	(110,14,'signin','Shildon','120.236.172.6',NULL,1460864537),
	(111,8,'signin','XingFly','125.47.76.254',NULL,1460866089),
	(112,1,'signin','biezhi','106.186.125.19',NULL,1460885863),
	(113,1,'add_topic','**作为linux服务器管理员,经常要使用ssh登陆到远程linux机器上做一些耗时的操作。**\r\n\r\n也许你遇到过使用telnet或SSH远程登录linux,运行一些程序。如果这些程序需要运行很长时间(几个小时)，而程序运行过程中出现网络故障，或者客户机故障，这时候客户机与远程服务器的链接将终端，并且远程服务器没有正常结束的命令将被迫终止。\r\n\r\n又比如你SSH到主机上后，开始批量的scp命令，如果这个ssh线程断线了，scp进程就中断了。在远程服务器上正在运行某些耗时的作业，但是工作还没做完快要下班了，退出的话就会中断操作了，如何才好呢？\r\n\r\n我们利用screen命令可以很好的解决这个问题。实现在断开SSH的情况下,在服务器上继续执行程序。\r\n\r\n**那什么是screen命令?**\r\n\r\n> Screen被称之为一个全屏窗口管理器，用他可以轻松在一个物理终端上获得多个虚拟终端的效果。\r\n\r\nScreen功能说明：\r\n\r\n简单来说，Screen是一个可以在多个进程之间多路复用一个物理终端的窗口管理器,这意味着你能够使用一个单一的终端窗口运行多终端的应用。Screen中有会话的概念，用户可以在一个screen会话中创建多个screen窗口，在每一个screen窗口中就像操作一个真实的telnet/SSH连接窗口那样。\r\n\r\n**Screen命令语法：**\r\n\r\n```sh\r\nscreen [-AmRvx -ls -wipe][-d <作业名称>][-h <行数>][-r <作业名称>][-s ][-S <作业名称>]\r\n```\r\n\r\n**Screen命令参数：**\r\n\r\n- -A -[r|R]          将所有的视窗都调整为目前终端机的大小。\r\n- -c filename        用指定的filename文件替代screen的配置文件’.screenrc’.\r\n- -d [pid.tty.host]  断开screen进程(使用该命令时，screen的状态一定要是Attached，也就是说有用户连在screen里)。一般进程的名字是以pid.tty.host这种形式表示(用screen -list命令可以看出状态)。\r\n- -D [pid.tty.host]  与-d命令实现一样的功能，区别就是如果执行成功，会踢掉原来在screen里的用户并让他logout。\r\n- -h <行数> 　       指定视窗的缓冲区行数。\r\n\r\n- -ls或–list        显示目前所有的screen作业。\r\n- -m                    即使目前已在作业中的screen作业，仍强制建立新的screen作业。\r\n- -p number or name  预先选择一个窗口。\r\n- -r [pid.tty.host]  恢复离线的screen进程，如果有多个断开的进程，需要指定[pid.tty.host]\r\n- -R                      先试图恢复离线的作业。若找不到离线的作业，即建立新的screen作业。\r\n-s shell             指定建立新视窗时，所要执行的shell。\r\n-S <作业名称>  指定screen作业的名称。(用来替代[pid.tty.host]的命名方式,可以简化操作).\r\n-v                     显示版本信息。\r\n-wipe                检查目前所有的screen作业，并删除已经无法使用的screen作业。\r\n-x                     恢复之前离线的screen作业。\r\n\r\n**Screen命令的常规用法:**\r\n\r\n`screen -d -r`:连接一个screen进程，如果该进程是attached，就先踢掉远端用户再连接。\r\n\r\n`screen -D -r`:连接一个screen进程，如果该进程是attached，就先踢掉远端用户并让他logout再连接\r\n\r\n`screen -ls`或者`-list`:显示存在的screen进程，常用命令\r\n\r\n`screen -m`:如果在一个Screen进程里，用快捷键crtl+a c或者直接打screen可以创建一个新窗口,screen -m可以新建一个screen进程。\r\n\r\n`screen -dm`:新建一个screen，并默认是detached模式，也就是建好之后不会连上去。\r\n\r\n`screen -p number or name`:预先选择一个窗口。\r\n\r\n**Screen实现后台运行程序的简单步骤:**\r\n\r\n1.要进行某项操作时，先使用命令创建一个Screen:\r\n\r\n```sh\r\n[linux@user~]$ screen -S test1\r\n```\r\n\r\n2.接着就可以在里面进行操作了，如果你的任务还没完成就要走开的话，使用命令保留Screen：\r\n\r\n```sh\r\n[linux@user~]$ Ctrl+a+d                    #按Ctrl+a，然后再按d即可保留Screen\r\n[detached]                                 #这时会显示出这个提示，说明已经保留好Screen了\r\n```\r\n\r\n**如果你工作完成的话，就直接输入:**\r\n\r\n```sh\r\n[linux@user~]$ exit                        #这样就表示成功退出了\r\n[screen is terminating]\r\n```\r\n\r\n3.如果你上一次保留了Screen，可以使用命令查看:\r\n\r\n```sh\r\n[linux@user~]$ screen -ls\r\nThere is a screen on:\r\n9649.test1   (Detached)\r\n```\r\n\r\n恢复Screen，使用命令：\r\n\r\n```sh\r\n[linux@user~]$ screen -r test1 (or 9649)\r\n```\r\n\r\n**Screen命令中用到的快捷键**\r\n\r\n* Ctrl+a c ：创建窗口\r\n* Ctrl+a w ：窗口列表\r\n* Ctrl+a n ：下一个窗口\r\n* Ctrl+a p ：上一个窗口\r\n* Ctrl+a 0-9 ：在第0个窗口和第9个窗口之间切换\r\n* Ctrl+a K(大写) ：关闭当前窗口，并且切换到下一个窗口（当退出最后一个窗口时，该终端自动终止，并且退回到原始shell状态）\r\n* exit ：关闭当前窗口，并且切换到下一个窗口（当退出最后一个窗口时，该终端自动终止，并且退回到原始shell状态）\r\n* Ctrl+a d ：退出当前终端，返回加载screen前的shell命令状态\r\n\r\n**Linux的screen命令挺不错，在服务器上做点什么费时的工作就不用愁了！**','106.186.125.19',NULL,1460889435),
	(114,1,'essence','15:1','106.186.125.19',NULL,1460890165),
	(115,1,'signin','biezhi','116.227.142.201',NULL,1460890617),
	(116,1,'signin','biezhi','106.187.94.204',NULL,1460907414),
	(117,5,'signin','doubi','180.168.136.74',NULL,1460955834),
	(118,1,'signin','biezhi','180.168.136.74',NULL,1460956084),
	(119,5,'signin','doubi','180.168.136.74',NULL,1460956182),
	(120,5,'add_topic','在如今创业公司纷纷倒闭的寒冬里讨论这个问题似乎多少有点儿不合时宜，然而正因为在这个倒闭潮里无数的程序员需要重新调整心态，再次出发寻找自己的位置，这个问题却恰恰显得重要。回答了它，我们就可以避免在将来的某个时候做出不适合自己的选择。\r\n\r\n\r\n从创业公司和程序员两个方面来看，有助于我们理清问题。\r\n\r\n## 一、创业公司都是什么鬼 \r\n\r\n我打算从两方面来讲，一个是创业公司的分类，一个创业公司的风险。\r\n\r\n### 1. 创业公司的分类 \r\n\r\n如果用万能的二分法，那这世上的创业公司分两类：\r\n\r\n1. 认真打磨产品做事的\r\n2. 讲故事忽悠投资人或用户钱的\r\n\r\n有一些缩写，比如B2B，B2C,B2B2C,O2O,C2C，讲企业或平台的商业（运营）模式。就是这种说出来别人不太明白、说的人却觉得很牛逼的、若干年后可能听起来会觉得很SB的缩写词儿，现在有了新的演绎，叫做2VC，2pre-A，2天使。就是用来讽刺那些只想讲故事忽悠钱的创业公司（团队）的。\r\n\r\n当然，很少有哪个创业公司会说自己是2VC的。就算是真的是，打死也不能承认啊。要知道2013、2014年，很多人急吼吼的拿着钱要投创业团队，一张嘴一页PPT就能拿到几百万的投资，产生2VC、2preA的团队（公司）也很正常。\r\n\r\n不管怎么说，这样的团队不少。这样的团队，拿的钱不是自己的，烧起来就不太知道心疼，又因为目的不纯正，没有抱持做事业的情怀，所以，其实，对技术、对产品、对研发团队、对程序员，都不怎么care，也没什么追求，就急着捞一把变现。\r\n\r\n这就是第二种。\r\n\r\n第一种的话，是值得敬佩的。我始终认为，产品是王道啊，能解决用户的问题是王道啊，向他们致敬。\r\n\r\n假如你是程序员，你要选择创业公司，我推荐第一种。不过还是等你看完我这篇文章再来定是否要选择一个创业公司。\r\n\r\n另外一种常见的二分法是基于钱来的：\r\n\r\n1. 不缺钱的创业公司\r\n2. 缺钱的创业公司\r\n\r\n有一些创业公司阵容特别豪华，堪称MVP团队，轻易就能拿到投资，比如创始人是来自阿里系、腾讯系、网易系、金山系、小米系、华为系等等，那这样的团队多数都很慷慨，所谓和土豪做朋友，总是好的，如果这样的团队找你来谈谈，那去打打酱油也是可以考虑的。\r\n\r\n还有一些团队属于有点儿想法但没钱的，这时就要另论了，需要再回到前面那个二分法去。假如这样的团队是想做产品的，而且产品也蛮靠谱，那可以考虑。假如他们是盲目创业跟风凑热闹想2VC还没找到门道，那就别浪费你的大好青春了。\r\n\r\n### 2. 创业公司带给程序员的风险\r\n\r\n有一部电视剧叫做《北京人在纽约》，是由郑晓龙、冯小刚执导，姜文和王姬主演，豪华阵容啊，男的又帅又有内涵，女的又漂亮又有气质，当时火得一塌糊涂。\r\n\r\n在这部电视剧里，有一句话特别流行，是这么说的：**如果你爱他，就送他去纽约，因为那里是天堂；如果你恨他，就送他去纽约，因为那里是地狱**。\r\n\r\n关于创业公司和程序员，我们可以套用一下：**“如果你爱他，就送他去创业公司，因为那里是天堂；如果你恨他，就送他去创业公司，因为那里是地狱。”**\r\n\r\nOK，是好是坏，全在个人感觉。所以呢，下面这部分风险罗列与提示，仅供参考。\r\n\r\n- 创业公司成功概率小，1%或者更低\r\n- 创业公司变现周期长，比如大家喜闻乐见的股票和期权，这种变现方式，只能等到公司上市或再融资，以上市为例，第一视频05年成立06年上市，那是火箭一般的速度啊；空中网也比较快，02年成立04年纳斯达克上市，用了2年2个月；聚美优品10年成立，14年上市，用了4年2个月……这都是快的，阿里巴巴十几年才上市，还有很多公司根本就没希望上市，唱的是“出师未捷身先死，长使英雄泪满襟”的戏，而大部分程序员假如的公司，都是最后面唱戏的这种\r\n- 创业公司也不是人人都有股份和期权……你懂的，即便你选中了1%的那些公司熬过了变现前的进行曲，也可能到时什么事儿都没你的……\r\n- 创业公司工作不规律，OK，这是灰常常见的，比如各种加班，结婚的加班到妻离子散，有女朋友的加班到单身，单身的加班到没有朋友……\r\n- 个人定位不清晰，你懂的，成长快么，全栈么，一个人顶10个人用么，哪里缺人顶哪里么，如果你缺乏适应性，可能会风中凌乱或精神分裂\r\n\r\n还有一些，不再列举，如果你身边有创业公司，可以自己观察观察自行脑补。\r\n\r\n### 3. 创业公司能带给程序员什么\r\n\r\n咱不能只说不靠谱和风险，还得说说创业公司能给程序员带来的好处。其实，就像股市，风险与收益共存。我总结了一下，大概有下列好处：\r\n\r\n- 成长很快，这点不必多说，你要独挡N面，今年25，明年52。呃，又说错了，其实我想说的是，你要独挡N面，技术视野会更广阔，你要独自解决问题，技术修为也可能更精深。\r\n- 公司快速成长带来了员工收入快速上升的机会，想想吧，在处在成长期的行业里，又在成长期的公司里，机会大大滴\r\n- 参与感、成就感，你会比稳定的大公司更容易深度参与产品的设计、开发、运营，你的汗与泪会浸润产品的每个细节，想象一下用户在使用时发自内心的愉悦和赞叹，美死了吧。\r\n- 完整经历产品及公司运作流程的机会\r\n- 股票、期权变现的可能，这是一夜暴富改变社会财富分配的可能性，阿里上市诞生了多少千万富翁啊\r\n- ……\r\n\r\n还有很多，请随意补充。\r\n\r\n## 二、哪类程序员适合加入创业公司\r\n\r\n从创业公司的这面看完了，该从程序员这厢看看了。\r\n\r\n### 1. 程序员啊你要什么\r\n\r\n在决定去创业公司前，最应该想清楚的，是自己要什么。通常一个程序员在面对创业公司伸出的橄榄枝时，无非考虑下面几种诉求：\r\n\r\n- 钱景如何\r\n- 技术成长性\r\n- 产品调性是否符合个人倾向\r\n- 能否成为核心人员共享公司未来的成长\r\n\r\n唯有你清楚自己求什么，才能决断一个初创公司是否适合自己。这是最根本的，必须慎重考虑，同时也只能自己决定。\r\n\r\n除了这种根本性的因素，还有一些非常现实的因素，从不同侧面与这些根本要素相辉映，会影响到一个程序员的选择，也有必要来看看。\r\n\r\n### 2. 生涯发展理论与创业公司\r\n\r\n舒伯于1953年提出“生涯”的概念，后来发展出生涯发展理论，将人自我实现的过程分为五个阶段，在每个阶段都有其独特的职责和角色，以及不同的发展任务。详见下图： \r\n\r\n![](http://i.imgur.com/5tp7E9g.png)\r\n\r\n上图的五个阶段中，每个阶段又可以细分为更小的阶段。对程序员来讲，有两个阶段是要特别注意的。\r\n\r\n- 探索阶段中的试行期，22岁~24岁，个人初步确定自己的职业并试验其成为长期发展领域的可能性。\r\n- 建立阶段中的安定期，31岁~44岁，个体致力于工作上的稳固，大部分人处于最具创意时期，由于资深往往业绩优良。\r\n\r\n**试行期**\r\n\r\n我们先说试行期，这往往是大学毕业没多久、寻找适合的职业的时期。这个阶段的主要任务，一个是选择适合自己的工作，一个是快速累积专业技能。\r\n\r\n一个程序员在这个阶段，年轻，从时间方面看也有一些资本，同时又没有太大的家庭经济压力，快速试错也没什么大不了的，顶多浪费一点点时间，所以，可以大胆尝试。在这个阶段，我觉得可以加入创业公司去见识一下。当然，前提还是要结合自己的需求，看公司能提供什么样的平台你能获得什么样的成长。\r\n\r\n**倦怠期**\r\n\r\n31~44岁是安定期，这个时期里边又有一段时间是需要特别注意的危机期：稳定工作将近十年（35岁~40岁）。在35~40岁这个时期，有一部分程序员就会发现，向上没有发展空间，晋升受挫，会倦怠，会迷惘，于是有想法的人往往静极思动，想要出来看看了，这就是所谓的倦怠期。\r\n\r\n处于倦怠期的程序员，经济上基本也没太大压力了。再加上正是年富力强的时候，工作能力和业绩通常也不错，外界会有很多橄榄枝伸过来，自己也春心萌动，干柴烈火一点就着。所以，很多人此时也会跃跃欲试，愿意自己创业或加入到创业公司中，谋取将来的规模化收益。所以，我们会看到，很多创业者年龄就落在这个区间，很多创业公司的技术骨干也处在这个区间。\r\n\r\n**成家立业期**\r\n\r\n除了前面提到的两个时期，人的一生还有一个危机期，就是成家立业期，年龄段是25~30岁。\r\n\r\n从舒伯的生涯发展阶段理论看，25~30岁，又是建立阶段中的修正期。这个时期，应该找到一份稳定的职业并逐渐稳定，为后来的安定期做准备。\r\n\r\n修正期和成家立业期的重叠，给我们带来很大压力，相信这个年龄段的朋友们都深有体会：如果你还没有另一半还没结婚的打算，就会被爸爸妈妈以及七大姑八大姨还有远方小表妹逼婚了。\r\n\r\n处在成家立业期的程序员，应该需要为成家做准备了（我指一般人儿，如果你是非主流，请一笑而过），此时应该考虑工作稳定，加入创业公司要小心，越接近30越要小心哦。孔子说，三十而立，是非常有道理的。假如30岁了，还吊儿郎当的，吃了上顿没下顿，干两个月换个地方，那后面就很难“立”起来，也没哪个丈母娘愿意把美丽的姑娘送到你身边。\r\n\r\n### 3. 程序员的支持系统\r\n\r\n结合我们前面说的创业公司的一些风险，那一个程序员面临创业公司的机会，要不要选择加入，除了上面说的生涯发展阶段可供参考外，还有很重要的就是个人本身的实际情况。\r\n\r\n首先一点，是有一颗不安分的心，想要追寻梦想。假如你是想有个稳定工作拿个固定薪水过安稳日子的类型，就不用考虑创业公司了。假如你想三五年后实现“让天下没有难做的生意”的目标，同时自己也能身价倍增收入翻上N翻，那就可以跑出来遛遛了。\r\n\r\n其次就是要有拼劲儿，到创业公司就是受苦受累搏明天的，你要说每天看个报纸喝杯茶还能到纳斯达克敲钟，打死我也不信。\r\n\r\n再次就是经济压力的考量。不管哪个年龄阶段，假如你的收入不稳定，你或者你的家庭生活就无法维持下去，那最好还是不要冒险。假如你一人吃饱全家不饿或者你另一半有稳定收入能维持生活又愿意成全你搏个出位，那就算是没有后顾之忧了，放手去干。\r\n\r\n接下来就是要有承担风险的预期，因为有可能你加入的公司一年半载后关门大吉，你的工资也拿不到。还有可能你会降薪加入一个创业公司，到时公司倒了期权黄了，你还浮亏多少多少万，各种悲催啊，要能承受得住。\r\n\r\n最后还要有足够的灵活性和适应性。根据前面对创业公司的分析，创业公司往往是瞬息万变一人多用，你的角色不太可能固定下来，要有到处搬砖的准备，也要有到处搬砖的能力。假如你是那种认为自己是开发工程师打死也不做运维的活儿的程序员，那还是要慎重考虑一下吧。\r\n\r\n好啦，说了不少，不知道对你是否有帮助。最后要提醒的是，创业有风险，创业公司也有风险，选择需谨慎。','180.168.136.74',NULL,1460956833),
	(121,1,'signin','biezhi','180.168.136.74',NULL,1460957021),
	(122,1,'essence','16:1','180.168.136.74',NULL,1460957032),
	(123,0,'send_mail','lwt_workmail@163.com:Cg9IF9bfWAAAkCUe11q0uH90v811hXM6:signup','1.194.22.250',NULL,1460960047),
	(124,15,'signup','DamagedBoy:lwt_workmail@163.com','1.194.22.250',NULL,1460960047),
	(125,0,'send_mail','tao0329@126.com:JQSA10QqoEMSIE48hkT5kez7kA1OKz6q:signup','1.194.22.250',NULL,1460960985),
	(126,16,'signup','wuyun:tao0329@126.com','1.194.22.250',NULL,1460960985),
	(127,16,'signin','wuyun','1.194.22.250',NULL,1460961025),
	(128,1,'add_comment','好文章，先收藏了','180.168.136.74',NULL,1460963648),
	(129,11,'signin','hezhezhiyu','124.206.140.194',NULL,1460972678),
	(130,1,'signin','biezhi','116.227.142.201',NULL,1460992390),
	(131,0,'send_mail','9059322@qq.com:ru92Ntnxoxy3gGWNdZi0Puh1BKuY6dmP:signup','116.227.142.201',NULL,1460992863),
	(132,17,'signup','Zyt1026:9059322@qq.com','116.227.142.201',NULL,1460992863),
	(133,1,'signin','biezhi','116.227.142.201',NULL,1460992934),
	(134,17,'signin','Zyt1026','116.227.142.201',NULL,1460992971),
	(135,17,'add_topic',':good:  一个女孩子帮老公做测试','116.227.142.201',NULL,1460993728),
	(136,7,'add_comment','好文章，先收藏了','175.9.68.167',NULL,1460997068),
	(137,1,'add_comment','123','180.168.136.74',NULL,1461028815),
	(138,10,'signin','uilzzw','124.42.103.131',NULL,1461029381),
	(139,10,'add_comment','用过redis','124.42.103.131',NULL,1461029403),
	(140,1,'add_comment','@uilzzw :joy: 求资料共享','180.168.136.74',NULL,1461029554),
	(141,7,'add_comment','测试','218.76.31.42',NULL,1461034183),
	(142,7,'add_comment','![alt text](http://7xsk2r.com2.z0.glb.qiniucdn.com/avatar/default/1.png-normal \"Title\")\r\n记得貌似是替换tomcat的jar包,替换掉tomcat默认的session.','218.76.31.42',NULL,1461035797),
	(143,1,'add_comment','@lichee 你发的图片么。。','180.168.136.74',NULL,1461036387),
	(144,18,'signup','yoryor:yoryor@lovexwf.me','36.110.16.37',NULL,1461044100),
	(145,0,'send_mail','yoryor@lovexwf.me:0Ea5nwEbUkD9ewYvSzcrWsOWKvhssIzO:signup','36.110.16.37',NULL,1461044100),
	(146,18,'signin','yoryor','36.110.16.37',NULL,1461044200),
	(147,18,'signin','yoryor','36.110.16.37',NULL,1461044201),
	(148,16,'add_topic','aaa','123.52.71.131',NULL,1461049106),
	(149,16,'add_comment','a','123.52.71.131',NULL,1461049163),
	(150,16,'add_topic','v','123.52.71.131',NULL,1461049237),
	(151,0,'send_mail','rex_8090@sina.com:3ro0SMAJDBXeycZukhKUzh37pabk87RH:signup','180.168.136.74',NULL,1461054229),
	(152,19,'signup','rex_8090:rex_8090@sina.com','180.168.136.74',NULL,1461054229),
	(153,19,'signin','rex_8090','180.168.136.74',NULL,1461054311),
	(154,19,'add_comment','nice，强烈支持 :relieved: ','180.168.136.74',NULL,1461054528),
	(155,1,'signin','biezhi','180.168.136.74',NULL,1461054877),
	(156,7,'add_comment','@biezhi 测试markdown :flushed:\r\n![alt text](http://7xn9z1.com1.z0.glb.clouddn.com/9G%7DLLPAU9HEU%40M%5B(H%5DFN)%40U.jpg \"很好\")','218.76.31.42',NULL,1461057159),
	(157,0,'send_mail','244258241@qq.com:xwOwBFVggbLN91suuFXG64D5FcubtJ0x:signup','180.168.136.74',NULL,1461059206),
	(158,20,'signup','jack:244258241@qq.com','180.168.136.74',NULL,1461059206),
	(159,19,'signin','rex_8090','116.227.142.201',NULL,1461069762),
	(160,19,'add_topic','\r\n[http://asciiflow.com](http://asciiflow.com/)\r\n\r\n还有一个 `Javascript` 版本的 [http://adrai.github.io/flowchart.js](http://adrai.github.io/flowchart.js/)\r\n\r\n:new_moon_with_face: 不用谢我，我叫雷锋 ','116.227.142.201',NULL,1461070232),
	(161,0,'send_mail','1094955064@qq.com:K6N4GR8tB3nvRyFxp7GXBW2l09B5L2l6:signup','113.66.182.102',NULL,1461070401),
	(162,21,'signup','Levan:1094955064@qq.com','113.66.182.102',NULL,1461070401),
	(163,19,'add_topic','\r\n比如 Javascript／Bootstrap／NodeJS这样的。。 :full_moon_with_face: \r\n','116.227.142.201',NULL,1461070978),
	(164,1,'signin','biezhi','116.227.142.201',NULL,1461070997),
	(165,1,'add_comment','@rex_8090 :new_moon_with_face: 等着，我满足你','116.227.142.201',NULL,1461071042),
	(166,1,'essence','20:1','106.187.94.204',NULL,1461071665),
	(167,2,'signin','jacks','106.187.94.204',NULL,1461072604),
	(168,2,'add_topic','javascript 版本\r\n\r\n```javascript\r\nvar arr = [9, 9, 111, 2, 3, 4, 4, 5, 7];\r\nvar sortedArr = arr.sort(); \r\nvar results = [];\r\nfor (var i = 0; i < arr.length - 1; i++) {\r\n    if (sortedArr[i + 1] == sortedArr[i]) {\r\n        results.push(sortedArr[i]);\r\n    }\r\n}\r\nalert(results);\r\n```\r\n\r\n前端 :dog:  一起来探讨','106.187.94.204',NULL,1461072699),
	(169,1,'signin','biezhi','106.187.94.204',NULL,1461072839),
	(170,1,'add_comment','楼主的雷锋精神好样的 :smile: ','106.187.94.204',NULL,1461072880),
	(171,1,'add_comment','后端 :dog: 来一个 `JQ` 版本\r\n\r\n```javascript\r\nvar arr = [\"1\",\"2\",\"3\",\"4\",\"5\",\"4\",\"3\"];\r\nvar uniqueArr = [];\r\n$.each(arr, function(i, el){\r\n    if($.inArray(el, uniqueArr) === -1) uniqueArr.push(el);\r\n});\r\n```','106.187.94.204',NULL,1461072950),
	(172,4,'signin','lala','106.187.94.204',NULL,1461072986),
	(173,4,'add_comment',':joy: 本喵来了\r\n\r\n```javascript\r\nfunction unique(array){\r\n    var n = [];//临时数组\r\n    for(var i = 0;i < array.length; i++){\r\n        if(n.indexOf(array[i]) == -1) n.push(array[i]);\r\n    }\r\n    return n;\r\n}\r\n```','106.187.94.204',NULL,1461073196),
	(174,5,'signin','doubi','106.187.94.204',NULL,1461073502),
	(175,5,'add_comment','利用对象字面量的key与value关联性，写起来比较简单，未测试性能，考虑到只遍历一次，速度应该很快。\r\n\r\n```javascript\r\nfunction distinct(arr) {\r\n    var obj = {},\r\n        i = 0,\r\n        len = 0;\r\n    if (Array.isArray(arr) && arr.length > 0) {\r\n        len = arr.length;\r\n        for (i = 0; i < len; i += 1) {\r\n            obj[arr[i]] = arr[i];\r\n        }\r\n        return Object.keys(obj);\r\n    }\r\n    return [];\r\n}\r\n```','106.187.94.204',NULL,1461073540),
	(176,1,'signin','biezhi','116.227.142.201',NULL,1461075736),
	(177,11,'signin','hezhezhiyu','124.206.140.194',NULL,1461112296),
	(178,9,'signin','kexun','103.250.195.130',NULL,1461114401),
	(30,1,'signin','biezhi','116.251.211.104',NULL,1460637172),
	(31,0,'send_mail','351711778@qq.com:Ptm6jISYk2ZMXhJI2Uo1YzFwxhkaircl:signup','114.111.166.5',NULL,1460639261),
	(32,6,'signup','im_wangjue_NO1:351711778@qq.com','114.111.166.5',NULL,1460639261),
	(33,6,'signin','im_wangjue_NO1','114.111.166.5',NULL,1460639312),
	(34,1,'add_comment','和你男朋友搞基的就是我','116.251.211.104',NULL,1460639477),
	(35,7,'signup','lichee:z@lichee.me','218.76.31.68',NULL,1460639488),
	(36,0,'send_mail','z@lichee.me:iVCQcRrto0az2n5YaNuPMeY9u0QGZc5e:signup','218.76.31.68',NULL,1460639488),
	(37,7,'signin','lichee','218.76.31.68',NULL,1460639526),
	(38,7,'add_comment','沙发~','218.76.31.68',NULL,1460639591),
	(39,6,'add_comment','@biezhi 66666666','114.111.166.5',NULL,1460639610),
	(40,1,'add_comment','@lichee 板凳 :joy:','116.251.211.104',NULL,1460639800),
	(41,1,'add_comment','这种妹子图懂东西多发点 哈哈～','116.251.211.104',NULL,1460639941),
	(42,1,'add_topic','**RT：准备切换电信，长宽实在卡成翔**','116.251.211.104',NULL,1460640058),
	(43,1,'add_comment','不会python 给楼主顶一下。','116.251.211.104',NULL,1460640440),
	(44,2,'signin','jacks','116.251.211.104',NULL,1460640538),
	(45,2,'add_topic','\r\n哈哈，你们看这里 [给Java说句公道话](http://www.yinwang.org/blog-cn/2016/01/18/java)\r\n\r\n','116.251.211.104',NULL,1460640734),
	(46,1,'signin','biezhi','116.251.211.104',NULL,1460640921),
	(47,1,'add_comment','小伙子，对于你这种狂傲的帖子，我想说：我喜欢。','116.251.211.104',NULL,1460640957),
	(48,1,'add_comment','楼主写了这么多就是要卖书，我不会告诉你我直接看到链接的。','116.251.211.104',NULL,1460641104),
	(49,1,'add_comment','约炮都可以这么深奥。\r\n\r\n![](http://i2.piimg.com/db8eb02559fbd120.jpg)\r\n','116.251.211.104',NULL,1460641347),
	(50,0,'send_mail','549052145@qq.com:oUFnFWyWFp2omAT8iE3XGX25shyjo1BW:signup','219.156.42.80',NULL,1460650525),
	(51,8,'signup','XingFly:549052145@qq.com','219.156.42.80',NULL,1460650525),
	(52,0,'send_mail','549052145@qq.com:pmtcdi9x1oeOOOQoL7Wg4jn84yjta4aR:forgot','219.156.42.80',NULL,1460650607),
	(53,7,'signin','lichee','175.9.70.239',NULL,1460650825),
	(54,8,'signin','XingFly','219.156.42.80',NULL,1460651206),
	(55,0,'send_mail','qianchj@163.com:1RVLvV12QTH2tFwqflQDIcuxqbHd5OmX:signup','106.186.28.162',NULL,1460681929),
	(56,9,'signup','kexun:qianchj@163.com','106.186.28.162',NULL,1460681929),
	(57,0,'send_mail','uilzzw@gmail.com:B2OZXMHse5OTv2vBlyHN5lCmdg2qPasu:signup','124.42.103.131',NULL,1460682181),
	(58,10,'signup','uilzzw:uilzzw@gmail.com','124.42.103.131',NULL,1460682182),
	(59,10,'signin','uilzzw','118.184.28.242',NULL,1460682357),
	(213,1,'signin','biezhi','180.168.136.74',NULL,1461234913),
	(214,11,'signin','hezhezhiyu','36.110.14.50',NULL,1461243242),
	(215,11,'add_comment','水一波 。楼主你妹子真心不赖。哈哈','124.206.140.194',NULL,1461243276),
	(216,1,'signin','biezhi','116.227.139.125',NULL,1461249809),
	(217,5,'signin','doubi','116.227.139.125',NULL,1461253742),
	(218,5,'add_comment',':hand: 这个功能不错','116.227.139.125',NULL,1461253840),
	(219,0,'send_mail','18510855440@sina.cn:0lHWj3pzO88Fh7VUEp8W5kfLiYeyp4TN:signup','211.99.254.196',NULL,1461287493),
	(220,24,'signup','mask_9523:18510855440@sina.cn','211.99.254.196',NULL,1461287493),
	(221,24,'signin','mask_9523','211.99.254.196',NULL,1461287539),
	(222,10,'signin','uilzzw','124.42.103.131',NULL,1461288994),
	(223,10,'add_topic','XSS漏洞怎么补;就只需要按照度娘的方法;写一个过滤器么;','124.42.103.131',NULL,1461289113),
	(224,1,'add_comment','我来说说Java的。\r\n\r\n[HTMLFilter](https://github.com/biezhi/blade/blob/master/blade-kit%2Fsrc%2Fmain%2Fjava%2Fblade%2Fkit%2Ftext%2FHTMLFilter.java) 这个类完成了XSS (Cross Site Scripting)的防止注入，你也可以使用Jsoup里的[方法](https://jsoup.org/cookbook/cleaning-html/whitelist-sanitizer)来进行过滤。\r\n\r\n过滤器不过是控制了到底在哪一层去处理脚本拦截，实现可以通过如上2种方法。\r\n\r\n我们来试试\r\n\r\n<script>alert(\'java-china.org\');</script>\r\n\r\n再来试试markdwon\r\n\r\n```html\r\n<script>alert(\'java-china.org\');</script>\r\n```','45.32.24.125',NULL,1461289782),
	(225,0,'send_mail','244258241@qq.com:KypL7xrhmVygdORUWpISEaTuPHhNGNkx:signup','180.168.136.74',NULL,1461293422),
	(226,25,'signup','Jack:244258241@qq.com','180.168.136.74',NULL,1461293422),
	(227,1,'signin','biezhi','180.168.136.74',NULL,1461297667),
	(228,1,'signin','biezhi','116.227.139.125',NULL,1461333769),
	(229,1,'signin','biezhi','116.227.139.125',NULL,1461334237),
	(230,1,'signin','biezhi','116.227.139.125',NULL,1461335125),
	(231,1,'signin','biezhi','116.227.139.125',NULL,1461339847),
	(232,29,'signup','adasdadsad:renqi@laicaijie.com','127.0.0.1',NULL,1483111714),
	(233,30,'signup','ceshia:renqi@laicaijie.com','127.0.0.1',NULL,1483111985),
	(234,31,'signup','mycc:renqi@laicaijie.com','127.0.0.1',NULL,1483112071),
	(235,32,'signup','mycc:renqi@laicaijie.com','127.0.0.1',NULL,1483113920),
	(236,32,'signin','mycc','127.0.0.1',NULL,1483114495),
	(237,1,'signin','biezhi','127.0.0.1',NULL,1484312213),
	(238,1,'signin','biezhi','127.0.0.1',NULL,1484312308),
	(239,1,'signin','biezhi','127.0.0.1',NULL,1484312385),
	(240,1,'signin','biezhi','127.0.0.1',NULL,1484312619),
	(241,1,'add_comment','asasas','127.0.0.1',NULL,1484312627),
	(242,1,'add_comment','按时','127.0.0.1',NULL,1484312685),
	(243,1,'signin','biezhi','127.0.0.1',NULL,1484375471),
	(244,1,'signin','biezhi','127.0.0.1',NULL,1484379674),
	(245,1,'signin','biezhi','127.0.0.1',NULL,1484380803),
	(246,1,'signin','biezhi','127.0.0.1',NULL,1484380898),
	(247,1,'signin','biezhi','127.0.0.1',NULL,1486904682),
	(248,1,'sink','27','127.0.0.1',NULL,1486904696),
	(249,1,'add_comment','6666','127.0.0.1',NULL,1486907205),
	(250,1,'add_comment','啊实打实的','127.0.0.1',NULL,1486907305),
	(251,1,'add_comment','123','127.0.0.1',NULL,1486907642),
	(252,1,'add_comment','666','127.0.0.1',NULL,1486907796),
	(253,1,'add_comment','不错','127.0.0.1',NULL,1486907922),
	(254,33,'signup','helloo:921293209@qq.com','127.0.0.1',NULL,1486913821),
	(255,33,'signin','helloo','127.0.0.1',NULL,1486913884),
	(256,33,'add_topic','啊飒飒的撒的是\r\n\r\n```java\r\nSystem.out.println(\"Hello World\");\r\n```','127.0.0.1',NULL,1486914036),
	(257,33,'add_comment','湿哒哒','127.0.0.1',NULL,1486915224),
	(258,33,'add_comment','@helloo 555','127.0.0.1',NULL,1486915230),
	(259,33,'add_comment','666','127.0.0.1',NULL,1486915635),
	(260,1,'signin','biezhi','127.0.0.1',NULL,1486915642),
	(261,1,'add_comment','22','127.0.0.1',NULL,1486915956),
	(262,1,'add_comment','嗯嗯','127.0.0.1',NULL,1486916137),
	(263,1,'signin','biezhi','127.0.0.1',NULL,1487315505),
	(264,1,'essence','29:1','127.0.0.1',NULL,1487315543),
	(265,1,'essence','29:0','127.0.0.1',NULL,1487315550),
	(266,1,'add_topic','按时打算打算的','127.0.0.1',NULL,1487316430),
	(267,1,'update_pwd','26b2010cd2028d742b283da54a304584','127.0.0.1',NULL,1487319459),
	(268,1,'signin','biezhi','127.0.0.1',NULL,1487319706),
	(269,1,'signin','biezhi','127.0.0.1',NULL,1487320084),
	(270,1,'update_pwd','66fc9e4d0b46b5e97e266358a0efea5e','127.0.0.1',NULL,1487321096),
	(271,33,'signin','921293209@qq.com','127.0.0.1',NULL,1488524779),
	(272,33,'add_comment','```bash\r\nHello World\r\n```','127.0.0.1',NULL,1488524800),
	(273,1,'signin','biezhi','127.0.0.1',NULL,1489588103),
	(274,1,'signin','biezhi','127.0.0.1',NULL,1489590450),
	(275,1,'add_topic','asdasd','127.0.0.1',NULL,1489593502),
	(276,1,'add_comment','1111','127.0.0.1',NULL,1489593751),
	(277,1,'signin','biezhi','127.0.0.1',NULL,1489672379),
	(278,1,'add_comment','> Hello World.','127.0.0.1',NULL,1489672412),
	(279,34,'signup','hello1111:2223213951@qq.com','127.0.0.1',NULL,1489673535),
	(280,1,'signin','biezhi','127.0.0.1',NULL,1490372979),
	(281,1,'signin','biezhi','127.0.0.1',NULL,1490373046),
	(282,1,'update_pwd','0b305f413c121d593d700c333905d6af','127.0.0.1',NULL,1490373831),
	(283,1,'signin','biezhi','127.0.0.1',NULL,1490374119),
	(284,1,'add_topic','## 各路大神来点评','127.0.0.1',NULL,1490375516),
	(285,1,'add_topic','## 各路大神来点评','127.0.0.1',NULL,1490375536),
	(286,1,'add_comment','@biezhi  asdasd','127.0.0.1',NULL,1490375773),
	(287,1,'add_topic','分享。。。','127.0.0.1',NULL,1490376146),
	(288,1,'add_topic','```java\r\npublic static void main(){\r\n    System.out.println(\"Hello Gay!\");\r\n}\r\n```','127.0.0.1',NULL,1490376467),
	(289,1,'essence','32:1','127.0.0.1',NULL,1490376716),
	(290,1,'signin','biezhi','127.0.0.1',NULL,1490377324),
	(291,1,'add_comment','@doubi  asasasa','127.0.0.1',NULL,1490377906),
	(292,1,'signin','biezhi','127.0.0.1',NULL,1494086373),
	(293,1,'add_comment','q1','127.0.0.1',NULL,1494086380),
	(294,1,'add_comment','1','127.0.0.1',NULL,1494086945),
	(295,1,'add_comment','阿萨德','127.0.0.1',NULL,1494090151),
	(296,1,'add_comment','1','127.0.0.1',NULL,1494149337),
	(297,1,'add_comment','22','127.0.0.1',NULL,1494149481),
	(298,1,'add_comment','222','127.0.0.1',NULL,1494149549),
	(299,10,'signin','uilzzw','127.0.0.1',NULL,1494150639),
	(300,10,'add_comment','333','127.0.0.1',NULL,1494150645),
	(301,10,'add_comment','sdadad','127.0.0.1',NULL,1494150785),
	(302,10,'add_comment','qqq222','127.0.0.1',NULL,1494150871),
	(303,1,'signin','biezhi','127.0.0.1',NULL,1494150896),
	(304,1,'add_comment','@uilzzw  你好啊','127.0.0.1',NULL,1494151989),
	(305,1,'add_comment','@uilzzw  算了吧','127.0.0.1',NULL,1494152047),
	(306,10,'signin','uilzzw','127.0.0.1',NULL,1494152073);

/*!40000 ALTER TABLE `t_userlog` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
