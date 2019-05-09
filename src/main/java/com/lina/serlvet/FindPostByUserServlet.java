package com.lina.serlvet;

import com.lina.bean.PostBean;
import com.lina.dao.PostDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/findPostByUserName.do"})
public class FindPostByUserServlet extends HttpServlet {

    PostDao pdao = new PostDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("进入根据用户名查询该用户的帖子......");
        req.setCharacterEncoding("utf-8");

        HttpSession session = req.getSession();
        String username = (String)session.getAttribute("name");

        List<PostBean> postBeanList = pdao.findPostByUserName(username);

        req.setAttribute("post", postBeanList);

        req.getRequestDispatcher("user/activityAll.jsp").forward(req, resp);


    }
}
