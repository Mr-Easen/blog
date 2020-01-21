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
<link href="static/css/base_1.css" rel="stylesheet">
<link href="static/css/header_1.css" rel="stylesheet">
<link href="static/css/other_1.css" rel="stylesheet">
<link href="static/css/list_tab_1.css" rel="stylesheet">
<link href="static/css/right_1.css" rel="stylesheet">
<link href="static/css/blog_my.css" rel="stylesheet">
<script src="static/js/jquery.min_4.js"></script>
<script src="static/js/cookie_1.js"></script>
<script src="static/js/login_1.js"></script>
<script src="static/js/common_1.js"></script>
<script src="static/js/mbox_1.js"></script>
<script src="static/js/follow_1.js"></script>
<script src="static/js/vip_1.js"></script>
<title>博客</title>
</head>
<body>
	<div class="Header">
	  <div class="Page ">
				<!-- <h1 class="Logo">
					<a href="">Logo</a>
				</h1> -->
				<ul class="Navigates fl">
					<li><a href="index/toIndex">首页</a></li>
					<li class="cur"><a href="
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
				          <a href="javascript:void(0);" id="myAllMsg">消息<i class="dot"></i></a>
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
    setTimeout(function(){
            $.ajax({
                url:msg_num_url,
                type:"get",
                dataType:'json',
                success:function(res){
                    if(res.status == '0'){
                       //
                       var hasNewMsg = false;
                       if(res.data.msgNum > 0 && !$('#myMsg i').hasClass('dot')){
                            $('#myMsg i').addClass('dot');
                            hasNewMsg = true;
                       }
                       if(res.data.notifyNum > 0 && !$('#myNotify i').hasClass('dot')){
                           $('#myNotify i').addClass('dot');
                           hasNewMsg = true;
                       }
                       if(res.data.recommend_new > 0 && !$('#myRecommend i').hasClass('dot')){
                           $('#myRecommend i').addClass('dot');
                           hasNewMsg = true;
                       }
                       if(hasNewMsg && !$('#myAllMsg i').hasClass('dot')){
                           $('#myAllMsg i').addClass('dot');
                       }
                    }
                    
                }
            });
    },70);
</script><div class="Content-box">
    <script>
