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
    <link rel="stylesheet" href="../../static/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../static/bootstrap-table/dist/bootstrap-table.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="../../static/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Custom Font Icons CSS-->
    <link rel="stylesheet" href="../../static/css/font.css">
    <!-- Google fonts - Muli-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="../../static/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="../../static/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="../../static/img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

    <script src="${pageContext.request.contextPath}/js/template.js"></script>
    <script src="${pageContext.request.contextPath}/js/tables.js"></script>
    <!-- JavaScript files-->
    <script src="../../static/vendor/jquery/jquery.min.js"></script>
    <script src="../../static/vendor/popper.js/umd/popper.min.js"></script>
    <script src="../../static/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="../../static/bootstrap-table/dist/bootstrap-table.min.js"></script>
    <script src="../../static/vendor/jquery.cookie/jquery.cookie.js"></script>
    <script src="../../static/vendor/chart.js/Chart.min.js"></script>
    <script src="../../static/vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="../../static/js/front.js"></script>
    <script src="${pageContext.request.contextPath}/js/moment-with-locales.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
</head>
<body>
    <%--主体--%>
    <div id="pageContent"><%--class="page-content"--%>
        <!-- Page Header-->
        <div class="page-header no-margin-bottom ">
            <div class="container-fluid">
                <h2 class="h5 no-margin-bottom">数据表格</h2>
            </div>
        </div>
        <!-- ContentHead-->
        <div class="container-fluid">
            <ul class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.jsp">主页</a></li>
                <li class="breadcrumb-item active">表格</li>
            </ul>
        </div>
        <section class="no-padding-top">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="block margin-bottom-sm" id="loadDepartment">
                            <div class="title"><strong>部门表</strong></div>
                            <div class="table-responsive">
                                <table class="table" id="department">

                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="block margin-bottom-sm" id="loadEmpTable">
                            <%--员工表--%>
                            <div class="title"><strong>员工表</strong></div>
                            <div class="table-responsive table-bordered">
                                <table id="empTable" class="table table-striped">

                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="block" id="loadRoleTable">
                            <%--角色表--%>
                            <div class="title"><strong>角色表</strong></div>
                            <div class="table-responsive">
                                <table id="roleTable" class="table table-striped table-hover">

                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="block">
                            <div class="title"><strong>Compact Table</strong></div>
                            <div class="table-responsive">
                                <table class="table table-striped table-sm">
                                    <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Username</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>Larry</td>
                                        <td>the Bird</td>
                                        <td>@twitter</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">4</th>
                                        <td>Mark</td>
                                        <td>Otto</td>
                                        <td>@mdo</td>
                                    </tr>
                                    <tr>
                                        <th scope="row">5</th>
                                        <td>Jacob</td>
                                        <td>Thornton</td>
                                        <td>@fat</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>


<%--template模板
<script id="EmpTemplate" type="text/html">
    {{each list as value}}
        <tr>
            <td>{{value.id}}</td>
            <td>{{value.username}}</td>
            <td>{{value.password}}</td>
            <td>{{value.inputtime}}</td>
            <td>{{value.tel}}</td>
            <td>{{value.email}}</td>
            <td>{{value.state}}</td>
            <td>{{value.admin}}</td>
        </tr>
    {{/each}}
</script>--%>
</body>
</html>