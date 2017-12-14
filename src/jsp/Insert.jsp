<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="error.jsp" %>
<%@ page import="operasmus.*" %>

<% String fname = request.getParameter("name");
String lname = request.getParameter("surname");
String dep = request.getParameter("dep");
String phone = request.getParameter("phone");
String am = request.getParameter("am");
String email = request.getParameter("email");
String password = request.getParameter("password");
String cpassword = request.getParameter("cpassword");
String photo = request.getParameter("pic");


try{
if (!password.equals(cpassword) ){
	throw new Exception("the field password and confirm password are not the same");
}
User user = new User(fname, lname, dep, phone, am, email, password, photo);
Utility data = new Utility();
data.open();
int apadisi = data.registerUser(user);

data.close();
if (apadisi <= 0){
throw new Exception ("kati ginetai");
	
}%>
<jsp:forward page="the_home_page.jsp">
<jsp:param name ="username" value=" <%=am%>"/>
</jsp:forward>
<%
}catch(Exception e) {
	String s =e.getMessage(); 
	throw new Exception (s);
}
	 %>

