package com.lina.serlvet;

import com.lina.bean.CommentBean;
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

@WebServlet(urlPatterns = {"/findPostByTitil.do"})
public class FindPostByTitilServlet extends HttpServlet {

    PostDao pdao = new PostDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("进入根据标题查询帖子......");
        req.setCharacterEncoding("utf-8");

        String postitle = req.getParameter("postitle");
        //根据帖子标题来查询帖子
        PostBean postBean1= pdao.findPostByTitle(postitle);
        int postId = postBean1.getPost_id();
        req.setAttribute("post1", postBean1);
        HttpSession session = req.getSession();
        session.setAttribute("postid",postId);

        //根据帖子id来查询帖子回复
        List<CommentBean> commentList = pdao.findCommenByTitle(postId);

        //写一个接口来查询这个帖子以外的前五部帖子
        //得到的是一个list
        List<PostBean> otherpost = pdao.findOtherPost(postitle);
        //设置属性
        req.setAttribute("otherpost1", otherpost);
        req.setAttribute("commentlist",commentList);
        //页面用循环出来

        req.getRequestDispatcher("user/topicsDetails.jsp").forward(req, resp);


    }
}
