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
    <title>主页</title>
</head>
<frameset rows="70px,*" border="0">
    <frame src="top.jsp" scrolling="no" frameborder="0"  allowtransparency="ture">
    <frameset cols="200px,*">
        <frame src="left.jsp" scrolling="no" frameborder="0"  allowtransparency="ture">
        <frame src="userCotrol.jsp" name="right"  frameborder="0"  allowtransparency="ture">
    </frameset>
</frameset>
</html>