var is_reload = true;
$(".follow-top").click(function() {
    is_reload = false;
})
function FollowBtnSucc(e){//1:未关注,2:已关注,3:互相关注
    if(e==2||e==3){
        $.post('/index/wxbind',{uid:userId},function(res){
            if(getCookie('follow1') || getCookie('follow2'))return false;
            if(res.status==1){
                if(res.data.wxBind == 0){//没绑定
                    box1()
                }else{
                    box2()
                }
            }
        },'json')
    }else{
        if(is_reload) {
            window.location.reload();
        }
    }
    is_reload = true;
}
</script>
<div class="blog-my-bg">
	<!-- header start -->
	<div class="header-bg">
		<div class="header Page">
			<div class="header-top">
                <div class="is-vip-bg-2 fl">
    				<a href="javascript:;" class="a-img">
                        <img class="is-vip-img is-vip-img-1" data-uid="11405449" src="picture/noavatar_middle_1.gif"/>
    				</a>
                </div>
				<div class="right">
					<a href="javascript:;" class="name">${author.userName }</a>
					<ul class="number-list">
						<li><span>${allLikedCount }</span><p>人气</p></li>
						<li><span>${articleList == null ? 0 : articleList.size() }</span><p>文章</p></li>
                                                    <li><span>${followCount }</span><p>关注</p></li>
                            <li><span>${fansCount }</span><p>粉丝</p></li>
                        						<div class="clear"></div>
					</ul>
					<ul class="icon-list">
						                                                																		<div class="clear"></div>
					</ul>
				</div>
				<div class="right-msg">
                    <a class="siMsg" href="chat/toOutBox" target="_blank">私信</a>
				</div>
				<div class="clear"></div>
			</div>

			<div class="header-bottom">
				<ul class="left-list fl">
					<li>原创&nbsp;${originalCount }</li>
					<li>转载&nbsp;${reprintCount }</li>
                    					<div class="clear"></div>
				</ul>
				<!-- <div class="bdsharebuttonbox right-list fr">
				  <p>分享：</p>
				  <a href="javascript:;" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
				  <a href="javascript:;" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
				  <a href="javascript:;" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
				</div> -->
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div class="Page blog-my">

        <!-- left -->
        <div class="Left">
        	<!-- tab -->
        	<ul class="blog-my-tab">
        		<li class="<c:if test='${isMyBlog != null }'>on</c:if>"><a href="user/toMyBlog?userId=${author.id }">文章</a></li>
        		<li class="<c:if test='${isMyFollow != null }'>on</c:if>"><a href="user/toMyFollow?userId=${author.id }">关注</a></li>
        		<li class="<c:if test='${isMyFans != null }'>on</c:if>"><a href="user/toMyFans?userId=${author.id }">粉丝</a></li>
        		<li class="<c:if test='${isMyMark != null }'>on</c:if>"><a href="user/toMyMark?userId=${author.id }">收藏</a></li>
        		<div class="clear"></div>
        	</ul>
			<!-- title -->
                            <ul class="blog-my-title">
                    <li class="on"><a href="
                    	<c:if test='${user == null }'>login/toLogin</c:if>
                    	<c:if test='${user != null }'>index/toIndex</c:if>
                    ">主页</a></li>
                                        <div class="clear"></div>
                </ul>
			<div class="artical-tit">

				<!-- <p class="fl"><a href="http://blog.51cto.com/11415449">全部文章</a></p> -->

                <form class="fr form-search" method='get' action="http://blog.51cto.com/search/user" target="_blank">
                    <input type="hidden" name="uid" value="11405449">
                    <!-- <input class="select-input fr" type="text" name="q" placeholder="请输入搜索关键词" maxlength="38">
                    <div class="pulldown select-down time fl" style="display: none"> 
                    	<p>发布时间</p>
                    	<i class="arrow"></i>
                    	<ul class="pulldown-list" for="time">
                    		<li><a href="javascript:;">三个月内</a></li>
                    		<li><a href="javascript:;">六个月内</a></li>
                    		<li><a href="javascript:;">一年内</a></li>
                    		<li><a href="javascript:;">三年内</a></li>
                    		<li><a href="javascript:;">五年内</a></li>
                    	</ul>
                    </div> -->
                    <!-- <div class="pulldown select-down filtrate fl" style="display: none">
	                    <p>文章状态</p>
	                    <i class="arrow"></i>
	                    <ul class="pulldown-list" for="filtrate_id">
	                    	                    	<li value="全部"><a href="http://blog.51cto.com/11415449?s=">全部</a></li>
	                        
			              				                	<li value="推荐" data-id="3"><a href="http://blog.51cto.com/11415449?s=3">推荐</a></li>
			              				                	<li value="原创" data-id="4"><a href="http://blog.51cto.com/11415449?s=4">原创</a></li>
			              				                	<li value="转载" data-id="5"><a href="http://blog.51cto.com/11415449?s=5">转载</a></li>
			              				                	<li value="翻译" data-id="6"><a href="http://blog.51cto.com/11415449?s=6">翻译</a></li>
			              							</ul>
						<input name="filtrate_id" id="filtrate_id" value="" type="hidden">
	                </div> -->
	               <!--  <div class="pulldown select-down filtrate fl">
	                    						<p>全部</p>
	                    	                    <i class="arrow"></i>
	                    <ul class="pulldown-list" for="filtrate_id">
	                    	                    	<li value="全部"><a href="http://blog.51cto.com/11415449?s=">全部</a></li>
	                        
			              				                <li value="推荐" data-id="3"><a href="http://blog.51cto.com/11415449?s=3">推荐</a></li>
			              				                <li value="原创" data-id="4"><a href="http://blog.51cto.com/11415449?s=4">原创</a></li>
			              				                <li value="转载" data-id="5"><a href="http://blog.51cto.com/11415449?s=5">转载</a></li>
			              				                <li value="翻译" data-id="6"><a href="http://blog.51cto.com/11415449?s=6">翻译</a></li>
			              							</ul>
						<input name="filtrate_id" id="filtrate_id" value="" type="hidden">
	                </div> -->
                </form>
				<div class="clear"></div>
            </div>
            

            <!--文章的显示逻辑-->
                                                <!-- <div class="noList">
                        <img src="picture/nolist.png">
                        <p>暂无文章</p>
                    </div> -->
              <c:if test="${isMyBlog != null }">
	              <ul class="artical-list">
	              	 <c:forEach items="${articleList }" var="item">
	                    <li>
	                        <div class="top ">
	                            <div class="is-vip-bg fl">
	                                <a href="javascript:;" class="a-img" target="_blank">
	                                    <img class="avatar is-vip-img is-vip-img-4" data-uid="11405449" src="picture/noavatar_middle.gif"/>
	                                </a>
	                            </div>
	                            <a href="user/toMyBlog?userId=${item.userId }" class="name fl">${item.authorName }</a>
	                            <a href="javascript:;" class="time fl">发布于：${item.issueAt }</a>
	                            <p class="zan fr " type="1" blog_id="2113206">${item.likesCount }</p>
	                            <div class="clear"></div>
	                        </div>
	                        <a class="tit" href="article/toViewBlog?id=${item.id }">${item.title }</a>
	                        <a href="javascript:;" class="con">${item.content }</a>
	                        <div class="bot">
	                             <p class="tab reprint fl">
	                             	<c:if test="${item.type == 0 }">转载</c:if>
	                             	<c:if test="${item.type == 1 }">原创</c:if>
	                             </p>
	                                <p class="comment fl">评论&nbsp;${item.commentCount }</p>
	                                <p class="collect fl">收藏&nbsp;${item.markCount }</p>
	                                <p class="remove fr" data-id="${item.id }" data-url="article/delArticle">删除</p>
	                                <a class="edit fr" href="article/toPublish?id=${item.id }" target="_blank">编辑</a>
	                                <div class="clear"></div>
	                        </div>
	                    </li>
	                </c:forEach>
	            </ul>    
            </c:if>          
            <!--关注的显示-->
            <c:if test="${isMyFollow != null }">
	            <ul class="search-artical-user follow-index-list">
	            	<c:forEach items="${followUserList }" var="item">
	                  <li>
	                  <div class="is-vip-bg fl">
	                      <a class="left" href="user/toMyBlog?userId=${item.id }" target="_blank">
	                       	<img class="is-vip-img is-vip-img-4" data-uid="13561885" src="picture/noavatar_middle.gif" >
	                      </a>
	                   </div>
	
	                   <div class="center fl">
	                       <a class="span1" href="user/toMyBlog?userId=${item.id }" target="_blank">${item.userName }</a>
	                       <a class="span3"><em>关注&nbsp;${item.followCount }</em><em>粉丝&nbsp;${item.fansCount }</em><em>文章&nbsp;${item.articleCount }</em></a>
	                   </div>
	                  </li>
	                </c:forEach>
	            </ul>
            </c:if>
            <!-- 粉丝的显示 -->
            <c:if test="${isMyFans != null }">
	            <ul class="search-artical-user follow-index-list">
	            	<c:forEach items="${fansUserList }" var="item">
	                  <li>
	                  <div class="is-vip-bg fl">
	                      <a class="left" href="user/toMyBlog?userId=${item.id }" target="_blank">
	                       	<img class="is-vip-img is-vip-img-4" data-uid="13561885" src="picture/noavatar_middle.gif" >
	                      </a>
	                   </div>
	
	                   <div class="center fl">
	                       <a class="span1" href="user/toMyBlog?userId=${item.id }" target="_blank">${item.userName }</a>
	                       <a class="span3"><em>关注&nbsp;${item.followCount }</em><em>粉丝&nbsp;${item.fansCount }</em><em>文章&nbsp;${item.articleCount }</em></a>
	                   </div>
	                  </li>
	                </c:forEach>
	            </ul>
            </c:if>
            <!-- 收藏的显示 -->
            <c:if test="${isMyMark != null }">
	            <ul class="artical-list">
	              	 <c:forEach items="${markList }" var="item">
	                    <li>
	                        <div class="top ">
	                            <div class="is-vip-bg fl">
	                                <a href="javascript:;" class="a-img" target="_blank">
	                                    <img class="avatar is-vip-img is-vip-img-4" data-uid="11405449" src="picture/noavatar_middle.gif"/>
	                                </a>
	                            </div>
	                            <a href="user/toMyBlog?userId=${item.userId }" class="name fl">${item.authorName }</a>
	                            <a href="javascript:;" class="time fl">发布于：${item.issueAt }</a>
	                            <p class="zan fr " type="1" blog_id="2113206">${item.likesCount }</p>
	                            <div class="clear"></div>
	                        </div>
	                        <a class="tit" href="article/toViewBlog?id=${item.id }">${item.title }</a>
	                        <a href="javascript:;" class="con">${item.content }</a>
	                        <div class="bot">
	                             <p class="tab reprint fl">
	                             	<c:if test="${item.type == 0 }">转载</c:if>
	                             	<c:if test="${item.type == 1 }">原创</c:if>
	                             </p>
	                                <p class="comment fl">评论&nbsp;${item.commentCount }</p>
	                                <p class="collect fl">收藏&nbsp;${item.markCount }</p>
	                                <%-- <p class="remove fr" data-id="${item.id }" data-url="article/delArticle">删除</p>
	                                <a class="edit fr" href="article/toPublish?id=${item.id }" target="_blank">编辑</a> --%>
	                                <div class="clear"></div>
	                        </div>
	                    </li>
	                </c:forEach>
	            </ul>
            </c:if>
            <!-- page -->
            		</div>
		<!-- right -->
		<div class="Right">
            			<!-- 发布博文 -->
            			<!-- 博客名称 -->
			<div class="Box articles blogger-name">
				<div class="list">	
					<a class="BoxTil3 fl" href="javascript:;">${author.userName }<span><i></i>用户</span></a>
					<!-- <div class="BoxTil2-box fr">
						<span></span>
						<div>
							<img src="picture/1054f1aa4a56436b95152f0e7123a708.gif">
							<p>分享到朋友圈</p>
						</div>
					</div> -->
					<div class="clear"></div>
					<div class="num-arctic">共<span>${articleList.size() }</span>篇文章</div>
					<div class="bottom">
						<div class="msg-title"><i class="l"></i>喜欢我的文章，请多多关注<i class="r"></i></div>
						<h4 class="title"><a href="javascript:;">用户个人信息</a></h4>
						<ul class="my-list">
                            <li>邮箱：${author.email }</li>
							<li>注册日期：${registerDate }</li>
                        </ul>
                        <div class="my-crouse-box">
                                                    </div>
					</div>	
				</div>
			</div>
			<!-- 七日热门 -->
            				<!-- <h3 class="BoxTil">七日热门</h3>
				<div class="Box articles">
					<div class="list">
					  <ul class="seven-list">
					    					    	<li class="s1"><a href="http://blog.51cto.com/youerning/2083764" target="_blank">用python炒股</a></li>
					    					    	<li class="s2"><a href="http://blog.51cto.com/51edu/2083747" target="_blank">【免费直播】3.12-3.15，6场公开课大“惠”聚—知识干货、专属优惠，一晚搞定（进QQ群听直播）</a></li>
					    					    	<li class="s3"><a href="http://blog.51cto.com/51ctoblog/2083738" target="_blank">51CTO博客2.0造星计划-从粉丝开始</a></li>
					    					    	<li class="s4"><a href="http://blog.51cto.com/zhangfengzhe/2084056" target="_blank">对HashMap的思考及手写实现</a></li>
					    					    	<li class="s5"><a href="http://blog.51cto.com/ylw6006/2084403" target="_blank">Kubernetes集群监控方案</a></li>
					    					  </ul>
					</div>
				</div> -->
            		    <!-- 最近来访 -->
	        		</div>
		<div class="clear"></div>
	</div>	
	<!-- end content -->
