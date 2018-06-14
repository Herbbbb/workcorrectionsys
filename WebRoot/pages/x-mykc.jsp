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
<form action="/workcorrectionsys/pages/x-mykc.jsp?f=f" name="f1" method="post">

<%
CommDAO dao = new CommDAO();
HashMap map = (HashMap)request.getSession().getAttribute("admin");
String sid = map.get("id").toString();
String url="/workcorrectionsys/pages/x-mykc.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String teacher = request.getParameter("teacher")==null?"":request.getParameter("teacher");
String sql = "select * from kc where delstatus=0 ";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (id ='"+key+"') ";
}
sql +=" and id  in(select kid from mykc where sid='"+map.get("id")+"')";
 %>

<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#87CEFA
border=0>
  <TBODY>
  <TR>
    <TD colSpan=2 height=24>我的课程</TD> 
  </TR>
  <TR>
    <TD width="15%" height=24 align="center" class=forumrow>课程</TD>
    <TD class=forumrowhighlight width="" 
      height=24><label>
      <select id="key" name="key">
      		<option value="">-全部-</option>
      		<%ArrayList<HashMap> klist = (ArrayList)dao.select("select * from mykc where sid="+sid); 
      		if(klist.size()!=0){
      			for(HashMap km:klist){
      		%>
      		<option value="<%=km.get("kid") %>">
      		
      		<%String kkid = km.get("kid").toString();
      		HashMap kkm = dao.select("select * from kc where id="+kkid).get(0);
      		out.print(kkm.get("kname"));
      		 %>
      		
      		</option>
      		<%} }%>
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
  pop("x-viewkc.jsp?id="+no,"课程详细",400,220);
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
    <TD width="10%" align="center" class=forumrowhighlight>课时</TD>
    <TD width="10%" align="center" class=forumrowhighlight>老师</TD>
    <TD width="10%" align="center" class=forumrowhighlight>成绩</TD>
    <TD width="5%" align="center" class=forumrowhighlight>查看</TD>
    <TD width="5%" align="center" class=forumrowhighlight>操作</TD>
  </TR>
  <%
  
  String did = request.getParameter("did");
  if(did!=null)
  {
  String s = "delete  from  mykc  where sid='"+sid+"' and kid= "+did+"";
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
    <TD  height=24 align="center" class=forumrow><%=m.get("kname")==null?"&nbsp;":m.get("kname")%></TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("xf")==null?"&nbsp;":m.get("xf")%></TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("remark")==null?"&nbsp;":m.get("remark")%></TD>
	<TD  height=24 align="center" class=forumrow>
	<%String tid = m.get("teacher").toString();
	HashMap tm = dao.select("select * from sysuser where id="+tid).get(0);
	out.print(tm.get("tname"));
%>
	</TD>
	<TD  height=24 align="center" class=forumrow>
	<%
	String kid = m.get("id").toString();
	String score = "";
	String ss = "select * from mykc where kid='"+kid+"' and sid='"+sid+"'";
	HashMap mmm = dao.select(ss).get(0); 
	score=mmm.get("score").toString();
	%>
	<%=score %>
	
	</TD>
    <TD  height=24 align="center" class=forumrowhighlight><a href="javascript: view('<%=m.get("id") %>')">详细</a></TD>
        <TD  height=24 align="center" class=forumrowhighlight>
        <%if(score==null||score.equals("")){ %>
        <a href="x-mykc.jsp?did=<%=m.get("id") %>">撤销</a>
        <%}else{} %>
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