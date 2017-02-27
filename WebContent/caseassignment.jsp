<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs505.databases.*" import ="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assignment of cases</title>
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
<form action="addingcaseresult.jsp">
<b>Please select lawyer id, name, case start date, organization that the firm will be representing and the oponent to add a new case: </b>
<br>
<br>
<table style="width:80%" cellspacing="10" cellpadding="50">
<tr><th>Lawyer ID:</th><td><input name="lawyer_id" class="form-control" /></td></tr>
<tr><th>Lawyer Name:</th><td><input name="lawyer_name" class="form-control" /></td></tr>
<tr><th>Case Start Date:</th><td><input name="Case_start_date" class="form-control" type="date" min="2017-01-02" /></td></tr>
<tr><th>Represented Organization:</th><td><input name="Represented_organization" class="form-control"/></td></tr>
<tr><th>Opponent Organization:</th><td><input name="Opponent_organization" class="form-control"/></td>
</tr>
<tr> </tr>
<tr> </tr>
<tr> </tr>
<tr> </tr>
<tr> </tr>
<tr><td><button class="btn" name="action" value="create">Add</button>
</table><input name="reset" type="reset"/>
</form>
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