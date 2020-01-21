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
<title>收件箱</title>
<link rel="stylesheet" type="text/css" href="static/css/admin/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/css/admin/style.css">
<link rel="stylesheet" type="text/css" href="static/css/admin/login.css">
<link rel="stylesheet" type="text/css" href="static/css/admin/font-awesome.min.css">
<script src="static/js/admin/jquery-2.1.4.min.js"></script>
<script src="static/js/mbox_1.js"></script>
</head>
<body class="user-select">
<section class="container-fluid">
  <header>
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container-fluid">
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown"> <a class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user.userName } <span class="caret"></span></a>
              <ul class="dropdown-menu dropdown-menu-left">
               <li><a href="login/toLogin" onClick="if(!confirm('是否确认退出？'))return false;">退出登录</a></li>
              </ul>
            </li>
          </ul>
          <form action="chat/toInBox" method="post" class="navbar-form navbar-right" role="search">
            <div class="input-group">
              <input type="text" class="form-control" name="keyWord" value="${keyWord }" autocomplete="off" placeholder="键入关键字搜索" maxlength="15" >
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
        <li class="active"><a href="javascript:location.reload();">收件箱</a>
        </li>
        <li><a href="chat/toOutBox">发件箱</a></li>
      </ul>
    </aside>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-lg-10 col-md-offset-2 main" id="main">
    <h1 class="page-header">操作</h1>
        <h1 class="page-header">收件箱管理</h1>
        <div class="table-responsive">
          <table class="table table-striped table-hover">
            <thead>
              <tr>
                <th><span class="glyphicon glyphicon-th-large"></span> <span class="visible-lg">序号</span></th>
                <th><span class="glyphicon glyphicon-user"></span> <span class="visible-lg">发件人</span></th>
                <th><span class="glyphicon glyphicon-bookmark"></span> <span class="visible-lg">标题</span></th>
                <th><span class="glyphicon glyphicon-pushpin"></span> <span class="visible-lg">状态</span></th>
                <th><span class="glyphicon glyphicon-time"></span> <span class="visible-lg">发送时间</span></th>
                <th><span class="glyphicon glyphicon-pencil"></span> <span class="visible-lg">操作</span></th>
              </tr>
            </thead>
            <tbody>
	            <c:forEach items="${chatList }" var="item" varStatus="status">
	              <input type="hidden" class="content" value="${item.content }">
	              <tr class="${item.id }">
	                <td>${status.index + 1 }</td>
	                <td class="userName">${item.userName }</td>
	                <td>${item.title }</td>
	                <td class="status"><c:if test="${item.status == 0 }">未读</c:if><c:if test="${item.status == 1 }">已读</c:if></td>
	                <td><fmt:formatDate value="${item.createTime}" /></td>
	                <td><a rel="1" name="see">查看</a><input type="hidden" class="id" value="${item.id }"> <a rel="1" name="delete">删除</a> </td>
	              </tr>
	            </c:forEach>
            </tbody>
          </table>
        </div>
    </div>
  </div>
</section>
<!--信息模态框-->
<div class="modal fade" id="seeUser" tabindex="-1" role="dialog" aria-labelledby="seeUserModalLabel">
  <div class="modal-dialog" role="document" style="max-width:450px;">
    <form action="user/editUser" id="userForm" method="post" autocomplete="off" draggable="false">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title">查看私信</h4>
        </div>
        <div class="modal-body">
          <table class="table" style="margin-bottom:0px;">
            <thead>
              <tr> </tr>
            </thead>
            <tbody>
              <tr>
                <td wdith="20%">发送人:</td>
                <td width="80%"><input type="text" readonly="readonly" value="" class="form-control" id="userName" name="userName" maxlength="10" autocomplete="off" /></td>
              </tr>
              <tr>
                <td wdith="20%">内容:</td>
                <td width="80%"><textarea rows="" cols="" readonly="readonly" class="form-control" id="content"></textarea></td>
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
$(function () {
    $("#main table tbody tr td a").click(function () {
        var name = $(this);
        if (name.attr("name") === "see") {
        var id = name.next().val(); //对应id   
        $("#userName").val($("."+id).find(".userName").text());
        $("#content").val($("."+id).prev().val());
		$('#seeUser').modal('show');
        if($("."+id).find(".status").text() == '未读')
        {
            $.ajax({
                type: "POST",
                url: "chat/editStatus",
                data: "id=" + id,
                dataType:"json",
                cache: false, //不缓存此页面   
                success: function (data) {
					if(data.info == "success")
					{
						$("."+id).find(".status").text("已读");
					}
					else
					{
						alert(data.info);
					}
                }
            }); 
        }
        } else if (name.attr("name") === "delete") {
            if (window.confirm("此操作不可逆，是否确认？")) {
            	 var id = name.prev().val(); //对应id
            	 $.ajax({
                     type: "POST",
                     url: "chat/delChat",
                     data: {"id":id,"type":2},
                     dataType:"json",
                     cache: false, //不缓存此页面   
                     success: function (data) {
     					if(data.info == "success")
     					{
     						location.reload();
     					}
     					else
     					{
     						alert(data.info);
     					}
                     }
                 }); 
            };
        };
    }); 
});
</script>
</body>
</html>