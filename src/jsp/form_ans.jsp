<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="operasmus.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-1253">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="../../favicon.ico">

		<title>ΟΠerΑsmus-Προφίλ Πανεπιστημίου</title>

		<!-- Bootstrap core CSS -->
		<link href="css/bootstrap3.min.css" rel="stylesheet">

		<!-- Custom styles for this template -->
		<link href="css/Un_Profile.css" rel="stylesheet">

		<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
		<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
		<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
	
		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	
	</head>
		<% request.setCharacterEncoding("ISO-8859-7"); %>  
		<%
			Utility ut2 = new Utility();
			ut2.open();
			String name2;
			String email;
			String sxolio;
			String id = (String)session.getAttribute("id");
			String name = "t8130090";
			String link = "Un_Profile.jsp";
			if(request.getParameter("dname")!= null){
				name2 = request.getParameter("dname");
				email = request.getParameter("demail");
				sxolio = request.getParameter("comment");
				ut2.setSxolio(sxolio, name, "t80000001", id, name2); 
				
			}
			%>
			
		<div class="container">
			<div class="container">
      <div class="header clearfix">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active"><a href="the_home_page.jsp">Home</a></li>
            <li role="presentation"><a href="the_Profile.jsp" data-toggle= "dropdown" class="dropdown-toggle"><span class="glyphicon glyphicon-user"></span><span class="caret"></span></a></li>
          <ul class="dropdown-menu">
			      <li><a href="Logoff.jsp">ٮ९򼯡></li>
			  </ul>
</ul>
        </nav>
		<img src="images/logo.jpg" alt="ΟΠerΑsmus Logo" style="width:500px;height:150px;">
      </div>
		
	  <div class="titleBox">
		<label>Your comment will be published after it will be checked</label>
		
	  </div>
	  
	  
	
	</div>
	<form action="<%=link%>">
		<input type="hidden" name="id" value="<%=id%>"/>
		<input type="submit" value="Go back to University profile">
	</form>
	