<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%
	String username = request.getParameter("user");
	String password = request.getParameter("passwd");
	String email = request.getParameter("email");
	String admin = "0";
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://8.35.199.80:3306/videostream";
	String user = "root";
	String passwd = "MNX9HJjW";
		
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, passwd);
	Statement statement = conn.createStatement();
	String sql = "select * from user where Name = '" + username + "'";
	ResultSet rs = statement.executeQuery(sql);
//	String sql1 = "select * from user where EmailAdd = '" + email + "'";
//	ResultSet rs1 = statement.executeQuery(sql1);
	if(rs.next()) {
		out.println("0");
		return;
	}
	
	else {
		String fmt = "insert into user(Name,EmailAdd, Password, Admin) values('%s','%s','%s','%s')";
		sql = "";
		sql = String.format(fmt,username,email, password, admin);
		int cnt = statement.executeUpdate(sql);
		session.setAttribute("username", username);
		out.println("1");
	}
%>