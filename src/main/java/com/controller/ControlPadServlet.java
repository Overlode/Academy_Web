package com.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/controlpad")
public class ControlPadServlet extends HttpServlet {
    private String url = "/failure.jsp";
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int flgLogin=(int)req.getSession().getAttribute("flgLogin");
        if(flgLogin==1){
            url = "/controlpad.jsp";
        }
        else{
            url = "/failure.jsp";
        }
        req.getRequestDispatcher("/WEB-INF/jsp"+url).forward(req,resp);
    }
}
