package com.lina.dao;

import com.lina.bean.UserBean;
import com.lina.commons.JdbcUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserPageDAO {

    public void f(String ...str) {

    }

    public int queryRows() {

        String sql = "select count(user_id) from userinfo";
        Connection cn = JdbcUtil.getConnection();
        QueryRunner qr = new QueryRunner();

        ResultSetHandler<Integer> rsh = new ResultSetHandler<Integer>() {
            @Override
            public Integer handle(ResultSet rs) throws SQLException {
                if (rs.next()) {
                    return rs.getInt(1);
                }
                return -1;
            }
        };

        try {
            Integer n = qr.query(cn, sql, rsh);
            return n;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if(cn!=null) {
                try {
                    cn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return -1;
    }

    public List<UserBean> queryCustomer(int pageIndex, int pageRows) {

        int page = (pageIndex - 1) * pageRows;   //总页数=索引-1*每行的行数
        String sql = "select * from userinfo  limit  " + page + ", " + pageRows;
        Connection cn = JdbcUtil.getConnection();
        QueryRunner qr = new QueryRunner();
        try {
            ResultSetHandler<List<UserBean>> rsh =
                    new BeanListHandler<UserBean>(UserBean.class);
            List<UserBean> list = qr.query(cn, sql, rsh);
            return list;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if(cn!=null) {
                try {
                    cn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return null;


    }

}
