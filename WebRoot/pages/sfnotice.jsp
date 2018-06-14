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
<form action="/workcorrectionsys/pages/sfnotice.jsp?f=f" name="f1" method="post">

<%
HashMap admin = (HashMap)request.getSession().getAttribute("admin");
String url="/workcorrectionsys/pages/sfnotice.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String sql = "select * from sfnotice a where  1=1 and sid='"+admin.get("id")+"' ";
 %>
  <TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#87CEFA
border=0>
  <TBODY>
  <TR>
    <TD colSpan=5 height=24>信息列表</TD> 
  </TR>
  <TR>
  	<TD  height=24 align="center" class=forumrow>启动课程</TD>
    <TD  height=24 align="center" class=forumrow>通知内容</TD>
    <TD  height=24 align="center" class=forumrow>通知日期</TD>
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
  <TD  height=24 align="center" class=forumrow>
  <%HashMap mmm = dao.select("select * from kc where id="+m.get("kid")).get(0);out.print(mmm.get("kname")); %></TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("content") %></TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("savetime") %></TD>
  </TR>
  <%} %>
  
  <TR>
    <TD height=24 colspan="6" align="center" class=forumrow>
      ${page.info }</TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
