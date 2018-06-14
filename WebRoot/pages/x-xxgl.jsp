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
String teacher = request.getParameter("teacher")==null?"":request.getParameter("teacher");
String sql = "select * from kc where status=0 ";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (kname like'%"+key+"%' or no like'%"+key+"%') ";
}if(!teacher.equals("")){
url+="&teacher="+teacher;
sql+=" and (teacher like'%"+teacher+"%') ";
}

 %>


  
  <script type="text/javascript">
  function add()
  {
  pop("x-addkc.jsp","添加课程",400,220);
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
    <TD width="10%" height=24 align="center" class=forumrow>课程编号</TD>
    <TD width="10%" align="center" class=forumrowhighlight>课程名</TD>
    <TD width="10%" align="center" class=forumrowhighlight>简介</TD>
    <TD width="10%" align="center" class=forumrowhighlight>老师</TD>
    <TD width="10%" align="center" class=forumrowhighlight>人数</TD>
    <TD width="5%" align="center" class=forumrowhighlight>查看名单</TD>
  </TR>
  <%
  CommDAO dao = new CommDAO();
  String did = request.getParameter("did");
  if(did!=null)
  {
  String s = "update kc set status='1' where id="+did;

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
  	<TD  height=24 align="center" class=forumrow><%=m.get("no")==null?"&nbsp;":m.get("no")%></TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("kname")==null?"&nbsp;":m.get("kname")%></TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("remark")==null?"&nbsp;":m.get("remark")%></TD>
	<TD  height=24 align="center" class=forumrow><%=m.get("teacher")==null?"&nbsp;":m.get("teacher")%></TD>
    <TD  height=24 align="center" class=forumrow>
		<%String ss = "select * from mykc where kid='"+m.get("id")+"'";
			List<HashMap> ll = dao.select(ss);
			int size = ll.size();
			out.print(size);
		 %>
		 
	</TD>
    <TD  height=24 align="center" class=forumrowhighlight><a href="javascript: view('<%=m.get("id") %>')">查看</a></TD>
  </TR>
  <%} %>
  
  <TR>
    <TD height=24 colspan="11" align="center" class=forumrow>
      ${page.info }</TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">
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