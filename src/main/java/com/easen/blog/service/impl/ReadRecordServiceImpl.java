package com.easen.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easen.blog.dao.ReadRecordDao;
import com.easen.blog.polo.ReadRecord;
import com.easen.blog.service.ReadRecordService;
@Service
public class ReadRecordServiceImpl implements ReadRecordService
{
	@Autowired
	private ReadRecordDao readRecordDao;
	
	@Override
	public void addReadRecord(ReadRecord readRecord)
	{
		readRecordDao.addReadRecord(readRecord);
	}

	@Override
	public Integer findCount(String articleId)
	{
		return readRecordDao.findCount(articleId);
	}

	@Override
	public String findIdByUserIdOrIp(ReadRecord readRecord)
	{
		return readRecordDao.findIdByUserIdOrIp(readRecord);
	}

}
