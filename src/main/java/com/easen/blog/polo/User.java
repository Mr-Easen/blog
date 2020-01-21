package com.easen.blog.polo;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable
{

	private static final long serialVersionUID = 1L;
	private String id;
	private String userName;
	private String password;
	private String email;
	private String photoUrl;
	private Integer role;
	private String key;
	private Date registerDate;
	private Integer followCount;
	private Integer fansCount;
	private Integer articleCount;
	public Integer getFollowCount()
	{
		return followCount;
	}
	public void setFollowCount(Integer followCount)
	{
		this.followCount = followCount;
	}
	public Integer getFansCount()
	{
		return fansCount;
	}
	public void setFansCount(Integer fansCount)
	{
		this.fansCount = fansCount;
	}
	public Integer getArticleCount()
	{
		return articleCount;
	}
	public void setArticleCount(Integer articleCount)
	{
		this.articleCount = articleCount;
	}
	public void setRegisterDate(Date registerDate)
	{
		this.registerDate = registerDate;
	}
	public Date getRegisterDate()
	{
		return registerDate;
	}
	public User()
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
	public String getUserName()
	{
		return userName;
	}
	public void setUserName(String userName)
	{
		this.userName = userName;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getPhotoUrl()
	{
		return photoUrl;
	}
	public void setPhotoUrl(String photoUrl)
	{
		this.photoUrl = photoUrl;
	}
	public Integer getRole()
	{
		return role;
	}
	public void setRole(Integer role)
	{
		this.role = role;
	}
	public String getKey()
	{
		return key;
	}
	public void setKey(String key)
	{
		this.key = key;
	}
}
