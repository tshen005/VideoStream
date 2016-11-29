<%@ page language="java" import="java.util.*,java.sql.*,java.io.*,java.net.*" contentType="text/html;charset=utf-8"%>

<%
	String user1 = (String)session.getAttribute("username");
	if(session.getAttribute("username")==null || session.getAttribute("username")=="") {
		//String user2 = user1.toString();
		out.println("0");
		return;
	}
	

	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	java.util.Date currentTime = new java.util.Date();
	String str_date1 = formatter.format(currentTime); 
	String str_date2 = currentTime.toString();  

	String vid = request.getParameter("vid");
	String comment = request.getParameter("com");
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://8.35.199.80:3306/videostream";
	String user = "root";
	String passwd = "MNX9HJjW";

	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, passwd);
	Statement statement = conn.createStatement();
	
	String fmt = "insert into comments(Name, VideoID, Time, Contents) values('%s','%s','%s','%s')";

	String sql1 = "";

	sql1 = String.format(fmt,user1,vid,str_date2,comment);
	statement.execute(sql1);
	out.println("1");
%>