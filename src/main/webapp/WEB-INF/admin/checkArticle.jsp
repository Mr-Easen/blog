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
<title>文章管理</title>
<link rel="stylesheet" type="text/css" href="static/css/admin/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/css/admin/style.css">
<link rel="stylesheet" type="text/css" href="static/css/admin/login.css">
<link rel="stylesheet" type="text/css" href="static/css/admin/font-awesome.min.css">
<script src="static/js/admin/jquery-2.1.4.min.js"></script>
</head>
<body class="user-select">
<section class="container-fluid">
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
          <form action="article/toCheckArticle" method="post" class="navbar-form navbar-right" role="search">
            <div class="input-group">
              <input type="text" class="form-control" value="${keyWord }" name="keyWord" autocomplete="off" placeholder="键入关键字搜索" maxlength="15">
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
        <li><a href="user/toManageUser">用户</a></li>
        <li class="active"><a href="javascript:location.reload()">文章</a></li>
      </ul>
    </aside>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
      <form action="article/delArticle" method="post" >
        <h1 class="page-header">操作</h1>
        <h1 class="page-header">文章 管理</h1>
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">选择</span></th>
                <th><span class="glyphicon glyphicon-file"></span> <span class="visible-lg">标题</span></th>
                <th><span class="glyphicon glyphicon-list"></span> <span class="visible-lg">分类</span></th>
                <th class="hidden-sm"><span class="glyphicon glyphicon-comment"></span> <span class="visible-lg">评论</span></th>
                <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">日期</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
            </thead>
            <tbody>
            	<c:forEach items="${articleList }" var="item">
	              <tr>
	                <td><input type="checkbox" class="input-control" name="ids" value="${item.id }" /></td>
	                <td class="article-title">${item.title }</td>
	                <td>${item.categoryName }</td>
	                <td class="hidden-sm">${item.commentCount }</td>
	                <td><fmt:formatDate value="${item.issueTime}" /></td>
	                <td><a href="article/toViewBlog?id=${item.id }">浏览</a> <a rel="${item.id }">删除</a></td>
	              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
        <footer class="message_footer">
          <nav>
            <div class="btn-toolbar operation" role="toolbar">
              <div class="btn-group" role="group"> <a class="btn btn-default" onClick="select()">全选</a> <a class="btn btn-default" onClick="reverse()">反选</a> </div>
              <div class="btn-group" role="group">
                <button type="button" class="btn btn-default" id="delBtn" data-toggle="tooltip" data-placement="bottom" title="删除全部选中" name="checkbox_delete">删除</button>
              </div>
            </div>
            <ul class="pagination pagenav">
              <!-- <li class="disabled"><a aria-label="Previous"> <span aria-hidden="true">&laquo;</span> </a> </li> -->
              <li class="" <c:if test="${pageNumber == 1 }">style="display:none;"</c:if>><a href="article/toCheckArticle?pageNumber=1&keyWord=${keyWord}">首页</a></li>
			  <li class="" <c:if test="${pageNumber == 1 }">style="display:none;"</c:if>><a href="article/toCheckArticle?pageNumber=${pageNumber - 1 }&keyWord=${keyWord}">上一页</a></li>
              <li class="active"><a>当前第${pageNumber }页</a></li>
			  <li class="" <c:if test="${pageNumber == pageCount }">style="display:none;"</c:if> ><a href="article/toCheckArticle?pageNumber=${pageNumber + 1 }&keyWord=${keyWord}">下一页</a></li>
			  <li class="" <c:if test="${pageNumber == pageCount }">style="display:none;"</c:if> ><a href="article/toCheckArticle?pageNumber=${pageNumber + 1 }&keyWord=${keyWord}">末页</a></li>
              <li class="active"><a>共${pageCount }页</a></li>
              <!-- <li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a> </li> -->
            </ul>
          </nav>
        </footer>
      </form>
    </div>
  </div>
</section>
<!--个人信息模态框-->
<div class="modal fade" id="seeUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <form action="" method="post">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" >个人信息</h4>
        </div>
        <div class="modal-body">
          <table class="table" style="margin-bottom:0px;">
            <thead>
              <tr> </tr>
            </thead>
            <tbody>
              <tr>
                <td wdith="20%">用户名:</td>
                <td width="80%"><input type="text" value="${admin.userName }" class="form-control" name="truename" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">邮箱:</td>
                <td width="80%"><input type="text" value="${admin.email }" class="form-control" name="username" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">密码:</td>
                <td width="80%"><input type="text" value="${admin.password }" class="form-control" name="usertel" maxlength="13" autocomplete="off" /></td>
              </tr>
            </tbody>
            <tfoot>
              <tr></tr>
            </tfoot>
          </table>
        </div>
      </div>
    </form>
  </div>
</div>
<script src="static/js/admin/bootstrap.min.js"></script>
<script src="static/js/admin/admin-scripts.js"></script>
<script>
//是否确认删除
$(function(){   
	$("#main table tbody tr td a").click(function(){
		var name = $(this);
		var id = name.attr("rel"); //对应id  
		var ids = [];
		ids[0] = id;
		console.info(ids);
		if (event.srcElement.outerText == "删除") 
		{
			if(window.confirm("此操作不可逆，是否确认？"))
			{
				del(ids);
			};
		};
	});   
	
	$("#delBtn").click(function ()
	{
		var obj=$("input[name='ids']");  
        arr = [];
            for(k in obj){
                if(obj[k].checked)
                   arr.push(obj[k].value);
            }
        del(arr);
	});
	
	function del(ids)
	{
		$.ajax({
			type: "POST",
			traditional: true, 
			url: "article/delArticle",
			data: {"ids":ids},
			dataType:"json",
			cache: false, //不缓存此页面   
			success: function (data) {
				if(data.info == "success")
				{
					window.location.reload();
				}
				else
				{
					alert(data.info);
				}
			}
		});
	}
});
</script>
</body>
</html>