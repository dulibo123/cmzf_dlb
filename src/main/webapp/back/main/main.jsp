﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>持名法州主页</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/themes/IconExtension.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/back/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/back/js/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/datagrid-detailview.js"></script>

    <script type="text/javascript">
	<!--菜单处理-->
    $(function () {
        $.ajax({
            url:'${pageContext.request.contextPath}/menu/findAllMenu',
            type:'post',
            dataType:'json',
            success:function(menu){
                $.each(menu,function (index,m) {
                    var content="<div style='text-align: center'>";
                    $.each(m.menus,function (idx,child) {
                        content+="<a onclick=\"addTabs('"+child.title+"','"+child.iconCls+"','"+child.href+"')\" style='width:95%;margin:10px 0px; border: 2px #00ee00 solid;' class='easyui-linkbutton' data-options=\"iconCls:'"+child.iconCls+"'\">"+child.title+"</a><br/>"
                    })
                    content+="</div>"
                    $("#aa").accordion('add',{
                        title:m.title,
                        iconCls:m.iconCls,
                        content:content
                    })
                })
            },
            error:function () {
                location.href="${pageContext.request.contextPath}/back/login.jsp";
            },


        })

    })
    function addTabs(title,iconCls,href) {
        if($("#tt").tabs("exists",title)){
            $("#tt").tabs("select",title);
        }else{
            $("#tt").tabs('add',{
                title:title,
                iconCls:iconCls,
                href:'${pageContext.request.contextPath}'+href,
                fit:true,
                closable:true,
            })
        }
    }
    /*修改密码窗口*/
    function openUpdatePassword(){
        $("#updatePassword").dialog({
            href:'${pageContext.request.contextPath}/back/main/updatePassword.jsp',
            width:500,
            height:300,
            buttons:[{
                text:'修改',
                handler:function(){
                    $("#updatePasswordFrom").form('submit',{

                        url:'${pageContext.request.contextPath}/admin/updatePassword',
                        success:function (result) {
                            var parseJSON = $.parseJSON(result);
                            if(parseJSON.success){
                                /*$.messager.show({title:'提示',msg:parseJSON.success});*/
                                location.href='${pageContext.request.contextPath}/back/login.jsp'
                            }else {
                                $.messager.show({title:'提示',msg:parseJSON.error});
                            }
                            $("#updatePassword").dialog('close');
                        }
                    })
                }
            },{
                text:'关闭',
                handler:function(){
                    $("#updatePassword").dialog('close');
                }
            }],
        });
    }
</script>

</head>
<body class="easyui-layout">   
    <div data-options="region:'north'" style="height:60px;background-color:  #5C160C">
    	<div style="font-size: 24px;color: #FAF7F7;font-family: 楷体;font-weight: 900;width: 500px;float:left;padding-left: 20px;padding-top: 10px" >持名法州后台管理系统</div>
    	<div style="font-size: 16px;color: #FAF7F7;font-family: 楷体;width: 300px;float:right;padding-top:15px">欢迎您:${sessionScope.admin.username} &nbsp;<a href="#" class="easyui-linkbutton" onclick="openUpdatePassword()" data-options="iconCls:'icon-edit'">修改密码</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/admin/logOut"  class="easyui-linkbutton" data-options="iconCls:'icon-01'">退出系统</a></div>
    </div>   
    <div data-options="region:'south'" style="height: 40px;background: #5C160C">
    	<div style="text-align: center;font-size:15px; color: #FAF7F7;font-family: 楷体" >&copy;百知教育 htf@zparkhr.com.cn</div>
    </div>   
       
    <div data-options="region:'west',title:'导航菜单'" style="width:220px;">
    	<div id="aa" class="easyui-accordion" data-options="fit:true">

        </div>
    </div>   
    <div data-options="region:'center'">
    	<div id="tt" class="easyui-tabs" data-options="fit:true,narrow:true,pill:true">   
		    <div title="主页" data-options="iconCls:'icon-neighbourhood',"  style="background-image:url(image/shouye.jpg);background-repeat: no-repeat;background-size:100% 100%;"></div>
		</div>  
    </div>
    <%--修改密码窗口--%>
    <div id="updatePassword"></div>
</body> 
</html>