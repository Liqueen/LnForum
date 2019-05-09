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
import java.net.HttpCookie;
import java.util.List;

@WebServlet(urlPatterns = {"/findUserOtherInfo"})
public class FindUserOtherInfoServlet extends HttpServlet {
    UserDao udao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("进入查询用户其他信息");
        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        String name = (String)session.getAttribute("name");

        List<UserBean> userBeanList = udao.FindUserOtherInfo(name);

        if (userBeanList.size() != 0) {
            req.setAttribute("userlist", userBeanList);
            req.getRequestDispatcher("user/profile.jsp").forward(req, resp);
        } else {
            req.setAttribute("userlist", null);
            req.getRequestDispatcher("user/profile.jsp").forward(req, resp);
        }
    }


}