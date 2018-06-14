<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="common.Info"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0037)http://2school.wygk.cn/admin/main.asp -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE>作业批改系统</TITLE>
<LINK 
href="images/style.css" type=text/css 
rel=stylesheet>
<STYLE>
.main_left {
	TABLE-LAYOUT: auto; BACKGROUND: url(/workcorrectionsys/pages/images/left_bg.gif)
}
.main_left_top {
	BACKGROUND: url(/workcorrectionsys/pages/images/left_menu_bg.gif); PADDING-TOP: 5px
}
.main_left_title {
	PADDING-LEFT: 15px; FONT-WEIGHT: bold; FONT-SIZE: 14px; COLOR: #ffffff; TEXT-ALIGN: left
}
.left_iframe {
	BACKGROUND: none transparent scroll repeat 0% 0%; VISIBILITY: inherit; WIDTH: 180px; HEIGHT: 92%
}
.main_iframe {
	Z-INDEX: 1; VISIBILITY: inherit; WIDTH: 100%; HEIGHT: 92%
}
TABLE {
	FONT-SIZE: 12px; FONT-FAMILY: tahoma, 宋体, fantasy
}
TD {
	FONT-SIZE: 12px; FONT-FAMILY: tahoma, 宋体, fantasy
}
.STYLE1 {
	font-size: 24px;
	font-weight: bold;
	color: #63BCA6;
}
.STYLE2 {
	color: #F5F5F5
}
</STYLE>

<SCRIPT language=javaScript src="/workcorrectionsys/pages/images/admin.js" 
type=text/javascript></SCRIPT>

<SCRIPT language=javascript 
src="/workcorrectionsys/pages/images\Admin(1).js"></SCRIPT>

<SCRIPT>
var status = 1;
var Menus = new DvMenuCls;
document.onclick=Menus.Clear;
function switchSysBar(){
     if (1 == window.status){
		  window.status = 0;
          switchPoint.innerHTML = '<img src="/workcorrectionsys/pages/images/left.gif">';
          document.all("frmTitle").style.display="none";
     }
     else{
		  window.status = 1;
          switchPoint.innerHTML = '<img src="/workcorrectionsys/pages/images/right.gif">';
          document.all("frmTitle").style.display="";
     }
}
</SCRIPT>

<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY style="MARGIN: 0px" onLoad="x(1);"><!--导航部分-->
<DIV class=top_table style="height: 42px;BACKGROUND: url(/workcorrectionsys/pages/images/top_bg.gif)">
<DIV class=top_table_leftbg>

<DIV class="STYLE1 STYLE2" style="vertical-align:middle; height:60px; margin-left:auto;margin-right:auto;" align="center" valign="middle" >作业批改系统
 

</DIV>
</DIV>
</DIV>
<!--导航部分结束-->
<%
HashMap map = (HashMap)request.getSession().getAttribute("admin");

 %>
<TABLE style="BACKGROUND: #87CEFA" height="92%" cellSpacing=0 cellPadding=0 
width="100%" border=0>
  <TBODY>
  <TR>
    <TD class=main_left id=frmTitle vAlign=top align=middle name="fmTitle">
      <TABLE class=main_left_top cellSpacing=0 cellPadding=0 width="100%" 
      border=0>
        <TBODY>
        <TR height=32>
          <TD vAlign=top></TD>
          <TD class=main_left_title id=leftmenu_title>后台管理</TD>
          <TD vAlign=top align=right></TD></TR></TBODY></TABLE><IFRAME 
      class=left_iframe id=frmleft name=frmleft 
      src="/workcorrectionsys/pages/left.jsp" frameBorder=0 
      allowTransparency></IFRAME>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR height=32>
          <TD vAlign=top></TD>
          <TD vAlign=bottom align=middle></TD>
          <TD vAlign=top align=right></TD></TR></TBODY></TABLE></TD>
    <TD style="WIDTH: 10px" bgColor=#87CEFA>
      <TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD style="HEIGHT: 100%" onclick=switchSysBar()><SPAN class=navPoint 
            id=switchPoint title=关闭/打开左栏><IMG 
            src="/workcorrectionsys/pages/images/right.gif"></SPAN> 
        </TD></TR></TBODY></TABLE></TD>
    <TD vAlign=top width="100%" bgColor=#87CEFA>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" bgColor=#c4d8ed 
        border=0><TBODY>
        <TR height=32>
          <TD vAlign=top width=10 
          background=/workcorrectionsys/pages/images/bg2.gif><IMG alt="" 
            src="/workcorrectionsys/pages/images/teble_top_left.gif"></TD>
          <TD width=28 
          background=/workcorrectionsys/pages/images/bg2.gif></TD>
          <TD width="884" background=/workcorrectionsys/pages/images/bg2.gif><SPAN 
            style="FLOAT: left">欢迎登录本系统:

            <%=map.get("uname") %>
           
            &nbsp;&nbsp;&nbsp;&nbsp;
            
            登录时间:<%=Info.getDateStr() %>
            
            &nbsp;&nbsp;&nbsp;&nbsp;
            
           在线时间:
            
            <div style='display: inline;' id=h >
			00:00:00
			</div>
            
            </SPAN><SPAN 
            id=dvbbsannounce 
            style="FONT-WEIGHT: bold; FLOAT: left; WIDTH: 300px; COLOR: #c00"></SPAN></TD>
          <TD width="118" 
          background=/workcorrectionsys/pages/images/bg2.gif style="COLOR: #87CEFA; TEXT-ALIGN: right">
         
        
         
          <A href="/workcorrectionsys/pages/login.jsp" target=_top>退出</A> 
          
          
          
          
          
          
          </TD>
          <TD vAlign=top align=right width=28 
          background=/workcorrectionsys/pages/images/bg2.gif><IMG alt="" 
            src="/workcorrectionsys/pages/images/teble_top_right.gif"></TD>
          <TD align=right width=16 bgColor=#87CEFA></TD></TR></TBODY></TABLE>
          
          <%
          String url = "";
          if(map.get("type").equals("学生"))
          {
          url="zylist.jsp";
          }
          if(map.get("type").equals("管理员"))
          {
          url="x-students.jsp";
          }
          if(map.get("type").equals("教师"))
          {
          url="mystudents.jsp";
          }
         
           %>
          
          <IFRAME 
      class=main_iframe id=frmright name=frmright 
      src="/workcorrectionsys/pages/<%=url %>" frameBorder=0 
      scrolling=yes></IFRAME>
      
      
      
      <TABLE style="BACKGROUND: #87CEFA" cellSpacing=0 cellPadding=0 
      width="100%" border=0>
        <TBODY>
        <TR>
          <TD><IMG height=6 alt="" 
            src="/workcorrectionsys/pages/images/teble_bottom_left.gif" 
            width=5></TD>
          <TD align=right><IMG height=6 alt="" 
            src="/workcorrectionsys/pages/images/teble_bottom_right.gif" 
            width=5></TD>
          <TD align=right width=16 
  bgColor=#87CEFA></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<DIV id=dvbbsannounce_true style="DISPLAY: none"></DIV>

</BODY></HTML>
<script>
a=b=c=0
function x(n){
if(n){
if(n==1){

N=setInterval(function(){a++
if(a==60){a=0;b++}
if(b==60){b=0;c++}
h.innerText=c+':'+b+':'+a
},1000)
}else{a=b=c=0;h.innerText='00:00:00'}
}
else{clearInterval(N)}
}

</script> 

