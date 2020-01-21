package com.easen.blog.polo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Comment implements Serializable
{
	private static final long serialVersionUID = 6028986544419329378L;
	private String id;
	private String content;
	private String articleId;
	private String senderId;
	private String receiverId;
	private String parentId;
	private Integer isReply;
	private Date createTime;
	
	private String senderName;
	private String receiverName;
	private Integer floor;
	private String sort;
	private List<Comment> reply;
	public Comment()
	{
	}
	public String getSort()
	{
		return sort;
	}
	public void setSort(String sort)
	{
		this.sort = sort;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getArticleId()
	{
		return articleId;
	}
	public void setArticleId(String articleId)
	{
		this.articleId = articleId;
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
	public String getParentId()
	{
		return parentId;
	}
	public void setParentId(String parentId)
	{
		this.parentId = parentId;
	}
	public Integer getIsReply()
	{
		return isReply;
	}
	public void setIsReply(Integer isReply)
	{
		this.isReply = isReply;
	}
	public Date getCreateTime()
	{
		return createTime;
	}
	public void setCreateTime(Date createTime)
	{
		this.createTime = createTime;
	}
	public String getSenderName()
	{
		return senderName;
	}
	public void setSenderName(String senderName)
	{
		this.senderName = senderName;
	}
	public String getReceiverName()
	{
		return receiverName;
	}
	public void setReceiverName(String receiverName)
	{
		this.receiverName = receiverName;
	}
	public Integer getFloor()
	{
		return floor;
	}
	public void setFloor(Integer floor)
	{
		this.floor = floor;
	}
	public List<Comment> getReply()
	{
		return reply;
	}
	public void setReply(List<Comment> reply)
	{
		this.reply = reply;
	}
}
