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
<form action="/workcorrectionsys/pages/bj.jsp?f=f" name="f1" method="post">

<%
String url="/workcorrectionsys/pages/bj.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String sql = "select * from bj a where  delstatus=0 ";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (bjname like'%"+key+"%') ";
}


 %>

<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#87CEFA
border=0>
  <TBODY>
  <TR>
    <TD colSpan=2 height=24>班级管理</TD> 
  </TR>
  <TR>
    <TD width="27%" height=24 align="center" class=forumrow>请输入关键字</TD>
    <TD class=forumrowhighlight width="73%" 
      height=24><label>
      <input name="key" type="text"  size="30">
    </label></TD></TR>
  <TR>
    <TD height=24 colspan="2" align="center" class=forumrow>
      <input type="submit" name="Submit"  value="查询信息">&nbsp;&nbsp;&nbsp;<input type="button" onclick="add();" name="Submit" value="添加班级">
      
      
      
          </TD>
    </TR>
  </TBODY></TABLE>
  
  <script type="text/javascript">
  function add()
  {
  pop("addbj.jsp","添加班级",400,261);
  }
  
  function addstu()
  {
  pop("addstu.jsp","批量添加学生",400,72);
  }
  
  function update(no)
  {
  pop("upbj.jsp?id="+no,"修改班级",400,261);
  }
  </script>
  
  
  <br />
  
  <TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#87CEFA
border=0>
  <TBODY>
  <TR>
    <TD colSpan=5 height=24>信息列表</TD> 
  </TR>
  <TR>
    <TD width="15%" height=24 align="center" class=forumrow>班级</TD>
    <TD width="9%" align="center" class=forumrowhighlight>修改</TD>
    <TD width="10%" align="center" class=forumrowhighlight>删除</TD>
  </TR>
  <%
  CommDAO dao = new CommDAO();
  String did = request.getParameter("did");
  if(did!=null)
  {
  String s = "delete from bj  where id="+did;
  String ss = "delete from mykc where kid="+did;
  dao.commOper(s);
  }
  PageManager pageManager = PageManager.getPage(url,10, request);
	    pageManager.doList(sql);
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
	    for(HashMap m:nlist)
	    {
   %>
  <TR>
    <TD  height=24 align="center" class=forumrow><%=m.get("bjname") %></TD>
    <TD  height=24 align="center" class=forumrowhighlight><a href="javascript: update('<%=m.get("id") %>')">修改</a></TD>
    <TD  height=24 align="center" class=forumrowhighlight><a href="bj.jsp?did=<%=m.get("id") %>">删除</a></TD>
  </TR>
  <%} %>
  
  <TR>
    <TD height=24 colspan="6" align="center" class=forumrow>
      ${page.info }</TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
