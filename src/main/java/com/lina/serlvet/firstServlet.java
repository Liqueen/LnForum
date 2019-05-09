package com.lina.serlvet;

import com.lina.bean.PostBean;
import com.lina.bean.UserBean;
import com.lina.dao.PostDao;
import com.lina.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/first.do"},loadOnStartup = 1)
public class firstServlet extends HttpServlet {

    PostDao pdao = new PostDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        System.out.println("进入主页....");
        req.setCharacterEncoding("utf-8");

        List<PostBean> postlist = pdao.findPost();
        req.setAttribute("postlist",postlist);

        //转发到index.jsp页面
        req.getRequestDispatcher("user/index.jsp").forward(req,resp);

    }
}