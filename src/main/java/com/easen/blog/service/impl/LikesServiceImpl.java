package com.easen.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easen.blog.dao.LikesDao;
import com.easen.blog.polo.Likes;
import com.easen.blog.service.LikesService;
@Service
public class LikesServiceImpl implements LikesService
{
	@Autowired
	private LikesDao likesDao;
	
	@Override
	public Integer findCountByArticleId(String articleId)
	{
		return likesDao.findCountByArticleId(articleId);
	}

	@Override
	public void addLikes(Likes likes)
	{
		likesDao.addLikes(likes);
	}

	@Override
	public String findIdByUserIdAndArticleId(Likes likes)
	{
		return likesDao.findIdByUserIdAndArticleId(likes);
	}

	@Override
	public void editStatus(Likes likes)
	{
		likesDao.editStatus(likes);
	}

	@Override
	public int findLikedCountByUserId(String userId)
	{
		return likesDao.findLikedCountByUserId(userId);
	}

}
