package com.easen.blog.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.easen.blog.util.UrlConstants;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.easen.blog.polo.Article;
import com.easen.blog.polo.Follow;
import com.easen.blog.polo.User;
import com.easen.blog.service.ArticleService;
import com.easen.blog.service.FollowService;
import com.easen.blog.service.LikesService;
import com.easen.blog.service.UserService;
import com.easen.blog.util.DateUtil;

@Controller
@RequestMapping("/user")
public class UserController
{
	@Autowired
	private UserService userService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private LikesService likesService;
	@Autowired
	private FollowService followService;
	private Logger logger =  Logger.getLogger(getClass());
	@RequestMapping("/findById")
	public String findUserById(String id)
	{
		User user = userService.findUserById(id);
//		System.out.println("name:" + user.getName());
//		System.out.println("id:" + user.getId());
		logger.info("id:" + user.getId());
		return "user_detail";
	}
	
	@RequestMapping("/goAddUser")
	public ModelAndView goAddUser()
	{
		ModelAndView mv = new ModelAndView("user_add");
		return mv;
	}
	
	@RequestMapping("/addUser")
	public String addUser(User user)
	{
		userService.addUser(user);
		return UrlConstants.LOGIN;
	}
	
	@RequestMapping("/toIndex")
	public String toIndex()
	{
		return UrlConstants.INDEX;
	}
	
	@RequestMapping("/toMyBlog")
	public String toMyBlog(HttpServletRequest request,String userId)
	{
		if(userId == null)
		{
			User user = (User) request.getSession().getAttribute("user");
			if(null == user)
			{
				return UrlConstants.LOGIN;
			}
			userId = user.getId();
		}
		List<Article> articleList = articleService.findArticlesByUserId(userId);
		int originalCount = 0;
		int reprintCount = 0;
		for (Article article : articleList)
		{
			if(article.getType() == 1)
			{
				originalCount ++;
			}
			else
			{
				reprintCount ++;
			}
		}
		request.setAttribute("originalCount", originalCount);
		request.setAttribute("reprintCount", reprintCount);
		User author = userService.findUserById(userId);
		
		this.setParam(request, author);
		request.setAttribute("author", author);
		request.setAttribute("articleList", articleList);
		request.setAttribute("isMyBlog", 1);
		return UrlConstants.PERSONAL;
	}
	
	@RequestMapping("toMyFollow")
	public String toMyFollow(HttpServletRequest request,String userId)
	{
		if(userId == null)
		{
			User user = (User) request.getSession().getAttribute("user");
			if(null == user)
			{
				return UrlConstants.LOGIN;
			}
			userId = user.getId();
		}
		List<Follow> followList = followService.findAllFollows(userId);
		List<User> list = this.getUsers(followList,"follow");
		User author = userService.findUserById(userId);
		request.setAttribute("author", author);
		request.setAttribute("followUserList", list);
		request.setAttribute("isMyFollow", 1);
		
		List<Article> articleList = articleService.findArticlesByUserId(userId);
		int originalCount = 0;
		int reprintCount = 0;
		for (Article article : articleList)
		{
			if(article.getType() == 1)
			{
				originalCount ++;
			}
			else
			{
				reprintCount ++;
			}
		}
		request.setAttribute("originalCount", originalCount);
		request.setAttribute("reprintCount", reprintCount);
		request.setAttribute("articleList", articleList);
		
		this.setParam(request, author);
		return UrlConstants.PERSONAL;
	}
	
	@RequestMapping("toMyFans")
	public String toMyFans(HttpServletRequest request,String userId)
	{
		if(userId == null)
		{
			User user = (User) request.getSession().getAttribute("user");
			if(null == user)
			{
				return UrlConstants.LOGIN;
			}
			userId = user.getId();
		}
		List<Follow> fansList = followService.findAllFans(userId);
		List<User> list = this.getUsers(fansList,"fans");
		User author = userService.findUserById(userId);
		request.setAttribute("author", author);
		request.setAttribute("fansUserList", list);
		request.setAttribute("isMyFans", 1);
		List<Article> articleList = articleService.findArticlesByUserId(userId);
		int originalCount = 0;
		int reprintCount = 0;
		for (Article article : articleList)
		{
			if(article.getType() == 1)
			{
				originalCount ++;
			}
			else
			{
				reprintCount ++;
			}
		}
		request.setAttribute("originalCount", originalCount);
		request.setAttribute("reprintCount", reprintCount);
		request.setAttribute("articleList", articleList);
		
		this.setParam(request, author);
		return UrlConstants.PERSONAL;
	}
	
