<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="common.Info"%>
<%@page import="common.CommDAO"%>
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
<form action="/workcorrectionsys/sys.do?action=addkc" name="f1" method="post" onsubmit="return ck()"> 
            
<TABLE cellSpacing=1 cellPadding=3 width="100%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
 
  <TR>
    <TD width="35%" height=24 align="center" class=forumrow>课程名称</TD>
    <TD class=forumrowhighlight width="65%" 
      height=24><label>
      <input name="kcname" type="text" id="kcname">*
    </label></TD></TR>
             
     <TR>
    <TD width="35%" height=24 align="center" class=forumrow>学分</TD>
    <TD class=forumrowhighlight width="65%" 
      height=24><label>
      <input name="xf" type="text" id="xf">
    </label></TD></TR>
  
  <TR>
    <TD height=31 colspan="2" align="center" class=forumrow>
      <input type="submit" name="Submit"  value="提交信息">&nbsp;&nbsp;&nbsp;<input type="reset" name="Submit" value="重新填写">    </TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">
function ck()
{
if(f1.kname.value=="")
{
alert("请输入课程名称");
return false;
}
if(f1.xf.value=="")
{
alert("请输入学分");
return false;
}
}
</script>
<script type="text/javascript">
<%
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("该课程已匹配过该教师");
 <%}%>
 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
  parent.location.replace("/workcorrectionsys/pages/x-kcs.jsp");
 <%}%>
 </script>
