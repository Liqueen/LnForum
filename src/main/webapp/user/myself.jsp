<%--
  Created by IntelliJ IDEA.
  User: LN
  Date: 2019/4/28
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人中心页面</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">

    <link rel="stylesheet" href="../css/myself.css">
</head>
<body style="background-color: #e3e7f1">
<%
    HttpSession session1 = request.getSession();
    String aa= (String)session1.getAttribute("name");
%>
<!--  标题栏  -->
<div style="height: 100px;width: 100%;margin: 20px  auto 5px;box-shadow: 0 3px 5px -1px #41374f; background-color: #494ca2;">
    <!--  logo  -->
    <div id="logo" style="float: left;margin-top: 10px;margin-left: 150px">
        <img src="../img/logo1.png" height="80" width="80"/>
        <font size="5" color="#f0ffff">VN社区</font>
    </div>
    <!--  搜索  -->
    <div style="float: left;margin-top: 10px;margin-left: 50px;margin-top: 30px">
        <div class="input-group mb-3">
            <input type="text" class="form-control" placeholder="站内搜索" aria-label="站内搜索" aria-describedby="basic-addon2" style="width: 300px">
            <div class="input-group-append">
                <button class="btn btn-outline-secondary" type="button">搜索</button>
            </div>
        </div>
    </div>
    <!--  登录注册  -->
    <!--<div  style="float: right;margin-top: 40px;margin-right: 160px">-->
        <!--<button class="btn btn-primary" type="button" onclick="openLogin()">登录</button>-->
        <!--&nbsp&nbsp|&nbsp&nbsp-->
        <!--<button class="btn btn-primary" type="button">注册</button>-->
    <!--</div>-->
</div>

<div style="height: 700px;width: 85%;margin: 0 auto;">
    <!--  导航栏  -->
    <div  id="top" style="height:100px;width: 100%;box-shadow: 0 3px 5px -1px #1f5e64;">
        <div style="float: left; height:50px;width: 100%;">
            <img id="userImg" src="../img/1556161555.png">
            <span id="userName">
                <%= aa%>
            </span>
        </div>
        <div style="float: left;margin-top: -20px" id="userMsg">
            <ul>
                <li><span>加入时间:</span>2019-04-22</li>
                <li><span>最后发帖:</span>2019-03-03</li>
                <li><span>最后活动:</span>10分钟</li>
                <li><span>浏览量:</span>8</li>
                <li><span>信任等级:</span>初级用户</li>
                <li><span>邮箱:</span>1693982052@qq.com</li>
            </ul>
        </div>
    </div>
    <div style="height: 100%;width: 100%;">
        <div style="height: 40px;margin-top: 10px">
            <button type="button" id="activity" class="btn btn-outline-info">
                <a href="../findPostByUserName.do" target="bottom" style="text-decoration: none">个人帖子</a><!--activityAll.jsp-->
            </button>&nbsp;&nbsp;
            <button type="button" id="account" class="btn btn-outline-info">
                <a href="preferences.jsp" target="bottom" style="text-decoration: none">设置</a>
            </button>&nbsp;&nbsp;
        </div>
    </div>
</div>

<script>





</script>
</body>

</html>