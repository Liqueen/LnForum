<%--
  Created by IntelliJ IDEA.
  User: LN
  Date: 2019/4/28
  Time: 12:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>帖子管理页面</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body>
<div  style="float: left;width: 100%;height: 100%">
    <nav class="navbar navbar-light bg-light">
        <a class="navbar-brand" style="color: grey"><i>帖子管理</i></a>
    </nav>
    <table class="table table-hover">
        <thead>
        <tr>
            <th scope="col">序号</th>
            <th scope="col">帖子编号</th>
            <th scope="col">发帖人</th>
            <th scope="col">帖子类型</th>
            <th scope="col">帖子主题</th>
            <th scope="col">帖子内容</th>
            <th scope="col">编辑</th>
        </tr>
        </thead>
        <tbody>
<%int i=1; %>
<c:forEach var="post" items="${requestScope.postlist}" >
        <tr>
            <th scope="row"><%=i++ %></th>
            <td>${post.post_id}</td>
            <td>${post.user_name}</td>
            <td>${post.post_type}</td>
            <td>${post.post_title}</td>
            <td>${post.post_content}</td>

            <td scope="col">
                <a href="deletePost?postId=${post.post_id}" onclick="return confirm('确定删除此贴吗?')">delete</a>
            </td>
        </tr>
</c:forEach>

        </tbody>
    </table>
</div>
</body>
</html>
