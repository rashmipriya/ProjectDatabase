<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs505.databases.*" import ="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adding a Case </title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>
<body>
<div class="container">
<div class="header">
<form action="Logout" align="right" width="48" height="48">
  Welcome ${uname}  <input type= "submit" value="Logout">
</form>
<center><h2> Kudos on a new case! </h2>
<h3> You can use the screen to assign a lawyer for your new case. </h3>
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
   	 	Project project = new Project();
		String message="";
		String lawyeridString = request.getParameter("lawyer_id");
		String lawyername = request.getParameter("lawyer_name");
		String casestartdate = request.getParameter("Case_start_date");
		String caseenddate = null;
		String representedorg = request.getParameter("Represented_organization");
		String opponentorg = request.getParameter("Opponent_organization");
		String action = request.getParameter("action");
		
		if("create".equals(action)){
			int lawyerid= Integer.parseInt(lawyeridString);
		    Cases addtheselectedcase = new Cases(lawyerid, lawyername, casestartdate, caseenddate, representedorg, opponentorg);
			message = project.validation(addtheselectedcase);
			System.out.println(message);
		}
%>
<div class="alert alert-info">
  <strong>Info!</strong> <%=message %> </div>
  <a href="caseassignment.jsp">Return</a>
</div>
</div>
	<div class="footer">
			<div class="container">
				&copy; Copyright 2017
			</div>
</div>
</div>
</body>
</html>