<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="cs505.databases.*" import ="java.util.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alerts</title>
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

<sql:setDataSource var="alerts" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/chinese_wall?useSSL=false"
     user="root"  password="root"/>
<sql:query dataSource="${alerts}" var="result">
SELECT * from alerts;
</sql:query>
<b>Here is the list of person IDs with the case IDs of which they tried to access the document illegally!!</b>
<br>
<br>
<br>
<table border="1" width="100%">
<tr>
   <th>Person ID</th>
   <th>Case ID</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.personnel_id}"/></td>
   <td><c:out value="${row.case_id}"/></td>
</tr>
</c:forEach>
</table>
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