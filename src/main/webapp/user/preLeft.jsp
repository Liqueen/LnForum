<%--
  Created by IntelliJ IDEA.
  User: LN
  Date: 2019/4/28
  Time: 11:46
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
        body{
            width: 190px;
            height: 600px;
        }
        div{
            width: 100%;
            height: 100%;
            float: left;
            margin-left: 110px;
            background-color: #c6cbef;
        }
        li{
            margin: 15px;
            height: 50px;
            width: 170px;
        }
    </style>
    <script src="../js/echarts.min.js"></script>
</head>
<body>
<div>
    <ul class="nav nav-pills nav-stacked">
        <li><a href="../findUserByName" target="preRight">账号</a></li><!--account.jsp-->
    </ul>
</div>

</body>
</html>
