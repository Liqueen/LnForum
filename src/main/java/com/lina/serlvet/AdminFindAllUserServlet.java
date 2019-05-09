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

@WebServlet(urlPatterns = {"/adminFindAllUser"})
public class AdminFindAllUserServlet extends HttpServlet {

    AdminDao adao = new AdminDao();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("进入管理员用户管理.....");
        req.setCharacterEncoding("utf-8");

        List<UserBean> userList = adao.findUser();

        req.setAttribute("userlist",userList);

        req.getRequestDispatcher("admin/userCotrol.jsp").forward(req,resp);

    }
}

