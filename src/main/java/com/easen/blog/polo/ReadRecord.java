package com.easen.blog.polo;

import java.io.Serializable;
import java.util.Date;

public class ReadRecord implements Serializable
{

	private static final long serialVersionUID = -3853012739711576105L;
	private String id;
	private String userId;
	private String ip;
	private String articleId;
	private Date readTime;
	public ReadRecord()
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
	public String getIp()
	{
		return ip;
	}
	public void setIp(String ip)
	{
		this.ip = ip;
	}
	public String getArticleId()
	{
		return articleId;
	}
	public void setArticleId(String articleId)
	{
		this.articleId = articleId;
	}
	public Date getReadTime()
	{
		return readTime;
	}
	public void setReadTime(Date readTime)
	{
		this.readTime = readTime;
	}
}
