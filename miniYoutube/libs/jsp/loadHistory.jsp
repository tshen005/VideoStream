<%@ page language="java" import="java.util.*,java.sql.*,java.io.*,java.net.*" contentType="text/html;charset=utf-8"%>

<%

	//String vid = request.getParameter("vid");

	//String user1 = (String)session.getAttribute("username");
	if(session.getAttribute("username")==null || session.getAttribute("username")=="") {
		out.println("0");
		return;
	}
	String user = (String)session.getAttribute("username");

	response.setContentType("text/xml;charset=UTF-8"); 
	String xmlStr = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
	
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://8.35.199.80:3306/videostream";
	String user1 = "root";
	String passwd = "MNX9HJjW";
		
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, user1, passwd);
	Statement statement = conn.createStatement();

	String sql = "select * from video where Uploader = '" + user + "' order by VideoID desc";
	String sql2 = "select * from favorites,video where favorites.Name='"+user+ "'and favorites.vid = video.VideoID order by VideoID desc";
	ResultSet rs = statement.executeQuery(sql);
	
	xmlStr = xmlStr+"<message>";
	while(rs.next()) {
		xmlStr = xmlStr + "<mmsgup>";
		String vid = rs.getString("VideoID").toString();
		String urlV = rs.getString("Url");
		String videoName = rs.getString("VideoName");
		//String uploader = rs.getString("Uploader");
		String time = rs.getString("Time");
		String urlC = rs.getString("Cover");
		xmlStr = xmlStr+"<videoID>"+vid+"</videoID>";
		xmlStr = xmlStr+"<urlV>"+urlV+"</urlV>";
		xmlStr = xmlStr+"<videoName>"+videoName+"</videoName>";
		xmlStr = xmlStr+"<urlC>"+urlC+"</urlC>";
		//xmlStr = xmlStr+"<uploaderr>"+uploader+"</uploaderr>";
		xmlStr = xmlStr+"<time>"+time+"</time>";
		xmlStr = xmlStr +"</mmsgup>";
	}
	//xmlStr = xmlStr +"</message>";
	
	rs = statement.executeQuery(sql2);
	while(rs.next()) {
		xmlStr = xmlStr + "<mmsgf>";
		String vid = rs.getString("VideoID").toString();
		String urlV = rs.getString("Url");
		String videoName = rs.getString("VideoName");
		//String uploader = rs.getString("Uploader");
		String time = rs.getString("Time");
		String urlC = rs.getString("Cover");

		xmlStr = xmlStr+"<videoIDf>"+vid+"</videoIDf>";
		xmlStr = xmlStr+"<urlVf>"+urlV+"</urlVf>";
		xmlStr = xmlStr+"<videoNamef>"+videoName+"</videoNamef>";
		xmlStr = xmlStr+"<urlCf>"+urlC+"</urlCf>";
		//xmlStr = xmlStr+"<uploaderr>"+uploader+"</uploaderr>";
		xmlStr = xmlStr+"<timef>"+time+"</timef>";
		xmlStr = xmlStr +"</mmsgf>";
	}
	xmlStr = xmlStr +"</message>";

	rs.close();
	conn.close();
	out.clear();
	out.println(xmlStr);
%>