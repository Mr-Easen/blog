package com.easen.blog.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easen.blog.util.UrlConstants;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.easen.blog.polo.Article;
import com.easen.blog.polo.BookMark;
import com.easen.blog.polo.Category;
import com.easen.blog.polo.Follow;
import com.easen.blog.polo.Likes;
import com.easen.blog.polo.ReadRecord;
import com.easen.blog.polo.User;
import com.easen.blog.service.ArticleService;
import com.easen.blog.service.BookMarkService;
import com.easen.blog.service.CategoryService;
import com.easen.blog.service.FollowService;
import com.easen.blog.service.LikesService;
import com.easen.blog.service.ReadRecordService;
import com.easen.blog.service.UserService;
import com.easen.blog.util.IPUtil;

@Controller
@RequestMapping("article")
public class ArticleController
{
	private Logger logger =  Logger.getLogger(getClass());
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private LikesService likesService;
	
	@Autowired
	private ReadRecordService readRecordService;
	
	@Autowired
	private FollowService followService;
	
	@Autowired
	private BookMarkService bookMarkService;
	
	@RequestMapping("/toPublish")
	public String toPublish(String id,HttpServletRequest request)
	{
		if(request.getSession().getAttribute("user") == null)
		{
			return UrlConstants.LOGIN;
		}
		List<Category> categoryList = categoryService.findFirstCategorys();
		if(null != id && !"".equals(id))
		{
			Article article = articleService.findArticleById(id);
			request.setAttribute("article", article);
		}
		request.setAttribute("categoryList", categoryList);
		return UrlConstants.PUBLISH;
	}
	
	@RequestMapping("/publish")
	public void publish(Article article,HttpServletRequest request,HttpServletResponse response)
	{
		Date issueTime = new Date(System.currentTimeMillis());
		article.setIssueTime(issueTime);
		String id = article.getId();
		if(null != id && !"".equals(id))
		{
			articleService.editArticle(article);
		}
		else
		{
			articleService.addArticle(article);
		}
		try
		{
			response.sendRedirect("toViewBlog?id="+article.getId());
		} catch (IOException e)
		{
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/toViewBlog")
	public String toViewBlog(String id,HttpServletRequest request)
	{
		Article article = articleService.findArticleById(id);
		Date issueTime = article.getIssueTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = sdf.format(issueTime);
		User author = userService.findUserById(article.getUserId());
		String readRecordId = null;
		/**
		 * 点赞逻辑处理
		 */
		Integer likesCount = likesService.findCountByArticleId(id);
		int allLikedCount = likesService.findLikedCountByUserId(author.getId());
		User loginUser = (User) request.getSession().getAttribute("user");
		ReadRecord readRecord = new ReadRecord();
		readRecord.setArticleId(id);
		Follow follow = new Follow();
		follow.setFollowUserId(author.getId());
		if(loginUser != null)
		{
			Likes likes = new Likes();
			likes.setArticleId(id);
			likes.setUserId(loginUser.getId());
			likes.setStatus(1);
			String likesId = likesService.findIdByUserIdAndArticleId(likes);
			request.setAttribute("likesId", likesId);
			
			follow.setUserId(loginUser.getId());
			if(followService.isFollowed(follow) != null)
			{
				request.setAttribute("isFollowed", "true");
			}
			
			
			/**
			 * 收藏记录处理
			 */
			BookMark bookMark = new BookMark();
			bookMark.setArticleId(id);
			bookMark.setUserId(loginUser.getId());
			String isBookMarked = bookMarkService.isBookMarked(bookMark);
			request.setAttribute("isBookMarked", isBookMarked);
			
			/**
			 * 阅读记录处理
			 */
			readRecord.setUserId(loginUser.getId());
			readRecordId = readRecordService.findIdByUserIdOrIp(readRecord);
		}
		else
		{
			String ip = IPUtil.getIpAddr(request);
			readRecord.setIp(ip);
			logger.info(ip);
			readRecordId = readRecordService.findIdByUserIdOrIp(readRecord);
		}
		if(readRecordId == null)
		{
			readRecordService.addReadRecord(readRecord);
		}
		Integer readCount = readRecordService.findCount(id);
		
		/**
		 * 粉丝、关注数处理
		 */
		Integer fansCount = followService.findFansCount(author.getId());
		Integer followCount = followService.findFollowCount(author.getId());
		/**
		 * 文章列表获取
		 */
		List<Article> articleList = articleService.findArticlesByUserId(author.getId());
		for(int i = 0; i < articleList.size(); i ++)
		{
			if(articleList.get(i).getId().equals(article.getId()))
			{
				if(i > 0)
				{
					request.setAttribute("lastArticle", articleList.get(i - 1));
				}
				if(i < (articleList.size() - 1))
				{
					request.setAttribute("nextArticle", articleList.get(i + 1));
				}
				articleList.remove(i);
				break;
			}
		}
		
		/**
		 * 返回数据
		 */
		request.setAttribute("allLikedCount", allLikedCount);
		request.setAttribute("fansCount", fansCount);
		request.setAttribute("followCount", followCount);
		request.setAttribute("articleList", articleList);
		request.setAttribute("readCount", readCount);
		request.setAttribute("likesCount", likesCount);
		request.setAttribute("author", author);
		request.setAttribute("issueTime", date);
		request.setAttribute("article", article);
		return UrlConstants.VIEWBLOG;
	}
	
	@RequestMapping("/toCheckArticle")
	public String toCheckArticle(HttpServletRequest request, String keyWord, Integer pageNumber)
	{
		ModelAndView mv = null;
		if(request.getSession().getAttribute("admin") == null)
		{
			return UrlConstants.ADMINLOGIN;
		}
		List<Article> articleList = articleService.findAllArticles(keyWord, pageNumber, null);
		List<Article> allArticle = articleService.findAllArticles(keyWord, pageNumber, "Y");
		int count = articleList == null ? 0 : allArticle.size();
		int pageCount = 0;
		if(0 != count)
		{
			pageCount = count % 10 == 0 ? (count / 10) : (count / 10 + 1);
		}
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageNumber", pageNumber == null ? 1 : pageNumber);
		request.setAttribute("articleList", articleList);
		request.setAttribute("keyWord", keyWord);
		return UrlConstants.CHECKARTICLE;
	}
	
	@RequestMapping("/delArticle")
	@ResponseBody
	public String delArticle(String[] ids)
	{
		JSONObject json = new JSONObject();
		try
		{
			json.put("info", "success");
			articleService.batchDelArticle(ids);
		} catch (Exception e)
		{
			json.put("info", e.getMessage());
			e.printStackTrace();
		}
		return json.toString();
	}
}
