package com.easen.blog.polo;

import java.io.Serializable;

public class Category implements Serializable
{

	private static final long serialVersionUID = 4726305250911078930L;
	private String id;
	private String name;
	private String parentId;
	public Category()
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
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getParentId()
	{
		return parentId;
	}
	public void setParentId(String parentId)
	{
		this.parentId = parentId;
	}
}
