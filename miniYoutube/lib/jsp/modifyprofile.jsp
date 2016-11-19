<%@ page language="java" import="java.util.*,java.sql.*,java.io.*,java.net.*" contentType="text/html;charset=utf-8"%>

<%

	//String username = request.getParameter("username");
	String a = request.getParameter("a");
	String t = request.getParameter("t");
	String s = request.getParameter("s");
	String intro = request.getParameter("intro");
	
	//username.replace(" ","");
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://8.35.199.80:3306/videostream";
	String user = "root";
	String passwd = "MNX9HJjW";

	String user1 = (String)session.getAttribute("username");
	if(user1 == null) {
		out.println("0");
		return;
	}
	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, passwd);
	Statement statement = conn.createStatement();
	
	String ssql = "UPDATE userprofile SET Telephone='"+t+"',Address='"+a+"',State='"+s+"',introduction='"+intro+"' WHERE Name='"+user1+"'";
	statement.executeUpdate(ssql);
	
	out.println("1");
%>