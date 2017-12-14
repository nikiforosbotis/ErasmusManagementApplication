<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="operasmus.*" %>
<%@ page errorPage="error.jsp" %>

<% String name = request.getParameter("username");
   String password = request.getParameter("password");
   String msg = "";
   int usertype ;
   
   Utility ex = new Utility();
   if(name== "" && password==""){
	  msg += " Ξ”ΞµΞ½ Ξ­Ο‡ΞµΟ„Ξµ ΞµΞΉΟƒΞ¬Ξ³ΞµΞΉ username ΞΊΞ±ΞΉ password";
   } else if (name == "") {
	   msg += "Ξ”ΞµΞ½ Ξ­Ο‡ΞµΟ„Ξµ ΞµΞΉΟƒΞ¬Ξ³ΞµΞΉ username";
   } else if (password == ""){
	   msg += "Ξ”ΞµΞ½ Ξ­Ο‡ΞµΟ„Ξµ ΞµΞΉΟƒΞ¬Ξ³ΞµΞΉ password";
	  
   } 
   if (!(msg == "")){
	   throw new Exception(msg);
   } else {
	  
	   ex.open();
	   ex.validateUser(name, password);
	   usertype = ex.getType(name);
	   ex.close();
   }
   
	   session.setAttribute("username", name);
	  if(usertype == 1) {
	   
    
	   %>
	    <jsp:forward page="the_home_page.jsp" >
		<jsp:param name="username" value = "name" />
		</jsp:forward>
	  <% }else {%>
	<jsp:forward page="Profile_upefthinou.jsp" >
		<jsp:param name="username" value = "name" />
		</jsp:forward><%
} %>
