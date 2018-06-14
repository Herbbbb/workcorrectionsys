package action;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.upload.FormFile;
import common.CommDAO;
import common.Info;
import common.StrUtil;
import common.UploadUtil;
import entitydao.LotlogsDAO;
import entitydao.SysusersDAO;
import form.UpForm;

public class SysAction extends DispatchAction {

	public ActionForward login(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		return null;
	}
	
	
	public ActionForward uploadtest(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		UpForm uform = (UpForm)form;
		FormFile file = uform.getTxt();
		UploadUtil util = new UploadUtil(file);
		String filename = util.newNaveFile(request.getRealPath("/upfile/"), file);
		return mapping.findForward("index");
	}
	/**
	 * 管理员\老师、学生登陆
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward userlogin(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CommDAO dao = new CommDAO();
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		String type = request.getParameter("type");
		String upwd = "";
		String sql1 = "select * from sysuser where uname='"+uname+"' and type='管理员' and delstatus=0";
		String sql2 = "select * from student where uname='"+uname+"' and delstatus=0";
		String sql3 = "select * from sysuser where uname='"+uname+"' and type='教师' and delstatus=0";
		if(type.equals("0")) //管理员
		{
			List<HashMap> list1 = dao.select(sql1);
			if(list1.size()!=0){//用户存在
				HashMap map1 = list1.get(0);
				upwd = map1.get("upass").toString();
				if(pwd.equals(upwd)){
					request.getSession().setAttribute("admin", map1);
					//LotlogsDAO.addLogs(request.getSession(), "登陆");
					return mapping.findForward("index");
				}else{          //密码错误
					request.setAttribute("error", "");
					return mapping.findForward("login");
				}
			}else{        //密码错误
				request.setAttribute("error", "");
				return mapping.findForward("login");
			}
		}
		if(type.equals("1"))
		{
			List<HashMap> list2 = dao.select(sql2);
			if(list2.size()!=0){//用户存在
				HashMap map2 = list2.get(0);
				upwd = map2.get("upass").toString();
				if(pwd.equals(upwd)){
					
					request.getSession().setAttribute("admin", map2);
					//LotlogsDAO.addLogs(request.getSession(), "登陆");
					return mapping.findForward("index");
				}else{          //密码错误
					request.setAttribute("error", "");
					  return mapping.findForward("login");
				}
			}else{          //密码错误
				request.setAttribute("error", "");
				return mapping.findForward("login");
			}
		}if(type.equals("3"))
		{
			List<HashMap> list3 = dao.select(sql3);
			if(list3.size()!=0){//用户存在
				HashMap map3 = list3.get(0);
				upwd = map3.get("upass").toString();
				if(pwd.equals(upwd)){
					
					request.getSession().setAttribute("admin", map3);
					//LotlogsDAO.addLogs(request.getSession(), "登陆");
					return mapping.findForward("index");
				}else{          //密码错误
					request.setAttribute("error", "");
					  return mapping.findForward("login");
				}
			}else{          //密码错误
				request.setAttribute("error", "");
				return mapping.findForward("login");
			}
		}
		return null;
	}
	/**
	 * 添加系统用户
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward addsysuser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//LotlogsDAO.addLogs(request.getSession(), "添加系统用户");
		String uname = request.getParameter("uname");
		String upass = request.getParameter("pwd");
		String type = "管理员";
		CommDAO dao = new CommDAO();
		String savetime = Info.getDateStr();
		String s = "select * from sysuser where uname='"+uname+"'";
		List<HashMap> list = dao.select(s);
		if(list.size()!=0){
			request.setAttribute("no", "");
			return mapping.findForward("addsysusersuc");
		}else{
		String sql = "insert into sysuser (uname,upass,type,savetime,delstatus) values ('"+uname+"','"+upass+"','"+type+"','"+savetime+"','0')";
		dao.commOper(sql);
		request.setAttribute("suc", "");
		return mapping.findForward("addsysusersuc");
		}
	}
	
	
	/**
	 * 修改系统用户
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward upsysuser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//LotlogsDAO.addLogs(request.getSession(), "修改系统用户");
		String id = request.getParameter("id");
		String uname = request.getParameter("uname");
		String upass = request.getParameter("pwd");
		CommDAO dao = new CommDAO();
		String sql = "update sysuser set uname='"+uname+"',upass='"+upass+"' where id="+id;
		dao.commOper(sql);
		request.setAttribute("suc", "");
		return mapping.findForward("upsysusersuc");
	}
	
	/**
	 * 添加教师
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward addteacher(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//LotlogsDAO.addLogs(request.getSession(), "添加系统用户");
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("upass");
		String tname = request.getParameter("tname");
		String sex = request.getParameter("sex");
		String bjid = request.getParameter("bjid");
		String type = "教师";
		CommDAO dao = new CommDAO();
		String savetime = Info.getDateStr();
		String s = "select * from sysuser where uname='"+uname+"' and type='"+type+"'";
		List<HashMap> list = dao.select(s);
		if(list.size()!=0){
			request.setAttribute("no", "");
			return mapping.findForward("addteachersuc");
		}else{
		String sql = "insert into sysuser (uname,upass,tname,sex,type,savetime,delstatus,bjid) values ('"+uname+"','"+pwd+"','"+tname+"','"+sex+"','"+type+"','"+savetime+"','0','"+bjid+"')";
		dao.commOper(sql);
		request.setAttribute("suc", "");
		return mapping.findForward("addteachersuc");
		}
	}
	/**
	 * 修改教师
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward upteacher(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CommDAO dao = new CommDAO();
		String id = request.getParameter("id");
		String upass = request.getParameter("upass");
		String tname = request.getParameter("tname");
		String sex = request.getParameter("sex");
		String bjid = request.getParameter("bjid");
		String sql = "update sysuser set upass='"+upass+"' ,tname='"+tname+"',sex='"+sex+"',bjid='"+bjid+"' where id="+id;
		dao.commOper(sql);
		request.setAttribute("suc", "");
		return mapping.findForward("addteachersuc");
	}
	
	/**
	 * 添加班级
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward addbj(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//LotlogsDAO.addLogs(request.getSession(), "添加系统用户");
		String bjname = request.getParameter("bjname");
		CommDAO dao = new CommDAO();
		String s = "select * from bj where bjname='"+bjname+"' and delstatus=0 ";
		List<HashMap> list = dao.select(s);
		if(list.size()!=0){
			request.setAttribute("no", "");
			return mapping.findForward("addbjsuc");
		}else{
		String sql = "insert into bj (bjname,delstatus) values ('"+bjname+"','0')";
		dao.commOper(sql);
		request.setAttribute("suc", "");
		return mapping.findForward("addbjsuc");
		}
	}
	/**
	 * 修改
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward upbj(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//LotlogsDAO.addLogs(request.getSession(), "添加系统用户");
		String id = request.getParameter("id");
		String bjname = request.getParameter("bjname");
		CommDAO dao = new CommDAO();
		String sql = "update  bj set bjname='"+bjname+"' where id="+id;
		dao.commOper(sql);
		request.setAttribute("suc", "");
		return mapping.findForward("addbjsuc");
	}
	/**
	 * 添加学生
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward addstudent(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//LotlogsDAO.addLogs(request.getSession(), "添加学生");
		String uname = request.getParameter("uname");
		String upass = request.getParameter("upass");
		String tname = request.getParameter("tname");
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String zy = request.getParameter("zy");
		String delstatus = "0";
		String savetime = Info.getDateStr();
		String bj = request.getParameter("bj");
		String rxyear = request.getParameter("rxyear");
		String type = "学生";
		CommDAO dao = new CommDAO();
		String s = "select * from student where uname='"+uname+"' and delstatus=0";
		List<HashMap> list = dao.select(s);
		if(list.size()!=0){
			request.setAttribute("no", "");
			return mapping.findForward("addstudentsuc");
		}else{
			UpForm uform = (UpForm)form;
			FormFile file = uform.getTxt();
			UploadUtil util = new UploadUtil(file);
			String filename = util.newNaveFile(request.getRealPath("/upfile/"), file);
		String sql = "insert into student (zy,type,uname,upass,tname,age,sex,bj,rxyear,delstatus,savetime,img)values('"+zy+"','"+type+"','"+uname+"','"+upass+"','"+tname+"','"+age+"','"+sex+"','"+bj+"','"+rxyear+"','"+delstatus+"','"+savetime+"','"+filename+"')";
		dao.commOper(sql);
		request.setAttribute("suc", "");
		return mapping.findForward("addstudentsuc");
		}
	}
	
	/**
	 * 管理员修改学生信息
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward upstudent(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CommDAO dao = new CommDAO();
		String id = request.getParameter("id");
		String upass = request.getParameter("upass");
		String tname = request.getParameter("tname");
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String zy = request.getParameter("zy");
		String bj = request.getParameter("bj");
		String rxyear = request.getParameter("rxyear");
		String ss = "select * from student where id="+id;
		HashMap map = dao.select(ss).get(0);
		String url = map.get("img").toString();
		UpForm uform = (UpForm)form;
		FormFile file = uform.getTxt();
		if(file.getFileName().length()>0){
			UploadUtil util = new UploadUtil(file);
			url = util.newNaveFile(request.getRealPath("/upfile/"), file);
		}
		String sql = "update student set upass='"+upass+"',tname='"+tname+"',age='"+age+"',sex='"+sex+"',zy='"+zy+"',bj='"+bj+"',rxyear='"+rxyear+"',img='"+url+"' where id="+id+"";
		
			dao.commOper(sql);
		request.setAttribute("id", id);
		request.setAttribute("suc", "");
		return mapping.findForward("upstudentsuc");
		}
	
	/**
	 * 管理员修改密码
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward upsysuserpwd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		//LotlogsDAO.addLogs(request.getSession(), "修改密码");
		String olduserpass = request.getParameter("olduserpass");
		String userpass = request.getParameter("userpass");
		CommDAO dao = new CommDAO();
		HashMap map = (HashMap)request.getSession().getAttribute("admin");
		String pwd = map.get("pwd").toString();
		String id = map.get("id").toString();
		if(olduserpass.equals(pwd)){
			String sql = "update sysuser set upass='"+userpass+"' where id="+id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			return mapping.findForward("upsysuserpwdsuc");
		}else{
			request.setAttribute("error", "");
			return mapping.findForward("upsysuserpwdsuc");
		}
	}
	/**
	 * 学生修改个人信息
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward stuupuser(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CommDAO dao = new CommDAO();
		String id = request.getParameter("id");
		String upass = request.getParameter("upass");
		String tname = request.getParameter("tname");
		String age = request.getParameter("age");
		String sex = request.getParameter("sex");
		String ss = "select * from student where id="+id;
		HashMap map = dao.select(ss).get(0);
		String url = map.get("img").toString();
		UpForm uform = (UpForm)form;
		FormFile file = uform.getTxt();
		if(file.getFileName().length()>0){
			UploadUtil util = new UploadUtil(file);
			url = util.newNaveFile(request.getRealPath("/upfile/"), file);
		}
		String sql = "update student set upass='"+upass+"',tname='"+tname+"',age='"+age+"',sex='"+sex+"',img='"+url+"' where id="+id+"";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			return mapping.findForward("supuserpwdsuc");
	}
	/**
	 * 教师修改密码
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward tupuserpwd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		String upass = request.getParameter("upass");
		String id = request.getParameter("id");
		String tname = request.getParameter("tname");
		String sex = request.getParameter("sex");
		CommDAO dao = new CommDAO();
		
			String sql = "update sysuser set upass='"+upass+"', tname='"+tname+"',sex='"+sex+"' where id="+id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
			return mapping.findForward("tupuserpwdsuc");
	}
		/**
		 * 添加作业
		 * @param mapping
		 * @param form
		 * @param request
		 * @param response
		 * @return
		 */
		public ActionForward addzy(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) {
			String delstatus = "0";
			String teacherid = request.getParameter("teacherid");
			
			CommDAO dao = new CommDAO();
			HttpSession session = request.getSession();
			HashMap user = (HashMap)session.getAttribute("admin");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String kcid = request.getParameter("kcid");
			String savetime = Info.getDateStr();
			UpForm uform = (UpForm)form;
			FormFile file = uform.getTxt1();
			UploadUtil util = new UploadUtil(file);
			String filename = util.newNaveFile(request.getRealPath("/upfile/"), file);
			String sql = "insert into zy (title,content,delstatus,teacherid,savetime,zyfile,kcid) values ('"+title+"','"+content+"','"+delstatus+"','"+teacherid+"','"+savetime+"','"+filename+"','"+kcid+"')";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			return mapping.findForward("addzysuc");
		}
		/**
		 * 修改作业
		 * @param mapping
		 * @param form
		 * @param request
		 * @param response
		 * @return
		 */
		public ActionForward upzy(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String id = request.getParameter("id");
			String kcid = request.getParameter("kcid");
			String sql ="";
			UpForm uform = (UpForm)form;
			FormFile file = uform.getTxt1();
			UploadUtil util = new UploadUtil(file);
			String filename = util.newNaveFile(request.getRealPath("/upfile/"), file);
			sql = "update zy set title='"+title+"',content='"+content+"',zyfile='"+filename+"',kcid='"+kcid+"' where id="+id;
			CommDAO dao = new CommDAO();
			dao.commOper(sql);
			request.setAttribute("id", id);
			request.setAttribute("suc", "");
			return mapping.findForward("upzysuc");
		}
		/**
		 * 答案发布
		 * @param mapping
		 * @param form
		 * @param request
		 * @param response
		 * @return
		 */
		public ActionForward answerfb(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) {
			String answer = request.getParameter("answer");
			String id = request.getParameter("id");
			UpForm uform = (UpForm)form;
			FormFile file = uform.getTxt1();
			UploadUtil util = new UploadUtil(file);
			String filename = util.newNaveFile(request.getRealPath("/upfile/"), file);
			 String sql = "update zy set answer='"+filename+"' where id="+id;
			CommDAO dao = new CommDAO();
			dao.commOper(sql);
			request.setAttribute("id", id);
			request.setAttribute("suc", "");
			return mapping.findForward("answerfbsuc");
		}
		
