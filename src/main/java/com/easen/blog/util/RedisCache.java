package com.easen.blog.util;

import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.ibatis.cache.Cache;
import org.apache.log4j.Logger;


/*
 * 使用第三方缓存服务器，处理二级缓存
 */
public class RedisCache implements Cache {

	private static Logger logger = Logger.getLogger(RedisCache.class);

	/** The ReadWriteLock. */
	private final ReadWriteLock readWriteLock = new ReentrantReadWriteLock();
	private String id;
	private final String COMMON_CACHE_KEY = "COM:";

	/**
	 * 按照一定规则标识key
	 */
	@SuppressWarnings("unused")
	private String getKey(Object key) {
		StringBuilder accum = new StringBuilder();
		accum.append(COMMON_CACHE_KEY);
		accum.append(this.id).append(":");
		accum.append(DigestUtils. md5Hex(String.valueOf(key)));
		return accum.toString();
	}

	/**
	 * redis key规则前缀
	 */
	@SuppressWarnings("unused")
	private String getKeys() {
		return COMMON_CACHE_KEY + this.id + ":*";
	}

	public RedisCache() {

	}

	public RedisCache(final String id) {
		if (id == null) {
			throw new IllegalArgumentException("必须传入ID");
		}
		logger.debug(">>>>>>>>>>>>>>>>>>>>>MybatisRedisCache:id=" + id);
		this.id = id;
	}


	public String getId() {
		return this.id;
	}

	public int getSize() {
		 return Integer.valueOf(RedisUtil.getJedis().dbSize().toString());
	}

	public void putObject(Object key, Object value) {
		 logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>putObject:"+key+"="+value);
		 RedisUtil.getJedis().set(SerializeUtil.serialize(key.toString()), SerializeUtil.serialize(value));
	}


	public Object getObject(Object key) {
		 Object value = SerializeUtil.unserialize(RedisUtil.getJedis().get(SerializeUtil.serialize(key.toString())));
	        logger.debug(">>>>>>>>>>>>>>>>>>>>>>>>getObject:"+key+"="+value);
	        return value;
	}


	public Object removeObject(Object key) {
		return RedisUtil.getJedis().expire(SerializeUtil.serialize(key.toString()),0);
	}


	public void clear() {
		 RedisUtil.getJedis().flushDB();
	}


	public ReadWriteLock getReadWriteLock() {
		return readWriteLock;
	}
}