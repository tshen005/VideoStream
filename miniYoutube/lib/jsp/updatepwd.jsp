<%@ page language="java" import="java.util.*,java.sql.*,java.io.*,java.net.*" contentType="text/html;charset=utf-8"%>

<%

	//String username = request.getParameter("username");
	String opwd = request.getParameter("opwd");
	String npwd = request.getParameter("passwd");
	//username.replace(" ","");
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://8.35.199.80:3306/videostream";
	String user = "root";
	String passwd = "MNX9HJjW";

	String username="";
	String user1 = (String)session.getAttribute("username");
	if(user1.equals("")) {
		out.println("0");
		return;
	}
	username = user1.toString();
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, passwd);
	Statement statement = conn.createStatement();
	
	String sql = "select Password from user where Name = '" + username + "'";
	ResultSet rs = statement.executeQuery(sql);
	String passwd1 = "";
	while(rs.next()) {
		passwd1 = rs.getString("Password");
	}
	if(!passwd1.equals(opwd)) {
		out.println("0");
		return;
	}
	String ssql = "UPDATE user SET Password='"+npwd+"' WHERE Name='"+username+"'";
	statement.executeUpdate(ssql);
	
	out.println("1");
%>