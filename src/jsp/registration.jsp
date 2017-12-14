<%@ page contentType="text/html; charset=UTF-8"%>
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

    <title>ΞΒΞΒ erΞβ€smus-Login</title>

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
	  <img src="images/logo.jpg" alt="ΞΒΞ’ΒΞΒΞ’Β erΞΒΞ²β‚¬Βsmus Logo" style="width:450px;height:170px;">
 <div class="jumbotron">
    <h2 class="well">Registration form</h2>
	<div class="col-lg-12 well">
	<div class="row">
				<form action="Insert.jsp" method="Post">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label style="color:black;">First Name</label>
								<input type="text" name="name" placeholder="Enter First Name Here.." class="form-control">
							</div>
							<div class="col-sm-6 form-group">
								<label style="color:black">Last Name</label>
								<input type="text" name="surname" placeholder="Enter Last Name Here.." class="form-control">
							</div>
						</div>				
						<div class="row">	
							<div class="col-sm-6 form-group">
								<label style="color:black">Department</label>
								<input type="text" name="dep" placeholder="Enter Your Department Here.." class="form-control">
							</div>		
	
												
					<div class="col-sm-6 form-group">
						<label style="color:black">Phone Number</label>
						<input type="text" name="phone" placeholder="Enter Phone Number Here.." class="form-control">
					</div>	
				       </div>	
					<div class ="row">
					<div class="col-sm-6 form-group">
						<label style="color:black">Registration Number (AM)</label>
						<input type="text" name="am" placeholder="Enter Phone Number Here.." class="form-control">
					</div>		
					<div class="col-sm-6 form-group">
						<label style="color:black">Email Address</label>
						<input type="text" name="email"  placeholder="Enter Email Address Here.." class="form-control">
					</div>	
					</div>
					<div class="row">
							<div class="col-sm-6 form-group">
								<label style="color:black">Password</label>
								<input type="password" name="password" placeholder="Enter Your Password Here.." class="form-control">
							</div>		
							<div class="col-sm-6 form-group">
								<label style="color:black">Confirm Password</label>
								<input type="password" name="cpassword" placeholder="Enter Again Your Password Here..." class="form-control">
							</div>	
						</div>	
					<div class="form-group">
						<label style="float:left;color:black">Photo</label><br>
							<input type="file" name="pic" style="margin-right:5px;float:left;" accept="image/*">
					</div><br>
					<input type="submit" class="btn btn-lg btn-info"style="background-color:#337AB7;border-radius:10px;"value="Submit">					
					</div>
				</form> 
				</div>
	</div>
	</div>
	</div>
	
<br>
      
	<div class="container">
			
		<footer class="footer">
	  
        <p>&copy; OΠerΑsmus 2015</p>
      </footer>

    </div> 
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
