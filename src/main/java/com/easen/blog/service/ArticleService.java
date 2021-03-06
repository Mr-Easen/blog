package com.easen.blog.service;

import java.util.HashMap;
import java.util.List;

import com.easen.blog.polo.Article;

public interface ArticleService
{
	/**
	 * 新增文章
	 * @param article
	 * @return
	 */
	public int addArticle(Article article);
	
	/**
	 * 通过id查询文章
	 * @param id
	 * @return
	 */
	public Article findArticleById(String id);
	
	/**
	 * 通过用户id查询文章列表
	 * @param userId
	 * @return
	 */
	public List<Article> findArticlesByUserId(String userId);
	
	/**
	 * 修改文章
	 * @param article
	 */
	public void editArticle(Article article);
	
	/**
	 * 分页查询文章数据
	 * @param 
	 * @return
	 */
	public List<Article> findIndexArticles(Integer pageNumber, String userId, String categoryId);
	
	/**
	 * 通过参数筛选查询文章数量
	 * @param hashMap
	 * @return
	 */
	public int findCount(HashMap<String, Object> hashMap);
	
	/**
	 * 查询推荐文章
	 * @param pageNumber
	 * @return
	 */
	public List<Article> findCommendArticles(Integer pageNumber, String categoryId);
	
	/**
	 * 查询某个用户的文章数量
	 * @param userId
	 * @param type
	 * @return
	 */
	public int findCountByUserIdAndType(String userId, Integer type);
	
	/**
	 * 查询所有文章
	 * @param keyWord
	 * @param pageNumber
	 * @return
	 */
	public List<Article> findAllArticles(String keyWord, Integer pageNumber, String all);
	
	/**
	 * 批量删除
	 * @param ids
	 */
	public void batchDelArticle(String[] ids);
	
	/**
	 * 查询收藏的文章
	 * @param userId
	 * @return
	 */
	public List<Article> findMarkArticle(String userId);
}
