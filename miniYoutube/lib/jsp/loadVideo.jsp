<%@ page language="java" import="java.util.*,java.sql.*,java.io.*,java.net.*" contentType="text/html;charset=utf-8"%>

<%

	String vid = request.getParameter("vid");
	response.setContentType("text/xml;charset=UTF-8"); 
	String xmlStr = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://8.35.199.80:3306/videostream";
	String user = "root";
	String passwd = "MNX9HJjW";
		
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, passwd);
	Statement statement = conn.createStatement();
	String sql = "select * from video where VideoID = '" + vid + "'";
	ResultSet rs = statement.executeQuery(sql);

	xmlStr = xmlStr+"<message>";
	//out.println(a);
	while(rs.next()) {
		xmlStr = xmlStr + "<mmsg>";
		String urlV = rs.getString("Url");
		String videoName = rs.getString("VideoName");
		String uploader = rs.getString("Uploader");
		//String time = rs.getString("Time");
		String urlC = rs.getString("Cover");
		String description = rs.getString("Description");
		String like = rs.getString("Likes");
		String dislike = rs.getString("Dislikes");
		
		xmlStr = xmlStr+"<urlV>"+urlV+"</urlV>";
		xmlStr = xmlStr+"<videoName>"+videoName+"</videoName>";
		xmlStr = xmlStr+"<uploaderr>"+uploader+"</uploaderr>";
		//xmlStr = xmlStr+"<time>"+time+"</time>";
		xmlStr = xmlStr+"<description>"+description+"</description>";
		xmlStr = xmlStr+"<like>"+like+"</like>";
		xmlStr = xmlStr+"<dislike>"+dislike+"</dislike>";

		xmlStr = xmlStr +"</mmsg>";
	}
	xmlStr = xmlStr +"</message>";
	
	out.clear();
	out.println(xmlStr);
%>