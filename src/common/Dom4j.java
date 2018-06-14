package common;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

public class Dom4j {

	/**
	 * 获取根节点
	 * 
	 * @param xml
	 * @return
	 */
	public static Element getRoot(String xml) {
		Element root = null;
		try {
			Document doc = DocumentHelper.parseText(xml);
			root = doc.getRootElement();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return root;
	}
	
}
