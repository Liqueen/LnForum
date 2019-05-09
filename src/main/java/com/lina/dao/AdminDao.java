package com.lina.dao;

import com.lina.bean.AdminBean;
import com.lina.bean.PostBean;
import com.lina.bean.UserBean;
import com.lina.commons.JdbcUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDao {

    //管理员登录
    public boolean FindAdmin(AdminBean adminBean){
        boolean flag = false;
        DataSource ds = JdbcUtil.getDateSource();
        QueryRunner run = new QueryRunner(ds);
        ResultSetHandler<AdminBean> h = new BeanHandler<AdminBean>(AdminBean.class);
        String sql = "select * from admininfo where admin_name = ? and admin_email = ?";
        AdminBean adminBean1 = null;

        try {
            adminBean1 = run.query(sql,h,adminBean.getAdmin_name(),adminBean.getAdmin_email());
            if (adminBean1!=null){
                flag = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag;
    }

    //查询所有用户信息
    public List<UserBean> findUser() {
        List<UserBean> userList = new ArrayList<UserBean>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        conn = JdbcUtil.getConnection();
        String sql="select user_id,user_name,email,password from userinfo where sex IS NULL";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()){
                UserBean userBean = new UserBean();
                userBean.setUser_id(rs.getInt("user_id"));
                userBean.setUser_name(rs.getString("user_name"));
                userBean.setEmail(rs.getString("email"));
                userBean.setPassword(rs.getString("password"));

                userList.add(userBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }


    //查询所有帖子信息
    public List<PostBean> findPost() {
        List<PostBean> postList = new ArrayList<PostBean>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        conn = JdbcUtil.getConnection();
        String sql="select post_id,user_name,post_type,post_title,post_content,post_state\n" +
                "from postinfo p inner join userinfo u \n" +
                "on p.user_id = u.user_id ";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()){
                PostBean postBean = new PostBean();
                postBean.setPost_id(rs.getInt("post_id"));
                postBean.setUser_name(rs.getString("user_name"));
                postBean.setPost_type(rs.getString("post_type"));
                postBean.setPost_title(rs.getString("post_title"));
                postBean.setPost_content(rs.getString("post_content"));
                postBean.setPost_state(rs.getInt("post_state"));
                postList.add(postBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postList;
    }

    //根据id删除帖子
    public int deletePostById(PostBean postBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rs = -1;

        conn = JdbcUtil.getConnection();
        String sql = "delete from postinfo where post_id=? ";

        try {
            pstmt = conn.prepareStatement(sql);
            //替换值
            pstmt.setInt(1, postBean.getPost_id());
            rs = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    //修改用户的状态值
    public int updateState(UserBean user) {

        Connection conn = null;
        PreparedStatement ps = null;
        int rs = -1;

        conn = JdbcUtil.getConnection();
        String sql = "update userinfo set sex=? where user_id=?";

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, "1");
            ps.setInt(2,user.getUser_id());

            rs = ps.executeUpdate();

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return rs;
    }




 /*  public static void main(String[] args) {
        AdminDao adao = new AdminDao();
        List<UserBean> userList = adao.findUser();
       for (int i = 0; i <userList.size() ; i++) {
           System.out.println(userList.get(i).getUser_id());
           System.out.println(userList.get(i).getUser_name());
       }
    }*/

}
