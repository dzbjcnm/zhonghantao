<%@ page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>注册成功</title>
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
<script type="text/javascript">
$(document).ready(function(){
    var code = 5;
    setInterval(function mytime(){
        code--;
        $("#time").html(code).css("color","red");
        if(code == 0){
            window.location.href = "loginPage.do";
            return false;
        }
    }, 1000);
})
</script>
<body class="style-5">

	<div class="container">
		<div class="row">
			<div class="">
				<ul class="menu">
					<li style="font-size: 35px; color: #33cccc;">注册成功！！！！！！！！！！！</li>
				</ul>
			</div>
		</div>
		<div class="row" style="margin-top: 190px;">
			<div class="col-md-8">
				
				<h1 style="color: white;">恭喜 ,注册成功,请先登录</h1>
				
				<span id="time">5</span><span style="color: white;">秒后自动调转登陆，若不能调转</span><a href="loginPage.do"
					style="color: red;"> 请点击我 </a>
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