		/**
		 * 上传作业
		 * @param mapping
		 * @param form
		 * @param request
		 * @param response
		 * @return
		 */
		public ActionForward uploadzy(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) {
			CommDAO dao = new CommDAO();
			HttpSession session = request.getSession();
			HashMap user = (HashMap)session.getAttribute("admin");
			String stuid = user.get("id").toString();
			String zyid = request.getParameter("zyid");
			String savetime = Info.getDateStr();
			UpForm uform = (UpForm)form;
			FormFile file = uform.getTxt1();
			UploadUtil util = new UploadUtil(file);
			String filename = util.newNaveFile(request.getRealPath("/upfile/"), file);
			String cksql = "select * from myzy where stuid="+stuid+" and zyid="+zyid+" ";
			ArrayList list = (ArrayList)dao.select(cksql);
			String sql = "";
			if(list.size()==0){
				sql = "insert into myzy (stuid,zyid,savetime,zyfile) values ('"+stuid+"','"+zyid+"','"+savetime+"','"+filename+"') ";
			}else{
				HashMap m = (HashMap)list.get(0);
				
				sql = "update myzy set zyfile='"+filename+"' where id="+m.get("id")+" ";
			}

			dao.commOper(sql);
			request.setAttribute("suc", "");
			return mapping.findForward("uploadzysuc");
		}
		/**
		 * 作业评分
		 * @param mapping
		 * @param form
		 * @param request
		 * @param response
		 * @return
		 */
		public ActionForward zypf(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
			String myzyid = request.getParameter("myzyid");
			String score = request.getParameter("score");
			CommDAO dao = new CommDAO();
			
			String sql = "update myzy set score="+score+" where id="+myzyid+"";
			dao.commOper(sql);
			request.setAttribute("suc", "");
			return mapping.findForward("zypfsuc");
			
		}
		

		
		
		

