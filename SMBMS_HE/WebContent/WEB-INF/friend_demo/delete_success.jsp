<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除</title>
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
$(document).ready(function(){
    var code = 5;
    setInterval(function mytime(){
        code--;
        $("#time").html(code).css("color","red");
        if(code == 0){
            window.location.href = "userListPage.do";
            return false;
        }
    }, 1000);
})
</script>
<body class="style-5">

	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<ul class="menu">
					<li style="font-size: 35px; color: #33cccc;">已删除成功！</li>
				</ul>
			</div>
		</div>
		<div class="row" style="margin-top: 190px;">
			<div class="col-md-8">
				<h1 style="color: white;">用户删除成功!</h1>
				<span id="time">5</span><span style="color: white;">秒后自动跳转</span><a href="userListPage.do">列表</a>
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
