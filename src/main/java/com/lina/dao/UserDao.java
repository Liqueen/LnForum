package com.lina.dao;

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

public class UserDao {

    //用户注册(增加信息)
    public int addUser(UserBean userBean){
        int rs = -1;
        Connection conn = JdbcUtil.getConnection();
        PreparedStatement pstmt = null;
        String sql = "insert into userinfo(user_name,email,`password`) values(?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userBean.getUser_name());
            pstmt.setString(2,userBean.getEmail());
            pstmt.setString(3,userBean.getPassword());
            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    //查询用户其他信息
    public List<UserBean> FindUserOtherInfo(String username){
        List<UserBean> userlist=new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        conn = JdbcUtil.getConnection();
        String sql = "select sex,birthday,address from userinfo where user_name=? ";
        try {
            ps = conn.prepareStatement(sql);
            //替换值
            ps.setString(1,username);
            rs = ps.executeQuery();

            while(rs.next()){
                UserBean user = new UserBean();
                user.setSex(rs.getString("sex"));
                user.setBirthday(rs.getString("birthday"));
                user.setAddress(rs.getString("address"));
                userlist.add(user);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return userlist;
    }

    //添加用户其他信息
    public int addUserInfo(UserBean userBean){
        int rs = -1;
        Connection conn = JdbcUtil.getConnection();
        PreparedStatement pstmt = null;
        String sql = "insert into userinfo(sex,birthday,`address`) values(?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,userBean.getSex());
            pstmt.setString(2,userBean.getBirthday());
            pstmt.setString(3,userBean.getAddress());
            rs = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    //修改用户其他信息
    public int updateUser(UserBean userBean) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rs = -1;

        conn = JdbcUtil.getConnection();
        String sql = "update userinfo set password = ? where user_name=? ";

        try {
            pstmt = conn.prepareStatement(sql);
            //替换值
            pstmt.setString(1, userBean.getPassword());
            pstmt.setString(2, userBean.getUser_name());
            rs = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }


//    public UserBean FindIdByName(String name){
//        UserBean userBean = new UserBean();
//        Connection conn = null;
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//        conn = JdbcUtil.getConnection();
//        String sql = "select user_id from userinfo where user_name=?";
//        try {
//            ps = conn.prepareStatement(sql);
//            //替换值
//            ps.setString(1,name);
//            rs = ps.executeQuery();
//
//            userBean.setUser_id(rs.getInt("user_id"));
//        } catch (SQLException e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//        return userBean;
//    }

    //根据用户名,密码查询用户信息
    //用户登录
    public List<UserBean> FindUser(UserBean userBean){
            List<UserBean> userlist=new ArrayList<>();
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            conn = JdbcUtil.getConnection();
            String sql = "select * from userinfo where user_name=? and password=? and sex is null ";
            try {
                ps = conn.prepareStatement(sql);
                //替换值
                ps.setString(1,userBean.getUser_name());
                ps.setString(2,userBean.getPassword());
                rs = ps.executeQuery();

                while(rs.next()){
                    UserBean user = new UserBean();
                    user.setUser_id(rs.getInt("user_id"));
                    user.setUser_name(rs.getString("user_name"));
                    user.setPassword(rs.getString("password"));
                    userlist.add(user);
                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return userlist;
        }

    //根据登录用户名查找用户信息,点击(账号)显示登录用户的信息
    public List<UserBean> findUserByName(String name) {
        List<UserBean> list=new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        conn = JdbcUtil.getConnection();
        String sql = "select * from userinfo where user_name=? ";

        try {
            ps = conn.prepareStatement(sql);
            //替换值
            ps.setString(1,name);
            rs = ps.executeQuery();

            while(rs.next()){
                UserBean user = new UserBean();
                user.setUser_name(rs.getString("user_name"));
                user.setPassword(rs.getString("password"));
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    //修改用户登录信息(用户修改密码)
    public int UpdateLoginInfo(UserBean userBean) {
        Connection conn = null;
        PreparedStatement ps = null;
        int rs = -1;
        conn = JdbcUtil.getConnection();
        String sql = "update userinfp set password=? where user_name=?";
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1,userBean.getPassword());
            ps.setString(2, userBean.getUser_name());
            rs = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }



}
