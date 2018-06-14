<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0040)http://2school.wygk.cn/admin/syscome.asp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>欢迎进入系统后台</TITLE>
<LINK 
href="/workcorrectionsys/pages/images/syscome.files/Admin.css" rel=stylesheet>
<SCRIPT language=javascript src="/workcorrectionsys/pages/images/syscome.files/Admin.js"></SCRIPT>

<STYLE type=text/css>.STYLE1 {
	FONT-WEIGHT: bold; COLOR: #0099ff
}
</STYLE>

<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY>
<form action="/workcorrectionsys/sys.do?action=upsysuserpwd" name="f1" method="post">
<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#87CEFA
border=0>
  <TBODY>
  <TR>
    <TD colSpan=2 height=24>修改登录密码</TD> 
  </TR>
  <TR>
    <TD width="27%" height=24 align="center" class=forumrow>请输入原密码</TD>
    <TD class=forumrowhighlight width="73%" 
      height=24><label>
      <input name="olduserpass" type="password" id="olduserpass">
    </label></TD></TR>
  <TR>
    <TD width="27%" height=24 align="center" class=forumrow>请输入新密码</TD>
    <TD class=forumrowhighlight width="73%" height=24><input name="userpass" type="password" id="userpass"></TD></TR>
  <TR>
    <TD height=24 align="center" class=forumrow>请重复新密码</TD>
    <TD class=forumrowhighlight height=24><input  name="copyuserpass" type="password" id="copyuserpass"></TD></TR>
  <TR>
    <TD height=24 colspan="2" align="center" class=forumrow>
      <input type="submit" name="Submit" onMouseDown="check();" value="提交信息">&nbsp;&nbsp;&nbsp;<input type="reset" name="Submit" value="重新填写">    </TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">
function check()
{
if(f1.olduserpass.value=="")
{
alert("请输入原密码");
return;
}
if(f1.userpass.value=="")
{
alert("请输入新密码");
return;
}
if(f1.copyuserpass.value!=f1.userpass.value)
{
alert("两次密码输入不一致");
return;
}
}
</script>
<script type="text/javascript">
<%
String error = (String)request.getAttribute("error");
if(error!=null)
{
 %>
 alert("原密码不对");
 <%}%>
 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
 <%}%>
 </script>
