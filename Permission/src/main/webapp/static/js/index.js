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