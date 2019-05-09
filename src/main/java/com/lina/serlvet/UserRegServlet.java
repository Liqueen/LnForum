package com.lina.serlvet;

import com.lina.bean.UserBean;
import com.lina.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(urlPatterns = {"/userReg.do"})
public class UserRegServlet extends HttpServlet {

    UserDao udao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入用户注册.........");
        req.setCharacterEncoding("utf-8");
        //获取参数
        String email = req.getParameter("email");
        String name = req.getParameter("username");
        String pw = req.getParameter("password");
        //将获得的数据封装在对象里面
        UserBean userBean = new UserBean();
        userBean.setUser_name(name);
        userBean.setEmail(email);
        userBean.setPassword(pw);
        //调用方法
        int rs = udao.addUser(userBean);
        //页面跳转
        if (rs == 1){
            resp.sendRedirect("first.do");
        }else{
            resp.sendRedirect("error.jsp");
        }

    }
}
