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
<%!
private String onoma = null;
private String epwnumo = null;
private String name = null;
%>
<%
Utility ut = new Utility();
Panepistimio panepistimio = new Panepistimio();
List<String> all = new ArrayList<String>();
Foititis foititis = new Foititis(); 
try{

	all = panepistimio.getAithseis();

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

    <title>ΟΠerΑsmus-Αιίτηση Φοιτητή</title>

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
<% request.setCharacterEncoding("ISO-8859-7"); 
			String username = (String)session.getAttribute("username");
			if(username == null){
				%>
					<jsp:forward page="LoginOperasmus.jsp"/>
				<%
			}
			%>
    <div class="container">
      <div class="header clearfix"style="width:100%">
        <div class="dev">
		<img src="images/logo.jpg" alt="ΟΠerΑsmus Logo" style="width:500px;height:150px;float:left;"></div>
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" ><a href="Profile_upefthinou.jsp">Home</a></li>
          </ul>
        </nav>
        
      </div>
	  
		<div id="content">
		
		
		
		
      <div class="col-md-3">
      <ul class="nav nav-pills nav-stacked">
        
				<li><a href="olokliromenes.jsp">Αιτήσεις</a></li>
				<li><a href="anakinosis.jsp">Ανακοινώσεις</a></li>
				<li><a href="control_comments.jsp">Διαχείριση Σχολίων</a></li>	
      <br>
	  <br>
	  <br>
		
      </ul>
    </div>
    <div class="clearfix visible-lg"></div>
	
  </div>
  <div class="jumbotron" style="text-align: left">
  <br>
  <h2 class="sub-header">Αιτήσεις Φοιτητών</h2>
  <br>
  <hr>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Αριθμός</th>
				  <th>ΑΜ</th>
                  <th>Όνομα</th>
                  <th>Επώνυμο</th>
                  <th>Αίτηση</th>
                  
                </tr>
              </thead>
              <tbody>
                <tr>
				<% int k = 0;
					int i = 0;
				while(i<all.size()){
					k++;
					if((i+1 < all.size()) && (i+2 < all.size())){
						onoma = all.get(i);
						epwnumo = all.get(i+1);
						name = all.get(i+2);%>
					
				
                  <td><%=k%></td>
				  <td><%=name%></td>
                  <td><%=onoma%></td>
                  <td><%=epwnumo%></td>
                  <td><a href="olokliromenes.jsp?name=<%=name%>">link</a></td>
					<%}%>
                </tr>
                <% i = i + 3;
				}%>
              </tbody>
            </table>
          </div>

	</div>
	<%} finally{}%>
	
	  <footer class="footer">
        <p>&copy; ΟΠerΑsmus 2016</p>
      </footer>

    </div> <!-- /container -->
      </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>