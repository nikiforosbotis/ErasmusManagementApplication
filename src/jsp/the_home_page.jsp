<!DOCTYPE html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="operasmus.Foititis" %>
<%@ page import="operasmus.Panepistimio" %>
<%@ page import="operasmus.Anakoinwsh" %>
<%@ page import="operasmus.Agaphmena" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page errorPage="error.jsp" %>

<%
Panepistimio panepistimio = new Panepistimio(); 
Agaphmena agaphmena = new Agaphmena();
Foititis foititis = new Foititis();
%>

<%!
private String username = null;
private String password = null;
private String country = null;
private String name = null;
private String department = null;
private int department_num;
private String country_full = null;
private int uni_counter;
private int i;
private boolean agap = false;
private String country1 = null;
private String uni_name = null;
private String uni_id = null;

List<String> names = new ArrayList<String>();
List<String> all_countries = new ArrayList<String>();
List<String> anakoinwseis = new ArrayList<String>();
List<String> links = new ArrayList<String>();
%>

<%   
username = (String) session.getAttribute("username");
if(username == null) {
	throw new Exception("Απαγορεύεται η είσοδος σε αυτή τη σελίδα χωρίς προηγουμένως να έχετε εισαχθεί με τα στοιχεία σας. Για να εισαχθείτε, <a href='LoginOperasmus.jsp'> πατήστε εδώ </a>");
}
name = foititis.fetchName(username);
department = foititis.fetchDepartment(username);
department_num = foititis.fetchDepartmentNum(department);

if(request.getParameter("id_gia_agaphmena") != null)  {
	agap = true;
	agaphmena.addToFavourites(username,(String)request.getParameter("id_gia_agaphmena"));
}
	
%>

<%!private String id_gia_agaphmena = null;%>

<%
if(!all_countries.contains("AU")) 
   all_countries.add("AU");
if(!all_countries.contains("BE")) 
   all_countries.add("BE");
if(!all_countries.contains("BU")) 
   all_countries.add("BU");
if(!all_countries.contains("FR")) 
   all_countries.add("FR");
if(!all_countries.contains("GE")) 
   all_countries.add("GE");
if(!all_countries.contains("DE")) 
   all_countries.add("DE");
if(!all_countries.contains("SI")) 
   all_countries.add("SI");
if(!all_countries.contains("ES")) 
   all_countries.add("ES");
if(!all_countries.contains("UK")) 
   all_countries.add("UK");
if(!all_countries.contains("IR")) 
   all_countries.add("IR");
if(!all_countries.contains("IS")) 
   all_countries.add("IS");
if(!all_countries.contains("SP")) 
   all_countries.add("SP");
if(!all_countries.contains("IT")) 
   all_countries.add("IT");
if(!all_countries.contains("CY")) 
   all_countries.add("CY");
if(!all_countries.contains("LA")) 
   all_countries.add("LA");
if(!all_countries.contains("LI")) 
   all_countries.add("LI");
if(!all_countries.contains("MA")) 
   all_countries.add("MA");
if(!all_countries.contains("NO")) 
   all_countries.add("NO");
if(!all_countries.contains("HO")) 
   all_countries.add("HO");
if(!all_countries.contains("HU")) 
   all_countries.add("HU");
if(!all_countries.contains("PL")) 
   all_countries.add("PL");
if(!all_countries.contains("PO")) 
   all_countries.add("PO");
if(!all_countries.contains("RO")) 
   all_countries.add("RO");
if(!all_countries.contains("SK")) 
   all_countries.add("SK");
if(!all_countries.contains("SN")) 
   all_countries.add("SN");
if(!all_countries.contains("SW")) 
   all_countries.add("SW");
if(!all_countries.contains("CZ")) 
   all_countries.add("CZ");
if(!all_countries.contains("FI")) 
   all_countries.add("FI");

