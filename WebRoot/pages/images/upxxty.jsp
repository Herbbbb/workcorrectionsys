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

<STYLE type=text/css>.STYLE1 {
	FONT-WEIGHT: bold; COLOR: #0099ff
}
</STYLE>
 <%
   CommDAO dao = new CommDAO();
  String id = request.getParameter("id");
  if(id==null)id = (String)request.getAttribute("id");
  String s = "select * from xmtyxx where id ="+id;
  HashMap map = dao.select(s).get(0);	

   %>
<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY>
<form action="/gbgl/sys.do?action=uptj2" name="f1" method="post" onsubmit="return ck();"> 
            <input type="hidden" id="id" name="id" value="<%=id %>">
<TABLE cellSpacing=1 cellPadding=3 width="100%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
 
  <TR>
    <TD width="35%" height=24 align="center" class=forumrow>条件名称</TD>
    <TD class=forumrowhighlight width="65%" 
      height=24><label>
      <%=map.get("name") %>
    </label></TD></TR>
  <TR>
    <TD width="32%" height=24 align="center" class=forumrow>请输入权重</TD>
    <TD class=forumrowhighlight width="68%" height=24><input name="qz" type="text" id="qz" size="40" value="<%=map.get("qz") %>">*</TD></TR>
 <tr>
    <TD height=31 colspan="2" align="center" class=forumrow>
      <input type="submit" name="Submit"  value="提交信息">&nbsp;&nbsp;&nbsp;<input type="reset" name="Submit" value="重新填写">    </TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">
function ck()
{
if(f1.name.value==""){
alert("条件名不能为空");
return false;
}
if(f1.qz.value==""){
alert("权重不能为空");
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
  parent.location.replace("/gbgl/pages/tyxxset.jsp");
 <%}%>
 </script>
