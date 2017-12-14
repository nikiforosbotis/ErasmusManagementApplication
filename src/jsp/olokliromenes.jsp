<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="operasmus.Panepistimio" %>
<%@ page import="operasmus.Agaphmena" %>
<%@ page import="operasmus.Foititis" %>
<%@ page import="operasmus.Utility" %>
<%@ page import="operasmus.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page errorPage="error.jsp" %>

<!DOCTYPE html>
<%!private String onoma = null;
private String epwnumo = null;
private String password = null;
private String name = null;
private String am = null;
private String un1 = null;
private String un2 = null;
private String un3 = null;
private String uni1 = null;
private String uni2 = null;
private String uni3 = null;
private String tmhma = null;
private String email = null;%>

<%Utility ut = new Utility();
Panepistimio panepistimio = new Panepistimio();
List<String> all = new ArrayList<String>();
Foititis foititis = new Foititis();
name = request.getParameter("name");
if(name == null) {
	throw new Exception("Δεν είναι δυνατή η περιήγησή σας σε αυτή τη σελίδα, χωρίς προηγουμένως να έχετε πραγματοποιήσει είσοδο. Παρακαλούμε πατήστε <a href='LoginOperasmus.jsp'>εδώ</a> για να πραγματοποιήσετε είσοδο.");
}
try{
	User r = ut.getStudentsData(name);
	onoma = r.getfname();
	epwnumo = r.getlname();
	am = r.getam();
	password = r.getpassword();
	tmhma = r.getdep();
	email = ut.getEmail(name);
	all = panepistimio.getAlls(name);
	un1 = all.get(0);
	un2 = all.get(1);
	un3 = all.get(2);
	uni1 = panepistimio.getNameFromId(un1);
		uni2 = panepistimio.getNameFromId(un2);
	uni3 = panepistimio.getNameFromId(un3);
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>ΟΠerΑsmus-Αίτηση Φοιτητή</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap1.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/Aitisi.css" rel="stylesheet">

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

    <div class="container">
      <div class="header clearfix">
	  <img src="images/logo.jpg" alt="ΟΠerΑsmus Logo" style="width:500px;height:150px;float:left;">
		<div class="dev1"><nav style="float:right;">
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active"><a href="nees.jsp">Back</a></li>
          </ul>
        </nav></div>
		</div>

		<h2 class="well" style="margin-bottom:0px;margin-top:0px;text-align:center">Αίτηση Φοιτητή: <%=am%></h2>


	<div class="col-lg-12 well">

				<form action="nees.jsp" method="Post">

						<div class="row">
							<div class="col-sm-6 form-group">
								<label style="color:black;">First Name</label>

								<input type="text" name="name" value="<%=onoma%>" class="form-control">

							</div>
							<div class="col-sm-6 form-group">
								<label style="color:black">Last Name</label>

								<input type="text" name="surname" value="<%=epwnumo%>" class="form-control">

							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label style="color:black">Department</label>

								<input type="text" name="dep" value="<%=tmhma%>" class="form-control">

							</div>
						<div class="col-sm-6 form-group">
						<label style="color:black">Registration Number (AM)</label>
								<input type="text" name="am" value="<%=am%>" class="form-control">
					</div>

				       </div>
					<div class ="row">

					<div class="col-sm-6 form-group">
						<label style="color:black">Email Address</label>
								<input type="text" name="email" value="<%=email%>" class="form-control">
					</div>
					</div>
					<div class="row">
							<div class="col-sm-6 form-group">
								<label style="color:black">	1st University</label>

								<input type="text" name="dep" value="<%=uni1%>" class="form-control">

							</div>
						<div class="col-sm-6 form-group">
						<label style="color:black">2nd University</label>
								<input type="text" name="am" value="<%=uni2%>" class="form-control">
					</div>

				       </div>
					   <div class="row">
							<div class="col-sm-6 form-group">
								<label style="color:black">	3d University</label>

								<input type="text" name="dep" value="<%=uni3%>" class="form-control">

							</div>


				       </div>
				</form>
				</div>
	</div>



	<%}finally{}%>
		<div class="container" style="margin-bottom:0px">
      <footer class="footer">
        <p>&copy; ΟΠerΑsmus 2016</p>
      </footer>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
