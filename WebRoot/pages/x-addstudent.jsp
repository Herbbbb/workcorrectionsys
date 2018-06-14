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
<form action="/workcorrectionsys/sys.do?action=addstudent" name="f1" method="post" onsubmit="return ck();" enctype="multipart/form-data"> 
            
<TABLE cellSpacing=1 cellPadding=3 width="100%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
 
  <TR>
    <TD width="35%" height=24 align="center" class=forumrow>请输入登陆名</TD>
    <TD class=forumrowhighlight width="65%" 
      height=24><label>
      <input name="uname" type="text" id="uname" size="40">*
    </label></TD></TR>
  <TR>
    <TD width="32%" height=24 align="center" class=forumrow>请输入密码</TD>
    <TD class=forumrowhighlight width="68%" height=24><input name="upass" type="text" id="upass" size="40" value="123">*</TD></TR>
   <TR>
    <TD width="32%" height=24 align="center" class=forumrow>真实姓名</TD>
    <TD class=forumrowhighlight width="68%" height=24><input name="tname" type="text" id="tname" size="40" >*</TD></TR>
     <TR>
    <TD width="32%" height=24 align="center" class=forumrow>年龄</TD>
    <TD class=forumrowhighlight width="68%" height=24><input name="age" type="text" id="age" size="40" ></TD></TR>
   <TR>
    <TD width="32%" height=24 align="center" class=forumrow>性别</TD>
    <TD class=forumrowhighlight width="68%" height=24>
		<select id="sex" name="sex">
			<option value="男"/>男
			<option value="女"/>女
		</select>
	</TD></TR>
    <TR>
    <TD width="32%" height=24 align="center" class=forumrow>班级</TD>
    <TD class=forumrowhighlight width="68%" height=24>
    <select id="bj" name="bj">
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
    <TD width="32%" height=24 align="center" class=forumrow>专业</TD>
    <TD class=forumrowhighlight width="68%" height=24><input name="zy" type="text" id="zy" size="40" ></TD></TR>
  <TR>
    <TD width="32%" height=24 align="center" class=forumrow>入学年份</TD>
    <TD class=forumrowhighlight width="68%" height=24><input name="rxyear" type="text" id="rxyear" size="40" ></TD></TR>
  <TR>
    <TD width="32%" height=24 align="center" class=forumrow>照片</TD>
    <TD class=forumrowhighlight width="68%" height=24><input name="txt" type="file" id="txt"  ></TD></TR>
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
if(f1.uname.value==""){
alert("登陆名不能为空");
return false;
}
if(f1.upass.value==""){
alert("密码不能为空");
return false;
}
}

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
  parent.location.replace("/workcorrectionsys/pages/x-students.jsp");
 <%}%>
 </script>
