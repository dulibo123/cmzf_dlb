<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false" %>
<script>
    function checkRelPsw(){
        var relpswValue=document.getElementById("realPassword").value;
        var pswValue=document.getElementById("newPassword").value;
        //alert(pswValue);
        var relpsw=document.getElementById("relpswMessageSpan");
        if(relpswValue!=pswValue){
            relpsw.innerHTML="<font color='red'>两次密码不一致</font>";
            return false;
        }else{
            relpsw.innerHTML="<font color='green'>√</font>";
            return true;
        }

    }


</script>
<div style="text-align: center">
    <form class="easyui-form" id="updatePasswordFrom" style="text-align: center;padding-top: 50px" method="post">
        <div style="margin-top: 20px">
            原密码&nbsp;&nbsp;&nbsp;：<input id="password" name="oldPassword" prompt="Password" class="easyui-passwordbox" data-options="showEye:true">
            <span id="oldPasswordSpan"></span></td>
        </div>
        <div style="margin-top: 20px">
            新密码&nbsp;&nbsp;&nbsp;：<input id="newPassword" name="password" prompt="Password" class="easyui-passwordbox">
            <span id="newPasswordSpan"></span></td>
        </div>
        <div style="margin-top: 20px">
            确认密码：<input id="realPassword" name="realPassword" class="easyui-passwordbox"  onblur="checkRelPsw()">
            <span id="relpswMessageSpan"></span></td>
        </div>
    </form>
</div>