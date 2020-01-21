$(function(){
	
	//登录输入框效果
	$('.form_text_ipt input').focus(function(){
		$(this).parent().css({
			'box-shadow':'0 0 3px #bbb',
		});
	});
	$('.form_text_ipt input').blur(function(){
		$(this).parent().css({
			'box-shadow':'none',
		});
		//$(this).parent().next().hide();
	});
	
	$('#email').blur(function ()
	{
		var emailReg = /^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
		var email = $("#email").val();
		if(!emailReg.test(email))
		{
			new AutoBox({content:'邮箱格式错误~',mask:"#000",autoClose:3});
			return;
		}
	});
	
	$('#register_button').click(function ()
	{
		var email = $("#email").val();
		var userName = $("#userName").val();
		var repassword = $("#repassword").val();
		var password = $("#password").val();
		if(userName == '')
		{
			new AutoBox({content:'用户名不能为空~',mask:"#000",autoClose:3});
			return;
		}
		if(email == '')
		{
			new AutoBox({content:'邮箱不能为空~',mask:"#000",autoClose:3});
			return;
		}
		if(password == '')
		{
			new AutoBox({content:'密码不能为空~',mask:"#000",autoClose:3});
			return;
		}
		if(repassword == '')
		{
			new AutoBox({content:'重复密码不能为空~',mask:"#000",autoClose:3});
			return;
		}
		else if(password != repassword)
		{
			new AutoBox({content:'密码不一致~',mask:"#000",autoClose:3});
			return;
		}
		var url = 'login/isExisted';
		$.post(
			url,
			$("#registerForm").serialize(),
			function(data)
			{
				if(data.info == 'success')
				{
					new AutoBox({content:'<div style="padding: 0 30px 30px 30px;">注册成功,请重新登录</div>',img:'remind',mask:"#000",Yes:'确定',No:'取消',
		                yc:function(){
		                	$("#registerForm").submit();
		                }});
				}
				else if(data.info == 'userName_existed')
				{
					new AutoBox({content:'该用户名已被占用~',mask:"#000",autoClose:3});
				}
				else if(data.info == 'email_existed')
				{
					new AutoBox({content:'该邮箱已注册~',mask:"#000",autoClose:3});
				}
			},
			"json"
		);
	});
	
});

