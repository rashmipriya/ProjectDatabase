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
<p> Click on link below to retrieve any document : </p>
				<a href="DocumentRetrieve.jsp">Retrieve a document</a>
				<br>
				<br>
<p> Click on link below to contact any lawyer: </p>
				<a href="ContactList.jsp">Contact a Lawyer</a>
				<br>
				<br>
</div>
</div>
<div class="footer">
	<div class="container">
	&copy; Copyright 2017
</div>
</div>
</body>
</html>	   