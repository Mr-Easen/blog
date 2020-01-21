package com.easen.blog.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil
{
	public static String formatTime(long millis)
	{
		String str = "";
		if(millis / 60000 / 60 / 24 > 0)
		{
			str = (millis / 60000 / 60 / 24+"天前");
		}
		else if(millis / 60000 / 60 > 0)
		{
			str = (millis / 60000 / 60 + "小时前");
		}
		else if(millis / 60000 > 0)
		{
			str = (millis / 60000 + "分钟前");
		}
		else if(millis / 60000 == 0)
		{
			str = "1分钟前";
		}
		return str;
	}
	
	public static String dateFormatToString(Date date)
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
}
