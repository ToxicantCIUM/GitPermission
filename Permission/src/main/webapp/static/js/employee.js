$(function () {


    /*数据表格*/
    $("#dg").datagrid({
        url:"/employeeList",
        columns:[[
            {field:'username',title:'姓名',width:100,align:'center'},
            {field:'password',title:'密码',width:100,align:'right',align:'center'},
            {field:'inputtime',title:'入职时间',width:100,align:'center'},
            {field:'tel',title:'电话',width:100,align:'right',align:'center'},
            {field:'email',title:'邮箱',width:100,align:'right',align:'center'},
            {field:'department',title:'部门',width:100,align:'right',align:'center',formatter: function(value,row,index){
                    if (value){
                        return value.name;
                    }
                }},
            {field:'state',title:'状态',width:100,align:'right',align:'center',formatter: function(value,row,index){
                    if (row.state){
                        return "在职";
                    } else {
                        return "<p style='color: red'>离职</p>";
                    }
                }
            },
            {field:'admin',title:'管理员',width:100,align:'right',align:'center',formatter: function(value,row,index){
                    if (row.admin && row.state){
                        return "管理员";
                    } else if (!row.state){
                        return "<p style='color: red'>已离职无职位</p>";
                    }else{
                        return "<p style='color: skyblue'>普通员工</p>"
                    }
                }
            }
        ]],
        rownumbers:true,
        singleSelect:true,
        fitColumns:true,
        fit:true,
        pagination:true,
        toolbar: '#tb',
        onClickRow:function (rowIndex, rowData) {
            if (rowData.state){
                $("#state_del").linkbutton({disabled:false});
            }
            else{
                $("#state_del").linkbutton({disabled:true});
            }
        },
        pageList:[3,5,10,15,20],
        pageSize:5

    });
    /*对话框*/
    $("#dialog").dialog({
        title: '表单',
        width: 300,
        height: 450,
        closed:true,
        buttons:[{
            text:'保存',
            handler:function(){
                /*提交表单前先判断使用哪个url*/
                var id = $("[name='id']").val();
                var url;
                if (id){
                    url='/editEmployee'
                }else{
                    url='/saveEmployee'
                }
                /*提交表单*/
                $("#employeeForm").form("submit",{
                    url:url,
                    onSubmit:function(param){
                        var values = $("#role_").combobox("getValues");
                        for (var i=0;i<values.length;i++){
                            var rid = values[i];
                            param["roles["+i+"].rid"] = rid;
                        }
                    },
                    success:function (data) {

                        data=$.parseJSON(data);
                        if (data.success){
                            $.messager.alert("温馨提示",data.msg);
                            $("#dg").datagrid("reload");
                            $("#dialog").dialog("close");
                        }else
                            $.messager.alert("温馨提示",data.msg);
                        $("#dg").datagrid("reload");
                    }
                });
            }
        },{
            text:'关闭',
            handler:function(){
                $("#dialog").dialog("close");
            }
        }]
    });

    /*添加按钮*/
    $("#add").click(function () {
        /*显示之前被隐藏的属性*/
        $("#pwd").show();
        /*点击之前清空表单*/
        $("#employeeForm").form("clear");
        /*设置标题*/
        $('#dialog').dialog("setTitle","添加员工");
        /*添加密码验证*/
        $("[name = 'password']").validatebox({required:true});
        /*点击跳出窗口*/
        $('#dialog').dialog("open");
    });

    /* 编辑按钮*/
    $("#edit").click(function () {
        /*隐藏不想修改的属性*/
        $("#pwd").hide();
        /*点击之前清空表单*/
        $("#employeeForm").form("clear");
        /*获取选中的行*/
        var rowData = $("#dg").datagrid("getSelected");
        console.log(rowData);

        if (!rowData){
            $.messager.alert("温馨提示","请选择要编辑的行");
            return ;
        }

        /*取消密码验证*/
        $("[name = 'password']").validatebox({required:false});
        $('#dialog').dialog("setTitle","编辑员工");
        $("#dialog").dialog("open");
        /*处理部门回显数据*/
        if (rowData["department"]){
            rowData["department.id"] = rowData["department"].id;
        }
        /*处理状态和管理员回显数据*/
        rowData["state"] = rowData["state"]+"";
        rowData["admin"] = rowData["admin"]+"";
        /*处理角色数据回显*/
        $.get("/getRoleListById?id="+rowData.id,function (data) {
           /* console.log(data);*/

            $("#role_").combobox("setValues",data);
        });
        /*数据回显*/
        $("#employeeForm").form("load",rowData);
    });

    /*修改员工离职状态*/
    $("#state_del").click(function () {
        var rowData = $("#dg").datagrid("getSelected");
        if (!rowData){
            $.messager.alert("提示","请选着要修改的数据");
            return ;
        }
        if (rowData.state){
            $.messager.confirm('状态', '确认修改？', function(res){
                if (res){
                    $.get("/editState?id="+rowData.id,function (data) {
                        /*console.log(data);*/
                        if (data.success){
                            $.messager.alert("温馨提示",data.msg);
                            /*重新加载表格*/
                            $("#dg").datagrid("reload");
                        }else{
                            $.messager.alert("温馨提示",data.msg);
                        }
                    });
                }
            });
        }else{
            $.messager.alert("提示","不能选择已离职的员工")
        }




    });

    /*刷新按钮*/
    $("#reload").click(function () {
        /*清空参数*/
        var keyWord = $("[name = 'keyWord']").val('');
        /*不需要设置参数*/
        $("#dg").datagrid("load",{});
    });

    /*删除按钮*/
    $("#delete").click(function () {
        var rowData = $("#dg").datagrid("getSelected");
        if (!rowData){
            $.messager.alert("温馨提示","请选着要删除的行");
            return ;
        }
        $.messager.confirm('状态','确认删除？',function (res) {
            if (res){
                $.get("/deleteEmployeeById?id="+rowData.id,function (data) {
                    if (data){
                        $("#dg").datagrid("load");
                        $.messager.alert("提示",data.msg);
                    }else{
                        $.messager.alert("提示",data.msg);
                    }
                });
            }
        });
    });



    /*搜索框*/
    $("#search-Btn").click(function () {
        /*获取搜索框里的数据*/
        var keyWord = $("[name = keyWord]").val();
        /*将keyWord传给服务器搜索，并加载数据*/
        $('#dg').datagrid('load',{keyWord:keyWord});
});



    /*下拉框管理员*/
    $("#admin").combobox({
        width:150,
        panelHeight:'auto',
        valueField: 'value',
        textField: 'label',
        editable:false,
        data: [{
            label: '是',
            value: 'true'
        },{
            label: '否',
            value: 'false'
        }],
        onLoadSuccess:function () {
            $("#admin").each(function(i){
                var span = $(this).siblings("span")[i];
                var targetInput = $(span).find("input:first");
                if(targetInput){
                    $(targetInput).attr("placeholder", $(this).attr("placeholder"));
                }
            });
        }
    });

    /*下拉框状态*/
    $("#state").combobox({
        width:150,
        panelHeight:'auto',
        valueField: 'value',
        textField: 'label',
        editable:false,
        data: [{
            label: '在职',
            value: 'true'
        },{
            label: '离职',
            value: 'false'
        }],
        onLoadSuccess:function () {
            $("#state").each(function(i){
                var span = $(this).siblings("span")[i];
                var targetInput = $(span).find("input:first");
                if(targetInput){
                    $(targetInput).attr("placeholder", $(this).attr("placeholder"));
                }
            });
        }
    });

    /*下拉框角色*/
    $("#role_").combobox({
        width:150,
        panelHeight:'auto',
        editable:false,
        url:"/getRoleList",
        multiple:true,
        valueField: 'rid',
        textField: 'rname',
/*        onSubmit:function (param) {
            var values = $("#role").combobox("getValues");
            console.log(values);
            for (var i=0;i<values.length;i++){
                var rid = values[i];
                param["roles["+i+"].rid"] = rid;
            }
        },*/
        onLoadSuccess:function () {
            $("#role_").each(function(i){
                var span = $(this).siblings("span")[i];
                var targetInput = $(span).find("input:first");
                if(targetInput){
                    $(targetInput).attr("placeholder", $(this).attr("placeholder"));
                }
            });
        }
    });

    /*下拉框部门*/
    $("#department").combobox({
        width:150,
        panelHeight:'auto',
        editable:false,
        url:"/departmentList",
        valueField: 'id',
        textField: 'name',
        onLoadSuccess:function () {
            $("#department").each(function(i){
                var span = $(this).siblings("span")[i];
                var targetInput = $(span).find("input:first");
                if(targetInput){
                    $(targetInput).attr("placeholder", $(this).attr("placeholder"));
                }
            });
        }
    });
});