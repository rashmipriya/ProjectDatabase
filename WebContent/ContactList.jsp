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
<title>Contact Lawyer</title>
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
Project project = new Project();
String message="";
int requestID=0;
String idString = request.getParameter("requestID");
String action = request.getParameter("action");
String uname =  (String) session.getAttribute("uname");
int id = Integer.parseInt(uname);

if("submit".equals(action))
{
	requestID= Integer.parseInt(idString);
	System.out.println(requestID);
	System.out.println(id);
    message = project.contacts(requestID,id);
   
}%>
<%=message %>
<br>
<br>
<sql:setDataSource var="alerts" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/chinese_wall?useSSL=false"
     user="root"  password="root"/>
 
<sql:query dataSource="${alerts}" var="result">
SELECT * from personnel_members;
</sql:query>
<b>Here is the list of members...please enter the personnel ID of the member you want to contact!!</b>
 <form action="ContactList.jsp">
 Person id: <input name="requestID" class="form-control" required/>
 <button class="btn" name="action" value="submit">Submit
		</button>
 </form>
 <br>
 <br>
<table border="1" width="100%">
<tr>
   <th>Person ID</th>
   <th>Person Name</th>
   <th>Person Designation</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.personnel_id}"/></td>
   <td><c:out value="${row.personnel_name}"/></td>
   <td><c:out value="${row.personnel_designation}"/></td>
   
</tr>
</c:forEach>
</table>
</div>
</div>
</div>
<div class="footer">
	<div class="container">
	&copy; Copyright 2017
</div>
</div>
</body>
</html>