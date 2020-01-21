package com.easen.blog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.easen.blog.polo.Follow;
import com.easen.blog.service.FollowService;

@Controller
@RequestMapping("follow")
public class FollowController
{
	@Autowired
	private FollowService followService;
	
	@RequestMapping("/addFollow")
	@ResponseBody
	public String addFollow(Follow follow)
	{
		JSONObject json = new JSONObject();
		try{
			json.put("info", "success");
			followService.addFollow(follow);
		}
		catch(Exception e)
		{
			json.put("info", e.getMessage());
			e.printStackTrace();
		}
		return json.toString();
	}
}
