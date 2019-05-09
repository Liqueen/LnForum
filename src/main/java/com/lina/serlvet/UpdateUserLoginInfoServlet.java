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

@WebServlet(urlPatterns = {"/updateUserLoginInfo"})
public class UpdateUserLoginInfoServlet extends HttpServlet {

    UserDao udao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        HttpSession session = req.getSession();
        String name = (String)session.getAttribute("name");
        String pw =  req.getParameter("Newpassword1");

        UserBean userBean = new UserBean();
        userBean.setUser_name(name);
        userBean.setPassword(pw);

        int rs = udao.updateUser(userBean);

        if (rs == 1){
            resp.sendRedirect("findUserByName");
        }else{
            resp.sendRedirect("user/error");
        }

    }
}
