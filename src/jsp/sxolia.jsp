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
	<body>
		<% request.setCharacterEncoding("ISO-8859-7"); %>  
		
	  <%  Utility ut2 = new Utility();
			ut2.open();
			;
			
			String id = request.getParameter("id2");
			
			
			session.setAttribute("id", id);
			
			
			List<Sxolia> sxolia = ut2.getAllSxolia(id);
	  %>
	
	  <div class="titleBox">
		<label>Σχόλια</label>
		</div>
	    <div class="actionBox">
        <ul class="commentList">
		
		<% for (int i=0; i<sxolia.size(); i++){ %>
            <li>
                <div class="commentText">
                    <p class=""><%=sxolia.get(i).getNewname()%></p> <span class="date sub-text">on March 5th, 2014</span>

                </div>
                <div class="commentText">
                    <p class=""><%=sxolia.get(i).getPeriexomeno()%></p> <span class="date sub-text">on March 5th, 2014</span>

                </div>
            </li>
		<%}%>
	  <h5 style="font-size: 18px;border-bottom: 2px solid #e5e5e5;">Add a comment</h5>
	  <div id='form'>
		<div class="row">
			<div class="col-md-12">

			<form action="form_ans.jsp" method="POST" id="commentform">

				<div id="comment-name" class="form-row">
					<input type = "text" placeholder = "Name (required)" name = "dname"  id = "name" >
				</div>
				<br>
				<div id="comment-email" class="form-row">
					<input type = "text" placeholder = "Mail (will not be published) (required)" name = "demail"  id = "email">
				</div>
				<br>
				<div id="comment-message" class="form-row">
				<textarea name = "comment" placeholder = "Message" id = "comment" ></textarea>
				</div>
				<br>
				<a href="#"><input type="submit" name="dsubmit" id="commentSubmit" value="Submit Comment"></a>
				
				
			</form>
			</div>
		</div>
	</div>
	  