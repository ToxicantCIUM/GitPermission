$(function () {
    /*数据表格*/
    $("#role_dg").datagrid({
        url:"/getRole",
        columns:[[
            {field:'rname',title:'角色名称',width:100,align:'center'},
            {field:'rnum',title:'角色编号',width:100,align:'right',align:'center'}
        ]],
        rownumbers:true,
        singleSelect:true,
        fitColumns:true,
        fit:true,
        pagination:true,
        toolbar: '#role_tb',
        pageList:[3,5,10,15,20],
        pageSize:5
    });
    /*窗口*/
    $("#dialog").dialog({
        title:'权限管理',
        width:600,
        height:600,
        closed:true,
        buttons:[{
            text:'保存',
            handler:function(){
                /*通过之前设置的隐藏id判断是编辑还是保存*/
                var id = $("[name = 'rid']").val();
                var url;
                if (id){
                    url='/updateRole';
                }else{
                    url='/saveRole';
                }
                $("#roleForm").form("submit",{
                    url:url,
                    onSubmit:function (param) {
                        /*取出已选权限中的所有数据*/
                        var allRows = $("#role_data2").datagrid("getRows");
                        for (var i=0;i<allRows.length;i++){
                            var row = allRows[i];
                            param["permissions["+i+"].pid"] = row.pid;
                        }
                    },

                    success:function(data){
                        data = $.parseJSON(data);
                        if (data.success){
                            $.messager.alert("温馨提示",data.msg);
                            $("#role_dg").datagrid("reload");
                            $("#dialog").dialog("close");
                        }else{
                            $.messager.alert("温馨提示",data.msg);
                        }
                    }
                })
            }
        },{
            text:'关闭',
            handler:function(){
                $("#dialog").dialog("close")
            }
        }]
    });

    /*添加按钮*/
    $("#add").click(function () {
        /*清空form表单*/
        $("#roleForm").form("clear");
        /*清除已选权限的数据*/
       /* $("#role_data2").datagrid("loadData",{row:[]});*/
        /*设置标题*/
        $("#dialog").dialog("setTitle","添加角色");
        $("#dialog").dialog("open");
    });

    /*编辑按钮*/
    $("#edit").click(function () {
        /*获取选中的行*/
        var rowData = $("#role_dg").datagrid("getSelected");
        console.log(rowData);
        if (!rowData){
            $.messager.alert("警告","请先选着要操作的行");
            return ;
        }
        else {
            /*清空form表单*/
            $("#roleForm").form("clear");
            /*同名匹配数据回显*/
            $("#roleForm").form("load",rowData);
            /*从选中的行中将rid获取出来*/
            var rid = rowData.rid;
            /*使用load方法将参数传到服务器并返回json数据*/
            $("#role_data2").datagrid("load",{
                rid:rid
            });
            $("#dialog").dialog("setTitle","编辑角色");
            $("#dialog").dialog("open");
        }

    });

    /*删除按钮*/
    $("#delete").click(function () {
        var rowData = $("#role_dg").datagrid("getSelected");
        if (!rowData){
            $.messager.alert("提示","请选择要删除的行")
        }
        $.get("/deleteRole?rid="+rowData.rid,function (data) {
            if (data.success){
                $.messager.alert("温馨提示",data.msg);
                /*重新加载表格*/
                $("#role_dg").datagrid("reload");
            }else{
                $.messager.alert("温馨提示",data.msg);
            }
        });
    });

    /*权限列表*/
    $("#role_data1").datagrid({
        title:'所有权限',
        width:250,
        height:450,
        fitColumns:true,
        url:'/permissionList',
        singleSelect:true,
        columns:[[
            {field:'pname',title:'权限名称',width:100,align:'center'}
        ]],
        /*监听点击的行*/
        onClickRow:function (rowIndex, rowData) {
            /*取出已选权限的所有数据*/
            var rows = $("#role_data2").datagrid("getRows");
            /*遍历已选权限  与所有权限做对比 防止添加重复权限*/
            for (var i=0;i<rows.length;i++){
                if (rows[i].pid ==rowData.pid ){
                    /*取出需要选中的行的角标*/
                    var index = $("#role_data2").datagrid("getRowIndex",rows[i]);
                    /*选中这一行*/
                    $("#role_data2").datagrid("selectRow",index);
                    return ;
                }

            }
            $("#role_data2").datagrid("appendRow",rowData);

        }
    });

    $("#role_data2").datagrid({
        title:'已选权限',
        url:'/getPermission',
        width:250,
        height:450,
        fitColumns:true,
        singleSelect:true,
        columns:[[
            {field:'pname',title:'已选权限名称',width:100,align:'center'}
        ]],
        onClickRow:function (rowIndex, rowData) {
            /*获取点击行的index*/
            $("#role_data2").datagrid("deleteRow",rowIndex);
        }

    });


});