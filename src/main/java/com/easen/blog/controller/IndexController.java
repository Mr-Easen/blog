package com.easen.blog.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.easen.blog.util.UrlConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.easen.blog.polo.Article;
import com.easen.blog.polo.Category;
import com.easen.blog.polo.User;
import com.easen.blog.service.ArticleService;
import com.easen.blog.service.CategoryService;

@Controller
@RequestMapping("index")
public class IndexController
{
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/toIndex")
	public String toIndex(Integer pageNumber, HttpServletRequest request,String categoryId)
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("categoryId", categoryId);
		Integer count = articleService.findCount(map);
		List<Article> articleList = null;
		int pageCount = 0;
		if(0 != count)
		{
			pageCount = count % 10 == 0 ? (count / 10) : (count / 10 + 1);
			articleList = articleService.findIndexArticles(pageNumber,null,categoryId);
		}
		List<Category> categoryList = categoryService.findFirstCategorys();
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("articleList", articleList);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("isIndex", 1);
		request.setAttribute("categoryId", categoryId);
		request.setAttribute("pageNumber", pageNumber == null ? 1 : pageNumber);
		return UrlConstants.INDEX;
	}
	
	@RequestMapping("/toFollow")
	public String toFollow(Integer pageNumber, HttpServletRequest request, String categoryId)
	{
		User user = (User) request.getSession().getAttribute("user");
		if(user == null)
		{
			return UrlConstants.LOGIN;
		}
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", user.getId());
		map.put("categoryId", categoryId);
		Integer count = articleService.findCount(map);
		List<Article> articleList = null;
		int pageCount = 0;
		if(0 != count)
		{
			pageCount = count % 10 == 0 ? (count / 10) : (count / 10 + 1);
			articleList = articleService.findIndexArticles(pageNumber,user.getId(),categoryId);
		}
		List<Category> categoryList = categoryService.findFirstCategorys();
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("articleList", articleList);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("isFollow", 1);
		request.setAttribute("categoryId", categoryId);
		request.setAttribute("pageNumber", pageNumber == null ? 1 : pageNumber);
		return UrlConstants.INDEX;
	}
	
	@RequestMapping("/toCommend")
	public String toCommend(Integer pageNumber, HttpServletRequest request,String categoryId)
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("categoryId", categoryId);
		Integer count = articleService.findCount(map);
		List<Article> articleList = null;
		int pageCount = 0;
		if(0 != count)
		{
			pageCount = count % 10 == 0 ? (count / 10) : (count / 10 + 1);
			articleList = articleService.findCommendArticles(pageNumber,categoryId);
		}
		List<Category> categoryList = categoryService.findFirstCategorys();
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("articleList", articleList);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("isCommend", 1);
		request.setAttribute("categoryId", categoryId);
		request.setAttribute("pageNumber", pageNumber == null ? 1 : pageNumber);
		return UrlConstants.INDEX;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request)
	{
		request.getSession().removeAttribute("user");
		return toIndex(1, request, null);
	}
}
