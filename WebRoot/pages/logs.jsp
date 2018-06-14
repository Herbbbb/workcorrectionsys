<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="common.PageManager"%>
<%@ page isELIgnored ="false" %>
<%@page import="common.Info"%>
<%@page import="common.CommDAO"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0040)http://2school.wygk.cn/admin/syscome.asp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>欢迎进入系统后台</TITLE>
<LINK 
href="/gbgl/pages/images/syscome.files/Admin.css" rel=stylesheet>
<SCRIPT language=javascript src="/gbgl/pages/images/syscome.files/Admin.js"></SCRIPT>
<SCRIPT language=javascript src="/gbgl/commfiles/js/popup.js"></SCRIPT>
<STYLE type=text/css>.STYLE1 {
	FONT-WEIGHT: bold; COLOR: #0099ff
}
</STYLE>

<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY>
<form action="/gbgl/pages/logs.jsp?f=f" name="f1" method="post">

<%
String url="/gbgl/pages/logs.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String sql = "select * from lotlogs where 1=1 ";

sql += " order by id desc";
 %>

  <br />
  
  <TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#87CEFA
border=0>
  <TBODY>
  <TR>
    <TD colSpan=5 height=24>信息列表</TD> 
  </TR>
  <TR>
    <TD width="10%" height=24 align="center" class=forumrow>操作者</TD>
    <TD width="30%" height=24 align="center" class=forumrow>动作</TD>
    <TD width="10%" align="center" class=forumrowhighlight>时间</TD>
  </TR>
  <%
  CommDAO dao = new CommDAO();
  PageManager pageManager = PageManager.getPage(url,10, request);
	    pageManager.doList(sql);
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
	    for(HashMap m:nlist)
	    {
	    
   %>
   
  <TR>
    <TD  height=24 align="center" class=forumrow><%=m.get("username")==null?"&nbsp;":m.get("username")%></TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("doinfo")==null?"&nbsp;":m.get("doinfo")%></TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("savetime")==null?"&nbsp;":m.get("savetime")%></TD>
  </TR>
  <%} %>
  
  <TR>
   <%session.setAttribute("sql",sql); %>
    <TD height=24 colspan="10" align="center" class=forumrow>
      ${page.info }</TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">

function kh(id){
  pop("kh.jsp?id="+id,"考评",400,90);
}
function cx(id){
  pop("khlist.jsp?id="+id,"考评记录",400,500);
}
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