package com.easen.blog.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easen.blog.dao.ArticleDao;
import com.easen.blog.dao.BookMarkDao;
import com.easen.blog.dao.CommentDao;
import com.easen.blog.dao.LikesDao;
import com.easen.blog.dao.ReadRecordDao;
import com.easen.blog.polo.Article;
import com.easen.blog.service.ArticleService;
import com.easen.blog.util.DateUtil;
import com.easen.blog.util.HtmlUtil;
@Service
public class ArticleServiceImpl implements ArticleService
{
	@Autowired
	private ArticleDao articleDao;
	
	@Autowired
	private ReadRecordDao readRecordDao;
	
	@Autowired
	private CommentDao commentDao;
	
	@Autowired
	private BookMarkDao bookMarkDao;
	
	@Autowired
	private LikesDao likesDao;
	@Override
	public int addArticle(Article article)
	{
		return articleDao.addArticle(article);
	}
	@Override
	public Article findArticleById(String id)
	{
		return articleDao.findArticleById(id);
	}
	@Override
	public List<Article> findArticlesByUserId(String userId)
	{
		List<Article> list = articleDao.findArticlesByUserId(userId);
		for (Article article : list)
		{
			Date date = article.getIssueTime();
			long time = System.currentTimeMillis() -  date.getTime();
			article.setIssueAt(DateUtil.formatTime(time));
			article.setContent(HtmlUtil.delHTMLTag(article.getContent()));
			String articleId = article.getId();
			article.setReadCount(readRecordDao.findCount(articleId));
			article.setCommentCount(commentDao.findCountByArticleId(articleId));
			article.setLikesCount(likesDao.findCountByArticleId(articleId));
			article.setMarkCount(bookMarkDao.findCountByArticleId(articleId));
		}
		return list;
	}
	@Override
	public void editArticle(Article article)
	{
		articleDao.editArticle(article);
	}
	@Override
	public List<Article> findIndexArticles(Integer pageNumber, String userId, String categoryId)
	{
		if(null == pageNumber || pageNumber.equals(0))
		{
			pageNumber = 1;
		}
		HashMap<String, Object> map = new HashMap<>();
		Integer start = (pageNumber - 1) * 10;
		Integer end = start + 10;
		map.put("start", start);
		map.put("end", end);
		map.put("userId", userId);
		map.put("categoryId", categoryId);
		List<Article> list = articleDao.findIndexArticles(map);
		for (Article article : list)
		{
			Date date = article.getIssueTime();
			long time = System.currentTimeMillis() -  date.getTime();
			article.setIssueAt(DateUtil.formatTime(time));
			article.setContent(HtmlUtil.delHTMLTag(article.getContent()));
			String articleId = article.getId();
			article.setReadCount(readRecordDao.findCount(articleId));
			article.setCommentCount(commentDao.findCountByArticleId(articleId));
			article.setLikesCount(likesDao.findCountByArticleId(articleId));
			article.setMarkCount(bookMarkDao.findCountByArticleId(articleId));
		}
		return list;
	}
	@Override
	public int findCount(HashMap<String, Object> hashMap)
	{
		return articleDao.findCount(hashMap);
	}
	@Override
	public List<Article> findCommendArticles(Integer pageNumber, String categoryId)
	{
		if(null == pageNumber || pageNumber.equals(0))
		{
			pageNumber = 1;
		}
		HashMap<String, Object> map = new HashMap<>();
		Integer start = (pageNumber - 1) * 10;
		Integer end = start + 10;
		map.put("start", start);
		map.put("end", end);
		map.put("categoryId", categoryId);
		List<Article> list = articleDao.findCommendArticles(map);
		for (Article article : list)
		{
			Date date = article.getIssueTime();
			long time = System.currentTimeMillis() -  date.getTime();
			article.setIssueAt(DateUtil.formatTime(time));
			article.setContent(HtmlUtil.delHTMLTag(article.getContent()));
			String articleId = article.getId();
			article.setReadCount(readRecordDao.findCount(articleId));
			article.setCommentCount(commentDao.findCountByArticleId(articleId));
//			article.setLikesCount(likesDao.findCountByArticleId(articleId));
			article.setMarkCount(bookMarkDao.findCountByArticleId(articleId));
		}
		return list;
	}
	@Override
	public int findCountByUserIdAndType(String userId, Integer type)
	{
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("type", type);
		return articleDao.findCountByUserIdAndType(map);
	}
	@Override
	public List<Article> findAllArticles(String keyWord, Integer pageNumber, String all)
	{
		if(null == pageNumber || pageNumber.equals(0))
		{
			pageNumber = 1;
		}
		HashMap<String, Object> map = new HashMap<>();
		Integer start = (pageNumber - 1) * 10;
		Integer end = start + 10;
		map.put("start", start);
		map.put("end", end);
		map.put("keyWord", keyWord);
		map.put("all", all);
		List<Article> list = articleDao.findAllArticles(map);
		return list;
	}
	@Override
	public void batchDelArticle(String[] ids)
	{
		articleDao.batchDelArticle(ids);
	}
	@Override
	public List<Article> findMarkArticle(String userId)
	{
		List<Article> list = articleDao.findMarkArticle(userId);
		for (Article article : list)
		{
			Date date = article.getIssueTime();
			long time = System.currentTimeMillis() -  date.getTime();
			article.setIssueAt(DateUtil.formatTime(time));
			article.setContent(HtmlUtil.delHTMLTag(article.getContent()));
			String articleId = article.getId();
			article.setReadCount(readRecordDao.findCount(articleId));
			article.setCommentCount(commentDao.findCountByArticleId(articleId));
			article.setLikesCount(likesDao.findCountByArticleId(articleId));
			article.setMarkCount(bookMarkDao.findCountByArticleId(articleId));
		}
		return list;
	}

}
