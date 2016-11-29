<%@ page language="java" import="java.util.*,java.sql.*,java.io.*,java.net.*" contentType="text/html;charset=utf-8"%>

<%

	String vid = request.getParameter("vid");
	
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://8.35.199.80:3306/videostream";
	String user = "root";
	String passwd = "MNX9HJjW";
		
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, passwd);
	Statement statement = conn.createStatement();

	String sql = "select * from video where VideoID = '" + vid + "'";
	ResultSet rs = statement.executeQuery(sql);
	int num=0;
	String viewss="";

	while(rs.next()) {
		String like = rs.getString("Likes");
		
		if(like!=null && like.length()>0){
 			num=Integer.parseInt(like);
		}
		num+=1;
		viewss = num+"";
		
	}
	
	String ssql = "UPDATE video SET Likes="+viewss+" WHERE VideoID='"+vid+"'";
	statement.executeUpdate(ssql);
	rs.close();
	conn.close();
	out.println(viewss);
%>