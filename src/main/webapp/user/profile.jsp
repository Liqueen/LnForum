<%--
  Created by IntelliJ IDEA.
  User: LN
  Date: 2019/4/28
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body>
<div style="margin-top: 10px;margin-left: 20px;width: 90%;height: 100%;">
    <form action="../editUserInfo" method="post">

    <%--<c:if test="${userlist.sex} == null">
        <div class="form-group">
            <label style="font-size: 18px"><strong>性别</strong></label><br>
            <input type="radio" name="sex" value="1" checked>男
            <input type="radio" name="sex" value="2" >女
        </div>
    </c:if>
    <c:if test="${userlist.sex=='1'}">
        <div class="form-group">
        <label style="font-size: 18px"><strong>性别</strong></label><br>
        <input type="radio" name="sex" value="1" checked>男
        <input type="radio" name="sex" value="2">女
    </div>
    </c:if>
        <c:if test="${userlist.sex=='2'}">
        <div class="form-group">
            <label style="font-size: 18px"><strong>性别</strong></label><br>
            <input type="radio" name="sex" value="1" >男
            <input type="radio" name="sex" value="2" checked>女
        </div>
    </c:if>--%>

        <div class="form-group">
            <label style="font-size: 18px"><strong>出生年月日</strong></label>
            <input type="text" name="birthday" value="${userlist.birthday}" class="form-control" placeholder="请填写如下格式:如2008-12-09">
        </div>

        <div class="form-group">
            <label style="font-size: 18px"><strong>地址</strong></label>
            <input type="text" name="address" value="${userlist.address}" class="form-control" id="exampleInputPassword1" placeholder="请输入您的地址">
        </div>
        <div class="form-group">
    <label style="font-size: 18px"><strong>网址</strong></label>
    <input type="email" name="EA" class="form-control" id="exampleInputEmail2" aria-describedby="emailHelp" value="1693982052@qq.com">
</div>

        <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1">
            <label class="form-check-label" for="exampleCheck1">Check me out</label>
        </div>
        <button type="submit" class="btn btn-primary">保存</button>
        <button type="button" class="btn btn-outline-danger">删除我的账号</button>

    </form>

</div>
<div style="text-align: center;margin-top: 100px">
    <h6>长沙市薇恩集团 VN社区 版权所有 ©</h6>
</div>
</body>
</html>