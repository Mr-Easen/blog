package com.easen.blog.polo;

import java.io.Serializable;
import java.util.Date;

public class Follow implements Serializable
{
	private static final long serialVersionUID = -8906959435872028620L;
	private String id;
	private String userId;
	private String followUserId;
	private Integer status;
	private Date followTime;
	/**
	 * 判断是新增还是更新的需要
	 */
	private Integer count;
	public Follow()
	{
	}
	public Integer getCount()
	{
		return count;
	}
	public void setCount(Integer count)
	{
		this.count = count;
	}
	public Integer getStatus()
	{
		return status;
	}
	public void setStatus(Integer status)
	{
		this.status = status;
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
	public String getFollowUserId()
	{
		return followUserId;
	}
	public void setFollowUserId(String followUserId)
	{
		this.followUserId = followUserId;
	}
	public Date getFollowTime()
	{
		return followTime;
	}
	public void setFollowTime(Date followTime)
	{
		this.followTime = followTime;
	}
}
