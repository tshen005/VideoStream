<%@ page language="java" import="java.util.*,java.sql.*,java.io.*,java.net.*" contentType="text/html;charset=utf-8"%>
<%
	String user1 = (String)session.getAttribute("username");
	if(session.getAttribute("username")==null || session.getAttribute("username")=="") {
		out.println("0");
		return;
	}

	String query_str = request.getParameter("query");
	String sort=request.getParameter("sort");

	response.setContentType("text/xml;charset=UTF-8");
	String xmlStr = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
	xmlStr = xmlStr+"<message>";

	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://8.35.199.80:3306/videostream";
	String user = "root";
	String passwd = "MNX9HJjW";


	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, passwd);
	Statement statement = conn.createStatement();
	String order_str="";


		if(sort.equals("date")){

			order_str=new String("order by str_to_date(Time,'%a %b %d %H:%i:%S PST %Y') desc");
		}
		else if(sort.equals("like")){
			order_str=new String("order by cast(Likes as unsigned) desc");
		}
		else if(sort.equals("view")){
			order_str=new String("order by cast(Views as unsigned) desc");
		}
	else{
		order_str=new String("");
	}

	String sql="select VideoID,Time,Likes,Views,Cover,VideoName from video where VideoName like '%" + query_str + "%' or Description like '%" + query_str + "%'"+order_str;
	ResultSet rs = statement.executeQuery(sql);

	while(rs.next()) {
		xmlStr = xmlStr + "<mmsg>";
		String vid = rs.getString("VideoID");
		//String gender = rs.getString("Gender");
		String time = rs.getString("Time");
		String likes = rs.getString("Likes");
		String views = rs.getString("Views");
		String cover = rs.getString("Cover");
		String videoname = rs.getString("VideoName");

		xmlStr = xmlStr+"<vid>"+vid+"</vid>";
		xmlStr = xmlStr+"<Time>"+time+"</Time>";
		xmlStr = xmlStr+"<Likes>"+likes+"</Likes>";
		xmlStr = xmlStr+"<Views>"+views+"</Views>";
		xmlStr = xmlStr+"<Cover>"+cover+"</Cover>";
		//xmlStr = xmlStr+"<gender>"+gender+"</gender>";
		xmlStr = xmlStr+"<videoname>"+videoname+"</videoname>";
		xmlStr = xmlStr + "</mmsg>";
	}
	xmlStr=xmlStr+"<sort>"+sort+"</sort>";
	xmlStr=xmlStr+"<sql>"+sql+"</sql>";
	xmlStr = xmlStr +"</message>";

	rs.close();
	conn.close();
	out.clear();
	out.println(xmlStr);
	//out.println(sort);
%>
