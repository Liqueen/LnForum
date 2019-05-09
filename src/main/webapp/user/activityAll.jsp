<%--
  Created by IntelliJ IDEA.
  User: LN
  Date: 2019/4/28
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>所有活动</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body>
<div style="width: 85%;height: 100%;margin: auto">
    <form action="" method="post">
        <table  class="table table-striped">
            <thead>
            <tr>
                <th scope="col">编号</th>
                <th scope="col">帖子标题</th>
                <th scope="col">帖子内容</th>
                <th scope="col">帖子类型</th>
                <th scope="col">帖子状态</th>
            </tr>
            </thead>
            <tbody>
            <% int i=1;%>
           <c:forEach items="${requestScope.post}" var="post">
            <tr>
                <th scope="row"><%=i++%></th>
                <td>${post.post_title}</td>
                <td>${post.post_content}</td>
                <td>${post.post_type}</td>
                <td>${post.post_state}
                    <c:if test="${post.post_state} == 1">已审核</c:if>
                    <c:if test="${post.post_state} == 0">未审核</c:if>
                </td>
            </tr>
           </c:forEach>
            </tbody>
        </table>
    </form>
</div>
<div style="text-align: center;margin-top: 100px">
    <h6>长沙市薇恩集团 VN社区 版权所有 ©</h6>
</div>
</body>
</html>