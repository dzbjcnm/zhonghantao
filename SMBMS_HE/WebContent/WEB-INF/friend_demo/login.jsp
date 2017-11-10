<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/style.css">

<script src="js/jquery-3.2.1.min.js"></script>

<script type="text/javascript">
    $(function() {
        $button = $("input[name='mybutton']");
        $button.click(function() {
            var username = $("input[name='username']").val();
            var password = $("input[name='password']").val();
            
            $.ajax({
                url : "login.do",
                data : {
                    "username" : username,
                    "password" : password
                },
                dataType : "json",
                type : "post",
                success : function(msg) {
                    if (!msg) {
                        $("#loginErr").html("用户名或者密码错误!").css("color", "red");
                    } else {
                        $("#myform").submit();
                    }
                }
            });
        });
    });
</script>
<body class="style-4">

	<div class="container">
		<div class="row">
			<div>
				<ul class="menu">
					<li style="font-size: 35px; color:red;">狗××超市管理系统贼拉无敌好看酷炫的登录页面</li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<form action="doLogin.do" class="fh5co-form animate-box"
					data-animate-effect="fadeInLeft" id="myform">
					<h2>登录</h2>
					<div class="form-group">
						<label for="username" class="sr-only">姓名</label> <input
							type="text" class="form-control" name="username"
							placeholder="账号" autocomplete="off">
					</div>
					<div class="form-group">
						<label for="password" class="sr-only">密码</label> <input
							type="password" class="form-control" name="password"
							placeholder="密码" autocomplete="off"> <span
							id="loginErr"></span>
					</div>
					<div class="form-group">
						<p>
							没有账号? <a href="toRegister.do">注册</a>
						</p>
					</div>
					<div class="form-group">
						<input type="button" value="确定啊，快确定啊点我啊啊啊啊！！" class="btn btn-primary" name="mybutton" id="mybutton">
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
