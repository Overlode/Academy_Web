package com.service.impl;

import com.entity.News;
import com.entity.User;
import com.service.NewsService;
import com.util.DataSourceUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class NewsServiceImpl implements NewsService {
    private static Logger logger = Logger.getLogger(UserServiceImpl.class.getName());

    @Override
    public News getNews(int newsid) {
        News news = null;
        String sql = "select * from news where newsid = ?";
        try (Connection conn = DataSourceUtils.getConnection(); PreparedStatement st = conn.prepareStatement(sql)) {
            st.setInt(1, newsid);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    news = new News(rs.getInt("newsid"), rs.getInt("userid"), rs.getString("head"),rs.getString("context"),rs.getDate("date"));
                }
            }
        }catch (SQLException e) {
            logger.warning(e.getMessage());
        }
        return news;
    }

    @Override
    public List<News> listNews() {
        List<News> newsList = new ArrayList<>();
        News news = null;
        String sql="select * from news order by date desc";
        try(Connection conn=DataSourceUtils.getConnection();
            PreparedStatement st=conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery()){
            while (rs.next()){
                news = new News(rs.getInt("newsid"), rs.getInt("userid"), rs.getString("head"),rs.getString("context"),rs.getDate("date"));
                newsList.add(news);
                rs.getDate("date");
            }
        }catch (SQLException se){
            se.printStackTrace();
        }
        return newsList;
    }

    @Override
    public void addNews(int userid, String headline, String context) {
        String sql="insert into news(userid,head,context) values (?,?,?)";
        try(Connection conn=DataSourceUtils.getConnection();
            PreparedStatement st=conn.prepareStatement(sql)){
            st.setInt(1,userid);
            st.setString(2,headline);
            st.setString(3,context);
            st.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
        }
    }

    @Override
    public void updateNews(int userid, String headline, String context,int newsid) {
        String sql="update news set userid = ?, head = ? , context =? where newsid = ?";
        try(Connection conn=DataSourceUtils.getConnection();
            PreparedStatement st=conn.prepareStatement(sql)){
            st.setInt(1,userid);
            st.setString(2,headline);
            st.setString(3,context);
            st.setInt(4,newsid);
            st.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
        }
    }

    @Override
    public void deleteNews(int newsid) {
        String sql="delete from news where newsid = ?";
        try(Connection conn=DataSourceUtils.getConnection();
            PreparedStatement st=conn.prepareStatement(sql)){
            st.setInt(1,newsid);
            st.executeUpdate();
        }catch (SQLException se){
            se.printStackTrace();
        }
    }
}
