<%--
  Created by IntelliJ IDEA.
  User: LN
  Date: 2019/4/28
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false"  language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户管理页面</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body>
<div  style="float: left;width: 100%;height: 100%">
    <nav class="navbar navbar-light bg-light">
        <a class="navbar-brand" style="color: grey"><i>用户管理</i></a>
    </nav>
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">序号</th>
            <th scope="col">用户编号</th>
            <th scope="col">用户名称</th>
            <th scope="col">用户邮箱</th>
            <th scope="col">用户密码</th>
            <th scope="col">用户详情</th>
        </tr>
        </thead>
        <tbody>
        <%int i=1; %>
<c:forEach var="user" items="${requestScope.userlist}" >
        <tr>
            <th scope="row"><%=i++ %></th>
            <td>${user.user_id}</td>
            <td>${user.user_name}</td>
            <td>${user.email}</td>
            <td>${user.password}</td>
            <td scope="col">
                <a href="adminUpdateUserState?userid=${user.user_id} " target="right"
                   onclick="return comfirm('确定加入黑名单吗?')">加入黑名单</a>
            </td>
        </tr>
</c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