</div>
<script>
	var praise_url = 'http://blog.51cto.com/praise/praise'
	setPraise($('.artical-list .top .zan'))
    $('body').css('background','#fff')
	$('.blog-my-title li').click(function(){
		$('.blog-my-title li').removeClass('on')
		$(this).addClass('on')
	})
	setHover($('.filtrate'))
	setHover($('.time'))
	$('.select-down li').click(function(){
		var text = $(this).text()
		$(this).parent().prev().prev().text(text)
	})
	$('.artical-list .remove').click(function(){
    var li = $(this).parents('li'),url = $(this).data('url'),id = $(this).data('id');
    arr = [];
    arr.push(id);
    console.info(arr);
		new AutoBox({
			content:'确定删除？',
			mask:"#000",
			Yes:'确定',
			No:'取消',
			yc:function(){
		        $.ajax({
		           	url:url,
		           	type:"post",
		           	traditional: true, 
		           	data:{"ids":arr},
		           	dataType:'json',
		           	success:function(data){
			            if(data.info == 'success'){
			              	location.reload();
			            }
			            else
			            {
			            	new AutoBox({content:'删除失败~',mask:"#000",autoClose:3});
			            }
		           	}
		        });
			}
		})
	})
	window._bd_share_config={
		"common":{
			"bdText":"11405449",
			"bdDesc":"快来看看我分享给你的技术好文吧",
			"bdMini":"2",
			"bdMiniList":false,
			"bdPic":"https://s1.51cto.com/images/201710/25/bd540a4f14d822f6e69087758699358b.jpg",
			"bdStyle":"0",
			"bdSize":"16",
		},
		"share":{}
	};
	with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
