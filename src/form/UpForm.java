/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package form;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

/** 
 * MyEclipse Struts
 * Creation date: 06-14-2008
 * 
 * XDoclet definition:
 * @struts.form name="indexForm"
 */
public class UpForm extends ActionForm {
	/*
	 * Generated fields
	 */

	
	 
	FormFile txt;
	
	FormFile txt1;
	
	FormFile txt2;
	
	FormFile txt3;

	/*
	 * Generated Methods
	 */



	


	/** 
	 * Method validate
	 * @param mapping
	 * @param request
	 * @return ActionErrors
	 */
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 
	 * Method reset
	 * @param mapping
	 * @param request
	 */
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		// TODO Auto-generated method stub
	}



	public FormFile getTxt() {
		return txt;
	}

	public void setTxt(FormFile txt) {
		this.txt = txt;
	}

	public FormFile getTxt1() {
		return txt1;
	}

	public void setTxt1(FormFile txt1) {
		this.txt1 = txt1;
	}

	public FormFile getTxt2() {
		return txt2;
	}

	public void setTxt2(FormFile txt2) {
		this.txt2 = txt2;
	}

	public FormFile getTxt3() {
		return txt3;
	}

	public void setTxt3(FormFile txt3) {
		this.txt3 = txt3;
	}



}