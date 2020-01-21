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
<title>登录</title>
<link rel="stylesheet" href="static/css/login/reset.css" />
<link rel="stylesheet" href="static/css/login/common.css" />
<link rel="stylesheet" href="static/css/login/font-awesome.min.css" />
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/login.js"></script>
<script src="static/js/mbox_1.js"></script>
</head>
<body>
	<div class="wrap login_wrap">
		<div class="content">
			<div class="logo"></div>
			<div class="login_box">

				<div class="login_form">
					<div class="login_title">登录</div>
					<form action="#" method="post" id="loginForm">
						<div class="form_text_ipt">
							<input id="key" name="key" type="text" placeholder="用户名/邮箱">
						</div>
						<div class="key_warning">
							<span>用户名/邮箱不能为空</span>
						</div>
						<div class="form_text_ipt">
							<input id="password" name="password" type="password" placeholder="密码">
						</div>
						<div class="password_warning">
							<span>密码不能为空</span>
						</div>
						<div class="form_check_ipt">
							<div class="left check_left">
								<!-- <label><input name="" type="checkbox"> 下次自动登录</label> -->
							</div>
							<div class="right check_right">
								<a href="javascript:;" class="forget">忘记密码</a>
							</div>
						</div>
						<div class="form_btn">
							<button type="button"
								id="login_button">登录</button>
						</div>
						<div class="form_reg_btn">
							<span>还没有帐号？</span><a href="login/toRegister">马上注册</a>
						</div>
					</form>
					<div class="other_login">
						<!-- <div class="left other_left">
							<span>其它登录方式</span>
						</div>
						<div class="right other_right">
							<a href="#"><i class="fa fa-qq fa-2x"></i></a> <a href="#"><i
								class="fa fa-weixin fa-2x"></i></a> <a href="#"><i
								class="fa fa-weibo fa-2x"></i></a>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function ()
	{
		$(".forget").click(function ()
		{
			new AutoBox({content:'请联系管理员：admin@163.com',mask:"#000",autoClose:8});
		});
	});
</script>
</html>