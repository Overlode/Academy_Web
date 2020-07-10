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

@WebServlet("/management-2-alter")
public class Management_2_AlterServlet extends HttpServlet{
    private NewsService ns= ServiceFactory.getNewsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        int ut = user.getUsertype();
        if(ut<2){
            req.getRequestDispatcher("/WEB-INF/jsp/failure.jsp").forward(req,resp);
        }
        else{
            req.getSession().setAttribute("news", ns.getNews(Integer.parseInt(req.getParameter("nid"))));
            req.getRequestDispatcher("/WEB-INF/jsp/management-2-alter.jsp").forward(req,resp);
        }
    }
}
