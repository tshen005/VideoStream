<%@ page language="java" import="java.util.*,java.sql.*,java.io.*,java.net.*" contentType="text/html;charset=utf-8"%>

<%
	if(session.getAttribute("username")==null || session.getAttribute("username")=="") {
		out.println("0");
		return;
	}
	String user1 = (String)session.getAttribute("username");
	String vid = request.getParameter("vid");
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://8.35.199.80:3306/videostream";
	String user = "root";
	String passwd = "MNX9HJjW";
		
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, passwd);
	Statement statement = conn.createStatement();

	String sql = "select * from favorites where vid = '" + vid + "' and Name='"+user1+"'";
	ResultSet rs = statement.executeQuery(sql);

	while(rs.next()) {
		out.println("1");
		return;
	}
	
	rs.close();
	conn.close();
	out.println("0");
%>