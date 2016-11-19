<%@ page language="java" import="java.util.*,java.sql.*,java.io.*,java.net.*" contentType="text/html;charset=utf-8"%>
<%
	String user1 = (String)session.getAttribute("username");
	if(user1==null) {
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
	
	String sql = "select * from userprofile where Name = '" + user1 + "'";
	ResultSet rs = statement.executeQuery(sql);
	
	while(rs.next()) {
		xmlStr = xmlStr + "<mmsg>";
		String phone = rs.getString("Telephone");
		//String gender = rs.getString("Gender");
		String addr = rs.getString("Address");
		String state = rs.getString("State");
		String intro = rs.getString("introduction");
		xmlStr = xmlStr+"<phone>"+phone+"</phone>";
		//xmlStr = xmlStr+"<gender>"+gender+"</gender>";
		xmlStr = xmlStr+"<addr>"+addr+"</addr>";
		xmlStr = xmlStr+"<state>"+state+"</state>";
		xmlStr = xmlStr+"<intro>"+intro+"</intro>";
		xmlStr = xmlStr + "</mmsg>";
	}
	xmlStr = xmlStr +"</message>";
	
	rs.close();
	conn.close();
	out.clear();
	out.println(xmlStr);
%>
























