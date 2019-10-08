function loadPage(url) {
    $.ajax({
        type: "POST",
        url: url,
        async: true,
        dataType: "html",
        contentType: 'application/json; charset=utf-8',
        success: function (html) {
            $('#pageContent').html(html);
        }
    });
}
$(function () {
    /*    /!*获取所有员工template*!/
    getEmployeeList();
    function getEmployeeList() {
        $.post("/getEmpList", function (data) {
            /!*3.传入数据*!/
            var t = {
                list: data
            };
            var html = template('EmpTemplate', t);
            $("#employeeList_tr").html(html);
        });
    }*/
    /*获取员工数据表格*/
    $("#empTable").bootstrapTable({
        url:'/getEmpList',
        striped : true,
        /*pageNumber : 1, //初始化加载第一页*/
        pagination:true,
        sidePagination : 'client',//server:服务器端分页|client：前端分页
        pageSize : 3,//单页记录数
        /*pageList : [1,3,5,10,15],//可选择单页记录数*/
        showRefresh : false,//刷新按钮
        sortOrder: "desc",
        columns:[[
            {field:'username',title:'姓名',align:'center'},
            {field:'department',title:'部门',align:'right',align:'center',formatter: function(value,row,index){
                    if (value){
                        return value.name;
                    }else{
                        return "<font style='color: red'>无</font>"
                    }
                }},
            {field:'state',title:'状态',align:'right',align:'center',formatter: function(value,row,index){
                    if (row.state){
                        return "在职";
                    } else {
                        return "<p style='color: red'>离职</p>";
                    }
                }
            }
        ]]

    });
    /*获取角色数据表格*/
    $("#roleTable").bootstrapTable({
        url:'/getRoleTabList',
        striped : true,
        /*pageNumber : 1, //初始化加载第一页*/
        pagination:true,
        sidePagination : 'client',//server:服务器端分页|client：前端分页
        pageSize : 3,//单页记录数
        /*pageList : [1,3,5,10,15],//可选择单页记录数*/
        showRefresh : false,//刷新按钮
        sortOrder: "desc",
        columns:[[
            {field:'rname',title:'角色名称',align:'center'},
            {field:'rnum',title:'角色编号',align:'right',align:'center'}
        ]]
    });
    /*获取部门数据表格*/
    $("#department").bootstrapTable({
        url:'/getDepList',
        striped : true,
        /*pageNumber : 1, //初始化加载第一页*/
        pagination:true,
        sidePagination : 'client',//server:服务器端分页|client：前端分页
        pageSize : 3,//单页记录数
        /*pageList : [1,3,5,10,15],//可选择单页记录数*/
        showRefresh : false,//刷新按钮
        sortOrder: "desc",
        columns:[[
            {field:'id',title:'部门id',align:'center'},
            {field:'name',title:'部门名称',align:'center'}
        ]]

    });

    /*点击进入员工操作界面*/
    $("#loadEmpTable").click(function () {
        loadPage("/employee");
    });
    /*点击进入部门操作界面*/
    $("#loadDepartment").click(function () {
        loadPage("/department")
    });
    /*点击进入权限操作界面*/
    $("#loadRoleTable").click(function () {
        loadPage("/role")
    });
});