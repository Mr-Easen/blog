package com.easen.blog.polo;

import java.io.Serializable;
import java.util.Date;

/**
 * 点赞表
 * @author Easen
 * @Description TODO
 */
public class Likes implements Serializable
{

	private static final long serialVersionUID = 8129218182033358973L;
	private String id;
	private String userId;
	private String articleId;
	//点赞时间
	private Date likeTime;
	//点赞状态 0取消赞  1有效赞
	private Integer status;
	public Likes()
	{
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getUserId()
	{
		return userId;
	}
	public void setUserId(String userId)
	{
		this.userId = userId;
	}
	public String getArticleId()
	{
		return articleId;
	}
	public void setArticleId(String articleId)
	{
		this.articleId = articleId;
	}
	public Date getLikeTime()
	{
		return likeTime;
	}
	public void setLikeTime(Date likeTime)
	{
		this.likeTime = likeTime;
	}
	public Integer getStatus()
	{
		return status;
	}
	public void setStatus(Integer status)
	{
		this.status = status;
	}
}
