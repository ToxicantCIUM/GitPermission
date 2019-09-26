<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/common/common.jsp"%>
<html>
<head>
    <title>角色管理</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/role.js"></script>
    <style>
        #dialog #roleForm .panel-header{
            height: 15px;
        }
        #dialog #roleForm .panel-title{
            margin-top: -10px;
            color: black;
        }
    </style>
</head>
<body>
    <%--工具栏--%>
    <div id="role_tb">
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="add">添加</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" id="edit">编辑</a>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" id="delete">删除</a>
    </div>
    <%--列表数据--%>
    <table id="role_dg"></table>

    <%--窗口--%>
    <div id="dialog">
        <form id="roleForm">
            <table align="center" style="border-spacing: 0px 10px">
                <%--添加一个隐藏域---用作于判断使用哪个url请求--%>

                <input type="hidden" name="rid">
                <tr>
                    <td>角色编号:<input type="text" name="rnum" class="easyui-validatebox"></td>
                    <td>角色姓名:<input type="text" name="rname" class="easyui-validatebox"></td>
                </tr>

                <tr>
                    <td><div id="role_data1"></div></td>
                    <td><div id="role_data2"></div></td>
                </tr>
            </table>
        </form>
    </div>

</body>
</html>
