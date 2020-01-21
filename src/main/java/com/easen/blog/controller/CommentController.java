package com.easen.blog.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.easen.blog.polo.Comment;
import com.easen.blog.service.CommentService;

@Controller
@RequestMapping("comment")
public class CommentController
{
	@Autowired
	private CommentService commentService;
	
	private Logger logger =  Logger.getLogger(getClass());
	
	@RequestMapping(value="/addComment",produces="text/json;charset=UTF-8")
	@ResponseBody
	public String addComment(Comment comment)
	{
		JSONObject json = new JSONObject();
		String id = UUID.randomUUID().toString();
		comment.setId(id);
		try{
			json.put("status", 1);
			commentService.addComment(comment);
			comment = commentService.findCommentById(id);
			json.put("data", comment);
		}
		catch(Exception e)
		{
			json.put("info", e.getMessage());
			e.printStackTrace();
		}
		return json.toString();
	}
	@RequestMapping(value="/getCommentList",produces="text/json;charset=UTF-8")
	@ResponseBody
	public String getCommentList(String articleId,String sort)
	{
		JSONObject json = new JSONObject();
		List<Comment> list = commentService.findCommentsByArticleId(articleId,sort);
		for (Comment comment : list)
		{
			List<Comment> replyList = commentService.findReplyByFloor(comment.getFloor(),articleId);
			comment.setReply(replyList);
		}
		int count = commentService.findCountByArticleId(articleId);
		json.put("count", count);
		json.put("status", 0);
		json.put("list", list);
		logger.info(json.toString());
		return json.toString();
	}
	
	@RequestMapping(value="/delComment",produces="text/json;charset=UTF-8")
	@ResponseBody
	public String delComment(String id)
	{
		JSONObject json = new JSONObject();
		try
		{
			Comment comment = commentService.findCommentById(id);
			List<Comment> list = null;
			if(comment.getIsReply().equals(0))
			{
				list = commentService.findReplyByFloor(comment.getFloor(),comment.getArticleId());
			}
			if(null == list)
			{
				list = new ArrayList<>();
			}
			list.add(comment);
			for (Comment commentTemp : list)
			{
				commentService.delCommentById(commentTemp.getId());
			}
			json.put("data", list);
			json.put("status", 1);
		}catch(Exception e)
		{
			json.put("status", 0);
			e.printStackTrace();
		}
		return json.toString();
	}
}
