create database myair;
use myair;

-- 登录用户表
DROP TABLE IF EXISTS `airuser`;
CREATE TABLE `login_user` (
  `id` varchar(32) NOT NULL COMMENT '用户id',
  `username` varchar(64) NOT NULL COMMENT '登录用户名',
  `password` varchar(64) NOT NULL COMMENT '登录密码',
  `nickname` varchar(64) DEFAULT NULL COMMENT '姓名',
  `create_time` timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '用户修改时间,用程序控制',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态,超级管理员为1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录用户表';

-- 初始化数据 密码12345678
INSERT INTO `login_user` VALUES ('fa2c960b3d1046f0b82341a0a690ce11', 'cdpts', 'A2/hewn561RYuxsN+St8Ag==', '程同学', '0', '15353635802', 'peer44@qq.com', '2016-07-06 14:48:25', '2016-08-11 17:17:45', '1');

-- 航班表
DROP TABLE IF EXISTS `airflight`;
CREATE TABLE `airflight` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `number` varchar(16) NOT NULL COMMENT '航班编号',
  `company` varchar(32) NOT NULL COMMENT '航空公司',
  `companyLogoImageUrl` varchar(128) DEFAULT NULL COMMENT '航空公司logo图片地址',
  `departure` varchar(32) NOT NULL COMMENT '航班出发地',
  `destination` varchar(32) NOT NULL COMMENT '航班目的地',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='航班表';

-- 航班经停表
DROP TABLE IF EXISTS `airstopover`;
CREATE TABLE `airstopover` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `flightId` varchar(32) NOT NULL COMMENT '关联的航班id',
  `place` varchar(64) NOT NULL COMMENT '途经地名称',
  `stayTime` varchar(32) DEFAULT NULL COMMENT '停留时间',
  PRIMARY KEY (`id`),
  CONSTRAINT `fkStopoverFlight` FOREIGN KEY (`flightId`) REFERENCES `airflight` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='航班经停表';

-- 航班状态表
DROP TABLE IF EXISTS `airflightstatus`;
CREATE TABLE `airflightstatus` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `flightId` varchar(32) NOT NULL COMMENT '关联的航班id',
  `departureTime` datetime NOT NULL COMMENT '起飞时间',
  `arrivalTime` datetime NOT NULL COMMENT '到达时间',
  `djkStatus` varchar(32) DEFAULT NULL COMMENT '值机口状态',
  `zjkStatus` varchar(32) DEFAULT NULL COMMENT '登机口状态',
  PRIMARY KEY (`id`),
  CONSTRAINT `fkFlightstatusFlight` FOREIGN KEY (`flightId`) REFERENCES `airflight` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='航班状态表';