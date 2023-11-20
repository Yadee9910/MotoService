<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.io.InputStream, java.io.IOException" %>
<%@ page import="java.util.Properties" %>
<%@ page import="com.database.*" %>


<%
      MotoservicesDAO motoservicesDAO = new MotoservicesDAO();
		String dbUrl = "jdbc:mysql://172.187.178.153:3306/isec_assessment2";
		String dbUser = "isec";
		String dbPassword = "EUHHaYAmtzbv";
		ResultSet pastResultSet = null;
		ResultSet futureResultSet = null;
		
		
		try {
		    // Load the MySQL JDBC driver
		    Class.forName("com.mysql.cj.jdbc.Driver");
		    
		    // Establish a database connection
		    Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		    //pastResultSet = motoservicesDAO.getPastServices("syadeeshani@gmail.com",conn);
			//futureResultSet = motoservicesDAO.getFutureServices("syadeeshani@gmail.com",conn);
			
		    if (request.getParameter("pastRes") != null){
		    	
		    	 String userName = request.getParameter("usernameForStore1");
		    	 System.out.println("Hello");
		    	 System.out.println(userName);
		    	 pastResultSet =motoservicesDAO.getPastServices(userName);
		    	
		    	
		    }
		    if (request.getParameter("futureRes") != null){
		    	
		    	 String userName = request.getParameter("usernameForStore2");
		    	 System.out.println("Hello");
		    	 System.out.println(userName);
		    	 futureResultSet =motoservicesDAO.getFutureServices(userName);
		    	
		    	
		    }
		    
		   /* if (request.getParameter("delete") != null){
		    	
		    	String bookingId = request.getParameter("bookingID");
		    	
		    	int id = Integer.parseInt(bookingId);
		    	//System.out.println("Hello");
		    	//out.println(bookingId);
		    	//delete the row
		    	int rowsAffected = motoservicesDAO.deleteServices(id);
		    	
		    	if (rowsAffected > 0) {
		    		//refresh the site  
		    		 response.sendRedirect(request.getRequestURI());
			         
			    }else if(rowsAffected == -1){
			    	out.println("Error in the databse. Try again later");
			    } else {
			        out.println("No data found for the given booking ID");
			    }
		    	
		    	
		    } */
		    
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

<%@ include file="Navbar.jsp" %>

				<!--  <div class="reservation_form">
				<form class="form_reservation" method="post" id="resv_form" action="?showPast=true" onclick="document.getElementById('past').style.display='block'">
				<input type="hidden" id="usernameForStore2" name="usernameForStore2" value="" >
							              
				<input type="submit" class="res" id="pastRes" name= "pastRes" value="Past Reservation" >
				</form>
				
				<br>
					<form class="form_reservation" method="post" id="resv_form" action="?showFuture=true" onclick="document.getElementById('future').style.display='block'"  >
					
						<input type="hidden" id="usernameForStore3" name="usernameForStore3" value="" >
							              
						<input type="submit" class="res" id="futureRes" name="futureRes" value= "Future Reservation" >
					</form>
				</div>
				-->

<div class="reservation_form">
	<form class="past_reserv" method="post" id="resv_form" onclick="document.getElementById('past_reservation').style.display='block'"  >
	<input type="hidden" id="usernameForStore1" name="usernameForStore1" value="" >
    <input type="submit" class="res" id="pastRes" name="pastRes" value = "Past Reservation">
    </form>

    <br>
	<form class="future_reserv" method="post" id="resv_form" onclick="document.getElementById('future_reservation').style.display='block'"  >
	<input type="hidden" id="usernameForStore2" name="usernameForStore2" value="" >
    <input type="submit" class="res" id="futureRes" name="futureRes" value="Future Reservation">
    </form>
</div>



<br><br>


<div id="past_reservation" class = "past_reservation">
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

<div id="future_reservation" class="future_reservation">
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
		<th>Delete</th>
	</tr>
	 
	<% 
	  Date currentDate1 = new Date();
        if (futureResultSet != null) {
            while (futureResultSet.next()) {
            	
            	Date date = futureResultSet.getDate("date");
            	
            	if(date.before(currentDate1)){
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
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Getting data from localStorage
        var username = localStorage.getItem('username');
        console.log('Value retrieved: ' + username);

        document.getElementById('pastRes').addEventListener('click', function () {
            //console.log("Hello world");
            document.getElementById('usernameForStore1').value = username;
        });
        document.getElementById('futureRes').addEventListener('click', function () {
           // console.log("Hello world");
            document.getElementById('usernameForStore2').value = username;
        });
    });
</script>
<script type="text/javascript"  src="../js/vehicleservice.js"></script>
</body>
</html>