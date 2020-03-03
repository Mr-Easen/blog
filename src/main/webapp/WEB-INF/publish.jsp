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
<title>写文章</title>
<link href="static/css/publish/header.css" rel="stylesheet">
<link href="static/css/publish/other.css" rel="stylesheet">
<link href="static/css/publish/blog_publish.css" rel="stylesheet">
<script src="static/js/jquery.min.js"></script>
<script src="static/js/publish/blog_publish.js"></script>
<script src="static/js/common.js"></script>
<script src="static/ueditor/ueditor.config.js"></script>
<script src="static/ueditor/ueditor.all.js"></script>
<script src="static/ueditor/ueditor.parse.js"></script>
<!-- <script src="js/ueditor.config.js"></script>
<script src="js/ueditor.all.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/blog_publish.js"></script>
<script src="js/blog_form.js"></script>
<script src="js/cookie.js"></script>
<script src="js/login.js"></script>
<script src="js/mbox.js"></script>
<script src="js/follow.js"></script>
<script src="js/vip.js"></script> -->
</head>
<body>
	
<div class="Header">
  <div class="Page Max">
    <!-- <h1 class="Logo"><a href="user/toIndex">Logo</a></h1> -->
    <ul class="Navigates fl">
      <li ><a href="index/toIndex">首页</a></li>
            <!-- <li ><a href="">草稿箱</a></li> -->
            <li ><a href="user/toMyBlog">我的博客</a></li>
    </ul>
    <ul class="Navigates Navigates-right fr">
      <!-- <li class="more maps">
        <a href="javascript:void(0);">网站导航</a>
        <div>
            <a href="http://edu.51cto.com" target="_blank">学院</a>
            <a href="http://blog.51cto.com" target="_blank">博客</a>
            <a href="http://down.51cto.com" target="_blank">下载</a>
            <a href="http://home.51cto.com" target="_blank">家园</a>
            <a href="http://bbs.51cto.com" target="_blank">论坛</a>
            <a href="http://x.51cto.com" target="_blank">CTO训练营</a>
            <a href=" http://club.51cto.com?blog" target="_blank">CTO俱乐部</a>
            <a href="http://wot.51cto.com" target="_blank">WOT</a>
            <a href="http://www.51cto.com" target="_blank">51CTO</a>
            <i class="arrow"></i>
        </div>
      </li> -->
              <li class="more">
          <a href="javascript:void(0);" id="myAllMsg">消息<i class=""></i></a>
          <div>
            <a href="chat/toOutBox" id="myMsg" target="_blank">私信<i class=""></i></a>
            <i class="arrow"></i>
          </div>
        </li>
        <li class="more user">
          <a class="is-vip-bg-1" href="javascript:;" target="_blank">
            <img class="is-vip-img is-vip-img-5" data-uid="11405449" src="static/picture/noavatar_middle.gif"/>
          </a>
          <div>
            <a href="user/toMyBlog?userId=${user.id }">我的博客</a>
            <a href="user/toMyFollow?userId=${user.id }">我的关注</a>
            <a href="index/logout">退出</a>
            <i class="arrow"></i>
          </div>
        </li>
                    </ul>
          <div class="clear"></div>
  </div>
</div>
<div class="Content-box">
    
<style>
    #edui1 {width: 99.8% !important}
    .edui-default .edui-editor-iframeholder {width: 99.8% !important;}
