<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<script>
    /*$('#cc').combobox({
        url:'combobox_data.json',
        valueField:'id',
        textField:'text'
    });*/

</script>
<div style="text-align: center">
    <form  id="saveSubmit4" method="post" class="easyui-form" style="text-align: center;padding-top: 50px" enctype="multipart/form-data">
       <input  name="album_id" value="${param.id}" style="display:none">

        <div style="margin-top: 20px">
            标题<input class="easyui-textbox" name="title" data-options="iconCls:'icon-search'" style="width:300px;">

        </div>
        <div style="margin-top: 20px">
            音频<input class="easyui-filebox" name="path"  data-options="buttonText:'请选择音频'" style="width:300px;">

        </div>

        <div style="margin-top: 20px">

            日期<input class="easyui-datebox" name="uploadDate"  style="width:300px;">
        </div>

       <%-- <div style="margin-top: 20px">

            所属专辑<input class="easyui-combobox" id="cc" name="album_id" data-options="iconCls:'icon-search'" style="width:300px;">
        </div>--%>
    </form>
</div>