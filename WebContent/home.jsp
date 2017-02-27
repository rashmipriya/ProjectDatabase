<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs505.databases.*" import ="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="styles.css" type="text/css">
</head>
<body>
<div class="container">
<div class="header">
<center><h2> Welcome to Rashmi Law Firm </h2>
<h3> We promise to provide justice</h3>
</center>
</div>
<div class="nav-bar" style="text-align: right">
		<div class="container">
			<ul class="nav">
			<li><a href="contactus.jsp">Contact Us</a></li>
		</ul>
	</div>
</div>
<div class="content">
<div class="main">

<p> Rashmi & Kshitija Law Firm was established in 2000 with the motivation to provide justice to all innocent citizens. 
	   This portal is for internal purposes only. Please do not share the links outside the organization as it will
	   breach the security of our clients.</p>

<p>${message}</p>

<form action="Login" align="right" width="48" height="48">
 			Username: <input type="text" name="username" class="form-control" />
 			<br>
 			<br>
 	        Password: <input type ="password" name="password" class="form-control"/>
 	        <br>
 	        <br>
	        <input type="submit" value="login" width="150">
	        <br>
	        <br>
	        Do not have log in credentials: <input type="submit" value="Request IPO">

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
