<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="common.CommDAO"%>
<%@page import="common.Info"%>
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
<% HashMap admin = (HashMap)request.getSession().getAttribute("admin");
	CommDAO dao = new CommDAO();
	HashMap map = dao.select("select * from student where id="+admin.get("id")).get(0);
 %>
<form action="/workcorrectionsys/sys.do?action=stuupuser" name="f1" method="post" enctype="multipart/form-data">
<input type="hidden" id="id" name="id" />
<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#87CEFA
border=0>
  <TBODY>
  <TR>
    <TD colSpan=2 height=24>修改个人信息</TD> 
  </TR>
  <TR>
    <TD width="27%" height=80 align="center" class=forumrow>照片</TD>
    <TD class=forumrowhighlight width="73%" height=24>
    <img src="../upfile/<%=map.get("img") %>" width="60" height="70"/>
    <input type="file" id="txt" name="txt" />
    </TD></TR>
  <TR>
    <TD width="27%" height=24 align="center" class=forumrow>用户名</TD>
    <TD class=forumrowhighlight width="73%" height=24><input name="uname" type="text" id="uname" disabled=disabled></TD></TR>
  <TR>
    <TD width="27%" height=24 align="center" class=forumrow>密码</TD>
    <TD class=forumrowhighlight width="73%" height=24><input name="upass" type="password" id="upass"></TD></TR>
  <TR>
    <TD height=24 align="center" class=forumrow>姓名</TD>
    <TD class=forumrowhighlight height=24><input  name="tname" type="text" id="tname"></TD></TR>
  
    <TR>
    <TD height=24 align="center" class=forumrow>性别</TD>
    <TD class=forumrowhighlight height=24>
		<select id="sex" name="sex">
			<option value="男">男</option>
			<option value="女">女</option>
		</select>
	</TD></TR>
    <TR>
    <TD height=24 align="center" class=forumrow>年龄</TD>
    <TD class=forumrowhighlight height=24>
		<input  name="age" type="text" id="age">
	</TD></TR>
        <TR>
    <TD height=24 align="center" class=forumrow>专业</TD>
    <TD class=forumrowhighlight height=24>
		<input  name="zy" type="text" id="zy" disabled=disabled>
	</TD></TR>
	
	<TR>
    <TD height=24 align="center" class=forumrow>班级</TD>
    <TD class=forumrowhighlight height=24>
    <%HashMap m = dao.select("select * from bj where id="+map.get("bj")).get(0);
    
     %>
		<input  name="baj" type="text" id="baj" value="<%=m.get("bjname") %>" disabled=disabled>
	</TD></TR>
	<TR>
    <TD height=24 align="center" class=forumrow>入学年份</TD>
    <TD class=forumrowhighlight height=24>
		<input  name="rxyear" type="text" id="rxyear" disabled=disabled>
	</TD></TR>
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
if(f1.upass.value=="")
{
alert("请输入密码");
return;
}
if(f1.tname.value=="")
{
alert("请输入姓名");
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
 location.replace("/workcorrectionsys/pages/stuupuser.jsp");
 <%}%>
 </script>
 
<%=Info.tform(map)%>