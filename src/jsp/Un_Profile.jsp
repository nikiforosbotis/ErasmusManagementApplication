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
		<% request.setCharacterEncoding("ISO-8859-7"); 
			String username = (String)session.getAttribute("username");
			if(username == null){
				%>
			<jsp:forward page="LoginOperasmus.jsp"/> 
				<%
			}
			%>  
		 <div class="container">
			<div class="header clearfix">
				<nav>
					<ul class="nav nav-pills pull-right">
						<li role="presentation" ><a href="the_home_page.jsp">Home</a></li>
						<li role="presentation" ><a href="the_Profile.jsp"><%=username%></a></li>
					</ul>
				</nav>
				<h3 class="text-muted">ΟΠerΑsmus</h3>
			</div>
		<div id="content">
      <div class="jumbotron">
		<%  Utility ut = new Utility();
			String id = request.getParameter("id");
			if(id == null){
				id = (String)session.getAttribute("id2");
			}
			
			ut.open();
			Panepistimio pan = ut.fetchPanepistimio(id);
			 %>
			
		<%! 
			
			private String onoma ;
			private double poso ;
			private String glwssa ;
			private String apaitoumeno_epipedo ;
			private int arithmos_thesewn ;
			private String xwra ;
			private String epipleon_parathrhseis ;
			private String email ;
			private String link ;
			private String mathimata ;
			
			%>
		<%  if(pan!=null){
			onoma = pan.getOnoma();
			poso = pan.getPoso();
			glwssa = pan.getGlwssa();
			apaitoumeno_epipedo = pan.getApaitoumeno_epipedo();
			arithmos_thesewn = pan.getArithmos_thesewn();
			xwra = pan.getXwra();
			epipleon_parathrhseis = pan.getEpipleon_parathrhseis();
			email = pan.getEmail();
			link = pan.getLink();
			mathimata = pan.getMathimata();
			} else {
				onoma = "UCL";
			}
			
			%>
		<h1><%= onoma%></h1>
		<br>
		<br>
		<div class="onoffswitch" style="float:center">
			<input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch" checked>
			<label class="onoffswitch-label" for="myonoffswitch">
				<span class="onoffswitch-inner"></span>
				<span class="onoffswitch-switch"></span>
			</label>
		</div>
	  </div>
	  <div class="row marketing">
        <div class="col-lg-6">
          <h4> Χώρα</h4>
          <p><%=xwra %></p>

          <h4>Ποσό μηνιαίας επιχορήγηση(€/μήνα)</h4>
          <p><%=poso%>€</p>

          <h4>Γλώσσα</h4>
          <p><%=glwssa %></p>
		  <h4>Απαιτούμενο Επίπεδο</h4>
		  <p><%=apaitoumeno_epipedo %></p>
        </div>

        <div class="col-lg-6">
          <h4>Αριθμός Θέσεων</h4>
          <p><%=arithmos_thesewn %> φοιτητές</p>
		  <h4>Μαθήματα</h4>
		  <p> <a href="<%=mathimata%>">Προβολή διαθέσιμων μαθημάτων </a></p>

          <h4>Επίσημη Ιστοσελίδα</h4>
          <p><a href="<%=link%>"><%=link%></a></p>

          <h4>Επιπλέον Παρατηρήσεις</h4>
          <p> <%=epipleon_parathrhseis %></p>
        </div>
      </div>
	  
	  <jsp:include page="sxolia.jsp">
		<jsp:param name="id2" value= "<%=id%>" />
	  </jsp:include >
	  


     

    </div>
   </body>
 </html>