<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/static/common/common.jsp"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>权限管理</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/index.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/index.css">
</head>

<body class="easyui-layout">
<%--顶部--%>
<div data-options="region:'north'" style="background: #1AA094;  padding: 20px 20px; width: 600px">
    <div style="width: 300px;height: 30px">
        <p class="pro_name" style="font-size: 20px">权限管理系统</p>
    </div>

    <p id="username_p">
        <font>欢迎您！:</font>
        <%--获取用户名--%>
        <shiro:principal type="com.yb.domain.Employee" property="username"/>
        <a href="${pageContext.request.contextPath}/logout">退出</a>
    </p>
</div>
<%--尾部--%>
<div data-options="region:'south'" style="height:50px; border-bottom: 0px solid #393D49;background:#1AA094;">
    <p align="center" style="font-size: 14px">权限系统</p>
</div>
<%--左侧--%>
<div data-options="region:'west',split:true" style="width:300px;">

    <div id="aa" class="easyui-accordion" data-options="fit:true">
        <div title="菜单" data-options="iconCls:'icon-save',selected:true" style="overflow:auto;padding:10px;">
            <!--tree-->
            <ul id="tree"></ul>
        </div>
        <div title="公告" data-options="iconCls:'icon-reload'" style="padding:10px;">

        </div>
    </div>
</div>
<%--主体--%>
<div data-options="region:'center'" style="background:#eee;">
    <!--标签-->
    <div id="tabs" style="overflow: hidden">

    </div>
</div>

<script>
    $(function () {
        $("#aa").accordion({
            border: false,
            collapsible: true,
            collapsed: true
        });

        $("#tabs").tabs({
            fit: true
        });

        $('#tree').tree({
            url: '/static/tree.json',
            lines: true,
            onSelect: function (node) {
                /*在添加之前, 做判断  判断这个标签是否存在 */
                var exists = $("#tabs").tabs("exists", node.text);
                if (exists) {
                    /*存在,就让它选中*/
                    $("#tabs").tabs("select", node.text);
                } else {
                    if (node.url != '' && node.url != null) {
                        /*如果不存在 ,添加新标签*/
                        $("#tabs").tabs("add", {
                            title: node.text,
                            /*href:node.attributes.url,*/  /*href  引入的是body当中*/
                            content: "<iframe src=" + node.url + " frameborder='0' width='100%' height='100%'></iframe>",
                            closable: true
                        })
                    }
                }
            },
            onLoadSuccess: function (node, data) {
                console.log(data[0].children[0].id);
                if (data.length > 0) {
                    //找到第一个元素
                    var n = $('#tree').tree('find', data[0].children[0].id);
                    //调用选中事件
                    $('#tree').tree('select', n.target);
                }
            }
        });

    });
</script>
</body>
</html>