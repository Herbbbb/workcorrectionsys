<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
<form action="/workcorrectionsys/sys.do?action=addteacher" name="f1" method="post" onsubmit="return ck()"> 
            
<TABLE cellSpacing=1 cellPadding=3 width="100%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
 
  <TR>
    <TD width="35%" height=24 align="center" class=forumrow>请输入用户名</TD>
    <TD class=forumrowhighlight width="65%" 
      height=24><label>
      <input name="uname" type="text" id="uname">
    </label></TD></TR>
  <TR>
    <TD width="32%" height=24 align="center" class=forumrow>请输入密码</TD>
    <TD class=forumrowhighlight width="68%" height=24><input name="upass" type="password" id="upass"></TD></TR>
 
  <TR>
    <TD width="32%" height=24 align="center" class=forumrow>真实姓名</TD>
    <TD class=forumrowhighlight width="68%" height=24><input name="tname" type="text" id="tname"></TD></TR>
  
  <TR>
    <TD width="32%" height=24 align="center" class=forumrow>性别</TD>
    <TD class=forumrowhighlight width="68%" height=24>
    	<select id="sex" name="sex">
    		<option value="男">男</option>
    		<option value="女">女</option>
    	</select>
    </TD></TR>
 
      <TR>
    <TD width="32%" height=24 align="center" class=forumrow>班级</TD>
    <TD class=forumrowhighlight width="68%" height=24>
    <select id="bjid" name="bjid">
    	<%CommDAO dao  = new  CommDAO();
    	String sql = "select * from bj where delstatus=0 "; 
    	ArrayList<HashMap> list = (ArrayList)dao.select(sql);
    	if(list.size()!=0){
    		for(HashMap map:list){
    	%>
    	<option value="<%=map.get("id") %>"><%=map.get("bjname") %></option>
    	<%} }%>
    </select>
    </TD></TR>
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
if(f1.uname.value=="")
{
alert("请输入用户名");
return false;
}
if(f1.pwd.value=="")
{
alert("请输入新密码");
return false;
}
if(f1.realname.value=="")
{
alert("请输入姓名");
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
 alert("用户名重复");
 <%}%>
 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
  parent.location.replace("/workcorrectionsys/pages/x-teachers.jsp");
 <%}%>
 </script>
