<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0037)http://2school.wygk.cn/admin/left.htm -->
<HTML><HEAD><TITLE>左栏帮助</TITLE>
<LINK 
href="/workcorrectionsys/pages/images/left.files/style_left.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD style="PADDING-TOP: 10px" vAlign=top>
      <TABLE class=alpha>
        <TBODY>
        <TR>
          <TD class=menu id=menubar vAlign=top>
            <%
           HashMap map = (HashMap)request.getSession().getAttribute("admin");
             %>
          
          
          <%
          if(map.get("type").equals("管理员"))
          {
           %>
           <LI><A href="notice.jsp" 
            target=frmright>新闻管理</A> </LI>
            
            <LI><A href="x-students.jsp" 
            target=frmright>学生管理</A> </LI>
            
             <LI><A href="x-teachers.jsp" 
            target=frmright>教师管理</A> </LI>
            
            <LI><A href="bj.jsp" 
            target=frmright>班级管理</A> </LI>
            
            <LI><A href="x-kcs.jsp" 
            target=frmright>课程管理</A> </LI>
            
            
           <LI><A href="sysuser.jsp" 
            target=frmright>系统用户管理</A> </LI>
            
            <LI><A href="uppass.jsp" 
        target=frmright>修改登录密码</A></LI>
        <%} %>
        
         <%
          if(map.get("type").equals("学生"))
          {
           %>
           
           <LI><A href="noticev.jsp" 
            target=frmright>新闻信息</A></LI>
            
           <LI><A href="zylist.jsp" 
            target=frmright>作业列表</A></LI>
            
            
             <LI><A href="stuupuser.jsp" 
            target=frmright>个人信息修改</A></LI>
        <%} %>
         <%if(map.get("type").equals("教师")){ %>
         
         
          <LI><A href="noticev.jsp" 
            target=frmright>新闻信息</A></LI>
            
             <LI><A href="mystudents.jsp" 
            target=frmright>我的学生</A></LI>
            
           <LI><A href="zy.jsp" 
            target=frmright>发布作业</A></LI>
            
         <LI><A href="zygl.jsp" 
            target=frmright>作业管理</A></LI>
            
             <LI><A href="teacherupuser.jsp" 
            target=frmright>个人信息修改</A></LI>
            
        <%} %>
        
        
        </TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD class=copyright></TD></TR>
  <TR>
    <TD class=copyright></TD></TR></TBODY></TABLE></BODY></HTML>