	@RequestMapping("toMyMark")
	public String toMyMark(HttpServletRequest request,String userId)
	{
		if(userId == null)
		{
			User user = (User) request.getSession().getAttribute("user");
			if(null == user)
			{
				return UrlConstants.LOGIN;
			}
			userId = user.getId();
		}
		User author = userService.findUserById(userId);
		request.setAttribute("author", author);
		request.setAttribute("isMyMark", 1);
		List<Article> markList = articleService.findMarkArticle(userId);
		request.setAttribute("markList", markList);
		List<Article> articleList = articleService.findArticlesByUserId(userId);
		int originalCount = 0;
		int reprintCount = 0;
		for (Article article : articleList)
		{
			if(article.getType() == 1)
			{
				originalCount ++;
			}
			else
			{
				reprintCount ++;
			}
		}
		request.setAttribute("originalCount", originalCount);
		request.setAttribute("reprintCount", reprintCount);
		request.setAttribute("articleList", articleList);
		
		this.setParam(request, author);
		return UrlConstants.PERSONAL;
	}
	
	/**
	 * 通过关注/粉丝列表查询对应用户
	 * @param list
	 * @return
	 */
	public List<User> getUsers(List<Follow> list, String type)
	{
		List<User> userList = new ArrayList<>();
		for (Follow follow : list)
		{
			String userId = "follow".equals(type) ? follow.getFollowUserId() : follow.getUserId();
			User user = userService.findUserById(userId);
			user.setFansCount(followService.findFansCount(user.getId()));
			user.setFollowCount(userList.size());
			int articleCount = articleService.findCountByUserIdAndType(user.getId(), null);
			user.setArticleCount(articleCount);
			userList.add(user);
		}
		return userList;
	}
	
	/**
	 * 赞数、关注、粉丝数量
	 * @param request
	 * @param author
	 */
	public void setParam(HttpServletRequest request,User author)
	{
		int allLikedCount = likesService.findLikedCountByUserId(author.getId());
		int fansCount = followService.findFansCount(author.getId());
		int followCount = followService.findFollowCount(author.getId());
		
		request.setAttribute("allLikedCount", allLikedCount);
		request.setAttribute("fansCount", fansCount);
		request.setAttribute("followCount", followCount);
		request.setAttribute("registerDate", DateUtil.dateFormatToString(author.getRegisterDate()));
	}
	
	@RequestMapping("/toManageUser")
	public String toManageUser(HttpServletRequest request, String key)
	{
		if(request.getSession().getAttribute("admin") == null)
		{
			return UrlConstants.ADMINLOGIN;
		}
		List<User> userList = userService.findAllUser(key);
		request.setAttribute("key", key);
		request.setAttribute("userList", userList);
		return UrlConstants.MANAGEUSER;
	}
	
	@RequestMapping(value="/getUser",produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getUser(String id)
	{
		JSONObject json = new JSONObject();
		User user = userService.findUserById(id);
		json.put("user", user);
		return json.toString();
	}
	
	@RequestMapping("/editUser")
	public String editUser(HttpServletRequest request, User user)
	{
		userService.editUser(user);
		return toManageUser(request, null);
	}
	
	@RequestMapping("/delUser")
	public String delUser(HttpServletRequest request, String id)
	{
		userService.delUser(id);
		return toManageUser(request, null);
	}
	
	@RequestMapping("/checkUser")
	@ResponseBody
	public String checkUser(String userName)
	{
		User realUser = userService.findUserByNameOrEmail(userName);
		JSONObject json = new JSONObject();
		String info = "success";
		if(null == realUser)
		{
			info = "user_inexistent";
		}
		else
		{
			json.put("receiverId", realUser.getId());
		}
		json.put("info", info);
		return json.toString();
	}
	
	@RequestMapping("/toEditUser")
	public String toEditUser(HttpServletRequest request)
	{
		ModelAndView mv = null;
		if(request.getSession().getAttribute("user") == null)
		{
			return UrlConstants.LOGIN;
		}
		return UrlConstants.EDITUSER;
	}
	
	@RequestMapping("/modifyUser")
	@ResponseBody
	public String modifyUser(User user)
	{
		JSONObject json = new JSONObject();
		try
		{
			userService.editUser(user);
			json.put("info", "success");
		} catch (Exception e)
		{
			e.printStackTrace();
			json.put("info", e.getMessage());
		}
		return json.toString();
	}
}
