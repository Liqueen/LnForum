<%--
  Created by IntelliJ IDEA.
  User: LN
  Date: 2019/4/29
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>发布</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
</head>
<body style="background-color: #e3e7f1">
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
</div>

<!--  内容栏  -->
<div style="height: 900px;width: 65%;margin: 0 auto;">
    <!--  导航栏  -->
    <div  style="height:60px;width: 100%;box-shadow: 0 3px 5px -1px #1f5e64;background-color: #8186d5">
        <!--  帖子分类  -->
        <div class="btn-group" style="float: left;margin-top: 10px;margin-left: 10px;color: white">
            <h3>创建新的主题</h3>
        </div>

    </div>
    <form action="../addPost.do" method="post">
    <!--  内容区域  -->
    <div style="width: 100%;height: 100%;background-color: #c6cbef;">
        <div style="width: 60%;padding-top: 10px;margin-left: auto;margin-right:auto">
            <div class="input-group mb-3" style="width: 100%;">
                <input type="text" name="posTitle" placeholder="请输入标题" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default">
            </div>
            <div class="input-group mb-3" style="width: 48%;float: left">
                <select class="custom-select"   id="inputGroupSelect01">
                    <option id="value1" value="1">技术</option>
                </select>
            </div>
            <div class="input-group mb-3" style="width: 48%;float: right">
                <select class="custom-select"  name="type"  id="inputGroupSelect03" style="display: inline;">
                    <option selected>选择主题</option>
                    <option value="python">python</option>
                    <option value="java">java</option>
                    <option value="c++">c++</option>
                    <option value="jQuery">jQuery</option>
                    <option value="js">js</option>
                    <option value="c">c</option>
                    <option value="c#">c#</option>
                    <option value="php">php</option>
                </select>
            </div>
            <div style="margin-top: 80px;background-color: white;">
                <div id="div1" class="toolbar">
                </div>
                <div style="height: 3px;background-color: #c6cbef"></div>
                <div id="div2" class="text" style="height: 680px"> <!--可使用 min-height 实现编辑区域自动增加高度-->
                    <textarea style="width: 100%;height: 100%" name="postContent">请输入内容</textarea>
                </div>
                <!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
                <script type="text/javascript" src="../js/wangEditor.min.js/"></script>
                <script type="text/javascript">
                    var E = window.wangEditor;
                    var editor = new E('#div1','#div2')

                    editor.customConfig.uploadImgServer = '/oss'


                    editor.create();
                </script>
            </div>
            <div style="margin-top: 10px;height: 32px;border-radius: 5px" align="right">
                <button type="submit" class="btn btn-primary btn-sm">确认发布</button>
                <button type="button" class="btn btn-primary btn-sm">取消发布</button>
            </div>
        </div>
    </div>
    </form>
</div>


<!-- 底部备案 -->
<div style="text-align: center;margin-top: 100px">
    <h6>长沙市薇恩集团 VN社区 版权所有 ©</h6>
</div>

<script>
    var Select = document.getElementById("inputGroupSelect01");
    Select.onchange = function() { //当选项改变时触发
        var valOption = this.options[this.selectedIndex].value; //获取option的value
        if (valOption == 1){
            document.getElementById("inputGroupSelect02").style.display="inline";
            document.getElementById("inputGroupSelect03").style.display="none";
        }
        if (valOption == 2){
            document.getElementById("inputGroupSelect02").style.display="none";
            document.getElementById("inputGroupSelect03").style.display="inline";
        }
}

</script>

<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
