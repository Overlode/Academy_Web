package com.controller;


import com.entity.News;
import com.entity.User;
import com.service.NewsService;
import com.service.ServiceFactory;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

@WebServlet("/managementcontrol")
public class ManagementCoreServlet extends HttpServlet {
    private NewsService ns = ServiceFactory.getNewsService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/asd.jsp")
                .forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId=((User)req.getSession().getAttribute("user")).getId();
        if(userId<2){
            resp.sendRedirect("/failure");
        }
        else{
            if(req.getParameter("controlType").equals("1")){
                String context=new String(req.getParameter("context").getBytes("iso-8859-1"),"utf-8");
                String headline=new String(req.getParameter("headline").getBytes("iso-8859-1"),"utf-8");
                ns.addNews(userId,headline,context);
            }
            if(req.getParameter("controlType").equals("2")){
                String context=new String(req.getParameter("context").getBytes("iso-8859-1"),"utf-8");
                String headline=new String(req.getParameter("headline").getBytes("iso-8859-1"),"utf-8");
                ns.updateNews(userId,headline,context,((News)req.getSession().getAttribute("news")).getNewsid());
            }
            if(req.getParameter("controlType").equals("3")){
                String[] newsId = req.getParameterValues("deleteNewsId");
                for(int i=0;i<newsId.length;i++){
                    int nId=Integer.parseInt(newsId[i]);
                    ns.deleteNews(nId);
                }
                resp.sendRedirect("/management-3?page=1");
            }
        }

    }
}
