<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="operasmus.Anakoinwsh" %>
<%@ page errorPage="error.jsp" %>

<% 
StringBuffer periexomeno1 = new StringBuffer(request.getParameter("periexomeno"));
StringBuffer link1 = new StringBuffer(request.getParameter("link"));
String periexomeno = periexomeno1.toString();
String link = link1.toString();

if(periexomeno == null) {
	response.sendRedirect("the_home_page.jsp");
}

String username = (String) session.getAttribute("username");
String password = (String) session.getAttribute("password");

try {
	Anakoinwsh anakoinwsh = new Anakoinwsh();
	int total_anak = anakoinwsh.idOfNext();
	anakoinwsh.insertAnakoinwsh(Integer.toString(total_anak), periexomeno, link, username);
} catch(Exception e1) {
	throw new Exception("Exception was thrown while inserting anakoinwsh" + e1.getMessage());
}



%>

<jsp:forward page="Profile_upefthinou.jsp" />

