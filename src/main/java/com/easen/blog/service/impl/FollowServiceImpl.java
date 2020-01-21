package com.easen.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easen.blog.dao.FollowDao;
import com.easen.blog.polo.Follow;
import com.easen.blog.service.FollowService;

@Service
public class FollowServiceImpl implements FollowService
{
	@Autowired
	private FollowDao followDao;
	@Override
	public Integer findFansCount(String followUserId)
	{
		return followDao.findFansCount(followUserId);
	}

	@Override
	public Integer findFollowCount(String userId)
	{
		return followDao.findFollowCount(userId);
	}

	@Override
	public List<Follow> findAllFans(String followUserId)
	{
		return followDao.findAllFans(followUserId);
	}

	@Override
	public List<Follow> findAllFollows(String userId)
	{
		return followDao.findAllFollows(userId);
	}

	@Override
	public void addFollow(Follow follow)
	{
		followDao.addFollow(follow);
	}

	@Override
	public String isFollowed(Follow follow)
	{
		return followDao.isFollowed(follow);
	}

}
