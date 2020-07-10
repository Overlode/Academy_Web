package com.service;

import com.entity.News;
import com.entity.User;

import java.util.List;

public interface NewsService {
    public News getNews(int newsid);
    public List<News> listNews();
    public void addNews(int userid,String headline,String context);
    public void updateNews(int userid,String headline,String context,int newsid);
    public void deleteNews(int newsid);
}
