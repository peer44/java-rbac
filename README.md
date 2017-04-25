
java-rbac
======================
一个java版本的基于角色的权限管理系统

[系统介绍与美图](http://blog.csdn.net/frankcheng5143/article/details/51725226)

部署方法

将
```
  /src/main/resources/sql/jrbac.sql
```
数据库脚本运行在本地数据库

将
```
  src/main/resources/jdbc.properties
```
中
```
  jdbc.username=root
  jdbc.password=cheng
```  
设置成自己的数据库用户名和密码

然后运行项目（注意这是一个maven项目）

初始化登录用户名chenggaowei

登录密码12345678
