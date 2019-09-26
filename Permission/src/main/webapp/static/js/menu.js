$(function () {

    $("#menu_datagrid").datagrid({
        url:"/menuList",
        columns:[[
            {field:'text',title:'菜单名称',width:1,align:'center'},
            {field:'url',title:'请求地址',width:1,align:'center'},
            {field:'parent',title:'父菜单',width:1,align:'center',formatter:function(value,row,index){
                    return value?value.text:'';
                }
            }
        ]],
        fit:true,
        rownumbers:true,
        singleSelect:true,
        striped:true,
        pagination:true,
        fitColumns:true,
        toolbar:'#menu_toolbar',
        pageList:[1,3,5,10,15,20],
        pageSize:5

    });

    /*
     * 初始化新增/编辑对话框
     */
    $("#menu_dialog").dialog({
        width:300,
        height:300,
        closed:true,
        buttons:'#menu_dialog_bt'
    });

    $("#add").click(function () {
        $("#menu_dialog").dialog("open");
    });

});