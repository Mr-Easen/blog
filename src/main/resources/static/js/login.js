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
	
	//表单验证
	/*$('.form_text_ipt input').bind('input propertychange',function(){
		if($(this).val()==""){
			$(this).css({
				'color':'red',
			});
			$(this).parent().css({
				'border':'solid 1px red',
			});
			//$(this).parent().next().find('span').html('helow');
			$(this).parent().next().show();
		}else{
			$(this).css({
				'color':'#ccc',
			});
			$(this).parent().css({
				'border':'solid 1px #ccc',
			});
			$(this).parent().next().hide();
		}
	});*/
	
	$('#login_button').click(function ()
	{
//		var emailReg = /^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;
		var key = $("#key").val();
		var password = $("#password").val();
		if(key == '')
		{
			$(".key_warning").show();
			return;
		}
		if(password == '')
		{
			$(".key_warning").hide();
			$(".password_warning").show();
			return;
		}
		$(".key_warning").hide();
		$(".password_warning").hide();
		var url = 'login/checkUser';
		$.post(
			url,
			$("#loginForm").serialize(),
			function(data)
			{
				if(data.info == 'success')
				{
					location.href = 'index/toIndex';
				}
				else if(data.info == 'user_inexistent')
				{
					new AutoBox({content:'用户名或邮箱错误~',mask:"#000",autoClose:3});
				}
				else
				{
					new AutoBox({content:'密码错误~',mask:"#000",autoClose:3});
				}
			},
			"json"
		);
	});
	
});

