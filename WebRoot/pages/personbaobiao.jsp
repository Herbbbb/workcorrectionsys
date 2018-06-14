<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="common.PageManager"%>
<%@ page isELIgnored ="false" %>
<%@page import="common.Info"%>
<%@page import="common.CommDAO"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0040)http://2school.wygk.cn/admin/syscome.asp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>欢迎进入系统后台</TITLE>
<LINK 
href="/gbgl/pages/images/syscome.files/Admin.css" rel=stylesheet>
<SCRIPT language=javascript src="/gbgl/pages/images/syscome.files/Admin.js"></SCRIPT>
<SCRIPT language=javascript src="/gbgl/commfiles/js/popup.js"></SCRIPT>
<STYLE type=text/css>.STYLE1 {
	FONT-WEIGHT: bold; COLOR: #0099ff
}
</STYLE>

<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY>
<form action="/gbgl/pages/personbaobiao.jsp?f=f" name="f1" method="post">

<%
String url="/gbgl/pages/personbaobiao.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String sex = request.getParameter("sex")==null?"":request.getParameter("sex");
String bh = request.getParameter("no")==null?"":request.getParameter("no");
String zzmm = request.getParameter("zzmm")==null?"":request.getParameter("zzmm");
String xlxw = request.getParameter("xlxw")==null?"":request.getParameter("xlxw");
String zy = request.getParameter("zy")==null?"":request.getParameter("zy");
String sql = "select * from person where status=0 and shstatus=3";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (realname like'%"+key+"%') ";
}if(!sex.equals("")){
url+="&sex="+sex;
sql+=" and (sex like'%"+sex+"%') ";
}if(!bh.equals("")){
url+="&bh="+bh;
sql+=" and (no like'%"+bh+"%') ";
}if(!zzmm.equals("")){
url+="&zzmm="+zzmm;
sql+=" and (zzmm like'%"+zzmm+"%') ";
}if(!xlxw.equals("")){
url+="&bm="+xlxw;
sql+=" and (xlxw like'%"+xlxw+"%') ";
}if(!zy.equals("")){
url+="&zy="+zy;
sql+=" and (zy like'%"+zy+"%') ";
}

 %>

<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#87CEFA
border=0>
  <TBODY>
  <TR>
    <TD colSpan=2 height=24>干部信息报表</TD> 
  </TR>
  <TR>
    <TD width="15%" height=24 align="center" class=forumrow>请输入姓名</TD>
    <TD class=forumrowhighlight width="" 
      height=24><label>
      <input name="key" type="text"  size="30" value="<%=key %>">
    </label></TD>
    <td class=forumrowhighlight>
	学历学位 <select id="xlxw" name="xlxw">
	<option value="" <%if(xlxw.equals(""))out.print("selected=selected");%>>全部
		<option value="小学" <%if(xlxw.equals("小学"))out.print("selected=selected");%>>小学</option>
		<option value="初中" <%if(xlxw.equals("初中"))out.print("selected=selected");%>>初中</option>
		<option value="高中" <%if(xlxw.equals("高中"))out.print("selected=selected");%>>高中</option>
		<option value="大专" <%if(xlxw.equals("大专"))out.print("selected=selected");%>>大专</option>
		<option value="本科" <%if(xlxw.equals("本科"))out.print("selected=selected");%>>本科</option>
		<option value="硕士研究生" <%if(xlxw.equals("硕士研究生"))out.print("selected=selected");%>>硕士研究生</option>
		<option value="博士研究生" <%if(xlxw.equals("博士研究生"))out.print("selected=selected");%>>博士研究生</option>
	</select>
	</td>
     <td class=forumrowhighlight>
	专业    <select id="zy" name="zy">
		<option value="" <%if(zy.equals(""))out.print("selected=selected");%>>全部
		<option value="工商管理" <%if(zy.equals("工商管理"))out.print("selected=selected");%>>工商管理</option>
		<option value="行政管理" <%if(zy.equals("行政管理"))out.print("selected=selected");%>>行政管理</option>
		<option value="人力资源" <%if(zy.equals("人力资源"))out.print("selected=selected");%>>人力资源</option>
		<option value="财务" <%if(zy.equals("财务"))out.print("selected=selected");%>>财务</option>
		<option value="计算机" <%if(zy.equals("计算机"))out.print("selected=selected");%>>计算机</option>
		<option value="其它" <%if(zy.equals("其它"))out.print("selected=selected");%>>其它</option>
	</select>
	</td>
	  <td class=forumrowhighlight>
	性别<select id="sex" name="sex">
			<option value="" <%if(sex.equals(""))out.print("selected=selected");%>>全部
			<option value="男" <%if(sex.equals("男"))out.print("selected=selected");%>>男
			<option value="女" <%if(sex.equals("女"))out.print("selected=selected");%>>女
		</select>
	</td>
	  <td class=forumrowhighlight>
	政治面貌<select id="zzmm" name="zzmm">
			<option value="" <%if(zzmm.equals(""))out.print("selected=selected");%>>全部
			<option value="群众" <%if(zzmm.equals("群众"))out.print("selected=selected");%>>群众
			<option value="党员" <%if(zzmm.equals("党员"))out.print("selected=selected");%>>党员
			<option value="团员" <%if(zzmm.equals("团员"))out.print("selected=selected");%>>团员
		</select>
	</td>

    </TR>
  <TR>
    <TD height=24 colspan="6" align="center" class=forumrow>
      <input type="submit" name="Submit"  value="查询信息">
      
      
      
          </TD>
    </TR>
  </TBODY></TABLE>
  

  
  
  <br />
  
  <TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#87CEFA
