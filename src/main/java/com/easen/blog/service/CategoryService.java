package com.easen.blog.service;

import java.util.List;

import com.easen.blog.polo.Category;

public interface CategoryService
{
	/**
	 * 查询一级分类
	 * @return
	 */
	public List<Category> findFirstCategorys();
	
	/**
	 * 通过一级分类id查询第二级分类
	 * @param parentId
	 * @return
	 */
	public List<Category> findCategorysByPId(String parentId);
}
