<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="common.Info"%>
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
  String s = "select * from zy where id ="+id;
  HashMap map = dao.select(s).get(0);
   %>
<form action="/workcorrectionsys/sys.do?action=upzy" name="f1" method="post" onsubmit="return ck()" enctype="multipart/form-data"> 
            <input type="hidden" id="id" name="id" />
<TABLE cellSpacing=1 cellPadding=3 width="100%" align=center bgColor=#6ab6b6 
border=0>
  <TBODY>
  <TR>
    <TD  height=24 align="center" class=forumrow>所属课程</TD>
    <TD class=forumrowhighlight width="85%" 
      height=24><label>
      <select id="kcid" name="kcid">
      <%ArrayList<HashMap> list = (ArrayList<HashMap>)dao.select("select * from kc where delstatus='0'");
      for(HashMap m:list){%>
      	<option value="<%=m.get("id") %>" <%if(map.get("kcid").equals(m.get("id"))){out.print("selected==selected");} %>><%=m.get("kcname") %></option>
      	<%} %>
      </select>*
    </label></TD></TR>
  <TR>
    <TD width="35%" height=24 align="center" class=forumrow>标题</TD>
    <TD class=forumrowhighlight width="65%" 
      height=24><label>
      <input name="title" type="text" id="title">*
    </label></TD></TR>
        <TR>
    <TD  height=24 align="center" class=forumrow>附件</TD>
    <TD class=forumrowhighlight width="85%" 
      height=24><label>
      <input name="txt1" type="file" id="txt1" >*
    </label></TD></TR>
             <TR>
    <TD width="35%" height=24 align="center" class=forumrow>说明</TD>
    <TD class=forumrowhighlight width="65%" 
      height=24><label>
      <textarea rows="10" cols="50" name="content" id="content"></textarea>
    </label></TD></TR>
    
  
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
if(f1.title.value=="")
{
alert("请输入作业名称");
return false;
}if(f1.txt1.value=="")
{
alert("作业附件不能为空");
return false;
}

}
</script>
<script type="text/javascript">

 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
  parent.location.replace("/workcorrectionsys/pages/zy.jsp");
 <%}%>
 </script>
<%=Info.tform(map)%>