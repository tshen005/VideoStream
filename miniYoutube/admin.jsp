<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%
request.setCharacterEncoding("utf-8");
String msg ="";

Integer pgno = 0;
Integer pgcnt = 10;
String param = request.getParameter("pgno");
if(param != null && !param.isEmpty()){
    pgno = Integer.parseInt(param);
}
param = request.getParameter("pgcnt");
if(param != null && !param.isEmpty()){
    pgcnt = Integer.parseInt(param);
}
int pgprev = (pgno>0)?pgno-1:0;
int pgnext = pgno+1;
String url = "jdbc:mysql://8.35.199.80:3306/videostream";

String user = "root";
String passwd = "MNX9HJjW";

StringBuilder table = new StringBuilder();

try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection(url, user, passwd);
    Statement stmt=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);

    String sql=String.format("select * from report limit %d,%d", pgno*pgcnt,pgcnt);
    ResultSet rs=stmt.executeQuery(sql);
    
    table.append("<table class=\"table table-bordered table-hover\"><h3>Admin Page</h3><thead><tr><th>Number</th><th>Title</th><th>Author</th><th>Description</th><th>Report time</th><th>Option</th></tr></thead><tbody>");

    while(rs.next()) {
  
        String id = rs.getString("ReportID");
        String user1 = rs.getString("ReportUser");
        String vid = rs.getInt("VideoID")+"";
        String description = rs.getString("Description");
        String time = rs.getString("Time");
     
        table.append(String.format( "<tr><td>%s</td><td><a href=\"./play.html?vid=%s\">%s</a></td><td>%s</td><td>%s</td><td>%s</td><td>%s  %s</td></tr>", id, vid,vid, user1, description, time,"<a href='./lib/jsp/dismiss.jsp?vid="+id+"'>dismiss</a>","<a href='./lib/jsp/delete.jsp?vid="+vid+"' style=\"float:right\">delete</a>"));
    }
    table.append("</tbody></table>");
    rs.close();
    stmt.close();
    con.close();
}
catch (Exception e){
    msg = e.getMessage();
}
%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"> 
  <title>test</title>

  <link rel="stylesheet" href="./lib/bootstrap/css/bootstrap.min.css">  
  <script src="./lib/jquery.js"></script>
  <script src="./lib/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="http://cdn.staticfile.org/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.staticfile.org/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://cdn.staticfile.org/jqueryui-touch-punch/0.2.2/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="http://cdn.staticfile.org/twitter-bootstrap/3.0.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="v3/jquery.htmlClean.js"></script>
<script type="text/javascript" src="v3/scripts.min.js"></script>
</head>
<body>

<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="index.html">MiniYouTube</a>
				</div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active">
							 <a href="index.html">Home</a>
						</li>
						<li>
							 <a href="#">History</a>
						</li>
					</ul>
					<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<input type="text" class="form-control" />
						</div> <button type="submit" class="btn btn-default">Submit</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						
						<li>
							 <a href="#" onclick="signouta()">Sign out</a>
						</li>
						
					</ul>
				</div>
			</nav>

			<%=table%>
    		<br><br>
			<div style="float:right">
		        <a href="admin.jsp?pgno=<%=pgprev%>&pgcnt=10">
		        prev page</a>    &nbsp;
		        <a href="admin.jsp?pgno=<%=pgnext%>&pgcnt=10">
		        next page</a>
		    </div>	
		</div>
	</div>
</div>
</body>

<footer>
<div class="container" style="color:gray">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-4 column">
					 <p>Some introduction of our project</p>
				</div>
				<div class="col-md-4 column">
					<ul class="list-unstyled">
						<strong>Technique we used</strong>
						<li>
							JavaScript
						</li>
						<li>
							HTML
						</li>
						<li>
							HTML5
						</li>
						<li>
							JQuery
						</li>
						<li>
							...
						</li>
						
					</ul>
				</div>
				<div class="col-md-4 column">
					<ul class="list-unstyled">
						<strong>Our group member</strong>
						<li>
							William Lee
						</li>
						<li>
							Tong Shen
						</li>
						<li>
							Michael Tran
						</li>
						<li>
							Ziyu Wang
						</li>
						<li>
							Ziang Zhao
						</li>
						<li>
							Yongqing Zhu
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</footer>
</html>