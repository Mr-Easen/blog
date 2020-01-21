package com.easen.blog.polo;

import java.io.Serializable;
import java.util.Date;

public class Article implements Serializable
{
	private static final long serialVersionUID = 5129532260599108739L;
	private String id;
	private String userId;
	//文章标题
	private String title;
	//正文内容
	private String content;
	//发布时间
	private Date issueTime;
	//二级分类id
	private String categoryId;
	//是否隐藏(0隐藏，1公开)
	private Integer isHidden;
	//类型(0转载，1原创)
	private Integer type;
	
	private String authorName;
	
	private Integer readCount;
	
	private Integer commentCount;
	
	private Integer markCount;
	
	private Integer likesCount;
	
	private String photoUrl;
	
	private String issueAt;
	
	private String email;
	
	private String registerDate;
	
	private String categoryName;
	
	public String getCategoryName()
	{
		return categoryName;
	}
	
	public void setCategoryName(String categoryName)
	{
		this.categoryName = categoryName;
	}
	
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getRegisterDate()
	{
		return registerDate;
	}
	public void setRegisterDate(String registerDate)
	{
		this.registerDate = registerDate;
	}
	public void setIssueAt(String issueAt)
	{
		this.issueAt = issueAt;
	}
	public String getIssueAt()
	{
		return issueAt;
	}
	
	public void setPhotoUrl(String photoUrl)
	{
		this.photoUrl = photoUrl;
	}
	
	public String getPhotoUrl()
	{
		return photoUrl;
	}
	
	public void setLikesCount(Integer likesCount)
	{
		this.likesCount = likesCount;
	}
	public Integer getLikesCount()
	{
		return likesCount;
	}
	public String getAuthorName()
	{
		return authorName;
	}
	public void setAuthorName(String authorName)
	{
		this.authorName = authorName;
	}
	public Integer getReadCount()
	{
		return readCount;
	}
	public void setReadCount(Integer readCount)
	{
		this.readCount = readCount;
	}
	public Integer getCommentCount()
	{
		return commentCount;
	}
	public void setCommentCount(Integer commentCount)
	{
		this.commentCount = commentCount;
	}
	public Integer getMarkCount()
	{
		return markCount;
	}
	public void setMarkCount(Integer markCount)
	{
		this.markCount = markCount;
	}
	public Article(){}
	public Integer getIsHidden()
	{
		return isHidden;
	}
	public void setIsHidden(Integer isHidden)
	{
		this.isHidden = isHidden;
	}
	public Integer getType()
	{
		return type;
	}
	public void setType(Integer type)
	{
		this.type = type;
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
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public Date getIssueTime()
	{
		return issueTime;
	}
	public void setIssueTime(Date issueTime)
	{
		this.issueTime = issueTime;
	}
	public String getCategoryId()
	{
		return categoryId;
	}
	public void setCategoryId(String categoryId)
	{
		this.categoryId = categoryId;
	}
}
