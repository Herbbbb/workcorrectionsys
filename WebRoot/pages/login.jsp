<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>作业批改系统</TITLE>
<META content="MSHTML 6.00.2800.1611" name=GENERATOR>
<LINK href="/workcorrectionsys/pages/images/css1.css" type=text/css rel=stylesheet><LINK 
href="/workcorrectionsys/pages/images/newhead.css" type=text/css rel=stylesheet></HEAD>
<BODY bgColor=#eef8e0 leftMargin=0 topMargin=0 MARGINWIDTH="0" MARGINHEIGHT="0" onload="pageslogin.uname.focus();">
<FORM name=pageslogin action="/workcorrectionsys/sys.do?action=userlogin" method=post>
<TABLE cellSpacing=0 cellPadding=0 width=1004 border=0>
  <TBODY>
  <TR>
    <TD colSpan=6><IMG height=92 alt="" src="/workcorrectionsys/pages/images/crm_1.gif" 
    width=345></TD>
    <TD colSpan=4><IMG height=92 alt="" src="/workcorrectionsys/pages/images/crm_2.gif" 
    width=452></TD>
    <TD><IMG height=92 alt="" src="/workcorrectionsys/pages/images/crm_3.gif" width=207></TD></TR>
  <TR>
    <TD colSpan=6><IMG height=98 alt="" src="/workcorrectionsys/pages/images/crm_4.gif" 
    width=345></TD>
    <TD colSpan=4><IMG height=98 alt="" src="/workcorrectionsys/pages/images/crm_5.gif" 
    width=452></TD>
    <TD><IMG height=98 alt="" src="/workcorrectionsys/pages/images/crm_6.gif" width=207></TD></TR>
  <TR>
    <TD rowSpan=5><IMG height=370 alt="" src="/workcorrectionsys/pages/images/crm_7.gif" 
    width=59></TD>
    <TD colSpan=5><IMG height=80 alt="" src="/workcorrectionsys/pages/images/crm_8.gif" 
    width=286></TD>
    <TD colSpan=4><IMG height=80 alt="" src="/workcorrectionsys/pages/images/crm_9.gif" 
    width=452></TD>
    <TD><IMG height=80 alt="" src="/workcorrectionsys/pages/images/crm_10.gif" width=207></TD></TR>
  <TR>
    <TD><IMG height=110 alt="" src="/workcorrectionsys/pages/images/crm_11.gif" width=127></TD>
    <TD background=/workcorrectionsys/pages/images/crm_12.gif colSpan=6>
      <TABLE id=table1 cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
        <TR>
          <TD>
            <TABLE id=table2 cellSpacing=1 cellPadding=0 width="100%" 
              border=0><TBODY>
              <TR>
                <TD align=middle width=81><FONT color=#ffffff>用户名：</FONT></TD>
                <TD><INPUT class=regtxt title=请填写用户名 maxLength=16 size=16 
                   name=uname></TD></TR>
              <TR>
                <TD align=middle width=81><FONT color=#ffffff>密&nbsp; 
                码：</FONT></TD>
                <TD><INPUT class=regtxt title=请填写密码 type=password maxLength=16 
                  size=16  name=pwd></TD></TR>
                  <TR>
                   <TR>
                <TD align=middle width=81><FONT color=#ffffff>用户类别：</FONT></TD>
                <TD>
                <input type="radio" id="type" name="type" value="1" checked==checked/>学生
                <input type="radio" id="type" name="type"  value="3"/>教师
                <input type="radio" id="type" name="type"  value="0"/>管理员
               </TD></TR>
                  
                  
                  <TR>
                <TD align=middle colspan="2"  onclick="add();" ><FONT color=#ffffff></FONT></TD></TR>
                  
  <script type="text/javascript">
  function add()
  {
  pop("reguser.jsp","用户注册",400,261);
  }
  
  function addstu()
  {
  pop("addstu.jsp","批量添加学生",400,72);
  }
  
  function update(no)
  {
  pop("updateuser.jsp?id="+no,"修改系统用户",400,261);
  }
  </script>
  <SCRIPT language=javascript src="/workcorrectionsys/js/popup.js"></SCRIPT>
              </TBODY></TABLE></TD></TR></TBODY></TABLE></TD>
    <TD colSpan=2 rowSpan=2><IMG height=158 alt="" 
      src="/workcorrectionsys/pages/images/crm_13.gif" width=295></TD>
    <TD rowSpan=2><IMG height=158 alt="" src="/workcorrectionsys/pages/images/crm_14.gif" 
      width=207></TD></TR>
  <TR>
    <TD rowSpan=3><IMG height=180 alt="" src="/workcorrectionsys/pages/images/crm_15.gif" 
      width=127></TD>
    <TD rowSpan=3><IMG height=180 alt="" src="/workcorrectionsys/pages/images/crm_16.gif" 
    width=24></TD>
    <TD><INPUT title=登录后台 type=image height=48 alt="" width=86 
      src="/workcorrectionsys/pages/images/crm_17.gif" name=image></TD>
    <TD><IMG height=48 alt="" src="/workcorrectionsys/pages/images/crm_18.gif" width=21></TD>
    <TD colSpan=2><A href="http://www.fdkjgz.com/shop/index.asp"><IMG 
      title=返回首页 height=48 alt="" src="/workcorrectionsys/pages/images/crm_19.gif" width=84 
      border=0></A></TD>
    <TD><IMG height=48 alt="" src="/workcorrectionsys/pages/images/crm_20.gif" width=101></TD></TR>
  <TR>
    <TD colSpan=5 rowSpan=2><IMG height=132 alt="" 
      src="/workcorrectionsys/pages/images/crm_21.gif" width=292></TD>
    <TD rowSpan=2><IMG height=132 alt="" src="/workcorrectionsys/pages/images/crm_22.gif" 
      width=170></TD>
    <TD colSpan=2><IMG height=75 alt="" src="/workcorrectionsys/pages/images/crm_23.gif" 
    width=332></TD></TR>
  <TR>
    <TD colSpan=2><IMG height=57 alt="" src="/workcorrectionsys/pages/images/crm_24.gif" 
    width=332></TD></TR>
  <TR>
    <TD><IMG height=1 alt="" src="/workcorrectionsys/pages/images/spacer.gif" width=59></TD>
    <TD><IMG height=1 alt="" src="/workcorrectionsys/pages/images/spacer.gif" width=127></TD>
    <TD><IMG height=1 alt="" src="/workcorrectionsys/pages/images/spacer.gif" width=24></TD>
    <TD><IMG height=1 alt="" src="/workcorrectionsys/pages/images/spacer.gif" width=86></TD>
    <TD><IMG height=1 alt="" src="/workcorrectionsys/pages/images/spacer.gif" width=21></TD>
    <TD><IMG height=1 alt="" src="/workcorrectionsys/pages/images/spacer.gif" width=28></TD>
    <TD><IMG height=1 alt="" src="/workcorrectionsys/pages/images/spacer.gif" width=56></TD>
    <TD><IMG height=1 alt="" src="/workcorrectionsys/pages/images/spacer.gif" width=101></TD>
    <TD><IMG height=1 alt="" src="/workcorrectionsys/pages/images/spacer.gif" width=170></TD>
    <TD><IMG height=1 alt="" src="/workcorrectionsys/pages/images/spacer.gif" width=125></TD>
    <TD><IMG height=1 alt="" src="/workcorrectionsys/pages/images/spacer.gif" 
  width=207></TD></TR></TBODY></TABLE></FORM></BODY></HTML>
  
  <script type="text/javascript">
<%
String error = (String)request.getAttribute("error");
if(error!=null)
{
 %>
 alert("用户名或密码错误");
 <%}%>
 </script>
