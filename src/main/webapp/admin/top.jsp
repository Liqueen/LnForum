<%--
  Created by IntelliJ IDEA.
  User: LN
  Date: 2019/4/28
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>导航栏</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style type="text/css">
        html
        {
            height:100%;
            margin:0;
        }
        body
        {
            height:100%;
            margin:0;
        }


    </style>
    <script src="../js/echarts.min.js"></script>
</head>
<%
    HttpSession session1 = request.getSession();
    String name= (String)session1.getAttribute("name");
%>
<body>
<div style="height: 68px;width: 100%;box-shadow: 0 3px 5px -1px #4f84ba; background-color: #c2d1d1;">
    <!--  logo  -->
    <div id="logo" style="float: left;margin-left: 10px; height: 100%;width:260px">
        <div style="float: left;height:100%;width:20%;margin-top: 10px;margin-left: 20px">
            <img src="../img/logo1.png" style="width:100%;" />
        </div>
        <div style="margin-top: 12%;">
            <font size="5" color="#f0ffff" >&nbsp;&nbsp;VN社区后台管理</font>
        </div>
    </div>
    <!--  管理员信息  -->
    <div  style="float: right;margin-right: 30px;height: 100%;width: 200px; ">
        <div style="float: left;border-radius: 50%;height: 80%;width: 60px;overflow: hidden;margin-top: 10px">
            <img src="../img/1556161555.png" style="width:100%;height:100%;"/>
        </div>
        <div style="float: right;margin-top: 15%;margin-right: 20px"><font size="3">
            <%
                if (name != null){
            %>
            <%= name%>
            <!--<a href="../deleteUserLogin">注销</a>-->
            <%
                }
            %>
        </font></div>
    </div>
</div>
</body>
</html>
