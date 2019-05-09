package com.lina.bean;

import javax.xml.crypto.Data;

public class PostBean {

    private int post_id;
    private int user_id;
    private String user_name;
    private String post_type; //版块名称
    private String post_title;
    private String post_content;
    private int post_state;  //帖子状态

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }


    public String getPost_title() {
        return post_title;
    }

    public void setPost_title(String post_title) {
        this.post_title = post_title;
    }

    public String getPost_content() {
        return post_content;
    }

    public void setPost_content(String post_content) {
        this.post_content = post_content;
    }

    public int getPost_state() {
        return post_state;
    }

    public void setPost_state(int post_state) {
        this.post_state = post_state;
    }

    public String getPost_type() {
        return post_type;
    }

    public void setPost_type(String post_type) {
        this.post_type = post_type;
    }
}
