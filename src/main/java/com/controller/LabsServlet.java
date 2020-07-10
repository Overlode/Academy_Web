package com.controller;

import com.service.LabService;
import com.service.ServiceFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/labs")
public class LabsServlet extends HttpServlet {
    private LabService ls = ServiceFactory.getLabService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getSession().setAttribute("labsList", ls.listLabs());
        int id = Integer.parseInt(req.getParameter("lid"));
        req.setAttribute("lab", ls.getLab(id));
        req.getRequestDispatcher("/WEB-INF/jsp/labs.jsp").forward(req,resp);
    }
}
