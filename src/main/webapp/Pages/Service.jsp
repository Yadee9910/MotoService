<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"  href ="../Styles/service.css">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>MotoService_Service</title>

</head>
<%@ include file="Navbar.jsp" %>
<body>
 
<script type="text/javascript"  src="../JS/moto.js"></script>
<div class="service_container">
<h1>Register For Service</h1>
	           
<form class="service_form" method="post" id="serviceform" name="serviceform">	             	              

 <input type="hidden" id="username01" name="username01" value="">
 <br>
 
 
<div class="service_content">
	  <label for="date" class="serv_select">Date *</label>
  	  &emsp;&emsp;&emsp;&emsp;&nbsp;
  	  <input type="date" id="date" name="date" required>
</div>
<br>  

<div class="service_content">
	  <label for="time" class="serv_select">Select a time * </label>
  	  &emsp;
  	  <input type="time" id="time" name="time" required>
</div>
<br>

<div class="service_content">
    <label for ="location" class="serv_select">Location *</label>
    &emsp;&emsp;&nbsp;&nbsp;
	<select class="selectcustom" id="location" name="location" title="Please select a location" required >
				<option selected>Choose...</option>
			    <option value="Colombo">Colombo</option>
				<option value="Gampaha">Gampaha</option>
				<option value="Kalutara">Kalutara</option>
				<option value="Kandy">Kandy</option>
				<option value="Matale">Matale</option>
				<option value="Nuwara Eliya">Nuwara Eliya</option>
				<option value="Galle">Galle</option>
				<option value="Matara">Matara</option>
				<option value="Hambantota">Hambantota</option>
				<option value="Jaffna">Jaffna</option>
				<option value="Kilinochchi">Kilinochchi</option>
				<option value="Mannar">Mannar</option>
				<option value="Vavuniya">Vavuniya</option>
				<option value="Mullaitivu">Mullaitivu</option>
				<option value="Batticaloa">Batticaloa</option>
				<option value="Ampara">Ampara</option>
				<option value="Trincomalee">Trincomalee</option>
				<option value="Kurunegala">Kurunegala</option>
				<option value="Puttalam">Puttalam</option>
				<option value="Anuradhapura">Anuradhapura</option>
				<option value="Polonnaruwa">Polonnaruwa</option>
				<option value="Badulla">Badulla</option>
				<option value="Monaragala">Monaragala</option>
				<option value="Ratnapura">Ratnapura</option>
				<option value="Kegalle">Kegalle</option>
	</select>	                  
</div>				
<br>

<div class="service_content">
	      <label for="vehicle" class="serv_select">Vehicle *</label>
	      &emsp;&emsp;&emsp;
	       <select class="selectcustom" id="vehicle" name="vehicle" title="Please select a vehicle" required >
				<option selected disabled>Choose...</option>
				<option value="AAA-001"> Suzuki-WagonR(2015)</option>
				<option value="ABC-002">Toyota-Prius(2012)</option>
				<option value="FG-034">Suzuki-Alto(2019)</option>
				<option value="QA-004">Dolphin(2011) </option>
				<option value="CAT-005">Honda-Fit(2020) </option>
		   </select>
</div>
<br>

					 
<div class="service_content">
	<label for="mileage" class="serv_select">Mileage *</label>
	&emsp;&emsp;&nbsp;&nbsp;&nbsp;
	<input type="text" class="form-control" name="mileage" id="mileage"  placeholder="Total mileage" required>
</div>
<br>
	                	            
<div class="service_content">
	       <label for="message" class="serv_select">Message *</label>
	       &emsp;&emsp; &nbsp;
	       <textarea class="form-control" name="message" rows="3" cols="20" id="message" placeholder="Your message" required></textarea>
</div>
<br>
		
<div class="service_content01">
	         <input type="submit" value="Submit" id="submit" name="submit" class="service_submit">
	         <span class="submitting"></span>
</div>
	              
</form>
	

</div>

	
</body>
</html>