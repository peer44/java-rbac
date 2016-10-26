create database jrbac;
use jrbac;

-- 登录用户表
DROP TABLE IF EXISTS `jrbac_login_user`;
CREATE TABLE `jrbac_login_user` (
  `id` varchar(32) NOT NULL COMMENT '用户id,uuid32位',
  `username` varchar(64) NOT NULL COMMENT '登录用户名',
  `password` varchar(32) NOT NULL COMMENT '登录密码,生成的password也是32位',
  `nickname` varchar(64) DEFAULT NULL COMMENT '姓名',
  `telephone` varchar(32) DEFAULT NULL COMMENT '电话号码',
  `email` varchar(64) DEFAULT NULL COMMENT '电子邮箱',
  `create_time` timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '用户创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '用户修改时间,要用程序控制,ubuntu上不能设置为now()',
  `account_status` tinyint(4) DEFAULT '0' COMMENT '账户状态,默认为0,被锁定为1',
  `status` tinyint(4) DEFAULT '0' COMMENT '账户状态,默认为0,超级管理员1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jrbac_login_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录用户表';

-- 初始化数据 密码12345678
INSERT INTO 
`jrbac_login_user` (id,username,password,nickname,telephone,email)
VALUES 
('fa2c960b3d1046f0b82341a0a690ce11', 'chenggaowei', 'e42584918d922300a0498dbb6e89745d', '程同学','15353530000', 'peer44@qq.com');

