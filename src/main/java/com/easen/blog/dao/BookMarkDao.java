package com.easen.blog.dao;

import java.util.List;

import com.easen.blog.polo.BookMark;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookMarkDao
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
	
	/**
	 * 通过文章id查询被收藏总数
	 * @param articleId
	 * @return
	 */
	public Integer findCountByArticleId(String articleId);
}
