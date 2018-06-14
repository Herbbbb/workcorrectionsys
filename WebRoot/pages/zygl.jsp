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
<form action="/workcorrectionsys/pages/zygl.jsp?f=f" name="f1" method="post">

<%
CommDAO dao = new CommDAO();
HashMap admin = (HashMap)request.getSession().getAttribute("admin");
String myid = admin.get("id").toString();
String url="/workcorrectionsys/pages/zygl.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
String sql = "select * from myzy  where zyid in (select id from zy where teacherid="+myid+"  ";
if(!key1.equals(""))
{
url+="&key1="+key;
sql+=" and (kcid ='"+key1+"' ) ";
}
sql+=" ) ";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (title like'%"+key+"%' ) ";
}
System.out.println(sql);
 %>

<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#87CEFA
border=0>
  <TBODY>
  <TR>
    <TD colSpan=4 height=24>作业管理</TD> 
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
      <%ArrayList<HashMap> list1 = (ArrayList<HashMap>)dao.select("select * from kc where delstatus='0'");
      for(HashMap m:list1){%>
      	<option value="<%=m.get("id") %>" <%if(key1.equals(m.get("id"))){out.print("selected==selected");} %>><%=m.get("kcname") %></option>
      	<%} %>
      </select>
    </label></TD>
    </TR>
  <TR>
    <TD height=24 colspan="6" align="center" class=forumrow>
      <input type="submit" name="Submit"  value="查询信息">
      
      
      
          </TD>
    </TR>
  </TBODY></TABLE>
  
  <script type="text/javascript">
  function add()
  {
  pop("x-addzy.jsp","添加作业",600,300);
  }
    function pf(no)
  {
  pop("zypf.jsp?myzyid="+no,"评分",400,200);
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
    <TD width="10%" align="center" class=forumrowhighlight>学生</TD>
    <TD width="10%" align="center" class=forumrowhighlight>作业标题</TD>
    <TD width="10%" align="center" class=forumrowhighlight>所属课程</TD>
    <TD width="10%" align="center" class=forumrowhighlight>作业文件</TD>
    <TD width="10%" align="center" class=forumrowhighlight>提交日期</TD>
    <TD width="10%" align="center" class=forumrowhighlight>分数</TD>
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
	    HashMap mm = (HashMap)dao.select("select * from student where id="+m.get("stuid")+" ").get(0);
	    HashMap mmm = (HashMap)dao.select("select * from zy where id="+m.get("zyid")+" ").get(0);
   %>
  <TR>
    <TD  height=24 align="center" class=forumrow><%=mm.get("tname")==null?"&nbsp;":mm.get("tname")%></TD>
    <TD  height=24 align="center" class=forumrow><%=mmm.get("title")==null?"&nbsp;":mmm.get("title")%></TD>
    <TD  height=24 align="center" class=forumrow>
    	<%HashMap aaa = dao.select("select * from kc where id="+mmm.get("kcid")).get(0); %>
    	<%=aaa.get("kcname") %>
    </TD>
    <TD  height=24 align="center" class=forumrow><a href="/workcorrectionsys/upload?filename=<%=m.get("zyfile") %>"><%=m.get("zyfile")==null?"&nbsp;":m.get("zyfile")%></a></TD>
	 <TD  height=24 align="center" class=forumrow><%=m.get("savetime")==null?"&nbsp;":m.get("savetime")%></TD>
	 <TD  height=24 align="center" class=forumrow><%=m.get("score")==null?"&nbsp;":m.get("score")%></TD>
    <TD  height=24 align="center" class=forumrowhighlight><a href="javascript: pf('<%=m.get("id") %>')">评分</a></TD>
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