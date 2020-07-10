package com.controller;

import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/management-1")
public class Management_1Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        int ut = user.getUsertype();
        if(ut<2){
            req.getRequestDispatcher("/WEB-INF/jsp/failure.jsp").forward(req,resp);
        }
        else{
            req.getRequestDispatcher("/WEB-INF/jsp/management-1.jsp").forward(req,resp);
        }
    }
}
