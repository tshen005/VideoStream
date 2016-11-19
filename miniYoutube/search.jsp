<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>



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

			<div class="btn-group">
				 <button class="btn btn-default">Action</button> 
				 <button data-toggle="dropdown" class="btn btn-default dropdown-toggle"><span class="caret"></span></button>
					<ul class="dropdown-menu">
						<li>
							 <a href="#">操作</a>
						</li>
						<li class="disabled">
							 <a href="#">另一操作</a>
						</li>
						<li class="divider">
						</li>
						<li>
							 <a href="#">其它</a>
						</li>
					</ul>
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