border=0>
  <TBODY>
  <TR>
    <TD colSpan=5 height=24>信息列表</TD> 
  </TR>
  <TR>
    <TD width="10%" height=24 align="center" class=forumrow>编号</TD>
    <TD width="15%" height=24 align="center" class=forumrow>姓名</TD>
    <TD width="5%" height=24 align="center" class=forumrow>性别</TD>
    <TD width="10%" align="center" class=forumrowhighlight>部门</TD>
    <TD width="10%" align="center" class=forumrowhighlight>政治面貌</TD>
    <TD width="10%" align="center" class=forumrowhighlight>现任职位</TD>
     <TD width="10%" align="center" class=forumrowhighlight>工作时间</TD>
    <TD width="10%" align="center" class=forumrowhighlight>创建日期</TD>
  </TR>
  <%
  CommDAO dao = new CommDAO();
  String did = request.getParameter("did");
  if(did!=null)
  {
  String s = "update person set status='1' where id="+did;

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
      <TD  height=24 align="center" class=forumrow><a href="javascript:viewperson(<%=m.get("id") %>)"><%=m.get("realname")==null?"&nbsp;":m.get("realname")%></a></TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("sex")==null?"&nbsp;":m.get("sex")%></TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("dept")==null?"&nbsp;":m.get("dept")%></TD>
  	
    <TD  height=24 align="center" class=forumrow><%=m.get("zzmm")==null?"&nbsp;":m.get("zzmm")%></TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("zw")==null?"&nbsp;":m.get("zw")%></TD>
<TD  height=24 align="center" class=forumrow><%=m.get("gzsj")==null?"&nbsp;":m.get("gzsj")%></TD>
    <TD  height=24 align="center" class=forumrow><%=m.get("savetime")==null?"&nbsp;":m.get("savetime")%></TD>
  </TR>
  <%} %>
  
  <TR>
   <%session.setAttribute("sql",sql); %>
   <td colspan="2" align="center" class=forumrow><a href="/gbgl/sys.do?action=downFile&sql=<%=sql %>">导出报表</a></td>
    <TD height=24 colspan="8" align="center" class=forumrow>
      ${page.info }</TD>
    </TR>
  </TBODY></TABLE>
</form>
</BODY></HTML>
<script type="text/javascript">

function viewperson(id){
  pop("viewperson.jsp?id="+id,"查看干部详情",850,320);
}

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