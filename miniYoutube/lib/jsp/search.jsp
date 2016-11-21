<%@ page language="java" import="java.util.*,java.sql.*,java.io.*,java.net.*" contentType="text/html;charset=utf-8"%>
<%
	String query = (String)session.getAttribute("search_query");
	if(query==null) {
		out.println("0");
		return;
	}

	response.setContentType("text/xml;charset=UTF-8"); 
	String xmlStr = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
	xmlStr = xmlStr+"<message>";
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://8.35.199.80:3306/videostream";
	String user = "root";
	String passwd = "MNX9HJjW";

	
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user, passwd);
	Statement statement = conn.createStatement();

	String sql = "select * from video where VideoName LIKE %query%"
	ResultSet rs = statement.executeQuery(sql);

	while(rs.next()) {

		//Load results and output them here...

	}

%>