</style>
<div class="Page Max noFooter">
    <form action="article/publish" method="post" id="articleForm">
        <div class="blog-title-bg" style="position: relative;z-index: 19;">
            <div class="blog-title">
                <div class="pulldown pulldown-title fl">
                                            <p class="reprint">请选择</p>
                                        <ul class="pulldown-list" for="blog_type" id="article_type">
                                        			<li value="9">请选择</li>
                                                    <li value="1">原创</li>
                                                    <li value="0">转载</li>
                                                    <!-- <li value="3">翻译</li> -->
                                        </ul>
                    <input type="hidden" name="type" value="" id="type"></input>
                    <input type="hidden" name="id" value="${article.id }">
                </div>
                <div class="titleCon"><input class="fl" type="text" name="title" id="title" value="${article.title }" autocomplete="off" placeholder="标题，支持50个字" maxlength="50"></div>
                <div class="clear"></div>
            </div>
            <p class="publish-msg">标题</p>
        </div>
        <div class="blog-type-bg">
            <p class="publish-msg">标题</p>
        </div>
        <!-- <div class="reprint-list">
            <input type="radio" name="copy_code" value="1" id="source"  checked="checked"  checked="checked" ><label for="source">转载请注明出处</label>
            <input type="radio" name="copy_code" value="2" id="authorization" ><label for="authorization">转载需作者授权</label>
            <input type="radio" name="copy_code" value="3" id="noallow"  ><label for="noallow">谢绝转载</label>
        </div>  --> 
        <div class="blogEditor-box-bg" style="position: relative;z-index: 0;">
            <div class="blogEditor-box" id="blogEditor-box">
                <!-- <script id="content" type="text/plain"></script>
                <textarea id="blogContent" style="display: none;"></textarea>
                <textarea name="content" id="submitContent" style="display: none;"></textarea>
                                    <a class="switchEditor-Writer-edit" href="http://blog.51cto.com/12319914/2070254" target="_blank">支持Open Live Writer 离线发文章</a>
                    <a class="switchEditor md">切换到Markdown编辑器</a> -->
		        <!-- 加载编辑器的容器 -->
			    <script id="container" name="content" type="text/plain">
					${article.content}
   				</script>
   				<!-- <textarea id="content" style="display: none;" name="content"></textarea> -->
   				<input type="hidden" name="userId" value="${user.id }">
		   		<!-- 实例化编辑器 -->
		    	<script type="text/javascript">
		    		var options = {initialFrameWidth:100,
		    		        initialFrameHeight:400}
		        	var ue = UE.getEditor('container',options);
		    	</script>
            </div>
            <p class="publish-msg">内容</p>
        </div>
        <div class="select-box" style="position: relative;z-index: 2;">
            <div class="pulldown system-select system-one fl">
                <p>请选择一级分类</p>
                <ul class="pulldown-list" id="system-one-list" for="pid">
                	<li id="0">请选择一级分类</li>
                	<c:forEach items="${categoryList }" var="category">
                		<li id="${category.id }">${category.name }</li>
                	</c:forEach>
                </ul>
                <input name="parentId" id="parentId" value="" type="hidden">
            </div>
            <div class="pulldown  system-select system-two fl">
                <p>请选择二级分类</p>
                <ul class="pulldown-list" id="system-two-list" for="cate_id">
                </ul>
                <input name="cate_id" id="cate_id" value="" type="hidden">
            </div>
            <!-- <div class="pulldown system-select myself fl">
                                    <p style="color:#999;background: #EEE;margin-right: 0;">个人分类（无，请在设置-博客分类中添加）</p>
                                <ul class="pulldown-list" for="custom_id">
                                    </ul>
                <input name="custom_id" id="custom_id" value="" type="hidden">
            </div> -->
            <div class="clear"></div>
            <p class="publish-msg">分类</p>
        </div>
        <!-- <div class="select-tab-bg">
            <div class="select-tab">
                <div class="show-select-tab fl">
                                    </div>
                <input type="text" id="for-tag" placeholder="标签最多设置5个，用，或；间隔" maxlength="20">
                <input name="tag" id="tag" type="hidden" value="">
                <div class="clear"></div>
            </div>
            <p class="publish-msg">标签</p>
        </div> -->
        <!-- <div class="textarea-box">
            <textarea name="abstract" id="abstract" cols="150" rows="1" maxlength="500" placeholder="文章摘要，最多支持500个字，不填摘要默认提取正文前200个字展示"></textarea>
        </div> -->
        <!-- <div class="advanced-options">
            <p>高级选项</p>
            <div class="advanced-options-box">
                <input type="checkbox" name="is_comment" value="2" ><label for="">禁止评论</label>
                <input type="checkbox" name="top_time" value="1" ><label for="">置顶</label>
            </div>
        </div> -->
        <div class="SubmitBtns" style="position: relative;z-index: 1;">
            <div class="Page Max">
                <div class="public-box">
                    <div class="public-radio fl" style="display: none;">
                         <input type="radio" name="isHidden" id="isHide_0" value="1" checked="checked" ><label for="isHide_0">公开</label>
                         <input type="radio" name="isHidden" id="isHide_1" value="0"  ><label for="isHide_1">隐藏</label>
                    </div>
                    <div class="btns fr">
                        <input class="btn-1 fr" type="button" id="publish" value="发布文章">
                        <input type="hidden" name="did" id="did" value="">
                                                   <!--  <p class="btn-2 fr" id="save">保存草稿</p> -->
                                                <p class="btn-3 fr"></p>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <input type="hidden" id="blog_id" name="blog_id" value="">
        <input type="hidden" name="is_old" value="1" />
        <input type="hidden" name="categoryId" id="categoryId" value="">
    </form>
