<%--
  Created by IntelliJ IDEA.
  User: LN
  Date: 2019/4/28
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>主题详情页面</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">

    <link rel="stylesheet" href="css/topicsDetails.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<%
    HttpSession session1 = request.getSession();
    String aa= (String)session1.getAttribute("name");
%>
<body style="background-color: #e3e7f1">
<!--  标题栏  -->
<div style="height: 100px;width: 100%;margin: 20px  auto 5px;box-shadow: 0 3px 5px -1px #41374f; background-color: #494ca2;">
    <!--  logo  -->
    <div id="logo" style="float: left;margin-top: 10px;margin-left: 150px">
        <a href="first.do">
            <img src="img/logo1.png" height="80" width="80"/>
            <font size="5" color="#f0ffff">VN社区</font>
        </a>
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
    <%
        if (aa==null){
    %>
    <div  style="float: right;margin-top: 40px;margin-right: 10px">
        <button class="btn btn-primary" type="button" onclick="openLogin()">登录</button>
        &nbsp&nbsp|&nbsp&nbsp
        <button class="btn btn-primary" type="button" onclick="openReg()">注册</button>
    </div>
    <%
        }
    %>
</div>

<!--帖子详情显示-->
<div style="height: auto;width: 85%;margin: 0 auto;">
    <!--  主题,版块显示区域  -->

   <%-- <c:forEach items="${requestScope.post1}" var="p">--%>

    <div  style="height:85px;width: 100%;box-shadow: 0 3px 5px -1px #1f5e64;padding: 10px">
        <h2>${post1.post_title}</h2><%--帖子标题--%>
        <h6>${post1.post_type}</h6><%--帖子类型--%>
    </div>
    <div style="height: auto;width: 85%;margin-top: 10px">
        <h4>帖子内容</h4>
        <div style="height: auto;width: 85%;margin: auto;border: 1px solid sandybrown">
            <p style="margin-top: 10px;margin-left: 20px">
                ${post1.post_content};
            </p>
        </div>
        <%
            if (aa != null){
        %>
        <button style="float: right;margin-top: -50px;margin-right: -10px" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
            回复
        </button>
        <%
            }
        %>
    </div>

<%--
    </c:forEach>
--%>

    <!--用户头像,名称,以及发布内容详情-->
    <div style="height: auto;width: 85%;margin-top: 10px">
        <!-- 回复窗口-->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content" style="margin-top: 45%;">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">
                            回复 小娜
                        </h4>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">×
                        </button>
                    </div>
                    <form action="AddComment.do" method="post">
                    <div class="modal-body" >
                        <textarea name="content" style="width: 100%;height: 300px;text-align: left"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                                data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">回复</button>
                    </div>
                    </form>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <!--用户评论区-->
        <h4>回复内容</h4>
        <c:forEach items="${requestScope.commentlist}" var="c">
        <div style="height: auto;width: 85%;margin-top: 10px">
            <div style="height: auto;width: 85%;margin: auto;">
                <p style="margin-top: 10px;margin-left: 20px">
                    ${c.content}
                </p>
            </div>
        </div>
        </c:forEach>

    </div><br><br>


    <!--推荐主题-->
    <div  style="height:auto;width: 100%;padding: 10px;">
        <p style="font-size: 20px"><strong>推荐主题</strong></p>
        <table class="table table-striped">
            <thead>
            <tr>
                <th scope="col">编号</th>
                <th scope="col">主题</th>
                <th scope="col">内容</th>
            </tr>
            </thead>
            <tbody>
            <% int i=0;%>
            <c:forEach items="${requestScope.otherpost1}" var="post">
            <tr>
                <th scope="row"><%= i++%></th>
                <td>${post.post_title}</td>
                <td>${post.post_content}</td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- 底部备案 -->
    <div style="text-align: center;margin-top: 50px">
        <h6>长沙市薇恩集团 VN社区 版权所有 ©</h6>
    </div>
    <!--登录页面-->
    <div id="win" style="display: none;">
        <form class="box" action="userLogin.do" method="post" style="width: 100%;height: 100%">
            <div class="box" style="width: 480px;height: 450px;background-color:rgba(35,118,124,0.7)">
                <input type="button" style="float: right;border: 0;background:crimson;color: white" value="X" onclick="closeLogin()">
                <h1>
                    LOGIN
                </h1><hr>
                <input type="text" id="user" name="name" placeholder="Username"/>
                <input type="password" id="password" name="password" placeholder="Password"/>
                <input type="text" id="pic_id" class="textbox" name="pic" placeholder="请输入图形验证码"/>
                <div id="v_container"></div>
                <button style="margin-right: 240px;margin-top: 120px" type="submit" name="but" value="Login" onclick="login()">Login</button>
                <button style="margin-left: 240px;margin-top: -69px" type="submit" name="but" value="Login" onclick="change()">reg</button>
                <input type="checkbox">记住密码&nbsp;&nbsp;&nbsp;
                <a href="#" style="text-decoration:none;color: white">找回密码</a>
            </div>
        </form>
    </div>
    <!--注册-->
    <div id="win1" style="display: none;">
        <form class="box" action="../userReg.do" method="post" style="width: 100%;height: 100%">
            <div class="box" style="width: 480px;height: 400px;background-color:rgba(35,118,124,0.6)">
                <input type="button" style="float: right;border: 0;background:crimson;color: white" value="X" onclick="closeReg()">
                <h1>
                    Register
                </h1><hr>
                <input type="text" id="reg_email" name="email" placeholder="Email"/>
                <input type="text" id="reg_name" name="username" placeholder="Username"/>
                <input type="password" id="reg_pw" name="password" placeholder="Password"/>
                <button type="submit" name="but" value="Register" onclick="reg()">reg</button>
            </div>
        </form>
    </div>

</div>



<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

 <script>
    function openLogin(){
        alert("aaaaaaaaaaa");
        document.getElementById("win").style.display="";
    }
    function closeLogin(){
        document.getElementById("win").style.display="none";
    }
    function change(){
        document.getElementById("win").style.display="none";
        document.getElementById("win1").style.display="inline";
    }
    function openReg(){
        document.getElementById("win1").style.display="inline";
    }
    function closeReg(){
        document.getElementById("win1").style.display="none";
    }

    //在id为v_container的地方显示图形验证码。
    var verifyCode = new GVerify("v_container");
    function login(){
        if ($("#user").val() == ""){
            alert("请输入正确的用户名");
            return false;
        }
        if ($("#password").val() <6){
            alert("请输入正确的密码");
            return false;
        }

        //boolern值，获得输入框的id
        //var res = verifyCode.validate($("#pic_id").val());
        // if (res) {   //如果一样就验证成功
        // }else if (res.length <1){   //验证码输入的长度=等于0，就提示验证码错误
        //     alert("请输入正确的验证码")
        //     verifyCode();  //重新刷新验证码
        //     return false;
        //
        // } else {   //如不一致，就验证错误
        //     alert("请输入正确的验证码");
        //     verifyCode();  //重新刷新验证码
        //     return false;
        // }
        alert("登录成功,欢迎您"+$("#user").val()+"来到VN论坛");
        document.getElementById("win").style.display="none";
    }

    function reg() {
        if ($("#reg_email").val() == ""){
            alert("请输入正确的邮箱");
        }
        if ($("#reg_name").val() == ""){
            alert("请输入6-18位数密码")
        }
        if ($("#reg_pw").val()<=6){
            alert("请输入6-18位数密码")
        }
        alert("注册成功,马上去登录吧");
        document.getElementById("#win1").style.display="none";
    }

</script>

</body>
</html>