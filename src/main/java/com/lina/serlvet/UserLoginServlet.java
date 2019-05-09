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
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/userLogin.do"})
public class UserLoginServlet extends HttpServlet {

    UserDao udao = new UserDao();
    PostDao pdao = new PostDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        System.out.println("进入用户登录....");
        req.setCharacterEncoding("utf-8");
        //获得参数对象
        String name =  req.getParameter("name");
        String password = req.getParameter("password");
        //绑定数据到对象中
        UserBean userBean = new UserBean();
        userBean.setUser_name(name);
        userBean.setPassword(password);

        List<UserBean> list = udao.FindUser(userBean);
        int id = 0;
        for (int i = 0; i <list.size() ; i++) {
            id = list.get(i).getUser_id();
        }

        if (list.size()>0){    //list不为空则表示登录成功

            //查询所有帖子
            List<PostBean> postlist = pdao.findPost();
            req.setAttribute("postlist",postlist);

            //获取会话对象,将页面的值保存到session中
            HttpSession session = req.getSession();
            session.setAttribute("userid",id);
            session.setAttribute("name",name);
            session.setAttribute("pw",password);
            //重定向到index.jsp页面
            req.getRequestDispatcher("user/index.jsp").forward(req,resp);
        }else{
            resp.sendRedirect("user/error.jsp");
        }






    }
}