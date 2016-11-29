<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%
	String username = request.getParameter("user");
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://8.35.199.80:3306/videostream";
	String user = "root";
	String passwd = "MNX9HJjW";
		
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, passwd);
	Statement statement = conn.createStatement();
	String sql = "select * from user where Name = '" + username +"'";
	ResultSet rs = statement.executeQuery(sql);
	
	if(rs.next()) {
		out.println("0");
		return;
	}
	
	else {
		out.println("1");
	}
%>