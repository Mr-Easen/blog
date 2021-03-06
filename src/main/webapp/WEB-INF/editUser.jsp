<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
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
<title>修改密码</title>
<link rel="stylesheet" type="text/css" href="static/css/admin/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/css/admin/style.css">
<link rel="stylesheet" type="text/css" href="static/css/admin/login.css">
<link rel="stylesheet" type="text/css" href="static/css/admin/font-awesome.min.css">
<script src="static/js/admin/jquery-2.1.4.min.js"></script>
<script src="static/js/mbox_1.js"></script>
</head>
<body class="user-select" onload="showDialog()">
<%-- <section class="container-fluid">
  <header>
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          <a class="navbar-brand" href="/">Admin</a> </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${admin.userName } <span class="caret"></span></a>
              <ul class="dropdown-menu dropdown-menu-left">
                <li><a title="查看或修改个人信息" data-toggle="modal" data-target="#seeUserInfo">个人信息</a></li>
              </ul>
            </li>
            <li><a href="login/toAdminLogin" onClick="if(!confirm('是否确认退出？'))return false;">退出登录</a></li>
          </ul>
          <form action="user/toManageUser" method="post" class="navbar-form navbar-right" role="search">
            <div class="input-group">
              <input type="text" class="form-control" name="key" value="${key }" autocomplete="off" placeholder="键入关键字搜索" maxlength="15" >
              <span class="input-group-btn">
              <button class="btn btn-default" type="submit">搜索</button>
              </span> </div>
          </form>
        </div>
      </div>
    </nav>
  </header>
  <div class="row">
    <aside class="col-sm-3 col-md-2 col-lg-2 sidebar">
      <ul class="nav nav-sidebar">
        <li class="active"><a href="javascript:location.reload();">用户</a>
        </li>
        <li><a href="article/toCheckArticle">文章</a></li>
      </ul>
    </aside>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
    <h1 class="page-header">操作</h1>
        <h1 class="page-header">用户管理</h1>
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">序号</span></th>
                <th><span class="glyphicon glyphicon-user"></span> <span class="visible-lg">用户名</span></th>
                <th><span class="glyphicon glyphicon-bookmark"></span> <span class="visible-lg">邮箱</span></th>
                <th><span class="glyphicon glyphicon-pushpin"></span> <span class="visible-lg">文章</span></th>
                <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">注册时间</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
            </thead>
            <tbody>
	            <c:forEach items="${userList }" var="item" varStatus="status">
	              <tr>
	                <td>${status.index + 1 }</td>
	                <td>${item.userName }</td>
	                <td>${item.email }</td>
	                <td>${item.articleCount }</td>
	                <td><fmt:formatDate value="${item.registerDate}" /></td>
	                <td><a rel="1" name="see" id="${item.id }">修改</a><input type="hidden" class="userId" value="${item.id }"> <a rel="1" name="delete">删除</a> </td>
	              </tr>
	            </c:forEach>
            </tbody>
          </table>
        </div>
    </div>
  </div>
</section> --%>
<!--用户信息模态框-->
<div style="display: block;" class="modal fade" id="seeUser" tabindex="-1" role="dialog" aria-labelledby="seeUserModalLabel">
  <div class="modal-dialog" role="document" style="max-width:450px;">
    <form action="user/modifyUser" id="userForm" method="post" autocomplete="off" draggable="false">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">修改用户</h4>
        </div>
        <div class="modal-body">
          <table class="table" style="margin-bottom:0px;">
            <thead>
              <tr> </tr>
            </thead>
            <tbody>
              <tr>
                <td wdith="20%">用户名:</td>
                <td width="80%"><input type="text" readonly="readonly" value="${user.userName }" class="form-control" id="userName" name="userName" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">邮箱:</td>
                <td width="80%"><input type="text" readonly="readonly" value="${user.email }" class="form-control" id="email" name="email" maxlength="13" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">旧密码:</td>
                <td width="80%"><input type="password" class="form-control" id="old_password" name="old_password" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">新密码:</td>
                <td width="80%"><input type="password" class="form-control" id="password" name="password" maxlength="18" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">确认密码:</td>
                <td width="80%"><input type="password" class="form-control" id="re_password" name="re_password" maxlength="18" autocomplete="off" /></td>
              </tr>
            </tbody>
            <tfoot>
              <tr></tr>
            </tfoot>
          </table>
        </div>
        <div class="modal-footer">
          <input type="hidden" name="id" id="userId" value="${user.id }" />
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
          <button type="button" class="btn btn-primary">提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
<script src="static/js/admin/bootstrap.min.js"></script>
<script src="static/js/admin/admin-scripts.js"></script>
<script>
	function showDialog()
	{
		$('#seeUser').modal('show');
	}
$(function () {
	
	
    $("#main table tbody tr td a").click(function () {
        var name = $(this);
        if (name.attr("name") === "see") {
        var id = name.next().val(); //对应id   
            $.ajax({
                type: "POST",
                url: "user/getUser",
                data: "id=" + id,
                cache: false, //不缓存此页面   
                success: function (data) {
					$('#userName').val(data.user.userName);
					$('#email').val(data.user.email);
					$("#userId").val(data.user.id);
					$('#seeUser').modal('show');
                }
            });  
        } else if (name.attr("name") === "delete") {
            if (window.confirm("此操作不可逆，是否确认？")) {
            	 var id = name.prev().val(); //对应id
            	 location.href = 'user/delUser?id='+id;
            };
        };
    }); 
    $(".btn-primary").click(function ()
    {
    	var oldPassword = $("#old_password").val();
    	var password = $("#password").val();
    	var rePassword = $("#re_password").val();
    	if(password == '' || rePassword == '' || oldPassword == '')
    	{
    		new AutoBox({content:'密码不能为空~',mask:"#000",autoClose:3});
    		return;
    	}
    	if(password != rePassword)
    	{
    		new AutoBox({content:'密码不一致~',mask:"#000",autoClose:3});
    		return;
    	}
    	if(oldPassword != '${user.password}')
    	{
    		new AutoBox({content:'旧密码输入错误~',mask:"#000",autoClose:3});
    		return;
    	}
    	if(oldPassword == password)
    	{
    		new AutoBox({content:'新密码与旧密码一致，请重新输入~',mask:"#000",autoClose:3});
    		return;
    	}
    	$.ajax({
            type: "POST",
            url: "user/modifyUser",
            data: $("#userForm").serialize(),
            cache: false, //不缓存此页面   
            dataType:"json",
            success: function (data) {
				if(data.info == "success")
				{
					new AutoBox({content:'<div style="padding: 0 30px 30px 30px;">修改成功，请重新登录</div>',img:'remind',mask:"#000",Yes:'确定',No:'取消',
		                yc:function(){
		                	location.href = "login/toLogin";
		                }
		            })
				}
				else
				{
					new AutoBox({content:'修改失败，请重试~',mask:"#000",autoClose:3});
				}
            }
        });
    });
});
</script>
</body>
</html>