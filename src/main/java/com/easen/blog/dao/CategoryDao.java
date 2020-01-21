package com.easen.blog.dao;

import java.util.List;

import com.easen.blog.polo.Category;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CategoryDao
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
