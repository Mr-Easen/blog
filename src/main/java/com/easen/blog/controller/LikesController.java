package com.easen.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.easen.blog.polo.Likes;
import com.easen.blog.service.LikesService;

@Controller
@RequestMapping("likes")
public class LikesController
{
	@Autowired
	private LikesService likesService;
	
	@RequestMapping("/editStatus")
	@ResponseBody
	public String editStatus(Likes likes)
	{
		JSONObject json = new JSONObject();
		json.put("info", "success");
		try
		{
			String id = likesService.findIdByUserIdAndArticleId(likes);
			if(id != null)
			{
				likesService.editStatus(likes);
			}
			else
			{
				likes.setStatus(1);
				likesService.addLikes(likes);
			}
		}
		catch(Exception e)
		{
			json.put("info", e.getMessage());
			e.printStackTrace();
		}
		return json.toString();
	}
}
