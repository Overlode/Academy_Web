package com.controller;

import com.entity.User;
import com.service.NewsService;
import com.service.ServiceFactory;
import com.service.UserService;
import com.util.DataSourceUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/news")
public class GetNews extends HttpServlet{
    private NewsService ns = ServiceFactory.getNewsService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        int flgLogin = 0;
        if(user!=null){
            flgLogin = 1;
        }
        else{
            flgLogin = 0;
        }
        req.getSession().setAttribute("flgLogin",flgLogin);
        int id = Integer.parseInt(req.getParameter("nid"));
        req.setAttribute("news", ns.getNews(id));
        req.getSession().setAttribute("newsList", ns.listNews());
        req.getRequestDispatcher("/WEB-INF/jsp/news.jsp")
                .forward(req, resp);
    }
}
