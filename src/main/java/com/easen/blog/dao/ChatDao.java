package com.easen.blog.dao;

import java.util.HashMap;
import java.util.List;

import com.easen.blog.polo.Chat;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatDao
{
	/**
	 * 查询发件箱
	 * @param senderId
	 * @return
	 */
	public List<Chat> findOutBox(HashMap<String, Object> map);
	
	/**
	 * 查询收件箱
	 * @param receiverId
	 * @return
	 */
	public List<Chat> findInBox(HashMap<String, Object> map);
	
	/**
	 * 删除私信
	 * @param id
	 */
	public void delChat(Chat chat);
	
	/**
	 * 增加私信
	 * @param chat
	 */
	public void addChat(Chat chat);
	
	/**
	 * 修改状态为已读
	 * @param id
	 */
	public void editStatus(String id);
}
