<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page isErrorPage="true" %>

<html>
<body>

<div class='container theme-showcase' role='main'>

	<div class='page-header'>
		<h1 class='text-danger'>Σφάλμα</h1>
	</div>
			<% 
				Class exClass = exception.getClass();  
				String exMessage = exception.getMessage();
			%>
			<div class="row">
				<div class="col-lg-12">
				<div role="alert" class="alert alert-danger"><%=exception.getMessage()%></div>				
					
				</div>		
	</div> 
			
</div>

</body>
</html>
