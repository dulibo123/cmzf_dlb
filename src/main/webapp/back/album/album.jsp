<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

    <script>
        $(function () {
          $("#dg3").treegrid({
              url:'${pageContext.request.contextPath}/album/findAlbum',
               idField:'id',
               treeField:'title',
               animate:true,
               pagination:true,
              pageList:[2,10,20,30,40,50],
                fitColumns:true,
                columns:[[
                   {field:'title',title:'名称',width:200,editor:"{type:'numberbox',options:{precision:1}}"},
                    {field:'downPath',title:'下载路径',width:200/*,formatter:function(value,row,index){
                        var img="<img src='"+value+"' style='width:100px;height:80px'>";
                        return img;
                    }*/},
                    {field:'size',title:'章节大小',width:200},
                    {field:'duration',title:'章节时长',width:200},

                ]],
                fit:true,
                toolbar: "#linkbuttons3",
            })
        })
        function add() {
            $("#addDialog3").dialog({
                href:'${pageContext.request.contextPath}/back/album/addAlbum.jsp',
                width: 600,
                height: 500,
                buttons:[{
                    text:'保存',
                    handler:function(){

                        $("#saveSubmit3").form('submit',{
                            url:'${pageContext.request.contextPath}/album/addAlbum',
                            success:function (result) {
                               var parseJSON = $.parseJSON(result);
                                if(parseJSON.success){
                                    $.messager.show({title:'提示',msg:parseJSON.success});
                                }else {
                                    $.messager.show({title:'提示',msg:parseJSON.error});
                                }
                                $("#addDialog3").dialog('close');
                                $("#dg3").treegrid("reload");
                            }

                        })
                    }
                },{
                    text:'关闭',
                    handler:function(){
                        $("#addDialog3").dialog('close');
                    }
                }]
            })
        }

        function addChapter() {
        if($("#dg3").treegrid("getSelected")==null){
            $.messager.show({title:'提示',msg:"请选择一个专辑"});
        }else if($("#dg3").treegrid("getSelected").downPath!=null){

                $.messager.show({title:'提示',msg:"请选择专辑"});
             }else{
                var result= $("#dg3").treegrid("getSelected");
                var id=result.id;
                $("#addDialog4").dialog({
                    href:'${pageContext.request.contextPath}/back/album/addChapter.jsp?id='+id,
                    width: 600,
                    height: 400,
                    buttons:[{
                        text:'保存',
                        handler:function(){
                            $("#saveSubmit4").form('submit',{
                                url:'${pageContext.request.contextPath}/chapter/addChapter',
                                success:function (result) {

                                    var parseJSON = $.parseJSON(result);
                                    alert(parseJSON);
                                    if(parseJSON.success){
                                        $.messager.show({title:'提示',msg:parseJSON.success});
                                    }else {
                                        $.messager.show({title:'提示',msg:parseJSON.error});
                                    }
                                    $("#addDialog4").dialog('close');
                                    $("#dg3").treegrid("reload");
                                }

                            })
                        }
                    },{
                        text:'关闭',
                        handler:function(){
                            $("#addDialog4").dialog('close');
                        }
                    }]
                })

            }

        }
        //下载音频
        function downLoad(){
            if($("#dg3").treegrid("getSelected")==null){
                $.messager.show({title:'提示',msg:"请选择一个音频"});
            }else if($("#dg3").treegrid("getSelected").downPath==null){

                $.messager.show({title:'提示',msg:"请选择章节"});
            }else{
                var result= $("#dg3").treegrid("getSelected");

                var downPath1=result.downPath;
             $("#downLoad").attr('href','${pageContext.request.contextPath }/chapter/downLoad?openStyle=attachment&downPath='+downPath1)
            }
        }
        //显示专辑详情
        function showAlbum(){
            if($("#dg3").treegrid("getSelected")==null){
                $.messager.show({title:'提示',msg:"请选择一行数据"});
            }else if($("#dg3").treegrid("getSelected").downPath!=null){

                $.messager.show({title:'提示',msg:"请选择专辑"});
            }else{
                var result= $("#dg3").treegrid("getSelected");
                var id=result.id;
                $("#showDialog4").dialog({
                    href:'${pageContext.request.contextPath}/back/album/showAlbum.jsp?id='+id,
                    width: 600,
                    height:500,
                    buttons:[{
                        text:'关闭',
                        handler:function(){
                            $("#showDialog4").dialog('close');
                        }
                    }]
                })
            }
        }

    </script>


<table id="dg3" data-options="fit:true"></table>
<%--工具栏--%>
<div id="linkbuttons3">
    <a id="btn1" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="showAlbum()">专辑详情</a>
    <a id="btn2" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cut'" onclick="add()">添加专辑</a>
    <a id="btn3" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="addChapter()">添加章节</a>
    <a id="downLoad" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="downLoad()">下载音频</a>
</div>
<%--添加专辑窗口--%>
<div id="addDialog3" data-options="title:'专辑添加'"></div>
<%--添加章节窗口--%>
<div id="addDialog4" data-options="title:'章节添加'"></div>
<%--专辑详情窗口--%>
<div id="showDialog4" data-options="title:'专辑详情'"></div>