</script>
</div>
<div class="Footer">
    <p class="copy tc">Copyright &copy; 2005-2018 <a href="javascript:;" target="_blank"></a> 版权所有 京ICP证060544号</p>
  </div>
<div class="rightTools">
      <a href="article/toPublish" class="aa">写文章</a>
    <!-- <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=3591348659&amp;site=qq&amp;menu=yes" class="qq"></a>
  <a href="http://blog.51cto.com/51ctoblog/2057444" class="yy" target="_blank"></a> -->
  <a href="javascript:void(0);" class="gotop"></a>
</div>
<div style="display:none">
<iframe frameborder="0" scrolling="no" width="0" height="0" src="//log.51cto.com/pageview.php?frompos=blog_art"></iframe>
</div>
<script src="static/js/pvlog_1.js"></script>
<script src="static/js/count_4.js"></script>
<script>
  $(".gotop").click(function(){$(window).scrollTop(0)})
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
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
      var _vds = _vds || [];
      window._vds = _vds;
      (function(){
        _vds.push(['setAccountId', '8c51975c40edfb67']);
        (function() {
          var vds = document.createElement('script');
          vds.type='text/javascript';
          vds.async = true;
          vds.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'assets.growingio.com/vds.js';
          var s = document.getElementsByTagName('script')[0];
          s.parentNode.insertBefore(vds, s);
        })();
      })();
      document.write(decodeURI("%3Cscript src='https://tongji.51cto.com/frontend/tj.gif' type='text/javascript'%3E%3C/script%3E"));
    </script>
    
<script>
    (function(){
        var wh=$(window).height(),fh=$('.Footer').outerHeight(true),hh=$('.Header').outerHeight(true)
        $('.Content-box').css({'min-height': wh-fh-hh})
    })()
</script>
</body>
</html>