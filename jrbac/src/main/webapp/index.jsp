<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>测试页面</title>
</head>
<body>
	<a href="<c:url value='/login.html'/>">登录页面</a>
	<%
		out.print(request.getContextPath());
	%>
</body>
</html>
