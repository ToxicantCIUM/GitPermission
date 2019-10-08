$(function () {
    $("#departmentTable").bootstrapTable({
        url:'/departmentList',
        striped : true,
        cache: false,
        pageNumber : 1, //初始化加载第一页
        pagination:true,
        toolbar:'#bar',
        sidePagination : 'client',//server:服务器端分页|client：前端分页
        pageSize : 5,//单页记录数
        pageList : [1,3,5,10,15],//可选择单页记录数
        showRefresh : false,//刷新按钮
        sortable: true,                     //是否启用排序
        sortOrder: "desc",
        clickToSelect: true,                //是否启用点击选中行
        columns:[
            {
                checkbox: true,                    //点击选着
                visible: true                  //是否显示复选框
            },
            {field:'id',title:'部门id',align:'center'},
            {field:'name',title:'部门名称',align:'center'}
        ]

    });



    /*刷新按钮*/
    $("#btn_query").click(function () {
        $("#departmentTable").bootstrapTable('refresh', {url : '/departmentList'});
    });
    /*添加按钮*/
    $("#btn_add").click(function () {
        $("#addModal").modal("show");
    });
    /*编辑按钮*/
    $("#btn_edit").click(function () {
        var data = $("#departmentTable").bootstrapTable("getSelections");
        if (data.length == 1){
            console.log(data[0]);
            /*显示模态窗口*/
            $("#editModal").modal("show");
            /*处理数据回显*/
            $("#depId").val(data[0].id);
            $("#depName").val(data[0].name);
        }else if(data.length>1){
            alert("不能同时修改多行数据进行编辑，请从新选择一行")
            /*$("#myModal").modal('hide');*/
        }else{
            alert("请选择需要编辑的行")
        }
    });
    /*删除按钮*/
    $("#btn_delete").click(function () {

        var selectData = $("#departmentTable").bootstrapTable("getSelections");
        if (selectData.length>0){
            alert("确认删除？");
            var i=0;
            var index = selectData.length;
            for (i; i<index;i++){
                /*alert(i===(index-1));*/
                $.get("/deleteDepartmentById?id="+selectData[i].id,function (data) {
                    if (data.success){
                        /**/
                        i--;
                        if ((i)==(index-1)){
                            alert(data.msg+"删除个数:"+index);
                        }
                        $("#departmentTable").bootstrapTable('refresh', {url : '/departmentList'});
                    }else{
                        alert(data.msg)
                    }
                });
            }
        }
        else{
            alert("请选着要删除的数据")
        }
    });
});
/*保存（插入）员工的方法*/
function saveDepartment(){
    $.post("/saveDepartment",$("#addForm").serialize(),function (data) {
        if (data.success){
            alert(data.msg);
            /* $("#myModal").modal('hide');*/
            $("#departmentTable").bootstrapTable('refresh', {url : '/departmentList'});
        }else{
            alert(data.msg);
            /* $("#myModal").modal('hide');*/
        }
    });
}

/*编辑（修改）员工的方法*/
function editDepartment() {
    $.post("/editDepartment",$("#editForm").serialize(),function (data) {
        if (data.success){
            alert(data.msg);
            $("#departmentTable").bootstrapTable('refresh', {url : '/departmentList'});
        }else{
            alert(data.msg)
        }
    });
}
