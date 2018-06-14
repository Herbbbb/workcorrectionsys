package entitydao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

import javax.servlet.http.HttpSession;


import common.CommDAO;
import common.Info;
import common.StrUtil;

public class LotlogsDAO extends CommDAO {
	
	public static void addLogs(HttpSession session,String doinfo)
	{
		HashMap map = (HashMap)session.getAttribute("admin");
		Connection conn = new CommDAO().getConn();
		String username = map.get("uname").toString();
		String sql = "insert into lotlogs values(null,'"+username+"','"+doinfo+"','"+Info.getDateStr()+"')";
	    try {
			Statement st = conn.createStatement();
			st.execute(sql);
			st.close();
			conn.close();
		} catch (SQLException e) {
			try {
				conn.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
	    
	}
	

}
