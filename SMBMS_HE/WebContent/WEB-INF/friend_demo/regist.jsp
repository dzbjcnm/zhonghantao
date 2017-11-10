<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>zhuce</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="shortcut icon" href="favicon.ico">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/style.css">

<!-- jQuery -->
<script src="js/jquery-3.2.1.min.js"></script>
</head>
<script type="text/javascript">
    function changeCode() {
        var img = document.getElementById("num");
        img.src = "verify.do?" + new Date();
    }
    var flag1 = false;//用户名状态码
    var flag2 = false;//真事姓名状态码

    $(function() {
        var $username = $("input[name='username']"); //用户名
        $username.blur(function() {
            var usernameVal = $username.val();
            if (usernameVal == null || usernameVal == "") {
                flag1 = false;
                $("#usernameErr").html("输入不能为空!").css("color", "red");
                return;
            }
            $.ajax({
                url : "findByName.do",
                data : {
                    "username" : usernameVal
                },
                dataType : "json",
                success : function(msg) {
                    if (!msg) {
                        flag1 = false;
                        $("#usernameErr").html("用户名被占用!").css("color", "red");
                    } else {
                        flag1 = true;
                        $("#usernameErr").html("可以使用!").css("color", "green");
                    }
                }
            });
        });

        var patrn1 = new RegExp(
                "^([\u4E00-\uFA29]|[\uE7C7-\uE7F3]|[a-zA-Z]){1,20}$"); //真实姓名
        var $name = $("input[name='name']");
        $name.blur(function() {
            var nameVal = $name.val();
            if (nameVal == null || nameVal == "") {
                flag2 = false;
                $("#nameErr").html("输入不能为空!").css("color", "red");
            } else {
                var f = patrn1.test(nameVal);
                if (f) {
                    flag2 = true;
                    $("#nameErr").html("可以使用!").css("color", "green");
                } else {
                    flag2 = false;
                    $("#nameErr").html("输入不符合规范!").css("color", "red");
                }
            }
        });

        var $password = $("input[name='pwd']"); //密码
        $password.blur(function() {
            var passwordVal = $password.val();
            if (passwordVal == null || passwordVal == "") {
                flag1 = false;
                $("#passwordErr").html("输入不能为空!").css("color", "red");
            } else {
                flag1 = true;
                $("#passwordErr").html("可以使用!").css("color", "green");
            }
        });

        var patrn2 = new RegExp("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$"); //电话号码
        var $phone = $("input[name='phone']");
        $phone.blur(function() {
            var phoneVal = $phone.val();
            if (phoneVal == null || phoneVal == "") {
                flag1 = false;
                $("#phoneErr").html("输入不能为空!").css("color", "red");
            } else {
                var f = patrn2.test(phoneVal);
                if (f) {
                    flag1 = true;
                    $("#phoneErr").html("可以使用!").css("color", "green");
                } else {
                    flag1 = false;
                    $("#phoneErr").html("输入不符合规范!").css("color", "red");
                }
            }
        });
		
        var patrn3 = new RegExp("^(?:[1-9][0-9]?|1[01][0-9]|120)$"); //年龄
        var $age = $("input[name='age']");
        $age.blur(function() {
            var ageVal = $age.val();
            if (ageVal == null || ageVal == "") {
                flag1 = false;
                $("#ageErr").html("输入不能为空!").css("color", "red");
            } else {
                var f = patrn3.test(ageVal);
                if (f) {
                    flag1 = true;
                    $("#ageErr").html("可以使用!").css("color", "green");
                } else {
                    flag1 = false;
                    $("#ageErr").html("年龄超过范围!").css("color", "red");
                }
            }
        });

    });
    
    
    $(function(){
    	$button=$("input[name='Mysubmit']");
    	$button.click(function(){
    		 var usernameVal = $("input[name='username']").val();
    		 var passwordVal = $("input[name='password']").val();
    		 var phoneVal = $("input[name='phone']").val();
    	if (usernameVal==""||usernameVal==null || passwordVal==""||passwordVal==null||phoneVal==""||phoneVal==null) {
    		flag1=false;
			$("#loginErr").html("账号、密码、电话不能为空！").css("color","red");
			}else{
				   $("#myfrom").submit();
			}
    	})
    })
  	 
</script>
<body class="style-2">

<div class="container">
<div class="row">
			<div class="col-md-12 text-center">
				<ul class="menu">
					<li style="font-size: 35px; color:#382;">狗××超市管理系统贼拉无敌好看酷炫的注册页面</li>
				</ul>
			</div>
		</div>
    <div class="row">
        <div class="col-md-4">
            
            <form action="Regist.do" class="fh5co-form animate-box" data-animate-effect="fadeInLeft" id="myfrom">
                <h2>注册账号</h2>
                <div class="form-group">
                    <input type="text" class="form-control" name="username" placeholder="账号" autocomplete="off">
                    <span id="usernameErr"></span>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="name" placeholder="真名" autocomplete="off">
                    <span id="nameErr"></span>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="密码"
                           autocomplete="off">
                    <span id="passwordErr"></span>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="age" placeholder="年龄"
                           autocomplete="off">
                    <span id="ageErr"></span>
                </div>
                <div class="form-group">
                   	 男 <input type="radio" class="inputgri" name="gendar" value="男" checked="checked"/>
                                     女<input type="radio" class="inputgri" name="gendar" value="女"/>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="phone" placeholder="电话"
                           autocomplete="off">
                    <span id="phoneErr"></span>
                </div>
                <div class="form-group">
                    <p>已有账号? <a href="loginPage.do">登录</a></p>
                </div>
                <div class="form-group">
                    <input type="button" value="点啊！" name="Mysubmit" class="btn btn-primary">
                    <span id="loginErr"></span>
                </div>
            </form>

        </div>
    </div>
</div>

	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.placeholder.min.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/main.js"></script>

</body>
</html>
