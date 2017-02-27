<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs505.databases.*" import ="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add lawyers</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>
<body>
<div class="container">
<div class="header">
<form action="Logout" align="right" width="48" height="48">
  Welcome ${uname}  <input type= "submit" value="Logout">
</form>
<center><h2> Rashmi Law firm </h2>
<h3> You can use the screen to add a new Lawyer </h3>
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
		String personnelidString = request.getParameter("personnel_id");
		System.out.println(personnelidString);
		String personnelname = request.getParameter("personnel_name");
		System.out.println(personnelname);
		String personneldesignation = request.getParameter("personnel_designation");
		System.out.println(personneldesignation);
		String dateofbirth = request.getParameter("date_of_birth");
		String ssnString = request.getParameter("social_security_number");
		String phonenumberString = request.getParameter("phone_number");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		System.out.println(city);
		String country = request.getParameter("country");
		System.out.println(country);
		String action = request.getParameter("action");
		
		if("create".equals(action)){
			int personnelid= Integer.parseInt(personnelidString);
			int ssn = Integer.parseInt(ssnString);
			int phonenumber = Integer.parseInt(phonenumberString);
		    Personnel person = new Personnel(personnelid, personnelname, personneldesignation, dateofbirth, ssn, phonenumber, address, city, country);
			project.create(person);
		}
		
%>
	   
<form action="addlawyer.jsp">
<b>Please add the following details to add a new lawyer's details:</b>
<br>
<br>
<table style="width:80%" cellspacing="10" cellpadding="50">
<tr><th>Lawyer ID:</th> <td><input name="personnel_id" class="form-control" /></td></tr>
<tr><th>Lawyer Name:</th> <td><input name="personnel_name" class="form-control" /></td></tr>
<tr><th>Lawyer Designation:</th><td><input name="personnel_designation" class="form-control" /></td></tr>
<tr><th>Date of Birth:</th><td><input name="date_of_birth" class="form-control" type="date"/></td></tr>
<tr><th>Social Security Number:</th><td><input name="social_security_number" class="form-control"/></td>
<tr><th>Phone Number:</th><td><input name="phone_number" class="form-control"/></td> 
<tr><th>Address:</th><td><input name="address" class="form-control"/></td>
<tr><th>City:</th><td><input name="city" class="form-control"/></td>	
<tr><th>Country:</th><td><input name="country" class="form-control"/></td>
</tr>
<tr> </tr>
<tr> </tr>
<tr> </tr>
<tr> </tr>
<tr> </tr>
<tr>
		<td><button class="btn" name="action" value="create">
		 	Add
		</button>
  		<button class="btn"> Reset </button></td>
</tr>
</table>
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