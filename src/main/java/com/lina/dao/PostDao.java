package com.lina.dao;

import com.lina.bean.CommentBean;
import com.lina.bean.PostBean;
import com.lina.commons.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    //查询所有帖子
    public List<PostBean> findPost() {
        List<PostBean> postList = new ArrayList<PostBean>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        conn = JdbcUtil.getConnection();
        String sql="select post_id,user_name,post_title,post_content,post_state\n" +
                "from postinfo p inner join userinfo u \n" +
                "on p.user_id = u.user_id " +
                "order by post_id desc limit 7";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()){
                PostBean postBean = new PostBean();
                postBean.setPost_id(rs.getInt("post_id"));
                postBean.setUser_name(rs.getString("user_name"));
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

    //根据帖子标题查询帖子
    public PostBean findPostByTitle(String postitle) {
        PostBean postBean1 = new PostBean();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        conn = JdbcUtil.getConnection();
        String sql = "select * from postinfo p,userinfo u where  p.user_id=u.user_id and p.post_title=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, postitle);
            rs = pstmt.executeQuery();

            while(rs.next()){
                postBean1.setUser_name(rs.getString("user_name"));
                postBean1.setPost_id(rs.getInt("post_id"));
                postBean1.setPost_title(rs.getString("post_title"));
                postBean1.setPost_content(rs.getString("post_content"));
                postBean1.setPost_state(rs.getInt("post_state"));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return postBean1;
    }

    //根据用户名查询帖子(活动页面)
    //根据帖子标题查询帖子
    public List<PostBean> findPostByUserName(String username) {
        List<PostBean> postBeanList = new ArrayList<PostBean>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        conn = JdbcUtil.getConnection();
        String sql = "select * from postinfo p,userinfo u where p.user_id = u.user_id and u.user_name=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            while(rs.next()){
                PostBean postBean1 = new PostBean();
                postBean1.setUser_name(rs.getString("user_name"));
                postBean1.setPost_title(rs.getString("post_title"));
                postBean1.setPost_content(rs.getString("post_content"));
                postBean1.setPost_type(rs.getString("post_type"));
                postBean1.setPost_state(rs.getInt("post_state"));
                postBeanList.add(postBean1);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return postBeanList;
    }


    //查询其他帖子
    public List<PostBean> findOtherPost(String postitle) {
        List<PostBean> otherpost = new ArrayList<PostBean>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        conn = JdbcUtil.getConnection();
        String sql="select * from postinfo where post_title not in (?) " +
                "and post_state = 1 " +
                "order by post_id desc limit 5";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,postitle);
            rs = pstmt.executeQuery();

            while(rs.next()){
                PostBean postBean1 = new PostBean();
                postBean1.setPost_title(rs.getString("post_title"));
                postBean1.setPost_content(rs.getString("post_content"));
                postBean1.setPost_state(rs.getInt("post_state"));
                otherpost.add(postBean1);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return otherpost;
    }

    //增加帖子
    public int addPost(PostBean postBean){
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rs = -1;

        try {
            //连接驱动
            conn = JdbcUtil.getConnection();
            String sql="insert into postinfo(post_title,post_type,post_content,user_id,post_state) values(?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            //替换值
            pstmt.setString(1,postBean.getPost_title());
            pstmt.setString(2,postBean.getPost_type());
            pstmt.setString(3,postBean.getPost_content());
            pstmt.setInt(4,postBean.getUser_id());
            pstmt.setInt(5,postBean.getPost_state());

            rs = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }


    //增加回复
    public int addComment(CommentBean commentBean){
        Connection conn = null;
        PreparedStatement pstmt = null;
        int rs = -1;

        try {
            //连接驱动
            conn = JdbcUtil.getConnection();
            String sql="insert into commentinfo(content,user_id,post_id) values(?,?,?)";
            pstmt = conn.prepareStatement(sql);
            //替换值
            pstmt.setString(1,commentBean.getContent());
            pstmt.setInt(2,commentBean.getUser_id());
            pstmt.setInt(3,commentBean.getPost_id());
            rs = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    //根据帖子id查询帖子回复
    public List<CommentBean> findCommenByTitle(int postid) {
        List<CommentBean> commentList = new ArrayList<CommentBean>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        conn = JdbcUtil.getConnection();
        String sql = "select * from commentinfo where post_id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, postid);
            rs = pstmt.executeQuery();

            while (rs.next()){
                CommentBean commentBean = new CommentBean();
                commentBean.setUser_id(rs.getInt("user_id"));
                commentBean.setPost_id(rs.getInt("post_id"));
                commentBean.setContent(rs.getString("content"));
                commentList.add(commentBean);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return commentList;
    }

//    public static void main(String[] args) {
//        PostDao p = new PostDao();
//        CommentBean commentBean = p.findCommenByTitle(15);
//        System.out.println(commentBean.getContent());
//    }

}
