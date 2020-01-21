package com.easen.blog.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.easen.blog.polo.Category;
import com.easen.blog.service.CategoryService;

@Controller
@RequestMapping("/category")
public class CategoryController
{
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value="/findCategorysByPId",produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String findCategorysByPId(String parentId,HttpServletResponse response)
	{
		JSONObject json = new JSONObject();
		List<Category> list = categoryService.findCategorysByPId(parentId);
		json.put("data", list);
		return json.toString();
	}
	
}
