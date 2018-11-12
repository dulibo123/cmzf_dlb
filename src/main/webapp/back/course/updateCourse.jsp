<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<script>
    $(function () {

        $("#updateCourseSubmit").form('load','${pageContext.request.contextPath}/course/findOneCourse?id=${param.id}');

    })
</script>
<div style="text-align: center">
    <form  id="updateCourseSubmit" method="post" class="easyui-form" style="text-align: center;padding-top: 50px" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${param.id}">

        <div style="margin-top: 20px">
            标题<input class="easyui-textbox" name="title" data-options="iconCls:'icon-search'" style="width:300px;">

        </div>


        <div style="margin-top: 20px">

            类型<select class="easyui-combobox" name="marking" id="status" style="width:300px;">
            <option value="必修">必修</option>
            <option value="选修">选修</option>
        </select>
        </div>
        <div style="margin-top: 20px">

            时间<input class="easyui-datebox" name="creatTime" data-options="iconCls:'icon-search'" style="width:300px;">
        </div>
    </form>
</div>