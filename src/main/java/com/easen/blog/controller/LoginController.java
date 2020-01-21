package com.easen.blog.controller;

import javax.servlet.http.HttpServletRequest;

import com.easen.blog.util.UrlConstants;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.easen.blog.polo.User;
import com.easen.blog.service.UserService;

@Controller
@RequestMapping("login")
public class LoginController
{
	@Autowired
	private UserService userService;
	private Logger logger =  Logger.getLogger(getClass());
	@RequestMapping("/toLogin")
	public String toLogin(HttpServletRequest request)
	{
		request.getSession().removeAttribute("user");
		return UrlConstants.LOGIN;
	}
	
	@RequestMapping("/toRegister")
	public String toRegister()
	{
		return UrlConstants.REGISTER;
	}
	
	@RequestMapping("/checkUser")
	@ResponseBody
	public String checkUser(User user,HttpServletRequest request)
	{
		String key = user.getKey();
		User realUser = userService.findUserByNameOrEmail(key);
		JSONObject json = new JSONObject();
		String info = "success";
		if(null == realUser)
		{
			info = "user_inexistent";
		}
		else if(!user.getPassword().equals(realUser.getPassword()))
		{
			info = "password_error";
		}
		else
		{
			request.getSession().setAttribute("user", realUser);
			logger.info("-----------登录验证成功，跳转至首页------------");
		}
		json.put("info", info);
		return json.toString();
	}
	
	@RequestMapping("/isExisted")
	@ResponseBody
	public String isExisted(User user)
	{
		String email = user.getEmail();
		String userName = user.getUserName();
		User userForUserName = userService.findUserByNameOrEmail(userName);
		User userForEmail = userService.findUserByNameOrEmail(email);
		JSONObject json = new JSONObject();
		if(null != userForUserName)
		{
			json.put("info", "userName_existed");
			return json.toString();
		}
		if(null != userForEmail)
		{
			json.put("info", "email_existed");
			return json.toString();
		}
		json.put("info", "success");
		return json.toString();
	}
	
	@RequestMapping("/toAdminLogin")
	public String toAdminLogin(HttpServletRequest request)
	{
		request.getSession().removeAttribute("admin");
		return UrlConstants.ADMINLOGIN;
	}
	
	@RequestMapping("/checkAdmin")
	@ResponseBody
	public String checkAdmin(HttpServletRequest request, User user)
	{
		JSONObject json = new JSONObject();
		User sqlUser = userService.findAdminByName(user.getUserName());
		if(sqlUser == null)
		{
			json.put("info", "user_inexistent");
		}
		else if(!sqlUser.getPassword().equals(user.getPassword()))
		{
			json.put("info", "password_error");
		}
		else
		{
			json.put("info", "success");
			request.getSession().setAttribute("admin", sqlUser);
		}
		return json.toString();
	}
}
