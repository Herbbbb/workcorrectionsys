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
<form action="/workcorrectionsys/pages/x-teachers.jsp?f=f" name="f1" method="post">

<%
String url="/workcorrectionsys/pages/x-teachers.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");

String sql = "select * from sysuser where type='教师' and delstatus=0 ";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (realname like'%"+key+"%' or uname like'%"+key+"%' ) ";
}

 %>

<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#87CEFA
border=0>
  <TBODY>
  <TR>
    <TD colSpan=2 height=24>教师管理</TD> 
  </TR>
  <TR>
    <TD width="15%" height=24 align="center" class=forumrow>请输入姓名或用户名</TD>
    <TD class=forumrowhighlight width="" 
      height=24><label>
      <input name="key" type="text"  size="30" value="<%=key %>">
    </label></TD>
    </TR>
  <TR>
    <TD height=24 colspan="6" align="center" class=forumrow>
      <input type="submit" name="Submit"  value="查询信息">&nbsp;&nbsp;&nbsp;<input type="button" onclick="add();" name="Submit" value="添加教师">
      
      
      
          </TD>
    </TR>
  </TBODY></TABLE>
  
  <script type="text/javascript">
  function add()
  {
  pop("addteacher.jsp","添加教师用户",400,250);
  }
  
  
  
  function update(no)
  {
  pop("upteacher.jsp?id="+no,"修改教师用户",400,250);
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
    <TD width="10%" align="center" class=forumrowhighlight>登陆名</TD>
    <TD width="10%" align="center" class=forumrowhighlight>密码</TD>
    <TD width="10%" height=24 align="center" class=forumrow>姓名</TD>
    <TD width="10%" height=24 align="center" class=forumrow>性别</TD>
    <TD width="10%" height=24 align="center" class=forumrow>班级</TD>
    <TD width="10%" align="center" class=forumrowhighlight>创建日期</TD>
    <TD width="5%" align="center" class=forumrowhighlight>修改</TD>
    <TD width="5%" align="center" class=forumrowhighlight>删除</TD>
  </TR>
  <%
  CommDAO dao = new CommDAO();
  String did = request.getParameter("did");
  if(did!=null)
  {
  String s = "update sysuser set delstatus='1' where id="+did;

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
    <TD  height=24 align="center" class=forumrow><%=m.get("uname")==null?"&nbsp;":m.get("uname")%></TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("upass")==null?"&nbsp;":m.get("upass")%></TD>
    
    <TD  height=24 align="center" class=forumrow><%=m.get("tname")==null?"&nbsp;":m.get("tname")%></TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("sex")==null?"&nbsp;":m.get("sex")%></TD>
        <TD  height=24 align="center" class=forumrow>
    <%String bjid = m.get("bjid").toString();
    HashMap mm  = dao.select("select * from bj where id="+bjid).get(0);
    out.print(mm.get("bjname"));
    %>
    
    </TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("savetime")==null?"&nbsp;":m.get("savetime")%></TD>
    

    <TD  height=24 align="center" class=forumrowhighlight><a href="javascript: update('<%=m.get("id") %>')">修改</a></TD>
    <TD  height=24 align="center" class=forumrowhighlight><a href="x-students.jsp?did=<%=m.get("id") %>">删除</a></TD>
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