<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="static/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="static/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Custom Font Icons CSS-->
    <link rel="stylesheet" href="static/css/font.css">
    <!-- Google fonts - Muli-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="static/css/style.default.css" id="theme-stylesheet">
    <!-- 自定义css-->
    <link rel="stylesheet" href="static/css/custom.css">
    <!-- 导航图标-->
    <link rel="shortcut icon" href="static/img/favicon.ico">
    <!-- HTML5 Shiv 和 Respond.js 用于让 IE8 支持 HTML5元素和媒体查询 -->
    <!-- 注意： 如果通过 file://  引入 Respond.js 文件，则该文件无法起效果 -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
  </head>

  <body>
    <div class="login-page">
      <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
          <div class="row">
            <!-- logo和容器-->
            <div class="col-lg-6">
              <div class="info d-flex align-items-center">
                <div class="content">
                  <div class="logo">
                    <h1>权限管理系统</h1>
                  </div>
                  <p>更好的交互，更棒的管理，登录开启美好世界.</p>
                </div>
              </div>
            </div>
            <!-- form表单容器    -->
            <div class="col-lg-6">
              <div class="form d-flex align-items-center">
                <div class="content">

                  <!--form表单-->
                  <form method="get" class="form-validate mb-4" action="/index.jsp">
                    <div class="form-group">
                      <input id="login-username" type="text" name="loginUsername" required data-msg="Please enter your username" class="input-material">
                      <label for="login-username" class="label-material">用户名</label>
                    </div>
                    <div class="form-group">
                      <input id="login-password" type="password" name="loginPassword" required data-msg="Please enter your password" class="input-material">
                      <label for="login-password" class="label-material">密码</label>
                    </div>
                    <button type="submit" class="btn btn-primary">登录</button>
                  </form>

                    <a href="#" class="forgot-pass">忘记密码?</a><br>
                    <small>没有账号? </small>
                    <a href="/register.jsp" class="signup">注册</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="copyrights text-center">
        <p>Design by <a href="https://www.17sucai.com/" class="external">Bootstrapious</a></p>
        <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
      </div>
    </div>
    <!-- JavaScript files-->
    <script src="static/vendor/jquery/jquery.min.js"></script>
    <script src="static/vendor/popper.js/umd/popper.min.js"> </script>
    <script src="static/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="static/vendor/jquery.cookie/jquery.cookie.js"> </script>
    <script src="static/vendor/chart.js/Chart.min.js"></script>
    <script src="static/vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="static/js/front.js"></script>
  </body>
</html>