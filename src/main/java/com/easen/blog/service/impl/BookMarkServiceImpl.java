package com.easen.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easen.blog.dao.BookMarkDao;
import com.easen.blog.polo.BookMark;
import com.easen.blog.service.BookMarkService;

@Service
public class BookMarkServiceImpl implements BookMarkService
{
	@Autowired
	private BookMarkDao bookMarkDao;
	@Override
	public void addBookMark(BookMark bookMark)
	{
		bookMarkDao.addBookMark(bookMark);
	}

	@Override
	public String isBookMarked(BookMark bookMark)
	{
		return bookMarkDao.isBookMarked(bookMark);
	}

	@Override
	public List<String> findAllBookMarkIds(String userId)
	{
		return bookMarkDao.findAllBookMarkIds(userId);
	}
	
}
