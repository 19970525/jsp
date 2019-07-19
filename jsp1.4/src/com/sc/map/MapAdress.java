package com.sc.map;

import javafx.application.Application;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.*;
import java.io.IOException;
import javax.servlet.ServletContext;

@WebServlet("/map")
public class MapAdress extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException,ServletException {
        System.out.println("访问到了...........");
        String ln = req.getParameter("lon");
        String la = req.getParameter("lat");
        System.out.println(ln);
        System.out.println(la);
        if(Context.httpSession != null){
            Context.httpSession.setAttribute("lng",ln);
            Context.httpSession.setAttribute("lat",la);
            req.getRequestDispatcher("map.jsp").forward(req,resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Context.httpSession = req.getSession();
        req.getSession().setAttribute("12",12);

    }
}
