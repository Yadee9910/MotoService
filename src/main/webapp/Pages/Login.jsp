<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"  href ="../Styles/login.css">
<title>MotoService_Login</title>
</head>
<body>

<div class ="login-center">
<div class="login-container">
	<h1><span>Moto</span>Service</h1>
	<img class="login_img" src="../Images/MotoLogo.jpg">
 	<p class="login_p1">Login into your Account</p>
 
 	<button class="login_btn" type="button" 
 	onclick ="window.location.href ='https://api.asgardeo.io/t/motoservice/oauth2/authorize?scope=openid%20address%20email%20phone%20profile&response_type=code&redirect_uri=http://localhost:8080/MotoService_VehicleReservation/Authorize.jsp&client_id=3AKTbfxHDmCuPCBjH7PdOQlKQrMa&login_hint=syadeeshani@gmail.com'">SIGN IN</button>
 	
 	<p class="login_p1"> Don't have an Account?</p>
 	<button class="signup" type="button" onclick="window.location.href ='https://console.asgardeo.io/'" >CREATE</button>

</div>
 	
</div>
</body>
</html>
     