package com.easen.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.easen.blog.polo.BookMark;
import com.easen.blog.service.BookMarkService;

@Controller
@RequestMapping("bookMark")
public class BookMarkController
{
	@Autowired
	private BookMarkService bookMarkService;
	
	@RequestMapping("/editStatus")
	@ResponseBody
	public String editStatus(BookMark bookMark)
	{
		JSONObject json = new JSONObject();
		try
		{
			bookMarkService.addBookMark(bookMark);
			json.put("info", "success");
		} catch (Exception e)
		{
			json.put("info", e.getMessage());
			e.printStackTrace();
		}
		return json.toString();
	}
}
