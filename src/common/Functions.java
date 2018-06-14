package common;

public class Functions {
	
	public static String[][] funcs = 
	{
			{"0","商场后台系统功能","",""},
			
			//一级菜单
			{"01","商场管理","",""},
			{"02","系统管理","",""},
			{"03","个人信息","",""},
			{"04","会员管理","",""},
			{"05","商品管理","",""},
			{"06","统计报表","",""},
			
			
			//二级菜单
			{"0101","地图管理","",""},
			{"0102","设备管理","",""},
			{"0201","人员管理","",""},
			{"0202","信息管理","",""},
			{"0203","客户端版本管理","",""},
			{"0301","个人信息","",""},
			{"0401","卖方会员管理","",""},
			{"0402","买方会员管理","",""},
			{"0501","商品属性配置","",""},
			{"0502","商品管理","",""},
			{"0601","统计报表","",""},
			
			
			//功能(三级菜单)
			{"010101","地图编辑","/marnav/pages/mapedit.jsp",""},
			{"010102","功能b","http://www.baidu.com",""},
			{"010201","设备管理","/marnav/pages/sebeis.jsp",""},
			{"010202","添加设备","/marnav/pages/addsebeis.jsp",""},
			
			
			{"020101","添加管理员","/marnav/pages/addsysusers.jsp",""},
			{"020102","管理员信息维护","/marnav/pages/sysusers.jsp",""},
			{"020103","系统角色管理","/marnav/pages/uroles.jsp",""},
			{"020201","信息维护","/marnav/pages/notices.jsp",""},
			{"020202","信息类型","/marnav/pages/noticetypes.jsp",""},
			
			{"020301","版本发布","/marnav/pages/addapp.jsp",""},
			{"020302","版本维护","/marnav/pages/applist.jsp",""},
			
			
			{"030101","修改个人信息","/marnav/pages/pupdatesysusers.jsp","商场管理员"},
			{"030102","修改登录密码","/marnav/pages/updatepwd.jsp","商场管理员"},
			{"030103","修改商铺信息","/marnav/pages/pupdateshops.jsp","商铺管理员"},
			{"030104","修改登录密码","/marnav/pages/updatepwdforshop.jsp","商铺管理员"},
			
			
			{"040101","添加商铺","/marnav/pages/addshops.jsp",""},
			{"040102","商铺信息维护","/marnav/pages/shops.jsp",""},
			{"040201","添加买家会员","/marnav/pages/addbuyer.jsp",""},
			{"040202","买家会员信息维护","/marnav/pages/buyers.jsp",""},
			
			{"050101","商品类别维护","/marnav/pages/goodstype.jsp",""},
			{"050102","商品品牌维护","/marnav/pages/goodsbrand.jsp",""},
			
			
			{"050201","添加商品","/marnav/pages/addgoodsforadmin.jsp","管理员用的,范围最大"},
			{"050202","商品信息维护","/marnav/pages/goodsforadmin.jsp","管理员用的,范围最大"},
			{"050203","添加商品","/marnav/pages/addgoodsforshop.jsp","商铺用的,范围仅限本商铺"},
			{"050204","商品信息维护","/marnav/pages/goodsforshop.jsp","商铺用的,范围仅限本商铺"},
			
			{"060101","会员信息报表","/marnav/pages/buyersrep.jsp",""},
	};
	

	public static void main(String[] args) {
	}
}
