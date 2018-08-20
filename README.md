
java-rbac
======================
一个java版本的基于角色的权限管理系统

可以用来做公共的cms后台

[系统介绍与美图](http://blog.csdn.net/frankcheng5143/article/details/51725226)
该版本支持多级菜单

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

确保你的eclispe配置好了maven

Eclipse 导入

  File --> Import -->选择Maven --> Existing Maven Projects

访问地址：http://127.0.0.1:8080/jrbac

初始化登录用户名chenggaowei

登录密码12345678
