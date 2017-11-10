<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>所有用户</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="favicon.ico">
<script src="js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="css/jPages.css">
<script src="js/jPages.js"></script>

<script>
    $(function() {
        $("div.holder").jPages({
            containerID : "itemContainer",
            previous : "上一页",
            next : "下一页",
            perPage : 8,
            delay : 20
        });
    });
</script>
</head>
<body class="style-2">

	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<ul class="menu">
					<li style="font-size: 35px; color:red;">欢迎进入我的后台系统!!!!!&nbsp;&nbsp;&nbsp;&nbsp;${u.name }</li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<form style="color: green;" action="Regist.do" class="" data-animate-effect="fadeInLeft">
					<h2>主页</h2>
					<div class="form-group">
						<div  class="table-responsive">
							<table class="table" style="color: fuchsia;">
								<thead>
									<tr>
										<th>ID</th>
										<th>名字</th>
										<th>性别</th>
										<th>年龄</th>
										<th>操作</th>
									</tr>
								</thead>
							
								<tbody id="itemContainer">
								<input style="float:left;" type="text" name="sousuo"><input style="float:left;" type="button" value="搜索" class="btn btn-default">
									<c:forEach items="${list}" var="user" varStatus="i">
										<tr style="color: yellow;">
											<td>${i.index+1}</td>
											<td>${user.name }</td>
											<td>${user.gendar }</td>
											<td>${user.age }</td>
											<td>
												<c:if test="${u.id==2 ||user.id==u.id}">
													<a href="delete.do?id=${user.id }" onclick="return confirm('确定删除用户吗');" style="color: red;">删除</a>
													<a href="load.do">更新</a>
												</c:if> 
													<a href="userDetail.do?id=${user.id }">详情</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="holder" style="float:right: ;"></div>
						</div>
						<div class="form-group">
							<input type="button" value="返回" class="btn btn-default"
								id="mybutton" onclick="location='loginPage.do'" />
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