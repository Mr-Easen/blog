package com.easen.blog.dao;

import java.util.List;

import com.easen.blog.polo.Follow;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FollowDao
{
	/**
	 * 通过用户id查询粉丝数
	 * @param followUserId
	 * @return
	 */
	public Integer findFansCount(String followUserId);
	
	/**
	 * 通过用户id查询关注数
	 * @param userId
	 * @return
	 */
	public Integer findFollowCount(String userId);
	
	/**
	 * 通过用户id查询粉丝列表
	 * @param followUserId
	 * @return
	 */
	public List<Follow> findAllFans(String followUserId);
	
	/**
	 * 通过用户id查询关注列表
	 * @param userId
	 * @return
	 */
	public List<Follow> findAllFollows(String userId);
	
	/**
	 * 添加关注记录
	 * @param follow
	 */
	public void addFollow(Follow follow);
	
	/**
	 * 通过关注者id与被关注者id查询是否已关注
	 * @param follow
	 * @return
	 */
	public String isFollowed(Follow follow);
}
