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
<form action="/workcorrectionsys/pages/x-cjgl.jsp?f=f" name="f1" method="post">

<%
String url="/workcorrectionsys/pages/x-cjgl.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String sex = request.getParameter("sex")==null?"":request.getParameter("sex");
String no = request.getParameter("no")==null?"":request.getParameter("no");
String kname = request.getParameter("kname")==null?"":request.getParameter("kname");

String sql = "select a.id,a.kid,a.score,b.no,b.realname,b.sex  from mykc a, student b where a.sid=b.id  ";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (b.realname like'%"+key+"%' or b.uname like'%"+key+"%') ";
}if(!sex.equals("")){
url+="&sex="+sex;
sql+=" and (b.sex like'%"+sex+"%') ";
}if(!no.equals("")){
url+="&no="+no;
sql+=" and (b.no like'%"+no+"%') ";
}
 %>

<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#87CEFA
border=0>
  <TBODY>
  <TR>
    <TD colSpan=2 height=24>成绩管理</TD> 
  </TR>
  <TR>
    <TD width="15%" height=24 align="center" class=forumrow>请输入姓名或用户名</TD>
    <TD class=forumrowhighlight width="" 
      height=24><label>
      <input name="key" type="text"  size="30" value="<%=key %>">
    </label></TD>
     <td class=forumrowhighlight>
	学号<input name="no" type="text"  size="30" value="<%=no %>">
	</td>
	
    <td class=forumrowhighlight>
	性别<select id="sex" name="sex">
			<option value="" <%if(sex.equals(""))out.print("selected=selected");%>>全部
			<option value="男" <%if(sex.equals("男"))out.print("selected=selected");%>>男
			<option value="女" <%if(sex.equals("女"))out.print("selected=selected");%>>女
		</select>
	</td>
    </TR>
  <TR>
    <TD height=24 colspan="6" align="center" class=forumrow>
      <input type="submit" name="Submit"  value="查询信息">
      
      
      
          </TD>
    </TR>
  </TBODY></TABLE>
  
  <script type="text/javascript">
  function pf(no)
  {
  pop("x-pf.jsp?id="+no,"评分",400,65);
  }
  
  
  
  function xgpf(no)
  {
  pop("x-xgpf.jsp?id="+no,"修改学生用户",400,250);
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
    <TD width="10%" height=24 align="center" class=forumrow>学号</TD>
    <TD width="10%" height=24 align="center" class=forumrow>姓名</TD>
    <TD width="5%" height=24 align="center" class=forumrow>性别</TD>
    <TD width="10%" align="center" class=forumrowhighlight>课程名称</TD>
    <TD width="10%" align="center" class=forumrowhighlight>分数</TD>
    <TD width="5%" align="center" class=forumrowhighlight>评分</TD>
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
  	<TD  height=24 align="center" class=forumrow><%=m.get("no")==null?"&nbsp;":m.get("no")%></TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("realname")==null?"&nbsp;":m.get("realname")%></TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("sex")==null?"&nbsp;":m.get("sex")%></TD>
    <TD  height=24 align="center" class=forumrow>
    	<%String kcid = m.get("kid").toString();
    	String ss = "select * from kc where id="+kcid+" ";
    	List<HashMap> sslist = dao.select(ss);
    	if(sslist.size()!=0){
    		HashMap mmm = sslist.get(0);
    		out.print(mmm.get("kname"));
    	}
    	 %>
    </TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("score")==null?"&nbsp;":m.get("score")%></TD>
    <TD  height=24 align="center" class=forumrowhighlight>
    <%if(m.get("score")==null||m.get("score").equals("")){ %>
    <a href="javascript: pf('<%=m.get("id") %>')">评分</a>
    <%}else{ %>
     <a href="javascript: pf('<%=m.get("id") %>')">修改评分</a>
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