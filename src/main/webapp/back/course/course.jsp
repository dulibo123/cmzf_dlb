<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#courseTable").datagrid({
            url:'${pageContext.request.contextPath}/course/findCourse',
            pagination:true,
            pageList:[2,10,20,30,40,50],
            fitColumns:true,
            columns:[[
                {field:'title',title:'名称',width:200,editor:"{type:'numberbox',options:{precision:1}}"},
                {field:'marking',title:'功课类别',width:200/*,formatter:function(value,row,index){
                        var img="<img src='"+value+"' style='width:100px;height:80px'>";
                        return img;
                    }*/},
                {field:'creatTime',title:'创建时间',width:200},
            ]],
            fit:true,
            toolbar: "#courseLinkbutton",
        })
    })

    function addCourse() {
        $("#addCourseDialog").dialog({
            href:'${pageContext.request.contextPath}/back/course/saveCourse.jsp',
            width: 600,
            height: 400,
            buttons:[{
                text:'保存',
                handler:function(){
                    $("#saveCourseSubmit").form('submit',{
                        url:'${pageContext.request.contextPath}/course/addCourse',
                        success:function (result) {
                          var parseJSON = $.parseJSON(result);
                            if(parseJSON.success){
                                $.messager.show({title:'提示',msg:parseJSON.success});
                            }else {
                                $.messager.show({title:'提示',msg:parseJSON.error});
                            }
                            $("#addCourseDialog").dialog('close');
                            $("#courseTable").datagrid("reload");
                        }

                    })
                }
            },{
                text:'关闭',
                handler:function(){
                    $("#addCourseDialog").dialog('close');
                }
            }]
        })
    }

    function motifyCourse() {
        var datagrid1 = $("#courseTable").datagrid("getChecked");

        if (datagrid1.length!=1){
            $.messager.show({title:'提示',msg:"只能选择一行"})
        }else{
            var id;
            for(var i=0;i<datagrid1.length;i++){
                id=datagrid1[i].id;
            }
            $("#updateCourseDialog").dialog({
                href:'${pageContext.request.contextPath}/back/course/updateCourse.jsp?id='+id,
                width: 600,
                height: 400,
                buttons:[{
                    text:'修改',
                    handler:function(){
                        $("#updateCourseSubmit").form('submit',{
                            url:'${pageContext.request.contextPath}/course/updateCourse',
                            success:function (result) {
                                var parseJSON = $.parseJSON(result);
                                if(parseJSON.success){
                                    $.messager.show({title:'提示',msg:"修改成功"});
                                }else{
                                    $.messager.show({title:'提示',msg:parseJSON.message})
                                }
                                //关闭对话框
                                $("#updateCourseDialog").dialog('close');
                                $("#courseTable").datagrid("reload");
                            }
                        })
                    }
                },{
                    text:'关闭',
                    handler:function(){
                        $("#updateCourseDialog").dialog('close');
                    }
                }]
            })
        }
    }


    function removeCourse() {
        var datagrid1 = $("#courseTable").datagrid("getChecked");
        if (datagrid1.length<=0){
            $.messager.show({title:'提示',msg:'至少选择一行'})
        }else{
            var ids=[];
            for(var i=0;i<datagrid1.length;i++){
                ids.push(datagrid1[i].id);
            }
            $.ajax({
                url:'${pageContext.request.contextPath}/course/deleteCourse',
                type:"POST",
                traditional:true,
                data:{ids:ids},
                success:function (parseJSON) {
                    if(parseJSON.success){
                        $.messager.show({title:'提示',msg:"删除成功"});
                    }else{
                        $.messager.show({title:'提示',msg:"删除失败"});
                    }
                    $("#courseTable").datagrid("reload");
                }
            })
        }
    }
</script>
<table id="courseTable" data-options="fit:true"></table>
<%--工具栏--%>
<div id="courseLinkbutton">
    <a id="btn1" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="addCourse()">添加</a>
    <a id="btn2" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cut'" onclick="motifyCourse()">修改</a>
    <a id="btn3" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="removeCourse()">删除</a>
</div>
<%--添加功课窗口--%>
<div id="addCourseDialog" data-options="title:'添加功课'"></div>
<%--删除功课窗口--%>
<div id="deleteCourseDialog" data-options="title:'删除功课'"></div>
<%--修改功课窗口--%>
<div id="updateCourseDialog" data-options="title:'修改功课'"></div>