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
<form action="/workcorrectionsys/pages/zylist.jsp?f=f" name="f1" method="post">

<%
HashMap admin = (HashMap)request.getSession().getAttribute("admin");
CommDAO dao = new CommDAO();
HashMap map = dao.select("select * from student where id="+admin.get("id")).get(0);
String url="/workcorrectionsys/pages/zylist.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String key1 = request.getParameter("key1")==null?"":request.getParameter("key1");
String teacher = request.getParameter("teacher")==null?"":request.getParameter("teacher");
String sql = "select * from zy where teacherid in(select id from sysuser where bjid="+map.get("bj")+") and delstatus=0";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (title like'%"+key+"%' ) ";
}if(!key1.equals(""))
{
	url+="&key1="+key1;
	sql+=" and (kcid ='"+key1+"' ) ";
	}
sql +=" order by id desc";
 %>

<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#87CEFA
border=0>
  <TBODY>
  <TR>
    <TD colSpan=4 height=24>作业列表</TD> 
  </TR>
  <TR>
    <TD width="15%" height=24 align="center" class=forumrow>标题</TD>
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
  pop("x-addkc.jsp","添加课程",400,220);
  }
  
  
  
  function view(no)
  {
  pop("uploadzy.jsp?zyid="+no,"作业上传",400,220);
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
    <TD width="10%" align="center" class=forumrowhighlight>提交状态</TD>
    <TD width="10%" align="center" class=forumrowhighlight>分数</TD>
    <TD width="5%" align="center" class=forumrowhighlight>上传</TD>
  </TR>
  <%
  

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
	<TD  height=24 align="center" class=forumrow>
	<%ArrayList list = (ArrayList)dao.select("select * from myzy where zyid="+m.get("id")+" and stuid="+map.get("id")+" ");
	if(list.size()==0){%>
		未上传
	<%}else{%>
		已上传
	<%} %>
	</TD>
	<TD  height=24 align="center" class=forumrow>
	<%
	if(list.size()>0){
		HashMap mm = (HashMap)list.get(0); 
	%>
	<%=mm.get("score")==null?"&nbsp;":mm.get("score")%>
	<%} %>
	</TD>
    <TD  height=24 align="center" class=forumrowhighlight>
    <a href="javascript: view('<%=m.get("id") %>')">
    <%if(list.size()==0){ %>
    上传作业
    <%}else{ %>
    修改上传
    <%} %>
    </a>
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
 alert("该课程选报人数已满");
 <%}%>
 <%
String suc = (String)request.getAttribute("suc");
if(suc!=null)
{
 %>
 alert("操作成功");
 <%}%>
 </script>