<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.InputStream, java.io.IOException" %>
<%@ page import="java.util.Properties" %>
<%@ page import="com.database.*" %>


<%
      MotoservicesDAO motoservicesDAO = new MotoservicesDAO();
		String dbUrl = "jdbc:mysql://51.132.137.223:3306/isec_assessment2";
		String dbUser = "isec";
		String dbPassword = "EUHHaYAmtzbv";
		ResultSet pastResultSet = null;
		ResultSet futureResultSet = null;
		
		try {
		    // Load the MySQL JDBC driver
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    
		    // Establish a database connection
		    Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		    pastResultSet = motoservicesDAO.getPastServices("syadeeshani@gmail.com",conn);
			futureResultSet = motoservicesDAO.getFutureServices("syadeeshani@gmail.com",conn);
			
		     
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
			
			}
		
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"  href ="../Styles/reservation.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>MotoService_Reservation</title>

<script type="text/javascript"  src="../JS/moto.js"></script>
</head>

<body>
<div class="past_reservation">
<h1>Past Reservations</h1>
<hr>
<table>
	<tr>
		<th>Booking ID</th>
		<th>Date </th>
		<th>Time</th>
		<th>Location</th>
		<th>Vehicle No</th>
		<th>Mileage</th>
		<th>Message</th>
		<th>Username</th>	
	</tr>
	
	 <%
        
        Date currentDate = new Date();
	          
        if (pastResultSet != null) {
        	
            while (pastResultSet.next()) {
            	
            	Date date = pastResultSet.getDate("date");
            	if(!date.before(currentDate)){
            		 continue;
            	}
                int bookingId = pastResultSet.getInt("booking_id");
                Time time = pastResultSet.getTime("time");
                String location = pastResultSet.getString("location");
                int mileage = pastResultSet.getInt("mileage");
                String vehicleNo = pastResultSet.getString("vehicle_no");
                String message = pastResultSet.getString("message");
                
            
        %>
        <tr>
            <td><%= bookingId %></td>
            <td><%= date %></td>
            <td><%= time %></td>
            <td><%= location %></td>
            <td><%= mileage %></td>
            <td><%= vehicleNo %></td>
            <td><%= message %></td>
        </tr>
        <% 
            }}
            
    %>
</table>
</div>
<br><br>

<div class="future_reservations">
<h1>Future Reservations</h1>
<hr>

<table>
	<tr>
		<th>Booking ID</th>
		<th>Date </th>
		<th>Time</th>
		<th>Location</th>
		<th>Vehicle No</th>
		<th>Mileage</th>
		<th>Message</th>
		<th>Username</th>
		<th>Delete</th>
	</tr>
	
	<% 
        if (futureResultSet != null) {
            while (futureResultSet.next()) {
            	
            	Date date = futureResultSet.getDate("date");
            	
            	if(date.before(currentDate)){
            		 continue;
            	}
                int bookingId = futureResultSet.getInt("booking_id");
                Time time = futureResultSet.getTime("time");
                String location = futureResultSet.getString("location");
                int mileage = futureResultSet.getInt("mileage");
                String vehicleNo = futureResultSet.getString("vehicle_no");
                String message = futureResultSet.getString("message");
                
            
        %>
        <tr>
            <td><%= bookingId %></td>
            <td><%= date %></td>
            <td><%= time %></td>
            <td><%= location %></td>
            <td><%= mileage %></td>
            <td><%= vehicleNo %></td>
            <td><%= message %></td>
            <td><button onclick="document.getElementById('id01').style.display='block';  document.getElementById('bookingID').value = <%= bookingId %>;" class="delete">Delete</button></td>
        </tr>
        <% 
            }}
            
    %>

</table>

</div>

<script type="text/javascript"  src="../js/vehicleservice.js"></script>
</body>
</html>