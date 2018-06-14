package common;

import org.apache.struts.upload.FormFile;


import java.io.*;

public class UploadUtil {
	private FormFile formFile = null;

	// ï¿½Ä¼ï¿½ï¿½ï¿½×ºï¿½ï¿½
	private String fileExt = "";

	// ï¿½Ä¼ï¿½ï¿½ï¿½
	private String fileName = "";

	// ï¿½Ä¼ï¿½ï¿½ï¿½Ð¡
	private int fileSize = 0;

	private String fileContentType = "";

	/**
	 * è°???¨æ?¹æ??:<br>
	 * UploadUtil upload = new UploadUtil(<FormFile>picture);<br>
	 * upload.saveFile(<String>strAbsPath + picture);<br>
	 * ??²æ?¢é?????
	 * Explorer.renameTo(strAbsPath + picture, newPath);<br>
	 * @param file
	 */
	public UploadUtil(FormFile file) {

		this.formFile = file;

		fileName = formFile.getFileName().trim();
		fileSize = formFile.getFileSize();
		fileContentType = formFile.getContentType();

		if (null != fileName) {
			int temp = fileName.lastIndexOf(".");
			if (-1 != temp) {
				fileExt = fileName.substring(temp + 1);
			}
		}
	}
	
	public UploadUtil() {

	}

	public void saveFile(String filePath) {

		try {
			Explorer.existsAndCreateParent(filePath);
			// retrieve the file data
			InputStream stream = formFile.getInputStream();
			// write the file to the file specified
			OutputStream bos = new FileOutputStream(filePath);
			int bytesRead = 0;
			byte[] buffer = new byte[8192];
			while ((bytesRead = stream.read(buffer, 0, 8192)) != -1) {
				bos.write(buffer, 0, bytesRead);
			}
			bos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			e.getMessage();
		} catch (IOException e) {
			e.printStackTrace();
			e.getMessage();
		}
	}
	
	public String newNaveFile(String filePath,FormFile file) {
     String state = "";
     
		String filename="";
	    StrUtil s = new StrUtil();
	     String im = s.generalSrid();
	     if(file!=null){
	     if(file.getFileSize()>0)
	     {
			filename = file.getFileName();
		
		 int i = filename.indexOf(".");
	     String houzui = filename.substring(i+1);
	    
	     filename = im+"."+houzui;
		try {
			Explorer.existsAndCreateParent(filePath);
			// retrieve the file data
			InputStream stream = formFile.getInputStream();
			// write the file to the file specified
			OutputStream bos = new FileOutputStream(filePath+"/"+filename);
			state = filename;
			int bytesRead = 0;
			byte[] buffer = new byte[8192];
			while ((bytesRead = stream.read(buffer, 0, 8192)) != -1) {
				bos.write(buffer, 0, bytesRead);
			}
			bos.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			e.getMessage();
		} catch (IOException e) {
			e.printStackTrace();
			e.getMessage();
		}
	   
	     }
	     }
		
		return state;
	}
	
	
	public String spSaveFile(String filePath,FormFile file) {
	     
			String filename="";
		    StrUtil s = new StrUtil();
		     String im = s.generalSrid();
		     if(file.getFileSize()>0)
		     {
		    	 filename = file.getFileName();
		 		
				 int i = filename.indexOf(".");
			     String houzui = filename.substring(i+1);
			    
			     filename = im+"."+houzui;
			try {
				Explorer.existsAndCreateParent(filePath);
				// retrieve the file data
				InputStream stream = formFile.getInputStream();
				// write the file to the file specified
				OutputStream bos = new FileOutputStream(filePath+"/"+filename);
				int bytesRead = 0;
				byte[] buffer = new byte[8192];
				while ((bytesRead = stream.read(buffer, 0, 8192)) != -1) {
					bos.write(buffer, 0, bytesRead);
				}
				bos.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				e.getMessage();
			} catch (IOException e) {
				e.printStackTrace();
				e.getMessage();
			}
		   
		     }
		     
		     return filename;
			
		}
	

	public String getFileContentType() {
		return fileContentType;
	}

	public String getFileExt() {
		return fileExt;
	}

	public String getFileName() {
		return fileName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public FormFile getFormFile() {
		return formFile;
	}
	
	
	public  void delPic(String path,String img)
	{
		 if(img!=null)
		 {
			 if(!img.equals(""))
			 {
		  File file1=new File(path + "/" + img); 
	       if(file1.exists() ) {
	    	file1.deleteOnExit();
	         file1.delete(); 
	       }}}
	}
}
