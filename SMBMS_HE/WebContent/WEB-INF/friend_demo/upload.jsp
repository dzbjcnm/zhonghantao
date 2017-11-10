<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改</title>
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
				<ul class="menu">
					<li style="font-size: 35px; color: #33cccc;">欢迎你!${u.name }</li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<!-- Start Sign In Form -->
				<form action="update.do" class="fh5co-form animate-box"
					data-animate-effect="fadeInLeft">
					<h2>修改</h2>
					<div class="form-group">
						<div class="table-responsive">
							<table class="table">
								<tr>
									<td>id</td>
									<td><input type="hidden" name="id" value="${user1.id }"></input></td>
								</tr>
								<tr>
									<td>账号</td>
									<td><input class="form-control" disabled="disabled"
										name="username" value="${user1.username }"></input></td>
								</tr>
								<tr>
									<td>密码</td>
									<td><input class="form-control" name="password"
										value="${user1.password }"></input></td>
								</tr>
								<tr>
									<td>姓名</td>
									<td><input class="form-control" name="name"
										value="${user1.name }"></input></td>
								</tr>
								<tr>
									<td>性别</td>
									<td><input class="form-control" name="gendar"
										value="${user1.gendar }"></input></td>
								</tr>

								<tr>
									<td>年龄</td>
									<td><input class="form-control" name="age"
										value="${user1.age }"></input></td>
								</tr>
								<tr>
									<td>电话</td>
									<td><input class="form-control" name="phone"
										value="${user1.phone }"></input></td>
								</tr>
								<tr>
									<td>
										<div class="form-group">
											<input type="submit" class="btn btn-primary" value="提交" />
										</div>
									</td>
									<td>
										<div class="form-group">
											<a href="userListPage.do"><input type="button" class="btn btn-primary"
												value="返回" /></a>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</form>


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
