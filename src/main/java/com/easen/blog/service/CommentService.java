package com.easen.blog.service;

import java.util.List;

import com.easen.blog.polo.Comment;

public interface CommentService
{
	/**
	 * 添加评论
	 * @param comment
	 */
	public void addComment(Comment comment);
	
	/**
	 * 通过文章id查询该文章的评论
	 * @param articleId
	 * @return
	 */
	public List<Comment> findCommentsByArticleId(String articleId, String sort);
	
	/**
	 * 通过层数查询回复
	 * @param parentId
	 * @return
	 */
	public List<Comment> findReplyByFloor(Integer floor, String articleId);
	
	/**
	 * 通过id删除评论
	 * @param id
	 */
	public void delCommentById(String id);
	
	/**
	 * 通过id查找评论
	 * @param id
	 * @return
	 */
	public Comment findCommentById(String id);
	
	/**
	 * 通过文章id查找评论数量
	 * @param articleId
	 * @return
	 */
	public int findCountByArticleId(String articleId);
}
