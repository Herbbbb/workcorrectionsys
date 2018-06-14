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
<form action="/workcorrectionsys/sys.do?action=upnotice&type=1" name="f1" method="post" onsubmit="return ck()"> 
        <input type="hidden" id="id" name="id" value="<%=id %>">    
<TABLE cellSpacing=1 cellPadding=3 width="100%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
 
  <TR>
    <TD width="20%" height=24 align="center" class=forumrow>标题</TD>
    <TD class=forumrowhighlight 
      height=24><label>
      <%=map.get("title") %>
    </label></TD></TR>
        <TR>
    <TD width="20%" height=24 align="center" class=forumrow>发布日期</TD>
    <TD class=forumrowhighlight 
      height=24><label>
      <%=map.get("savetime") %>
    </label></TD></TR>
    <TR>
    <TD width="20%" height=24 align="center" class=forumrow>内容</TD>
    <TD class=forumrowhighlight
      height=24>
    <%=map.get("content") %>
      
    </TD></TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">


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
  location.replace("/workcorrectionsys/pages/notice.jsp");
 <%}%>
 </script>
