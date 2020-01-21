package com.easen.blog.polo;

import java.io.Serializable;
import java.util.Date;

/**
 * 收藏表
 * @author Easen
 * @Description TODO
 */
public class BookMark implements Serializable
{
	private static final long serialVersionUID = 1109006126934004170L;
	private String id;
	private String userId;
	private String articleId;
	//收藏时间
	private Date markTime;
	//收藏状态 0取消收藏  1有效收藏
	private Integer status;
	
	//判断是否已收藏需要
	private Integer count;
	public Integer getCount()
	{
		return count;
	}
	public void setCount(Integer count)
	{
		this.count = count;
	}
	public BookMark()
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
	public Date getMarkTime()
	{
		return markTime;
	}
	public void setMarkTime(Date markTime)
	{
		this.markTime = markTime;
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
