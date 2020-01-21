<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
<link rel="stylesheet" href="static/css/login/reset.css" />
<link rel="stylesheet" href="static/css/login/common.css" />
<link rel="stylesheet" href="static/css/login/font-awesome.min.css" />
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/register.js"></script>
<script src="static/js/mbox_1.js"></script>
</head>
<body>
	<div class="wrap login_wrap">
		<div class="content">

			<div class="logo"></div>

			<div class="login_box">

				<div class="login_form">
					<div class="login_title">注册</div>
					<form action="user/addUser" method="post" id="registerForm">

						<div class="form_text_ipt">
							<input id="userName" name="userName" type="text" placeholder="用户名">
						</div>
						<div class="form_text_ipt">
							<input id="email" name="email" type="text" placeholder="邮箱">
						</div>
						<div class="form_text_ipt">
							<input id="password" name="password" type="password" placeholder="密码">
						</div>
						<div class="form_text_ipt">
							<input id="repassword" name="repassword" type="password" placeholder="重复密码">
						</div>

						<div class="form_btn">
							<button type="button"
								id="register_button">注册</button>
						</div>
						<div class="form_reg_btn">
							<span>已有帐号？</span><a href="login/toLogin">马上登录</a>
						</div>
						<input type="hidden" name="photoUrl" value="/blog/img/default.jpg">
						<input type="hidden" name="role" value="0">
					</form>
					<div class="other_login">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>