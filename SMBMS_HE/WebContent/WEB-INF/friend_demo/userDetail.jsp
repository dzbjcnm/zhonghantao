<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户详情</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/style.css">

<script src="js/jquery-3.2.1.min.js"></script>
</head>
<body class="style-2">

	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<ul class="menu" style="color: yellow;">
					<li style="font-size: 35px; color: #33cccc;">用户详情</li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<div style="color: yellow;">
					<h2>信息</h2>
					<div class="form-group">
						<div class="table-responsive">
							<table class="table" style="color: green;">
								<tr>
									<td>姓名</td>
									<td>联系方式</td>
									<td>性别</td>
								</tr>
								<tr>
									<td>${myUser.name }</td>
									<td>${myUser.phone }</td>
									<td>${myUser.gendar }</td>
								</tr>
							</table>
							<c:if test="${u.id==myUser.id }">
								<h1 style="font-size: 20px">上传头像:</h1>
								<form action="msgUpload.do?id=${myUser.id }" method="post" class="form" enctype="multipart/form-data">
									<table>
										<tr>
											<td>文件: <input type="file" name="file1" /></td>
											<td><input type="submit" value="确定"
												class="" /></td>
											<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="userListPage.do"><input type="button" value="返回"
												 class="" /></a></td>
										</tr>
									</table>
								</form>
							</c:if>
							<h1 style="font-size: 20px">查看头像:</h1>
							<table class="table">
								<c:forEach items="${pList }" var="p">
									<tr>
										<td><img src="${pageContext.request.contextPath }/upload/${p.picName}"
											width="300" height="200" /></td>
									</tr>
								</c:forEach>
							</table>
							<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="userListPage.do"><input type="button" value="返回" class="btn btn-default" /></a></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/modernizr-2.6.2.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.placeholder.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>
