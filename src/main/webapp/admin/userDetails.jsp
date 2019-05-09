<%--
  Created by IntelliJ IDEA.
  User: LN
  Date: 2019/5/3
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户详情</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <link rel="stylesheet" href="../css/userDetails.css">
</head>
<body>
<div style="width: 100%;height: auto;margin: auto;">
    <table align="center" style="width: 80%;height: 200px; margin-top: 20px;background-color: #c6cbef">
        <tr  style="font-size: 18px">
            <td colspan="4" align="center"><strong><i>用户个人信息</i></strong></td>
        </tr>
        <tr  style="font-size: 18px">
            <td align="right"><strong>用户名称 : </strong></td>
            <td align="left">小娜</td>
            <td align="right"><strong>昵称 : </strong></td>
            <td align="left">Queen</td>
        </tr>
        <tr  style="font-size: 18px">
            <td align="right"><strong>出生年月 : </strong></td>
            <td align="left">1998-01-12</td>
            <td align="right"><strong>地址 : </strong></td>
            <td align="left">湖南岳阳</td>
        </tr>
        <tr  style="font-size: 18px">
            <td align="right"><strong>邮箱地址 : </strong></td>
            <td align="left">1693982052@qq.com</td>
            <td align="right"><strong>网址 : </strong></td>
            <td align="left">暂无</td>
        </tr>
    </table>
    <table class="table table-hover" align="center" style="width: 90%;height: 200px; margin-top: 20px">
        <tr  style="font-size: 18px">
            <td colspan="9" align="center" style="background-color: #c6cbef"><strong><i>个人帖子信息</i></strong></td>
        </tr>
        <tr>
            <th scope="col">编号</th>
            <th scope="col">用户昵称</th>
            <th scope="col">帖子分类</th>
            <th scope="col">帖子状态</th>
            <th scope="col">查看</th>
        </tr>
        <tr>
            <th scope="row">1</th>
            <td>Mark</td>
            <td>Otto</td>
            <td>@mdo</td>
            <td scope="col">
                <a href="#" target="right">查看</a>
            </td>
        </tr>
    </table>
</div>
</body>
</html>
