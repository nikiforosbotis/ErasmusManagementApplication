<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="error.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>

<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-1253">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="../../favicon.ico">

		<title>Logoff</title>

		<!-- Bootstrap core CSS -->
		<link href='css/bootstrap.min.css' rel='stylesheet'>

		<!-- Custom styles for this template -->
		<link href='css/bootstrap-theme.min.css' rel='stylesheet'>
		<link href='css/theme.css' rel='stylesheet'>
		<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
		<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
		<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		
	
	</head>
	<body>
	<%
	session.removeAttribute("username");
	session.invalidate();
	%>
	 <div class="container" style="height:100%;margin-bottom:0px;">
      <div class="header clearfix"style="width:100%;">
		<img src="images/logo.jpg" alt="ΟΠerΑsmus Logo" style="width:500px;height:150px;margin-left:22.5%;margin-right:22.5%"></div>
		   
		  
		    <div class='page-header' style="height:20%">
		        <h1 class='text-danger' style="margin-left:25%;margin-right:25%;text-align:center">Έξοδος</h1>
				</div>
				<div class="alert alert-info" role="alert" style="margin-top:8%;text-align:center">
				Η έξοδος σας πραγματοποιήθηκε με επιτυχία.
      			</div>
				
				</div>
				
			<div class="container">
			<footer class="footer" style="padding-top:20px">
	  <hr>
        <p>&copy; ΟΠerΑsmus 2016</p>
      </footer> 

    </div>
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
	</body>
</html>
	
	