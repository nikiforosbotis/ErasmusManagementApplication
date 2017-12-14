<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page errorPage="error.jsp" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Login</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap4.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/Login.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">
      <div class="header clearfix">
	  <img src="images/logo.jpg" alt="οΏ½οΏ½erοΏ½smus Logo" style="width:450px;height:170px;">
        
            <div class="container">
			 <form class='form-inline' action='Controller.jsp' method='post'>
	<nav>
          <ul class="nav nav-pills pull-right">
 
    <div class="form-group">
	<form action="Controller.jsp" method="Post">
      <label for="username">Username:</label>
      <input type="text" name= "username" class="form-control" id="username" placeholder="Enter username">
    </div>
    <div class="form-group">
      <label for="password">Password:</label>
      <input type="password" name= "password" class="form-control" id="password" placeholder="Enter password">
    </div>
    
    <input type="submit" class="btn btn-success"  value="Submit">
	<div class="checkbox">
      <label><input type="checkbox"> Remember me</label>
    </div>
  </ul>
        </nav>
  </form>
</div>
</div>
<br>
<div class="jumbotron">
    <h2 class="well">Registration</h2>
<form action="registration.jsp">
    <input align : "center" type="submit" class="btn btn-lg btn-info" value="Register Now">
</form>
</div>
      <div class="container">
			
		<footer class="footer">
	  
        <p>&copy; ��er�smus 2016</p>
      </footer>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
