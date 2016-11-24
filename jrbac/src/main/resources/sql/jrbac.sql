/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : jrbac

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2016-11-24 19:39:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for jrbac_login_user
-- ----------------------------
DROP TABLE IF EXISTS `jrbac_login_user`;
CREATE TABLE `jrbac_login_user` (
  `id` varchar(32) NOT NULL COMMENT '用户id,uuid32位',
  `username` varchar(64) NOT NULL COMMENT '登录用户名',
  `password` varchar(32) NOT NULL COMMENT '登录密码,生成的password也是32位',
  `nickname` varchar(64) DEFAULT NULL COMMENT '姓名',
  `telephone` varchar(32) DEFAULT NULL COMMENT '电话号码',
  `email` varchar(64) DEFAULT NULL COMMENT '电子邮箱',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '用户修改时间,要用程序控制,ubuntu上不能设置为now()',
  `account_status` tinyint(4) DEFAULT '0' COMMENT '账户状态,默认为0,被锁定为1',
  `status` tinyint(4) DEFAULT '0' COMMENT '账户状态,默认为0,超级管理员1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jrbac_login_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录用户表';

-- ----------------------------
-- Records of jrbac_login_user
-- ----------------------------
INSERT INTO `jrbac_login_user` VALUES ('fa2c960b3d1046f0b82341a0a690ce11', 'chenggaowei', 'e42584918d922300a0498dbb6e89745d', '程同学', '15353530000', 'peer44@qq.com', '2016-10-26 13:57:04', null, '0', '1');

-- ----------------------------
-- Table structure for jrbac_menu
-- ----------------------------
DROP TABLE IF EXISTS `jrbac_menu`;
CREATE TABLE `jrbac_menu` (
  `id` varchar(32) NOT NULL COMMENT '主键id,uuid32位',
  `name` varchar(64) NOT NULL COMMENT '登录用户名',
  `parent_id` varchar(32) DEFAULT NULL COMMENT '父菜单id',
  `url` varchar(64) DEFAULT NULL COMMENT '访问地址',
  `icon` varchar(32) DEFAULT NULL COMMENT '菜单图标',
  `order` tinyint(4) DEFAULT '0' COMMENT '菜单顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of jrbac_menu
-- ----------------------------
INSERT INTO `jrbac_menu` VALUES ('100', '个人设置', '', '/admin/user/setting.html', 'fa fa-toggle-on', '100');
INSERT INTO `jrbac_menu` VALUES ('64aff0215238445d9a8fe3c7ce2a0191', '文件上传', 'fc6d3a8ee066437aa4f419e6d69dca3a', '/admin/test/fileupload.html', '', '0');
INSERT INTO `jrbac_menu` VALUES ('90', '系统管理', '', '', 'fa fa-wrench', '90');
INSERT INTO `jrbac_menu` VALUES ('91', '用户管理', '90', '/admin/user/index.html', '', '1');
INSERT INTO `jrbac_menu` VALUES ('92', '角色管理', '90', '/admin/role/index.html', null, '2');
INSERT INTO `jrbac_menu` VALUES ('93', '菜单管理', '90', '/admin/menu/index.html', null, '3');
INSERT INTO `jrbac_menu` VALUES ('bb46286b302b46b0aac42038600a2cdd', '后台首页', '', '/admin/home/index.html', 'fa fa-home', '0');
INSERT INTO `jrbac_menu` VALUES ('fc6d3a8ee066437aa4f419e6d69dca3a', '测试页面', '', '', 'fa fa-file-text', '10');

-- ----------------------------
-- Table structure for jrbac_role
-- ----------------------------
DROP TABLE IF EXISTS `jrbac_role`;
CREATE TABLE `jrbac_role` (
  `id` varchar(32) NOT NULL COMMENT '主键id,uuid32位',
  `name` varchar(64) NOT NULL COMMENT '角色名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '角色创建时间，主要是用来进行排序',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of jrbac_role
-- ----------------------------

-- ----------------------------
-- Table structure for jrbac_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `jrbac_role_menu`;
CREATE TABLE `jrbac_role_menu` (
  `role_id` varchar(32) NOT NULL COMMENT '角色id',
  `menu_id` varchar(32) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `role_id` (`role_id`),
  KEY `fk_menu_id` (`menu_id`),
  CONSTRAINT `fk_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `jrbac_menu` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `jrbac_role` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单表';

-- ----------------------------
-- Records of jrbac_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for jrbac_user_role
-- ----------------------------
DROP TABLE IF EXISTS `jrbac_user_role`;
CREATE TABLE `jrbac_user_role` (
  `user_id` varchar(32) NOT NULL COMMENT '用户id',
  `role_id` varchar(32) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_id` (`user_id`),
  KEY `fk_role_id_user_role` (`role_id`),
  CONSTRAINT `fk_role_id_user_role` FOREIGN KEY (`role_id`) REFERENCES `jrbac_role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `jrbac_login_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of jrbac_user_role
-- ----------------------------
