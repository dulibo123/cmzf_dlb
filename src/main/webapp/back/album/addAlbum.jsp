<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<script>
    $(function(){
        $('#author').combobox({
            url:'${pageContext.request.contextPath}/guru/findAllGuru',
            valueField:'title',
            textField:'title'
        });
    })


</script>
<div style="text-align: center">
    <form  id="saveSubmit3" method="post" class="easyui-form" style="text-align: center;padding-top: 50px" enctype="multipart/form-data">
        <div style="margin-top: 20px">
            标题<input class="easyui-textbox" name="title" data-options="iconCls:'icon-search'" style="width:300px;">
        </div>
        <div style="margin-top: 20px">
            图片<input class="easyui-filebox" name="pic"  data-options="buttonText:'请选择图片',accept:'image/jpeg,image/png,image/gif'" style="width:300px;">
        </div>
       <div style="margin-top: 20px">
            得分<input class="easyui-textbox" name="score" data-options="iconCls:'icon-search'" style="width:300px;">
       </div>
        <div style="margin-top: 20px">
            日期<input class="easyui-datebox" name="publishDate"  style="width:300px;">
        </div>
        <div style="margin-top: 20px">
        作者<input id="author" class="easyui-combobox" name="author"  style="width:300px;">
        </div>
        <div style="margin-top: 20px">
            播音<input class="easyui-textbox" name="broadCast" data-options="iconCls:'icon-search'" style="width:300px;">
        </div>
        <div style="margin-top: 20px">
            简介<input class="easyui-textbox" name="brief" data-options="multiline:true" style="width:300px;height:100px">
        </div>
    </form>
</div>