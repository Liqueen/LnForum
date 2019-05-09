<%--
  Created by IntelliJ IDEA.
  User: LN
  Date: 2019/4/28
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>左部导航</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style type="text/css">
        html{
            width: 190px;
            height: 100%;
        }
        body{
            width: 100%;
            height: 100%;
        }
        div{
            width: 100%;
            height: 100%;
            float: left;
            background-color: #34495e;
        }
        li{
            margin: 15px;
            height: 50px;
            width: 170px;
        }
        .active{
            margin-left: 10px;
            width: 160px;
        }
    </style>
    <script src="../js/echarts.min.js"></script>
</head>
<body>

<div>
    <ul class="nav nav-pills nav-stacked">
        <li><a href="../adminFindAllUser" target="right">用户管理</a></li><!--userCotrol.jsp-->
        <li><a href="../adminFindAllpost" target="right">帖子管理</a></li><!--postCotrol.jsp-->
    </ul>
</div>
</body>
</html>
