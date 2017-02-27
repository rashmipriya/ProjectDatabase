<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
				    <li><a href="welcome.jsp">Home</a></li>
					<li><a href="addpersonnel.jsp">View Lawyers</a></li>
					<li><a href="addlawyer.jsp">Add Lawyers</a></li>
					<li><a href="caseassignment.jsp">Add Case</a></li>
					<li><a href="alertsToIPO.jsp">Illegal Document Access</a></li>
					<li><a href="contactAlertsIPO.jsp">Illegal Contacts</a></li>
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
<p> Click on link below to view all our lawyers: </p>
					<a href="addpersonnel.jsp">View Lawyers</a>
					<br>
					<br>
<p> Click on link below to add new lawyers: </p>
					<a href="addlawyer.jsp">Add a New Lawyer</a>
					<br>
					<br>
<p> Click on link below to add a new case: </p>
					<a href="caseassignment.jsp">Add a New Case</a>
					<br>
					<br>
<p> Click on link below to see illegal document access by Lawyers: </p>
					<a href="alertsToIPO.jsp">Illegal Document Access</a>
					<br>
					<br>
<p> Click on link below to see illegal contacts made by Lawyers: </p>
					<a href="contactAlertsIPO.jsp">Illegal Contact Requests</a>
</div>
</div>
<div class="footer">
	<div class="container">
	&copy; Copyright 2017
</div>
</div>
</body>
</html>