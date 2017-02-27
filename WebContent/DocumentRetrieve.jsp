<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs505.databases.*" import ="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Retrieve Document</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>
<body>
<div class="container">
<div class="header">
<form action="Logout" align="right" width="48" height="48">
  Welcome ${uname}  <input type= "submit" value="Logout">
</form>
<center><h2> Rashmi Law Firm </h2>
</center>
</div>
		<div class="nav-bar">
			<div class="container">
				<ul class="nav">
				<li><a href="welcomelawyers.jsp">Home</a></li>
				<li><a href="DocumentRetrieve.jsp">Request Document</a></li>
				<li><a href="ContactList.jsp">Contact Lawyers</a></li>
				</ul>
			</div>
		</div>
	   <div class="content">
	   <div class="main">
<%
if(session.getAttribute("uname")==null){
	response.sendRedirect("home.jsp");
}
%>
<h4>Retrieve Document</h4>
<%
Project project = new Project();
String message="";
int id=0;
int case_id=0;
String idString = request.getParameter("id");
String caseId = request.getParameter("caseId");
String action = request.getParameter("action");
if("submit".equals(action))
{
	id= Integer.parseInt(idString);
	case_id= Integer.parseInt(caseId);
    message = project.retrieve(id, case_id);
   
}%>


<form action="DocumentRetrieve.jsp">
<table  class="table" style="width:80%" cellspacing="10" cellpadding="50">
 	<tr>
 		<th>Person id:</th><td><input name="id" class="form-control" required/></td><tr>
 	    <tr><th>Case id:</th><td> <input name="caseId" class="form-control" required/></td></tr>
		<tr><td><button class="btn" name="action" value="submit">
		 	Retrieve
		</button></td>
 	</tr>
</table>
</form>
<br>
<br>
<h4>Requested Document:</h4>
<%=message %>
</div>
</div>
<div class="footer">
	<div class="container">
	&copy; Copyright 2017
</div>
</div>
</body>
</html>