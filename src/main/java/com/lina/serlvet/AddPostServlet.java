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

@WebServlet(urlPatterns = {"/addPost.do"})
public class AddPostServlet extends HttpServlet {

    PostDao pdao = new PostDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("进入增加帖子......");
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        int userid = (int)session.getAttribute("userid");
        String posTitle = req.getParameter("posTitle");
        String type = req.getParameter("type");
        String postContent = req.getParameter("postContent");
        int state = 0;

        PostBean postBean = new PostBean();
        postBean.setPost_title(posTitle);
        postBean.setPost_type(type);
        postBean.setPost_content(postContent);
        postBean.setPost_state(state);
        postBean.setUser_id(userid);

        int rs = pdao.addPost(postBean);

        if(rs == 1){
            resp.sendRedirect("first.do");
        }else{
            resp.sendRedirect("user/error.jsp");
        }

    }
}
