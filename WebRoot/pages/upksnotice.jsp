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
   <%
   CommDAO dao = new CommDAO();
  String id = request.getParameter("id");
  if(id==null)id = (String)request.getAttribute("id");
  String s = "select * from notice where id ="+id;
  HashMap map = dao.select(s).get(0);
   %>
<form action="/workcorrectionsys/sys.do?action=upksnotice&type=2" name="f1" method="post" onsubmit="return ck()"> 
        <input type="hidden" id="id" name="id" value="<%=id %>">    
<TABLE cellSpacing=1 cellPadding=3 width="100%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
 
  <TR>
    <TD width="20%" height=24 align="center" class=forumrow>请输入标题</TD>
    <TD class=forumrowhighlight 
      height=24><label>
      <input name="title" type="text" id="title" size="60" value="<%=map.get("title") %>">
    </label></TD></TR>
    <TR>
    <TD width="20%" height=24 align="center" class=forumrow>请输入内容</TD>
    <TD class=forumrowhighlight
      height=24>
     <textarea rows="" cols="" name="mt" id="mt" ><%=map.get("content") %></textarea>
      <script  language=javascript src="/workcorrectionsys/fckeditor/fckeditor.js"></script>
    </TD></TR>
  <TR>
    <TD height=31 colspan="2" align="center" class=forumrow>
      <input type="submit" name="Submit"  value="提交信息">&nbsp;&nbsp;&nbsp;<input type="reset" name="Submit" value="重新填写">    </TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">
function window.onload() { 

var of = new FCKeditor("mt");
of.BasePath="/workcorrectionsys/fckeditor/";
of.Height = "350";
of.ToolbarSet="Default";
of.ReplaceTextarea();

if(top.location != self.location){ 

var a = window.parent.document.getElementsByTagName('iframe'); 

for (var i=0; i<a.length; i++){ 

if (a[i].name == self.name) {a[i].height = document.body.scrollHeight+150; return;}}} 

}

function ck()
{
if(f1.title.value=="")
{
alert("请输入标题");
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
 alert("班级名重复");
 <%}%>
 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
  location.replace("/workcorrectionsys/pages/ksnotice.jsp");
 <%}%>
 </script>
