<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="operasmus.Panepistimio" %>
<%@ page import="operasmus.Agaphmena" %>
<%@ page import="operasmus.Utility" %>
<%@ page import="operasmus.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page errorPage="error.jsp" %>
<%@ page import="java.sql.*" %>

<%!
private String onoma = null;
private String epwnumo = null;
private String onomatepwnumo = null;
private String password = null;
private String username = null; 
private String tmhma = null;
private String email = null;
private String tid = null;
private String x = "";

%>

<% 
int k = 0;
Utility ut = new Utility(); 
username = (String) session.getAttribute("username");
if(username == null) {
	throw new Exception("Δεν είναι δυνατή η περιήγησή σας σε αυτή τη σελίδα, χωρίς προηγουμένως να έχετε πραγματοποιήσει είσοδο. Παρακαλούμε πατήστε <a href='LoginOperasmus.jsp'>εδώ</a> για να πραγματοποιήσετε είσοδο.");
}
tid = request.getParameter("idpan");
try{
	User r = ut.getStudentsData(username);
	onoma = r.getfname();
	epwnumo = r.getlname();
	onomatepwnumo = onoma+" "+epwnumo;
	password = r.getpassword();
	tmhma = r.getdep();
	email = ut.getEmail(username);
	Agaphmena a = new Agaphmena();
	ut.open();
	List<Panepistimio> p = new ArrayList<Panepistimio>();
	if(a.fetchPanepistimio(username) != null){
		p = a.fetchPanepistimio(username);
	} else{
		p = null;
	}
	if(tid != null){
		a.deleteFavourites(tid);
	}
	if(a.fetchPanepistimio(username) != null){
		p = a.fetchPanepistimio(username);
	} else{
		p = null;
	}
	ut.close();
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

    <title>ΟΠerΑsmus-Profile</title>

    <!-- Bootstrap core CSS -->
    <link href="css/theprof.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/the_profile.css" rel="stylesheet">

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
      <div class="header clearfix"style="width:100%">
        <div class="dev">
		<img src="images/logo.jpg" alt="ΟΠerΑsmus Logo" style="width:500px;height:150px;float:left;"></div>
		<div class="dev1"><nav style="float:right;">
          <ul class="nav nav-pills pull-right">
            <li role="presentation" ><a href="the_home_page.jsp">Home</a></li>
            <li role="presentation" class="active"><a href="the_Profile.jsp"><%=username%></a></li>
			<li role="presentation" ><a href="Logoffoperasmus.jsp">Log off</a></li>
          </ul>
        </nav></div>
		
        
      </div>
	  
		<div id="content">
		
		<div class="sidebar">
        
            <li class="sidebar1">
        
		       <div class="col-sm-12">
         <div class="sidebar2">
		  
		  <div class="myBox3">
            <a href="the_Profile.jsp" class="list-group-item ">
              <h4 class="list-group-item-heading"style="text-align:center">Προφίλ</h4>
              <img src="Anonymous_Facebook_Profile_Pic.jpg" width="100%">
            </a>
            <a  class="list-group-item ">
              <h4 class="list-group-item-heading"style="text-align:center;width:auto"><u>Ονοματεπώνυμο</u></h4>
              <p class="list-group-item-text"style="text-align:center;width:auto"><%=onomatepwnumo%></p>
            </a>
            <a  class="list-group-item">
              <h4 class="list-group-item-heading"style="text-align:center;width:auto"><u>Αριθμός Μητρώου</u></h4>
              <p class="list-group-item-text"style="text-align:center;width:auto"><%=username%></p>
            </a>
			<a  class="list-group-item ">
              <h4 class="list-group-item-heading"style="text-align:center;width:auto"><u>Τμήμα Προπτυχιακών Σπουδών</u></h4>
              <p class="list-group-item-text"style="text-align:center;width:auto"><%=tmhma%></p>
            </a>
			<a  class="list-group-item">
              <h4 class="list-group-item-heading"style="text-align:center;width:auto"><u>E-mail</u></h4>
              <p class="list-group-item-text"style="text-align:center;width:auto"><%=email%></p>
            </a>
			<!--<a href="#" class="list-group-item">
              <h4 class="list-group-item-heading"style="text-align:center"><u>Εργασιακή Εμπειρία</u></h4>
              <p class="list-group-item-text"style="text-align:center">Μερικής απασχόλησης</p>
            </a>-->
			
               <p class="list-group-item" style="background-color:#EEE;width:auto"><a  class="list-group-item" style="border-color:#EEE;background-color:#EEE"></a></p>
            
			<p style="text-align:center;background-color:white;margin-bottom:0px;margin-top:0px;"><a class="btn btn-sm btn-success" href="aitisi.jsp" style="border-radius:0px" role="button">Δημιουργία Αίτησης</a></p>
			
              


			</div>
			
          </div>
        </div><!-- /.col-sm-4 -->
	  </div>
	  
	 <h2 style="text-align:center;"class="text-muted">✰Αγαπημένα✰</h2>
	 
	  <div class="myBox">
	  <div class="jumbotron">
		<%if(p.size() == 0){%>
	 <br>
	 <p class="text-muted" style="margin-top:50%">Δεν έχετε επιλέξει αγαπημένα πανεπιστήμια</p> 
	 <%
		 
	 }%>
	  <%
	  for(Panepistimio i : p) {
		  String name = i.getOnoma();
		  String id = i.getId();
		  %>
	  <p class="lead"><%=name%></p>
        <p><a class="btn btn-sm btn-success" href="Un_Profile.jsp?id=<%=id%>" role="button">Προφίλ πανεπιστημίου</a></p>
		<form method="post" action="the_Profile.jsp">
		<input type="hidden"  name="idpan" value="<%=id%>" /><br>
		<input type="submit" name="box1" class="btn btn-info" id="<%=id%>" value="Αφαίρεση"/></form><hr>
	  <%k = k + 1;
	  }
	  %>
	 <!-- <p class="lead">University College London</p>
        <p><a class="btn btn-sm btn-success" href="Un_Profile.jsp" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="199" class="onoffswitch-checkbox "  id="University College London"  checked>
        <label class="onoffswitch-label " for="University College London"></label>
		</div><hr>
        <p class="lead">Universitat Innsbruck</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="0" class="onoffswitch-checkbox"  id="Universitat Innsbruck"checked>
        <label class="onoffswitch-label" for="Universitat Innsbruck"></label>
		</div><hr>    
        <p class="lead">Johannes Kepler Universitat Linz</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="1" class="onoffswitch-checkbox" id="Johannes Kepler Universitat Linz"checked>
        <label class="onoffswitch-label" for="Johannes Kepler Universitat Linz"></label>
		</div><hr>
		<p class="lead">Universitat Wien</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="2" class="onoffswitch-checkbox" id="Universitat Wien"checked>
        <label class="onoffswitch-label" for="Universitat Wien"></label>
		</div><hr>
		<p class="lead">Wirtschaftsuniversitat Wien</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="3" class="onoffswitch-checkbox" id="Wirtschaftsuniversitat Wien"checked>
        <label class="onoffswitch-label" for="Wirtschaftsuniversitat Wien"></label>
		</div><hr>
		<p class="lead">HUB - ESHAL (Hogeschool -Universiteit Brussel)</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="4" class="onoffswitch-checkbox" id="HUB - ESHAL (Hogeschool -Universiteit Brussel)"checked>
        <label class="onoffswitch-label" for="HUB - ESHAL (Hogeschool -Universiteit Brussel)"></label>
		</div><hr>
		<p class="lead">Faculte Universitaire Catholique de Mons (FUCaM)</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="5" class="onoffswitch-checkbox" id="Faculte Universitaire Catholique de Mons (FUCaM)"checked>
        <label class="onoffswitch-label" for="Faculte Universitaire Catholique de Mons (FUCaM)"></label>
		</div><hr>
		<p class="lead">Katholieke Universiteit Leuven</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="6" class="onoffswitch-checkbox" id="Katholieke Universiteit Leuven"checked>
        <label class="onoffswitch-label" for="Katholieke Universiteit Leuven"></label>
		</div><hr>
		<p class="lead">Universite Catholique de Louvain</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="7" class="onoffswitch-checkbox" id="Universite Catholique de Louvain"checked>
        <label class="onoffswitch-label" for="Universite Catholique de Louvain"></label>
		</div><hr>
		<p class="lead">Universite Libre de Bruxelles - Solvay Business School</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="8" class="onoffswitch-checkbox" id="Universite Libre de Bruxelles - Solvay Business School"checked>
        <label class="onoffswitch-label" for="Universite Libre de Bruxelles - Solvay Business School"></label>
		</div><hr>
		<p class="lead">Universiteit Gent</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="9" class="onoffswitch-checkbox" id="Universiteit Gent"checked>
        <label class="onoffswitch-label" for="Universiteit Gent"></label>
		</div><hr>
		<p class="lead">Universiteit Antwerpen UFSIA</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="10" class="onoffswitch-checkbox" id="Universiteit Antwerpen UFSIA"checked>
        <label class="onoffswitch-label" for="Universiteit Antwerpen UFSIA"></label>
		</div><hr>
		<p class="lead">Hasselt University</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="11" class="onoffswitch-checkbox" id="Hasselt UniversityHasselt University"checked>
        <label class="onoffswitch-label" for="Hasselt UniversityHasselt University"></label>
		</div><hr>
		<p class="lead">Universite de Liege</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="12" class="onoffswitch-checkbox" id="Universite de Liege"checked>
        <label class="onoffswitch-label" for="Universite de Liege"></label>
		</div><hr>
		<p class="lead">Sofia University St. Kliment Ohridski</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="13" class="onoffswitch-checkbox" id="Sofia University St. Kliment Ohridski"checked>
        <label class="onoffswitch-label" for="Sofia University St. Kliment Ohridski"></label>
		</div><hr>
		<p class="lead">Varna Free University Chernorizets Hrabar</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="14" class="onoffswitch-checkbox" id="Varna Free University Chernorizets Hrabar"checked>
        <label class="onoffswitch-label" for="Varna Free University Chernorizets Hrabar"></label>
		</div><hr>
		<p class="lead">New Bulgarian University</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="15" class="onoffswitch-checkbox" id="New Bulgarian University"checked>
        <label class="onoffswitch-label" for="New Bulgarian University"></label>
		</div><hr>
		<p class="lead">University of Cyprus</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="16" class="onoffswitch-checkbox" id="University of Cyprus"checked>
        <label class="onoffswitch-label" for="University of Cyprus"></label>
		</div><hr>
		<p class="lead">Cyprus University of Technology</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="17" class="onoffswitch-checkbox" id="Cyprus University of Technology"checked>
        <label class="onoffswitch-label" for="Cyprus University of Technology"></label>
		</div><hr>
		<p class="lead">University of Nicosia</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="18" class="onoffswitch-checkbox" id="University of Nicosia"checked>
        <label class="onoffswitch-label" for="University of Nicosia"></label>
		</div><hr>
		<p class="lead">Mendel University of Agriculture and Forestry - BRNO</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="19" class="onoffswitch-checkbox" id="Mendel University of Agriculture and Forestry - BRNO"checked>
        <label class="onoffswitch-label" for="Mendel University of Agriculture and Forestry - BRNO"></label>
		</div><hr>
		<p class="lead">University of Economics - Prague</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="20" class="onoffswitch-checkbox" id="University of Economics - Prague"checked>
        <label class="onoffswitch-label" for="University of Economics - Prague"></label>
		</div><hr>
		<p class="lead">Masaryk University</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="21" class="onoffswitch-checkbox" id="Masaryk University"checked>
        <label class="onoffswitch-label" for="Masaryk University"></label>
		</div><hr>
		<p class="lead">Copenhagen Business School</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="22" class="onoffswitch-checkbox" id="Copenhagen Business School"checked>
        <label class="onoffswitch-label" for="Copenhagen Business School"></label>
		</div><hr>
		<p class="lead">University of Southern Denmark</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="23" class="onoffswitch-checkbox" id="University of Southern Denmark"checked>
        <label class="onoffswitch-label" for="University of Southern Denmark"></label>
		</div><hr>
		<p class="lead">Aalborg University</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="24" class="onoffswitch-checkbox" id="Aalborg University"checked>
        <label class="onoffswitch-label" for="Aalborg University"></label>
		</div><hr>
		<p class="lead">University of Copenhagen</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="25" class="onoffswitch-checkbox" id="University of Copenhagen"checked>
        <label class="onoffswitch-label" for="University of Copenhagen"></label>
		</div><hr>
		<p class="lead">Aarhus Business School</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="26" class="onoffswitch-checkbox" id="Aarhus Business School"checked>
        <label class="onoffswitch-label" for="Aarhus Business School"></label>
		</div><hr>
		<p class="lead">Tallihinn University of Technology</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="27" class="onoffswitch-checkbox" id="Tallihinn University of Technology"checked>
        <label class="onoffswitch-label" for="Tallihinn University of Technology"></label>
		</div><hr>
		<p class="lead">Aabo Akademi University</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="28" class="onoffswitch-checkbox" id="Aabo Akademi University"checked>
        <label class="onoffswitch-label" for="Aabo Akademi University"></label>
		</div><hr>
		<p class="lead">University of Jyvaskyla</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="29" class="onoffswitch-checkbox" id="University of Jyvaskyla"checked>
        <label class="onoffswitch-label" for="University of Jyvaskyla"></label>
		</div><hr>
		<p class="lead">Lahti University of Applied Sciences</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="30" class="onoffswitch-checkbox" id="Lahti University of Applied Sciences"checked>
        <label class="onoffswitch-label" for="Lahti University of Applied Sciences"></label>
		</div><hr>
		<p class="lead">Lappeenranta University of Technology</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="31" class="onoffswitch-checkbox" id="31"checked>
        <label class="onoffswitch-label" for="31"></label>
		</div><hr>
		<p class="lead">University of OULU</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="32" class="onoffswitch-checkbox" id="32"checked>
        <label class="onoffswitch-label" for="32"></label>
		</div><hr>
		<p class="lead">HANKEN School of Economics</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="33" class="onoffswitch-checkbox" id="33"checked>
        <label class="onoffswitch-label" for="33"></label>
		</div><hr>
		<p class="lead">University of Tampere</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="34" class="onoffswitch-checkbox" id="34"checked>
        <label class="onoffswitch-label" for="34"></label>
		</div><hr>
		<p class="lead">University of Vaasa</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="35" class="onoffswitch-checkbox" id="35"checked>
        <label class="onoffswitch-label" for="35"></label>
		</div><hr>
		<p class="lead">AUDENCIA Nantes Ecole de Management</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="36" class="onoffswitch-checkbox" id="36"checked>
        <label class="onoffswitch-label" for="36"></label>
		</div><hr>
		<p class="lead">Universite d' Auvergne Clermont - Ferrand</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="37" class="onoffswitch-checkbox" id="37"checked>
        <label class="onoffswitch-label" for="37"></label>
		</div><hr>
		<p class="lead">BEM - Bordeaux Ecole de Management</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="38" class="onoffswitch-checkbox" id="38"checked>
        <label class="onoffswitch-label" for="38"></label>
		</div><hr>
		<p class="lead">Universite Catholique de l'Ouest, Angers</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="39" class="onoffswitch-checkbox" id="39"checked>
        <label class="onoffswitch-label" for="39"></label>
		</div><hr>
		<p class="lead">Universite Catholique de Lille</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="40" class="onoffswitch-checkbox" id="40"checked>
        <label class="onoffswitch-label" for="40"></label>
		</div><hr>
		<p class="lead">IESEG</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="41" class="onoffswitch-checkbox" id="41"checked>
        <label class="onoffswitch-label" for="41"></label>
		</div><hr>
		<p class="lead"></p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="42" class="onoffswitch-checkbox" id="42"checked>
        <label class="onoffswitch-label" for="42"></label>
		</div><hr>
		<p class="lead">CCI - Dijon Groupe Ecole Superieure de Commerce Dijon Bourgogne</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="43" class="onoffswitch-checkbox" id="43"checked>
        <label class="onoffswitch-label" for="43"></label>
		</div><hr>
		<p class="lead">Universite de Cergy Pontoise</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="44" class="onoffswitch-checkbox" id="44"checked>
        <label class="onoffswitch-label" for="44"></label>
		</div><hr>
		<p class="lead">Ecole Polytechnique, Paris</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="45" class="onoffswitch-checkbox" id="45"checked>
        <label class="onoffswitch-label" for="45"></label>
		</div><hr>
		<p class="lead">ESC Rennes School of Business</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="46" class="onoffswitch-checkbox" id="46"checked>
        <label class="onoffswitch-label" for="46"></label>
		</div><hr>
		<p class="lead">ESC Bretagne Brest</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="47" class="onoffswitch-checkbox" id="47"checked>
        <label class="onoffswitch-label" for="47"></label>
		</div><hr>
		<p class="lead">EUROMED Marseille - Ecole de Management</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="48" class="onoffswitch-checkbox" id="48"checked>
        <label class="onoffswitch-label" for="48"></label>
		</div><hr>
		<p class="lead">Universite DEvry Val D'Essone, Paris</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="49" class="onoffswitch-checkbox" id="49"checked>
        <label class="onoffswitch-label" for="49"></label>
		</div><hr>
		<p class="lead">Universite Francois Rabelais</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="50" class="onoffswitch-checkbox" id="50"checked>
        <label class="onoffswitch-label" for="50"></label>
		</div><hr>
		<p class="lead">Grennoble Ecole de Management</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="51" class="onoffswitch-checkbox" id="51"checked>
        <label class="onoffswitch-label" for="51"></label>
		</div><hr>
		<p class="lead">Groupe ESSCAngers</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="52" class="onoffswitch-checkbox" id="52"checked>
        <label class="onoffswitch-label" for="52"></label>
		</div><hr>
		<p class="lead">Groupe ESC Chambery Savoie</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="53" class="onoffswitch-checkbox" id="53"checked>
        <label class="onoffswitch-label" for="53"></label>
		</div><hr>
		<p class="lead">Groupe ESC Troyes</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="54" class="onoffswitch-checkbox" id="54"checked>
        <label class="onoffswitch-label" for="54"></label>
		</div><hr>
		<p class="lead">Groupe Sup de Co Amiens - Picardie</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="55" class="onoffswitch-checkbox" id="55"checked>
        <label class="onoffswitch-label" for="55"></label>
		</div><hr>
		<p class="lead">ICN School of Management, Nancy</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="56" class="onoffswitch-checkbox" id="56"checked>
        <label class="onoffswitch-label" for="56"></label>
		</div><hr>
		<p class="lead">ISCID - Institut Superieur de Commerce International de Dunkerque</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="57" class="onoffswitch-checkbox" id="57"checked>
        <label class="onoffswitch-label" for="57"></label>
		</div><hr>
		<p class="lead">Paris Graduate School of Management - Pole ESG</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="58" class="onoffswitch-checkbox" id="58"checked>
        <label class="onoffswitch-label" for="58"></label>
		</div><hr>
		<p class="lead">Telecom Paris Tech</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="59" class="onoffswitch-checkbox" id="59"checked>
        <label class="onoffswitch-label" for="59"></label>
		</div><hr>
		<p class="lead">Universite de Montpellier 1</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="60" class="onoffswitch-checkbox" id="60"checked>
        <label class="onoffswitch-label" for="60"></label>
		</div><hr>
		<p class="lead">Universite Montpellier 2</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="61" class="onoffswitch-checkbox" id="61"checked>
        <label class="onoffswitch-label" for="61"></label>
		</div><hr>
		<p class="lead">Universite de Nice - Sophia Antipolis</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="62" class="onoffswitch-checkbox" id="62"checked>
        <label class="onoffswitch-label" for="62"></label>
		</div><hr>
		<p class="lead">Universite Paris - Dauphine</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="63" class="onoffswitch-checkbox" id="63"checked>
        <label class="onoffswitch-label" for="63"></label>
		</div><hr>
		<p class="lead">Universite Paris I Pantheon - Sorbonne</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="64" class="onoffswitch-checkbox" id="64"checked>
        <label class="onoffswitch-label" for="64"></label>
		</div><hr>
		<p class="lead">Universite Paris Ouest - Nanterre La Defense</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="65" class="onoffswitch-checkbox" id="65"checked>
        <label class="onoffswitch-label" for="65"></label>
		</div><hr>
		<p class="lead">Universite Paris XII - Val de Marne </p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="66" class="onoffswitch-checkbox" id="66"checked>
        <label class="onoffswitch-label" for="66"></label>
		</div><hr>
		<p class="lead">Universite de Pau et des Pays de L'Adour</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="67" class="onoffswitch-checkbox" id="67"checked>
        <label class="onoffswitch-label" for="67"></label>
		</div><hr>
		<p class="lead">Universite Pierre et Marie Curie</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="68" class="onoffswitch-checkbox" id="68"checked>
        <label class="onoffswitch-label" for="68"></label>
		</div><hr>
		<p class="lead">Universite Pierre Mendes France Grenoble</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="69" class="onoffswitch-checkbox" id="69"checked>
        <label class="onoffswitch-label" for="69"></label>
		</div><hr>
		<p class="lead">Universite de Poitiers</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="70" class="onoffswitch-checkbox" id="70"checked>
        <label class="onoffswitch-label" for="70"></label>
		</div><hr>
		<p class="lead">Reims Management School</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="71" class="onoffswitch-checkbox" id="71"checked>
        <label class="onoffswitch-label" for="71"></label>
		</div><hr>
		<p class="lead">Universite des Sciences Sociales de Toulouse</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="72" class="onoffswitch-checkbox" id="72"checked>
        <label class="onoffswitch-label" for="72"></label>
		</div><hr>
		<p class="lead">Universite Louis Pasteur, Strasbourg I</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="73" class="onoffswitch-checkbox" id="73"checked>
        <label class="onoffswitch-label" for="73"></label>
		</div><hr>
		<p class="lead">Universite Robert Schuman, Ecole de Management Strasbourg</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="74" class="onoffswitch-checkbox" id="74"checked>
        <label class="onoffswitch-label" for="74"></label>
		</div><hr>
		<p class="lead">Universite Marc Bloch</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="75" class="onoffswitch-checkbox" id="75"checked>
        <label class="onoffswitch-label" for="75"></label>
		</div><hr>
		<p class="lead">Universite de Versailles et Saint Quentin-en Yvelines</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="76" class="onoffswitch-checkbox" id="76"checked>
        <label class="onoffswitch-label" for="76"></label>
		</div><hr>
		<p class="lead">Conservtoire National des Arts et Metiers</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="77" class="onoffswitch-checkbox" id="77"checked>
        <label class="onoffswitch-label" for="77"></label>
		</div><hr>
		<p class="lead">Universitat Augsburg</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="78" class="onoffswitch-checkbox" id="78"checked>
        <label class="onoffswitch-label" for="78"></label>
		</div><hr>
		<p class="lead">Eberhard Karls University of Tubingen</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="79" class="onoffswitch-checkbox" id="79"checked>
        <label class="onoffswitch-label" for="79"></label>
		</div><hr>
		<p class="lead">European Business School</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="80" class="onoffswitch-checkbox" id="80"checked>
        <label class="onoffswitch-label" for="80"></label>
		</div><hr>
		<p class="lead">Hochschule fuer Wirtschaft und Recht Berlin</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="81" class="onoffswitch-checkbox" id="81"checked>
        <label class="onoffswitch-label" for="81"></label>
		</div><hr>
		<p class="lead">Freie Universitat Berlin</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="82" class="onoffswitch-checkbox" id="82"checked>
        <label class="onoffswitch-label" for="82"></label>
		</div><hr>
		<p class="lead">Friedrich-Schiller-Universitat Jena</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="83" class="onoffswitch-checkbox" id="83"checked>
        <label class="onoffswitch-label" for="83"></label>
		</div><hr>
		<p class="lead">Georg-August Universitat Gottingen</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="84" class="onoffswitch-checkbox" id="84"checked>
        <label class="onoffswitch-label" for="84"></label>
		</div><hr>
		<p class="lead">Goethe-Universitat Frankfurt am Main</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="85" class="onoffswitch-checkbox" id="85"checked>
        <label class="onoffswitch-label" for="85"></label>
		</div><hr>
		<p class="lead">Gottfried Wilhelm Leibniz Universitat Hannover</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="86" class="onoffswitch-checkbox" id="86"checked>
        <label class="onoffswitch-label" for="86"></label>
		</div><hr>
		<p class="lead">Universitat Hohenheim</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="87" class="onoffswitch-checkbox" id="87"checked>
        <label class="onoffswitch-label" for="87"></label>
		</div><hr>
		<p class="lead">International School of Management, Dortmund-Frankfurt</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="88" class="onoffswitch-checkbox" id="88"checked>
        <label class="onoffswitch-label" for="88"></label>
		</div><hr>
		<p class="lead">Justus-Leibig Universitat Giessen</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="89" class="onoffswitch-checkbox" id="89"checked>
        <label class="onoffswitch-label" for="89"></label>
		</div><hr>
		<p class="lead">Universitat Konstanz</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="90" class="onoffswitch-checkbox" id="90"checked>
        <label class="onoffswitch-label" for="90"></label>
		</div><hr>
		<p class="lead">Universitat Leipzig</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="91" class="onoffswitch-checkbox" id="91"checked>
        <label class="onoffswitch-label" for="91"></label>
		</div><hr>
		<p class="lead">Ludwig Maximillians - Universitat Muenchen</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="92" class="onoffswitch-checkbox" id="92"checked>
        <label class="onoffswitch-label" for="92"></label>
		</div><hr>
		<p class="lead">Universitat Mannheim</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="93" class="onoffswitch-checkbox" id="93"checked>
        <label class="onoffswitch-label" for="93"></label>
		</div><hr>
		<p class="lead">Universitat Paderborn</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="94" class="onoffswitch-checkbox" id="94"checked>
        <label class="onoffswitch-label" for="94"></label>
		</div><hr>
		<p class="lead">Philipps - Universitat Marburg</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="95" class="onoffswitch-checkbox" id="95"checked>
        <label class="onoffswitch-label" for="95"></label>
		</div><hr>
		<p class="lead">Universitat Potsdam</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="96" class="onoffswitch-checkbox" id="96"checked>
        <label class="onoffswitch-label" for="96"></label>
		</div><hr>
		<p class="lead">Universitat Regensburg</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="97" class="onoffswitch-checkbox" id="97"checked>
        <label class="onoffswitch-label" for="97"></label>
		</div><hr>
		<p class="lead">Universitat Siegen</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="98" class="onoffswitch-checkbox" id="98"checked>
        <label class="onoffswitch-label" for="98"></label>
		</div><hr>
		<p class="lead">Hamburg University of Technology</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="99" class="onoffswitch-checkbox" id="99"checked>
        <label class="onoffswitch-label" for="99"></label>
		</div><hr>
		<p class="lead">Technische Universitat Dresden</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="100" class="onoffswitch-checkbox" id="100"checked>
        <label class="onoffswitch-label" for="100"></label>
		</div><hr>
		<p class="lead">Technische Universitat Muenchen</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="101" class="onoffswitch-checkbox" id="101"checked>
        <label class="onoffswitch-label" for="101"></label>
		</div><hr>
		<p class="lead">Universitat Trier</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="102" class="onoffswitch-checkbox" id="102"checked>
        <label class="onoffswitch-label" for="102"></label>
		</div><hr>
		<p class="lead">Universitat Ulm</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="103" class="onoffswitch-checkbox" id="103"checked>
        <label class="onoffswitch-label" for="103"></label>
		</div><hr>
		<p class="lead">Muenster University of Applied Sciences</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="104" class="onoffswitch-checkbox" id="104"checked>
        <label class="onoffswitch-label" for="104"></label>
		</div><hr>
		<p class="lead">Corvins University of Budapest</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="105" class="onoffswitch-checkbox" id="105"checked>
        <label class="onoffswitch-label" for="105"></label>
		</div><hr>
		<p class="lead">Reykjavik University</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="106" class="onoffswitch-checkbox" id="106"checked>
        <label class="onoffswitch-label" for="106"></label>
		</div><hr>
		<p class="lead">University of Limerick</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="107" class="onoffswitch-checkbox" id="107"checked>
        <label class="onoffswitch-label" for="107"></label>
		</div><hr>
		<p class="lead">University of Iceland</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="108" class="onoffswitch-checkbox" id="108"checked>
        <label class="onoffswitch-label" for="108"></label>
		</div><hr>
		<p class="lead">Universita di Bologna</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="109" class="onoffswitch-checkbox" id="109"checked>
        <label class="onoffswitch-label" for="109"></label>
		</div><hr>
		<p class="lead">Universita Ca Foscari di Venezia</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="110" class="onoffswitch-checkbox" id="110"checked>
        <label class="onoffswitch-label" for="110"></label>
		</div><hr>
		<p class="lead">Universita Carlo Cattaneo - LIUC</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="111" class="onoffswitch-checkbox" id="111"checked>
        <label class="onoffswitch-label" for="111"></label>
		</div><hr>
		<p class="lead">Universita delgi studi di Firenze</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="112" class="onoffswitch-checkbox" id="112"checked>
        <label class="onoffswitch-label" for="112"></label>
		</div><hr>
		<p class="lead">Universita Europea di Roma</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="113" class="onoffswitch-checkbox" id="113"checked>
        <label class="onoffswitch-label" for="113"></label>
		</div><hr>
		<p class="lead">Universita delgi studi dell' Insubria</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="114" class="onoffswitch-checkbox" id="114"checked>
        <label class="onoffswitch-label" for="114"></label>
		</div><hr>
		<p class="lead">LUISS Guido Carli</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="115" class="onoffswitch-checkbox" id="115"checked>
        <label class="onoffswitch-label" for="115"></label>
		</div><hr>
		<p class="lead">Universita delgi studi di Modena</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="116" class="onoffswitch-checkbox" id="116"checked>
        <label class="onoffswitch-label" for="116"></label>
		</div><hr>
		<p class="lead">Universita di Padova</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="117" class="onoffswitch-checkbox" id="117"checked>
        <label class="onoffswitch-label" for="117"></label>
		</div><hr>
		<p class="lead">Universita delgi studi di Pavia</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="118" class="onoffswitch-checkbox" id="118"checked>
        <label class="onoffswitch-label" for="118"></label>
		</div><hr>
		<p class="lead">Universita delgi studi di Perugia</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="119" class="onoffswitch-checkbox" id="119"checked>
        <label class="onoffswitch-label" for="119"></label>
		</div><hr>
		<p class="lead">University of Pisa</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="120" class="onoffswitch-checkbox" id="120"checked>
        <label class="onoffswitch-label" for="120"></label>
		</div><hr>
		<p class="lead">Universita Politecnica Delle Marche</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="121" class="onoffswitch-checkbox" id="121"checked>
        <label class="onoffswitch-label" for="121"></label>
		</div><hr>
		<p class="lead">Universita delgi studi Roma La Sapienza</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="122" class="onoffswitch-checkbox" id="122"checked>
        <label class="onoffswitch-label" for="122"></label>
		</div><hr>
		<p class="lead">Universita delgi studi di Roma Tor Vergata</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="123" class="onoffswitch-checkbox" id="123"checked>
        <label class="onoffswitch-label" for="123"></label>
		</div><hr>
		<p class="lead">Universita Roma Tre</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="124" class="onoffswitch-checkbox" id="124"checked>
        <label class="onoffswitch-label" for="124"></label>
		</div><hr>
		<p class="lead">Universita del Salento</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="125" class="onoffswitch-checkbox" id="125"checked>
        <label class="onoffswitch-label" for="125"></label>
		</div><hr>
		<p class="lead">Universita delgi studi di Siena</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="126" class="onoffswitch-checkbox" id="126"checked>
        <label class="onoffswitch-label" for="126"></label>
		</div><hr>
		<p class="lead">Universita delgi studi di Trento</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="127" class="onoffswitch-checkbox" id="127"checked>
        <label class="onoffswitch-label" for="127"></label>
		</div><hr>
		<p class="lead">Riga International School of Economics and Business Administration RISEBA</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="128" class="onoffswitch-checkbox" id="128"checked>
        <label class="onoffswitch-label" for="128"></label>
		</div><hr>
		<p class="lead">Kaunas University of Technology</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="129" class="onoffswitch-checkbox" id="129"checked>
        <label class="onoffswitch-label" for="129"></label>
		</div><hr>
		<p class="lead">Vilniaus Universitetas</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="130" class="onoffswitch-checkbox" id="130"checked>
        <label class="onoffswitch-label" for="130"></label>
		</div><hr>
		<p class="lead">Vytautas Magnus University</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="131" class="onoffswitch-checkbox" id="131"checked>
        <label class="onoffswitch-label" for="131"></label>
		</div><hr>
		<p class="lead">University of Malta</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="132" class="onoffswitch-checkbox" id="132"checked>
        <label class="onoffswitch-label" for="132"></label>
		</div><hr>
		<p class="lead">Universiteit van Amsterdam</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="133" class="onoffswitch-checkbox" id="133"checked>
        <label class="onoffswitch-label" for="133"></label>
		</div><hr>
		<p class="lead">Rotterdam School of Management</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="134" class="onoffswitch-checkbox" id="134"checked>
        <label class="onoffswitch-label" for="134"></label>
		</div><hr>
		<p class="lead">University of Groningen</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="135" class="onoffswitch-checkbox" id="135"checked>
        <label class="onoffswitch-label" for="135"></label>
		</div><hr>
		<p class="lead">The Hague University of Applied Sciences</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="136" class="onoffswitch-checkbox" id="136"checked>
        <label class="onoffswitch-label" for="136"></label>
		</div><hr>
		<p class="lead">Radboud Universitat Nijmegen</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="137" class="onoffswitch-checkbox" id="137"checked>
        <label class="onoffswitch-label" for="137"></label>
		</div><hr>
		<p class="lead">University of Tilburg</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="138" class="onoffswitch-checkbox" id="139"checked>
        <label class="onoffswitch-label" for="139"></label>
		</div><hr>
		<p class="lead">University of Agder</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="139" class="onoffswitch-checkbox" id="139"checked>
        <label class="onoffswitch-label" for="139"></label>
		</div><hr>
		<p class="lead">The Norwegian School of Economics and Business Administration, Bergen</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="140" class="onoffswitch-checkbox" id="140"checked>
        <label class="onoffswitch-label" for="140"></label>
		</div><hr>
		<p class="lead">Norwegian University of Management - BI</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="141" class="onoffswitch-checkbox" id="141"checked>
        <label class="onoffswitch-label" for="141"></label>
		</div><hr>
		<p class="lead">Norwegian University of Science and Technology (NTNU)</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="142" class="onoffswitch-checkbox" id="142"checked>
        <label class="onoffswitch-label" for="142"></label>
		</div><hr>
		<p class="lead">Crakow University of Economics</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="143" class="onoffswitch-checkbox" id="143"checked>
        <label class="onoffswitch-label" for="143"></label>
		</div><hr>
		<p class="lead">Gdansk University of Technology</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="144" class="onoffswitch-checkbox" id="144"checked>
        <label class="onoffswitch-label" for="144"></label>
		</div><hr>
		<p class="lead">Kozminski University</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="145" class="onoffswitch-checkbox" id="145"checked>
        <label class="onoffswitch-label" for="145"></label>
		</div><hr>
		<p class="lead">Lazarski School of Commerce and Law in Warsaw</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="146" class="onoffswitch-checkbox" id="146"checked>
        <label class="onoffswitch-label" for="146"></label>
		</div><hr>
		<p class="lead">Poznan School of Banking</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="147" class="onoffswitch-checkbox" id="147"checked>
        <label class="onoffswitch-label" for="147"></label>
		</div><hr>
		<p class="lead">The Poznan University of Economics</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="148" class="onoffswitch-checkbox" id="148"checked>
        <label class="onoffswitch-label" for="148"></label>
		</div><hr>
		<p class="lead">Technical University of Lodz</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="149" class="onoffswitch-checkbox" id="149"checked>
        <label class="onoffswitch-label" for="149"></label>
		</div><hr>
		<p class="lead">Warsaw School of Economics</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="150" class="onoffswitch-checkbox" id="150"checked>
        <label class="onoffswitch-label" for="150"></label>
		</div><hr>
		<p class="lead">Universidade Catolica Portuguesa</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="151" class="onoffswitch-checkbox" id="151"checked>
        <label class="onoffswitch-label" for="151"></label>
		</div><hr>
		<p class="lead">Universidade de Coimbra</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="152" class="onoffswitch-checkbox" id="152"checked>
        <label class="onoffswitch-label" for="152"></label>
		</div><hr>
		<p class="lead">ISEG - Instituto Superior de Economia e Gestao</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="153" class="onoffswitch-checkbox" id="153"checked>
        <label class="onoffswitch-label" for="153"></label>
		</div><hr>
		<p class="lead">University of Lisbon</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="154" class="onoffswitch-checkbox" id="154"checked>
        <label class="onoffswitch-label" for="154"></label>
		</div><hr>
		<p class="lead">Universidade do Minho</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="155" class="onoffswitch-checkbox" id="155"checked>
        <label class="onoffswitch-label" for="155"></label>
		</div><hr>
		<p class="lead">Universidade Nova de Lisboa</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="156" class="onoffswitch-checkbox" id="156"checked>
        <label class="onoffswitch-label" for="156"></label>
		</div><hr>
		<p class="lead">University Alexander Cuza Jasi, Romania</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="157" class="onoffswitch-checkbox" id="157"checked>
        <label class="onoffswitch-label" for="157"></label>
		</div><hr>
		<p class="lead">Babes - Bolyai University</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="158" class="onoffswitch-checkbox" id="158"checked>
        <label class="onoffswitch-label" for="158"></label>
		</div><hr>
		<p class="lead">Academia de Studi Economice din Bucuresti</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="159" class="onoffswitch-checkbox" id="159"checked>
        <label class="onoffswitch-label" for="159"></label>
		</div><hr>
		<p class="lead">Comenius University in Bratislava</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="160" class="onoffswitch-checkbox" id="160"checked>
        <label class="onoffswitch-label" for="160"></label>
		</div><hr>
		<p class="lead">Matej Bel University</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="161" class="onoffswitch-checkbox" id="161"checked>
        <label class="onoffswitch-label" for="161"></label>
		</div><hr>
		<p class="lead">Univerza V Mariborou</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="162" class="onoffswitch-checkbox" id="162"checked>
        <label class="onoffswitch-label" for="162"></label>
		</div><hr>
		<p class="lead">Univerza of Primorska</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="163" class="onoffswitch-checkbox" id="163"checked>
        <label class="onoffswitch-label" for="163"></label>
		</div><hr>
		<p class="lead">Universidad Publica de Navarra</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="164" class="onoffswitch-checkbox" id="164"checked>
        <label class="onoffswitch-label" for="164"></label>
		</div><hr>
		<p class="lead">Universidad de Alcad de Henares</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="165" class="onoffswitch-checkbox" id="165"checked>
        <label class="onoffswitch-label" for="165"></label>
		</div><hr>
		<p class="lead">Universidad Autonoma de Barcelona</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="166" class="onoffswitch-checkbox" id="166"checked>
        <label class="onoffswitch-label" for="166"></label>
		</div><hr>
		<p class="lead">Universidad de Barcelona</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="167" class="onoffswitch-checkbox" id="167"checked>
        <label class="onoffswitch-label" for="167"></label>
		</div><hr>
		<p class="lead">Universidad de Cordoba</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="168" class="onoffswitch-checkbox" id="168"checked>
        <label class="onoffswitch-label" for="168"></label>
		</div><hr>
		<p class="lead">Universidad de Deusto</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="169" class="onoffswitch-checkbox" id="169"checked>
        <label class="onoffswitch-label" for="169"></label>
		</div><hr>
		<p class="lead">Universidad de Granada</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="170" class="onoffswitch-checkbox" id="170"checked>
        <label class="onoffswitch-label" for="170"></label>
		</div><hr>
		<p class="lead">Universidad de Navarra</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="171" class="onoffswitch-checkbox" id="171"checked>
        <label class="onoffswitch-label" for="171"></label>
		</div><hr>
		<p class="lead">Universidad de Salamanca</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="172" class="onoffswitch-checkbox" id="172"checked>
        <label class="onoffswitch-label" for="172"></label>
		</div><hr>
		<p class="lead">Universidad de Sevilla</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="173" class="onoffswitch-checkbox" id="173"checked>
        <label class="onoffswitch-label" for="173"></label>
		</div><hr>
		<p class="lead">Universidad de Valencia</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="174" class="onoffswitch-checkbox" id="174"checked>
        <label class="onoffswitch-label" for="174"></label>
		</div><hr>
		<p class="lead">Universidad de Zaragoza</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="175" class="onoffswitch-checkbox" id="175"checked>
        <label class="onoffswitch-label" for="175"></label>
		</div><hr>
		<p class="lead">Universidad Rey Juan Carlos</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="176" class="onoffswitch-checkbox" id="176"checked>
        <label class="onoffswitch-label" for="176"></label>
		</div><hr>
		<p class="lead">Universidad Rovira i Virgili</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="177" class="onoffswitch-checkbox" id="177"checked>
        <label class="onoffswitch-label" for="177"></label>
		</div><hr>
		<p class="lead">Universitat Politecnica de Catalunya</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="178" class="onoffswitch-checkbox" id="178"checked>
        <label class="onoffswitch-label" for="178"></label>
		</div><hr>
		<p class="lead">University of Gothenburg</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="179" class="onoffswitch-checkbox" id="179"checked>
        <label class="onoffswitch-label" for="179"></label>
		</div><hr>
		<p class="lead">Lund University</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="180" class="onoffswitch-checkbox" id="180"checked>
        <label class="onoffswitch-label" for="180"></label>
		</div><hr>
		<p class="lead">University of Skovde</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="181" class="onoffswitch-checkbox" id="181"checked>
        <label class="onoffswitch-label" for="181"></label>
		</div><hr>
		<p class="lead">University of Umea</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="182" class="onoffswitch-checkbox" id="182"checked>
        <label class="onoffswitch-label" for="182"></label>
		</div><hr>
		<p class="lead">Uppsala Universitet</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="183" class="onoffswitch-checkbox" id="183"checked>
        <label class="onoffswitch-label" for="183"></label>
		</div><hr>
		<p class="lead">Linnaeus University</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="184" class="onoffswitch-checkbox" id="184"checked>
        <label class="onoffswitch-label" for="184"></label>
		</div><hr>
		<p class="lead">Orebro University</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="185" class="onoffswitch-checkbox" id="185"checked>
        <label class="onoffswitch-label" for="185"></label>
		</div><hr>
		<p class="lead">Universitat Bern</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="186" class="onoffswitch-checkbox" id="186"checked>
        <label class="onoffswitch-label" for="186"></label>
		</div><hr>
		<p class="lead">Haute Ecole de Gestion de Geneve - University of Applied Sciences</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="187" class="onoffswitch-checkbox" id="187"checked>
        <label class="onoffswitch-label" for="187"></label>
		</div><hr>
		<p class="lead">HTW Chur - Hochschule fur Technik und Wirtschaft - University of Applied Sciences </p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="188" class="onoffswitch-checkbox" id="188"checked>
        <label class="onoffswitch-label" for="188"></label>
		</div><hr>
		<p class="lead">Universite de Lausanne</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="189" class="onoffswitch-checkbox" id="189"checked>
        <label class="onoffswitch-label" for="189"></label>
		</div><hr>
		<p class="lead">FHS St. Gallen, University of Applied Sciences</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="190" class="onoffswitch-checkbox" id="190"checked>
        <label class="onoffswitch-label" for="190"></label>
		</div><hr>
		<p class="lead">ZHAW School of Management and Law</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="191" class="onoffswitch-checkbox" id="191"checked>
        <label class="onoffswitch-label" for="191"></label>
		</div><hr>
		<p class="lead">Brunel University</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="192" class="onoffswitch-checkbox" id="192"checked>
        <label class="onoffswitch-label" for="192"></label>
		</div><hr>
		<p class="lead">University College London</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="193" class="onoffswitch-checkbox" id="193"checked>
        <label class="onoffswitch-label" for="193"></label>
		</div><hr>
		<p class="lead">University of Kent at Canterbury</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="194" class="onoffswitch-checkbox" id="194"checked>
        <label class="onoffswitch-label" for="194"></label>
		</div><hr>
		<p class="lead">London School of Economics and Political Science</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="195" class="onoffswitch-checkbox" id="195"checked>
        <label class="onoffswitch-label" for="195"></label>
		</div><hr>
		<p class="lead">Loughborough University</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="196" class="onoffswitch-checkbox" id="196"checked>
        <label class="onoffswitch-label" for="196"></label>
		</div><hr>
		<p class="lead">University of Sheffield</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="197" class="onoffswitch-checkbox" id="197"checked>
        <label class="onoffswitch-label" for="197"></label>
		</div><hr>
		<p class="lead">University of Strathclyde Business School</p>
        <p><a class="btn btn-sm btn-success" href="#" role="button">Προφίλ πανεπιστημίου</a></p>
		<div class="onoffswitch">
        <input type="checkbox"  name="198" class="onoffswitch-checkbox" id="198"checked>
        <label class="onoffswitch-label" for="198"></label>
		</div><hr>-->
	 </div>
	 
	  </div>
		
      <br>
       
    
      
	  </div>
<br>



         <!-- <a href="the_Profile.jsp" type="submit" class="nav nav-pills" id="demo" style="float:right; margin-bottom:20px;margin-right:210px;" >Aποθήκευση αλλαγών</a> 
          <a href="the_Profile.jsp" class="nav nav-pills" style="float:right;margin-bottom:20px;margin-left:220px;">Απόρριψη αλλαγών</a>-->
        
		  </div>
        
		
		<script type = "text/javascript" src = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.6.1.min.js"></script>
		
	  <div class="container">
      <footer class="footer">
        <p>&copy; ΟΠerΑsmus 2016</p>
      </footer> 

    </div>
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
	
	<%}finally{}%>
  </body>
</html>