package com.easen.blog.dao;

import java.util.HashMap;
import java.util.List;

import com.easen.blog.polo.Comment;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentDao
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
	public List<Comment> findCommentsByArticleId(HashMap<String, String> param);
	
	/**
	 * 通过层数查询回复
	 * @param parentId
	 * @return
	 */
	public List<Comment> findReplyByFloor(HashMap<String, Object> param);
	
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
