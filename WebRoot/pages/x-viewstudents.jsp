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
<form action="/workcorrectionsys/pages/x-viewstudents.jsp?f=f" name="f1" method="post">

<%
String kid = request.getParameter("kid");
String url="/workcorrectionsys/pages/x-viewstudents.jsp?1=1";
String sql = "select * from mykc where 1=1 ";
if(kid!=null){
url+="&kid="+kid;
sql += " and  kid='"+kid+"'";
}

 %>


  
  <script type="text/javascript">
  function add()
  {
  pop("x-addkc.jsp","添加课程",400,220);
  }
  
  
  
  function view(no)
  {
  pop("x-viewstudents.jsp?id="+no,"名单",400,220);
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
    <TD width="10%" height=24 align="center" class=forumrow>姓名</TD>
    <TD width="10%" height=24 align="center" class=forumrow>班级</TD>
  </TR>
  <%
  CommDAO dao = new CommDAO();
  
  PageManager pageManager = PageManager.getPage(url,7, request);
	    pageManager.doList(sql);
	    PageManager bean= (PageManager)request.getAttribute("page");
	    ArrayList<HashMap> nlist=(ArrayList)bean.getCollection();
	    for(HashMap m:nlist)
	    {
	    
   %>
  <TR>
  	<TD  height=24 align="center" class=forumrow>
  	<%String sid = m.get("sid").toString();
  	String ss = "select * from student where id='"+sid+"'";
  	List<HashMap> sslist = dao.select(ss);
  	if(sslist.size()!=0){
  	HashMap mmm = sslist.get(0);
  	%>
  	<%=mmm.get("tname") %>
  	<%}%>
  	</TD>
    <TD  height=24 align="center" class=forumrow>
    <%if(sslist.size()!=0){
    HashMap nnn = sslist.get(0);
     %>
    <%HashMap bjmap = dao.select("select * from bj where id="+nnn.get("bj")).get(0); out.print(bjmap.get("bjname"));%>
    <%} %>
    </TD>
    
  
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