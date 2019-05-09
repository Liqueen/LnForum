package com.lina.serlvet;

import com.lina.bean.UserBean;
import com.lina.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/findUserByName"})
public class FindUserByNameServlet extends HttpServlet {

    UserDao udao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("进入通过用户名查询用户登录信息....");
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        String name = (String)session.getAttribute("name");

        List<UserBean> userList = udao.findUserByName(name);
        req.setAttribute("userlist",userList);

        req.getRequestDispatcher("user/account.jsp").forward(req,resp);

    }
}
