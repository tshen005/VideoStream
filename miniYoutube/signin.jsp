<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%
	String username = request.getParameter("user");
	String password = request.getParameter("passwd");
	
	if (username.equals("admin") && password.equals("123")) {
		out.println("3");
	}
	else {
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://8.35.199.80:3306/videostream";
		String user = "root";
		String passwd = "MNX9HJjW";
			
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, user, passwd);
		Statement statement = conn.createStatement();
		String sql = "select passwd from user where userName = '" + username + "'";
		ResultSet rs = statement.executeQuery(sql);
			
		if(rs.next()) {
			if (rs.getString("passwd").equals(password)) {
				session.setAttribute("username", username);
				out.println("2");
			}
			else {
				out.println("1");
			}
		}
		else {
			out.println("0");
		}
	}
%>