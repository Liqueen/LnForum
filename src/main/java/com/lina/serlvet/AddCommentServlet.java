package com.lina.serlvet;

import com.lina.bean.CommentBean;
import com.lina.dao.PostDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/AddComment.do"})
public class AddCommentServlet extends HttpServlet {

    PostDao pdao = new PostDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("进入增加评论......");
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        int userid = (int)session.getAttribute("userid");
        int postid = (int)session.getAttribute("postid");
        String content = req.getParameter("content");

        CommentBean commentBean = new CommentBean();
        commentBean.setUser_id(userid);
        commentBean.setPost_id(postid);
        commentBean.setContent(content);
        int rs = pdao.addComment(commentBean);

        if(rs == 1){
            resp.sendRedirect("first.do");
        }else{
            resp.sendRedirect("user/error.jsp");
        }

    }
}
