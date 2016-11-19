<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%   request.setCharacterEncoding("UTF-8");  
   response.setCharacterEncoding("UTF-8");  
   response.setContentType("text/html; charset=utf-8"); %>
<html>
<head>
<title>文件传输例子</title>
</head>
<body>
<%
String user1 = (String)session.getAttribute("username");

String [] array = new String[5];

java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
java.util.Date currentTime = new java.util.Date();
String str_date1 = formatter.format(currentTime); 
String str_date2 = currentTime.toString();  

boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if(isMultipart){
FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);	
	List items = upload.parseRequest(request);

	for(int i=0;i<items.size();i++){

	    FileItem fi = (FileItem)items.get(i);
	    if(fi.isFormField()){
            array[i] = fi.getString("utf-8"); 
        }
        else{
	       DiskFileItem dfi = (DiskFileItem)fi;
	       if(!dfi.getName().trim().equals("") && i==3){
                array[i] =  new File("./video"+System.getProperty("file.separator")+FilenameUtils.getName(dfi.getName())).getPath();
                
                dfi.write(new File(application.getRealPath("video") + System.getProperty("file.separator") + FilenameUtils.getName(dfi.getName())));
            }
            if(!dfi.getName().trim().equals("") && i==4){
                array[i] =  new File("./images/covers"+System.getProperty("file.separator")+FilenameUtils.getName(dfi.getName())).getPath();
                
                dfi.write(new File(application.getRealPath("images/covers") + System.getProperty("file.separator") + FilenameUtils.getName(dfi.getName())));
            }
       } 	
   }
}  

String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://8.35.199.80:3306/videostream";
String user = "root";
String passwd = "MNX9HJjW";
    
Class.forName(driver);
Connection conn = DriverManager.getConnection(url, user, passwd);
Statement statement = conn.createStatement();
int a = 0;
   
String fmt = "insert into video(Url,VideoName, Uploader, Time,Cover,Description,Tag,Likes,Dislikes,Views) values('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')";

String sql1 = "";

sql1 = String.format(fmt,array[3],array[0],user1,str_date2, array[4], array[2],array[1],"0","0","0");


statement.execute(sql1);
out.print("success");
response.setHeader("Refresh","1;url=/miniYoutube/userpage.html");


%>
</body>
</html>
