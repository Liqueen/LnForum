package com.lina.serlvet;

import com.lina.bean.AdminBean;
import com.lina.bean.UserBean;
import com.lina.dao.AdminDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/adminLogin.do"})
public class AdminLoginServlet extends HttpServlet {

    AdminDao adao = new AdminDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("进入管理员登录....");
        req.setCharacterEncoding("utf-8");
        //获得参数对象
        String name =  req.getParameter("name");
        String email = req.getParameter("email");

       //绑定数据到对象中
        AdminBean adminBean = new AdminBean();
        adminBean.setAdmin_name(name);
        adminBean.setAdmin_email(email);

        boolean bool = adao.FindAdmin(adminBean);

        if (bool == true){
            HttpSession session = req.getSession();
            session.setAttribute("name",name);
            //重定向到index.jsp页面
            resp.sendRedirect("admin/main.jsp");
        }else{
            resp.sendRedirect("user/error.jsp");
        }
    }
}
