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
<form action="/workcorrectionsys/pages/x-students.jsp?f=f" name="f1" method="post">

<%
String url="/workcorrectionsys/pages/x-students.jsp?1=1";
String key = request.getParameter("key")==null?"":request.getParameter("key");
String sex = request.getParameter("sex")==null?"":request.getParameter("sex");
String zy = request.getParameter("zy")==null?"":request.getParameter("zy");
String sql = "select * from student where delstatus=0 ";
if(!key.equals(""))
{
url+="&key="+key;
sql+=" and (tname like'%"+key+"%' or uname like'%"+key+"%') ";
}if(!sex.equals("")){
url+="&sex="+sex;
sql+=" and (sex ='"+sex+"') ";
}if(!zy.equals("")){
url+="&zy="+zy;
sql+=" and (zy like '%"+zy+"%') ";
}

 %>

<TABLE cellSpacing=1 cellPadding=3 width="95%" align=center bgColor=#87CEFA
border=0>
  <TBODY>
  <TR>
    <TD colSpan=2 height=24>学生管理</TD> 
  </TR>
  <TR>
    <TD width="15%" height=24 align="center" class=forumrow>请输入姓名</TD>
    <TD class=forumrowhighlight width="" 
      height=24><label>
      <input name="key" type="text"  size="30" value="<%=key %>">
    </label></TD>
    <td class=forumrowhighlight>
	性别<select id="sex" name="sex">
			<option value="" <%if(sex.equals(""))out.print("selected=selected");%>>全部
			<option value="男" <%if(sex.equals("男"))out.print("selected=selected");%>>男
			<option value="女" <%if(sex.equals("女"))out.print("selected=selected");%>>女
		</select>
	</td>
	 <TD width="15%" height=24 align="center" class=forumrow>请输入专业</TD>
    <TD class=forumrowhighlight width="" 
      height=24><label>
      <input name="zy" type="text"  size="30" value="<%=zy %>">
    </label></TD>
    </TR>
  <TR>
    <TD height=24 colspan="6" align="center" class=forumrow>
      <input type="submit" name="Submit"  value="查询信息">&nbsp;&nbsp;&nbsp;<input type="button" onclick="add();" name="Submit" value="添加学生">
      
      
      
          </TD>
    </TR>
  </TBODY></TABLE>
  
  <script type="text/javascript">
  function add()
  {
  pop("x-addstudent.jsp","添加学生用户",400,290);
  }
  
  
  
  function update(no)
  {
  pop("x-upstudent.jsp?id="+no,"修改学生用户",400,350);
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
    <TD width="5%" height=24 align="center" class=forumrow>性别</TD>
    <TD width="10%" align="center" class=forumrowhighlight>专业</TD>
    <TD width="10%" align="center" class=forumrowhighlight>班级</TD>
    <TD width="10%" align="center" class=forumrowhighlight>创建日期</TD>
    <TD width="5%" align="center" class=forumrowhighlight>修改</TD>
    <TD width="5%" align="center" class=forumrowhighlight>删除</TD>
  </TR>
  <%
  CommDAO dao = new CommDAO();
  String did = request.getParameter("did");
  if(did!=null)
  {
  String s = "update student set delstatus='1' where id="+did;

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
    <TD  height=24 align="center" class=forumrow><%=m.get("zy")==null?"&nbsp;":m.get("zy")%></TD>
    <TD  height=24 align="center" class=forumrow>
    <%String bjid = m.get("bj").toString();
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
