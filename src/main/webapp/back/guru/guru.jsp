<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; UTF-8" %>

<script>
    $(function () {
        $("#dg2").datagrid({
            url:'${pageContext.request.contextPath}/guru/findGuru',
            pagination:true,
            fitColumns:true,
            columns:[[
                {field:'cks',title:'cks',width:100,checkbox:true},
                {field:'id',title:'id',width:200},
                {field:'title',title:'姓名',width:200},
                {field:'headPic',title:'头像',width:200/*,formatter:function(value,row,index){
                        var img="<img src='"+value+"' style='width:100px;height:80px'>";
                        return img;
                    }*/},
                {field:'gender',title:'性别',width:200},

            ]],
            view: detailview,
            detailFormatter: function(rowIndex, rowData){
                return '<table><tr>' +
                    '<td rowspan=2 style="border:0"><img src="${pageContext.request.contextPath}' + rowData.headPic + '" style="height:50px;"></td>' +
                    '<td style="border:0">' +
                    '<p>Attribute: ' + rowData.title + '</p>' +
                    '<p>Status: ' + rowData.gender + '</p>' +
                    '</td>' +
                    '</tr></table>';
            },

            fit:true,
            toolbar: "#linkbuttons2",
        })
    })

    function add() {
        $("#addDialog2").dialog({
            href:'${pageContext.request.contextPath}/back/guru/save.jsp',
            width: 600,
            height: 400,
            buttons:[{
                text:'保存',
                handler:function(){
                    $("#addDialog2").dialog("close");
                    $("#saveSubmit2").form('submit',{
                        url:'${pageContext.request.contextPath}/guru/addGuru',
                        success:function (result) {
                            console.log(result);

                            var parseJSON = $.parseJSON(result);
                            if(parseJSON.success){
                                $.messager.show({title:'提示',msg:parseJSON.success});
                            }else {
                                $.messager.show({title:'提示',msg:parseJSON.error});
                            }
                            $("#addDialog2").dialog('close');
                            $("#dg2").datagrid("reload");
                        }

                    })
                }
            },{
                text:'关闭',
                handler:function(){
                    $("#addDialog2").dialog('close');
                }
            }]
        })
    }

    function remove() {
        var datagrid1 = $("#dg2").datagrid("getChecked");
        if (datagrid1.length<=0){
            $.messager.show({title:'提示',msg:'至少选择一行'})
        }else{
            var ids=[];
            for(var i=0;i<datagrid1.length;i++){
                ids.push(datagrid1[i].id);
            }

            $.ajax({
                url:'${pageContext.request.contextPath}/guru/deleteGuru',
                type:"POST",
                traditional:true,
                data:{ids:ids},
                success:function (parseJSON) {
                    if(parseJSON.success){
                        $.messager.show({title:'提示',msg:parseJSON.success});
                    }else{
                        $.messager.show({title:'提示',msg:parseJSON.error});
                    }
                    $("#dg2").datagrid("reload");
                }
            })
        }
    }
    function update() {
        var datagrid1 = $("#dg2").datagrid("getChecked");

        if (datagrid1.length!=1){
            $.messager.show({title:'提示',msg:"只能选择一行"})
        }else{
            var id;
          
            for(var i=0;i<datagrid1.length;i++){
                id=datagrid1[i].id;

            }

            $("#updateGuruDialog").dialog({
                href:'${pageContext.request.contextPath}/back/guru/update.jsp?id='+id,
                width: 600,
                height: 400,
                buttons:[{
                    text:'修改',
                    handler:function(){alert("5");
                        $("#updateGuruSubmit").form('submit',{

                            url:'${pageContext.request.contextPath}/guru/updateGuru',
                            success:function (result) {
                                var parseJSON = $.parseJSON(result);
                                if(parseJSON.success){
                                    $.messager.show({title:'提示',msg:parseJSON.success});
                                }else{
                                    $.messager.show({title:'提示',msg:parseJSON.message})
                                }
                                //关闭对话框
                                $("#updateGuruDialog").dialog('close');
                                $("#dg2").datagrid("reload");
                            }
                        })
                    }
                },{
                    text:'关闭',
                    handler:function(){
                        $("#updateGuruDialog").dialog('close');
                    }
                }]
            })
        }
    }
</script>
<table id="dg2" data-options="fit:true"></table>
<%--工具栏--%>
<div id="linkbuttons2">
    <a id="btn1" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="add()">添加</a>

    <a id="btn3" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="remove()">删除</a>

</div>
<%--添加用户窗口--%>
<div id="addDialog2" data-options="title:'图片添加'"></div>
<%--修改用户窗口--%>
<div id="updateGuruDialog" data-options="title:'图片添加'"></div>




