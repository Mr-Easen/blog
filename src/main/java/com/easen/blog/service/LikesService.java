package com.easen.blog.service;

import com.easen.blog.polo.Likes;

public interface LikesService
{
	/**
	 * 通过文章id统计赞数量
	 * @param articleId
	 * @return
	 */
	public Integer findCountByArticleId(String articleId);
	
	/**
	 * 添加赞数
	 * @param likes
	 * @return
	 */
	public void addLikes(Likes likes);
	
	/**
	 * 通过用户id和文章id查找赞id
	 * @param likes
	 * @return
	 */
	public String findIdByUserIdAndArticleId(Likes likes);
	
	/**
	 * 修改赞状态
	 * @param likes
	 */
	public void editStatus(Likes likes);
	
	/**
	 * 通过用户id查询总赞数
	 * @param userId
	 * @return
	 */
	public int findLikedCountByUserId(String userId);
}
