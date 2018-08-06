package com.mitrais.rms.controller;

import com.mitrais.rms.dao.UserDao;
import com.mitrais.rms.dao.impl.UserDaoImpl;
import com.mitrais.rms.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/users/*")
public class UserServlet extends AbstractController
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        String path = getTemplatePath(req.getServletPath()+req.getPathInfo());

        if ("/list".equalsIgnoreCase(req.getPathInfo())){
            UserDao userDao = UserDaoImpl.getInstance();
            List<User> users = userDao.findAll();
            req.setAttribute("users", users);
        }
        if ("/delete".equalsIgnoreCase(req.getPathInfo())) {
            UserDao userDao = UserDaoImpl.getInstance();

            Long id = Long.parseLong(req.getParameter("id"));
            User user = new User(id, null, null);

            userDao.delete(user);
            resp.sendRedirect("list");
            return;
        }
        if ("/add".equalsIgnoreCase(req.getPathInfo())) {
            UserDao userDao = UserDaoImpl.getInstance();
            String username = req.getParameter("username");
            String password = req.getParameter("password");

            User user = new User(null, username, password);
            userDao.save(user);

            resp.sendRedirect("list");
            return;
        }

        RequestDispatcher requestDispatcher = req.getRequestDispatcher(path);
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
