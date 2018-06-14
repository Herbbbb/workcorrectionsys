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
<form action="/workcorrectionsys/pages/x-kcs.jsp?f=f" name="f1" method="post">

<%
String url="/workcorrectionsys/pages/x-kcs.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String sql = "select * from kc where delstatus=0 ";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (kname like'%"+key+"%') ";
}

 %>

<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#87CEFA
border=0>
  <TBODY>
  <TR>
    <TD colSpan=2 height=24>课程管理</TD> 
  </TR>
  <TR>
    <TD width="15%" height=24 align="center" class=forumrow>课程名</TD>
    <TD class=forumrowhighlight width="" 
      height=24><label>
      <input name="key" type="text"  size="30" value="<%=key %>">
    </label></TD>
   
    </TR>
  <TR>
    <TD height=24 colspan="6" align="center" class=forumrow>
      <input type="submit" name="Submit"  value="查询信息">&nbsp;&nbsp;&nbsp;<input type="button" onclick="add();" name="Submit" value="添加课程">
      
      
      
          </TD>
    </TR>
  </TBODY></TABLE>
  
  <script type="text/javascript">
  function add()
  {
  pop("x-addkc.jsp","添加课程",400,300);
  }
  
  
  
  function update(no)
  {
  pop("x-upkc.jsp?id="+no,"修改课程",400,300);
  }
    function view(no)
  {
  pop("x-viewstudents.jsp?kid="+no,"名单",600,300);
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
    <TD width="10%" align="center" class=forumrowhighlight>课程名</TD>
     <TD width="10%" align="center" class=forumrowhighlight>学分</TD>
    <TD width="5%" align="center" class=forumrowhighlight>修改</TD>
    <TD width="5%" align="center" class=forumrowhighlight>删除</TD>
  </TR>
  <%
  CommDAO dao = new CommDAO();
  String did = request.getParameter("did");
  if(did!=null)
  {
  String s = "update kc set delstatus='1' where id="+did;

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
<TD  height=24 align="center" class=forumrow><%=m.get("kcname")==null?"&nbsp;":m.get("kcname")%></TD>
<TD  height=24 align="center" class=forumrow><%=m.get("xf")==null?"&nbsp;":m.get("xf")%></TD>
    <TD  height=24 align="center" class=forumrowhighlight><a href="javascript: update('<%=m.get("id") %>')">修改</a></TD>
    <TD  height=24 align="center" class=forumrowhighlight><a href="x-kcs.jsp?did=<%=m.get("id") %>">删除</a></TD>
  </TR>
  <%} %>
  
  <TR>
    <TD height=24 colspan="4" align="center" class=forumrow>
      ${page.info }</TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
