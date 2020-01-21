package com.easen.blog.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easen.blog.dao.ChatDao;
import com.easen.blog.polo.Chat;
import com.easen.blog.service.ChatService;
@Service
public class ChatServiceImpl implements ChatService
{
	@Autowired
	private ChatDao chatDao;
	@Override
	public List<Chat> findOutBox(String senderId, String keyWord)
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("senderId", senderId);
		map.put("keyWord", keyWord);
		return chatDao.findOutBox(map);
	}

	@Override
	public List<Chat> findInBox(String receiverId, String keyWord)
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("receiverId", receiverId);
		map.put("keyWord", keyWord);
		return chatDao.findInBox(map);
	}

	@Override
	public void delChat(Chat chat)
	{
		chatDao.delChat(chat);
	}

	@Override
	public void addChat(Chat chat)
	{
		chatDao.addChat(chat);
	}

	@Override
	public void editStatus(String id)
	{
		chatDao.editStatus(id);
	}

}