if(request.getParameter("country") != null) {
	int result = Integer.parseInt(request.getParameter("country"));
	switch(result) {
		case(0): country = null;
				 break;
		case(1): country = "AU";
		         country_full = "Αυστρία";
				 break;
		case(2): country = "BE";	
		         country_full = "Βέλγιο";
				 break;
		case(3): country = "BU";
		         country_full = "Βουλγαρία";
			     break;
		case(4): country = "FR";
		         country_full = "Γαλλία";
				 break;
		case(5): country = "GE";
		         country_full = "Γερμανία";
				 break;			
		case(6): country = "DE";
		         country_full = "Δανία";
	  			 break;
		case(7): country = "SI";
	           	 country_full = "Ελβετία";
				 break;
		case(8): country = "ES";
		         country_full = "Εσθονία";
				 break;
		case(9): country = "UK";
		         country_full = "Ηνωμένο Βασίλειο";
				 break;
		case(10): country = "IR";
		          country_full = "Ιρλανδία";
				  break;
		case(11): country = "IS";
		          country_full = "Ισλανδία";
				  break;
		case(12): country = "SP";
		          country_full = "Ισπανία";
				  break;
		case(13): country = "IT";
		          country_full = "Ιταλία";
				  break;
		case(14): country = "CY";
		          country_full = "Κύπρος";
				  break;
		case(15): country = "LA";
		          country_full = "Λεττονία";
				  break;
		case(16): country = "LI";
		          country_full = "Λιθουανία";
				  break;
		case(17): country = "MA";
		          country_full = "Μάλτα";
				  break;
		case(18): country = "NO";
		          country_full = "Νορβηγία";
				  break;
		case(19): country = "HO";
		          country_full = "Ολλανδία";
				  break;
		case(20): country = "HU";
		          country_full = "Ουγγαρία";
				  break;
		case(21): country = "PL";
		          country_full = "Πολωνία";
				  break;
		case(22): country = "PO";
		          country_full = "Πορτογαλία";
				  break;
		case(23): country = "RO";
		          country_full = "Ρουμανία";
				  break;	
		case(24): country = "SK";
		          country_full = "Σλοβακία";
				  break;	
		case(25): country = "SN";
		          country_full = "Σλοβενία";
				  break;	
		case(26): country = "SW";
		          country_full = "Σουηδία";
				  break;	
		case(27): country = "CZ";
		          country_full = "Τσεχία";
				  break;	
		case(28): country = "FI";
		          country_full = "Φινλανδία";
				  break;					 
	}
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
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <link rel="icon" href="../../favicon.ico">
	<title>ΟΠerΑsmus-Home</title>

    <!-- Bootstrap core CSS -->
    <link href="css/the_home_page.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/thp.css" rel="stylesheet">

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
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active"><a href="the_home_page.jsp">Home</a></li>
            <li role="presentation"><a href="the_Profile.jsp"><%=username %></a></li>
          </ul>
        </nav>
		<img src="images/logo.jpg" alt="ΟΠerΑsmus Logo" style="width:500px;height:150px;">
      </div>
	  <h1 class="text-muted">Καλώς Ήρθες <%=name%> !</h1>
	  <h1 class="text-muted" style="text-align:center-left;"><u>Λίστα Πανεπιστημίων</u></h1> <div class="dropdown">
	  <h2 class="text-muted" style="text-align:center-left;"><b>Προσοχή! Εμφανίζονται μόνο τα πανεπιστήμια που είναι προσβάσιμα από το τμήμα <%=department%>. Για την περίπτωση κινητοποίησης σε πανεπιστήμιο άλλου τμήματος, παρακαλείσθε να απευθυνθείτε στη γραμματεία του τμήματός σας. </b></h2>
    <div id="content">
	<button class="btn btn-primary" type="button">Χώρα</button>
	
	<form action="the_home_page.jsp" method="POST">
	  <select name="country">
	   <option value="0" selected>Όλες οι χώρες</option>
       <option value="1">Αυστρία</option>
       <option value="2">Βέλγιο</option>
       <option value="3">Βουλγαρία</option>
       <option value="4">Γαλλία</option>
	   <option value="5">Γερμανία</option>
	   <option value="6">Δανία</option>
	   <option value="7">Ελβετία</option>
	   <option value="8">Εσθονία</option>
	   <option value="9">Ηνωμένο Βασίλειο</option>
	   <option value="10">Ιρλανδία</option>
	   <option value="11">Ισλανδία</option>
	   <option value="12">Ισπανία</option>
	   <option value="13">Ιταλία</option>
	   <option value="14">Κύπρος</option>
	   <option value="15">Λεττονία</option>
	   <option value="16">Λιθουανία</option>
	   <option value="17">Μάλτα</option>
	   <option value="18">Νορβηγία</option>
	   <option value="19">Ολλανδία</option>
	   <option value="20">Ουγγαρία</option>
	   <option value="21">Πολωνία</option>
	   <option value="22">Πορτογαλία</option>
	   <option value="23">Ρουμανία</option>
	   <option value="24">Σλοβακία</option>
	   <option value="25">Σλοβενία</option>
	   <option value="26">Σουηδία</option>
	   <option value="27">Τσεχία</option>
	   <option value="28">Φινλανδία</option>
	  </select>
	  <input type="submit" value="Search">
	</form>
  </div> 
  
  <br>
  <% if(agap==true) { %>
	  <h3 class="text-muted">Το πανεπιστήμιο <%=panepistimio.getNameFromId((String)request.getParameter("id_gia_agaphmena"))%> έχει εισαχθεί επιτυχώς στα αγαπημένα!</h3>
  <%} 
  %>
  	<div id="content">
	<% uni_counter = 0; %>
	<% if (country != null) { %>
		<h3>Αποτελέσματα αναζήτησης για τη χώρα: <b><%=country_full %></b></h3>
	<% } %>

	  <div class="myBox">
	  <div class="jumbotron">
	  
	  <% 
   int j = 0;
   
   while(j < all_countries.size() ) {
	  
	if((country == all_countries.get(j)) || (country == null)) {
	 if(country == null) {
		 country1 = all_countries.get(j);
		 names = panepistimio.getName(country1);
	 } else {
		 names = panepistimio.getName(country);
	 }

	 for(i = 0; i < names.size(); i++) { %>
	   <% uni_name = names.get(i);
		  uni_id = panepistimio.getId(uni_name);%>
	   <% if(panepistimio.isUniversityDept(uni_id,department_num) == true) { %>
	   <p class="lead"><%=uni_name %></p>
       <p><a class="btn btn-sm btn-success" href="Un_Profile.jsp?id=<%=panepistimio.getId(uni_name) %>" role="button">Προφίλ πανεπιστημίου</a></p>
	   <%uni_counter = uni_counter + 1;%> 
       <p><a class="btn btn-sm btn-danger" href="the_home_page.jsp?id_gia_agaphmena=<%=uni_id%>" role="button">Προσθήκη στα αγαπημένα</a></p>
	   <hr>
	   <% } %>
	 <% }
	}
	
   j++; 
   }
	%>
	  	
	</div>
   </div>
   
   <% country = null; %>

   <div class="sidebar secondary">
    <ul class="sidebar secondary">
     <li class="sidebar">
     <h1>Ανακοινώσεις</h1>
		<div class="col-sm-4">
          <div class="sidebar">
		  <div class="myBox3">
		  
		  <% 
		  Anakoinwsh anakoinwsh = new Anakoinwsh();
		  anakoinwseis = anakoinwsh.getAnakoinwseis();
		  links = anakoinwsh.getLinks();
		  String id;
		  
		  for(int i = (anakoinwseis.size() - 1); i >= 0; i--) {
		  %>
			<a href="<%=links.get(i) %>" class="list-group-item ">
              <h4 class="list-group-item-heading"><%=anakoinwseis.get(i) %></h4>
              <p class="list-group-item-text"></p>
            </a>
		  <% } %> 
		 
			</div>

          </div>
        </div><!-- /.col-sm-4 -->
		</ul>
	  </div>
	  
	<h3>Βρέθηκαν <b><%=uni_counter%></b> αποτελέσματα.</h3>
   
  </div>
	<br>
      <footer class="footer">
        <p>&copy; ΟΠerΑsmus 2015</p>
      </footer>
    
  <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>  
  </body>
</html>
