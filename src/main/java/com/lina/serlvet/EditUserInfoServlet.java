package com.lina.serlvet;

import com.sun.xml.internal.ws.transport.http.HttpAdapter;
import com.lina.bean.CommentBean;
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

@WebServlet(urlPatterns = {"/editUserInfo"})
public class EditUserInfoServlet extends HttpServlet {

    UserDao udao = new UserDao();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("进入用户个人其他信息修改......");
        req.setCharacterEncoding("utf-8");

        HttpSession session = req.getSession();
        String name = (String)session.getAttribute("name");
        //查询个人信息
        List<UserBean> userBeanList = udao.FindUserOtherInfo(name);

        String sex = req.getParameter("sex");
        String birthday = req.getParameter("birthday");
        String address = req.getParameter("address");

        UserBean userBean = new UserBean();
        userBean.setSex(sex);
        userBean.setBirthday(birthday);
        userBean.setAddress(address);

        if (userBeanList.size() == 0) {
            int rs = udao.addUserInfo(userBean);
            if(rs == 1){

                req.getRequestDispatcher("user/index.jsp").forward(req,resp);
            }else{
                resp.sendRedirect("user/error.jsp");
            }
        }else{
            int rs = udao.updateUser(userBean);
            if(rs == 1){
                req.getRequestDispatcher("user/index.jsp").forward(req,resp);
            }else{
                resp.sendRedirect("user/error.jsp");
            }
        }


    }
}
