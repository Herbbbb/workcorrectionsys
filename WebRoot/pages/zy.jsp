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
<form action="/workcorrectionsys/pages/zy.jsp?f=f" name="f1" method="post">

<%
CommDAO dao = new CommDAO();
HashMap admin = (HashMap)request.getSession().getAttribute("admin");
String myid = admin.get("id").toString();
String url="/workcorrectionsys/pages/zy.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
String sql = "select * from zy where delstatus=0 ";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (title like'%"+key+"%' ) ";
}if(!key1.equals(""))
{
	url+="&key1="+key1;
	sql+=" and (kcid ='"+key1+"' ) ";
	}
sql +=" and teacherid= '"+myid+"' order by id desc";

 %>

<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#87CEFA
border=0>
  <TBODY>
  <TR>
    <TD colSpan=4 height=24>作业发布</TD> 
  </TR>
  <TR>
    <TD width="15%" height=24 align="center" class=forumrow>作业标题</TD>
    <TD class=forumrowhighlight width="" 
      height=24><label>
      <input name="key" type="text"  size="30" value="<%=key %>">
    </label></TD>
    <TD width="15%" height=24 align="center" class=forumrow>课程</TD>
    <TD class=forumrowhighlight width="" 
      height=24><label>
      <select id="key1" name="key1">
      <option value="">全部</option>
      <%ArrayList<HashMap> list = (ArrayList<HashMap>)dao.select("select * from kc where delstatus='0'");
      for(HashMap m:list){%>
      	<option value="<%=m.get("id") %>" <%if(key1.equals(m.get("id"))){out.print("selected==selected");} %>><%=m.get("kcname") %></option>
      	<%} %>
      </select>
    </label></TD>
   
  <TR>
    <TD height=24 colspan="6" align="center" class=forumrow>
      <input type="submit" name="Submit"  value="查询信息">&nbsp;&nbsp;&nbsp;<input type="button" onclick="add();" name="Submit" value="添加作业">
      
      
      
          </TD>
    </TR>
  </TBODY></TABLE>
  
  <script type="text/javascript">
  function add()
  {
  pop("x-addzy.jsp","添加作业",600,300);
  }
    function update(no)
  {
  pop("x-upzy.jsp?id="+no,"添加作业",600,300);
  }
      function fb(no)
  {
  pop("answerfb.jsp?id="+no,"答案发布",600,300);
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
    <TD width="10%" align="center" class=forumrowhighlight>标题</TD>
    <TD width="10%" align="center" class=forumrowhighlight>所属课程</TD>
    <TD width="10%" align="center" class=forumrowhighlight>作业附件</TD>
    <TD width="10%" align="center" class=forumrowhighlight>说明</TD>
    <TD width="10%" align="center" class=forumrowhighlight>答案</TD>
    <TD width="10%" align="center" class=forumrowhighlight>发布日期</TD>
    <TD width="5%" align="center" class=forumrowhighlight>操作</TD>
  </TR>
  <%
  
  String did = request.getParameter("did");
  if(did!=null)
  {
  String s = "update zy set delstatus='1' where id="+did;

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
    <TD  height=24 align="center" class=forumrow><%=m.get("title")==null?"&nbsp;":m.get("title")%></TD>
    <TD  height=24 align="center" class=forumrow>
    	<%HashMap mmm = dao.select("select * from kc where id="+m.get("kcid")).get(0); %>
    	<%=mmm.get("kcname") %>
    </TD>
    <TD  height=24 align="center" class=forumrow><a href="/workcorrectionsys/upload?filename=<%=m.get("zyfile") %>"><%=m.get("zyfile")==null?"&nbsp;":m.get("zyfile")%></a></TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("content")==null?"&nbsp;":m.get("content")%></TD>
    <TD  height=24 align="center" class=forumrow><a href="/workcorrectionsys/upload?filename=<%=m.get("answer") %>"><%=m.get("answer")==null?"":m.get("answer")%></a></TD>
	 <TD  height=24 align="center" class=forumrow><%=m.get("savetime")==null?"&nbsp;":m.get("savetime")%></TD>
    <TD  height=24 align="center" class=forumrowhighlight><a href="javascript: update('<%=m.get("id") %>')">修改</a>&nbsp;|&nbsp;<a href="javascript: fb('<%=m.get("id") %>')">答案发布</a></TD>
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