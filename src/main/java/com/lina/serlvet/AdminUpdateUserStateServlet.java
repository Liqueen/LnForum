package com.lina.serlvet;

import com.lina.bean.UserBean;
import com.lina.dao.AdminDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/adminUpdateUserState"})
public class AdminUpdateUserStateServlet extends HttpServlet {

    AdminDao adao = new AdminDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        req.setCharacterEncoding("utf-8");
        int userid = Integer.parseInt(req.getParameter("userid"));

        UserBean userBean = new UserBean();
        userBean.setUser_id(userid);

        //修改用户状态值
        int rs = adao.updateState(userBean);

        resp.sendRedirect("adminFindAllUser");

    }
}

