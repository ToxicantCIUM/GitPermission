$(function () {
    $("#employeeTable").bootstrapTable({
        url:'/getEmpList',
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
                {field:'username',title:'姓名',align:'center'},
                {field:'password',title:'密码',align:'right',align:'center'},
                {field:'inputtime',title:'入职时间',align:'center'},
                {field:'tel',title:'电话',align:'right',align:'center'},
                {field:'email',title:'邮箱',align:'right',align:'center'},
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
                },
                {field:'admin',title:'管理员',align:'right',align:'center',formatter: function(value,row,index){
                        if (row.admin && row.state){
                            return "管理员";
                        } else if (!row.state){
                            return "<p style='color: red'>已离职无职位</p>";
                        }else{
                            return "<p style='color: skyblue'>普通员工</p>"
                        }
                    }
                }
        ]

    });



    /*刷新按钮*/
    $("#btn_query").click(function () {
        $("#employeeTable").bootstrapTable('refresh', {url : '/getEmpList'});
    });
    /*添加按钮*/
    $("#btn_add").click(function () {
        $("#addModal").modal("show");
    });
    /*编辑按钮*/
    $("#btn_edit").click(function () {
        var data = $("#employeeTable").bootstrapTable("getSelections");
        if (data.length == 1){
            console.log(data[0]);
            /*显示模态窗口*/
            $("#editModal").modal("show");
            /*处理数据回显*/
            $(".id").val(data[0].id);
            $(".username").val(data[0].username);
            $(".password").val(data[0].password);
            $(".tel").val(data[0].tel);
            $(".email").val(data[0].email);
            $(".dataTimeFormat").val(data[0].inputtime);
            $(".department").val(data[0].department.id);
            $(".state").val(data[0].state);
            $(".role_").val(data[0].role);
        }else if(data.length>1){
            alert("不能同时修改多行数据进行编辑，请从新选择一行")
            /*$("#myModal").modal('hide');*/
        }else{
            alert("请选择需要编辑的行")
        }
    });
    /*删除按钮*/
    $("#btn_delete").click(function () {

        var selectData = $("#employeeTable").bootstrapTable("getSelections");
        if (selectData.length>0){
            alert("确认删除？");
            var i=0;
            var index = selectData.length;
            for (i; i<index;i++){
                /*alert(i===(index-1));*/
                $.get("/deleteEmployeeById?id="+selectData[i].id,function (data) {
                        if (data.success){
                            /**/
                            i--;
                            if ((i)==(index-1)){
                                alert(data.msg+"删除个数:"+index);
                            }
                            $("#employeeTable").bootstrapTable('refresh', {url : '/getEmpList'});
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

    /*下拉框角色*/
    getRole();
    function getRole() {
        $.get("/getRoleList",function (data) {
            console.log(data);
            if (data){
                var h=" ";
                $.each(data,function (key, value) {
                    console.log(value);
                    h += "<option value='"+value.rid+"'>"+value.rname+"</option>";
                });
                $(".role_").append(h);//append 添加进去并展示
                //当点击后，将选中的text传到id为content的文本框中
                $("#datatable_ajax_model").on("change", function(a, b, c) {
                    $(".role_").val(
                        $("#datatable_ajax_model option:selected").text());
                });

            }else{

            }
        });
    }

    /*下拉框department*/
    getDepartment();
    function getDepartment() {
        $.get("/departmentList",function (data) {
            if (data){
                var h=" ";
                $.each(data, function(key, value) {//拼接option
                    h += "<option value='" + value.id + "'>" + value.name + "</option>";
                });

                $(".department").append(h);//append 添加进去并展示
                //当点击后，将选中的text传到id为content的文本框中
                $("#datatable_ajax_model").on("change", function(a, b, c) {
                        $(".department").val(
                            $("#datatable_ajax_model option:selected").text());
                    });
            }else{
                console.log(data);
            }
        })
    }

/*    /!*时间选着器中文*!/
    $('.dataTimeFormat').datetimepicker({
        language: 'zh-CN',//显示中文
        format: 'yyyy-mm-dd',//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),
        todayBtn: true,//显示今日按钮
        autoclose: true,//选中自动关闭
        locale: moment.locale('zh-cn')
    });*/

});
/*保存（插入）员工的方法*/
function saveEmployee(){
    $.post("/saveEmployee",$("#addForm").serialize(),function (data) {
        if (data.success){
            alert(data.msg);
           /* $("#myModal").modal('hide');*/
            $("#employeeTable").bootstrapTable('refresh', {url : '/getEmpList'});
        }else{
            alert(data.msg);
           /* $("#myModal").modal('hide');*/
        }
    });
}

/*编辑（修改）员工的方法*/
function editEmployee() {
    $.post("/editEmployee",$("#editForm").serialize(),function (data) {
        if (data.success){
            alert(data.msg);
            $("#employeeTable").bootstrapTable('refresh', {url : '/getEmpList'});
        }else{
            alert(data.msg)
        }
    });
}



