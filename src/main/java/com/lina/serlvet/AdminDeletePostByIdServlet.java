package com.lina.serlvet;

import com.lina.bean.PostBean;
import com.lina.dao.AdminDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/deletePost"})
public class AdminDeletePostByIdServlet extends HttpServlet {

    AdminDao adao = new AdminDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        int postid = Integer.parseInt(req.getParameter("postId"));

        PostBean postBean = new PostBean();
        postBean.setPost_id(postid);
        int rs = adao.deletePostById(postBean);

        if (rs == 1){
            resp.sendRedirect("adminFindAllpost");
        }

    }
}
