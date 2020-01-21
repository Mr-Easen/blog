package com.easen.blog.dao;

import com.easen.blog.polo.ReadRecord;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReadRecordDao
{
	/**
	 * 添加阅读记录
	 * @param readRecord
	 */
	public void addReadRecord(ReadRecord readRecord);
	
	/**
	 * 通过文章id查询阅读记录总数
	 * @param articleId
	 * @return
	 */
	public Integer findCount(String articleId);
	
	/**
	 * 通过读者id或者IP地址查询阅读记录id
	 * @param readRecord
	 * @return
	 */
	public String findIdByUserIdOrIp(ReadRecord readRecord);
}
