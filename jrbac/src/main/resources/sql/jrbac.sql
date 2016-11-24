/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : jrbac

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2016-11-24 19:29:00
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
INSERT INTO `jrbac_login_user` VALUES ('67379e615406418fa6fa14823f9152fa', 'zhangsan', 'e42584918d922300a0498dbb6e89745d', '张三', null, null, '2016-11-24 16:13:49', '2016-11-24 17:21:52', '0', '0');
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
INSERT INTO `jrbac_menu` VALUES ('0dc7bac3db5b49debc31829cd6732732', '微网站素材', '', '', 'fa fa-university', '70');
INSERT INTO `jrbac_menu` VALUES ('100', '个人设置', '', '/admin/user/setting.html', 'fa fa-toggle-on', '100');
INSERT INTO `jrbac_menu` VALUES ('2466b887d28643deab1826a0fd59cd07', '微信管理', '', '', 'fa fa-weixin', '80');
INSERT INTO `jrbac_menu` VALUES ('418d5533e32b412bbfcae188e69dd0e6', '自定义菜单', '2466b887d28643deab1826a0fd59cd07', '/admin/wechat/menu.html', '', '3');
INSERT INTO `jrbac_menu` VALUES ('64aff0215238445d9a8fe3c7ce2a0191', '文件上传', 'fc6d3a8ee066437aa4f419e6d69dca3a', '/admin/test/fileupload.html', '', '0');
INSERT INTO `jrbac_menu` VALUES ('83983b7b0ce94ccc9e1f7c2be5c10fda', '公众号管理', '2466b887d28643deab1826a0fd59cd07', '/admin/wechat/index.html', '', '0');
INSERT INTO `jrbac_menu` VALUES ('90', '系统管理', '', '', 'fa fa-wrench', '90');
INSERT INTO `jrbac_menu` VALUES ('91', '用户管理', '90', '/admin/user/index.html', '', '1');
INSERT INTO `jrbac_menu` VALUES ('92', '角色管理', '90', '/admin/role/index.html', null, '2');
INSERT INTO `jrbac_menu` VALUES ('93', '菜单管理', '90', '/admin/menu/index.html', null, '3');
INSERT INTO `jrbac_menu` VALUES ('9e3fd537d1404a4cbed326fd96d6226f', '服务器配置', '2466b887d28643deab1826a0fd59cd07', '/admin/wechat/config.html', '', '1');
INSERT INTO `jrbac_menu` VALUES ('b4b5b0eb5aa34ef285ba52d7dfb74473', '教师素材', '0dc7bac3db5b49debc31829cd6732732', '/admin/teacher/index.html', '', '2');
INSERT INTO `jrbac_menu` VALUES ('bb46286b302b46b0aac42038600a2cdd', '后台首页', '', '/admin/home/index.html', 'fa fa-home', '0');
INSERT INTO `jrbac_menu` VALUES ('df111263d70a4bad9a110b56c972cfdd', '校园素材', '0dc7bac3db5b49debc31829cd6732732', '/admin/school/index.html', '', '1');
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
INSERT INTO `jrbac_role` VALUES ('4a04dbb327da4d6ea5e2e522ef40d25a', '超级管理员', '2016-11-24 16:12:48');
INSERT INTO `jrbac_role` VALUES ('d6663408a1b84e54b1be5854dddfba65', '微信管理员', '2016-11-24 16:13:18');
INSERT INTO `jrbac_role` VALUES ('bfcd198137f44349b5090c2a5fd5463f', '测试用户', '2016-11-24 16:13:28');

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
INSERT INTO `jrbac_role_menu` VALUES ('4a04dbb327da4d6ea5e2e522ef40d25a', '0dc7bac3db5b49debc31829cd6732732');
INSERT INTO `jrbac_role_menu` VALUES ('4a04dbb327da4d6ea5e2e522ef40d25a', '100');
INSERT INTO `jrbac_role_menu` VALUES ('4a04dbb327da4d6ea5e2e522ef40d25a', '2466b887d28643deab1826a0fd59cd07');
INSERT INTO `jrbac_role_menu` VALUES ('4a04dbb327da4d6ea5e2e522ef40d25a', '418d5533e32b412bbfcae188e69dd0e6');
INSERT INTO `jrbac_role_menu` VALUES ('4a04dbb327da4d6ea5e2e522ef40d25a', '64aff0215238445d9a8fe3c7ce2a0191');
INSERT INTO `jrbac_role_menu` VALUES ('4a04dbb327da4d6ea5e2e522ef40d25a', '83983b7b0ce94ccc9e1f7c2be5c10fda');
INSERT INTO `jrbac_role_menu` VALUES ('4a04dbb327da4d6ea5e2e522ef40d25a', '90');
INSERT INTO `jrbac_role_menu` VALUES ('4a04dbb327da4d6ea5e2e522ef40d25a', '91');
INSERT INTO `jrbac_role_menu` VALUES ('4a04dbb327da4d6ea5e2e522ef40d25a', '92');
INSERT INTO `jrbac_role_menu` VALUES ('4a04dbb327da4d6ea5e2e522ef40d25a', '93');
INSERT INTO `jrbac_role_menu` VALUES ('4a04dbb327da4d6ea5e2e522ef40d25a', '9e3fd537d1404a4cbed326fd96d6226f');
INSERT INTO `jrbac_role_menu` VALUES ('4a04dbb327da4d6ea5e2e522ef40d25a', 'b4b5b0eb5aa34ef285ba52d7dfb74473');
INSERT INTO `jrbac_role_menu` VALUES ('4a04dbb327da4d6ea5e2e522ef40d25a', 'bb46286b302b46b0aac42038600a2cdd');
INSERT INTO `jrbac_role_menu` VALUES ('4a04dbb327da4d6ea5e2e522ef40d25a', 'df111263d70a4bad9a110b56c972cfdd');
INSERT INTO `jrbac_role_menu` VALUES ('4a04dbb327da4d6ea5e2e522ef40d25a', 'fc6d3a8ee066437aa4f419e6d69dca3a');
INSERT INTO `jrbac_role_menu` VALUES ('bfcd198137f44349b5090c2a5fd5463f', '100');
INSERT INTO `jrbac_role_menu` VALUES ('bfcd198137f44349b5090c2a5fd5463f', '64aff0215238445d9a8fe3c7ce2a0191');
INSERT INTO `jrbac_role_menu` VALUES ('bfcd198137f44349b5090c2a5fd5463f', 'bb46286b302b46b0aac42038600a2cdd');
INSERT INTO `jrbac_role_menu` VALUES ('bfcd198137f44349b5090c2a5fd5463f', 'fc6d3a8ee066437aa4f419e6d69dca3a');
INSERT INTO `jrbac_role_menu` VALUES ('d6663408a1b84e54b1be5854dddfba65', '0dc7bac3db5b49debc31829cd6732732');
INSERT INTO `jrbac_role_menu` VALUES ('d6663408a1b84e54b1be5854dddfba65', '100');
INSERT INTO `jrbac_role_menu` VALUES ('d6663408a1b84e54b1be5854dddfba65', '2466b887d28643deab1826a0fd59cd07');
INSERT INTO `jrbac_role_menu` VALUES ('d6663408a1b84e54b1be5854dddfba65', '418d5533e32b412bbfcae188e69dd0e6');
INSERT INTO `jrbac_role_menu` VALUES ('d6663408a1b84e54b1be5854dddfba65', '83983b7b0ce94ccc9e1f7c2be5c10fda');
INSERT INTO `jrbac_role_menu` VALUES ('d6663408a1b84e54b1be5854dddfba65', '9e3fd537d1404a4cbed326fd96d6226f');
INSERT INTO `jrbac_role_menu` VALUES ('d6663408a1b84e54b1be5854dddfba65', 'b4b5b0eb5aa34ef285ba52d7dfb74473');
INSERT INTO `jrbac_role_menu` VALUES ('d6663408a1b84e54b1be5854dddfba65', 'bb46286b302b46b0aac42038600a2cdd');
INSERT INTO `jrbac_role_menu` VALUES ('d6663408a1b84e54b1be5854dddfba65', 'df111263d70a4bad9a110b56c972cfdd');

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
INSERT INTO `jrbac_user_role` VALUES ('67379e615406418fa6fa14823f9152fa', 'bfcd198137f44349b5090c2a5fd5463f');
INSERT INTO `jrbac_user_role` VALUES ('67379e615406418fa6fa14823f9152fa', 'd6663408a1b84e54b1be5854dddfba65');
