<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/common/common.jsp"%>
<html>
<head>
    <title>员工管理</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/employee.js"></script>
</head>
<body>
    <%--工具栏--%>
    <div id="tb">
        <shiro:hasPermission name="employee:add">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="add">添加</a>
        </shiro:hasPermission>
        <shiro:hasPermission name="employee:edit">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" id="edit">编辑</a>
        </shiro:hasPermission>
        <shiro:hasPermission name="employee:delete">
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" id="state_del">离职</a>
            <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" id="delete">删除</a>
        </shiro:hasPermission>
        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload',plain:true" id="reload">刷新</a>
        <div style="float: right;height: auto">
            <input type="text" name="keyWord" style="width: 150px">
            <a class="easyui-linkbutton" id="search-Btn" data-options="iconCls:'icon-search',plain:true">搜索</a>
        </div>
    </div>
    <%--列表数据--%>
    <table id="dg"></table>

    <%--窗口--%>
    <div id="dialog">
        <form id="employeeForm">
            <table align="center" style="border-spacing: 0px 10px">
                <%--添加一个隐藏域---用作于判断使用哪个url请求--%>
                <input type="hidden" name="id">
                <tr>
                    <td>用户名:</td>
                    <td><input type="text" name="username" class="easyui-validatebox" data-options="required:true" style="width: 150px"></td>
                </tr>
                <tr id="pwd">
                    <td>密码:</td>
                    <td><input type="text" name="password" class="easyui-validatebox" style="width: 150px"></td>
                </tr>
                <tr>
                    <td>手机:</td>
                    <td><input type="text" name="tel" class="easyui-validatebox"  style="width: 150px"></td>
                </tr>
                <tr>
                    <td>邮箱:</td>
                    <td><input type="text" name="email" class="easyui-validatebox" data-options="required:true,validType:'email'" style="width: 150px"></td>
                </tr>
                <tr>
                    <td>入职日期:</td>
                    <td><input type="text" name="inputtime" class="easyui-datebox" style="width: 150px"></td>
                </tr>
                <tr>
                    <td>部门:</td>
                    <td><input id="department" name="department.id" placeholder="请选择部门" style="width: 150px"/></td>
                </tr>
                <tr>
                    <td>状态:</td>
                    <td><input id="state" name="state" placeholder="请选择状态" class="easyui-validatebox"/></td>
                </tr>
                <tr>
                    <td>管理员:</td>
                    <td><input id="admin" name="admin" placeholder="是否为管理员" class="easyui-validatebox"/></td>
                </tr>
                <tr>
                    <td>角色:</td>
                    <td><input id="role_" name="role.id" placeholder="请选着角色" style="width: 150px"/></td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
