<%--
Created by IntelliJ IDEA.
User: LN
Date: 2019/4/28
Time: 11:29
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人账户</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">

</head>
<body>
<div style="margin-top: 10px;margin-left: 20px;width: 90%;height: 100%;">
    <form action="updateUserLoginInfo" method="post" id="myForm" onsubmit="eqlue()">
        <c:forEach items="${requestScope.userlist}" var="user">
            <div class="form-group">
                <label style="font-size: 18px"><strong>用户名</strong></label>
                <input type="text" name="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" readonly="readonly" value="${user.user_name}">
                <small id="nameHelp" class="form-text text-muted">其他人可以用@+用户名提及您</small>
            </div>
            <div class="form-group">
                <label style="font-size: 18px"><strong>设置新密码</strong></label>
                <input type="password" name="Newpassword" class="form-control" id="exampleInputEmail3" aria-describedby="emailHelp">
                <small id="emailHelp1" class="form-text text-muted">永不公开显示</small>
            </div>
            <div class="form-group">
                <label style="font-size: 18px"><strong>确定密码</strong></label>
                <input type="password" name="Newpassword1" class="form-control" id="exampleInputEmail4" aria-describedby="emailHelp">
                <small id="emailHelp2" class="form-text text-muted">永不公开显示</small>
            </div>
            <div class="form-group">
                <button type="submit">提交</button>
            </div>
        </c:forEach>
    </form>
</div>
<div style="text-align: center;margin-top: 100px">
    <h6>长沙市薇恩集团 VN社区 版权所有 ©</h6>
</div>


<script>
    function eqlue(){
        var pw1 = document.getElementById("exampleInputEmail3").value;
        var pw2 = document.getElementById("exampleInputEmail4").value;
        if (pw1 != pw2){
            alert("两次密码输入不一致,请重新输入");
            return false;
        }else{
            alert("修改成功");
        }
    }

</script>

</body>