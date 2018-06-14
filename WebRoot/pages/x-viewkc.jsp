<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="common.PageManager"%>
<%@ page isELIgnored ="false" %>
<%@page import="common.Info"%>
<%@page import="common.CommDAO"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0040)http://2school.wygk.cn/admin/syscome.asp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>欢迎进入系统后台</TITLE>
<LINK 
href="/workcorrectionsys/pages/images/syscome.files/Admin.css" rel=stylesheet>
<SCRIPT language=javascript src="/workcorrectionsys/pages/images/syscome.files/Admin.js"></SCRIPT>
<SCRIPT language=javascript src="/workcorrectionsys/commfiles/js/popup.js"></SCRIPT>
<STYLE type=text/css>.STYLE1 {
	FONT-WEIGHT: bold; COLOR: #0099ff
}
</STYLE>

<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY>
<form action="/workcorrectionsys/sys.do?action=upkc" name="f1" method="post" enctype="multipart/form-data" onsubmit="return ck();">

 <%
   CommDAO dao = new CommDAO();
  String id = request.getParameter("id");
  if(id==null)id = (String)request.getAttribute("id");
  String s = "select * from kc where id ="+id;
  HashMap map = dao.select(s).get(0);	

   %>
<input type="hidden" id="id" name="id" value="<%=id %>">
<TABLE cellSpacing=1 cellPadding=3 width="100%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
 
  <TR>
    <TD width="35%" height=24 align="center" class=forumrow>名称</TD>
    <TD class=forumrowhighlight width="65%" 
      height=24><%=map.get("kname") %></TD></TR>
             <TR>
    <TD width="35%" height=24 align="center" class=forumrow>老师</TD>
    <TD class=forumrowhighlight width="65%" 
      height=24>
      <%String tid = map.get("teacher").toString();
	HashMap tm = dao.select("select * from sysuser where id="+tid).get(0);
	out.print(tm.get("tname"));
%>
    </TD></TR>
    <TR>
    <TD width="32%" height=24 align="center" class=forumrow>学分</TD>
    <TD class=forumrowhighlight width="68%" height=24>
		<%=map.get("xf") %>
	</TD></TR>
  <TR>
    <TD width="32%" height=24 align="center" class=forumrow>课时</TD>
    <TD class=forumrowhighlight width="68%" height=24>
		<%=map.get("remark") %>
	</TD></TR>
 
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
if(f1.pwd.value==""){
alert("密码不能为空");
return false;
}if(f1.sno.value==""){
alert("招生代码不能为空");
return false;
}if(f1.schoolname.value==""){
alert("院校名称不能为空");
return false;
}
}

 <%
String no = (String)request.getAttribute("no");
if(no!=null)
{
 %>
 alert("课程名重复");
 <%}%>
 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
 parent.location.replace("/workcorrectionsys/pages/x-kcs.jsp");
 <%}%>
  <%
String aaa = (String)request.getAttribute("aaa");
if(aaa!=null)
{
 %>
 alert("无修改授权，请与管理员联系");
 <%}%>
 </script>