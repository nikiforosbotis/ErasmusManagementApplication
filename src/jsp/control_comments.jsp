<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="operasmus.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page errorPage="error.jsp" %>

<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=Windows-1253">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="description" content="">
		<meta name="author" content="">
		<link rel="icon" href="../../favicon.ico">

		<title>ΟΠerΑsmus-Διχείριση Σχολίων</title>

		<!-- Bootstrap core CSS -->
		<link href="css/bootstrap3.min.css" rel="stylesheet">

		<!-- Custom styles for this template -->
		<link href="css/Un_Profile.css" rel="stylesheet">

		<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
		<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
		<script src="../../assets/js/ie-emulation-modes-warning.js"></script>
	
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
	
	</head>
	<body>
	
		<% request.setCharacterEncoding("ISO-8859-7"); 
			String username = (String)session.getAttribute("username");
			if(username == null){
				%>
				<jsp:forward page="LoginOperasmus.jsp"/>
				<%
			}
			%> 
		
	  <%  Utility ut2 = new Utility();
			ut2.open();
			
			boolean state;
			String state1 = request.getParameter("state");
			
			
			String per = request.getParameter("periexomeno");
			if(state1 != null){
				if (state1.equals("yes")){
					state = true;
				} else {
					state = false;
				}
				ut2.conCom(state, per);
				
			}
			
			
			List<Sxolia> sxolia = ut2.getAllSxolia("0");
	  %>
	   <div class="container">
      <div class="header clearfix"style="width:100%">
        <div class="dev">
		<img src="images/logo.jpg" alt="ΟΠerΑsmus Logo" style="width:500px;height:150px;float:left;"></div>
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" ><a href="Profile_upefthinou.jsp">Home</a></li>
            <li role="presentation" class="active"><a href="#"><%=username%></a></li>
          </ul>
        </nav>
        
      </div>
	  
		<div id="content">
		
		
		
		
      <div class="col-md-3">
      <ul class="nav nav-pills nav-stacked">
       
                <li class="dropdown">
		<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">Αιτήσεις<span class="caret"></span></a>
			<ul class="dropdown-menu">
				<li><a href="nees.jsp">Νέες</a></li>
				<li><a href="olokliromenes.jsp">Ολοκληρωμένες</a></li>                       
			</ul>
		</li>
	  </li>
        <li><a href="anakinosis.jsp">Ανακοινώσεις</a></li>
		<li class="active"><a href="control_comments.jsp">Διαχείριση Σχολίων</a></li>
		<br>
		<br>
		<br>
        
      </ul>
    </div>
    <div class="clearfix visible-lg"></div>
  </div>
		
	  
	  <div class="titleBox">
		<label>Σχόλια</label>
		</div>
	    <div class="actionBox">
        <ul class="commentList">
		
		<% for (int i=0; i<sxolia.size(); i++){
						String name = ut2.fetchName(sxolia.get(i).getId());%>
            <li>
                
                <div class="commentText">
					<p class="">refers to: <%=name%></p>
                    <p class=""><%=sxolia.get(i).getPeriexomeno()%></p> <span class="date sub-text">on March 5th, 2014</span>

                </div>
            </li>
			 <div id='form'>
		<div class="row">
			<div class="col-md-12">

			<form action="control_comments.jsp" method="POST" id="commentform">

				<input type="hidden" name="state" value="yes"/>
				<input type="hidden" name="periexomeno" value="<%=sxolia.get(i).getPeriexomeno()%>"/>
				<input type="submit" value="Accept Comment">
				
				
			</form>
			<form action="control_comments.jsp" method="POST" id="commentform">

				<input type="hidden" name="state" value="no"/>
				<input type="hidden" name="periexomeno" value="<%=sxolia.get(i).getPeriexomeno()%>"/>
				<input type="submit" value="Reject Comment">
				
				
			</form>
			
			</div>
		</div>
	</div>
		<%}%>
	 </div>
	 
	
	  