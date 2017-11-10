<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>修改信息</title>
    <base href="<%=basePath%>">
  </head>
  <body>
  <br>
  <p align="center">修改用户信息</p>
    	<form  method="post" action="${pageContext.request.contextPath}/user/edit.action" >
    		<table align="center" >
    		<input type="hidden" name="id" value="${info.id}"/><br>
    		<tr><td>用户名:</td><td><input type="text" name="name" value="${info.name}"/></td></tr><br>
    		<tr><td>年龄:</td><td><input type="text" name="age" value="${info.age}"/></td></tr><br>
    		<tr><td>地址:</td><td><input type="text" name="address" value="${info.address}""/></td></tr><br>
    		<tr><td><input type="submit" value="确认修改"></td></tr>
    		</table>
    	</form>
  </body>
</html>
