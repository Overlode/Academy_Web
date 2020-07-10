package com.controller;


import com.entity.User;
import com.service.LabService;
import com.service.NewsService;
import com.service.ServiceFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/index")
public class IndexServlet extends HttpServlet {
    private NewsService ns = ServiceFactory.getNewsService();
    private LabService ls = ServiceFactory.getLabService();
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
        req.getSession().setAttribute("newsList", ns.listNews());
        req.getSession().setAttribute("labsList", ls.listLabs());
        req.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(req,resp);
    }
}
