<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="error.jsp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>ΟΠerΑsmus-Προφίλ</title>

    <!-- Bootstrap core CSS -->



    <!-- Custom styles for this template -->
    <link href="css/Profile.css" rel="stylesheet">
	<link href="css/bootstrap1.min.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
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
            <li role="presentation" ><a href="Profile_upefthinou.jsp">Home</a></li>
            <li role="presentation" class="active"><a href="#"><%=username%></a></li>
			<li role="presentation" ><a href="Logoffoperasmus.jsp">Log off</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">ΟΠerΑsmus</h3>
      </div>
	  

		
		
		
		
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
		<li><a href="control_comments.jsp">Διαχείριση Σχολίων</a></li>
		<br>
		
        
      </ul>
	   
    </div>
	<div class="dev">
		<img src="images/logo.jpg" alt="ΟΠerΑsmus Logo" style="width:500px;height:150px;float:left;"></div>
		<br>
		 
		 
	
	</div>
	
	
	
    
  </div>
  <br>
  <h1 class="text-muted" align="center">Καλώς Ήρθατε!</h1>
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
		 
	  <footer class="footer">
        <p>&copy; ΟΠerΑsmus 2015</p>
      </footer>
	
 </div>


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
	
