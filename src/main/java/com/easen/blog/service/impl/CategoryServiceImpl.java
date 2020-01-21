package com.easen.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easen.blog.dao.CategoryDao;
import com.easen.blog.polo.Category;
import com.easen.blog.service.CategoryService;
@Service
public class CategoryServiceImpl implements CategoryService
{
	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	public List<Category> findFirstCategorys()
	{
		return categoryDao.findFirstCategorys();
	}

	@Override
	public List<Category> findCategorysByPId(String parentId)
	{
		return categoryDao.findCategorysByPId(parentId);
	}

}
