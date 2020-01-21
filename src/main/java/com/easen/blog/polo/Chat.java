package com.easen.blog.polo;

import java.io.Serializable;
import java.util.Date;

public class Chat implements Serializable
{
	private static final long serialVersionUID = -951597012448441227L;
	
	private String id;
	private String senderId;
	private String receiverId;
	private String content;
	private String title;
	//0未读  1已读
	private Integer status;
	private Date createTime;
	private String userName;
	//0正常 1删除发件箱  2删除收件箱
	private Integer type;
	public Integer getType()
	{
		return type;
	}
	public void setType(Integer type)
	{
		this.type = type;
	}
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public Chat()
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
	public String getSenderId()
	{
		return senderId;
	}
	public void setSenderId(String senderId)
	{
		this.senderId = senderId;
	}
	public String getReceiverId()
	{
		return receiverId;
	}
	public void setReceiverId(String receiverId)
	{
		this.receiverId = receiverId;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public Integer getStatus()
	{
		return status;
	}
	public void setStatus(Integer status)
	{
		this.status = status;
	}
	public Date getCreateTime()
	{
		return createTime;
	}
	public void setCreateTime(Date createTime)
	{
		this.createTime = createTime;
	}
}
