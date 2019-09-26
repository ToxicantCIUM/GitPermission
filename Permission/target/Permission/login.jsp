<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录页</title>
    <link href="${pageContext.request.contextPath}/static/plugins/easyui/uimaker/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/plugins/easyui/uimaker/css/login/login.css" rel="stylesheet">
</head>
<body class="white">
<div class="login-hd">
    <div class="left-bg"></div>
    <div class="right-bg"></div>
    <span class="logo"></span>
    <span class="split"></span>
    <span class="sys-name">权限管理</span>
</div>
<div class="login-bd">
    <div class="lg-zone">
        <div class="lg-box">
            <div class="lg-label">用户登录</div>
            <form>
                <div class="lg-username input-item clearfix">
                    <i class="user_logo"></i>
                    <input type="text" name="username" placeholder="账号/邮箱">
                </div>
                <div class="lg-password input-item clearfix">
                    <i class="pwd_logo"></i>
                    <input type="password" name="password" placeholder="请输入密码">
                </div>
                <div class="tips clearfix">
                    <input type="checkbox" checked="checked">
                    <span>记住用户名</span>
                    <a href="javascript:;" class="register">立即注册</a>
                    <a href="javascript:;" class="forget-pwd">忘记密码？</a>
                </div>
                <div class="enter">
                    <a href="javascript:;" class="supplier" id="login_admin" >管理员登录</a>
                </div>
            </form>
        </div>
    </div>
    <div class="lg-poster"></div>
</div>
<div class="login-ft">
    <div class="about-us">
        <a href="#">关于我们</a>
        <a href="#">法律声明</a>
        <a href="#">服务条款</a>
        <a href="#">联系方式</a>
    </div>
    <div class="address">地址：福建福州</div>
    <div class="other-info">建议使用IE8及以上版本浏览器</div>
</div>
</body>
</html>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/easyui/uimaker/js/jquery.min.js"></script>

<script type="text/javascript">



</script>
<script>
    $(function () {


        $("#login_admin").click(function (){
            /*使用表单序列化来发送参数*/
            /*Ajax发送请求是没有办法跳转服务器中的请求*/
            $.post("/login",$("form").serialize(), function (data) {
                console.log(data);
                data=$.parseJSON(data);
                if (data.success){
                    /*成功就转发*/
                    window.location.href="/index.jsp";
                }else{
                    alert(data.msg);
                    window.location.href="/login.jsp"
                }
            })
        });

    })
</script>

