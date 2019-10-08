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
    <%--*************************CSS文件开始*************************--%>
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="../../static/vendor/bootstrap/css/bootstrap.min.css">
    <%--Bootstrap-table CSS--%>
    <link rel="stylesheet" href="../../static/bootstrap-table/dist/bootstrap-table.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.css">
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
    <%--*************************CSS文件结束*************************--%>


    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->

    <!-- *************************JavaScript 文件开始***************************-->
    <%--自己的js文件--%>
    <script src="${pageContext.request.contextPath}/js/department.js"></script>
    <script src="${pageContext.request.contextPath}/js/template.js"></script>
    <%--jquery---JS--%>
    <script src="../../static/vendor/jquery/jquery.min.js"></script>
    <script src="../../static/vendor/popper.js/umd/popper.min.js"></script>
    <%--bootstrap----JS--%>
    <script src="../../static/vendor/bootstrap/js/bootstrap.min.js"></script>
    <%--bootstrap-table---JS--%>
    <script src="../../static/bootstrap-table/dist/bootstrap-table.min.js"></script>
    <script src="../../static/vendor/jquery.cookie/jquery.cookie.js"></script>
    <script src="../../static/vendor/chart.js/Chart.min.js"></script>
    <script src="../../static/vendor/jquery-validation/jquery.validate.min.js"></script>
    <script src="../../static/js/front.js"></script>
    <script src="${pageContext.request.contextPath}/js/moment-with-locales.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <!-- *************************JavaScript 文件结束***************************-->
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
            <li class="breadcrumb-item"><a href="/resultIndex">主页</a></li>
            <li class="breadcrumb-item active">表格</li>
        </ul>
    </div>
    <section class="no-padding-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="block margin-bottom-sm" id="loadEmpTable">
                        <%--员工表--%>
                        <div class="title">
                            <strong><a href="javascript:;" onclick="loadPage('/tablesAll')">部门表</a></strong>
                        </div>
                        <div id="bar" class="col-sm-12" style="margin-top:10px;margin-bottom: 10px">
                            <%--style="width:70px;height:35px;margin-left:20px;margin-top:-3px"--%>
                            <button type="button" id="btn_add" data-toggle="modal" class="btn btn-info">添加</button>
                            <button type="button" id="btn_edit" class="btn btn-warning" data-toggle="modal" >编辑</button>
                            <button type="button" id="btn_delete" class="btn btn-danger">删除</button>
                            <button type="button" id="btn_query" class="btn btn-success">刷新</button><%--btn btn-secondary--%><%--btn-success--%>
                        </div>
                        <div class="table-responsive table-bordered">
                            <table id="departmentTable" class="table table-striped">

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- Modal 添加模态框-->
<div class="modal fade" id="addModal" data-backdrop="true" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                <h2 class="modal-title" id="myModalLabel">新增部门</h2>
            </div>
            <div class="modal-body">
                <form class="addForm" id="addForm">
                    <table class="table table-hover table-bordered">
                        <tr>
                            <th>部门id</th>
                            <td><input type="text" name="id" class="form-control" /></td>
                        </tr>
                        <tr>
                            <th>部门名称</th>
                            <td><input type="text" name="name" class="form-control"/></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="btn_remove_form" class="btn btn-primary" data-dismiss="modal" >取消</button>
                <button type="button" id="btn_save_form" class="btn btn-primary" <%--data-dissmiss="modal"--%> onclick="saveDepartment()" >保存</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal 编辑模态框-->
<div class="modal fade" id="editModal" data-backdrop="true" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                <h2 class="modal-title" id="myModalLabel">编辑部门</h2>
            </div>
            <div class="modal-body">
                <form class="editForm" id="editForm">
                    <table class="table table-hover table-bordered">
                        <%--<input type="text" hidden name="id"  class="form-control id">--%>
                        <tr hidden>
                            <th>部门id</th>
                            <td><input type="text" name="id" class="form-control" id="depId" /></td>
                        </tr>
                        <tr>
                            <th>部门名称</th>
                            <td><input type="text" name="name" class="form-control" id="depName"/></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button"  class="btn btn-primary" data-dismiss="modal" >取消</button>
                <button type="button" id="btn_edit_form" class="btn btn-primary" <%--data-dissmiss="modal"--%> onclick="editDepartment()" >保存</button>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    /*显示日期框*/
    function showDate() {
        $('.dataTimeFormat').datetimepicker('show');
    }
</script>
</html>