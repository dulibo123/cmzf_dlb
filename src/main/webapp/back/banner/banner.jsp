<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>

<script>
    $(function () {
        $("#dg").datagrid({
            url:'${pageContext.request.contextPath}/banner/findBanner',
            pagination:true,
            fitColumns:true,
            columns:[[
                {field:'cks',title:'cks',width:100,checkbox:true},
                {field:'id',title:'id',width:200},
                {field:'title',title:'名称',width:200,editor:"{type:'numberbox',options:{precision:1}}"},
                {field:'imgPath',title:'路径',width:200/*,formatter:function(value,row,index){
                        var img="<img src='"+value+"' style='width:100px;height:80px'>";
                        return img;
                    }*/},
                {field:'descs',title:'描述',width:200},
                {field:'status',title:'状态',width:200},
                {field:'date',title:'时间',width:200},
            ]],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}' + rowData.imgPath + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>Attribute: ' + rowData.title + '</p>' +
                    '<p>Status: ' + rowData.descs + '</p>' +
                    '</td>' +
                    '</tr></table>';
            },

            fit:true,
            toolbar: "#linkbuttons",
    })
    })
    function add() {
        $("#addDialog").dialog({
            href:'${pageContext.request.contextPath}/back/banner/save.jsp',
            width: 600,
            height: 400,
            buttons:[{
                text:'保存',
                handler:function(){
                    $("#addDialog").dialog("close");
                    $("#saveSubmit").form('submit',{
                        url:'${pageContext.request.contextPath}/banner/addBanner',
                        success:function (result) {
                            console.log(result);
                            alert(result);
                            var parseJSON = $.parseJSON(result);
                            if(parseJSON.success){
                                $.messager.show({title:'提示',msg:parseJSON.success});
                            }else {
                                $.messager.show({title:'提示',msg:parseJSON.error});
                            }
                            $("#addDialog").dialog('close');
                            $("#dg").datagrid("reload");
                        }

                    })
                }
            },{
                text:'关闭',
                handler:function(){
                    $("#addDialog").dialog('close');
                }
            }]
        })
    }
    function remove() {
        var datagrid1 = $("#dg").datagrid("getChecked");
        if (datagrid1.length<=0){
            $.messager.show({title:'提示',msg:'至少选择一行'})
        }else{
            var ids=[];
            for(var i=0;i<datagrid1.length;i++){
                ids.push(datagrid1[i].id);
            }
         $.ajax({
            url:'${pageContext.request.contextPath}/banner/remove',
            type:"POST",
            traditional:true,
            data:{ids:ids},
            success:function (parseJSON) {
                if(parseJSON.success){
                    $.messager.show({title:'提示',msg:parseJSON.success});
                }else{
                    $.messager.show({title:'提示',msg:parseJSON.error});
                 }
                $("#dg").datagrid("reload");
            }
        })
        }
    }
    function update() {
      var datagrid1 = $("#dg").datagrid("getChecked");

        if (datagrid1.length!=1){
            $.messager.show({title:'提示',msg:"只能选择一行"})
        }else{
            var id;
            var imgPath;
            for(var i=0;i<datagrid1.length;i++){
                id=datagrid1[i].id;
                imgPath=datagrid1[i].imgPath;
            }
            $("#updateDialog").dialog({
                href:'${pageContext.request.contextPath}/back/banner/update.jsp?id='+id+'&imgPath='+imgPath,
                width: 600,
                height: 400,
                buttons:[{
                    text:'修改',
                    handler:function(){
                        $("#updateSubmit").form('submit',{
                            url:'${pageContext.request.contextPath}/banner/updateBanner',
                            success:function (result) {
                                var parseJSON = $.parseJSON(result);
                                if(parseJSON.success){
                                    $.messager.show({title:'提示',msg:parseJSON.success});
                                }else{
                                    $.messager.show({title:'提示',msg:parseJSON.message})
                                }
                                //关闭对话框
                                $("#updateDialog").dialog('close');
                                $("#dg").datagrid("reload");
                            }
                        })
                    }
                },{
                    text:'关闭',
                    handler:function(){
                        $("#updateDialog").dialog('close');
                    }
                }]
            })
        }
    }
</script>
<table id="dg" data-options="fit:true"></table>
<%--工具栏--%>
<div id="linkbuttons">
    <a id="btn1" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="add()">添加</a>
    <a id="btn2" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cut'" onclick="update()">修改</a>
    <a id="btn3" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="remove()">删除</a>
</div>
<%--添加用户窗口--%>
<div id="addDialog" data-options="title:'图片添加'"></div>
<%--修改用户窗口--%>
<div id="updateDialog" data-options="title:'图片添加'"></div>




