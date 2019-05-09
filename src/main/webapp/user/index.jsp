<%--
  Created by IntelliJ IDEA.
  User: LN
  Date: 2019/4/28
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">

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
    <div  style="float: right;margin-right: 10px;height: 100%;width: 200px; ">
         <div style="float: right;margin-top: 50px;margin-right: 20px"><font size="3">
             <%
                 if (aa != null){
             %>
             <a href="user/myFrame.html">
                 <img src="img/1556161555.png" style="width:50px;height:50px;border-radius: 50%"/>
                 <%= aa%>
             </a> |
             <a href="deleteUserLogin">注销</a>
             <%
                 }
             %>
             </font>
         </div>
    </div>

    <!--if(session == null){-->
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
    <!--}-->


</div>



<!--  内容栏  -->
<div style="height: 700px;width: 85%;margin: 0 auto;">
    <!--  导航栏  -->
    <div  style="height:60px;width: 100%;box-shadow: 0 3px 5px -1px #1f5e64;background-color: #8186d5">
        <!--  帖子分类  -->
        <select style="float: left;height: 40px;width:100px ;margin-top: 5px;margin-left: 10px">
            <option>新闻公告</option>
            <option>Bug报告</option>
            <option>App开发</option>
            <option>社区指南</option>
        </select>

        <!--  最新,最热  -->
        <div style="float: left;margin-top: 10px;margin-left: 50px">
            <button type="button" class="btn btn-info">最新</button>
            &nbsp
            <button type="button" class="btn btn-info">最热</button>
        </div>
        <!--  发布新帖  -->
        <%
            if (aa != null){
        %>
        <div style="float: right ;margin-top: 12px; margin-right: 50px">
            <a href="user/Release.jsp">
                <button type="button" class="btn btn-primary btn-sm">+ 发布新贴</button>
            </a>
        </div>
        <%
            }
        %>
    </div>
    <!--  内容区域  -->
    <div style="width: 100%;height: 100%;background-color: #c6cbef">
        <div style="height: 90%">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">帖子主题</th>
                    <th scope="col">发帖人</th>
                    <th scope="col">帖子内容</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.postlist}" var="p">
                <tr>
                    <th scope="row">
                        <a href="findPostByTitil.do?postitle=${p.post_title}">${p.post_title}</a>
                    </th>
                    <th scope="row">${p.user_name}
                    </th>
                    <td>${p.post_content}</td>
                    <td>
                        <c:if test="${p.post_state} == 0">已审核</c:if>
                        <c:if test="${p.post_state} == 1">已删除</c:if>
                    </td>
                </tr>
                </c:forEach>
                </tbody>


            </table>
        </div>
        <div style="width: 200px;margin-top: 10px;margin-left: auto;margin-right: auto" >
            <nav aria-label="Page navigation example" >
                <ul class="pagination" >
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>


</div>
<!-- 底部备案 -->
<div style="text-align: center;margin-top: 100px">
    <h6>长沙市薇恩集团 VN社区 版权所有 ©</h6>
</div>


<!--登录-->
<div id="win" style="display: none;">
    <form class="box" action="userLogin.do" method="post" onsubmit="return login()" style="width: 100%;height: 100%">
        <div class="box" style="width: 480px;height: 450px;background-color:rgba(35,118,124,0.7)">
            <input type="button" style="float: right;border: 0;background:crimson;color: white" value="X" onclick="closeLogin()">
            <h1>
                LOGIN
            </h1><hr>
            <input type="text" id="user" name="name" placeholder="Username"/>
            <input type="password" id="password" name="password" placeholder="Password"/>
            <input type="text" id="pic_id" class="textbox" name="pic" placeholder="请输入图形验证码"/>
            <div id="v_container"></div>
            <button style="margin-right: 240px;margin-top: 120px" type="submit" name="but" value="Login">Login</button>
            <button style="margin-left: 240px;margin-top: -69px" type="submit" name="but" value="Login" onclick="change()">reg</button>
            <input type="checkbox">记住密码&nbsp;&nbsp;&nbsp;
            <a href="#" style="text-decoration:none;color: white">找回密码</a>
        </div>
    </form>
</div>
<!--注册-->
<div id="win1" style="display: none;">
    <form class="box" action="userReg.do" method="post" onsubmit="return reg()" style="width: 100%;height: 100%">
        <div class="box" style="width: 480px;height: 400px;background-color:rgba(35,118,124,0.6)">
            <input type="button" style="float: right;border: 0;background:crimson;color: white" value="X" onclick="closeReg()">
            <h1>
                Register
            </h1><hr>
            <input type="text" id="reg_email" name="email" placeholder="Email"/>
            <input type="text" id="reg_name" name="username" placeholder="Username"/>
            <input type="password" id="reg_pw" name="password" placeholder="Password"/>
            <button type="submit" name="but" value="Register" >reg</button>
        </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/gVerify.js"></script>
<script>
    function openLogin(){
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

        // boolern值，获得输入框的id
        var res = verifyCode.validate($("#pic_id").val());
        if (res) {
            //如果一样就验证成功
        }else if (res.length <1){   //验证码输入的长度=等于0，就提示验证码错误
            alert("请输入正确的验证码")
            verifyCode();  //重新刷新验证码
            return false;

        }else{
            alert("登录成功,欢迎您"+$("#user").val()+"来到VN论坛");
            document.getElementById("win").style.display="none";
        }

    }

    function reg() {
        if ($("#reg_email").val() == ""){
            alert("请输入正确的邮箱");
            return false;
        }
        if ($("#reg_name").val() == ""){
            alert("请输入用户名");
            return false;
        }
        if ($("#reg_pw").val() == ""){
            alert("请输入6-18位数密码");
            return false;
        }
        if ($("#reg_pw").val() <= 6){
            alert("请输入6-18位数密码");
            return false;
        }else{
            alert("注册成功,马上去登录吧");
            document.getElementById("#win1").style.display="none";
        }

    }


</script>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
