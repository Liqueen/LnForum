package com.lina.serlvet;

import com.lina.bean.PostBean;
import com.lina.bean.UserBean;
import com.lina.dao.AdminDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/adminFindAllpost"})
public class AdminFindAllPostServlet extends HttpServlet {

    AdminDao adao = new AdminDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("进入管理员帖子管理.....");
        req.setCharacterEncoding("utf-8");

        List<PostBean> postList = adao.findPost();

        req.setAttribute("postlist",postList);

        req.getRequestDispatcher("admin/postCotrol.jsp").forward(req,resp);

    }
}

