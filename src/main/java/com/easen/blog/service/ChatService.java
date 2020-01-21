package com.easen.blog.service;

import java.util.List;

import com.easen.blog.polo.Chat;

public interface ChatService
{
	/**
	 * 查询发件箱
	 * @param senderId
	 * @return
	 */
	public List<Chat> findOutBox(String senderId, String keyWord);
	
	/**
	 * 查询收件箱
	 * @param receiverId
	 * @return
	 */
	public List<Chat> findInBox(String receiverId, String keyWord);
	
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
