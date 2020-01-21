package com.easen.blog.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.easen.blog.util.UrlConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.easen.blog.polo.Chat;
import com.easen.blog.polo.User;
import com.easen.blog.service.ChatService;

@Controller
@RequestMapping("chat")
public class ChatController
{
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/toOutBox")
	public String toOutBox(HttpServletRequest request, String keyWord)
	{
		User user = (User) request.getSession().getAttribute("user");
		if(user == null)
		{
			return UrlConstants.LOGIN;
		}
		List<Chat> chatList = chatService.findOutBox(user.getId(), keyWord);
		request.setAttribute("chatList", chatList);
		request.setAttribute("keyWord", keyWord);
		return UrlConstants.OUTBOX;
	}
	
	@RequestMapping("/toInBox")
	public String toInBox(HttpServletRequest request, String keyWord)
	{
		User user = (User) request.getSession().getAttribute("user");
		if(user == null)
		{
			return UrlConstants.LOGIN;
		}
		List<Chat> chatList = chatService.findInBox(user.getId(),keyWord);
		request.setAttribute("keyWord", keyWord);
		request.setAttribute("chatList", chatList);
		return UrlConstants.INBOX;
	}
	
	@RequestMapping("/delChat")
	@ResponseBody
	public String delChat(Chat chat)
	{
		JSONObject json = new JSONObject();
		try
		{
			json.put("info", "success");
			chatService.delChat(chat);
		} catch (Exception e)
		{
			e.printStackTrace();
			json.put("info", e.getMessage());
		}
		return json.toString();
	}
	
	@RequestMapping("/addChat")
	public String addChat(HttpServletRequest request, Chat chat)
	{
		try
		{
			chatService.addChat(chat);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return toOutBox(request, null);
	}
	
	@RequestMapping("/editStatus")
	@ResponseBody
	public String editStatus(String id)
	{
		JSONObject json = new JSONObject();
		try
		{
			json.put("info", "success");
			chatService.editStatus(id);
		} catch (Exception e)
		{
			e.printStackTrace();
			json.put("info", e.getMessage());
		}
		return json.toString();
	}
}
