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
<title>管理员登录</title>
<link rel="stylesheet" type="text/css"
	href="static/css/admin/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/css/admin/style.css">
<link rel="stylesheet" type="text/css" href="static/css/admin/login.css">
<script src="static/js/admin/jquery-2.1.4.min.js"></script>
</head>
<body class="user-select">
	<div class="container">
		<div class="siteIcon">
			<img src="static/images/admin/logo.svg" alt="" data-toggle="tooltip"
				data-placement="top" title="" draggable="false" />
		</div>
		<form action="" method="post" autocomplete="off"
			class="form-signin">
			<h2 class="form-signin-heading">管理员登录</h2>
			<label for="userName" class="sr-only">用户名</label> <input type="text"
				id="userName" name="userName" class="form-control"
				placeholder="请输入用户名" required autofocus autocomplete="off"
				maxlength="10"> <label for="userPwd" class="sr-only">密码</label>
			<input type="password" id="userPwd" name="password"
				class="form-control" placeholder="请输入密码" required autocomplete="off"
				maxlength="18"> <button
					class="btn btn-lg btn-primary btn-block" type="button"
					id="signinSubmit">登录</button>
		</form>
	</div>
	<script src="static/js/admin/bootstrap.min.js"></script>
	<script src="static/js/mbox_1.js"></script>
	<script>
		$('#signinSubmit').click(function() {
			if ($('#userName').val() == '') {
				new AutoBox({content:'用户名不能为空~',mask:"#000",autoClose:3});
				return;
			} 
			if ($('#userPwd').val() == '') {
				new AutoBox({content:'密码不能为空~',mask:"#000",autoClose:3});
				return;
			} 
			$.post(
				'login/checkAdmin',
				$('.form-signin').serialize(),
				function (data)
				{
					if(data.info == 'success')
					{
						location.href = 'user/toManageUser';
					}
					else if(data.info == 'user_inexistent')
					{
						new AutoBox({content:'用户名错误~',mask:"#000",autoClose:3});
					}
					else if(data.info == 'password_error')
					{
						new AutoBox({content:'密码错误~',mask:"#000",autoClose:3});
					}
				},
				'json'
			);
		});
	</script>
</body>
</html>