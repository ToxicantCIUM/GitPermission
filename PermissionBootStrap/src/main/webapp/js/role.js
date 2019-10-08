$(function () {
    $("#roleTable").bootstrapTable({
        url:'/getRoleList',
        striped : true,
        /*pageNumber : 1, //初始化加载第一页*/
        pagination:true,
        sidePagination : 'client',//server:服务器端分页|client：前端分页
        pageSize : 3,//单页记录数
        /*pageList : [1,3,5,10,15],//可选择单页记录数*/
        showRefresh : false,//刷新按钮
        sortOrder: "desc",
        clickToSelect: true,                //是否启用点击选中行
        columns:[[
            {
                checkbox: true,                    //点击选着
                visible: true                  //是否显示复选框
            },
            {field:'rname',title:'角色名称',align:'center'},
            {field:'rnum',title:'角色编号',align:'right',align:'center'}
        ]]
    });


    /*刷新按钮*/
    $("#btn_query").click(function () {
        $("#roleTable").bootstrapTable('refresh', {url : '/getRoleList'});
    });
    /*添加按钮*/
    $("#btn_add").click(function () {
        $("#addModal").modal("show");
    });
    /*编辑按钮*/
    $("#btn_edit").click(function () {
        var data = $("#roleTable").bootstrapTable("getSelections");
        if (data.length == 1){
            console.log(data[0]);
            /*显示模态窗口*/
            $("#editModal").modal("show");
            /*处理数据回显*/
            $(".rid").val(data[0].rid);
            $(".rname").val(data[0].rname);
            $(".rnum").val(data[0].rnum);
        }else if(data.length>1){
            alert("不能同时修改多行数据进行编辑，请从新选择一行")
        }else{
            alert("请选择需要编辑的行")
        }
    });
    /*删除按钮*/
    $("#btn_delete").click(function () {

        var selectData = $("#roleTable").bootstrapTable("getSelections");
        if (selectData.length>0){
            alert("确认删除？");
            var i=0;
            var index = selectData.length;
            for (i; i<index;i++){
                /*alert(i===(index-1));*/
                $.get("/deleteRole?rid="+selectData[i].rid,function (data) {
                    if (data.success){
                        /**/
                        i--;
                        if ((i)==(index-1)){
                            alert(data.msg+"删除个数:"+index);
                        }
                        $("#roleTable").bootstrapTable('refresh', {url : '/getRoleList'});
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

function saveRole() {
    $.post("/saveRole",$("#addForm").serialize(),function (data) {
        if (data.success){
            alert(data.msg);
            $("#roleTable").bootstrapTable('refresh', {url : '/getRoleList'});
        }else{
            alert(data.msg);
        }
    });
}
function editRole() {
    $.post("/updateRole",$("#editForm").serialize(),function (data) {
        if (data.success){
            alert(data.msg);
            $("#roleTable").bootstrapTable('refresh', {url : '/getRoleList'});
        }else{
            alert(data.msg)
        }
    });
}