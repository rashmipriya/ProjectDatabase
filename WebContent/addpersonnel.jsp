<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs505.databases.*" import ="java.util.*"%>
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
<center><h2> Rashmi Law firm </h2>
<h3> Our list of Eminent Lawyers </h3>
</center>
</div>
		<div class="nav-bar">
			<div class="container">
				<ul class="nav">
				    <li><a href="welcome.jsp">Home</a></li>
					<li><a href="addpersonnel.jsp">View Lawyers</a></li>
					<li><a href="addlawyer.jsp">Add Lawyers</a></li>
					<li><a href="caseassignment.jsp">Add a New Case</a></li>
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
<%
	Project project = new Project();
	List<Personnel> personnels = project.selectfrompersonnel();
%>
<table> 
	<tr>
		<th align="left" width="35%"> LAWYER ID</th>
		<th align="left" width="35%"> LAWYER NAME </th>
		<th align="left" width="35%"> DESIGNATION </th>
	</tr>
		<tr>
			<td></td>
		</tr>
	<% 
		for(Personnel person:personnels) {
	 %>
	<tr>
     	<td><%= person.getId() %> </td>
     	<td><%= person.getName() %> </td>
     	<td><%= person.getDesignation() %> </td>
	</tr>
<%
		}
%>
</table>
</form>
</div>
</div>
	<div class="footer">
			<div class="container">
				&copy; Copyright 2017
			</div>
</div>
</body>
</html>