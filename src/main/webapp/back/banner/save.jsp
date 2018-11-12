<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div style="text-align: center">
<form  id="saveSubmit" method="post" class="easyui-form" style="text-align: center;padding-top: 50px" enctype="multipart/form-data">
    <div style="margin-top: 20px">
       标题<input class="easyui-textbox" name="title" data-options="iconCls:'icon-search'" style="width:300px;">
    </div>
    <div style="margin-top: 20px">
        图片<input class="easyui-filebox" name="img"  data-options="buttonText:'请选择图片',accept:'image/jpeg,image/png,image/gif'" style="width:300px;">
     </div>
    <div style="margin-top: 20px">
    描述<input class="easyui-textbox" name="descs" data-options="iconCls:'icon-search'" style="width:300px;">
    </div>
    <div style="margin-top: 20px">
        状态<select class="easyui-combobox" name="status" id="status" style="width:300px;">
                <option value="启用">启用</option>
                <option value="禁止">禁止</option>
            </select>
    </div>
    <div style="margin-top: 20px">
         时间<input class="easyui-datebox" name="date"  style="width:300px;">
    </div>







</form>
</div>