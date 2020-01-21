package com.easen.blog.service;

import java.util.List;

import com.easen.blog.polo.BookMark;

public interface BookMarkService
{
	/**
	 * 添加/取消收藏
	 * @param bookMark
	 */
	public void addBookMark(BookMark bookMark);
	
	/**
	 * 判断是否已收藏
	 * @param bookMark
	 * @return
	 */
	public String isBookMarked(BookMark bookMark);
	
	/**
	 * 通过用户id查询所有收藏的文章id
	 * @return
	 */
	public List<String> findAllBookMarkIds(String userId);
}
