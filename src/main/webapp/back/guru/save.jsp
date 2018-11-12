<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>

<div style="text-align: center">
<form  id="saveSubmit2" method="post" class="easyui-form" style="text-align: center;padding-top: 50px" enctype="multipart/form-data">
    <div style="margin-top: 20px">
       标题<input class="easyui-textbox" name="title" data-options="iconCls:'icon-search'" style="width:300px;">

    </div>
    <div style="margin-top: 20px">
        头像<input class="easyui-filebox" name="pic"  data-options="buttonText:'请选择图片',accept:'image/jpeg,image/png,image/gif'" style="width:300px;">

    </div>

    <div style="margin-top: 20px">

        性别<select class="easyui-combobox" name="gender" id="status" style="width:300px;">
                <option value="男">男</option>
                <option value="女">女</option>
             </select>
    </div>








</form>
</div>