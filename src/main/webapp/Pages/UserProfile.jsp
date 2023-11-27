<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.FileInputStream, java.io.IOException, java.util.Properties" %>
<%@ page import="java.io.InputStream, java.io.IOException" %>

<%
		// Initialize a Properties object
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet"  href ="../Styles/user.css">
    <title>MotoService_UserProfile</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript"  src="../JS/moto.js"></script>
    
	  <script>	     
	        const redirectUri = window.location.origin + '/MotoService_VehicleReservation/Login.jsp';
	
	        function logoutAndRedirect() {
	            // Set the post_logout_redirect_uri dynamically
	            document.getElementById('redirect_uri').value = redirectUri;
	
	            // Submit the form
	            document.getElementById('logout-form').submit();
	        }
	  </script>
</head>

<body>
    <%@ include file="Navbar.jsp" %>

	    <div class="profile_img">
	        <i class="fas fa-user-circle"></i>
	        <span class="prof_name" id = 'name'></span>
	    </div>

  		<div class="profile_container">
		  <ul>			      
			    <li><span class="profli">First Name&emsp;&nbsp;: </span><span class="prof_li" id="given_name"></span></li>
			    <li><span class="profli">Last Name&emsp;&nbsp; : </span><span class="prof_li" id="family_name"></span></li>
			    <li><span class="profli">User Name&emsp;&nbsp; : </span><span class="prof_li" id="username"></span></li>
			    <li><span class="profli">Email &emsp;&emsp; &emsp; : </span><span class="prof_li" id="email"></span></li>
			    <li><span class="profli">Country &emsp;&emsp; : </span><span class="prof_li" id="address"></span></li>
			    <li><span class="profli">Contact&emsp; &emsp;&nbsp; : </span><span class="prof_li" id="phone"></span></li>		
		  </ul>
		    
			<div class="logout">
			    <form id="logout-form" action='<%= properties.getProperty("logoutURL") %>'method="POST">
			        <input type="hidden" name="client_id" id="client_id" value="">		       
			        <input type="hidden" name="post_logout_redirect_uri" id="redirect_uri" value="">
			        <input type="hidden" name="state" value="">
			        <!-- Use JavaScript to set the post_logout_redirect_uri value and log it -->
			        <button type="submit" class="logout_btn" onclick="logoutAndRedirect()">Logout</button>
			    </form>     
			</div>
  	    </div>
</body>

</html>
