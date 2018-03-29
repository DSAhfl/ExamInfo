<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="renderer" content="webkit">
<meta name="description" content="">
<meta name="author" content="">
<link rel="stylesheet" href="./css/loading.css">
<link rel="stylesheet" type="text/css" href="./css/styles.min.css">
<link rel="stylesheet" type="text/css" href="./css/style.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/login-reg-style.css">

<script type="text/javascript" async="" src="./js/vds.js"></script>
<script type="text/javascript">
	var _pattern = "android|blackberry|googlebot-mobile|iemobile|ipad|iphone|ipod|opera mobile|palmos|webos|ucweb|rv:1.2.3.4"
	var _regex = new RegExp(_pattern, "ig");
	var _UA = navigator.userAgent;
</script>

<script type="text/javascript">
	var _vds = _vds || [];
	window._vds = _vds;
	(function() {
		_vds.push([ 'setAccountId', '87d10bc8158a4ed0a2206a6f0bdd2a5c' ]);

		(function() {
			var vds = document.createElement('script');
			vds.type = 'text/javascript';
			vds.async = true;
			vds.src = ('https:' == document.location.protocol ? 'https://'
					: 'http://')
					+ 'dn-growing.qbox.me/vds.js';
			var s = document.getElementsByTagName('script')[0];
			s.parentNode.insertBefore(vds, s);
		})();
	})();
	function DivLoads(state) {
		var DivRef1 = document.getElementById("Loader");
		var IfrRef1 = document.getElementById("Shimerx");
		if (state) {
			DivRef1.style.display = "block";
			IfrRef1.style.width = DivRef1.offsetWidth;
			IfrRef1.style.height = DivRef1.offsetHeight;
			IfrRef1.style.top = DivRef1.style.top;
			IfrRef1.style.left = DivRef1.style.left;
			IfrRef1.style.zIndex = DivRef1.style.zIndex - 1;
			IfrRef1.style.display = "block";
		} else {
			DivRef1.style.display = "none";
			IfrRef1.style.display = "none";
		}
	}
</script>

<title>Insert title here</title>

</head>
<body>
	<div class="login-wrap">
		<div class="bg-pic">
			<img class="img-bg" src="./login_files/login-bg-small.jpg">
		</div>
		<div class="login-content-wrap">
			<div class="login-content">
				<form action="https://www.kaoshixing.com/account/login"
					name="form_wm" class="login-form" id="loginForm">
					<img src="./login_files/logo.png" alt="logo" class="logo">
					<div class="main-error-tips" id="errormsg"></div>

					<input type="hidden" name="userName" id="username_tran">
					<div class="username">
						<em class="icon icon-ksx-username"></em> <span>|</span> <input
							type="text" name="userNameInput" id="username" placeholder="账号"
							class="userNameInput">
					</div>
					<div class="password">
						<em class="icon icon-ksx-password"></em> <span>|</span> <input
							type="password" name="password" id="userTypePwd" placeholder="密码"
							class="passwordInput">
					</div>
					<div class="remember">
						<label for="saveUsername" class="hidden"><input
							type="checkbox" id="saveUsername" name="autoLogin">7天自动登录</label>
						<a href="https://www.kaoshixing.com/account/find_pwd/"
							class="forget-password">忘记密码</a>
					</div>
					<a href="javascript:void(0);" class="btn btn-login btn-primary">登录</a>

					<a
						href="https://open.weixin.qq.com/connect/qrconnect?appid=wx3dbf3a23e8456f1a&amp;redirect_uri=https://www.kaoshixing.com/account/wechat_login_independent&amp;response_type=code&amp;scope=snsapi_login&amp;state=STATE#wechat_redirect"
						class="btn btn-wechat btn-default"><em
						class="icon icon-ksx-wechat"></em>微信快速登录</a> <a
						href="https://www.kaoshixing.com/account/regist"
						class="btn-regist">注册企业账号</a>












					<div class="login-content-footer">

						<div class="mobile-register">
							<em class="icon icon-ksx-login-up"></em><a
								href="https://www.kaoshixing.com/account/regist"
								class="btn btn-default mobile-btn-regist">注册企业账号</a>
						</div>

						<div class="login-on-phone">
							<div class="qr-code-wrap">
								<div class="qr-codes">
									<canvas width="100" height="100"></canvas>
								</div>
							</div>
							<em class="icon icon-ksx-Mobile-phone"></em><a
								href="javascript:void(0);" class="show-qr-code">在手机上使用</a>
						</div>





						<div id="switchLang" class="switchLang">
							<em class="icon  icon-ksx-en"></em> <span class="ch">English</span>
						</div>
					</div>
				</form>
				<div id="loginWechet" class="reg-form loginWechet weChatBind"
					style="display: none;">
					<div class="reg-tips finish-tips">登陆成功！</div>
					<em class="icon icon-ksx-succeed"></em>
					<div class="finish-text">绑定微信，即可扫码一键登录</div>
					<a href="javascript:void(0);"
						class="btn btn-goto-bind all-right btn-primary">立即绑定微信</a> <a
						href="javascript:void(0);" class="btn btn-goto-login">先不绑定，直接登录</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>