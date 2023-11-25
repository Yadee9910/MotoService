<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.FileInputStream, java.io.IOException, java.util.Properties" %>
<%@ page import="java.io.InputStream, java.io.IOException" %>

<% // Initialize a Properties object
Properties properties = new Properties();

//Load the properties file
try {
	 InputStream inputStream = application.getResourceAsStream("/WEB-INF/application.properties");
	 properties.load(inputStream);
	} catch (IOException e) {
	    e.printStackTrace();
	} 
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript"  src="../JS/moto.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"  href ="../Styles/home.css">
<title>MotoService_Home</title>
</head>

<body>
<%@ include file="Navbar.jsp" %>


	
<div class="home_container">
<img class="homebg" src="../Images/homebg07.avif">

<div class="home_text">
<h1>Welcome All! </h1>
<h3>To our official</h3>
<p>Vehicle service Reservation Website</p>
<span>MotoService</span>
</div>
</div>

</body>
</html>