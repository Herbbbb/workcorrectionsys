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
<form action="/workcorrectionsys/sys.do?action=upsysuser" name="f1" method="post"> 
            
<TABLE cellSpacing=1 cellPadding=3 width="100%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
   <%
   CommDAO dao = new CommDAO();
  String id = request.getParameter("id");
  if(id==null)id = (String)request.getAttribute("id");
  String s = "select * from sysuser where id ="+id;
  HashMap map = dao.select(s).get(0);
   %>
  <TR>
  <input type="hidden" id="id" name="id" value="<%=id %>" >
    <TD width="35%" height=24 align="center" class=forumrow>用户名</TD>
    <TD class=forumrowhighlight width="65%" 
      height=24><label>
      <input name="uname" type="text" id="olduserpass" value="<%=map.get("uname") %>" readonly=true>
    </label></TD></TR>
  <TR>
    <TD width="32%" height=24 align="center" class=forumrow>密码</TD>
    <TD class=forumrowhighlight width="68%" height=24><input name="pwd" type="text" id="pwd" value="<%=map.get("upass") %>"></TD></TR>
 

  <TR>
    <TD height=31 colspan="2" align="center" class=forumrow>
      <input type="submit" name="Submit"  value="提交信息">&nbsp;&nbsp;&nbsp;<input type="reset" name="Submit" value="重新填写">    </TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">
function check()
{

if(f1.pwd.value=="")
{
alert("请输密码");
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
 alert("失败");
 <%}%>
 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
  parent.location.replace("/workcorrectionsys/pages/sysuser.jsp");
 <%}%>
 </script>
