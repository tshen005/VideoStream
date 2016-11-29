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
	String sql = "delete from report where ReportID = '"+vid+"'";
	
	statement.executeUpdate(sql);

	conn.close();
	
	out.print("success");
	response.setHeader("Refresh","1;url=/miniYoutube/admin.jsp");

%>

