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
<form action="/gbgl/sys.do?action=upfa" name="f1" method="post" onsubmit="return ck()">
 <%
   CommDAO dao = new CommDAO();
  String id = request.getParameter("id");
  if(id==null)id = (String)request.getAttribute("id");
  String s = "select * from kcfa where id ="+id;
  HashMap map = dao.select(s).get(0);	

   %>
<input type="hidden" id="id" name="id" value="<%=id %>">
<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#87CEFA
border=0>
  <TBODY>
  <TR>
    <TD colSpan=5 height=24></TD> 
  </TR>
  <TR>
    <TD width="10%" height=24 align="center" class=forumrow>标题</TD>
    <TD width="" height=24 align="left" class=forumrow><input type="text" id="title" name="title" size="50" value="<%=map.get("title") %>"></TD>
  </TR>
   <TR>
    <TD width="10%" height=24 align="center" class=forumrow>内容</TD>
    <TD width="" height=24 align="left" class=forumrow><textarea rows="5" cols="80" id="content" name="content"><%=map.get("content") %></textarea> </TD>
  </TR>
  <tr>
  	<td colspan="2" class=forumrow align="center"><input type="submit" value="提交信息" ><input type="reset" value="重置"></td>
  </tr>
  </TBODY></TABLE>
  </form>
</BODY></HTML>
<script type="text/javascript">
function viewperson(id){
  pop("viewperson.jsp?id="+id,"查看干部详情",850,320);
}
  function v(id)
  {
  pop("vtyrecord.jsp?pid="+id,"查看得分",400,300);
  }
function ck(){
	if(document.getElementById("title").value==""){
	alert("方案名称不能为空");
	return false;
	}	if(document.getElementById("content").value==""){
	alert("内容不能为空");
	return false;
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
   parent.location.replace("/gbgl/pages/kcfa.jsp");
 <%}%>
 </script>
