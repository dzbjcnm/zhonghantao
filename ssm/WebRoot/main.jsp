<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户首页</title>
  </head>
  
  <body>
   <br>
  <br>
  <br>
  	<h3 align="center">用户列表<h3>
  <hr>
  		<table border="1px" align="center" width="600px" height="300px">
  			  <tr>
  				<td>序号</td>
  				<td>用户名</td>
  				<td>年龄</td>
  				<td>地址</td>
  				<td>
  					操作
  		        </td> 
  		        </tr> 
  		 <c:forEach items="${infoList }" var="info">
<tr>
 	<td>${info.id}</td>
	<td>${info.name}</td>	
	<td>${info.age}</td>
	<td>${info.address}</td>
	<td><a href="${pageContext.request.contextPath }/user/edit.action?id=${info.id}">修改</a>
		<a href="${pageContext.request.contextPath }/user/delete.action?id=${info.id}">删除</a>
	</td>
	</tr>
</c:forEach>
  		</table>
  		<p align="center">
    		<a href="${pageContext.request.contextPath }/user/addinfo.action">添加新用户</a>
    	</p>
  </body>
</html>
