<%@ page language="java" import="java.util.*,java.sql.*,java.io.*,java.net.*" contentType="text/html;charset=utf-8"%>

<%

	String vid = request.getParameter("vid");
	String description = request.getParameter("description");
	String user1 = (String)session.getAttribute("username");
	if(user1 == null) {
		out.println("Please sign in first");
		return;
	}
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	java.util.Date currentTime = new java.util.Date();
	String str_date1 = formatter.format(currentTime); 
	String str_date2 = currentTime.toString();  


	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://8.35.199.80:3306/videostream";
	String user = "root";
	String passwd = "MNX9HJjW";
		
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, passwd);
	Statement statement = conn.createStatement();


	String sql1 = "insert into report(ReportUser,VideoID,Description,Time) values('"+user1+"',"+vid+",'"+description+"','"+str_date2+"')"; 

	statement.execute(sql1);

	conn.close();
	out.println("1");
%>