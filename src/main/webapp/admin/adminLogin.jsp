<%--
  Created by IntelliJ IDEA.
  User: LN
  Date: 2019/4/29
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员登录</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<style type="text/css">
    body{
        margin: 0;
        padding: 0;
        font-family: sans-serif;
        background: #34495e;
        background-color: rgba(0,0,0,0.5);
    }
    .box{
        width: 360px;
        padding: 40px;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%);
        background: #191919;
        background-color: rgba(0,0,0,0.3);
        text-align: center;
    }
    .box h1{
        color: white;
        text-transform: uppercase;
        font-weight:500;
    }
    .box input[type = "text"],
    .box input[type = "password"]{
        border:0;
        background: none;
        display: block;
        margin: 20px auto;
        text-align: center;
        border: 2px solid #3498db;
        padding:10px 10px;
        width:200px;
        outline:none;
        color: white;
        border-radius: 24px;
        transition: 0.25s;
    }
    .box input[type = "text"]:focus,
    .box input[type = "password"]:focus{
        width:280px;
        border-color: #2ecc71;
    }
    .box button[type = "submit"]{
        border:0;
        background: none;
        display: block;
        margin: 20px auto;
        text-align: center;
        border: 2px solid #2ecc71;
        padding:10px 40px;
        outline:none;
        color: white;
        border-radius: 24px;
        transition: 0.25s;
        cursor:pointer;
    }
    .box button[type = "submit"]:hover{
        background: #2ecc71;
    }
</style>
<body>
<form class="box" action="../adminLogin.do" method="post">
    <h1>Login</h1>
    <input type="text" name="name" placeholder="name"/>
    <input type="text" name="email" placeholder="Email"/>
    <button type="submit" name="but" value="Login">Login</button>
</form>


</body>
</html>
