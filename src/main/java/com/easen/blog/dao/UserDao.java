package com.easen.blog.dao;

import java.util.List;

import com.easen.blog.polo.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * @author Easen
 * @Description 2018/04/25
 */
@Mapper
public interface UserDao
{
	/**
	 * 通过ID查询用户
	 * @param id
	 * @return
	 */
	public User findUserById(String id);
	
	/**
	 * 注册用户
	 * @param user
	 * @return
	 */
	public int addUser(User user);
	
	/**
	 * 查询所有普通用户
	 * @return
	 */
	public List<User> findAllUser(String key);
	
	/**
	 * 通过用户名或邮箱查询用户
	 * @param user
	 * @return
	 */
	public User findUserByNameOrEmail(String key);
	
	/**
	 * 通过用户名查找管理员
	 * @param userName
	 * @return
	 */
	public User findAdminByName(String userName);
	
	/**
	 * 修改用户信息
	 * @param user
	 */
	public void editUser(User user);
	
	/**
	 * 删除某个用户
	 * @param id
	 */
	public void delUser(String id);
}