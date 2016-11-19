<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%
	String username = request.getParameter("user");
	String password = request.getParameter("passwd");
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://8.35.199.80:3306/videostream";
	String user = "root";
	String passwd = "MNX9HJjW";
		
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, passwd);
	Statement statement = conn.createStatement();
	String sql = "select * from user where Name = '" + username + "'";
	ResultSet rs = statement.executeQuery(sql);
		
	if(rs.next()) {
		if (rs.getString("Password").equals(password)) {
			if(rs.getString("Admin").equals("1")) {
				out.println("3");
			}
			else{
				session.setAttribute("username", username);
				//session.setMaxInactiveIntercal(7200);
				out.println("2");
			}
		}
		else {
			out.println("1");
		}
	}
	else {
		out.println("0");
	}
%>