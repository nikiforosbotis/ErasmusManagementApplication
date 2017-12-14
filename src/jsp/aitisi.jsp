<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="operasmus.Panepistimio" %>
<%@ page import="operasmus.Agaphmena" %>
<%@ page import="operasmus.Foititis" %>
<%@ page import="operasmus.Utility" %>
<%@ page import="operasmus.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page errorPage="error.jsp" %>
<%@ page import="java.sql.*" %>
<%!private String onoma = null;
private String epwnumo = null;
private String password = null;
private String username = null;
private String am = null;
private String uni1 = null;
private String uni2 = null;
private String uni3 = null;
private String department = null;
private int department_num ;
private String tmhma = null;
private String email = null;%>

<%Utility ut = new Utility();
Panepistimio panepistimio = new Panepistimio();
List<String> all = new ArrayList<String>();
Foititis foititis = new Foititis(); 
username = (String) session.getAttribute("username");
if(username == null) {
	throw new Exception("Δεν είναι δυνατή η περιήγησή σας σε αυτή τη σελίδα, χωρίς προηγουμένως να έχετε πραγματοποιήσει είσοδο. Παρακαλούμε πατήστε <a href='LoginOperasmus.jsp'>εδώ</a> για να πραγματοποιήσετε είσοδο.");
}
uni1 = request.getParameter("uni1");
uni2 = request.getParameter("uni2");
uni3 = request.getParameter("uni3");
try{
	User r = ut.getStudentsData(username);
	onoma = r.getfname();
	epwnumo = r.getlname();
	am = r.getam();
	password = r.getpassword();
	tmhma = r.getdep();
	email = ut.getEmail(username);

department = foititis.fetchDepartment(username);
department_num = foititis.fetchDepartmentNum(department);
all = panepistimio.getAll(department_num);
if((uni1 != null) && (uni2 != null) && (uni3 != null)){
	panepistimio.insertAit(username, onoma, epwnumo, tmhma, am, email, uni1, uni2, uni3);
}
	
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

    <title>ΟΠerΑsmus-Αίτηση Συμμετοχής</title>

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
            <li role="presentation" class="active"><a href="the_Profile.jsp">Back</a></li>
          </ul>
        </nav></div>
		</div>
		<div class="jumbotron" style="height:90%">
		<h2 class="well" style="margin-bottom:0px;margin-top:0px;">Η αίτησή σας</h2>
		
    
	<div class="col-lg-12 well">
	
				<form action="aitisi.jsp" method="Post">
					
						<div class="row">
							<div class="col-sm-6 form-group">
								<label style="color:black;">First Name</label>
								<%if(onoma == null){%>
								<input type="text" name="name" placeholder="Enter First Name Here.." class="form-control">
								<%} else{%>
								<input type="text" name="name" value="<%=onoma%>" class="form-control">
								<%}%>
							</div>
							<div class="col-sm-6 form-group">
								<label style="color:black">Last Name</label>
							<%if(epwnumo == null){%>
								<input type="text" name="surname" placeholder="Enter Last Name Here.." class="form-control">
								<%} else{%>
								<input type="text" name="surname" value="<%=epwnumo%>" class="form-control">
								<%}%>
							</div>
						</div>				
						<div class="row">	
							<div class="col-sm-6 form-group">
								<label style="color:black">Department</label>
							<%if(tmhma == null){%>
								<input type="text" name="dep" placeholder="Enter Your Department Here.." class="form-control">
								<%} else{%>
								<input type="text" name="dep" value="<%=tmhma%>" class="form-control">
								<%}%>
							</div>		
						<div class="col-sm-6 form-group">
						<label style="color:black">Registration Number (AM)</label>
					<%if(am == null){%>
								<input type="text" name="am" placeholder="Enter Your AM Here.." class="form-control">
								<%} else{%>
								<input type="text" name="am" value="<%=am%>" class="form-control">
								<%}%>
					</div>
												
				       </div>	
					<div class ="row">
							
					<div class="col-sm-6 form-group">
						<label style="color:black">Email Address</label>
					<%if(email == null){%>
								<input type="text" name="email" placeholder="Enter Your Email Here.." class="form-control">
								<%} else{%>
								<input type="text" name="email" value="<%=email%>" class="form-control">
								<%}%>
					</div>	
					</div>
					<div class="row">
							<div class="col-sm-6 form-group" style="width:100%">
								<label style="color:black;float:left;margin-left:10%">1st University</label>
								<label style="color:black;text-align:center">2nd University</label>
								<label style="color:black;float:right;margin-right:10%">3rd University</label>
					</div>
					</div>
								<select name="uni1" style="float:left">
	   <option value="0" selected>Empty</option>
       <%for(int i = 0; i < all.size();i++){%>
	   <option value="<%=panepistimio.getId(all.get(i))%>"><%=all.get(i)%></option>
	   <%}%>
	   
	  </select>
	  
	
	  <select name="uni2" style="float:right;">
	   <option value="0" selected>Empty</option>
       <%
	   for(int j = 0; j < all.size();j++){
		   %>
	   <option value="<%=panepistimio.getId(all.get(j))%>"><%=all.get(j)%></option>
	   <%}%>
	  </select>
		<select name="uni3" style="float:center">
	   <option value="0" selected>Empty</option>
       <%for(int k = 0; k < all.size();k++){%>
	   <option value="<%=panepistimio.getId(all.get(k))%>"><%=all.get(k)%></option>
	   <%}%>
	   
	  </select>
					<hr>
					<input type="submit" class="btn btn-lg btn-info"style="background-color:#337AB7;border-radius:10px;"value="Submit">					
					
				</form> 
				</div>
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