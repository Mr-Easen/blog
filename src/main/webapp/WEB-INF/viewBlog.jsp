<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>${article.title }</title>
<link href="static/css/header.css" rel="stylesheet">
<link href="static/css/other.css" rel="stylesheet">
<link href="static/css/right.css" rel="stylesheet">
<link href="static/css/blog_details.css" rel="stylesheet">
<link href="static/css/highlight.css" rel="stylesheet">
<script src="static/js/jquery.min.js"></script>
<script src="static/js/cookie.js"></script>
<script src="static/js/login.js"></script>
<!-- <script src="js/common.js"></script> -->
<script src="static/js/mbox.js"></script>
<script src="static/js/mbox_1.js"></script>
<script src="static/js/follow.js"></script>
<script src="static/js/vip.js"></script>
<script src="static/js/viewBlog.js"></script>
</head>
</head>
<body>
	<div class="Header">
		<div class="Page ">
			<!-- <h1 class="Logo">
				<a href="http://blog.51cto.com/">Logo</a>
			</h1> -->
			<ul class="Navigates fl">
				<li><a href="index/toIndex">首页</a></li>
					<li><a href="
						<c:if test='${user == null }'>login/toLogin</c:if>
						<c:if test='${user != null }'>user/toMyBlog</c:if>
					">我的博客</a></li>
			</ul>
			<ul class="Navigates Navigates-right fr">
				<c:if test="${user == null }">
					<li><a href="login/toRegister" target="_self">注册</a></li>
					<li class="login"><a href="login/toLogin"
						target="_self">登录</a></li>
				</c:if>
				<c:if test="${user != null }">
					<li class="more"><a href="javascript:void(0);" id="myAllMsg">消息<i
							class=""></i></a>
						<div>
							 <a
								href="chat/toOutBox" id="myMsg"
								target="_blank">私信<i class=""></i></a> 
								 <i class="arrow"></i>
						</div></li>
					<li class="more user"><a class="is-vip-bg-1"
						href="javascript:;" target="_blank"> <img
							class="is-vip-img is-vip-img-5" data-uid="11405449"
							src="images/noavatar_middle.gif" />
					</a>
						<div>
							<a href="user/toMyBlog?userId=${user.id }">我的博客</a>
				            <a href="user/toMyFollow?userId=${user.id }">我的关注</a>
				            <a href="user/toEditUser">修改密码</a>
				            <a href="index/logout">退出</a>
				            <i class="arrow"></i>
						</div></li>
				</c:if>
				<!-- <li class="search"><a href="http://blog.51cto.com/search/index"
					target="_self">搜索</a></li> -->
				<li class="write"><a
					href='<c:choose> 
							 	<c:when test="${user == null }">login/toLogin</c:when>
							 	<c:otherwise>article/toPublish</c:otherwise>
							 </c:choose>'>写文章</a>
				</li>
			</ul>
			<div class="clear"></div>
		</div>
	</div>
	<script>
		var isLogin = '${user == null ? 0 : 1}';
		var userId = '';
		var imgpath = '';
		var BLOG_URL = 'http://blog.51cto.com/';
		var msg_num_url = '/index/ajax-msg-num';
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
	<form action="" id="likeForm">
		<input type="hidden" id="articleId" name="articleId" value="${article.id }">	
		<input type="hidden" id="userId" name="userId" value="${user.id }">
		<input type="hidden" id="followUserId" name="followUserId" value="${author.id }">
	</form>
	<div class="Content-box">
		<link rel="stylesheet" href="static/css/mdeshow.css">
		<div class="Content Index" style="padding-bottom: 50px;">
			<div class="Page">
				<!-- left start -->
				<div class="Left fl">
					<div class="artical-Left">
						<div class="crumbs">
							<span><a href="javascript:;">${author.userName}</a></span>
							<em>&gt;</em> <span>正文</span>
							<div class="clear"></div>
						</div>
						<h1 class="artical-title">${article.title }
							<!-- <span><i></i>推荐</span> -->
						</h1>
						<div class="artical-title-list">
							<a href="javascript:;" class="tab original fl">
								<c:if test="${article.type == '1' }">原创</c:if>
								<c:if test="${article.type == '0' }">转载</c:if>
							</a> 
							<a href="javascript:;" class="name fl">${author.userName}</a>
							<span class="fl"></span> <a href="javascript:;" class="time fl">${issueTime }</a>
							<span class="fl"></span> <a href="#comment" id="commentCount" class="comment fl">评论(0)</a>
							<a href="javascript:;" class="read fr">${readCount }人阅读</a>
							<div class="clear"></div>
						</div>
						<div class="artical-content-bak main-content">
							<div class="con artical-content editor-preview-side">
								${article.content }</div>
						</div>
						<div class="artical-copyright">版权声明：原创作品，如需转载，请注明出处。否则将追究法律责任</div>
						<!-- <div class="for-tag">
							<span><a href="#" target="_blank">职场</a></span> <span><a
								href="#" target="_blank">程序生涯</a></span> <span><a href="#"
								target="_blank">程序员</a></span>
							<div class="clear"></div>
						</div> -->
						<div class="more-list">
							<input type="hidden" id="likesId" value="${likesId }">
							<p class="praise fl <c:if test='${likesId != null && likesId != "" }'>on</c:if>">
								<span id="like" type="1" blog_id="2073061" userid='8715198'>${likesCount }</span>
							</p>
							<!-- <div class="share-box fr">
								<p class="share">分享</p>
								<div class="bdsharebuttonbox">
									<span></span> <a href="javascript:;" class="bds_sqq"
										data-cmd="sqq" title="分享到QQ好友">QQ分享</a> <a href="javascript:;"
										class="bds_tsina" data-cmd="tsina" title="分享到新浪微博">微博分享</a> <a
										href="javascript:;" class="bds_weixin" data-cmd="weixin"
										title="分享到微信">微信扫一扫</a> <img
										src="picture/8454f194b9dd488d89e08a01c72cb9ba.gif">
								</div>
							</div> -->
							<p class="favorites fr <c:if test="${isBookMarked != null }">on</c:if>">收藏</p>
							<input type="hidden" id="isBookMarked" value="${isBookMarked }">
							<c:if test="${user.id == author.id }">
								<p class="fr ead">
									<a href="article/toPublish?id=${article.id }" target="_blank">编辑</a> ｜ <a href="javascript:void(0);" id="${article.id }" class="delArticle">删除</a>
								</p>
							</c:if>
							<div class="clear"></div>
						</div>
						<div class="artical-list">
							<c:if test="${lastArticle != null }">
								<a class="fl" href="article/toViewBlog?id=${lastArticle.id }"
									title="${lastArticle.title }">上一篇：${lastArticle.title }</a> 
							</c:if>
							<c:if test="${nextArticle != null }">
								<a class="fr"
								href="article/toViewBlog?id=${nextArticle.id }"
								title="${nextArticle.title }">下一篇：${nextArticle.title }</a>
							</c:if>
							<div class="clear"></div>
						</div>
					</div>
					<!-- <h2 class="artical-other-title">猜你喜欢</h2>
					<div class="artical-Left artical-border">
						<ul class="you-like-list">
							<li><a href="http://blog.51cto.com/ityouknow/2084168"
								target="_blank">百亿互金平台救火故事</a></li>
							<div class="clear"></div>
						</ul>
					</div> -->
					<h2 class="artical-other-title" id="comment">发表评论</h2>
					<div class="artical-Left artical-border">
						<!-- 发布评论 -->
						<div class="comment-creat">
							<div class="is-vip-bg fl">
								<a href="javascript:;" class="header-img"> <img
									src="picture/noavatar_middle.gif" />
								</a>
							</div>
							<div class="first-publish fr publish_user_id">
								<textarea class="textareadiv textareadiv-publish" name="content" id=""
									placeholder="用心的评论会被更多人看到和认可" maxlength="500"></textarea>
								<div class="comment-push">
									<p class="msg fl">Ctrl+Enter&nbsp;发布</p>
									<p class="publish-btn blue-btn fr" flag="1">发布</p>
									<p class="cancel-btn cancel-btn-1 fr">取消</p>
									<div class="clear"></div>
								</div>
								<input type="hidden" class="user_id" value="${user.id }"> <input
									type="hidden" class="reply_id" value=""> <input
									type="hidden" class="first_pid" value="">
							</div>
							<div class="clear"></div>
						</div>
						<div class="comment-number" id="comment_pl">
							<p class="number fl">
								<span class="comment_number"></span>条评论
							</p>
							<a class="time-last time fr comment-sort" id="sort-desc"
								flag="desc" page="1" href="javascript:;">按时间倒序</a> <a
								class="time-first time fr comment-sort on" id="sort-asc"
								flag="asc" page="1" href="javascript:;">按时间正序</a>
							<div class="clear"></div>
						</div>
						<div class="commentList">
							<!-- <div class="commentList-box">
								<div class="comment-1 publish_user_id reply_id_box comment_number-list">
									<div class="top">
										<div class="is-vip-bg-6 f1">
											<a href="#" class="header-img">
												<img class="is-vip-img-bg is-vip-img-4" src="images/noavatar_middle.gif">
											</a>
										</div>
										<div class="f1">
											<p class="name"><a htrf="#">sery</a></p>
											<p class="time">1楼  2018-04-27 16:36:21</p>
										</div>
										<div class="clear"></div>
									</div>
									<div class="con">
										被注入了，也找到木马，但这治标不治本呢，要找到问题在哪里（是哪些文件有漏洞）这个非常费事，毕竟写程序不是系统管理员的强项，很多时候，程序员还不肯配合，还把责任打过来让你背郭。
									</div>
								</div>
							</div> -->
						</div>
						<!-- page -->
						<div class="act_pageList_box"></div>
					</div>

				</div>
				<!-- end left -->
				<!-- right start -->
				<div class="Right artical-Right fr">
					<!-- 博客名称 -->
					<div class="Box articles blogger-name">
						<div class="list">
							<h4 class="BoxTil2 fl">
								<a class="BoxTil2-right-tit"
									href="user/toMyBlog?userId=${author.id }">${author.userName }</a>
							</h4>
							<div class="BoxTil2-box fr">
								<!-- <span></span>
								<div>
									<img src="picture/fa32d5545ef1408390d048794c8c3abe.gif">
									<p>分享到朋友圈</p>
								</div> -->
							</div>
							<div class="clear"></div>
							<ul class="number-list">
								<li><a class="num" href="javascript:;">${articleList.size()+1 }</a>
									<p>文章</p></li>
								<li><a class="num" href="javascript:;">${followCount }</a>
									<p>关注</p></li>
								<li><a class="num" href="javascript:;">${allLikedCount }</a>
									<p>人气</p></li>
								<li><a class="num"
									href="http://blog.51cto.com/ityouknow?type=3">${fansCount }</a>
									<p>粉丝</p></li>

								<div class="clear"></div>
							</ul>
						</div>
					</div>
					<!-- 博主信息 -->
					<div class="Box articles">
						<div class="list blogger">
							<div class="top">
								<div class="is-vip-bg-4">
									<a class="left" href="javascript:;"> <img
										class="is-vip-img is-vip-img-4" data-uid="8715198"
										src="picture/noavatar_middle.gif" />

									</a>
								</div>
								<div class="right">
									<div class="name-box">
										<a href="javascript:;" class="tit fl">${author.userName}</a>
										<div class="clear"></div>
									</div>
									<div class="name-btn">
										<c:if test="${user.id != author.id }">
											<c:if test="${isFollowed != null }">
												<a id="checkFollow"
													class="follow-1 checkFollow-btn in" href="javascript:;">已关注</a>
											</c:if>
											<c:if test="${isFollowed == null }">
												<a id="checkFollow"
													class="follow-1 checkFollow-btn on" href="javascript:;">关注</a>
											</c:if>
											<a href="chat/toOutBox" class="name-msg gray-btn">私信</a>
										</c:if>
									</div>
								</div>
								<div class="clear"></div>
							</div>
							<div class="bottom">
								<div class="msg-title">
									<i class="l"></i>好的文章，和好友一起分享<i class="r"></i>
								</div>
								<h4 class="title">
									<a href="javascript:;">TA的其他文章</a>
								</h4>
								<ul class="seven-list">
									<c:forEach items="${articleList }" var="other" begin="0"  end="5">
										<li class="s2"><a
										href="article/toViewBlog?id=${other.id }">${other.title }</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<!-- 七日热门 -->
					<!-- <h3 class="BoxTil">七日热门</h3>
					<div class="Box articles">
						<div class="list">
							<ul class="seven-list">
								<li class="s1"><a
									href="http://blog.51cto.com/youerning/2083764" target="_blank">用python炒股</a></li>
								<li class="s2"><a
									href="http://blog.51cto.com/51edu/2083747" target="_blank">【免费直播】3.12-3.15，6场公开课大“惠”聚—知识干货、专属优惠，一晚搞定（进QQ群听直播）</a></li>
								<li class="s3"><a
									href="http://blog.51cto.com/51ctoblog/2083738" target="_blank">51CTO博客2.0造星计划-从粉丝开始</a></li>
								<li class="s4"><a
									href="http://blog.51cto.com/zhangfengzhe/2084056"
									target="_blank">对HashMap的思考及手写实现</a></li>
								<li class="s5"><a
									href="http://blog.51cto.com/ylw6006/2084403" target="_blank">Kubernetes集群监控方案</a></li>

							</ul>
						</div>
					</div> -->
					<div class="update-top"></div>
				</div>
				<!-- end right  -->
				<div class="clear"></div>
			</div>
		</div>

		<!-- 老博文美观处理 -->
		<script>
			var praise_url = 'http://blog.51cto.com/praise/praise'
			var addReply_url = 'comment/addComment'
			var removeUrl = 'comment/delComment'
			var blog_id = '${article.id}'
			var rid = '0'
			var is_comment = '0'
			var comment_list = 'comment/getCommentList'
			var comment_sort = "asc"
			var index_url = 'http://blog.51cto.com/ityouknow';
			var uc_url = 'http://ucenter.51cto.com/'
			var blog_url = 'http://blog.51cto.com/'
			var img_url = 'images/noavatar_middle.gif'
			var i_user_id = '${user.id}';
			var c_user_id = '${author.id}';
			var collect_url = 'http://blog.51cto.com/collect/add'
			var is_old = '0'
			var nicknameurl = 'http://blog.51cto.com/ityouknow'
			var nickname = '${author.userName}'
			var myself = window.location.href
			$('.you-like-list li:odd').css({
				'margin-left' : '10%'
			});
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
			FollowBtn = new Follow($('#checkFollow_8715198'), '8715198', '1', [
					'on', 'in', 'mutual', 'off' ])
			FollowBtn.success = FollowBtnSucc
			window._bd_share_config = {
				"common" : {
					"bdText" : "六年程序生涯",
					"bdDesc" : $("#abstract_bdshare").text(),
					"bdMini" : "2",
					"bdMiniList" : false,
					"bdPic" : "https://s1.51cto.com/images/201710/25/bd540a4f14d822f6e69087758699358b.jpg",
					"bdStyle" : "0",
					"bdSize" : "16"
				},
				"share" : {}
			};
			with (document)
				0[(getElementsByTagName('head')[0] || body)
						.appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='
						+ ~(-new Date() / 36e5)];
		</script>
	</div>
	<script src="static/js/marked.min.js"></script>
	<script src="static/js/highlight.js"></script>
	<script src="static/js/detail_mp.js"></script>
	<script src="static/js/detail.js"></script>
	<script src="static/js/copy.js"></script>
	<div class="Footer">
		<p class="copy tc">
			Copyright &copy; 2005-2018 <a href="javascript:;"
				target="_blank"></a> 版权所有 京ICP证060544号
		</p>
	</div>
	<div class="rightTools">
		<a href='<c:choose> 
					<c:when test="${user == null }">login/toLogin</c:when>
					<c:otherwise>article/toPublish</c:otherwise>
				 </c:choose>' class='aa'>写文章</a>
		  <a href="javascript:void(0);"
			class="gotop"></a>
	</div>
	<div style="display: none">
		<iframe frameborder="0" scrolling="no" width="0" height="0"
			src="//log.51cto.com/pageview.php?frompos=blog_art"></iframe>
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