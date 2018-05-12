<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.minjxu.exam.*"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" type="text/css" href="./css/styles.min.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/login-reg-style.css">

<title>考试信息数字化平台</title>
<link rel="SHORTCUT ICON" href="./img/circle.jpg" />
</head>

<body>
	<div class="login-wrap">
		<div class="bg-pic">
			<img class="img-bg" src="./img/login-bg-small.jpg">
		</div>
		<div class="login-content-wrap">
			<div class="login-content">
				<form action="./login" name="form_wm" class="login-form"
					id="loginForm" method="post">
					<img src="./img/school.jpg" alt="logo" style="max-width: 100%;">
					<div class="main-error-tips" id="errormsg">
						${msg }
						<%
							session.removeAttribute("msg");
						%>
					</div>

					<div class="username"
						style="border-bottom: 0px; padding-bottom: 0px">
						<em class="glyphicon glyphicon-certificate" aria-hidden="true"></em><span>|</span>
						<label class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="inlineRadio1" value="student"
							checked> 学生
						</label> <label class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="inlineRadio2" value="teacher">
							教师
						</label> <label class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="inlineRadio3" value="admin">
							管理员
						</label>
					</div>
					<div class="username">
						<em class="glyphicon glyphicon-user" aria-hidden="true"></em><span>|</span>
						<input type="text" name="username" id="username" placeholder="账号"
							class="userNameInput">
					</div>
					<div class="password">
						<em class="glyphicon glyphicon-pencil" aria-hidden="true"></em><span>|</span>
						<input type="password" name="password" id="password"
							placeholder="密码" class="passwordInput">
					</div>

					<div class="remember">
						<a href="" class="forget-password">忘记密码</a>
					</div>
					<input type="submit" class="btn btn-login btn-primary" value="登录">
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="./js/jquery.min.js" charset="UTF-8"></script>
	<script type="text/javascript" src="./js/bootstrap.min.js"></script>
</body>
</html>