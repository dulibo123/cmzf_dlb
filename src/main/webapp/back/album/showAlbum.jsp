<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<script>
    $(function () {
        $("#showAlbum").form('load','${pageContext.request.contextPath}/album/findOneAlbum?id=${param.id}');

    })

</script>
<div style="text-align:center">
    <form  id="showAlbum" method="post" class="easyui-form" style="text-align: center;padding-top: 50px" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${param.id}">

        <div style="margin-top: 20px">
        标题<input class="easyui-textbox" name="title" data-options="iconCls:'icon-search'" style="width:300px;">
        </div>
        <div style="margin-top: 20px">
            时间<input class="easyui-textbox" name="publishDate"  style="width:300px;">
        </div>
        <div style="margin-top: 20px">
            图片<input class="easyui-textbox" id="a" name="coverImg" style="width:300px;">
        </div>
         <div style="margin-top: 20px">
             得分<input class="easyui-textbox" name="score" data-options="iconCls:'icon-search'" style="width:300px;">
         </div>
        <div style="margin-top: 20px">
        作者<input class="easyui-textbox" name="author" data-options="iconCls:'icon-search'" style="width:300px;">
        </div>
        <div style="margin-top: 20px">
            播音<input class="easyui-textbox" name="broadCast" data-options="iconCls:'icon-search'" style="width:300px;">
        </div>
        <div style="margin-top: 20px">
            简介<input class="easyui-textbox" name="broadCast" data-options="multiline:true" style="width:300px;height:100px">
        </div>
    </form>
</div>