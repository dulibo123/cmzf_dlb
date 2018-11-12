<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<script>
    $(function () {

        $("#updateSubmit").form('load','${pageContext.request.contextPath}/banner/findOne?id=${param.id}');

    })
</script>
<div style="text-align: center">
    <form  id="updateSubmit" method="post" class="easyui-form" style="text-align: center;padding-top: 50px" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${param.id}">
        <input type="hidden" name="imgPath" value="${param.imgPath}">
        <div style="margin-top: 20px">
            标题<input class="easyui-textbox" name="title" data-options="iconCls:'icon-search'" style="width:300px;">

        </div>
        <%--<div style="margin-top: 20px">
            图片<input class="easyui-filebox" name="imgPath"  data-options="buttonText:'请选择图片',accept:'image/jpeg,image/png,image/gif'" style="width:300px;">

        </div>--%>
        <div style="margin-top: 20px">
            描述<input class="easyui-textbox" name="descs" data-options="iconCls:'icon-search'" style="width:300px;">

        </div>
        <div style="margin-top: 20px">

            状态<select class="easyui-combobox" name="status" id="status" style="width:300px;">
            <option value="y">y</option>
            <option value="n">n</option>
        </select>
        </div>
        <div style="margin-top: 20px">

            时间<input class="easyui-datebox" name="date" data-options="iconCls:'icon-search'" style="width:300px;">
        </div>
    </form>
</div>