		//发布新闻
		public ActionForward addnotice(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) {
		//+++news
			CommDAO dao = new CommDAO();
			String type = request.getParameter("type");
			String title = request.getParameter("title");
			String content = request.getParameter("mt");
			String savetime = Info.getDateStr();
			String sql = "insert into notice (title,content,savetime,type) values('"+title+"','"+content+"','"+savetime+"','"+type+"')";
			dao.commOper(sql);
			request.setAttribute("suc", "");
				return mapping.findForward("addnotice");
			}
		/**
		 * 修改新闻
		 * @param mapping
		 * @param form
		 * @param request
		 * @param response
		 * @return
		 */
		public ActionForward upnotice(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) {
		//+++news
			CommDAO dao = new CommDAO();
			String id =request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("mt");
			String sql = "update notice set title='"+title+"',content='"+content+"' where id="+id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
				return mapping.findForward("addnotice");
			}
		//发布考试信息
		public ActionForward addksnotice(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) {
		//+++news
			CommDAO dao = new CommDAO();
			String type = request.getParameter("type");
			String title = request.getParameter("title");
			String content = request.getParameter("mt");
			String savetime = Info.getDateStr();
			String sql = "insert into notice (title,content,savetime,type) values('"+title+"','"+content+"','"+savetime+"','"+type+"')";
			dao.commOper(sql);
			request.setAttribute("suc", "");
				return mapping.findForward("addksnotice");
			}
		/**
		 * 修改考试信息
		 * @param mapping
		 * @param form
		 * @param request
		 * @param response
		 * @return
		 */
		public ActionForward upksnotice(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) {
		//+++news
			CommDAO dao = new CommDAO();
			String id =request.getParameter("id");
			String title = request.getParameter("title");
			String content = request.getParameter("mt");
			String sql = "update notice set title='"+title+"',content='"+content+"' where id="+id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
				return mapping.findForward("addksnotice");
			}
		/**
		 * 评分/修改分数
		 * @param mapping
		 * @param form
		 * @param request
		 * @param response
		 * @return
		 */
		public ActionForward uppf(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) {
			//LotlogsDAO.addLogs(request.getSession(), "修改课程");
			String id = request.getParameter("id");
			String score = request.getParameter("score");
			String remark ="";
			 String sql = "update mykc set score='"+score+"',remark='"+remark+"' where id="+id;
			CommDAO dao = new CommDAO();
			dao.commOper(sql);
			request.setAttribute("suc", "");
			return mapping.findForward("uppfsuc");
		}
		/**
		 * 启动课程
		 * @param mapping
		 * @param form
		 * @param request
		 * @param response
		 * @return
		 */
		public ActionForward qdkc(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) {
			String kid = request.getParameter("kid");
			String content = request.getParameter("content");
			CommDAO dao = new CommDAO();
			dao.commOper("update  kc set kkstatus='已启动' where id="+kid);
			
			ArrayList<HashMap> list = (ArrayList)dao.select("select * from mykc where kid ='"+kid+"' ");
			String savetime = Info.getDateStr();
			for(HashMap m:list){
				dao.commOper("insert into sfnotice (sid,content,savetime,kid) values ('"+m.get("sid")+"','"+content+"','"+savetime+"','"+kid+"')");
			}
			request.setAttribute("kid", kid);
			request.setAttribute("suc", "");
			return mapping.findForward("qdkc");
		}
		
		/**
		 * 添加课程
		 * @param mapping
		 * @param form
		 * @param request
		 * @param response
		 * @return
		 */
		public ActionForward addkc(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) {
		//+++news
			CommDAO dao = new CommDAO();
			String kcname = request.getParameter("kcname");
			String xf = request.getParameter("xf");
			String sql = "insert into kc (kcname,xf,delstatus) values ('"+kcname+"','"+xf+"','0')";
			dao.commOper(sql);
			request.setAttribute("suc", "");
				return mapping.findForward("addkc");
			}
		
		/**
		 * 编辑
		 * @param mapping
		 * @param form
		 * @param request
		 * @param response
		 * @return
		 */
		public ActionForward upkc(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response) {
		//+++news
			CommDAO dao = new CommDAO();
			String id = request.getParameter("id");
			String kcname = request.getParameter("kcname");
			String xf = request.getParameter("xf");
			String sql = "update kc set kcname='"+kcname+"',xf='"+xf+"' where id ="+id;
			dao.commOper(sql);
			request.setAttribute("suc", "");
				return mapping.findForward("addkc");
			}
}