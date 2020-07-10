package com.controller;

import com.entity.User;
import com.service.NewsService;
import com.service.ServiceFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/management-2")
public class Management_2Servlet extends HttpServlet {
    private NewsService ns = ServiceFactory.getNewsService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        int ut = user.getUsertype();
        int page = Integer.parseInt(req.getParameter("page"));
        req.getSession().setAttribute("newsList", ns.listNews());
        req.setAttribute("page", page);
        if(ut<2){
            req.getRequestDispatcher("/WEB-INF/jsp/failure.jsp").forward(req,resp);
        }
        else{
            req.getRequestDispatcher("/WEB-INF/jsp/management-2.jsp").forward(req,resp);
        }
    }
}
