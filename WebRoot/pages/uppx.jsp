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

<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY>
<form action="/gbgl/sys.do?action=uppx" name="f1" method="post" onsubmit="return ck()"> 
            
<TABLE cellSpacing=1 cellPadding=3 width="100%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
  <%
   CommDAO dao = new CommDAO();
  String id = request.getParameter("id");
  if(id==null)id = (String)request.getAttribute("id");
  String s = "select * from px where id ="+id;
  HashMap m = dao.select(s).get(0);	

   %>
  <TR>
  <input type="hidden" id="id" name="id" value="<%=m.get("id") %>" >
    <TD width="35%" height=24 align="center" class=forumrow>培训名称</TD>
    <TD class=forumrowhighlight width="65%" 
      height=24><label>
      <input name="name" type="text" id="name" value="<%=m.get("title") %>">
    </label></TD></TR>
      <TR>
    <TD width="32%" height=24 align="center" class=forumrow>级别</TD>
    <TD class=forumrowhighlight width="68%" height=24>
		<select id="jb" name="jb">
			<option value="院级" <%if(m.get("jb").equals("院级"))out.print("selected=selected");%>>院级
			<option value="市级" <%if(m.get("jb").equals("市级"))out.print("selected=selected");%>>市级
			<option value="省级" <%if(m.get("jb").equals("省级"))out.print("selected=selected");%>>省级
			<option value="国家级" <%if(m.get("jb").equals("国家级"))out.print("selected=selected");%>>国家级
		</select>
	</TD></TR>
  <TR>
    <TD width="32%" height=24 align="center" class=forumrow>培训内容</TD>
    <TD class=forumrowhighlight width="68%" height=24>
		<textarea rows="5" cols="40" id="content" name="content"><%=m.get("content") %></textarea>
	</TD></TR>
	  <TR>
    <TD width="32%" height=24 align="center" class=forumrow>人员</TD>
    <TD class=forumrowhighlight width="68%" height=24>
		<%String persons = m.get("persons").toString();
		String p[] = persons.split(";");
		for(int i=0;i<p.length;i++){
			String ss = "select * from person where id="+p[i];
			List<HashMap> ll = dao.select(ss);
			if(ll.size()!=0){
				for(HashMap mm:ll){
					%>
					<%=mm.get("realname") %>
	<% 			}
			}
		}
		 %>
	</TD></TR>
   <TR>
    <TD width="32%" height=24 align="center" class=forumrow>重新选择人员</TD>
    <TD class=forumrowhighlight width="68%" height=24>
    <%String sql = "select * from person where status=0 and shstatus=3";
      List<HashMap> list = dao.select(sql);
      if(list.size()!=0){
      	for(HashMap map:list){
      		%>
		<input type="checkbox" id="checkbox" name="checkbox" value="<%=map.get("id") %>" ><%=map.get("realname") %>
	 <%	}
      }%>
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
if(f1.name.value=="")
{
alert("请输入培训名称");
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
  parent.location.replace("/gbgl/pages/personpx.jsp");
 <%}%>
 </script>
