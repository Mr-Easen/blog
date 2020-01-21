package com.easen.blog.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easen.blog.dao.CommentDao;
import com.easen.blog.polo.Comment;
import com.easen.blog.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService
{
	@Autowired
	private CommentDao commentDao;
	@Override
	public void addComment(Comment comment)
	{
		commentDao.addComment(comment);
	}

	@Override
	public List<Comment> findCommentsByArticleId(String articleId,String sort)
	{
		HashMap<String, String> map = new HashMap<>();
		map.put("articleId", articleId);
		map.put("sort", sort);
		return commentDao.findCommentsByArticleId(map);
	}

	@Override
	public List<Comment> findReplyByFloor(Integer floor,String articleId)
	{
		HashMap<String,Object> map = new HashMap<>();
		map.put("floor", floor);
		map.put("articleId", articleId);
		return commentDao.findReplyByFloor(map);
	}

	@Override
	public void delCommentById(String id)
	{
		commentDao.delCommentById(id);
	}

	@Override
	public Comment findCommentById(String id)
	{
		return commentDao.findCommentById(id);
	}

	@Override
	public int findCountByArticleId(String articleId)
	{
		return commentDao.findCountByArticleId(articleId);
	}

}
