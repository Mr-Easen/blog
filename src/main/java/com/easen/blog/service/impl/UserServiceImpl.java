package com.easen.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easen.blog.dao.UserDao;
import com.easen.blog.polo.User;
import com.easen.blog.service.UserService;

@Service
public class UserServiceImpl implements UserService
{
	@Autowired
	private UserDao userDao;
	@Override
	public User findUserById(String id)
	{
		return userDao.findUserById(id);
	}
	@Override
	public int addUser(User user)
	{
		return userDao.addUser(user);
	}
	@Override
	public List<User> findAllUser(String key)
	{
		List<User> list = userDao.findAllUser(key);
		return list;
	}
	@Override
	public User findUserByNameOrEmail(String key)
	{
		return userDao.findUserByNameOrEmail(key);
	}
	@Override
	public User findAdminByName(String userName)
	{
		return userDao.findAdminByName(userName);
	}
	@Override
	public void editUser(User user)
	{
		userDao.editUser(user);
	}
	@Override
	public void delUser(String id)
	{
		userDao.delUser(id);
	}

}
