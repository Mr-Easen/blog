<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<link type="favicon" rel="shortcut icon" href="/favicon.ico" />
<title>博客</title>
<link rel="stylesheet" href="static/css/base.css">
<link rel="stylesheet" href="static/css/header.css">
<link rel="stylesheet" href="static/css/other.css">
<link rel="stylesheet" href="static/css/list_tab.css">
<link rel="stylesheet" href="static/css/right.css">
<link rel="stylesheet" href="static/css/blog_list.css">
<link rel="stylesheet" href="static/css/login.css">
<script src="static/js/jquery.min.js"></script>
<script src="static/js/cookie.js"></script>
<script src="static/js/login.js"></script>
<script src="static/static/js/common.js"></script>
<script src="static/js/mbox.js"></script>
<script src="static/js/follow.js"></script>
<script src="static/js/vip.js"></script>
</head>
<body>
	<!-- <img src="picture/share_default.jpg" border="0"
		style="width: 0; height: 0; position: absolute;"> -->
	<div class="Header">
		<div class="Page ">
			<!-- <h1 class="Logo">
				<a href="">Logo</a>
			</h1> -->
			<ul class="Navigates fl">
				<li class="<c:if test='${isMyBlog == null }'>cur</c:if>"><a href="index/toIndex">首页</a></li>
					<li class="<c:if test='${isMyBlog != null }'>cur</c:if>"><a href="
						<c:if test='${user == null }'>login/toLogin</c:if>
						<c:if test='${user != null }'>user/toMyBlog</c:if>
					">我的博客</a></li>
			</ul>
			<ul class="Navigates Navigates-right fr">
				<c:if test="${user == null }">
					<li><a
						href="login/toRegister"
						target="_self">注册</a></li>
					<li class="login"><a
						href="login/toLogin"
						target="_self">登录</a></li>
				</c:if>
				<c:if test="${user != null }">
					<li class="more">
			          <a href="javascript:void(0);" id="myAllMsg">消息<i class=""></i></a>
			          <div>
			            <a href="chat/toOutBox" id="myMsg" target="_blank">私信<i class=""></i></a>
			            <i class="arrow"></i>
			          </div>
			        </li>
					<li class="more user">
			          <a class="is-vip-bg-1" href="javascript:;" target="_blank">
			            <img class="is-vip-img is-vip-img-5" data-uid="11405449" src="images/noavatar_middle.gif"/>
			          </a>
			          <div>
			            <a href="user/toMyBlog?userId=${user.id }">我的博客</a>
			            <a href="user/toMyFollow?userId=${user.id }">我的关注</a>
			            <a href="user/toEditUser">修改密码</a>
			            <a href="index/logout">退出</a>
			            <i class="arrow"></i>
			          </div>
		        </li>
		        </c:if>
				<!-- <li class="search"><a href="http://blog.51cto.com/search/index"
					target="_self">搜索</a></li> -->
				<li class="write">
					<a href='<c:choose> 
							 	<c:when test="${user == null }">login/toLogin</c:when>
							 	<c:otherwise>article/toPublish</c:otherwise>
							 </c:choose>'>写文章</a>
				</li>
			</ul>
			<div class="clear"></div>
		</div>
	</div>
	<script>
		var isLogin = '0';
		var userId = '';
		var imgpath = 'http://i2.51cto.com/';
		var BLOG_URL = 'http://blog.51cto.com/';
		var msg_num_url = 'http://blog.51cto.com/index/ajax-msg-num';
		setTimeout(function() {
			$.ajax({
				url : msg_num_url,
				type : "get",
				dataType : 'json',
				success : function(res) {
					if (res.status == '0') {
						//
						var hasNewMsg = false;
						if (res.data.msgNum > 0
								&& !$('#myMsg i').hasClass('dot')) {
							$('#myMsg i').addClass('dot');
							hasNewMsg = true;
						}
						if (res.data.notifyNum > 0
								&& !$('#myNotify i').hasClass('dot')) {
							$('#myNotify i').addClass('dot');
							hasNewMsg = true;
						}
						if (res.data.recommend_new > 0
								&& !$('#myRecommend i').hasClass('dot')) {
							$('#myRecommend i').addClass('dot');
							hasNewMsg = true;
						}
						if (hasNewMsg && !$('#myAllMsg i').hasClass('dot')) {
							$('#myAllMsg i').addClass('dot');
						}
					}

				}
			});
		}, 70);
	</script>
	<div class="Content-box">
		<script>
			function FollowBtnSucc(e) {//1:未关注,2:已关注,3:互相关注
				if (e == 2 || e == 3) {
					$.post('/index/wxbind', {
						uid : userId
					}, function(res) {
						if (getCookie('follow1') || getCookie('follow2'))
							return false;
						if (res.status == 1) {
							if (res.data.wxBind == 0) {//没绑定
								box1()
							} else {
								box2()
							}
						}
					}, 'json')
				}
			}
		</script>
		<div class="Page Index artical-box">
			<div class="Left fl">
				<ul class="artical-title">
					<li class="<c:if test='${isIndex != null }'>on</c:if>"><a href="index/toIndex">最新文章</a></li>
					<li class="<c:if test='${isCommend != null }'>on</c:if>"><a href="index/toCommend">推荐文章</a></li>
					<li class="<c:if test='${isFollow != null }'>on</c:if>"><a
						href="<c:if test='${user == null }'>login/toLogin</c:if><c:if test='${user != null }'>index/toFollow</c:if>">关注</a></li>
					<div class="clear"></div>
				</ul>
				<ul class="artical-list">
				<c:forEach items="${articleList }" var="item">
					<li>
						<div class="top ">
							<div class="is-vip-bg fl">
								<a href="javascript:;" class="a-img"
									target="_blank"> <img
									class="avatar is-vip-img is-vip-img-4" data-uid="13510772"
									src="picture/noavatar_middle.gif" />
								</a>
							</div>
							<a href="javascript:;" class="name fl"
								target="_blank">${item.authorName }</a>
							<p href="javascript:;" class="time fl">发布于：${item.issueAt }</p>
							<p class="zan fr" type="1" blog_id="2086250">${item.likesCount }</p>
							<div class="clear"></div>
						</div> <a class="tit" href="article/toViewBlog?id=${item.id }"
						target="_blank">${item.title }</a>
						<div class="con">${item.content }</div>
						<div class="bot">
							<span>阅读&nbsp;${item.readCount }</span> <span>评论&nbsp;${item.commentCount }</span> <span>收藏&nbsp;${item.markCount }</span>
							<div class="clear"></div>
						</div>
					</li>
				</c:forEach>
				</ul>

				<!-- page -->
				<ul class="pagination">
					<li class="first" <c:if test="${pageNumber == 1 }">style="display:none;"</c:if>><a href="index/toIndex?pageNumber=1&categoryId=${categoryId }">首页</a></li>
					<li class="prev" <c:if test="${pageNumber == 1 }">style="display:none;"</c:if>><a href="index/toIndex?pageNumber=${pageNumber - 1 }&categoryId=${categoryId}">上一页</a></li>
					<li class="active"><a>当前第${pageNumber }页</a></li>
					<li class="next" <c:if test="${pageNumber == pageCount }">style="display:none;"</c:if> ><a href="index/toIndex?pageNumber=${pageNumber + 1 }&categoryId=${categoryId}"
						data-page="1">下一页</a></li>
					<li class="last" <c:if test="${pageNumber == pageCount }">style="display:none;"</c:if> ><a href="index/toIndex?pageNumber=${pageCount }&categoryId=${categoryId}"
						data-page="499">末页</a></li>
					<li class="last"><span>共${pageCount }页</span></li>
				</ul>
			</div>
			<div class="Right fr">
				<ul class="artical-parent">
					<li class="artical-parent-li artical-parent-li-1 <c:if test='${categoryId  == null }'>on</c:if>">
						<p class="title">
							<i></i><a href="
							<c:choose>
								<c:when test="${isIndex != null }">index/toIndex</c:when>
								<c:when test="${isFollow != null }">index/toFollow</c:when>
								<c:otherwise>index/toCommend</c:otherwise>
							</c:choose>
							">全部</a>
						</p>
					</li>
					<c:forEach items="${categoryList }" var="item" varStatus="status">
						<li class="artical-parent-li artical-parent-li-${status.index+9 }  <c:if test='${categoryId  eq item.id }'>on</c:if>">
							<p class="title">
								<i></i><a href="
								<c:choose>
									<c:when test="${isIndex != null }">index/toIndex?categoryId=${item.id }</c:when>
									<c:when test="${isFollow != null }">index/toFollow?categoryId=${item.id }</c:when>
									<c:otherwise>index/toCommend?categoryId=${item.id }</c:otherwise>
								</c:choose>
								">${item.name }</a>
							</p>
						</li>
						<!-- <li class="artical-parent-li artical-parent-li-11 ">
							<p class="title">
								<i></i><a href="http://blog.51cto.com/original/36">人工智能</a>
							</p>
							<ul class="artical-child">
								<li class="artical-child-li "><a
									href="http://blog.51cto.com/original/92">深度学习</a></li>
								<li class="artical-child-li "><a
									href="http://blog.51cto.com/original/93">机器人开发</a></li>
								<li class="artical-child-li "><a
									href="http://blog.51cto.com/original/94">其他</a></li>
							</ul>
						</li> -->

					</c:forEach>
				</ul>
			</div>
			<div class="clear"></div>
		</div>
		<script>
			var praise_url = 'http://blog.51cto.com/praise/praise'
			setPraise($('.artical-list .top .zan'))
			$('body').css('background', '#fff')
		</script>
	</div>
	<div class="Footer">
		<p class="copy tc">
			Copyright &copy; 2005-2018 <a href="javascript:;"
				target="_blank"></a> 版权所有 京ICP证060544号
		</p>
	</div>
	<div class="rightTools">
		<a href="<c:choose> 
							 	<c:when test="${user == null }">login/toLogin</c:when>
							 	<c:otherwise>article/toPublish</c:otherwise>
							 </c:choose>" class="aa">写文章</a>  <a href="javascript:void(0);"
			class="gotop"></a>
	</div>
	<div style="display: none">
		<iframe frameborder="0" scrolling="no" width="0" height="0"
			src=""></iframe>
	</div>
	
	<script src="static/js/pvlog.js"></script>
	<script src="static/js/count.js"></script>
	<script>
		$(".gotop").click(function() {
			$(window).scrollTop(0)
		})
	</script>
	<script type="text/javascript">
		//百度统计代码
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			hm.src = "https://hm.baidu.com/hm.js?2283d46608159c3b39fc9f1178809c21";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();

		//自动推送链接
		(function() {
			var bp = document.createElement('script');
			var curProtocol = window.location.protocol.split(':')[0];
			if (curProtocol === 'https') {
				bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
			} else {
				bp.src = 'http://push.zhanzhang.baidu.com/push.js';
			}
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(bp, s);
		})();
		var _vds = _vds || [];
		window._vds = _vds;
		(function() {
			_vds.push([ 'setAccountId', '8c51975c40edfb67' ]);
			(function() {
				var vds = document.createElement('script');
				vds.type = 'text/javascript';
				vds.async = true;
				vds.src = ('https:' == document.location.protocol ? 'https://'
						: 'http://')
						+ 'assets.growingio.com/vds.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(vds, s);
			})();
		})();
		document
				.write(decodeURI("%3Cscript src='https://tongji.51cto.com/frontend/tj.gif' type='text/javascript'%3E%3C/script%3E"));
	</script>

	<script>
		(function() {
			var wh = $(window).height(), fh = $('.Footer').outerHeight(true), hh = $(
					'.Header').outerHeight(true)
			$('.Content-box').css({
				'min-height' : wh - fh - hh
			})
		})()
	</script>
</body>
</html>