</div>
<script>
    /* var picUrl = 'http://i2.51cto.com/';
    var BLOG_URL = 'http://blog.51cto.com/';
    var sign = 'BmCay7vag7CdjmNadmVS2mCMZ5QHjmCxkmNwJ7CB07Co3';
    var uploadUrl = 'http://upload.51cto.com/index.php?c=upload&m=upimg&orig=b';
    var imgeParam = '?x-oss-process=image/watermark,size_16,text_QDUxQ1RP5Y2a5a6i,color_FFFFFF,t_100,g_se,x_10,y_10,shadow_90,type_ZmFuZ3poZW5naGVpdGk=';
    var selectUrl = 'http://blog.51cto.com/category/get-child';
    var tag_num = '0';
    var check_form = true;
    var publish_url = 'http://blog.51cto.com/blogger/publish';
    var draft_url = 'http://blog.51cto.com/blogger/draft';
    var timer = false;
    var blog_id = '' || '';
    var blog_id_t = '';
    var type = 'publish';
    var is_old = '1'
    var is_hide = '';
    var editorVal = '';
    if(blog_id) {
        is_hide = '';
        if(is_hide == 0){//公开隐藏
            inputRadio(0)
        }else if(is_hide == 1){
            inputRadio(1)
        }
        if(tag_num >= 5) {
            $("#for-tag").hide();
        }
    } */
    /* $('.switchEditor').css({'course':'pointer'}).click(function(){
        new AutoBox({content:'亲，切换编辑器会使您已编辑的内容丢失噢，建议您先保存草稿再切换。',Yes:'确定',No:'取消',W:'500',mask:"#000",yc:function(){
            window.location.href = 'publish'
        }})
    }) */
    /* function inputRadio(m){//公开隐藏
        $('.public-radio input').removeAttr('checked')
        $('.public-radio input').eq(m).attr('checked','checked')
    } */
    function removeHTMLTag(str) {//过滤掉HTML标签以及空行
        str = str.replace(/<\/?[^>]*>/g,''); //去除HTML tag
        str = str.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
        str = str.replace(/\n(\n)*( )*(\n)*\n/g,'\n'); //去除多余空行
        str = str.replace(/\s/g,""); //去除空格
        str = str.replace(/[\r\n]/g, '');
        str = str.replace(/ /ig,'');//去掉 
        return str;
    }
    /* function setAb() {//过滤摘要
        if($("#abstract").val() == "") {
            var content_html = $('#blogContent').val();

            content_html = removeHTMLTag(content_html);
            content_html = content_html.substring(0, 200);
            $("#abstract").val(content_html);
        }
    } */
</script>
</div>
<!-- <script>
    (function(){
        var wh=$(window).height(),fh=$('.Footer').outerHeight(true),hh=$('.Header').outerHeight(true)
        $('.Content-box').css({'min-height': wh-fh-hh})
    })()
</script> -->
</body>
</body>
</html>